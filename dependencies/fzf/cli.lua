local Lummander = require "lummander"

local cli = Lummander.new{
        title = "",
        description = "", -- later add descritption from other files
        version = "",
        author = "",
        theme = "acid", -- Default = "default". "default" and "acid" are built-in themes
        flag_prevent_help = false -- <boolean> Prevent help message if not command found. Default: false
    }

--[[
COMMANDS for CLI
]]--

-- PARSER
cli:parse(arg) -- parse arg and execute if a command was written


