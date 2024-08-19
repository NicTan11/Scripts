warn("Anti afk running")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    warn("Anti afk ran")
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

getfenv().grav = workspace.Gravity
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/ui%20libs2"))()

-- Minigame Container
local minigameContainer = library:CreateWindow({
    text = "Minigame"
})

-- Flower Container
local flowerContainer = library:CreateWindow({
    text = "Flowers"
})

-- Bamboo Container
local bambooContainer = library:CreateWindow({
    text = "Bamboo"
})

-- Box Functions Container
local boxContainer = library:CreateWindow({
    text = "Boxes"
})

-- Function to join the minigame
local function joinMinigame()
    local args = {
        [1] = "Enter",
        [2] = "2021Avanza15CVT"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("Minigames"):FireServer(unpack(args))
end

-- Function to simulate pressing and releasing the "Space" key
local function pressSpace()
    pcall(function()
        -- Simulate pressing "Space"
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
        wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, game)
    end)
end

-- Button to join the minigame
minigameContainer:AddButton("Join Minigame", joinMinigame)

-- Toggle for key presses
local toggleMovement = false

minigameContainer:AddToggle("Toggle Movement", function(state)
    toggleMovement = state
    while toggleMovement do
        wait(5)
        pressSpace()
    end
end)

-- Function to teleport to the minigame NPC and start the minigame
local function startAutoMinigame()
    for _, v in pairs(workspace.Etc.NPC:GetChildren()) do
        if v.Name == "Minigame" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot + Vector3.new(0, 5, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            wait(0.5)
            -- Simulate key press to engage the action
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
            wait(1)
            break
        end
    end
end

-- Button to start the auto minigame process
minigameContainer:AddButton("Start Auto Minigame", startAutoMinigame)

-- Function to teleport to flowers and collect them indefinitely
local function collectFlowers()
    while true do
        for _, flower in pairs(workspace.Event.Items:GetChildren()) do
            if flower.Name == "Flower" then
                -- Teleport to flower and hold "E" for 5 seconds
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = flower.WorldPivot + Vector3.new(0, 5, 0)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                wait(0.3)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                wait(0.3)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                wait(3)  -- Hold "E" for 5 seconds
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                wait(0.3)
            end
        end
    end
end

-- Button to start collecting flowers
flowerContainer:AddToggle("Collect Flowers", function(state)
    if state then
        collectFlowers()
    end
end)

-- Bamboo Functionality
local selectedBamboo = "Bamboo1"  -- Default Bamboo

-- Function to teleport to a specific Bamboo based on user input
local function teleportToBamboo(bambooName)
    local bamboo = workspace.Event.Items:FindFirstChild(bambooName)
    if bamboo then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = bamboo.WorldPivot + Vector3.new(0, 5, 0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        wait(3)
        -- Simulate holding key "E" for 7 seconds
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
        wait(7)  -- Hold "E" for 7 seconds
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
        wait(0.3)
    else
        warn("Bamboo not found: " .. bambooName)
    end
end

-- Function to teleport to bamboos sequentially
local function autoBamboo()
    for i = 1, 10 do
        local bambooName = "Bamboo" .. i
        teleportToBamboo(bambooName)
    end
end

-- Function to teleport to the minigame NPC and start the minigame
local function startMonasQuest()
    for _, v in pairs(workspace.Event.NPC:GetChildren()) do
        if v.Name == "DA0ZA" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot + Vector3.new(0, 5, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            wait(0.5)
            -- Simulate key press to engage the action
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
            wait(1)
            break
        end
    end
end

-- Text box to select which Bamboo to teleport to
bambooContainer:AddBox("Enter Bamboo Name", function(object, focus)
    if focus then
        selectedBamboo = object.Text
    end
end)

-- Button to teleport to the selected Bamboo
bambooContainer:AddToggle("Teleport to Selected Bamboo", function(state)
    if state then
        teleportToBamboo(selectedBamboo)
    end
end)

-- Button to start the auto Bamboo process
bambooContainer:AddToggle("Start Auto Bamboo", function(state)
    if state then
        autoBamboo()
    end
end)

-- Button to start the Monas Quest
bambooContainer:AddButton("Monas Quest Starter", startMonasQuest)

-- Box-related Functions

-- Function to claim the box
local function claimBox()
    local args = {
        [1] = "Claim"
    }
    game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Box:FireServer(unpack(args))
end

-- Function to buy the limited box
local function buyLimitedBox()
    local args = {
        [1] = "Buy",
        [2] = "Limited Box"
    }
    game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Box:FireServer(unpack(args))
end

-- Function to buy the minigame box
local function buyMinigameBox()
    local args = {
        [1] = "Buy",
        [2] = "Minigame Box"
    }
    game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Box:FireServer(unpack(args))
end

-- Adding buttons to the boxContainer
boxContainer:AddButton("Claim Box", claimBox)
boxContainer:AddButton("Buy Limited Box", buyLimitedBox)
boxContainer:AddButton("Buy Minigame Box", buyMinigameBox)

