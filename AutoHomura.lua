repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService('Workspace'):WaitForChild('_waves_started').Value == true
repeat task.wait() until game:GetService('Workspace'):FindFirstChild('_UNITS') ~= nil
    
while task.wait() do
    for _,v in pairs(game:GetService('Workspace')._UNITS:GetChildren()) do
        if v._stats.id.Value == "homura_evolved" and v._stats.player.Value == game.Players.LocalPlayer.Name and v._stats.state.Value == 'attack' then
            game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(v)
        end
    end
end
