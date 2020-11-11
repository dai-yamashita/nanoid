-- MIT License
-- Copyright (c) 2020 Martín Aguilar

package.path = './?.lua;' .. package.path

local nanoid = require('nanoid.non_secure')

describe('nanoid', function()
  it('generates URL-friendly IDs', function()
    for _ = 1, 100 do
      local id = nanoid()

      assert.are.equal(#id, 21)
    end
  end)

  it('changes ID length', function()
    assert.are.equal(#nanoid(10), 10)
  end)

  it('accepts string', function()
    assert.are.equal(#nanoid('10'), 10)
  end)

  it('has no collisions', function()
    local rtn = {}

    for _ = 1, 100 * 1000 do
      local id = nanoid()

      assert.is_not_true(rtn[id])
      rtn[id] = true
    end
  end)
end)

