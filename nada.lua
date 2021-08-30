function Not(text, image, Title)
	local cor = coroutine.wrap(function()
		local sound = Instance.new("Sound", game.CoreGui)
		sound.SoundId = ""
		sound:Play()
		wait(4)
		sound:Destroy()
	end)
	cor()
	game.StarterGui:SetCore("SendNotification", {
		Title = Title;
		Text = text; 
		Icon = "rbxassetid://"..image;
		Duration = 7;
	})
end
local plr = game.Players.LocalPlayer
local AncientPOS = plr.Character.HumanoidRootPart.Position
local Player = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")

local sowd = getrawmetatable(game)
local sucks = sowd.__namecall
local player = game.Players.LocalPlayer
setreadonly(sowd, false)
sowd.__namecall = newcclosure(function(name, ...)
	local tabs = {...}
	if getnamecallmethod() == "FireServer"  and tostring(name) == "MainEvent" then
		if tabs[1] == "CHECKER_1" or tabs[1] == "TeleportDetect" or tabs[1] == "OneMoreTime" then
			--this is the anticheat, what a shame
			return wait(9e9)
		end
	end
	return sucks(name, unpack(tabs))
end)
setreadonly(sowd, true)

local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")


local LockedPlayer = nil
for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do

	if v.Name == "ScreenGui" then
		v:Destroy()
	end
end

function GetPlayer(String)
	local plr
	local strl = String:lower()
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Name:lower():sub(1, #String) == String:lower() then
			plr = v
		end 
	end
	if String == "me" then
		plr = game.Players.LocalPlayer
	end
	if String == "" or String == " " then
		plr = nil
	end
	return plr
end

local script = Instance.new('LocalScript', AntiBan)


local Players = game:GetService("Players") -- you should use GetService over game.Players!
for _, player in pairs(Players:GetPlayers()) do
	-- this code will run for all players
	if player.UserId == 163721789 or player.UserId == 15427717 or player.UserId == 8195210 or player.UserId == 28357488 or player.UserId == 17260230 or player.UserId == 201454243 or player.UserId == 179520654 then  
		wait(1)
		local plr = game:GetService('Players').LocalPlayer
		plr:Kick('KICKED TO AVOID ADMIN-BAN Thanks to Primos Script! (Admin in server) =)')

	else
		print('Safe')
	end
end


local AdminList = {
	163721789, -- JokeTheFool  
	15427717,  -- Sherosama      
	8195210,   -- Benoxa
	822999,    -- AStrongMuscle  
	28357488,  -- UziGarage    
	17260230,  -- NikoSenpai 
	201454243, -- Papa_Mbaye 
	1318185732, -- tuhklia 
	201454243,  -- Papa_Mbaye

}

game.Players.PlayerAdded:Connect(function(player)
	for i, v in pairs(AdminList) do
		if player.UserId == v then
			game.StarterGui:SetCore("SendNotification", {
				Title = "Anti-Ban";
				Text = "An admin has joined.. kicking!";
				Duration = 20;
			})
			wait(2)
			local plr = game:GetService('Players').LocalPlayer
			plr:Kick('KICKED TO AVOID ADMIN-BAN (Admin joined) =)')

		end
	end
end)

maus = game.Players.LocalPlayer:GetMouse()
maus.KeyDown:Connect(function(key)
	if key == "x" then
		if flying == false then
			flying = true


			local plr = game.Players.LocalPlayer
			local mouse = plr:GetMouse()

			localplayer = plr

			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end

			local Core = Instance.new("Part")
			Core.Name = "Core"
			Core.Size = Vector3.new(0.05, 0.05, 0.05)
			local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			spawn(function()
				Core.Parent = workspace
				local Weld = Instance.new("Weld", Core)
				Weld.Part0 = Core
				Weld.Part1 = localplayer.Character.LowerTorso
				Weld.C0 = CFrame.new(0, 0, 0)
			end)

			workspace:WaitForChild("Core")

			local torso = workspace.Core

			local speed=20
			local keys={a=false,d=false,w=false,s=false}
			local e1
			local e2
			local function start()
				local pos = Instance.new("BodyPosition",torso)
				local gyro = Instance.new("BodyGyro",torso)
				pos.Name="EPIXPOS"
				pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				pos.position = torso.Position
				gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				gyro.cframe = torso.CFrame
				repeat
					wait()
					hum.PlatformStand=true
					local new=gyro.cframe - gyro.cframe.p + pos.position
					if not keys.w and not keys.s and not keys.a and not keys.d then
						speed=10
					end
					if keys.w then
						new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
						speed=speed+0
					end
					if keys.s then
						new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
						speed=speed+0
					end
					if keys.d then
						new = new * CFrame.new(speed,0,0)
						speed=speed+0
					end
					if keys.a then
						new = new * CFrame.new(-speed,0,0)
						speed=speed+0
					end
					if speed>20 then
						speed=10
					end
					pos.position=new.p
					if keys.w then
						gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
					elseif keys.s then
						gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
					else
						gyro.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if gyro then gyro:Destroy() end
				if pos then pos:Destroy() end
				flying=false
				hum.PlatformStand=false
				speed=20
			end
			e1=mouse.KeyDown:connect(function(key)

				if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
				if key=="w" then
					keys.w=true
				elseif key=="s" then
					keys.s=true
				elseif key=="a" then
					keys.a=true
				elseif key=="d" then
					keys.d=true

				end
			end)
			e2=mouse.KeyUp:connect(function(key)

				if key=="w" then
					keys.w=false
				elseif key=="s" then
					keys.s=false
				elseif key=="a" then
					keys.a=false
				elseif key=="d" then
					keys.d=false
				end
			end)

			start()

		else
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			flying = false
		end


	end
end)


function tp(x,y,z)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x,y,z))
end

Not("Bienvenido a mi projecto, "..game.Players.LocalPlayer.Name ,4833645592, "Primos Script")
Not("Creador: ",4833645592, "$ keo#0002")

game.Players.LocalPlayer.Chatted:Connect(function(msg)
	local plr = game.Players.LocalPlayer

	elseif msg:sub(1, 8) == ".godblock" then
		gsPlayers = game:GetService("Players")
		gsWorkspace = game:GetService("Workspace")
		gsLighting = game:GetService("Lighting")
		gsReplicatedStorage = game:GetService("ReplicatedStorage")
		gsCoreGui = game:GetService("CoreGui")
		gsTween = game:GetService("TweenService")
		gsHttp = game:GetService("HttpService")
		LP = gsPlayers.LocalPlayer
		Mouse = LP:GetMouse()
		if LP.Character.BodyEffects:FindFirstChild("Defense") then
			LP.Character.BodyEffects.Defense:Destroy()
			local fucker = Instance.new("NumberValue",LP.Character.BodyEffects)
			fucker.Name = "Defense"
		end

		LP.CharacterAdded:Connect(function()
			repeat wait(0) until LP.Character:FindFirstChild("BodyEffects")
			repeat wait(0) until LP.Character.BodyEffects:FindFirstChild("Defense")
			repeat wait(0) until LP.Backpack:FindFirstChild("Combat")
			repeat wait(0) until LP.Character.BodyEffects:FindFirstChild("Dead")
			repeat wait(0) until LP.Character.BodyEffects:FindFirstChild("SpecialParts")

			LP.Character.ChildAdded:Connect(function()
				wait(0.3)
				for i,v in ipairs(LP.Character:GetDescendants()) do
					if v.Name == "Christmas_Sock" then v:Destroy()
					end
				end
			end)

			if LP.Character.BodyEffects:FindFirstChild("Defense") then
				LP.Character.BodyEffects.Defense:Destroy()
				local fucker = Instance.new("NumberValue",LP.Character.BodyEffects)
				fucker.Name = "Defense"
			end
		end)

		game.StarterGui:SetCore("SendNotification", {
			Title = "Primos Script"; -- the title (ofc)
			Text = "Godblock enabled Press [F]"; -- what the text says (ofc)
			Duration = 5; -- how long the notification should in secounds
		})
	elseif msg == ".godbullet"   then
		game.Players.LocalPlayer.Character.BodyEffects.Armor:Destroy()

	elseif msg:sub(1, 5) == ".tp" or msg:sub(1, 5) == ".to" then
		for i,v in pairs(game.Players:GetPlayers()) do 
			if v.Name:lower():sub(1,#msg:sub(7)) == msg:sub(7):lower() then
				local plr = v
				if plr.Character:FindFirstChild("Humanoid") then
					tp(plr.Character.UpperTorso.Position.X,plr.Character.UpperTorso.Position.Y,plr.Character.UpperTorso.Position.Z)
					break
				end
			end
		end


	elseif msg == ".fly" then
		Not("Press x to fly" ,4833645592, "Primos Script")

	elseif msg == ".head" then
		Not("Head removed" ,4833645592, "Primos Script")

		pcall(function()
			game.Players.LocalPlayer.Character.Head.Neck:Destroy()
			game.Players.LocalPlayer.Character.UpperTorso.NeckAttachment:Destroy()
			game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
			game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
			game.Players.LocalPlayer.Character.Head.Size = Vector3.new(0,0,0)
			game.Players.LocalPlayer.Character.Head.Massless = true
			game.Players.LocalPlayer.Character.Head.CanCollide = false

			heazd = true

			while heazd == true do 
				pcall(function()  
					game.Players.LocalPlayer.Character.Head.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
					game.Players.LocalPlayer.Character.UpperTorso.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
					game.Players.LocalPlayer.Character.Head.CFrame = CFrame.new(0, 100000.4736328125, 0)
				end)
				wait()
			end
		end)

		cashdrop = false

	elseif msg == ".headless" then
		Not("Head removed" ,4833645592, "Primos Script")

		pcall(function()
			game.Players.LocalPlayer.Character.Head.Neck:Destroy()
			game.Players.LocalPlayer.Character.UpperTorso.NeckAttachment:Destroy()
			game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
			game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
			game.Players.LocalPlayer.Character.Head.Size = Vector3.new(0,0,0)
			game.Players.LocalPlayer.Character.Head.Massless = true
			game.Players.LocalPlayer.Character.Head.CanCollide = false

			heazd = true

			while heazd == true do 
				pcall(function()  
					game.Players.LocalPlayer.Character.Head.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
					game.Players.LocalPlayer.Character.UpperTorso.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
					game.Players.LocalPlayer.Character.Head.CFrame = CFrame.new(0, 100000.4736328125, 0)
				end)
				wait()
			end
		end)

	elseif msg == ".bag all" then
		local bag = false
		bag = true
		repeat

			local cor = coroutine.wrap(function()
				if not game.Players.LocalPlayer.Character:FindFirstChild("[BrownBag]") then
					takingbag = true
					local cor = coroutine.wrap(function()
						game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-314.580566, 51.1788902, -727.484558))
					end)
					cor()			
					wait(1)
					fireclickdetector(workspace.Ignored.Shop["[BrownBag] - $25"].ClickDetector, 4)
					wait(0.5)
					game.Players.LocalPlayer.Backpack["[BrownBag]"].Parent = game.Players.LocalPlayer.Character
					takingbag = false
				end
			end)
			cor()
			if takingbag == false then
				for i, v  in pairs(game.Players:GetPlayers()) do
					if v.Character:FindFirstChild("Christmas_Sock") == nil and v.Character:FindFirstChildOfClass("ForceField") == nil and v.Character ~= game.Players.LocalPlayer.Character then
						local chars = v.Character
						if game.Players.LocalPlayer.Character:FindFirstChild("[BrownBag]") then
							game.Players.LocalPlayer.Character["[BrownBag]"]:Activate()
						end
						game.Players.LocalPlayer.Character:MoveTo(v.Character.UpperTorso.Position)
					end
					wait(0.005)
					bag = false
				end
			end
			wait()
		until bag == false
		bag = false

	elseif msg == ".bagall" then
		local bag = false
		bag = true
		repeat

			local cor = coroutine.wrap(function()
				if not game.Players.LocalPlayer.Character:FindFirstChild("[BrownBag]") then
					takingbag = true
					local cor = coroutine.wrap(function()
						game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-314.580566, 51.1788902, -727.484558))
					end)
					cor()			
					wait(1)
					fireclickdetector(workspace.Ignored.Shop["[BrownBag] - $25"].ClickDetector, 4)
					wait(0.5)
					game.Players.LocalPlayer.Backpack["[BrownBag]"].Parent = game.Players.LocalPlayer.Character
					takingbag = false
				end
			end)
			cor()
			if takingbag == false then
				for i, v  in pairs(game.Players:GetPlayers()) do
					if v.Character:FindFirstChild("Christmas_Sock") == nil and v.Character:FindFirstChildOfClass("ForceField") == nil and v.Character ~= game.Players.LocalPlayer.Character then
						local chars = v.Character
						if game.Players.LocalPlayer.Character:FindFirstChild("[BrownBag]") then
							game.Players.LocalPlayer.Character["[BrownBag]"]:Activate()
						end
						game.Players.LocalPlayer.Character:MoveTo(v.Character.UpperTorso.Position)
					end
					wait(0.005)
					bag = false
				end
			end
			wait()
		until bag == false
		bag = false

	elseif msg == ".nuke" then
		pcall(function()
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.Name == '[Grenade]' then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
		end)
		wait(.9)
		local targetpos = CFrame.new(108.995865, -26.7500305, -276.529877)
		local plr = game.Players.LocalPlayer
		local pos = plr.Character.HumanoidRootPart.Position
		if not game.Players.LocalPlayer.Character:FindFirstChild("[Grenade]") then
			plr.Character.HumanoidRootPart.CFrame = targetpos
			local cd = game:GetService("Workspace").Ignored.Shop["[Grenade] - $700"]:FindFirstChild("ClickDetector")
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = plr.Character
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = plr.Character
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = plr.Character
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = plr.Character
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = plr.Character
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = plr.Character
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = plr.Character
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = plr.Character
			wait(.9)
			local oh1 = CFrame.new(-411.605194, 21.7499943, -332.942078)
			local oh2 = game:GetService("Players")
			local oh3 = oh2.LocalPlayer.Character.HumanoidRootPart


			oh3.CFrame = oh1

			-- end of script
			local oh1 = CFrame.new(-396.677094, 51.750145, -336.327148)
			local oh2 = game:GetService("Players")
			local oh3 = oh2.LocalPlayer.Character.HumanoidRootPart


			oh3.CFrame = oh1

			-- end of script
			local oh1 = CFrame.new(-408.277466, 77.8071213, -369.336456)
			local oh2 = game:GetService("Players")
			local oh3 = oh2.LocalPlayer.Character.HumanoidRootPart


			oh3.CFrame = oh1

			-- end of script
			local oh1 = CFrame.new(-396.90979, 61.7791367, -381.694397)
			local oh2 = game:GetService("Players")
			local oh3 = oh2.LocalPlayer.Character.HumanoidRootPart


			oh3.CFrame = oh1
		end
		wait(0)
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local char = LocalPlayer.Character
		local Ignored = game.workspace.Ignored
		local backpack = LocalPlayer.Backpack
		local x = 0
		local Grenade = "[Grenade]"
		local DroppedGrenade = "Handle"
		for i,v in pairs(backpack:GetChildren()) do
			if v.Name == Grenade then
				v.Parent = char
			end
		end
		for i,v in pairs(char:GetChildren()) do
			if v.Name == Grenade then
				v:Activate()
				v:Activate()
			end
		end
		wait (1)
		for i,v in pairs(Ignored:GetChildren()) do
			if v.Name == DroppedGrenade then
				x = x + 1
				v.Name = DroppedGrenade..x
			end
		end
		wait(1)
		x = 0
		for i, player in pairs(game.Players:GetPlayers()) do
			x = x + 1
			local launch = Ignored:WaitForChild(DroppedGrenade..x)
			if LocalPlayer.Name == player.Name then do
					launch.Position = Vector3.new(0,1000,0)
				end
			else do
					game.Players.LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)*math.huge
					game.Players.LocalPlayer.SimulationRadius = math.pow(math.huge,math.huge)*math.huge
					launch.Position = player.Character.HumanoidRootPart.Position
					wait (0.02)
				end

			end
		end

	elseif msg == ".tools" then
		char = game:GetService('Players').LocalPlayer.Character
		-------------------------------------
		function GetKnife()
			wait(.1)
			char.HumanoidRootPart.CFrame = CFrame.new(-680.2, 19.75, -254.97)
			char.HumanoidRootPart.CFrame = CFrame.new(-680.2, 19.75, -254.97)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-115.495, 19.756, -453.45)
			char.HumanoidRootPart.CFrame = CFrame.new(-115.495, 19.756, -453.45)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(33, 19.75, -184.6)
			char.HumanoidRootPart.CFrame = CFrame.new(33, 19.75, -184.6)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(243.495, 62, -450.5)
			char.HumanoidRootPart.CFrame = CFrame.new(243.495, 62, -450.5)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-103.53, 19.75, -220.21)
			char.HumanoidRootPart.CFrame = CFrame.new(-103.53, 19.75, -220.21)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-581.775, 19.7549, -485.23)
			char.HumanoidRootPart.CFrame = CFrame.new(-581.775, 19.7549, -485.23)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-399.655, 19.7552, -461.55)
			char.HumanoidRootPart.CFrame = CFrame.new(-399.655, 19.7552, -461.55)
			wait()
		end

		wait()
		local X = char.HumanoidRootPart.CFrame.X
		local Y = char.HumanoidRootPart.CFrame.Y
		local Z = char.HumanoidRootPart.CFrame.Z
		GetKnife()
		repeat GetKnife() until plr.Backpack:FindFirstChild('[Knife]') and plr.Backpack:FindFirstChild('[LockPicker]')
		char.HumanoidRootPart.CFrame = CFrame.new(X,Y+5,Z)

	elseif msg == ".get tools" then
		char = game:GetService('Players').LocalPlayer.Character
		-------------------------------------
		function GetKnife()
			wait(.1)
			char.HumanoidRootPart.CFrame = CFrame.new(-680.2, 19.75, -254.97)
			char.HumanoidRootPart.CFrame = CFrame.new(-680.2, 19.75, -254.97)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-115.495, 19.756, -453.45)
			char.HumanoidRootPart.CFrame = CFrame.new(-115.495, 19.756, -453.45)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(33, 19.75, -184.6)
			char.HumanoidRootPart.CFrame = CFrame.new(33, 19.75, -184.6)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(243.495, 62, -450.5)
			char.HumanoidRootPart.CFrame = CFrame.new(243.495, 62, -450.5)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-103.53, 19.75, -220.21)
			char.HumanoidRootPart.CFrame = CFrame.new(-103.53, 19.75, -220.21)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-581.775, 19.7549, -485.23)
			char.HumanoidRootPart.CFrame = CFrame.new(-581.775, 19.7549, -485.23)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-399.655, 19.7552, -461.55)
			char.HumanoidRootPart.CFrame = CFrame.new(-399.655, 19.7552, -461.55)
			wait()
		end

		wait()
		local X = char.HumanoidRootPart.CFrame.X
		local Y = char.HumanoidRootPart.CFrame.Y
		local Z = char.HumanoidRootPart.CFrame.Z
		GetKnife()
		repeat GetKnife() until plr.Backpack:FindFirstChild('[Knife]') and plr.Backpack:FindFirstChild('[LockPicker]')
		char.HumanoidRootPart.CFrame = CFrame.new(X,Y+5,Z)

	elseif msg == ".get tool" then
		char = game:GetService('Players').LocalPlayer.Character
		-------------------------------------
		function GetKnife()
			wait(.1)
			char.HumanoidRootPart.CFrame = CFrame.new(-680.2, 19.75, -254.97)
			char.HumanoidRootPart.CFrame = CFrame.new(-680.2, 19.75, -254.97)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-115.495, 19.756, -453.45)
			char.HumanoidRootPart.CFrame = CFrame.new(-115.495, 19.756, -453.45)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(33, 19.75, -184.6)
			char.HumanoidRootPart.CFrame = CFrame.new(33, 19.75, -184.6)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(243.495, 62, -450.5)
			char.HumanoidRootPart.CFrame = CFrame.new(243.495, 62, -450.5)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-103.53, 19.75, -220.21)
			char.HumanoidRootPart.CFrame = CFrame.new(-103.53, 19.75, -220.21)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-581.775, 19.7549, -485.23)
			char.HumanoidRootPart.CFrame = CFrame.new(-581.775, 19.7549, -485.23)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-399.655, 19.7552, -461.55)
			char.HumanoidRootPart.CFrame = CFrame.new(-399.655, 19.7552, -461.55)
			wait()
		end

		wait()
		local X = char.HumanoidRootPart.CFrame.X
		local Y = char.HumanoidRootPart.CFrame.Y
		local Z = char.HumanoidRootPart.CFrame.Z
		GetKnife()
		repeat GetKnife() until plr.Backpack:FindFirstChild('[Knife]') and plr.Backpack:FindFirstChild('[LockPicker]')
		char.HumanoidRootPart.CFrame = CFrame.new(X,Y+5,Z)

	elseif msg == ".tool" then
		char = game:GetService('Players').LocalPlayer.Character
		-------------------------------------
		function GetKnife()
			wait(.1)
			char.HumanoidRootPart.CFrame = CFrame.new(-680.2, 19.75, -254.97)
			char.HumanoidRootPart.CFrame = CFrame.new(-680.2, 19.75, -254.97)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-115.495, 19.756, -453.45)
			char.HumanoidRootPart.CFrame = CFrame.new(-115.495, 19.756, -453.45)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			char.HumanoidRootPart.CFrame = CFrame.new(-418.208, 19.25, -748.694)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(33, 19.75, -184.6)
			char.HumanoidRootPart.CFrame = CFrame.new(33, 19.75, -184.6)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(243.495, 62, -450.5)
			char.HumanoidRootPart.CFrame = CFrame.new(243.495, 62, -450.5)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-103.53, 19.75, -220.21)
			char.HumanoidRootPart.CFrame = CFrame.new(-103.53, 19.75, -220.21)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-581.775, 19.7549, -485.23)
			char.HumanoidRootPart.CFrame = CFrame.new(-581.775, 19.7549, -485.23)
			wait()
			char.HumanoidRootPart.CFrame = CFrame.new(-399.655, 19.7552, -461.55)
			char.HumanoidRootPart.CFrame = CFrame.new(-399.655, 19.7552, -461.55)
			wait()
		end

		wait()
		local X = char.HumanoidRootPart.CFrame.X
		local Y = char.HumanoidRootPart.CFrame.Y
		local Z = char.HumanoidRootPart.CFrame.Z
		GetKnife()
		repeat GetKnife() until plr.Backpack:FindFirstChild('[Knife]') and plr.Backpack:FindFirstChild('[LockPicker]')
		char.HumanoidRootPart.CFrame = CFrame.new(X,Y+5,Z)

	elseif msg == ".boneless" then
		local Stuff = {"RightHand", "LeftHand","RightUpperArm","RightLowerArm","LeftUpperArm","LeftLowerArm","Head","UpperTorso"}

		pcall(function()
			for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				for z, AdminName in ipairs(Stuff) do
					if v.Name == AdminName then
						if v:FindFirstChildOfClass("Motor6D") then
							local Weld = v:FindFirstChildOfClass("Motor6D")
							Weld:Destroy()
						end
					end
				end
			end
		end)

	elseif msg == ".spinknife" then
		pcall(function()
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.Name == '[Knife]' then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
		end)
		wait(.9)
		local targetpos = CFrame.new(-278.063446, 21.75, -240.871841)
		local plr = game.Players.LocalPlayer
		local pos = plr.Character.HumanoidRootPart.Position
		if not game.Players.LocalPlayer.Character:FindFirstChild("[Knife]") then
			plr.Character.HumanoidRootPart.CFrame = targetpos
			local cd = game:GetService("Workspace").Ignored.Shop["[Knife] - $150"]:FindFirstChild("ClickDetector")
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack["[Knife]"].GripPos     = Vector3.new(2, -5, -1.5)
			game.Players.LocalPlayer.Backpack["[Knife]"].GripForward     = Vector3.new(0, 0, 0)
			game.Players.LocalPlayer.Backpack["[Knife]"].GripRight     = Vector3.new(1, 0, -3)
			game.Players.LocalPlayer.Backpack["[Knife]"].GripUp     = Vector3.new(0, 0, 0)
			game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character
			spin = true
			local spinSpeed = 100
			local speaker = game.Players.LocalPlayer
			for i,v in pairs(speaker.Character.HumanoidRootPart:GetChildren()) do
				if v.Name == "Spinning" then
					v:Destroy()
				end
			end
			local Spin = Instance.new("BodyAngularVelocity", speaker.Character.HumanoidRootPart)
			Spin.Name = "Spinning"
			Spin.MaxTorque = Vector3.new(0, math.huge, 0)
			Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
			wait(0.6)
		end
	elseif msg == ".knifespin" then
		pcall(function()
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.Name == '[Knife]' then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
		end)
		wait(.9)
		local targetpos = CFrame.new(-278.063446, 21.75, -240.871841)
		local plr = game.Players.LocalPlayer
		local pos = plr.Character.HumanoidRootPart.Position
		if not game.Players.LocalPlayer.Character:FindFirstChild("[Knife]") then
			plr.Character.HumanoidRootPart.CFrame = targetpos
			local cd = game:GetService("Workspace").Ignored.Shop["[Knife] - $150"]:FindFirstChild("ClickDetector")
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack["[Knife]"].GripPos     = Vector3.new(2, -5, -1.5)
			game.Players.LocalPlayer.Backpack["[Knife]"].GripForward     = Vector3.new(0, 0, 0)
			game.Players.LocalPlayer.Backpack["[Knife]"].GripRight     = Vector3.new(1, 0, -3)
			game.Players.LocalPlayer.Backpack["[Knife]"].GripUp     = Vector3.new(0, 0, 0)
			game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character
			spin = true
			local spinSpeed = 100
			local speaker = game.Players.LocalPlayer
			for i,v in pairs(speaker.Character.HumanoidRootPart:GetChildren()) do
				if v.Name == "Spinning" then
					v:Destroy()
				end
			end
			local Spin = Instance.new("BodyAngularVelocity", speaker.Character.HumanoidRootPart)
			Spin.Name = "Spinning"
			Spin.MaxTorque = Vector3.new(0, math.huge, 0)
			Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
			wait(0.6)
		end
	elseif msg == ".ninjastar" then
		local cor = coroutine.wrap(function()
			game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-278.063446, 21.75, -235.871841))
		end)
		cor()			
		wait(1)
		fireclickdetector(workspace.Ignored.Shop["[Knife] - $150"].ClickDetector, 4)
		wait(1)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripPos     = Vector3.new(0, 0, 0 )
		game.Players.LocalPlayer.Backpack["[Knife]"].GripForward     = Vector3.new(0, 0, 0)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripRight     = Vector3.new(0, 0, 0)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripUp     = Vector3.new(0, 0, 0)
		wait(0.20)
		game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character
		wait(0.3)
		fireclickdetector(workspace.Ignored.Shop["[Knife] - $150"].ClickDetector, 4)
		wait(1)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripPos     = Vector3.new(0, 0, 0)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripForward     = Vector3.new(5, 5, 5)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripRight     = Vector3.new(0, 0, 0)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripUp     = Vector3.new(0, 5, 0)
		wait(0.20)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("[Knife]") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Knife]").Parent = game.Players.LocalPlayer.Character
		end
	elseif msg == ".star" then
		local cor = coroutine.wrap(function()
			game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-278.063446, 21.75, -235.871841))
		end)
		cor()			
		wait(1)
		fireclickdetector(workspace.Ignored.Shop["[Knife] - $150"].ClickDetector, 4)
		wait(1)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripPos     = Vector3.new(0, 0, 0 )
		game.Players.LocalPlayer.Backpack["[Knife]"].GripForward     = Vector3.new(0, 0, 0)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripRight     = Vector3.new(0, 0, 0)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripUp     = Vector3.new(0, 0, 0)
		wait(0.20)
		game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character
		wait(0.3)
		fireclickdetector(workspace.Ignored.Shop["[Knife] - $150"].ClickDetector, 4)
		wait(1)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripPos     = Vector3.new(0, 0, 0)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripForward     = Vector3.new(5, 5, 5)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripRight     = Vector3.new(0, 0, 0)
		game.Players.LocalPlayer.Backpack["[Knife]"].GripUp     = Vector3.new(0, 5, 0)
		wait(0.20)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("[Knife]") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("[Knife]").Parent = game.Players.LocalPlayer.Character
		end

	elseif msg == ".naked" then
		local lol = game.Players.LocalPlayer.Character.Shirt 
		local boy = game.Players.LocalPlayer.Character.Pants
		lol:Destroy();
		boy:Destroy();

	elseif msg == ".fistwave" then
		Not("Press [U]" ,4833645592, "Primos Script")

		DoThing = false
		maus = game.Players.LocalPlayer:GetMouse()
		maus.KeyDown:Connect(function(key)
			if key == "n" and DoThing  == false then
				DoThing = true
				local Part = Instance.new("Part",workspace)
				Part.Name = "GetFucked"
				Part.Anchored = false
				Part.CanCollide = false
				Part.Transparency = 1
				local Part1= Instance.new("Part",workspace)
				Part1.Name = "GetFucked1"
				Part1.Anchored = true
				Part1.CanCollide = false
				Part1.Transparency = 1

				local Weld = Instance.new("Weld", Part1)
				Weld.Part0 = Part1
				Weld.Part1 = Part
				Weld.C0 = CFrame.new(0, 0, 10000)
				local cor = coroutine.wrap(function()
					wait(2)
					Part:Destroy()
					Part1:Destroy()
					Weld:Destroy()
					DoThing = false
				end)
				cor()
				pcall(function()
					if game.Players.LocalPlayer.Character.RightHand:FindFirstChildOfClass("Model") then
						game.Players.LocalPlayer.Character.RightHand.Model.RightWrist:Destroy()
					end
					game.Players.LocalPlayer.Character.RightHand.RightWrist:Destroy()
				end)
				local laugh = 0
				repeat

					laugh = laugh+200
					Part1.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, laugh, math.pi/-2)
					local lol = game.Players.LocalPlayer.Character.HumanoidRootPart
					game.Players.LocalPlayer.Character.RightHand.CFrame = CFrame.new(Part.CFrame.X ,Part.CFrame.Y+2, Part.CFrame.Z)
					game.Players.LocalPlayer.Character.RightHand.Massless = true
					game.Players.LocalPlayer.Character.RightHand.Size = Vector3.new(0, 0, 0)
					wait()
				until game.Workspace:FindFirstChild("GetFucked") == nil

				local lol = game.Players.LocalPlayer.Character.HumanoidRootPart
				game.Players.LocalPlayer.Character.RightHand.Size = Vector3.new(1, 0.5, 1)
				for i = 1, 10 do
					game.Players.LocalPlayer.Character.RightHand.CFrame = lol.CFrame
					wait(0.05)
				end

			end
		end)
	elseif msg == ".autostomp" then
		Not("Press [P]" ,4833645592, "Primos Script")

		Toggle = false

		while wait(.5) do
			local mouse = game.Players.LocalPlayer:GetMouse()

			if Toggle == false then
				game.ReplicatedStorage.MainEvent:FireServer("Stomp")
				mouse.KeyDown:connect(function(k)
					if k == "p" then
						if Toggle == false then 
							Toggle = true
							print('Off')
						elseif Toggle == true then 
							print('On')
							Toggle = false
						end
					end
				end)
			end
		end

	elseif msg == ".antibag" then
		Not("Antibag enabled" ,4833645592, "Primos Script")

		delay(0, function()
			while wait() do
				pcall(function()
					if game.Players.LocalPlayer.Character:FindFirstChild("Christmas_Sock") then
						game.Players.LocalPlayer.Character["Christmas_Sock"]:Destroy()
					end
				end)
			end
		end)
	elseif msg == ".antiflash" then
		Not("antiflashbang enabled" ,4833645592, "Primos Script")
		while true do
			local NIGGA = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui

			if NIGGA:FindFirstChild("whiteScreen") then
				NIGGA.whiteScreen:Destroy()
			end
			wait(0.2)
		end

	elseif msg == ".antiflashbang" then
		Not("antiflashbang enabled" ,4833645592, "Primos Script")
		while true do
			local NIGGA = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui

			if NIGGA:FindFirstChild("whiteScreen") then
				NIGGA.whiteScreen:Destroy()
			end
			wait(0.2)
		end

	elseif msg == ".fistreach" then
		local fistreach = false
		LP = game.Players.LocalPlayer
		for i,v in ipairs(LP.Character:GetDescendants()) do
			if v:IsA("MeshPart") then v.Massless = true
				v.CanCollide = false
				v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)

			end
		end

		for i,v in ipairs(game.workspace:GetDescendants()) do
			if v:IsA("Seat") then 
				v.Disabled = true
			end
		end
		x = 35
		y = 35
		z = 35


		penis = Vector3.new(x,y,z)

		LP.Character.RightHand.Size = penis

		LP.Character.RightHand.Transparency = 1
		local selectionBox = Instance.new("SelectionBox",LP.Character.RightHand)
		selectionBox.Adornee = LP.Character.RightHand
		selectionBox.Color3 = Color3.new(0.415686, 0.415686, 0.415686)

		LP.Character.LeftHand.Size = penis
		LP.Character.BodyEffects.SpecialParts.LeftHand.Size = penis

		LP.Character.LeftHand.Transparency = 1
		local selectionBox = Instance.new("SelectionBox",LP.Character.LeftHand)
		selectionBox.Adornee = LP.Character.LeftHand
		selectionBox.Color3 = Color3.new(0, 0, 0)
	elseif msg == ".antistomp" then
		local plr = game.Players.LocalPlayer
		game.StarterGui:SetCore("SendNotification", {
			Title = "Primos Script";
			Text = plr.Name .. " Antistomp";
			Duration = 15;
		})
		pcall(function() if tostring(game.PlaceId) == "2788229376" then local corepackages = game:GetService"CorePackages" local localplayer = game:GetService"Players".LocalPlayer local run = game:GetService"RunService" run:BindToRenderStep("rrrrrrrrrrr",2000,function() pcall(function() if localplayer.Character.Humanoid.Health <= 30 then localplayer.Character.Humanoid:UnequipTools() localplayer.Character.Humanoid:Destroy() workspace.CurrentCamera.CameraSubject = localplayer.Character wait() local prt = Instance.new("Model", corepackages); Instance.new("Part", prt).Name="Torso"; Instance.new("Part", prt).Name="Head"; Instance.new("Humanoid", prt).Name="Humanoid"; localplayer.Character=prt end end) pcall(function() if localplayer.Character.Humanoid.FloorMaterial == "Plastic" then ReplicatedStorage:FireServer("Stomp") end end) end) 
			end end)
	elseif msg == ".antiloseweapon" then
		local plr = game.Players.LocalPlayer
		game.StarterGui:SetCore("SendNotification", {
			Title = "Primos Script";
			Text = plr.Name .. " Antistomp";
			Duration = 15;
		})
		pcall(function() if tostring(game.PlaceId) == "2788229376" then local corepackages = game:GetService"CorePackages" local localplayer = game:GetService"Players".LocalPlayer local run = game:GetService"RunService" run:BindToRenderStep("rrrrrrrrrrr",2000,function() pcall(function() if localplayer.Character.Humanoid.Health <= 30 then localplayer.Character.Humanoid:UnequipTools() localplayer.Character.Humanoid:Destroy() workspace.CurrentCamera.CameraSubject = localplayer.Character wait() local prt = Instance.new("Model", corepackages); Instance.new("Part", prt).Name="Torso"; Instance.new("Part", prt).Name="Head"; Instance.new("Humanoid", prt).Name="Humanoid"; localplayer.Character=prt end end) pcall(function() if localplayer.Character.Humanoid.FloorMaterial == "Plastic" then ReplicatedStorage:FireServer("Stomp") end end) end) 
			end end)

	elseif msg == ".holycross" then
		wait(0) local A_1 = "[Primos Script] HolyCross Enabled" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2)

		pcall(function()
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.Name == '[SledgeHammer]' then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
		end)
		wait(.9)
		local targetpos = CFrame.new(-899.925659, 21.75, -297.100342)
		local plr = game.Players.LocalPlayer
		local pos = plr.Character.HumanoidRootPart.Position
		if not game.Players.LocalPlayer.Character:FindFirstChild("[SledgeHammer]") then
			plr.Character.HumanoidRootPart.CFrame = targetpos
			local cd = game:GetService("Workspace").Ignored.Shop["[SledgeHammer] - $350"]:FindFirstChild("ClickDetector")
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[SledgeHammer]").Parent = plr.Character
			wait(.9)
			fireclickdetector(cd)
			wait(.4)
			game.Players.LocalPlayer.Backpack:FindFirstChild("[SledgeHammer]").Parent = plr.Character
			for i,v in pairs(plr.Character:GetChildren()) do
				if v.Name == '[SledgeHammer]' then
					v:GetChildren()[3]:Destroy()
				end
			end
			local sd = plr.Character:FindFirstChild("[SledgeHammer]")
			sd.Grip = CFrame.new(-2.4000001, -0.699999988, 0, 0, 1, -0, -1, 0, -0, 0, 0, 1)
			sd.GripForward = Vector3.new(0, 0, -1)
			sd.GripPos = Vector3.new(-2.4, -0.7, 0)
			sd.GripUp = Vector3.new(1, 0, 0)
			plr.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
		end
		local sd = plr.Character:FindFirstChild("[SledgeHammer]")
		sd.Grip = CFrame.new(-2.4000001, -0.699999988, 0, 0, 1, -0, -1, 0, -0, 0, 0, 1)
		sd.GripForward = Vector3.new(0, 0, -1)
		sd.GripPos = Vector3.new(-2.4, -0.7, 0)
		sd.GripUp = Vector3.new(1, 0, 0)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(pos)

	elseif msg == ".antislowdown" then
		while wait(0.20) do
			game.Players.LocalPlayer.Character.BodyEffects.Movement.ChildAdded:Connect(function(child)
				wait()
				child:Destroy()
			end)
		end
	elseif msg == ".noslow" then
		while wait(0.20) do
			game.Players.LocalPlayer.Character.BodyEffects.Movement.ChildAdded:Connect(function(child)
				wait()
				child:Destroy()
			end)
		end

	elseif msg:sub(1, 7) == ".bag " then
		local pl = GetPlayer(msg:sub(8))
		local TargetPlrs = pl.Name
		function getRoot(char)
			local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
			return rootPart
		end

		if TargetPlrs and game.Players[TargetPlrs].Character.BodyEffects['K.O'].Value == false then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop['[BrownBag] - $25'].Head.CFrame
			wait(.30)
			fireclickdetector(game.Workspace.Ignored.Shop['[BrownBag] - $25'].ClickDetector)
			game.Players.LocalPlayer.Backpack:WaitForChild("[BrownBag]").Parent = game.Players.LocalPlayer.Character

			local A_1 = "[Primos Script] Attempting To Bag " .. TargetPlrs .. "." local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2)
			wait(.5)
			repeat
				pcall(function()
					wait()
					getRoot(game.Players[TargetPlrs].Character).CFrame = getRoot(game.Players.LocalPlayer.Character).CFrame + Vector3.new(1,3,0)
					game.Players.LocalPlayer.Character["[BrownBag]"]:Activate()
				end)
			until game.Players[TargetPlrs].Character:FindFirstChild("Christmas_Sock")
			local A_1 = "[Primos Script] Successfully Bagged " .. TargetPlrs .. "." local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2)
		elseif game.Players[TargetPlrs].Character.BodyEffects['K.O'].Value == false then
			local A_1 = "[Primos Script] " .. TargetPlrs .. " Is Already Bagged." local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2)
		end

	elseif msg:sub(1, 8) == ".spec " then
		local pl = GetPlayer(msg:sub(9))
		local TargetPlr = pl.Name
		game.Workspace.Camera.CameraSubject = game.Players[TargetPlr].Character.Humanoid;


	elseif msg == ".unspec" then

		game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;

	elseif msg:sub(1, 7) == ".cash" then
		local pl = GetPlayer(msg:sub(9))
		local TargetPlr = pl.Name
		local A_1 = "[Primos Script] " .. TargetPlr .. " Have $" .. game.Players[TargetPlr].DataFolder.Currency.Value .. "." local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2)

	elseif msg:sub(1, 7) == ".lock" then
		local pl = GetPlayer(msg:sub(9))
		local TargetPlr = pl.Name
		local localPlayer     = game:GetService("Players").LocalPlayer;
		local localCharacter  = localPlayer.Character;


		if TargetPlr and game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == false then
			pcall(function()
				localCharacter.LeftHand.LeftWrist:Destroy();
				localCharacter.RightHand.RightWrist:Destroy();
			end);
			repeat
				wait();
				localCharacter.LeftHand.CFrame = game.Players[TargetPlr].Character.LowerTorso.CFrame;
				localCharacter.RightHand.CFrame = game.Players[TargetPlr].Character.LowerTorso.CFrame;
			until game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == true
			game.StarterGui:SetCore("SendNotification", {
				Title = "Primos Script";
				Text = TargetPlr .. " Has been successfully knocked!";
				Duration = 15;
			})
		elseif game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == true then
			game.StarterGui:SetCore("SendNotification", {
				Title = "Primos Script";
				Text = TargetPlr .. " Is already knocked.";
				Duration = 15;
			})
		end;
	elseif msg == ".noclip" then

		game:GetService("Players").LocalPlayer.Character.Head.Touched:connect(function(obj)
			obj.CanCollide = false
		end)
	elseif msg == ".clip" then
		local plr = game.Players.LocalPlayer
		plr.Character.Humanoid:ChangeState(11)

	elseif msg == ".hulk" then
		local plr = game.Players.LocalPlayer

		local SuperSpeed = Instance.new("IntValue",plr.Character.BodyEffects.Movement);SuperSpeed.Name = "SuperSpeed"
		local HulkJump = Instance.new("IntValue",plr.Character.BodyEffects.Movement);HulkJump.Name = "HulkJump"

	elseif msg == ".killall" then
		local Knife = false
		Knife = true
		repeat

			local cor = coroutine.wrap(function()
				if not game.Players.LocalPlayer.Character:FindFirstChild("[Knife]") then
					takingbag = true
					local cor = coroutine.wrap(function()

						game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-278.063446, 21.75, -240.871841))
					end)
					cor()
					wait(1)

					fireclickdetector(workspace.Ignored.Shop["[Knife] - $150"].ClickDetector, 4)
					game.Players.LocalPlayer.Backpack["[Knife]"].Handle.Size = Vector3.new(10, 10, 10)
					wait(0.5)
					game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character
					takingbag = false
				end
			end)
			cor()
			if takingbag == false then
				for i, v  in pairs(game.Players:GetPlayers()) do
					if v.Character:FindFirstChild("Knife") == nil and v.Character:FindFirstChildOfClass("ForceField") == nil and v.Character ~= game.Players.LocalPlayer.Character then
						local chars = v.Character
						if game.Players.LocalPlayer.Character:FindFirstChild("[Knife]") then
							game.Players.LocalPlayer.Character["[Knife]"]:Activate()
						end
						game.Players.LocalPlayer.Character:MoveTo(v.Character.UpperTorso.Position)
					end
					wait(0.005)
					Knife = false
				end
			end
			wait()
		until Knife == false
	elseif msg == ".kill all" then
		local Knife = false
		Knife = true
		repeat

			local cor = coroutine.wrap(function()
				if not game.Players.LocalPlayer.Character:FindFirstChild("[Knife]") then
					takingbag = true
					local cor = coroutine.wrap(function()

						game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-278.063446, 21.75, -240.871841))
					end)
					cor()
					wait(1)

					fireclickdetector(workspace.Ignored.Shop["[Knife] - $150"].ClickDetector, 4)
					game.Players.LocalPlayer.Backpack["[Knife]"].Handle.Size = Vector3.new(10, 10, 10)
					wait(0.5)
					game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character
					takingbag = false
				end
			end)
			cor()
			if takingbag == false then
				for i, v  in pairs(game.Players:GetPlayers()) do
					if v.Character:FindFirstChild("Knife") == nil and v.Character:FindFirstChildOfClass("ForceField") == nil and v.Character ~= game.Players.LocalPlayer.Character then
						local chars = v.Character
						if game.Players.LocalPlayer.Character:FindFirstChild("[Knife]") then
							game.Players.LocalPlayer.Character["[Knife]"]:Activate()
						end
						game.Players.LocalPlayer.Character:MoveTo(v.Character.UpperTorso.Position)
					end
					wait(0.005)
					Knife = false
				end
			end
			wait()
		until Knife == false
	elseif msg == ".shield" then
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")

		local LocalPlayer = Players.LocalPlayer
		local Mouse = LocalPlayer:GetMouse()

		local Character = LocalPlayer.Character
		local RightHand = Character.RightHand

		local Character = LocalPlayer.Character
		local LeftHand = Character.LeftHand

		local Character = LocalPlayer.Character
		local LowerTorso = Character.LowerTorso

		local Character = LocalPlayer.Character
		local UpperTorso = Character.UpperTorso



		wait(0)

		local Box = Instance.new("SelectionBox")
		Box.LineThickness = 0,9,8
		Box.Color3 = Color3.new(1, 1, 1)
		Box.Transparency = 0.1
		Box.Adornee = RightHand
		Box.Parent = RightHand

		local Box = Instance.new("SelectionBox")
		Box.LineThickness = 0,9,8
		Box.Color3 = Color3.new(1, 0, 0)
		Box.Transparency = 0.1
		Box.Adornee = LeftHand
		Box.Parent = LeftHand

		local Box = Instance.new("SelectionBox")
		Box.LineThickness = 0,9,8
		Box.Color3 = Color3.new(1, 0, 0)
		Box.Transparency = 0.1
		Box.Adornee = LowerTorso
		Box.Parent = LowerTorso

		local Box = Instance.new("SelectionBox")
		Box.LineThickness = 0,9,8
		Box.Color3 = Color3.new(1, 0, 0)
		Box.Transparency = 0.1
		Box.Adornee = UpperTorso
		Box.Parent = UpperTorso

	elseif msg == ".unjail" then
		local cor = coroutine.wrap(function()
			game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-270.063446, 21.75, -238.871841))
		end)
		cor()			
		wait(1)
		fireclickdetector(workspace.Ignored.Shop["[Key] - $125"].ClickDetector, 4)
		wait(0.5)
		game.Players.LocalPlayer.Backpack["[Key]"].Parent = game.Players.LocalPlayer.Character
		wait(0.5)
		game.Players.LocalPlayer.Character["[Key]"]:Activate()

	elseif msg == ".Unjail" then
		local cor = coroutine.wrap(function()
			game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-270.063446, 21.75, -238.871841))
		end)
		cor()			
		wait(1)
		fireclickdetector(workspace.Ignored.Shop["[Key] - $125"].ClickDetector, 4)
		wait(0.5)
		game.Players.LocalPlayer.Backpack["[Key]"].Parent = game.Players.LocalPlayer.Character
		wait(0.5)
		game.Players.LocalPlayer.Character["[Key]"]:Activate()

	elseif 	msg:sub(1, 6) == ".rpg" then
		local pl = GetPlayer(msg:sub(8))
		local TargetPlr = pl.Name

		if game.Players.LocalPlayer.Backpack:FindFirstChild("[RPG]") then


			game.Players.LocalPlayer.Backpack:FindFirstChild("[RPG]").Parent = game.Players.LocalPlayer.Character
		else
			Not("You Doesn't have rpg buy an rpg ", 145360599, "Primos Script")
			nuking = false
		end

		nuking = true
		nukerowner = TargetPlr
		game.Players.LocalPlayer.Character:FindFirstChild("[RPG]"):Activate()
	elseif msg:sub(1,9) == ".arrest" then
		local pl = GetPlayer(msg:sub(11))
		local TargetPlr = pl.Name
		for i,v in pairs(game.Players:GetPlayers()) do 
			if game.Players.LocalPlayer.Backpack:FindFirstChild("[RPG]") then
				Not("Arresting "..TargetPlr, 145360599, "Primos Script")
				game.Players.LocalPlayer.Backpack:FindFirstChild("[RPG]").Parent = game.Players.LocalPlayer.Character
			else
				Not("You doesnt have an rpg", 145360599, "Primos Script")
			end
			nuking = true
			nukerowner = TargetPlr
			game.Players.LocalPlayer.Character:FindFirstChild("[RPG]"):Activate()
			repeat
				if workspace.Players:FindFirstChild(TargetPlr) then
					if workspace.Players[TargetPlr].BodyEffects["K.O"].Value == true then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Cuff") then
							game.Players.LocalPlayer.Backpack:FindFirstChild("Cuff").Parent = game.Players.LocalPlayer.Character
						else
							Not("You are not a cop", 145360599, "Primos Script")
						end
						game.Players.LocalPlayer.Character:FindFirstChild("Cuff"):Activate()
						game.Players.LocalPlayer.Character:MoveTo(workspace.Players[TargetPlr].Head.Position)
						if workspace:FindFirstChild("Core") then
							workspace.Core:Destroy()
						end
						flying = false
					end
				end
				wait()
			until workspace.Players[nukerowner].BodyEffects["Cuff"].Value == true

			break
		end
	elseif msg == ".splitgrenade" then
		if game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]") then
			local LocalPlayer = game:GetService("Players").LocalPlayer
			local char = LocalPlayer.Character
			local Ignored = game.workspace.Ignored
			local backpack = LocalPlayer.Backpack
			local x = 0
			local Grenade = "[Grenade]"
			local DroppedGrenade = "Handle"

			for i,v in pairs(backpack:GetChildren()) do
				if v.Name == Grenade then
					v.Parent = char
				end
			end
			for i,v in pairs(char:GetChildren()) do
				if v.Name == Grenade then
					v:Activate()
					v:Activate()
				end
			end
		else
			Not("Buy grenade atleast 5 or more",4833645592,"Primos Script")
		end
	elseif msg == ".split" then
		if game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]") then
			local LocalPlayer = game:GetService("Players").LocalPlayer
			local char = LocalPlayer.Character
			local Ignored = game.workspace.Ignored
			local backpack = LocalPlayer.Backpack
			local x = 0
			local Grenade = "[Grenade]"
			local DroppedGrenade = "Handle"

			for i,v in pairs(backpack:GetChildren()) do
				if v.Name == Grenade then
					v.Parent = char
				end
			end
			for i,v in pairs(char:GetChildren()) do
				if v.Name == Grenade then
					v:Activate()
					v:Activate()
				end
			end
		else
			Not("Buy grenade atleast 5 or more",4833645592,"Primos Script")
		end

	elseif msg:sub(1,13) == ".fistarrest" then
		local pl = GetPlayer(msg:sub(15))
		local TargetPlr = pl.Name
		for i,v in pairs(game.Players:GetPlayers()) do 
			punchreachrr = TargetPlr
			local reachthing = "Combat"
			if game.Players.LocalPlayer.Backpack:FindFirstChild(reachthing) then
				game.Players.LocalPlayer.Backpack:FindFirstChild(reachthing).Parent = game.Players.LocalPlayer.Character
			end
			wait()
			game.Players.LocalPlayer.Character:FindFirstChild(reachthing):Activate()
			punchreach = true
			local cor = coroutine.wrap(function()
				wait(3)
				punchreach = false
				local lol = game.Players.LocalPlayer.Character.HumanoidRootPart
				game.Players.LocalPlayer.Character.RightHand.Size = Vector3.new(0.5,0.5, 0.5)
				game.Players.LocalPlayer.Character.LeftHand.Size = Vector3.new(0.5,0.5, 0.5)

				for i = 1, 10 do
					game.Players.LocalPlayer.Character.RightHand.CFrame = lol.CFrame
					game.Players.LocalPlayer.Character.LeftHand.CFrame = lol.CFrame
					wait(0.05)
				end

			end)
			cor()
			game:service'RunService'.Heartbeat:Connect(function(step)
				if punchreach == true then
					pcall(function()
						if game.Players.LocalPlayer.Character.RightHand:FindFirstChildOfClass("Model") then
							game.Players.LocalPlayer.Character.RightHand.Model.RightWrist:Destroy()
						end

						game.Players.LocalPlayer.Character.RightHand.RightWrist:Destroy()

					end)
					pcall(function()
						if game.Players.LocalPlayer.Character.LeftHand:FindFirstChildOfClass("Model") then
							game.Players.LocalPlayer.Character.LeftHand.Model.LeftWrist:Destroy()
						end
						game.Players.LocalPlayer.Character.LeftHand.LeftWrist:Destroy()
					end)
					local Part = workspace.Players[punchreachrr].LowerTorso

					game.Players.LocalPlayer.Character.RightHand.CFrame = CFrame.new(Part.CFrame.X ,Part.CFrame.Y+2, Part.CFrame.Z)
					game.Players.LocalPlayer.Character.RightHand.Massless = true
					game.Players.LocalPlayer.Character.RightHand.Size = Vector3.new(5, 5, 5)
					game.Players.LocalPlayer.Character.LeftHand.CFrame = CFrame.new(Part.CFrame.X ,Part.CFrame.Y+2, Part.CFrame.Z)
					game.Players.LocalPlayer.Character.LeftHand.Massless = true
					game.Players.LocalPlayer.Character.LeftHand.Size = Vector3.new(5, 5, 5)
				end
			end)
			repeat
				if workspace.Players:FindFirstChild(punchreachrr) then
					if workspace.Players[punchreachrr].BodyEffects["K.O"].Value == true then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Cuff") then
							game.Players.LocalPlayer.Backpack:FindFirstChild("Cuff").Parent = game.Players.LocalPlayer.Character
						end
						game.Players.LocalPlayer.Character:FindFirstChild("Cuff"):Activate()
						game.Players.LocalPlayer.Character:MoveTo(workspace.Players[punchreachrr].Head.Position)
						if workspace:FindFirstChild("Core") then
							workspace.Core:Destroy()
						end
						flying = false
					end
				end
				wait()
			until workspace.Players[punchreachrr].BodyEffects["Cuff"].Value == true

			break
		end

	elseif msg:sub(1, 8) == ".fling" then

		for i,v in pairs(game.Players:GetPlayers()) do 
			if v.Name:lower():sub(1,#msg:sub(10)) == msg:sub(10):lower() then
				local Party = Instance.new("Part",workspace)
				Party.Name = "Shit"
				Party.CanCollide = false
				Party.Anchored = false
				Party.Size = Vector3.new(0, 0, 0)
				Party.Massless = true
				local Weld = Instance.new("Weld",Party)
				Weld.Part0 = Party
				Weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart
				HasDied = false
				local bodyp    = Instance.new("BodyPosition",Party)
				bodyp.D        = 0
				bodyp.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				bodyp.P = 15000
				Not("Curently killing "..v.Name, 4833645592, "Primos Script")
				local Target = workspace.Players[v.Name]

				repeat
					game:GetService("RunService").RenderStepped:Wait()
					pcall(function()

						if Target.BodyEffects["K.O"].Value == true then
							HasDied = true
						end
						if Target.BodyEffects:FindFirstChild("K.O") == nil then
							HasDied = true

						end
						if HasDied == false then
							bodyp.Position = Target.PrimaryPart.Position
						end
					end)
				until HasDied == true

				Party:Destroy()
				for i = 1, 10 do
					game.Players.LocalPlayer.Character:MoveTo(Target.LowerTorso.Position)
					wait(0.1)
				end
				break
			end

		end

	elseif msg == ".unfling" then
		HasDied = true
	elseif msg:sub(1,14) == ".grenadelock" then
		local pl = GetPlayer(msg:sub(16))
		local TargetPlr = pl.Name
		if game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]") then

			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = game.Players.LocalPlayer.Character
			nuking = true
			nukerowner = TargetPlr
			game.Players.LocalPlayer.Character:FindFirstChild("[Grenade]"):Activate()
			game.Players.LocalPlayer.Character:FindFirstChild("[Grenade]"):Activate()
		else
			Not("Buy grenade noob",4833645592,"Primos Script")
		end                  
	elseif msg:sub(1,17) == ".flashbanglock" then
		local pl = GetPlayer(msg:sub(19))
		local TargetPlr = pl.Name
		if game.Players.LocalPlayer.Backpack:FindFirstChild("[Flashbang]") then

			game.Players.LocalPlayer.Backpack:FindFirstChild("[Flashbang]").Parent = game.Players.LocalPlayer.Character
			nuking = true
			nukerowner = TargetPlr
			game.Players.LocalPlayer.Character:FindFirstChild("[Flashbang]"):Activate()
			game.Players.LocalPlayer.Character:FindFirstChild("[Flashbang]"):Activate()
		else
			Not("Buy flashbang noob nooooooob noob",4833645592,"Primos Script")
		end

	elseif msg:sub(1,17) == ".flashbang lock" then
		local pl = GetPlayer(msg:sub(19))
		local TargetPlr = pl.Name
		if game.Players.LocalPlayer.Backpack:FindFirstChild("[Flashbang]") then

			game.Players.LocalPlayer.Backpack:FindFirstChild("[Flashbang]").Parent = game.Players.LocalPlayer.Character
			nuking = true
			nukerowner = TargetPlr
			game.Players.LocalPlayer.Character:FindFirstChild("[Flashbang]"):Activate()
			game.Players.LocalPlayer.Character:FindFirstChild("[Flashbang]"):Activate()
		else
			Not("Buy flashbang noob nooooooob noob",4833645592,"Primos Script")
		end
	elseif msg:sub(1,14) == ".grenade lock" then
		local pl = GetPlayer(msg:sub(16))
		local TargetPlr = pl.Name
		if game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]") then

			game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]").Parent = game.Players.LocalPlayer.Character
			nuking = true
			nukerowner = TargetPlr
			game.Players.LocalPlayer.Character:FindFirstChild("[Grenade]"):Activate()
			game.Players.LocalPlayer.Character:FindFirstChild("[Grenade]"):Activate()
		else
			Not("Buy grenade noob",4833645592,"Primos Script")
		end 
	elseif msg == ".nojumpcooldown" then
		game.Players.LocalPlayer.Character.Humanoid.Name = "Humz"
		game.Players.LocalPlayer.Character.Humz.WalkSpeed = 17
		Not("Jump cooldown removed",4833645592,"Primos Script")
	elseif msg == ".nojump" then
		game.Players.LocalPlayer.Character.Humanoid.Name = "Humz"
		game.Players.LocalPlayer.Character.Humz.WalkSpeed = 17
		Not("Jump cooldown removed",4833645592,"Primos Script")

	elseif msg == ".fastlegs" then
		local lol = game.Workspace.Ignored.Shop["[SoloBike] - $25"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		game.StarterGui:SetCore("SendNotification", {
			Title = "Primos Script";
			Text = "Please buy it then ride it and execute this again! dont be stupid pls.";
			Duration = 15;
		})
		local l__Character__4 = game.Players.LocalPlayer.Character
		local l__RunService__7 = game:GetService("RunService");
		local u25 = l__Character__4.Humanoid:LoadAnimation(game.ReplicatedStorage.ClientAnimations.Bicycling);

		local l__SeatPart__81 = l__Character__4.Humanoid.SeatPart;
		if l__SeatPart__81 and l__SeatPart__81:IsA("VehicleSeat") and l__SeatPart__81.Parent:FindFirstChild("BikeModel") then
			l__SeatPart__81:Destroy()
			u25:Play(0.100000001, 1, 0);
			while l__Character__4.Humanoid.SeatPart == l__SeatPart__81 do
				if l__SeatPart__81.Throttle == 1000 then
					u25:AdjustSpeed(1000):Destroy()
				elseif l__SeatPart__81.Throttle == -1000 then
					u25:AdjustSpeed(-1000):Destroy()
				else
					u25:AdjustSpeed(1000):Destroy()
				end;
				l__RunService__7.Heartbeat:wait();			
			end;
			u25:Stop();
			return;
		end;
	elseif msg == ".freecam" then
		Not("Press [R]",4833645592,"Primos Script")
		-- Basic Freecam Script
		-- You can move faster by holding the click button [setting below ! :) ]
		local allowspeedmove = true
		wait(1)

		local c = workspace.CurrentCamera
		local player = game.Players.LocalPlayer
		local userInput = game:GetService("UserInputService")
		local rs = game:GetService("RunService")
		local starterPlayer = game:GetService("StarterPlayer")
		--local util = LoadLibrary("RbxUtility")
		--local camSync = util.CreateSignal()

		local selected = false
		local speed = 60
		local lastUpdate = 0

		local camera = Instance.new('Part', workspace)
		camera.CanCollide = false
		camera.Anchored = true
		camera.Transparency = 1
		camera.Name = 'FreeCam'
		camera.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0,5,0)
		--rs:BindToRenderStep("CamSync",190,function ()
		--	camSync:fire()
		--end)

		c.Changed:connect(function (property)
			if property == "CoordinateFrame" then
				--		camSync:fire()
			end
		end)

		function getNextMovement(deltaTime)
			local nextMove = Vector3.new()
			-- Left/Right
			if userInput:IsKeyDown("A") or userInput:IsKeyDown("Left") then
				nextMove = nextMove + Vector3.new(-1,0,0)
			end
			if userInput:IsKeyDown("D") or userInput:IsKeyDown("Right") then
				nextMove = nextMove + Vector3.new(1,0,0)
			end
			-- Forward/Back
			if userInput:IsKeyDown("W") or userInput:IsKeyDown("Up") then
				nextMove = nextMove + Vector3.new(0,0,-1)
			end
			if userInput:IsKeyDown("S") or userInput:IsKeyDown("Down") then
				nextMove = nextMove + Vector3.new(0,0,1)
			end
			-- Up/Down
			if userInput:IsKeyDown("Space") or userInput:IsKeyDown("Q") then
				nextMove = nextMove + Vector3.new(0,1,0)
			end
			if userInput:IsKeyDown("LeftControl") or userInput:IsKeyDown("E") then
				nextMove = nextMove + Vector3.new(0,-1,0)
			end
			return CFrame.new( nextMove * (speed * deltaTime) )
		end

		function onSelected()
			local char = player.Character
			if char then
				local root = camera
				currentPos = root.Position
				selected = true
				lastUpdate = tick()
				c.CameraSubject = root
				player.Character.HumanoidRootPart.Anchored = true
				while selected do
					local delta = tick()-lastUpdate
					local look = (c.Focus.p-c.CoordinateFrame.p).unit
					local move = getNextMovement(delta)
					local pos = root.Position
					root.CFrame = CFrame.new(pos,pos+look) * move
					lastUpdate = tick()
					wait(0.01)
					--	camSync:wait()
				end
				player.Character.HumanoidRootPart.Anchored = false
				c.CameraSubject = player.Character.Humanoid
				root.Velocity = Vector3.new()
			end
		end

		function onDeselected()
			selected = false
		end

		local isOn = true
		spawn(onSelected)

		function onKeyPressed(_,state)
			if state == Enum.UserInputState.Begin then
				isOn = not isOn
				if isOn then
					onSelected()
				else
					onDeselected()
				end
			end
		end

		local mouse = player:GetMouse()
		mouse.Button1Down:Connect(function()
			if allowspeedmove then speed = 120 end
		end)
		mouse.Button1Up:Connect(function()
			speed = 60
		end)

		function ResetCamera()
			camera.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0,5,0)
		end

		game:GetService("ContextActionService"):BindAction("Noclip Toggle",onKeyPressed,false,"r")
		game:GetService("ContextActionService"):BindAction("Reset Camera Position",ResetCamera,false,"z")
	elseif msg == ".chatlogs" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/kkkeeeooowww/my-projects/main/chatlogs.lua", true))()
	elseif msg == ".equip" then
		for _, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
			if v:IsA("Tool") then
				v.Parent = game:GetService("Players").LocalPlayer.Character
			end;
		end;
	elseif msg == ".antigrab" then
		Not("Antigrab enabled",4833645592,"Primos Script")
		delay(function()
			while true do
				if game.Players.LocalPlayer.Character:FindFirstChild("GRABBING_CONSTRAINT") then
					game.Players.LocalPlayer.Character.GRABBING_CONSTRAINT:Destroy()
				end
			end
		end)
	elseif msg == ".firstperson" then
		Not("Press [Q] to toggle it",4833645592,"Primos Script")
		-- Decompiled with the Synapse X Luau decompiler.

		local l__ContextActionService__1 = game:GetService("ContextActionService");
		local l__LocalPlayer__2 = game:GetService("Players").LocalPlayer;
		local l__CurrentCamera__3 = game:GetService("Workspace").CurrentCamera;
		local v4 = l__LocalPlayer__2.Character or l__LocalPlayer__2.CharacterAdded:Wait();
		local l__Humanoid__5 = v4:WaitForChild("Humanoid");
		local l__RunService__1 = game:GetService("RunService");
		local function v6(p1)
			if p1 then
				local v7, v8 = pcall(function()
					l__RunService__1:UnbindFromRenderStep(p1);
				end);
			end;
		end;
		v6("FirstPersonCamera");
		l__CurrentCamera__3.CameraType = Enum.CameraType.Custom;
		l__CurrentCamera__3.CameraSubject = l__Humanoid__5;
		l__CurrentCamera__3.FieldOfView = 70;
		local u2 = false;
		local u3 = nil;
		local u4 = {};
		local function u5(p2)
			if not p2 then
				return nil;
			end;
			local v9, v10, v11 = p2:ToEulerAnglesXYZ();
			return CFrame.Angles(v9, v10, v11);
		end;
		l__ContextActionService__1:BindAction("FirstPersonToggle", function(p3, p4, p5)
			if p4 == Enum.UserInputState.Begin then
				if u2 then
					v6("FirstPersonCamera");
					l__CurrentCamera__3.CFrame = u3;
					l__CurrentCamera__3.CameraType = Enum.CameraType.Custom;
					l__CurrentCamera__3.CameraSubject = l__Humanoid__5;
					l__CurrentCamera__3.FieldOfView = 70;
					local l__Head__12 = v4:FindFirstChild("Head");
					if l__Head__12 then
						l__Head__12.Transparency = u4[l__Head__12.Name] and 0;
					end;
					for v13, v14 in pairs(v4:GetChildren()) do
						if v14:IsA("Accoutrement") then
							local l__Handle__15 = v14:FindFirstChild("Handle");
							if l__Handle__15 then
								l__Handle__15.Transparency = u4[v14.Name] and 0;
							end;
						end;
					end;
				else
					local l__Head__16 = v4:FindFirstChild("Head");
					if l__Head__16 then
						u3 = u5(l__CurrentCamera__3.CFrame);
						l__CurrentCamera__3.CameraType = Enum.CameraType.Scriptable;
						l__CurrentCamera__3.CameraSubject = l__Head__16;
						l__CurrentCamera__3.FieldOfView = 90;
						u4[l__Head__16.Name] = l__Head__16.Transparency;
						l__Head__16.Transparency = 1;
						for v17, v18 in pairs(v4:GetChildren()) do
							if v18:IsA("Accoutrement") then
								local l__Handle__19 = v18:FindFirstChild("Handle");
								if l__Handle__19 then
									u4[v18.Name] = l__Handle__19.Transparency;
									l__Handle__19.Transparency = 1;
								end;
							end;
						end;
						l__RunService__1:BindToRenderStep("FirstPersonCamera", Enum.RenderPriority.Camera.Value - 1, function()
							if not v4:FindFirstChild("Head") then
								v6("FirstPersonCamera");
								return;
							end;
							local v20 = l__Head__16.CFrame * CFrame.new(0, 0.25, -(l__Head__16.Size.Z / 2 - 0.15));
							l__CurrentCamera__3.CFrame = v20;
							print(v20.X, v20.Y, v20.Z);
						end);
					else
						warn("head does not exist");
					end;
				end;
				u2 = not u2;
			end;
		end, true, Enum.KeyCode.Q, Enum.KeyCode.ButtonL3);
		l__ContextActionService__1:SetTitle("FirstPersonToggle", "FP");
	elseif msg == ".zoom" then
		game.Players.LocalPlayer.CameraMaxZoomDistance = (1000)
	elseif msg == ".buy shot" then
		local Player = game:GetService("Players").LocalPlayer
		local Players = game:GetService("Players")
		local lol = game.Workspace.Ignored.Shop["[Shotgun] - $1250"]
		local AncientPOS = plr.Character.HumanoidRootPart.Position

		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	

	elseif msg == ".buy lmg" then
		local lol = game.Workspace.Ignored.Shop["[LMG] - $3750"]
		local Player = game:GetService("Players").LocalPlayer
		local Players = game:GetService("Players")
		local lol = game.Workspace.Ignored.Shop["[Shotgun] - $1250"]

		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy rev" then
		local Player = game:GetService("Players").LocalPlayer
		local Players = game:GetService("Players")
		local lol = game.Workspace.Ignored.Shop["[Revolver] - $1300"]
		local AncientPOS = plr.Character.HumanoidRootPart.Position
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy smg" then
		local lol = game.Workspace.Ignored.Shop["[SMG] - $750"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy silencer" then
		local lol = game.Workspace.Ignored.Shop["[Silencer] - $550"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy ar" then
		local lol = game.Workspace.Ignored.Shop["[AR] - $1000"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy ak" then
		local lol = game.Workspace.Ignored.Shop["[AK47] - $2250"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy rpg" then
		local lol = game.Workspace.Ignored.Shop["[RPG] - $6000"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy taco" then
		local lol = game.Workspace.Ignored.Shop["[Taco] - $4"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy hamb" then
		local lol = game.Workspace.Ignored.Shop["[Hamburger] - $5"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	
	elseif msg == ".buy bag" then
		local lol = game.Workspace.Ignored.Shop["[BrownBag] - $25"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)

		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy lett" then
		local lol = game.Workspace.Ignored.Shop["[Lettuce] - $5"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)

		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy weight" then
		local lol = game.Workspace.Ignored.Shop["[Weights] - $120"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)

		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy bat" then
		local lol = game.Workspace.Ignored.Shop["[Bat] - $275"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy key" then
		local lol = game.Workspace.Ignored.Shop["[Key] - $120"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy knife" then
		local lol = game.Workspace.Ignored.Shop["[Knife] - $150"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy taser" then
		local lol = game.Workspace.Ignored.Shop["[Taser] - $1000"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy aug" then
		local lol = game.Workspace.Ignored.Shop["[AUG] - $1950"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy glock" then
		local lol = game.Workspace.Ignored.Shop["[Glock] - $300"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		wait(.1)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)		
	elseif msg == ".buy chicken" then
		local lol = game.Workspace.Ignored.Shop["[Chicken] - $7"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy pizza" then
		local lol = game.Workspace.Ignored.Shop["[Pizza] - $5"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy gren" then
		local lol = game.Workspace.Ignored.Shop["[Grenade] - $700"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy flashbang" then
		local lol = game.Workspace.Ignored.Shop["[Flashbang] - $550"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy tacticalshotgun" then
		local lol = game.Workspace.Ignored.Shop["[TacticalShotgun] - $1750"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy p90" then
		local lol = game.Workspace.Ignored.Shop["[P90] - $1000"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy sil" then
		local lol = game.Workspace.Ignored.Shop["[SilencerAR] - $1250"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(2)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)	
	elseif msg == ".buy mask" then
		local lol = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"]
		game.Players.LocalPlayer.Character:MoveTo(lol.Head.Position)
		wait(.1)
		fireclickdetector(lol.ClickDetector,4)
		wait(0.25)
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Mask") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Mask").Parent = game.Players.LocalPlayer.Character
		end
		wait(2)
		game.Players.LocalPlayer.Character.Mask:Activate()
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(AncientPOS)
	elseif msg:sub(1, 5) == ".tl"  then
		for i,v in pairs(game.Players:GetPlayers()) do 
			if v.Name:lower():sub(1,#msg:sub(7)) == msg:sub(7):lower() then
				nukerowner = v.Name
				if game.Players.LocalPlayer.Backpack:FindFirstChild("[Taser]") then
					game.Players.LocalPlayer.Backpack:FindFirstChild("[Taser]").Parent = game.Players.LocalPlayer.Character
					game.Players.LocalPlayer.Character["[Taser]"]:Activate()
				else
					Not("Buy taser first noob",4833645592,"Primos Script")
				end
				
				pcall (function()
					game.Players.LocalPlayer.Character["[Taser]"].Handle.ChildAdded:Connect(function(obj)
						if obj.Name == "Part" then
							repeat
								obj.CFrame = game.Players[nukerowner].Character.HumanoidRootPart.CFrame
								wait()
							until not obj:IsDescendantOf(game) -- destroyed
						end
					end)
				end)
				end
		end
	elseif msg:sub(1,8) == ".getaudio" then
		local pl = GetPlayer(msg:sub(10))
		local TargetPlr = pl.Name
		local SoundIdZ = workspace.Players[TargetPlr].LowerTorso.BOOMBOXSOUND
		local id = SoundIdZ.SoundId:match("%d+")
		local Asset = game:GetService("MarketplaceService"):GetProductInfo(id)
		if plr.Character:FindFirstChild("Humanoid") then
			print(Asset.Name.." - "..id)
			game.StarterGui:SetCore("SendNotification", {
				Title = "Primos Script"; -- the title (ofc)
				Text = Asset.Name.." - "..id; -- what the text says (ofc)
				Duration = 30; -- how long the notification should in secounds
			})
			setclipboard(id)

		end
	end


end)



delay(0, function()
	while wait() do
		pcall(function()
			if game.Workspace.Ignored:FindFirstChild("Launcher") and nuking == true and workspace.Players:FindFirstChild(nukerowner) then
				local lol = game.Workspace.Ignored:FindFirstChild("Launcher")

				if lol:FindFirstChildOfClass("BodyVelocity") then
					wait()
					lol.BodyVelocity:Destroy()
				end

				if lol:FindFirstChild("BodyVelocity") == nil then
					lol.CFrame = CFrame.new(workspace.Players[nukerowner].LowerTorso.CFrame.X,workspace.Players[nukerowner].LowerTorso.CFrame.Y+6.5,workspace.Players[nukerowner].LowerTorso.CFrame.Z)
				end

			elseif game.Workspace.Ignored:FindFirstChild("Handle") and nuking == true then
				local lol = game.Workspace.Ignored:FindFirstChild("Handle")

				if lol:FindFirstChild("Pin") then
					lol.CFrame = CFrame.new(workspace.Players[nukerowner].LowerTorso.CFrame.X,workspace.Players[nukerowner2].LowerTorso.CFrame.Y+8,workspace.Players[nukerowner].LowerTorso.CFrame.Z)
				end
			end
		end)
	end
end)

delay(0, function()
	while wait() do
		pcall(function()
			if game.Workspace.Ignored:FindFirstChild("Grenade") and nuking == true and workspace.Players:FindFirstChild(nukerowner) then
				local lol = game.Workspace.Ignored:FindFirstChild("Grenade")

				if lol:FindFirstChildOfClass("BodyVelocity") then
					wait()
					lol.BodyVelocity:Destroy()
				end

				if lol:FindFirstChild("BodyVelocity") == nil then
					lol.CFrame = CFrame.new(workspace.Players[nukerowner].Head.CFrame.X,workspace.Players[nukerowner].Head.CFrame.Y+6.5,workspace.Players[nukerowner].Head.CFrame.Z)
				end

			elseif game.Workspace.Ignored:FindFirstChild("Handle") and nuking == true then
				local lol = game.Workspace.Ignored:FindFirstChild("Handle")

				if lol:FindFirstChild("Pin") then
					lol.CFrame = CFrame.new(workspace.Players[nukerowner].Head.CFrame.X,workspace.Players[nukerowner].Head.CFrame.Y+8,workspace.Players[nukerowner].Head.CFrame.Z)
				end
				if game.Players[nukerowner].Character.BodyEffects['K.O'].Value == true then
					if nuking == true then
						nuking = false
					end
				end

			end
		end)
	end
end)

delay(0, function()
	while wait(120) do
		pcall(function()
			game.StarterGui:SetCore("SendNotification", {Title = "Primos Script", Text = "wena tata, "..game.Players.LocalPlayer.Name " estas disfrutando mi script?", Icon = "", Duration = 5, Button1 = "oc"})
		end)
	end
end)
