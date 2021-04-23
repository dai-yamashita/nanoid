local _tl_compat; if (tonumber((_VERSION or ''):match('[%d.]*$')) or 0) < 5.3 then local p, m = pcall(require, 'compat53.module'); if p then _tl_compat = m end end; local math = _tl_compat and _tl_compat.math or math; local string = _tl_compat and _tl_compat.string or string; local NanoId = {}






local nanoid = {
   _VERSION = "2.0.0",
}

local OsslRand = {}



local _require = require
local rand = _require("openssl.rand")

local url = "ModuleSymbhasOwnPr-0123456789ABCDEFGHNRVfgctiUvz_KqYTJkLxpZXIjQW"

function nanoid.custom_alphabet(alphabet, size)
   local mask = (2 << math.floor(math.log(#alphabet - 1) / math.log(2))) - 1
   local step = math.ceil((1.6 * mask * size) / #alphabet)
   return function()
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

function nanoid.nanoid(size)
   local bytes = rand.bytes(size)
   local id = ""
   for i = 1, size do
      local j = bytes:sub(i, i):byte() & 63
      id = id .. url:sub(j, j)
   end
   return id
end

return setmetatable(nanoid, {
   __call = function(_, size)
      return nanoid.nanoid(size or 21)
   end,
})