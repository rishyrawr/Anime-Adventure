repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService("Workspace"):WaitForChild("_waves_started").Value == true
repeat task.wait() until game:GetService("Workspace"):FindFirstChild("_UNITS") ~= nil

local LeafyCount = 0
local use_active = game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack

while LeafyCount ~= 4 do task.wait()
    local LeafyTable = {}

    for _, unit in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
        if unit.Name == "leafa" and unit:FindFirstChild("_stats").id.Value == "leafa" and unit:WaitForChild("_stats").player.Value == game.Players.LocalPlayer then
            LeafyCount = LeafyCount + 1
            table.insert(LeafyTable, unit)
        end
    end

    while LeafyCount == 4 do
        use_active:InvokeServer(LeafyTable[1])
        task.wait(16.4)
        use_active:InvokeServer(LeafyTable[2])
        task.wait(16.4)
        use_active:InvokeServer(LeafyTable[3])
        task.wait(16.4)
        use_active:InvokeServer(LeafyTable[4])
        end
    end
end
