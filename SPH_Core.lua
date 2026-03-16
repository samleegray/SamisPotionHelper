SamisPotionHelperAddon = SamisPotionHelperAddon or {}

local SPH = SamisPotionHelperAddon

SPH.name = "SamisPotionHelper"
SPH.displayName = "Sami's Potion Helper"
SPH.version = "1.0.0"
SPH.author = "samihaize"

-- Seeded effect tables (work in progress)
SPH.EFFECT_TABLE = {
  HEROISM = {
    [197919] = true,  -- Mag + Stam + Heroism
    [2031616] = true, -- minor heroism example
  },
  UNSTOPPABLE = {
    [1245184] = true,
    [1245443] = true,
  },
  TRI_STAT = {
    [8454917] = true,
    [66309] = true,
  },
  ENDURANCE = {
    [66825] = true,
  },
  BI_STAT = {
    [197888] = true, -- Mag + Stam
  },
  RESISTS = {
    PHYSICAL_ONLY = {
      [589824] = true,
      [596224] = true,
    },
    SPELL_ONLY = {
      [458752] = true,
      [198425] = true,
      [788224] = true,
    },
    BOTH_RESISTS = {
      [67337] = true,
      [461056] = true,
    },
  }
}
