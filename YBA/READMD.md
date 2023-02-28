getgenv().Settings = {
["items"] = {"Lucky Arrow","Mysterious Arrow","Rokakaka"}
["DiscordId"] = 836855852858212352, -- // Your Discord ID.
["customWebhook"] = "", -- // Your Discord Webhook.
["PerformanceMode"] = false -- // disables 3d rendering.
}
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.PlayerGui
loadstring(syn.request({Url = "https://raw.githubusercontent.com/NotAltered7750/Roblox-Scripts/main/YBA/main.lua"}).Body)()
