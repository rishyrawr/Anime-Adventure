repeat task.wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService('Workspace'):WaitForChild('_waves_started').Value == true
repeat task.wait() until game:GetService('Workspace'):FindFirstChild('_UNITS') ~= nil
    
while task.wait() do
    local Wendybuff = {}
    
    for _,v in pairs(game:GetService('Workspace')._UNITS:GetChildren()) do
        if v.Name == 'wendy' and v:WaitForChild('_stats').player.Value == game.Players.LocalPlayer then
            table.insert(Wendybuff, v)
        end
    end
    
    if #Wendybuff == 4 then
        while true do
            for i = 1, 4 do
                game:GetService('ReplicatedStorage').endpoints['client_to_server'].use_active_attack:InvokeServer(Wendybuff[i])
                task.wait(15.5)
            end
        end
    end
end
