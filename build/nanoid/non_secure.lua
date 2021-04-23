local _tl_compat; if (tonumber((_VERSION or ''):match('[%d.]*$')) or 0) < 5.3 then local p, m = pcall(require, 'compat53.module'); if p then _tl_compat = m end end; local math = _tl_compat and _tl_compat.math or math; local string = _tl_compat and _tl_compat.string or string; local nanoid = {
   _VERSION = "2.0.0",
}

local url = "ModuleSymbhasOwnPr-0123456789ABCDEFGHNRVfgctiUvz_KqYTJkLxpZXIjQW"

function nanoid.custom_alphabet(alphabet, size)
   return function()
      local id = ""
      for _ = 1, size do
         local n = math.floor(math.random(1, #alphabet))
         id = id .. string.sub(alphabet, n, n)
      end
      return id
   end
end

function nanoid.nanoid(size)
   local id = ""
   for _ = 1, size do
      local n = math.floor(math.random(1, #url))
      id = id .. string.sub(url, n, n)
   end
   return id
end

return setmetatable(nanoid, {
   __call = function(_, size)
      return nanoid.nanoid(size or 21)
   end,
})