print("Hello, World!!!")

local ModuleScript = Instance.new("ModuleScript")
ModuleScript.Parent = game:GetService("Workspace")
ModuleScript.Source = [[
print("Hello from dynamically created module!")
]]
