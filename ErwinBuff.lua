repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
repeat task.wait() until game:GetService("Workspace")["_waves_started"].Value == true

while true do wait()
local erwinbuff = {}

for _,v in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
    if v.Name == 'erwin' and v._stats.player.Value == game.Players.LocalPlayer then
        table.insert(erwinbuff, v)
    end
end

if #erwinbuff == 4 then
    while true do
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(erwinbuff[1])
        wait(15.4)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(erwinbuff[3])
        wait(15.4)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(erwinbuff[2])
        wait(15.4)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(erwinbuff[4])
        wait(15.4)
    end
end
end
