local _M = {
    a = 1
}

function _M:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function _M:foo()
    print("this is base foo")
end


function _M:string()
    print("this is base string")
end

function _M:set(x)
    self.a = self.a + x
end

function _M:get()
    print(self.a)
end



return _M
