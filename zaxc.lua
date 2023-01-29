local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Auto Farm - Nuke Simulator", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionOMG"})

autoegg = "Silo 1"
local names = {"Nuke Shop", "City", "Jungle", "Desert", "Beach", "Site Deep Blue", "Test Lab 33", "Volcano HQ", "Moon Base", "Excavation Site 42", "Dark Side Station", "Dark Lab 33", "Cybertopia"}

-- Unlock OpenGUI Everywhere
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3882.45751953125, 635.9100341796875, -3726.45703125) -- City
task.wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4897.2958984375, 634.9771118164062, -2855.522216796875) -- Beach
task.wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3766.79931640625, 854.472900390625, 3335.408935546875) -- MoonBase
task.wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1345.509033203125, 837.1240234375, 3399.826171875) -- Dark Side
task.wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1747.055419921875, 836.968017578125, 3343.113037109375) -- Dark Lab
task.wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4316.16162109375, 1580.4276123046875, -458.22406005859375) -- Cybertopia
task.wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3989.4306640625, 637.9024047851562, -4214.2392578125) -- Base Spawn


local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local function click(a)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
end

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Main"
})

Tab:AddToggle({
	Name = "Auto Collect All Drop",
	Default = false,
	Callback = function(bool)
	getgenv().collectalldrop = bool
        task.spawn(function()
        while collectalldrop and task.wait() do
        for i,v in pairs(workspace.CurrencyDrops:GetChildren()) do
        v.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        end
        end
end)
	end    
})

timechestnm = "AutoClaimChest"
timechestnm2 = game:GetService("Workspace").Chests.NormalChest.Root.BillboardGui.Time.Text

Tab:AddToggle({
	Name = timechestnm,
	Default = false,
	Callback = function(bool)
		getgenv().claimnmchest = bool
        task.spawn(function()
        while claimnmchest and task.wait() do
        if game:GetService("Workspace").Chests.NormalChest.Root.BillboardGui.Time.Text == "Claim" then
        Workspace.Chests.NormalChest.OnTouch.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        task.wait(5)
        Workspace.Chests.NormalChest.OnTouch.CFrame = game:GetService("Workspace").Chests.NormalChest.Root.CFrame
        end
end
end)
	end    
})

local Section = Tab:AddSection({
	Name = "Time Chest"
})
local CoolLabel = Tab:AddLabel("...")

local Section = Tab:AddSection({
	Name = "Sup"
})

Tab:AddButton({
	Name = "AntiAFK",
	Callback = function()
      	local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
  	end    
})

local Tab = Window:MakeTab({
	Name = "OpenEgg",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "AutoOpenEgg"
})

Tab:AddDropdown({
	Name = "Select Egg",
	Default = "Silo 1",
	Options = {"Silo 1", "Silo 2", "G Silo 3", "G Silo 4", "Silo 5", "Silo 6", "G Silo 7", "G Silo 8", "Silo 9", "Silo 10","G Silo 11", "G Silo 12", "Silo 13", "Silo 14", "G Silo 15", "G Silo 16", "Silo 17", "Silo 18", "G Silo 19", "G Silo 20","Silo 21", "Silo 22", "G Silo 23", "G Silo 24", "Silo 25", "Silo 26", "G Silo 27", "G Silo 28", "Silo 29", "Silo 30",  "G Silo 31", "G Silo 32", "Lunar 1", "G Lunar 2", "Lunar 3", "G Lunar 4", "Lunar 5", "G Lunar 6", "Lunar 7", "G Lunar 8", "ChineseNewYear1", "ChineseNewYear2", "cyber 1", "cyber 2"},
	Callback = function(Value)
		autoegg = (Value)
	end    
})

Tab:AddToggle({
	Name = "Auto OpenEgg",
	Default = false,
	Callback = function(bool)
		getgenv().autoopeneggz = bool
        task.spawn(function()
        while autoopeneggz and task.wait() do
        local args = {
            [1] = autoegg
        }
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EggService.RF.Buy3x:InvokeServer(unpack(args))
        task.wait(1)
end
end)
	end    
})

local Tab = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Teleport"
})

Tab:AddDropdown({
	Name = "SelectMap",
	Options = names,
	Callback = function(Value)
	for i,v in pairs(game:GetService("Workspace").TeleportLocations:GetChildren())do
    if v:IsA("Part") and v.Name == (Value) then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
    end
    end
	end    
})

local Tab = Window:MakeTab({
	Name = "Other",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "OpenGUI Everywhere"
})

Tab:AddButton({
	Name = "ShinyMachine",
	Callback = function()
      	Workspace.Machines.ShinyMachine.OnTouch.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        task.wait(60)
        Workspace.Machines.ShinyMachine.OnTouch.CFrame = game:GetService("Workspace").Machines.ShinyMachine.Root.CFrame
  	end    
})

Tab:AddButton({
	Name = "EnchanterMachine",
	Callback = function()
      	Workspace.Machines.EnchanterMachine.OnTouch.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        task.wait(60)
        Workspace.Machines.EnchanterMachine.OnTouch.CFrame = game:GetService("Workspace").Machines.EnchanterMachine.Root.CFrame
  	end    
})


Tab:AddButton({
	Name = "PlayerUpgrades",
	Callback = function()
      	Workspace.Machines.PlayerUpgrades.Root.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        task.wait(60)
        Workspace.Machines.PlayerUpgrades.Root.CFrame = game:GetService("Workspace").Machines.PlayerUpgrades.PinkRingThing.CFrame
  	end    
})


Tab:AddButton({
	Name = "RainbowMachine",
	Callback = function()
      	Workspace.Machines.RainbowMachine.OnTouch.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        task.wait(60)
        Workspace.Machines.RainbowMachine.OnTouch.CFrame = game:GetService("Workspace").Machines.RainbowMachine.Root.CFrame
  	end    
})

_G.toggle = true -- update time chest
while _G.toggle do
wait()
timechestnm3 = game:GetService("Workspace").Chests.NormalChest.Root.BillboardGui.Time.Text
CoolLabel:Set(timechestnm3)
end


OrionLib:Init()
