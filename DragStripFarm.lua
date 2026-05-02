-- Anti AFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):CaptureController()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- Race configs
local RACES = {
	{
		name       = "3/4 Mile Drag",
		stripName  = "DragStripThreeQuarterMile",
		queueCFrame = CFrame.new(349.992, 95, -6980.453),
		raceStart  = Vector3.new(556.04,   95, -6604.15),
		raceFinish = Vector3.new(-2041.64, 95, -7291.88),
	},
	{
		name       = "1/4 Mile Drag",
		stripName  = "DragStripQuarterMile",
		queueCFrame = CFrame.new(1741.692, 0.172, -1317.386),
		raceStart  = Vector3.new(1706.744, 61.644, -1018.918),
		raceFinish = Vector3.new(2078.106, 61.644, -491.13),
	},
}

local selectedRace = RACES[1]

-- UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DragStripFarm"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = plr.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 170)
frame.Position = UDim2.new(0.5, -110, 0, 15)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 28)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
titleBar.BorderSizePixel = 0
titleBar.Parent = frame
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 6)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
titleLabel.Text = "Drag Strip Farm"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 12
titleLabel.Parent = titleBar

-- Race selector label
local raceLabel = Instance.new("TextLabel")
raceLabel.Size = UDim2.new(1, -16, 0, 16)
raceLabel.Position = UDim2.new(0, 8, 0, 34)
raceLabel.BackgroundTransparency = 1
raceLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
raceLabel.TextXAlignment = Enum.TextXAlignment.Left
raceLabel.Text = "Race:"
raceLabel.Font = Enum.Font.Gotham
raceLabel.TextSize = 11
raceLabel.Parent = frame

-- Dropdown button
local dropBtn = Instance.new("TextButton")
dropBtn.Size = UDim2.new(1, -16, 0, 26)
dropBtn.Position = UDim2.new(0, 8, 0, 52)
dropBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dropBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
dropBtn.Text = selectedRace.name .. "  ▼"
dropBtn.Font = Enum.Font.Gotham
dropBtn.TextSize = 12
dropBtn.BorderSizePixel = 0
dropBtn.Parent = frame
Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 4)

-- Dropdown list (overlays controls below, hidden by default)
local dropList = Instance.new("Frame")
dropList.Size = UDim2.new(1, -16, 0, #RACES * 28)
dropList.Position = UDim2.new(0, 8, 0, 80)
dropList.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
dropList.BorderSizePixel = 0
dropList.Visible = false
dropList.ZIndex = 10
dropList.Parent = frame
Instance.new("UICorner", dropList).CornerRadius = UDim.new(0, 4)

for i, race in ipairs(RACES) do
	local opt = Instance.new("TextButton")
	opt.Size = UDim2.new(1, 0, 0, 28)
	opt.Position = UDim2.new(0, 0, 0, (i - 1) * 28)
	opt.BackgroundTransparency = 1
	opt.TextColor3 = Color3.fromRGB(220, 220, 220)
	opt.Text = race.name
	opt.Font = Enum.Font.Gotham
	opt.TextSize = 12
	opt.ZIndex = 11
	opt.Parent = dropList
	opt.MouseButton1Click:Connect(function()
		selectedRace = race
		dropBtn.Text = race.name .. "  ▼"
		dropList.Visible = false
	end)
end

dropBtn.MouseButton1Click:Connect(function()
	dropList.Visible = not dropList.Visible
end)

-- Speed input
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -16, 0, 16)
speedLabel.Position = UDim2.new(0, 8, 0, 86)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Text = "Race Speed (studs/s):"
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 11
speedLabel.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(1, -16, 0, 26)
speedBox.Position = UDim2.new(0, 8, 0, 104)
speedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBox.PlaceholderText = "e.g. 500"
speedBox.Text = "500"
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 13
speedBox.BorderSizePixel = 0
speedBox.ClearTextOnFocus = false
speedBox.Parent = frame
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0, 4)

-- Toggle button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(1, -16, 0, 30)
toggleBtn.Position = UDim2.new(0, 8, 0, 134)
toggleBtn.BackgroundColor3 = Color3.fromRGB(180, 45, 45)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Text = "OFF"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 14
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = frame
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 5)

-- Draggable
local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)
UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

-- Helpers
getfenv().dragfarm = false

local function getSpeed()
	return tonumber(speedBox.Text) or 500
end

local function getCar()
	local chr = plr.Character
	local car = chr.Humanoid.SeatPart.Parent.Parent
	return car, car.PrimaryPart
end

local function getActiveValue()
	local races = workspace:FindFirstChild("Races")
	if not races then
		warn("[DragFarm] workspace.Races not found")
		return nil
	end
	local strip = races:FindFirstChild(selectedRace.stripName)
	if not strip then
		warn("[DragFarm] " .. selectedRace.stripName .. " not found inside workspace.Races")
		return nil
	end
	local active = strip:FindFirstChild("Active")
	if not active then
		warn("[DragFarm] Active not found inside " .. selectedRace.stripName)
		return nil
	end
	return active
end

local function isRaceActive()
	local active = getActiveValue()
	return active ~= nil and active.Value == true
end

local function stopCarVelocity(car, carp)
	carp.Anchored = true
	for _, part in pairs(car:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Velocity = Vector3.new(0, 0, 0)
			part.RotVelocity = Vector3.new(0, 0, 0)
		end
	end
	task.wait(0.1)
	carp.Anchored = false
end

local function teleportToQueue()
	local car, carp = getCar()
	local targetCFrame = selectedRace.queueCFrame
	local targetPos = targetCFrame.Position
	local attempts = 0

	repeat
		attempts += 1

		for _, part in pairs(car:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Velocity = Vector3.new(0, 0, 0)
				part.RotVelocity = Vector3.new(0, 0, 0)
			end
		end

		car:PivotTo(targetCFrame)
		carp.Anchored = true
		task.wait(0.5)

		for _, part in pairs(car:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Velocity = Vector3.new(0, 0, 0)
				part.RotVelocity = Vector3.new(0, 0, 0)
			end
		end

		carp.Anchored = false
		task.wait(0.2)

		local dist = (carp.Position - targetPos).Magnitude
		warn(string.format("[DragFarm] Queue check — dist from target: %.1f studs (attempt %d)", dist, attempts))

		if dist <= 20 then
			warn("[DragFarm] Position verified. Waiting in queue...")
			return true
		end

		warn("[DragFarm] Off target — retrying teleport...")
		task.wait(0.5)

	until attempts >= 5

	warn("[DragFarm] Failed to reach queue after 5 attempts")
	return false
end

local function waitForRaceStart()
	warn("[DragFarm] Waiting for queue idle (Active = false)...")
	local clearTimeout = tick()
	repeat
		task.wait(0.5)
	until not isRaceActive() or tick() - clearTimeout > 20 or getfenv().dragfarm == false

	if not getfenv().dragfarm then return false end
	warn("[DragFarm] Queue idle — waiting for Active to become true...")

	local active = getActiveValue()
	if active then
		local started = false
		local conn = active.Changed:Connect(function(val)
			if val == true then started = true end
		end)

		local startTimeout = tick()
		repeat task.wait(0.1)
		until started or tick() - startTimeout > 90 or getfenv().dragfarm == false

		conn:Disconnect()

		if started then
			warn("[DragFarm] Race started (Active = true) — waiting 6s before driving...")
			task.wait(6)
			return true
		end
	else
		warn("[DragFarm] Active value not found in workspace")
	end

	warn("[DragFarm] Race did not start within 90s — re-queuing")
	return false
end

local function waitForRaceFinish()
	warn("[DragFarm] Waiting for race to finish (Active = false)...")
	local active = getActiveValue()
	if active then
		-- Already false — no need to wait
		if active.Value == false then
			warn("[DragFarm] Race already finished")
			return
		end

		local finished = false
		local conn = active.Changed:Connect(function(val)
			if val == false then finished = true end
		end)

		-- Double-check after connecting in case we raced the event
		if active.Value == false then finished = true end

		local timeout = tick()
		repeat task.wait(0.1)
		until finished or tick() - timeout > 60 or getfenv().dragfarm == false

		conn:Disconnect()
	else
		task.wait(5)
	end
	warn("[DragFarm] Race finished (Active = false)")
end

local function runRace()
	local car, carp = getCar()
	if not waitForRaceStart() then return end
	if not getfenv().dragfarm then return end

	task.wait(0.5)
	warn("[DragFarm] Race live — driving to finish")

	car, carp = getCar()
	local speed = getSpeed()
	local rStart  = selectedRace.raceStart
	local rFinish = selectedRace.raceFinish
	local dir = (rFinish - rStart).Unit
	local trackDist = (rFinish - rStart).Magnitude
	local duration = trackDist / speed

	warn(string.format("[DragFarm] Race: %s  |  Speed: %d studs/s  |  ETA: %.1fs", selectedRace.name, speed, duration))

	local tweenValue = Instance.new("CFrameValue")
	tweenValue.Value = car:GetPrimaryPartCFrame()
	tweenValue.Changed:Connect(function()
		car:PivotTo(tweenValue.Value)
	end)

	local finishCFrame = CFrame.new(rFinish, rFinish + dir)
	local tween = TweenService:Create(
		tweenValue,
		TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
		{Value = finishCFrame}
	)
	tween:Play()

	local boostActive = true
	task.spawn(function()
		while boostActive and getfenv().dragfarm do
			task.wait()
			pcall(function() carp.Velocity = dir * speed end)
		end
	end)

	tween.Completed:Wait()

	boostActive = false
	stopCarVelocity(car, carp)

	waitForRaceFinish()
	warn("[DragFarm] Race complete — looping")
	task.wait(1)
end

local loopRunning = false

local function mainLoop()
	if loopRunning then
		warn("[DragFarm] Loop already running — ignoring duplicate start")
		return
	end
	loopRunning = true
	warn("[DragFarm] Started — " .. selectedRace.name)
	while getfenv().dragfarm do
		local ok, result = pcall(teleportToQueue)
		if ok and result then
			pcall(runRace)
		else
			warn("[DragFarm] Teleport failed — retrying in 3s")
			task.wait(3)
		end
	end
	loopRunning = false
	warn("[DragFarm] Stopped")
end

toggleBtn.MouseButton1Click:Connect(function()
	getfenv().dragfarm = not getfenv().dragfarm
	if getfenv().dragfarm then
		toggleBtn.Text = "ON"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(45, 180, 45)
		task.spawn(mainLoop)
	else
		toggleBtn.Text = "OFF"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(180, 45, 45)
	end
end)
