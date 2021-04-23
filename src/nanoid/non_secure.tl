local record NanoId
   _VERSION: string
   custom_alphabet: function(string, number): (function(): string)
   nanoid: function(number): string
   metamethod __call: function(NanoId, number): string
end

local nanoid: NanoId = {
  _VERSION = "2.0.0"
}

local url = "ModuleSymbhasOwnPr-0123456789ABCDEFGHNRVfgctiUvz_KqYTJkLxpZXIjQW"

function nanoid.custom_alphabet(alphabet: string, size: number): (function(): string)
   return function(): string
      local id = ""
      for _ = 1, size do
         local n = math.floor(math.random(1, #alphabet))
         id = id .. string.sub(alphabet, n, n)
      end
      return id
   end
end

function nanoid.nanoid(size: number): string
   local id = ""
   for _ = 1, size do
      local n = math.floor(math.random(1, #url))
      id = id .. string.sub(url, n, n)
   end
   return id
end

return setmetatable(nanoid, {
   __call = function(_, size: number): string
      return nanoid.nanoid(size or 21)
   end
})
