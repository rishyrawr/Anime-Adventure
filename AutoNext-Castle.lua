repeat wait() until game:IsLoaded()

coroutine.resume(coroutine.create(function()
    task.spawn(function()
        game:GetService("Workspace"):WaitForChild("_DATA"):WaitForChild("GameFinished"):GetPropertyChangedSignal("Value"):Connect(function()
            wait(5)
            for i=1,2 do
                game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_infinite_tower_from_game:InvokeServer("NextRetry")
            end
        end)
    end)
end))
