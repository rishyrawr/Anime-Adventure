repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService('Workspace'):WaitForChild('_waves_started').Value == true
repeat task.wait() until game:GetService('Workspace'):FindFirstChild('_UNITS') ~= nil

while task.wait() do wait()
local erwinbuff = {}

for _,v in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
    if v.Name == 'erwin' and v:WaitForChild('_stats').player.Value == game.Players.LocalPlayer then
        table.insert(erwinbuff, v)
    end
end

if #leafabuff == 4 then
    while true do
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(erwinbuff[1])
        wait(15.5)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(erwinbuff[3])
        wait(15.5)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(erwinbuff[2])
        wait(15.5)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(erwinbuff[4])
        wait(15.5)
    end
end
end
