local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DR_J_Config = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("DR_J_Config"))

local cooldowns = {
Trow = 0,
Point = 0,
Explote = 0
}

local keybinds = {
[Enum.KeyCode.Q] = "Trow",
[Enum.KeyCode.E] = "Point",
[Enum.KeyCode.R] = "Explote"
}

UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end

local abilityName = keybinds[input.KeyCode]
if not abilityName then return end

local currentTime = os.clock()
local abilityData = DR_J_Config.Abilities[abilityName]

if currentTime - cooldowns[abilityName] >= abilityData.Cooldown then
cooldowns[abilityName] = currentTime
print("[DR. J] Activando habilidad: " .. abilityName)
else
local remaining = math.ceil(abilityData.Cooldown - (currentTime - cooldowns[abilityName]))
print("[DR. J] " .. abilityName .. " en cooldown. Espera " .. remaining .. "s")
end
end)
