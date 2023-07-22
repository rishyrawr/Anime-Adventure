repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService('Workspace'):WaitForChild('_waves_started').Value == true
repeat task.wait() until game:GetService('Workspace'):FindFirstChild('_UNITS') ~= nil

while task.wait() do wait()
local leafabuff = {}

for _,v in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
    if v.Name == 'leafa' and v:WaitForChild('_stats').player.Value == game.Players.LocalPlayer then
        table.insert(leafabuff, v)
    end
end

if #leafabuff == 4 then
    while true do
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(leafabuff[1])
        wait(15.4)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(leafabuff[3])
        wait(15.4)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(leafabuff[2])
        wait(15.4)
        game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack:InvokeServer(leafabuff[4])
        wait(15.4)
    end
end
end
