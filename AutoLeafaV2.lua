function Auto_Leafy(v)
    s = v
    if v then
        local LeafyCount = 0
        local maxLeafyCount = 4
        local LeafyTable = {}
        while LeafyCount ~= maxLeafyCount do
        
        for i, unit in pairs(_UNITS:GetChildren()) do
            if unit:FindFirstChild('_stats') and unit:FindFirstChild('_stats').id.Value == "leafa" and unit:WaitForChild('_stats').player.Value == game.Players.LocalPlayer then
                LeafyCount = LeafyCount + 1
                table.insert(LeafyTable, unit)
            end
        end
        if #LeafyTable ~= maxLeafyCount then
            task.wait(5)
        end
            while LeafyCount == maxLeafyCount do
                for i = 1, LeafyCount do
                    use_active_attack(LeafyTable[i])
                    task.wait(16.5)
                end
            end
        end
    end
end 

Auto_Leafy(v)
