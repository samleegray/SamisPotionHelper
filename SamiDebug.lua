SamiDebug = SamiDebug or {}

local SAMID = SamiDebug
local debug = false

function SAMID:Print(...)
  if not debug then return end

  local message = string.format(...)
  d("[SAMI DEBUG]: " .. message)
end
