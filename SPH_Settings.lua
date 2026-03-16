local SPH = SamisPotionHelperAddon
local LAM2 = LibAddonMenu2

function SPH.InitializeSettings()
  local panelData = {
    type = "panel",
    name = SPH.name,
    displayName = SPH.displayName,
    author = SPH.author,
    version = SPH.version,
    registerForRefresh = true,
    registerForDefaults = true,
  }

  local optionsPanel = LAM2:RegisterAddonPanel(SPH.name .. "Options", panelData)

  local optionsData = {
    {
      type = "description",
      text = "Configure the settings for Samis Potion Helper.",
    },
    {
      type = "checkbox",
      name = "Enable Debug",
      tooltip = "Toggle debug messages.",
      getFunc = function() return SPH.savedVariables.enableDebug end,
      setFunc = function(value) SPH.savedVariables.enableDebug = value end,
      default = false,
    },
  }

  LAM2:RegisterOptionControls(SPH.name .. "Options", optionsData)
end
