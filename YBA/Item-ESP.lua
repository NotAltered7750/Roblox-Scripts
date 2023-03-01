local player = game:GetService("Players").LocalPlayer
local camera = workspace.Camera
local items = workspace["Item_Spawns"].Items
local runservice = game:GetService("RunService")

local pairs = pairs

local vecTrans = function(vec) -- Vector3 to Vector2
local worldP = vec
local result = camera:WorldToScreenPoint(worldP)

return Vector2.new(result.X, result.Y)
end

local esps = {}

local esp = function(item)
local text = Drawing.new("Text")
esps[#esps + 1] = {text, item}

if item.Color == Color3.fromRGB(165, 110, 0) then
text.Text = "Arrow"
text.Color = Color3.fromRGB(255, 255, 0)
elseif item.Color == Color3.fromRGB(139, 58, 86) then
text.Text = "Rokakaka"
text.Color = Color3.fromRGB(255, 0, 85)
end

text.Position = vecTrans(item.Position)
text.Size = 16
text.Outline = true
text.Visible = true
end

for i,v in pairs(items:GetDescendants()) do
if v.Name == "Base" then
esp(v)
end
end

items.DescendantAdded:Connect(function(descendant)
if descendant.Name == "Base" then
esp(descendant)
end
end)

local update_esp = function()
for i,v in pairs(esps) do
local tbl = v
local drawing = tbl[1]
local inst = tbl[2]

if drawing and drawing.Text ~= "" then
drawing.Position = vecTrans(inst.Position)

if not inst:IsDescendantOf(workspace) or inst.Parent.Parent ~= items then
drawing:Remove()
table.remove(esps, i)
end
end
end
end

runservice.RenderStepped:Connect(update_esp)
null
