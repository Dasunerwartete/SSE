local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "KickPlayerEvent"
RemoteEvent.Parent = game:GetService("ReplicatedStorage")

local function kickPlayerByCommand(commandText)
  local playerName, kickReason = commandText:match("([^,]+),%s*(.+)")

  if playerName and kickReason then
    local player = game:GetService("Players"):FindFirstChild(playerName)

    if player then
      player:Kick(kickReason)
      print(playerName .. " has been kicked for: " .. kickReason)
    end
  end
end
