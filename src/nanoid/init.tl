local record NanoId
   _VERSION: string
   custom_alphabet: function(string, number): (function(): string)
   nanoid: function(number): string
   metamethod __call: function(NanoId, number): string
end

local nanoid: NanoId = {
  _VERSION = "2.0.0"
}

local record OsslRand
  bytes: function(number): string
end

local _require = require
local rand = _require("openssl.rand") as OsslRand

local url = "ModuleSymbhasOwnPr-0123456789ABCDEFGHNRVfgctiUvz_KqYTJkLxpZXIjQW"

function nanoid.custom_alphabet(alphabet: string, size: number): (function(): string)
   local mask = (2 << math.floor(math.log(#alphabet - 1) / math.log(2))) - 1
   local step = math.ceil((1.6 * mask * size) / #alphabet)
   return function(): string
      local id = ""
      while true do
         local bytes = rand.bytes(step)
         for i = 1, step do
            local j = bytes:sub(i, i):byte() & mask
            id = id .. alphabet:sub(j, j) or ""
            if #id == size then return id end
         end
      end
   end
end

function nanoid.nanoid(size: number): string
   local bytes = rand.bytes(size)
   local id = ""
   for i = 1, size do
      local j = bytes:sub(i, i):byte() & 63
      id = id .. url:sub(j, j)
   end
   return id
end

return setmetatable(nanoid, {
   __call = function(_, size: number): string
      return nanoid.nanoid(size or 21)
   end
})
