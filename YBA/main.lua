getgenv().Done = false
local getVer = readfile("YBA_AUTOFARM_STUFF/vsn.txt")
local desiredVersion = "0.12B"
if getVer ~= desiredVersion then
	delfolder("YBA_AUTOFARM_STUFF")
	makefolder("YBA_AUTOFARM_STUFF")
	writefile("YBA_AUTOFARM_STUFF/vsn.txt",desiredVersion)
	game.Players.LocalPlayer:Kick("Script is updating, please rejoin.")
end
repeat wait() until game:IsLoaded()
for i, v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v["Disable"](v)
end
if game.PlaceId == 2809202155 and game.Players.LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1") then
if getgenv().Settings["PerformanceMode"] then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
end
local http = game:GetService("HttpService")
if not isfolder("YBA_AUTOFARM_STUFF") then
makefolder("YBA_AUTOFARM_STUFF")
end
local function writeItem(bool)
    local allItems = {}
    if bool then
        for i,v in pairs(game.ReplicatedStorage.Tool_Replicas:GetChildren()) do
            table.insert(allItems,v.Name)
        end
    writefile("YBA_AUTOFARM_STUFF/ListOfItems.json",http:JSONEncode(allItems))
    else
    writefile("YBA_AUTOFARM_STUFF/ListOfItems.json",http:JSONEncode({"TEXT"}))
    end
end
local function Call(Answer)
    if Answer == "Yes" then
        writeItem(true)
    elseif Answer == "No" then
        writeItem(false)
    end
end
if not isfile("YBA_AUTOFARM_STUFF/ListOfItems.json") then
local MakeItCall = Instance.new("BindableFunction")
MakeItCall.OnInvoke = Call
game.StarterGui:SetCore("SendNotification",{Title = "!!",Text = "Do you want a list of all items in the game?",Duration = 300,Button1 = "Yes",Button2 = "No",Callback = MakeItCall})
end
game.StarterGui:SetCore("SendNotification",{Title = "Changelog 12/15/2022",Text = "Added versions, reset item list document.",Duration = 10,Icon = nil})
end
wait(1.231234)
local setupUrl = "https://gist.githubusercontent.com/crcket/78703e1251ad8bfa51541b567e9ab4a1/raw/"
if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1") then
	local LoadingScreen1Clone, Frame, LoadingFrame, BarFrame, Skip
    	LoadingScreen1Clone = Instance.new("ScreenGui")
	LoadingScreen1Clone.Parent = game.Players.LocalPlayer.PlayerGui
	LoadingScreen1Clone.Name = "LoadingScreen1"
	Frame = Instance.new("Frame", LoadingScreen1Clone)
	LoadingFrame = Instance.new("Frame", Frame)
	LoadingFrame.Name = "LoadingFrame"
	BarFrame = Instance.new("Frame", LoadingFrame)
	BarFrame.Name = "BarFrame"
	Skip = Instance.new("Frame", BarFrame)
	Skip.Name = "Skip"
	TextButton = Instance.new("TextButton", Skip)
	TextButton.MouseButton1Click:Connect(function()
		LoadingScreen1Clone:Destroy()
	end)
	print("No loadingscreen1.. made it myself")
else
	-- LoadingScreen Exists
end
task.wait(1.218346127649)
-- new loading
local function pressM1(PATH)
    for i,v in pairs(getconnections(PATH.MouseButton1Click)) do
       v.Function() 
    end
end
local plrGui = game.Players.LocalPlayer:WaitForChild("PlayerGui",9e9)
pressM1(plrGui:WaitForChild("LoadingScreen1",9e9).Frame.LoadingFrame.BarFrame.Skip.TextButton)
wait(5.471293)
pressM1(plrGui:WaitForChild("LoadingScreen",9e9).Play)
wait(.5)
pressM1(plrGui.LoadingScreen.Frames.Gamemodes.Main)
-- end of new loading
loadstring(syn.request({ Url = setupUrl }).Body)()
task.wait(0.54321)
local billybobjones = game.ReplicatedStorage:WaitForChild("Returner", 9e9)
billybobjones.Name = billybobjones.Name
local old
old = hookmetamethod(game, "__namecall", function(self, ...)
	local args = { ... }
	local method = getnamecallmethod()
	if tostring(self) == "Returner" and tostring(method) == "InvokeServer" then
		return "  ___XP DE KEY"
	end
	return old(self, ...)
end)
print(getgenv().itemsInMap[1])
if getgenv().itemsInMap[1] == nil then
	game.StarterGui:SetCore("SendNotification", {
		Title = "ERROR",
		Text = "Script has not found any items/has failed. This may be due to you not loading into the map",
		Duration = "10",
		Icon = nil,
	})
	
	task.wait(4)
	print(getgenv().itemsInMap[1])
	loadstring(syn.request({ Url = setupUrl }).Body)()
	task.wait(3)
	print(getgenv().itemsInMap[1])
end
task.wait(0)
for i, e in pairs(getgenv().itemsInMap) do
	warn(e["Replica"].Name .. " <- Found " .. "id is " .. tostring(i))
	if table.find(getgenv().Settings["items"], e["Replica"].Name) then
		print(
			"Found " .. tostring(e["Replica"].Name) .. " getting ready to start teleporting " .. "id is " .. tostring(i)
		)
	end
end
local function Discord1()
	syn.request({
		Url = getgenv().Settings["customWebhook"],
		Method = "POST",
		Headers = {["content-type"] = "application/json" },
		Body = http:JSONEncode({["content"] = "You have picked up a lucky arrow. <@"..getgenv().Settings["DiscordId"]..">"}),
	})
end
   task.wait()
for i, item in pairs(getgenv().itemsInMap) do
	if table.find(getgenv().Settings["items"], item["Replica"].Name) then
		if item["CD"].Parent == nil or item["CD"].MaxActivationDistance == 0 then
			continue
		end
		for b = 1, 3 do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = item["CFrame"]
			task.wait(0.1111)
		end
		task.wait(0.1)
		item["CD"]:WaitForChild("RemoteEvent"):FireServer()
		print(i .. " if nothing gets picked up, whoops.")
		task.wait(0.333)
		if item["Replica"].Name == "Lucky Arrow" then
			Discord1()
		end
	end
end
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
	AllIDs = game:GetService("HttpService"):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
	table.insert(AllIDs, actualHour)
	writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs))
end
function TPReturner()
	local Site
	if foundAnything == "" then
		Site = game.HttpService:JSONDecode(
			game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100")
		)
	else
		Site = game.HttpService:JSONDecode(
			game:HttpGet(
				"https://games.roblox.com/v1/games/"
					.. PlaceID
					.. "/servers/Public?sortOrder=Asc&limit=100&cursor="
					.. foundAnything
			)
		)
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0
	for i, v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) and v.playing > 8 then
			for _, Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
							delfile("NotSameServers.json")
							AllIDs = {}
							table.insert(AllIDs, actualHour)
						end)
					end
				end
				num = num + 1
			end
			if Possible == true then
				table.insert(AllIDs, ID)
				wait()
				pcall(function()
					writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs))
					wait()
					game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
				end)
				wait(4)
			end
		end
	end
end
local Teleport = function()
	while task.wait(0.4) do
		pcall(function()
			TPReturner()
		end)
	end
end
wait(1)
Teleport()
