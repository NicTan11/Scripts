-- Simplified Drive World Script
print("Loading Drive World - Simplified Version...")

-- Basic Anti-AFK (with error handling)
spawn(function()
    pcall(function()
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):ClickButton2(Vector2.new())
        end)
        print("Anti-AFK enabled")
    end)
end)

-- Basic tween function
local function simpleTween(vehicle, targetCFrame, speed)
    if not vehicle or not vehicle.PrimaryPart then return end
    
    speed = speed or 300
    local distance = (vehicle.PrimaryPart.Position - targetCFrame.Position).magnitude
    local duration = distance / speed
    
    local TweenService = game:GetService("TweenService")
    local TweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    
    local tween = TweenService:Create(vehicle.PrimaryPart, TweenInfo, {CFrame = targetCFrame})
    tween:Play()
    
    return tween
end

-- Simple UI creation
print("Creating simple UI...")

-- Create simple ScreenGui instead of external library
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DriveWorldGUI"
screenGui.Parent = playerGui

-- Create main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0, 50, 0, 50)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.new(1, 1, 1)
mainFrame.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Drive World - Simple"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
title.BorderSizePixel = 0
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.Parent = mainFrame

-- Simple button function
local function createButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 25)
    button.Position = position
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    button.BorderSizePixel = 1
    button.BorderColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    button.Parent = mainFrame
    
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Variables
local driveActive = false
local airActive = false

-- Helper functions
local function getVehicle()
    local success, result = pcall(function()
        return game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent
    end)
    return success and result or nil
end

-- Auto Farm Drive
local driveButton = createButton("Auto Farm [Drive]: OFF", UDim2.new(0.05, 0, 0, 40), function()
    driveActive = not driveActive
    driveButton.Text = "Auto Farm [Drive]: " .. (driveActive and "ON" or "OFF")
    driveButton.BackgroundColor3 = driveActive and Color3.new(0, 0.7, 0) or Color3.new(0.3, 0.3, 0.3)
    
    if driveActive then
        spawn(function()
            while driveActive do
                local vehicle = getVehicle()
                if vehicle then
                    -- Create driving platform
                    if not workspace:FindFirstChild("DrivePlatform") then
                        local platform = Instance.new("Part")
                        platform.Name = "DrivePlatform"
                        platform.Size = Vector3.new(5000, 10, 5000)
                        platform.Position = Vector3.new(0, 5000, 0)
                        platform.Anchored = true
                        platform.Parent = workspace
                    end
                    
                    local platform = workspace:FindFirstChild("DrivePlatform")
                    if platform then
                        simpleTween(vehicle, platform.CFrame + Vector3.new(0, 20, 0), 400)
                        wait(2)
                        
                        -- Add velocity for farming
                        if vehicle.PrimaryPart then
                            vehicle.PrimaryPart.AssemblyLinearVelocity = vehicle.PrimaryPart.CFrame.LookVector * 500
                        end
                    end
                end
                wait(1)
            end
        end)
    end
end)

-- Auto Farm Air
local airButton = createButton("Auto Farm [Air]: OFF", UDim2.new(0.05, 0, 0, 75), function()
    airActive = not airActive
    airButton.Text = "Auto Farm [Air]: " .. (airActive and "ON" or "OFF")
    airButton.BackgroundColor3 = airActive and Color3.new(0, 0.7, 0) or Color3.new(0.3, 0.3, 0.3)
    
    if airActive then
        spawn(function()
            while airActive do
                local vehicle = getVehicle()
                if vehicle then
                    -- Air farming logic
                    if not workspace:FindFirstChild("AirPlatform") then
                        local platform = Instance.new("Part")
                        platform.Name = "AirPlatform"
                        platform.Size = Vector3.new(5000, 10, 5000)
                        platform.Position = Vector3.new(0, 8000, 0)
                        platform.Anchored = true
                        platform.Parent = workspace
                    end
                    
                    local platform = workspace:FindFirstChild("AirPlatform")
                    if platform then
                        simpleTween(vehicle, platform.CFrame + Vector3.new(0, 50, 500), 600)
                        wait(3)
                        
                        -- Air velocity
                        if vehicle.PrimaryPart then
                            vehicle.PrimaryPart.Velocity = vehicle.PrimaryPart.CFrame.LookVector * 700
                            vehicle.PrimaryPart.Velocity = vehicle.PrimaryPart.Velocity + Vector3.new(0, 100, 0)
                        end
                    end
                end
                wait(2)
            end
        end)
    end
end)

-- Test button
createButton("Test Script", UDim2.new(0.05, 0, 0, 110), function()
    print("Script is working!")
    local vehicle = getVehicle()
    if vehicle then
        print("Vehicle found:", vehicle.Name)
    else
        print("No vehicle found - make sure you're in a car")
    end
end)

print("Drive World - Simplified Version loaded successfully!")
print("Click the buttons to test functionality") 