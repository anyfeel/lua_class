local base = require "base"

local _M = base:new()

--function _M:new(o)
--    o = o or {}
--    setmetatable(o, self)
--    self.__index = self
--    return o
--end

function _M:bar()
    print("this is inherit bar")
end

function _M:foo()
    print("this is inherit foo")
end

return _M
