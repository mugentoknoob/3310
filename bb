local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Auto Farm - เกมปาคนอ้วน", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionOMG"})

if game:GetService("Players").LocalPlayer.PlayerGui.Main.Center.Rebirth.AutoRebirth.Locked.Visible == true then
game:GetService("Players").ShocuteZ.PlayerGui.Main.Center.Rebirth.AutoRebirth.Locked.Visible = false
else
end

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
	Name = "Auto Collect Star!",
	Default = false,
	Callback = function(bool)
	getgenv().collectalldrop = bool
        while collectalldrop and task.wait() do
        pcall(function()
        for v22, v23 in pairs(workspace.Stars:GetChildren()) do
        if v23:IsA("Model") and not v23:GetAttribute("IsBeingPulledByMagnet") then
        v23:SetAttribute("IsBeingPulledByMagnet", true);
        require(game:GetService("ReplicatedStorage").Get.Client.Stars).MagnetStarToPlayer(v23, 0.06 + 40 / 100);
   end;
end
        end)
end
	end    
})


Tab:AddButton({
	Name = "AutoRebirth ON",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
   	    require(game:GetService("ReplicatedStorage").Get.Client.UI.Rebirth).AutoEnabled = true
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Center.Rebirth.AutoRebirth.TheText.Text = "AutoRebirth : ON"
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Center.Rebirth.AutoRebirth.BackgroundTransparency = 1
end
})

Tab:AddButton({
	Name = "AutoRebirth OFF",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		require(game:GetService("ReplicatedStorage").Get.Client.UI.Rebirth).AutoEnabled = false
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Center.Rebirth.AutoRebirth.TheText.Text = "AutoRebirth : OFF"
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Center.Rebirth.AutoRebirth.BackgroundTransparency = 0
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


OrionLib:Init()
