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
    elseif msg == ".naked" then
        if game.Players.LocalPlayer.Character.Shirt then
			game.Players.LocalPlayer.Character.Shirt:Remove()
		else
		end
		if game.Players.LocalPlayer.Character.Pants then
			game.Players.LocalPlayer.Character.Pants:Remove()
		else
		end
		if game.Players.LocalPlayer.Character["Shirt Graphic"] then
			game.Players.LocalPlayer.Character["Shirt Graphic"]:Remove()
		else
		end
