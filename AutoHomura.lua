-- CREDS TO SOMEONE IN TRAP HUB SERVER
getgenv().AutoHomura = true

coroutine.resume(coroutine.create(function()
    while task.wait() do 
        if AutoHomura and game.PlaceId == 8349889591 then
            local success,err = pcall(function()
                repeat task.wait() until Workspace:WaitForChild("_UNITS")
                local plyr = game.Players.LocalPlayer
                for i, v in ipairs(Workspace["_UNITS"]:GetChildren()) do
                    if v:FindFirstChild("_stats") then
                        if v._stats.id.Value == "homura_evolved" and v._stats.player.Value == plyr and v._stats.state.Value == 'attack' then
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(v)
                        end
                    end
                end 
            end)

            if err then
                -- print(err)
            end
        end
    end
end))
