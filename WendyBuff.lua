repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService("Workspace"):WaitForChild("_waves_started").Value == true
repeat task.wait() until game:GetService("Workspace"):FindFirstChild("_UNITS") ~= nil

local WendaCount = 0
local use_active = game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack

while WendaCount ~= 4 do task.wait()
    local WendaTable = {}

    for _, unit in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
        if unit.Name == "wendy" and unit:FindFirstChild("_stats").id.Value == "wendy" and unit:WaitForChild("_stats").player.Value == game.Players.LocalPlayer then
            WendaCount = WendaCount + 1
            table.insert(WendaTable, unit)
        end
    end

    while WendaCount == 4 do
        use_active:InvokeServer(WendaTable[1])
        task.wait(15.4)
        use_active:InvokeServer(WendaTable[2])
        task.wait(15.4)
        use_active:InvokeServer(WendaTable[3])
        task.wait(15.4)
        use_active:InvokeServer(WendaTable[4])
    end
end
