SamisPotionHelperAddon = SamisPotionHelperAddon or {}

local SPH = SamisPotionHelperAddon

SPH.name = "SamisPotionHelper"
SPH.displayName = "Sami's Potion Helper"
SPH.version = "1.1.1"
SPH.author = "samihaize"

SPH.savedVariableDefaults = {
  enableDebug = false,
  filterFood = true,
  filterPoisons = true,
  filterMerchantItems = true,
  sellAlliancePotions = false,
  autoSellTrash = false,
  customFilterText = "",
  markedTrashItems = {},
}
