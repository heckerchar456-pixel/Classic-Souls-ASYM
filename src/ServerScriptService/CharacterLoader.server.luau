local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Assets = ReplicatedStorage:WaitForChild("Assets")
local Characters = Assets:WaitForChild("Characters")

Players.PlayerAdded:Connect(function(player)
player.CharacterAdded:Connect(function(character)
-- Aquí irá la lógica para asignar el modelo según el personaje elegido (DR. J, GreenLord, Soul of Fire, etc.)
print("[CHARACTER LOADER] Personaje cargado para: " .. player.Name)
end)
end)
