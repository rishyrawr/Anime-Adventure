-- NOTE: NOT WORK W/ XENON HUB
repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService("Workspace"):WaitForChild("_waves_started").Value == true
repeat task.wait() until game:GetService("Workspace"):FindFirstChild("_UNITS") ~= nil

local use_active = game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack

while true do task.wait()
    local LeafaTable = {}
    for _, unit in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
        if unit.Name == "leafa" and unit:FindFirstChild("_stats").id.Value == "leafa" and unit:WaitForChild("_stats").player.Value == game.Players.LocalPlayer then
            table.insert(LeafaTable, unit)
        end
    end
    
    if #LeafaTable == 4 then
        while true do
            use_active:InvokeServer(LeafaTable[1])
            task.wait(15.4)
            use_active:InvokeServer(LeafaTable[2])
            task.wait(15.4)
            use_active:InvokeServer(LeafaTable[3])
            task.wait(15.4)
            use_active:InvokeServer(LeafaTable[4])
        end
    end
end
