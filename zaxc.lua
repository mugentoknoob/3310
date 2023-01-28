local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Auto Farm - Nuke Simulator", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionOMG"})

autoegg = "Silo 1"

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
	Name = "Main - AutoFarm"
})

Tab:AddToggle({
	Name = "Auto Collect All Drop!",
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

Tab:AddDropdown({
	Name = "Select Egg",
	Default = "Silo 1",
	Options = {"Silo 1", "Silo 2", "G Silo 3", "G Silo 4", "Silo 5", "Silo 6", "G Silo 7", "G Silo 8", "Silo 9", "Silo 10","G Silo 11", "G Silo 12", "Silo 13", "Silo 14", "G Silo 15", "G Silo 16", "Silo 17", "Silo 18", "G Silo 19", "G Silo 20","Silo 21", "Silo 22", "G Silo 23", "G Silo 24", "Silo 25", "Silo 26", "G Silo 27", "G Silo 28", "Silo 29", "Silo 30",  "G Silo 31", "G Silo 32", "Lunar 1", "G Lunar 2", "Lunar 3", "G Lunar 4", "Lunar 5", "G Lunar 6", "Lunar 7", "G Lunar 8", "ChineseNewYear1", "ChineseNewYear2"},
	Callback = function(Value)
		autoegg = (Value)
	end    
})

Tab:AddToggle({
	Name = "Auto OpenEgg!",
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

Tab:AddToggle({
	Name = "Auto Claim Chest!",
	Default = false,
	Callback = function(bool)
		getgenv().claimnmchest = bool
        task.spawn(function()
        while claimnmchest and task.wait() do
        local args = {
            [1] = "NormalChest"
        }
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ChestService.RE.Claim:FireServer(unpack(args))
        task.wait(2)
end
end)
	end    
})

local Section = Tab:AddSection({
	Name = "Other"
})

Tab:AddButton({
	Name = "AntiAFK!",
	Callback = function()
      	local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
  	end    
})

--[[
Name = <string> - The name of the section.
]]


OrionLib:Init()
