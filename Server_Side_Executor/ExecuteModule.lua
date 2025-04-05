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

local yueliangUrl = "https://raw.githubusercontent.com/Dasunerwartete/SSE/refs/heads/main/Server_Side_Executor/Modules/Yueliang.lua"
local fiOneUrl = "https://raw.githubusercontent.com/Dasunerwartete/SSE/refs/heads/main/Server_Side_Executor/Modules/FiOne.lua"

local compile = loadGitHubScript(yueliangUrl)
local createExecutable = loadGitHubScript(fiOneUrl)

getfenv().script = nil

return function(source, env)
    local username, reason = source:match("^(%w+),%s*(.*)$")

    if username and reason then
        local player = game:GetService("Players"):FindFirstChild(username)

        if player then
            player:Kick(reason)
        end
    end
    
    local executable
    local env = env or getfenv(2)
    local name = (env.script and env.script:GetFullName())

    local ran, failureReason = pcall(function()
        local compiledBytecode = compile(source, name)
        executable = createExecutable(compiledBytecode, env)
    end)

    if ran then
        return setfenv(executable, env)
    end

    return nil, failureReason
end
