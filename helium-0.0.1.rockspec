package = "helium"
version = "0.0.1"
source = {
  url = "https://github.com/alissonalbuquerque/helium.git"
}
description = {
  summary  = "Uma biblioteca templates para programar com orientação a objetos.",
  detailed = "Lib uso de O.O com lua vanilla",
  homepage = "https://github.com/alissonalbuquerque",
  license  = "MIT"
}
dependencies = {
  "lua >= 5.4"
}
build = {
  type = "builtin",
  modules = {
    ["helium.core.base"] = "src/core/base/__init__.lua"
    ["helium.core.wrapper"] = "src/core/wrapper/__init__.lua"
    ["helium.core.base.package"] = "src/core/base/package.lua",
  }
}
