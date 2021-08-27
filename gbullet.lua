        local LocalPlayer = game:GetService("Players").LocalPlayer
		LocalPlayer.Character.BodyEffects.Armor:Destroy()
	
		pcall(function()
			while wait() do
				local mouse = game.Players.LocalPlayer:GetMouse()
				local Shit_1 = "UpdateMousePos"
				local Shit_2 = Vector3.new(mouse.Hit.Position.X, mouse.Hit.Position.Y,mouse.Hit.Position.Z)
				local Event = game:GetService("ReplicatedStorage").MainEvent
				Event:FireServer(Shit_1, Shit_2)
			end
		end)
