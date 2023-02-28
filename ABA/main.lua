repeat
    wait()
until game.Loaded
game:GetService("RunService"):Set3dRenderingEnabled(false)
setfpscap(240)
task.wait(5)
if game.PlaceId == 5411459567 then
    repeat
        task.wait(1)
    until game.Workspace.Message
end
_G.MinTimer = 65

local function notify(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Type-RED Server Hop",
        Duration = 60,
        Text = text
    })
end

local function serverHop()
    if syn then
        syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/NotAltered7750/Roblox-Scripts/main/ABA/main.lua", true))()')
    else
        queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/NotAltered7750/Roblox-Scripts/main/ABA/main.lua", true))()')
    end

end

if game.GameId == 578392296 then
    if game.PlaceId ~= 5411459567 then
        notify("Joining AFK World")
        serverHop()
        game:GetService("TeleportService"):Teleport(5411459567)
    end

    notify("AFK Hop running")
    local function timerCheck()
        local timer = game.Workspace.Message.Text:split(" ")
        local time = tonumber(timer[1])
        return time
    end

    if timerCheck() <= _G.MinTimer then
        notify("Waiting for reward")
        repeat
            task.wait()
        until timerCheck() > _G.MinTimer
        notify("Server Hopping")
        task.wait(1)
        serverHop()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NotAltered7750/Roblox-Scripts/main/ABA/main.lua", true))()
    else
        notify("Server Hopping")
        serverHop()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NotAltered7750/Roblox-Scripts/main/ABA/main.lua", true))()
    end

end
