local SPH = SamisPotionHelperAddon

SPH.utils = {}

local inventoryItemLinkCache = {
  [BAG_BACKPACK] = {
    potions = {},
  },
  [BAG_SUBSCRIBER_BANK] = {
    perfectRoe = {},
  },
}

function SPH.utils.cacheItemLink(bagId, slotIndex, itemLink)
  if bagId == BAG_BACKPACK then
    local itemType = GetItemLinkItemType(itemLink)

    if itemType == ITEMTYPE_POTION then
      inventoryItemLinkCache[BAG_BACKPACK].potions[slotIndex] = itemLink
    end
  elseif bagId == BAG_SUBSCRIBER_BANK then
    local itemId = GetItemLinkItemId(itemLink)

    if itemId == SPH.constants.perfectRoeItemId then
      inventoryItemLinkCache[BAG_SUBSCRIBER_BANK].perfectRoe[slotIndex] = itemLink
    end
  end
end

function SPH.utils.isSellable(bagId, slotIndex)
  local icon, stack, sellPrice, meetsUsageRequirement, locked, equipType, itemStyleId, quality = GetItemInfo(bagId,
    slotIndex)

  return sellPrice > 0 and not locked
end

function SPH.utils.cachePotions(potions)
  inventoryItemLinkCache[BAG_BACKPACK].potions = potions
end

-- Function to get potion item link from cache based on slotIndex
function SPH.utils.getCachedPotionItemLink(slotIndex)
  return inventoryItemLinkCache[BAG_BACKPACK].potions[slotIndex]
end

-- Function to get perfect roe item link from cache based on slotIndex
function SPH.utils.getCachedPerfectRoeItemLink(slotIndex)
  return inventoryItemLinkCache[BAG_SUBSCRIBER_BANK].perfectRoe[slotIndex]
end

function SPH.utils.isCrafted(bagId, slotIndex)
  return GetItemCreatorName(bagId, slotIndex) ~= ""
end

function SPH.utils.getEffectMaskFromLink(itemLink)
  if not itemLink then
    return nil
  end

  local data = itemLink:match("|H.:item:(.-)|h.-|h")
  local mask = select(21, zo_strsplit(':', data))
  return tonumber(mask) or 0
end
