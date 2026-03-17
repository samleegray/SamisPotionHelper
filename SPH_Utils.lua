local SPH = SamisPotionHelperAddon

SPH.utils = {}

function SPH.utils.isSellable(bagId, slotIndex)
  local icon, stack, sellPrice, meetsUsageRequirement, locked, equipType, itemStyleId, quality = GetItemInfo(bagId,
    slotIndex)

  return sellPrice > 0 and not locked
end

function SPH.utils.getEffectMaskFromLink(itemLink)
  if not itemLink then
    return nil
  end

  local data = itemLink:match("|H.:item:(.-)|h.-|h")
  local mask = select(21, zo_strsplit(':', data))
  return tonumber(mask) or 0
end
