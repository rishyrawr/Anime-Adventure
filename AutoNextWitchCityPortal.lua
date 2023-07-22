repeat wait() until game:IsLoaded() == true
repeat task.wait() until game:GetService('Workspace'):FindFirstChild('_DATA'):FindFirstChild('GameFinished').Value == true
task.wait(10)

function Portal(id)
   local reg = getreg()
   local portals = {}
   for i,v in next, reg do
      if type(v) == 'function' then
         if getfenv(v).script then
            for _, v in pairs(debug.getupvalues(v)) do
               if type(v) == 'table' then
                  if v["session"] then
                     for _, itemid in pairs(v["session"]["inventory"]['inventory_profile_data']['unique_items']) do
                        if itemid["item_id"]:match(id) then
                           table.insert(portals, itemid)
                        end
                     end
                     return portals
                  end
               end
            end
         end
      end
   end
end

for i,v in pairs(Portal('portal_item__madoka')) do
   for index, value in pairs(settings.Tiers) do
      if v['_unique_item_data']['_unique_portal_data']['portal_depth'] == tonumber(index) and not table.find(value, v['_unique_item_data']['_unique_portal_data']['challenge']) then
	    local args = {[1] = "replay", [2] = {["item_uuid"] = v["uuid"]}}
		game:GetService('ReplicatedStorage').endpoints.client_to_server.set_game_finished_vote:InvokeServer(unpack(args))
    end
 end
