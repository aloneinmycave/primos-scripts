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
