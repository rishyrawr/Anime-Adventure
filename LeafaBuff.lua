repeat task.wait() until game:IsLoaded() == true

while task.wait() do
    local LeafaTable = {}
    local Active_Attack = game:GetService("ReplicatedStorage").endpoints["client_to_server"].use_active_attack

    for _,v in pairs(game:GetService("Workspace")._UNITS:GetChildren()) do
        if v.Name == 'leafa' and v:WaitForChild('_stats').player.Value == game.Players.LocalPlayer then
            table.insert(LeafaTable, v)
        end
    end

    if #LeafaTable = 4 then
        while true do
            Active_Attack:InvokeServer(LeafaTable[1])
            task.wait(16.5)
            Active_Attack:InvokeServer(LeafaTable[2])
            task.wait(16.5)
            Active_Attack:InvokeServer(LeafaTable[3])
            task.wait(16.5)
            Active_Attack:InvokeServer(LeafaTable[4])
        end
    end
end
