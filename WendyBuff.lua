-- NOTE: NOT WORK W/ XENON HUB
repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService("Workspace"):WaitForChild("_waves_started").Value == true
repeat task.wait() until game:GetService("Workspace"):FindFirstChild("_UNITS") ~= nil

local use_active = game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack

while true do task.wait()
    local WendaTable = {}
    for _, unit in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
        if unit.Name == "wendy" and unit:FindFirstChild("_stats").id.Value == "wendy" and unit:WaitForChild("_stats").player.Value == game.Players.LocalPlayer then
            table.insert(WendaTable, unit)
        end
    end
    
    if #WendaTable == 4 then
        while true do
            use_active:InvokeServer(WendaTable[1])
            task.wait(15.4)
            use_active:InvokeServer(WendaTable[2])
            task.wait(15.4)
            use_active:InvokeServer(WendaTable[3])
            task.wait(15.4)
            use_active:InvokeServer(WendaTable[4])
        end
    end
end
