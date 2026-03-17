local SPH = SamisPotionHelperAddon

SPH.utils = {
  filteredItemTypes = {
    [ITEMTYPE_FOOD] = true,
    [ITEMTYPE_DRINK] = true,
    [ITEMTYPE_POTION] = true,
    [ITEMTYPE_POISON] = true,
    [ITEMTYPE_TRASH] = true,
  }
}

function SPH.utils.syncSavedVarsToUtils()
  if not SPH.savedVariables then return end

  SPH.utils.filteredItemTypes[ITEMTYPE_FOOD] = SPH.savedVariables.filterFood
  SPH.utils.filteredItemTypes[ITEMTYPE_DRINK] = SPH.savedVariables.filterFood
  SPH.utils.filteredItemTypes[ITEMTYPE_POISON] = SPH.savedVariables.filterPoisons
  SPH.utils.filteredItemTypes[ITEMTYPE_TRASH] = SPH.savedVariables.filterMerchantItems
end

function SPH.utils.getItemTotalSellPrice(bagId, slotIndex)
  local icon, stack, sellPrice, meetsUsageRequirement, locked, equipType, itemStyleId, quality = GetItemInfo(bagId,
    slotIndex)
  if locked then return 0 end
  return stack * sellPrice
end

function SPH.utils.isSellable(bagId, slotIndex)
  local icon, stack, sellPrice, meetsUsageRequirement, locked, equipType, itemStyleId, quality = GetItemInfo(bagId,
    slotIndex)

  return sellPrice > 0 and not locked
end

function SPH.utils.shouldFlagAsJunk(bagId, slotIndex)
  if not SPH.utils.isSellable(bagId, slotIndex) then
    return false
  end

  local itemLink = GetItemLink(bagId, slotIndex, 1)
  if not itemLink then
    return false
  end

  local isCrafted = IsItemLinkCrafted(itemLink)

  if isCrafted then
    return false
  end

  local itemType = GetItemLinkItemType(itemLink)

  if SPH.utils.filteredItemTypes[itemType] then
    return true
  end

  local filterMerchantItems = SPH.savedVariables and SPH.savedVariables.filterMerchantItems
  if filterMerchantItems and IsItemLinkPrioritySell(itemLink) then
    return true
  end

  return false
end
