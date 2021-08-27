    local savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop["[Surgeon Mask] - $25"].Head.CFrame
		wait(0.35)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)
		wait(.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedpos
		wait(.1)
		game.Players.LocalPlayer.Backpack["[Surgeon Mask]"].Parent = game.Players.LocalPlayer.Character
		wait(.1)
		game.Players.LocalPlayer.Character["[Surgeon Mask]"]:Activate()
