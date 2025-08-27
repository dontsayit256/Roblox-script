local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Función para encontrar la base del jugador
local function findBasePosition(player)
    -- Ajusta esta función para que encuentre la posición exacta de la base del jugador
    -- Esto puede variar dependiendo de cómo esté configurado el juego
    -- Por ejemplo, podrías buscar un objeto específico en la base del jugador
    local basePart = player.Character:FindFirstChild("BasePart") -- Ajusta el nombre del objeto según sea necesario
    if basePart then
        return basePart.Position
    end
    return nil
end

-- Función para teletransportarse a la base del jugador
local function teleportToBase(player)
    local basePosition = findBasePosition(player)
    if basePosition then
        character:SetPrimaryPartCFrame(CFrame.new(basePosition))
    end
end

-- Función para robar Brainrots instantáneamente
local function instantSteal(player)
    -- Ajusta esta función para que robe los Brainrots del jugador
    -- Esto puede variar dependiendo de cómo esté configurado el juego
    -- Por ejemplo, podrías buscar un objeto específico que represente los Brainrots y eliminarlo
    local brainrotPart = player.Character:FindFirstChild("BrainrotPart") -- Ajusta el nombre del objeto según sea necesario
    if brainrotPart then
        brainrotPart:Destroy()
    end
end

-- Función principal para teletransportarse y robar
local function main()
    while true do
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                teleportToBase(player)
                instantSteal(player)
                wait(1) -- Espera 1 segundo antes de intentar con el siguiente jugador
            end
        end
        wait(5) -- Espera 5 segundos antes de volver a verificar
    end
end
