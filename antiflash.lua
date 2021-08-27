        while wait() do
			local XD = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui
	
			if XD:FindFirstChild("whiteScreen") then
				XD.whiteScreen:Destroy()
			end
			wait(0.2)
		end
