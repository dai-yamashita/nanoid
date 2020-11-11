package = "nanoid"
version = "dev-1"
source = {
  url = "git://github.com/mrtnpwn/nanoid",
  branch = "master",
}
description = {
  summary = "Tiny, secure, URL-friendly, unique string ID generator",
  detailed = [[
    Tiny, secure, URL-friendly, unique string ID generator

    Visit the repository at GitHub for more information.
  ]],
  homepage = "https://github.com/mrtnpwn/nanoid",
  license = "MIT",
  maintainer = "Martín Aguilar <ik7swordking@gmail.com>",
}
dependencies = {
  "luaossl >= 20200709-0",
  "luabitop >= 1.0.2-3",
}
build = {
  type = "builtin",
  modules = {
    ["nanoid"] = "nanoid/init.lua",
    ["nanoid.non_secure"] = "nanoid/non_secure.lua",
  },
}
