repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.PlayerGui
getgenv().itemsInMap = {}
local bob;
bob = hookmetamethod(game,"__newindex",function(t,i,v)
if t == game:GetService("ReplicatedStorage").ItemSpawn and i == "OnClientInvoke" then
   old = v
   v = function(...) -- gets args of itemspawn.onclientinvoke
   local args = {...}
   table.insert(getgenv().itemsInMap, {
      Replica = args[2]["Replica"];
      CFrame = args[2]["CFrame"];
      CD = args[2]["CD"]
   })
   return old(...)
end
end
return bob(t,i,v)
end)
pcall(function()
getscriptclosure(game:GetService("ReplicatedFirst"):WaitForChild("ItemSpawn"))()
end)
