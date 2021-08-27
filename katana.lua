        local lplayer = game.Players.LocalPlayer
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				local a = Instance.new("SelectionBox",v.Handle)
				a.Adornee = v.Handle
				v.Handle.Size = Vector3.new(-30, 30 , -30)
				--plr.Character.Humanoid:UnequipTools()
			end
	
			print("a")
			local function getplrsname()
				for i,v in pairs(game:GetChildren()) do
					if v.ClassName == "Players" then
						return v.Name
					end
				end
			end
			local players = getplrsname()
			local plr = game[players].LocalPlayer
			coroutine.resume(coroutine.create(function()
				while  wait(1) do
					coroutine.resume(coroutine.create(function()
						for _,v in pairs(game[players]:GetPlayers()) do
							if v.Name ~= plr.Name and v.Character then
								v.Character.LowerTorso.CanCollide = false
								v.Character.LowerTorso.Material = "Neon"
								v.Character.LowerTorso.Size = Vector3.new(4,4,4)
								v.Character.HumanoidRootPart.Size = Vector3.new(4,4,4)
							end
						end
					end))
				end
			end))
		end 
	
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do                 if v:isA("Tool") then                     local a = Instance.new("SelectionBox",v.Handle)                     a.Adornee = v.Handle                         v.GripPos = Vector3.new(0,15,0)                     lplayer.Character.Humanoid:UnequipTools()                 end end
