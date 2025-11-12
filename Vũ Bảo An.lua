# VuBaoAn
Vũ Bảo An Hub
-- VŨ BẢO AN HUB
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("VŨ BẢO AN HUB", "Sentinel")

-- MAIN TAB
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Main Features")

MainSection:NewButton("Infinite Slide", "Slide vô hạn", function()
    local slideActive = true
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(10000, 0, 10000)
    bodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if slideActive and bodyVelocity.Parent then
            bodyVelocity.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 60
        else
            connection:Disconnect()
        end
    end)
    
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        local root = char:WaitForChild("HumanoidRootPart")
        bodyVelocity.Parent = root
    end)
end)

MainSection:NewButton("Speed Boost", "Tăng tốc độ", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end)

MainSection:NewButton("High Jump", "Nhảy cao", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

-- PLAYER TAB
local PlayerTab = Window:NewTab("Player")
local PlayerSection = PlayerTab:NewSection("Player Settings")

PlayerSection:NewSlider("WalkSpeed", "Tốc độ chạy", 500, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

PlayerSection:NewSlider("JumpPower", "Lực nhảy", 500, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

-- CREDITS
local CreditTab = Window:NewTab("Credits")
local CreditSection = CreditTab:NewSection("Made by VŨ BẢO AN")
