repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService('Workspace'):WaitForChild('_waves_started').Value == true
repeat task.wait() until game:GetService('Workspace'):FindFirstChild('_UNITS') ~= nil

local WendaCount = 0

while WendaCount ~= 4 do task.wait()
    local use_active = game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack
    local WendaTable = {}

    for _, unit in pairs(game:GetService('Workspace')._UNITS:GetChildren()) do
        if unit.Name == 'wenda' and unit:WaitForChild('_stats').player.Value == game.Players.LocalPlayer then
            WendaCount = WendaCount + 1
            table.insert(WendaTable, unit)
        end
    end

    while WendaCount == 4 do
        for i = 1, WendaCount do
            use_active:InvokeServer(WendaTable[i])
            task.wait(15.4)
        end
    end
end
