-- MIT License
-- Copyright (c) 2020 Martín Aguilar

local rand = require('openssl.rand')
local bit = require('bit')

local url = 'ModuleSymbhasOwnPr-0123456789ABCDEFGHNRVfgctiUvz_KqYTJkLxpZXIjQW'

local nanoid = {
  _VERSION = '1.0.0'
}

function nanoid.custom_alphabet(alphabet, size)
  return function()
    local id = ''

    local mask = bit.lshift(2, math.log(#alphabet - 1) / math.log(2)) - 1
    local step = math.ceil((1.6 * mask * size) / #alphabet)

    while true do
      local bytes = rand.bytes(step)

      for i = 1, step do
        local j = bit.band(string.sub(bytes, i, i):byte(), mask)
        id = id .. string.sub(alphabet, j, j) or ''

        if #id == size then return id end
      end
    end
  end
end

function nanoid.nanoid(size)
  local id = ''
  local bytes = rand.bytes(size)

  for i = 1, size do
    -- FIXME this is a fucking mess
    local j = bit.band(string.sub(bytes, i, i):byte(), 63)
    j = j == 0 and j + 1 or bit.band(string.sub(bytes, i, i):byte(), 63)

    id = id .. string.sub(url, j, j)
  end

  return id
end

setmetatable(nanoid, {
  __call = function(_, size)
    return nanoid.nanoid(size and tonumber(size) or 21)
  end
})

return nanoid
