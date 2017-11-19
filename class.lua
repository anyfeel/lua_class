local _M = {}

local _class = {}

function _M.class(super)
    local cls = {}

    cls.ctor = false
    cls.super = super

    cls.new = function(...)
        local instance = {}

        local create = function(c, ...)
            if c.super then
                create(c.super, ...)
            end
            if c.ctor then
                c.ctor(instance, ...)
            end
        end

        create(cls, ...)

        setmetatable(instance,{ __index = _class[cls] })

        return instance
    end

    local vtbl = {}
    _class[cls] = vtbl

    setmetatable(cls, { __newindex =
        function(t, k, v)
            vtbl[k] = v
        end
    })

    if super then
        setmetatable(vtbl, { __index =
            function(t, k)
                local ret = _class[super][k]
                vtbl[k] = ret  -- speed up query
                return ret
            end
        })
    end

    return cls
end

return _M
