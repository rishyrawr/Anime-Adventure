repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService("Workspace"):WaitForChild("_waves_started").Value == true
repeat task.wait() until game:GetService("Workspace"):FindFirstChild("_UNITS") ~= nil

local ErwinCount = 0

while ErwinCount ~= 4 do task.wait()
    local use_active = game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack
    local ErwinTable = {}

    for _, unit in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
        if unit.Name == "erwin" and unit:FindFirstChild("_stats").id.Value == "erwin" and unit:WaitForChild("_stats").player.Value == game.Players.LocalPlayer then
            ErwinCount = ErwinCount + 1
            table.insert(ErwinTable, unit)
        end
    end

    while ErwinCount == 4 do
        use_active:InvokeServer(ErwinTable[1])
        task.wait(15.4)
        use_active:InvokeServer(ErwinTable[2])
        task.wait(15.4)
        use_active:InvokeServer(ErwinTable[3])
        task.wait(15.4)
        use_active:InvokeServer(ErwinTable[4])
    end
end
