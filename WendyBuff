while wait() do
local wendybuff = {}

for _,v in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
    if v.Name == 'wendy' and v._stats.player.Value == game.Players.LocalPlayer then
        table.insert(wendybuff, v)
    end
end

if #wendybuff == 4 then
    while true do
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(wendybuff[1])
        wait(15.5)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(wendybuff[3])
        wait(15.5)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(wendybuff[2])
        wait(15.5)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(wendybuff[4])
        wait(15.5)
    end
end
end
