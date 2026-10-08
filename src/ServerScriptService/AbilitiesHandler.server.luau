local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local DR_J_Config = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("DR_J_Config"))

-- Crear carpeta Network y RemoteEvent si no existen
local Network = ReplicatedStorage:FindFirstChild("Network")
if not Network then
Network = Instance.new("Folder")
Network.Name = "Network"
Network.Parent = ReplicatedStorage
end

local AbilityEvent = Network:FindFirstChild("AbilityEvent")
if not AbilityEvent then
AbilityEvent = Instance.new("RemoteEvent")
AbilityEvent.Name = "AbilityEvent"
AbilityEvent.Parent = Network
end

-- Manejador de habilidades
AbilityEvent.OnServerEvent:Connect(function(player, abilityName)
local character = player.Character
if not character or not character:FindFirstChild("Humanoid") then return end

local humanoid = character.Humanoid
if humanoid.Health <= 0 then return end

local abilityData = DR_J_Config.Abilities[abilityName]
if not abilityData then return end

print("[SERVER] " .. player.Name .. " usó la habilidad: " .. abilityName)

if abilityName == "Trow" then
-- Pócima de Curación
humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + abilityData.HealAmount)
print("[SERVER] " .. player.Name .. " se curó " .. abilityData.HealAmount .. " de vida.")

elseif abilityName == "Point" then
-- Aplica debuff al Killer
print("[SERVER] " .. player.Name .. " ejecutó Point (Debuff).")

elseif abilityName == "Explote" then
-- Mezcla explosiva
print("[SERVER] " .. player.Name .. " ejecutó Explote (Stun/Daño).")
end
end)
