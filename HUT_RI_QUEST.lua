warn("Anti afk running")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    warn("Anti afk ran")
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

getfenv().grav = workspace.Gravity
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/ui%20libs2"))()

-- Flower Container
local flowerContainer = library:CreateWindow({
    text = "Flowers"
})

-- Bamboo Container
local bambooContainer = library:CreateWindow({
    text = "Bamboo"
})

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
        wait(0.5)
        -- Simulate holding key "E" for 7 seconds
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
        wait(7)  -- Hold "E" for 7 seconds
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
        wait(1)
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
