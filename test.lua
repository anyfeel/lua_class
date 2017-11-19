local x = require "inherit"

y = x:new()
z = x:new()


y:set(10)
y:get()
print(getmetatable(y):get())


z:set(20)
z:get()
print(getmetatable(z):get())


