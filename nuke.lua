        if not game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]") then
			game.StarterGui:SetCore("SendNotification", {
				Title = "Primos-Script";
				Text = "Compra de 5-20 granadas.";
				Duration = 15;
			})
		end
	
	
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
		end
