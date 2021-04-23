local record NanoId
  metamethod __call: function(NanoId, number): string
end
local _require = require
local nanoid = _require("nanoid") as NanoId

print(nanoid())
