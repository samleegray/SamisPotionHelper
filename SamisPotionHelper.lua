local SPH = SamisPotionHelperAddon
local SAMID = SamiDebug

local function iterateThroughEntireBag()
  SAMID:Print("Iterating through entire bag to find potions...")
  local bagId = BAG_BACKPACK
  local slotIndex = ZO_GetNextBagSlotIndex(bagId, 0)
  local newLinks = {}

  while slotIndex do
    slotIndex = ZO_GetNextBagSlotIndex(bagId, slotIndex)

    local itemLink = GetItemLink(bagId, slotIndex, 1)
    if itemLink and GetItemLinkItemType(itemLink) == ITEMTYPE_POTION then
      SAMID:Print("Found potion in bag: " .. itemLink)
      if SPH.utils.isCrafted(bagId, slotIndex) then
        SAMID:Print("Caching crafted potion: " .. itemLink)
        newLinks[slotIndex] = itemLink
      elseif SPH.utils.isSellable(bagId, slotIndex) then
        SAMID:Print("Marking non-crafted potion as junk: " .. itemLink)
        SetItemIsJunk(bagId, slotIndex, true)
      end
    end
  end

  SAMID:Print("Finished iterating through bag. Caching potions: " .. tostring(newLinks))
  SPH.utils.cachePotions(newLinks)
end

function SPH.OnInventoryStateChange(oldState, newState)
  if newState == SCENE_SHOWING then
    iterateThroughEntireBag()
  end
end

function SPH.Initialize()
  SAMID:Print("Initializing Samis Potion Helper...")

  SPH.savedVariables = ZO_SavedVars:NewAccountWide("SamisPotionHelperSavedVariables", 1, nil, {
    enableDebug = false,
  })

  SPH.InitializeSettings()
end

function SPH.OnAddOnLoaded(_, addonName)
  if addonName ~= SPH.name then
    return
  end

  SPH.Initialize()

  EVENT_MANAGER:UnregisterForEvent(SPH.name, EVENT_ADD_ON_LOADED)
  SCENE_MANAGER:GetScene("inventory"):RegisterCallback("StateChange", SPH.OnInventoryStateChange)
end

EVENT_MANAGER:RegisterForEvent(SPH.name, EVENT_ADD_ON_LOADED, SPH.OnAddOnLoaded)
