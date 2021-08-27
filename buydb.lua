        local Plr = game.Players.LocalPlayer
        local OldPos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
        wait(0.3)
        Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Double-Barrel - SG] - $1400"].Head.CFrame
        wait(0.35)
        fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
        wait(0.4)
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(OldPos)
        wait(0.25)
