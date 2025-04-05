local function loadGitHubScript(url)
    local content = game:HttpGet(url)
    if type(loadstring) == "function" then
        return loadstring(content)()
    elseif type(load) == "function" then
        return load(content)()
    else
        print("Error: Neither loadstring nor load are available!")
        return nil
    end
end

-- URLs of the module scripts on GitHub
local script_url = "https://raw.githubusercontent.com/Dasunerwartete/SSE/refs/heads/main/Server_Side_Executor/testScript.lua"
local executeModuleUrl = "https://raw.githubusercontent.com/Dasunerwartete/SSE/refs/heads/main/Server_Side_Executor/ExecuteModule.lua"
local yueliangUrl = "https://raw.githubusercontent.com/Dasunerwartete/SSE/refs/heads/main/Server_Side_Executor/Modules/Yueliang.lua"
local fiOneUrl = "https://raw.githubusercontent.com/Dasunerwartete/SSE/refs/heads/main/Server_Side_Executor/Modules/FiOne.lua"

-- Load all modules dynamically
local TestScript = loadGitHubScript(script_url)
local ExecuteModule = loadGitHubScript(executeModuleUrl)
local Yueliang = loadGitHubScript(yueliangUrl)
local FiOne = loadGitHubScript(fiOneUrl)

-- UI setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ExecutorGui"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Name = "ExecutorFrame"
frame.Parent = screenGui
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Position = UDim2.new(0.009, 0, 0.719, 0)
frame.Size = UDim2.new(0.304, 0, 0.265, 0)

local UICorner = Instance.new("UICorner")
UICorner.Parent = frame
UICorner.CornerRadius = UDim.new(0, 8)

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = frame
UIStroke.Color = Color3.fromRGB(120, 120, 120)
UIStroke.Thickness = 5

local TextBox = Instance.new("TextBox")
TextBox.Name = "CodeTextBox"
TextBox.Parent = frame
TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TextBox.ClearTextOnFocus = false
TextBox.MultiLine = true
TextBox.Position = UDim2.new(0.043, 0, 0.205, 0)
TextBox.Size = UDim2.new(0.916, 0, 0.639, 0)
TextBox.Font = Enum.Font.RobotoMono
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.Text = ""
TextBox.PlaceholderText = ""

local TextButton = Instance.new("TextButton")
TextButton.Name = "ExecuteButton"
TextButton.Parent = frame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
TextButton.Position = UDim2.new(0.189, 0, 0.878, 0)
TextButton.Size = UDim2.new(0.621, 0, 0.093, 0)
TextButton.Font = Enum.Font.RobotoMono
TextButton.Text = "Execute"
TextButton.TextScaled = true
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local UICorner2 = Instance.new("UICorner")
UICorner2.Parent = TextButton
UICorner2.CornerRadius = UDim.new(0, 8)

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "Title"
TextLabel.Parent = frame
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0.022, 0, 0, 0)
TextLabel.Size = UDim2.new(0.96, 0, 0.156, 0)
TextLabel.Font = Enum.Font.RobotoMono
TextLabel.Text = "Server-Sided Executor"
TextLabel.TextScaled = true
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

screenGui.Parent = game.Players.LocalPlayer.PlayerGui

TextButton.MouseButton1Click:Connect(function()
    if ExecuteModule then
        ExecuteModule(TextBox.Text)
    else
        print("ExecuteModule is not available!")
    end
end)
