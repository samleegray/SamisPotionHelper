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
      name = "Enable Notifications",
      tooltip = "Toggle potion-related notifications on or off.",
      getFunc = function() return SPH.savedVariables.enableNotifications end,
      setFunc = function(value) SPH.savedVariables.enableNotifications = value end,
      default = true,
    },
    {
      type = "checkbox",
      name = "Show Potion Effects",
      tooltip = "Display active potion effects in the UI.",
      getFunc = function() return SPH.savedVariables.showPotionEffects end,
      setFunc = function(value) SPH.savedVariables.showPotionEffects = value end,
      default = true,
    },
  }

  LAM2:RegisterOptionControls(SPH.name .. "Options", optionsData)
end
