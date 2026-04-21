SamisPotionHelperAddon = SamisPotionHelperAddon or {}

local SPH = SamisPotionHelperAddon

SPH.name = "SamisPotionHelper"
SPH.displayName = "Sami's Potion Helper"
SPH.version = "1.3.1"
SPH.styledAuthor = "|cf500e2s|r|ceb00e5a|r|ce100e9m|r|cd700edi|r|cce00f0h|r|cc400f4a|r|cba00f8i|r|cb000fbz|r|ca600ffe|r"
SPH.author = "samihaize"

SPH.savedVariableDefaults = {
  enableDebug = false,
  filterFood = true,
  filterPoisons = true,
  filterMerchantItems = true,
  flagStolenItemsAsTrash = false,
  sellAlliancePotions = false,
  autoSellTrash = false,
  customFilterText = "",
  markedTrashItems = {},
}
