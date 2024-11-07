warn("Anti afk running")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    warn("Anti afk ran")
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

getfenv().grav = workspace.Gravity
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/ui%20libs2"))()
local example = library:CreateWindow({
    text = "CDID"
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
example:AddButton("Join Minigame", joinMinigame)

-- Toggle for key presses
local toggleMovement = false

example:AddToggle("Toggle Movement", function(state)
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

-- Box Functions Container
local boxContainer = library:CreateWindow({
    text = "Boxes"
})

-- Button to start the auto minigame process
example:AddButton("Start Auto Minigame", startAutoMinigame)

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
