warn("Anti afk running")
game:GetService("Players").LocalPlayer.Idled:connect(function()
warn("Anti afk ran")
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'FireServer' and self.Name == "TrackOffroadTimer" then
return;
	end
	return namecall(self, ...) 
end)

getfenv().grav = workspace.Gravity
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/ui%20libs2"))()
local example = library:CreateWindow({
  text = "Drive World"
})
example:AddToggle("Auto Farm [Drive]", function(state)
    getfenv().drive = (state and true or false)
    while getfenv().drive do
       local plr = game.Players.LocalPlayer
    local chr = plr.Character
    local car = chr.Humanoid.SeatPart.Parent.Parent
    local carp = car.PrimaryPart
       if not workspace:FindFirstChild("carautopart") then
          local new = Instance.new("Part",workspace)
          new.Name = "carautopart"
          new.Position = chr.HumanoidRootPart.Position+Vector3.new(-1157.3995361328125, 7.028332710266113, 942.1002197265625)
          new.Anchored = true
          new.Size = Vector3.new(10000,10,10000)
          end
          workspace:FindFirstChild("carautopart").Velocity = Vector3.new(0,0,0)
    local plr = game.Players.LocalPlayer
    local chr = plr.Character
    local car = chr.Humanoid.SeatPart.Parent.Parent
    local carp = car.PrimaryPart
    car:PivotTo(workspace:FindFirstChild("carautopart").CFrame+Vector3.new(0,5,0))
    task.wait(6)
    carp.Velocity = carp.CFrame.LookVector*600
    end
    end)
   example:AddToggle("Auto Farm [Air]", function(state)
      getfenv().air = (state and true or false)
      while getfenv().air do
         while getfenv().air do
            local plr = game.Players.LocalPlayer
         local chr = plr.Character
         local car = chr.Humanoid.SeatPart.Parent.Parent
         local carp = car.PrimaryPart
            if not workspace:FindFirstChild("carautopart") then
               local new = Instance.new("Part",workspace)
               new.Name = "carautopart"
               new.Position = chr.HumanoidRootPart.Position+Vector3.new(0,5000,0)
               new.Anchored = true
               new.Size = Vector3.new(10000,10,10000)
               end
               workspace:FindFirstChild("carautopart").Velocity = Vector3.new(0,0,0)
               local plr = game.Players.LocalPlayer
               local chr = plr.Character
               local car = chr.Humanoid.SeatPart.Parent.Parent
               local carp = car.PrimaryPart
               car:PivotTo(workspace:FindFirstChild("carautopart").CFrame*CFrame.new(0,15,500))
               carp.Velocity=carp.CFrame.LookVector*700
               carp.Velocity = carp.Velocity+Vector3.new(0,100,0)
               task.wait(2)
               pcall(function()
                  local text = game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Score.TotalScore.Text:split("$")
               local text2 = text[2]:split("<")
               local text3 = string.gsub(text2[1],",","")
               local num = tonumber(text3)
               if num > 60000 then
                  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
               repeat wait()
                  local text = game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Score.TotalScore.Text:split("$")
                  local text2 = text[2]:split("<")
               local text3 = string.gsub(text2[1],",","")
               local num = tonumber(text3)
               print(num)
               until num == 0 or getfenv().autodrift == false
               game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
               end
                  end)
               end
           
      end
      end)
-- Auto Nitrous toggle
example:AddToggle("Auto Nitrous", function(state)
   getfenv().autonitrous = (state and true or false)
   while getfenv().autonitrous do
       local args = {
           [1] = 2.0208334662020206
       }
       game:GetService("ReplicatedStorage"):WaitForChild("Systems"):WaitForChild("CarInteraction"):WaitForChild("TrackNitrousTime"):FireServer(unpack(args))
       wait(1) -- Loop every 1 second
   end
end)
example:AddToggle("Auto Farm [Drift]", function(state)
   getfenv().autodrift = (state and true or false)
while getfenv().autodrift do
   task.wait()
local plr = game.Players.LocalPlayer
local chr = plr.Character
local car = chr.Humanoid.SeatPart.Parent.Parent
local carp = car.PrimaryPart
if not workspace:FindFirstChild("carautopart") then
local new = Instance.new("Part",workspace)
new.Name = "carautopart"
new.Position = chr.HumanoidRootPart.Position+Vector3.new(0,5000,0)
new.Anchored = true
new.Size = Vector3.new(10000,10,10000)
end
   pcall(function()
   local text = game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Score.TotalScore.Text:split("$")
local text2 = text[2]:split("<")
local text3 = string.gsub(text2[1],",","")
local num = tonumber(text3)
if num > 60000 then
   game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
repeat wait()
   local text = game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Score.TotalScore.Text:split("$")
   local text2 = text[2]:split("<")
local text3 = string.gsub(text2[1],",","")
local num = tonumber(text3)
print(num)
until num == 0 or getfenv().autodrift == false
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end
   end)
if type(num) == "number" then
   val = num
end
car:PivotTo(workspace:FindFirstChild("carautopart").CFrame+Vector3.new(0,5,0))
workspace:FindFirstChild("carautopart").Velocity = chr.HumanoidRootPart.CFrame.LookVector*1500
task.wait(0.1)
end
end)
local example = library:CreateWindow({
   text = "Delivery"
 })
 example:AddLabel("Distance to deliver goods", function(object, focus)
 end)
 example:AddBox("Enter Minimum Distance", function(object, focus)
	if focus then
		getfenv().mdistance = tonumber(object.Text)
	end
end)
example:AddLabel("Select Delivering Method", function(object, focus)
end)
example:AddDropdown({"Teleport","Tweening"},function(state)
   print(state)
getfenv().methodt = state
 end)
example:AddToggle("Auto Delivery[Trailer]", function(state)
   getfenv().test = (state and true or false)
while getfenv().test do
   wait()
if game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Jobs.Visible == false then
	local chosenone = nil
	local smaller = 0
	repeat wait()
	for i2,v2 in pairs(game:GetService("Workspace").Jobs.TrailerDelivery.StartPoints:GetChildren()) do
	  if chosenone == nil then
	  local p,call =	pcall(function()
	local payment = 0
	local data =game:GetService("ReplicatedStorage").Systems.Jobs.RequestJobStart:InvokeServer(v2.Parent.Parent, v2)
	local test = {data}
	warn(v2)
	for i,v in pairs(test) do
	if type(v) == "table" and chosenone == nil then
	   task.wait()
	   for a,b in pairs(v) do
		  if a == "DestinationPoint" and (v2:GetAttribute("LocationCFrame").Position-b:GetAttribute("LocationCFrame").Position).magnitude > getfenv().mdistance*3.571 then
			 print((v2:GetAttribute("LocationCFrame").Position-b:GetAttribute("LocationCFrame").Position).magnitude*3.571)
	warn(a,b:GetFullName())
	chosenone = v2
	break
	end
	end
  end
	end
	end)
	if p == false then
	warn(p,call)
	end
  end
	end
until chosenone ~= nil or getfenv().test == false
game:GetService("ReplicatedStorage").Systems.Jobs.StartJob:InvokeServer(workspace.Jobs.TrailerDelivery, chosenone)
repeat  wait()
   print("waiting for trailer")
until game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:FindFirstChild("Trailer") or getfenv().test == false

local failnum = 0
repeat wait()
   failnum = failnum +1
   print("waiting for CompletionRegion")
if failnum > 100 then
game:GetService("ReplicatedStorage").Systems.Jobs.QuitJob:InvokeServer()
task.wait()
end
until game:GetService("Workspace"):FindFirstChild("CompletionRegion") or getfenv().test == false or failnum > 100
if game:GetService("Workspace"):FindFirstChild("CompletionRegion") then
   if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-game:GetService("Workspace").CompletionRegion.Primary.Position).magnitude < getfenv().mdistance*3.571 then
      game:GetService("ReplicatedStorage").Systems.Jobs.QuitJob:InvokeServer()
task.wait()
   end
end
pcall(function()
   game.Players.LocalPlayer.Character.Head.Anchored = true
   task.wait(1.5)
   game.Players.LocalPlayer.Character.Head.Anchored = false
   end)
wait()
if game:GetService("Workspace"):FindFirstChild("CompletionRegion") then
local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-game:GetService("Workspace").CompletionRegion.Primary.Position).magnitude
if tonumber(dist/500) > 7 then
   print("Delivery Distance:"..tonumber(dist/3.571).." meters away")
print("Delivery ETA:"..tonumber(dist/500).." seconds")
if getfenv().methodt == "Teleport" then
task.wait(dist/500)
elseif getfenv().methodt == "Tweening" then
   for i,v in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
      if v.Name == "Owner" and v.Value == game.Players.LocalPlayer then
   local TweenService = game:GetService("TweenService")
   local TweenInfoToUse = TweenInfo.new(dist/500, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
   
   local TweenValue = Instance.new("CFrameValue")
   TweenValue.Value = v.Parent:GetPrimaryPartCFrame()
            
   TweenValue.Changed:Connect(function()
      v.Parent:SetPrimaryPartCFrame(TweenValue.Value)
   end)
            
   local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=game:GetService("Workspace").CompletionRegion.Primary.CFrame})
   OnTween:Play()
    OnTween.Completed:Wait()
   end
   end
end
else
   print("Delivery Distance:"..tonumber(dist/3.571).." meters away")
print("Delivery ETA set to:"..tonumber(7).." seconds due to it being too low")
if getfenv().methodt == "Teleport" then
   task.wait(7)
   elseif getfenv().methodt == "Tweening" then
      for i,v in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
         if v.Name == "Owner" and v.Value == game.Players.LocalPlayer then
      local TweenService = game:GetService("TweenService")
      local TweenInfoToUse = TweenInfo.new(7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
      
      local TweenValue = Instance.new("CFrameValue")
      TweenValue.Value = v.Parent:GetPrimaryPartCFrame()
               
      TweenValue.Changed:Connect(function()
         v.Parent:SetPrimaryPartCFrame(TweenValue.Value)
      end)
               
      local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=game:GetService("Workspace").CompletionRegion.Primary.CFrame})
      OnTween:Play()
       OnTween.Completed:Wait()
      end
      end
   end
end
end
elseif game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Jobs.Visible == true then
for i,v in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
   if v.Name == "Owner" and v.Value == game.Players.LocalPlayer then
repeat task.wait()
   pcall(function()
   v.Parent:PivotTo(game:GetService("Workspace").CompletionRegion.Primary.CFrame*CFrame.new(0,5,-20))
v.Parent.Trailer:PivotTo(game:GetService("Workspace").CompletionRegion.Primary.CFrame*CFrame.new(0,5,0))
   end)
    until not v.Parent:FindFirstChild("Trailer") or getfenv().test == false
game:GetService("ReplicatedStorage").Systems.Jobs.CashBankedEarnings:FireServer()
task.wait()
end
end
end
end
end)
example:AddToggle("Auto Delivery[Trucking]", function(state)
getfenv().test2 = (state and true or false)
while getfenv().test2 do
   if game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Jobs.Visible == false then
      local num = math.random(1,#workspace.Jobs.Trucking.StartPoints:GetChildren())
	  local chosenone = nil
	  local smaller = 0
	  repeat wait()
	  for i2,v2 in pairs(game:GetService("Workspace").Jobs.Trucking.StartPoints:GetChildren()) do
		if chosenone == nil then
		local p,call =	pcall(function()
	  local payment = 0
	  local data =game:GetService("ReplicatedStorage").Systems.Jobs.RequestJobStart:InvokeServer(v2.Parent.Parent, v2)
	  local test = {data}
	  warn(v2)
	  for i,v in pairs(test) do
	  if type(v) == "table" and chosenone == nil then
		 task.wait()
		 for a,b in pairs(v) do
			if a == "DestinationPoint" and (v2:GetAttribute("LocationCFrame").Position-b:GetAttribute("LocationCFrame").Position).magnitude > getfenv().mdistance*3.571 then
			   print((v2:GetAttribute("LocationCFrame").Position-b:GetAttribute("LocationCFrame").Position).magnitude*3.571)
	  warn(a,b:GetFullName())
	  chosenone = v2
	  break
	  end
	  end
	end
	  end
	  end)
	  if p == false then
	  warn(p,call)
	  end
	end
	  end
	until chosenone ~= nil or getfenv().test2 == false
  game:GetService("ReplicatedStorage").Systems.Jobs.StartJob:InvokeServer(workspace.Jobs.Trucking, chosenone)
  repeat  wait()
     print("waiting for trailer")
  until game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:FindFirstChild("Trailer") or getfenv().test2 == false
  task.wait()
  local failnum = 0
  repeat wait()
     failnum = failnum +1
     print("waiting for CompletionRegion")
  if failnum > 100 then
   warn("attempt fix in motion")
  game:GetService("ReplicatedStorage").Systems.Jobs.QuitJob:InvokeServer()
  wait(task.wait())
  end
  until game:GetService("Workspace"):FindFirstChild("CompletionRegion") or getfenv().test2 == false or failnum > 100
  wait()
  if game:GetService("Workspace"):FindFirstChild("CompletionRegion") then
   if (chosenone:GetAttribute("LocationCFrame").Position-game:GetService("Workspace").CompletionRegion.Primary.Position).magnitude < getfenv().mdistance*3.571 then
      game:GetService("ReplicatedStorage").Systems.Jobs.QuitJob:InvokeServer()
task.wait()
   end
end
pcall(function()
   game.Players.LocalPlayer.Character.Head.Anchored = true
   task.wait(1.5)
   game.Players.LocalPlayer.Character.Head.Anchored = false
   end)
   if game:GetService("Workspace"):FindFirstChild("CompletionRegion") then
      local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-game:GetService("Workspace").CompletionRegion.Primary.Position).magnitude
      if tonumber(dist/500) > 7 then
         print("Delivery Distance:"..tonumber(dist/3.571).." meters away")
      print("Delivery ETA:"..tonumber(dist/500).." seconds")
      if getfenv().methodt == "Teleport" then
      task.wait(dist/500)
      elseif getfenv().methodt == "Tweening" then
         for i,v in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
            if v.Name == "Owner" and v.Value == game.Players.LocalPlayer then
         local TweenService = game:GetService("TweenService")
         local TweenInfoToUse = TweenInfo.new(dist/500, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
         
         local TweenValue = Instance.new("CFrameValue")
         TweenValue.Value = v.Parent:GetPrimaryPartCFrame()
                  
         TweenValue.Changed:Connect(function()
            v.Parent:SetPrimaryPartCFrame(TweenValue.Value)
         end)
                  
         local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=game:GetService("Workspace").CompletionRegion.Primary.CFrame})
         OnTween:Play()
          OnTween.Completed:Wait()
         end
         end
      end
      else
         print("Delivery Distance:"..tonumber(dist/3.571).." meters away")
      print("Delivery ETA set to:"..tonumber(7).." seconds due to it being too low")
      if getfenv().methodt == "Teleport" then
         task.wait(7)
         elseif getfenv().methodt == "Tweening" then
            for i,v in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
               if v.Name == "Owner" and v.Value == game.Players.LocalPlayer then
            local TweenService = game:GetService("TweenService")
            local TweenInfoToUse = TweenInfo.new(7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
            
            local TweenValue = Instance.new("CFrameValue")
            TweenValue.Value = v.Parent:GetPrimaryPartCFrame()
                     
            TweenValue.Changed:Connect(function()
               v.Parent:SetPrimaryPartCFrame(TweenValue.Value)
            end)
                     
            local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=game:GetService("Workspace").CompletionRegion.Primary.CFrame})
            OnTween:Play()
             OnTween.Completed:Wait()
            end
            end
         end
      end
      end
elseif game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Jobs.Visible == true then
for i,v in pairs(game:GetService("Workspace").Cars:GetDescendants()) do
   if v.Name == "Owner" and v.Value == game.Players.LocalPlayer then
repeat task.wait()
   pcall(function()
   v.Parent:PivotTo(game:GetService("Workspace").CompletionRegion.Primary.CFrame*CFrame.new(0,5,-30))
v.Parent.Trailer:PivotTo(game:GetService("Workspace").CompletionRegion.Primary.CFrame*CFrame.new(0,5,0))
   end)
    until not v.Parent:FindFirstChild("Trailer") or getfenv().test2 == false
game:GetService("ReplicatedStorage").Systems.Jobs.CashBankedEarnings:FireServer()
task.wait()
end
end
end
end
end)
local example = library:CreateWindow({
   text = "Contracts"
 })
 local function getcontracts()
  local contracts = {}
  for i,v in pairs(workspace.Contracts:GetChildren()) do
   table.insert(contracts,v.Name)
  end
  return contracts
end
 example:AddDropdown(getcontracts(),function(state)
   print(state)
getfenv().contract = state
 end)
 example:AddToggle("Auto Complete Contract", function(state)
   getfenv().contracta = (state and true or false)
while getfenv().contracta do
   wait(3)
   local plr =game:GetService("Players").LocalPlayer
   local data = game:GetService("ReplicatedStorage").PlayerData[plr.Name]
   local wood = data.Wood.Value
   local steel = data.Steel.Value
   warn("Wood Amount: "..wood)
   warn("Steel Amount: "..steel)
game:GetService("ReplicatedStorage").Systems.Contracts.PrecalculateRoutes:InvokeServer()
   wait(2)
   game:GetService("ReplicatedStorage").Systems.Contracts.StartContract:InvokeServer(getfenv().contract)
   print("Contract Started")
   wait(10)
   game:GetService("ReplicatedStorage").Systems.Contracts.PickupCargo:InvokeServer()
   print("Got Cargo")
   if getfenv().contract == "Steel" then
      warn("waiting 35 seconds")
      local time = tick()
      repeat task.wait()
      until tick()-time >= 35 or getfenv().contracta == false
   elseif getfenv().contract == "Wood" then
      warn("waiting 70 seconds")
 local time = tick()
 repeat task.wait()
 until tick()-time >= 70 or getfenv().contracta == false
   end
   if getfenv().contracta  then
   game:GetService("ReplicatedStorage").Systems.Contracts.DropoffCargo:InvokeServer()
   warn("Completed")
   end
end
 end)
local example = library:CreateWindow({
   text = "Race Stuff"
 })
 example:AddBox("Enter Vehicle Speed", function(object, focus)
	if focus then
		getfenv().speed = tonumber(object.Text)
	end
end)
 example:AddToggle("Auto Farm [Race XP]", function(state)
   getfenv().xprace = (state and true or false)
   spawn(function()
while getfenv().xprace do
task.wait()
if game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Race.Visible == true and getfenv().lookat ~= nil then
local speed = getfenv().speed or 500

local plr = game.Players.LocalPlayer
local chr = plr.Character
local car = chr.Humanoid.SeatPart.Parent.Parent
local carp = car.PrimaryPart
carp.Velocity = getfenv().lookat.CFrame.LookVector*speed
end
end
   end)
   while getfenv().xprace do
      wait()
game:GetService("ReplicatedStorage").Systems.Races.StartTaskChallengeRace:FireServer("soloAroundTheWorld")  
 repeat wait()
   until game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Race.Visible == true or getfenv().xprace == false
   local plr = game.Players.LocalPlayer
   local chr = plr.Character
   local car = chr.Humanoid.SeatPart.Parent.Parent
   local carp = car.PrimaryPart
   repeat task.wait()
      local test = nil
      for i,v in pairs(workspace.Races:GetDescendants()) do
         if v.ClassName == "Model"  and v:FindFirstChild("Forcefield") and v:FindFirstChild("Forcefield").Transparency ~= 1  then
            local speed = getfenv().speed or 500
            getfenv().lookat = v:FindFirstChild("Forcefield")
            local plr = game.Players.LocalPlayer
            local chr = plr.Character
            local car = chr.Humanoid.SeatPart.Parent.Parent
            local carp = car.PrimaryPart
            local location = v:FindFirstChild("Forcefield").Position
            local dist = (carp.Position-location).magnitude
            print(dist/speed)
            local TweenService = game:GetService("TweenService")
            local TweenInfoToUse = TweenInfo.new(dist/speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
            
            local TweenValue = Instance.new("CFrameValue")
            TweenValue.Value = car:GetPrimaryPartCFrame()
                    
            TweenValue.Changed:Connect(function()
            car:PivotTo(TweenValue.Value)
            end)
            local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value= CFrame.new(location)})
            OnTween:Play()
            OnTween.Completed:Wait()
      end
      end
      until game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Race.Visible == false or getfenv().xprace == false or test == nil
      carp.Velocity = Vector3.new(0,0,0)
   end
end)
example:AddToggle("Auto Finish Race", function(state)
   getfenv().urace = (state and true or false)
   spawn(function()
      while getfenv().urace do
      task.wait()
      if game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Race.Visible == true and getfenv().lookat ~= nil then
      local speed = getfenv().speed or 500
      
      local plr = game.Players.LocalPlayer
      local chr = plr.Character
      local car = chr.Humanoid.SeatPart.Parent.Parent
      local carp = car.PrimaryPart
      carp.Velocity = getfenv().lookat.CFrame.LookVector*speed
      end
      end
         end)
   while getfenv().urace do
      wait()
  if game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Race.Visible == true then
   wait()
   local plr = game.Players.LocalPlayer
   local chr = plr.Character
   local car = chr.Humanoid.SeatPart.Parent.Parent
   local carp = car.PrimaryPart
   repeat task.wait()
      local test = nil
   for i,v in pairs(workspace.Races:GetDescendants()) do
      if v.ClassName == "Model"  and v:FindFirstChild("Forcefield") and v:FindFirstChild("Forcefield").Transparency ~= 1  then
         getfenv().lookat = v:FindFirstChild("Forcefield")
         local speed = getfenv().speed or 500
         local plr = game.Players.LocalPlayer
         local chr = plr.Character
         local car = chr.Humanoid.SeatPart.Parent.Parent
         local carp = car.PrimaryPart
         local location = v:FindFirstChild("Forcefield").Position
         local dist = (carp.Position-location).magnitude
         print(dist/speed)
         local TweenService = game:GetService("TweenService")
         local TweenInfoToUse = TweenInfo.new(dist/speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
         
         local TweenValue = Instance.new("CFrameValue")
         TweenValue.Value = car:GetPrimaryPartCFrame()
                 
         TweenValue.Changed:Connect(function()
         car:PivotTo(TweenValue.Value)
         end)
         local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value= CFrame.new(location)})
         OnTween:Play()
         OnTween.Completed:Wait()
   end
   end
   until game:GetService("Players").LocalPlayer.PlayerGui.Score.Frame.Race.Visible == false or getfenv().urace == false or test == nil
   carp.Velocity = Vector3.new(0,0,0)
end
   end
end)