local SPH = SamisPotionHelperAddon
local SAMID = SamiDebug

local function isFoodOrDrink(itemType)
  return itemType == ITEMTYPE_FOOD or itemType == ITEMTYPE_DRINK
end

local function iterateThroughEntireBag()
  SAMID:Print("Iterating through entire bag to find potions...")
  local bagId = BAG_BACKPACK
  local slotIndex = ZO_GetNextBagSlotIndex(bagId, 0)
  local shouldFilterFood = SPH.savedVariables and SPH.savedVariables.filterFood
  local shouldFilterPoisons = SPH.savedVariables and SPH.savedVariables.filterPoisons

  while slotIndex do
    local itemLink = GetItemLink(bagId, slotIndex, 1)

    if itemLink then
      local isCrafted = IsItemLinkCrafted(itemLink)
      local isSellable = SPH.utils.isSellable(bagId, slotIndex)
      local itemType = itemLink and GetItemLinkItemType(itemLink)

      if (shouldFilterFood and isFoodOrDrink(itemType)) or itemType == ITEMTYPE_POTION or (shouldFilterPoisons and itemType == ITEMTYPE_POISON) then
        if not isCrafted and isSellable then
          SAMID:Print("Marking non-crafted food or potion as junk: " .. itemLink)
          SetItemIsJunk(bagId, slotIndex, true)
        end
      end
    end

    slotIndex = ZO_GetNextBagSlotIndex(bagId, slotIndex)
  end

  SAMID:Print("Finished iterating through bag.")
end

function SPH.OnInventoryStateChange(oldState, newState)
  if newState == SCENE_SHOWING then
    iterateThroughEntireBag()
  end
end

function SPH.Initialize()
  SPH.savedVariables = ZO_SavedVars:NewAccountWide("SamisPotionHelperSavedVariables", 1, nil, {
    enableDebug = false,
    filterFood = true,
    filterPoisons = true,
  })

  SAMID:Print("Initializing Samis Potion Helper...")

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
