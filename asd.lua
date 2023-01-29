local DarkraiX = loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Kavo-Ui/main/Darkrai%20Ui", true))()
local Library = DarkraiX:Window("Auto Farm","","",Enum.KeyCode.RightControl);

cooldownrb = "1"

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local function click(a)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
end

Tab1 = Library:Tab("Earth")

Tab1:Seperator("Auto Farm Earth")

Tab1:Toggle("Auto Wave",false,function(bool)
getgenv().autojb = bool
    
    task.spawn(function()
        while autojb and task.wait() do
        if lp.PlayerGui.Wave.Enabled == true then
        task.wait(0.2)
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0.07340412586927414, 3.38608407974242316, -42.727420806884766))
        else if lp.PlayerGui.Wave.Enabled == false then
        task.wait(0.2)
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-1.7648562788963318, 3.386082649230957, -28.25))
        end
        end
        end
end)
end)

Tab1:Toggle("Auto Attack [ Use for Auto Wave ]",false,function(bool)
getgenv().autoatk01 = bool
    
    task.spawn(function()
        while autoatk01 and task.wait() do
        if lp.PlayerGui.Wave.CurrentWave.Text == "Wave 1/100" and lp.PlayerGui.Wave.Enabled == true  then
        task.wait(1)
        click(lp.PlayerGui.Controls.Desktop.Attack.ImageLabel)
        else if lp.PlayerGui.Wave.Enabled == false then
        end
        end
        end
end)
end)

Tab1:Toggle("Auto Rebirth",false,function(bool)
getgenv().autorb = bool
    task.spawn(function()
        while autorb and task.wait() do
        if lp.PlayerGui.HUD.Main.Gems.Amount.Text > "1,000" then
        task.wait(cooldownrb)
        click(lp.PlayerGui.HUD.Main["Button Holder"].Rebirth)
        task.wait(3)
        click(lp.PlayerGui.Menu.Tabs.Rebirth.Content.Purchase)
        task.wait(3)
        click(lp.PlayerGui.Menu.Tabs.Rebirth.Exit)
        end
        end
end)
end)

Tab1:Seperator("Settings")

Tab1:Slider("Cooldown Auto Rebirth",30,120,30,function(value)
        cooldownrb = (value)
    end)

Tab1:Seperator("Other")

Tab1:Button("Destroy GUI",function()
    DarkraiX:ToggleUi()
end)

-- Space

Tab1 = Library:Tab("Space")

Tab1:Seperator("Auto Farm Space")

Tab1:Toggle("Auto Wave",false,function(bool)
getgenv().autojb2 = bool
    
    task.spawn(function()
        while autojb2 and task.wait() do
        if lp.PlayerGui.Wave.Enabled == true then
        task.wait(0.2)
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0.07340412586927414, 3.38608407974242316, -42.727420806884766))
        else if lp.PlayerGui.Wave.Enabled == false then
        task.wait(0.2)
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1396.8380126953125, 3.147925853729248, -29.104999542236328))
        end
        end
        end
end)
end)

Tab1:Toggle("Auto Attack [ Use for Auto Wave ]",false,function(bool)
getgenv().autoatk02 = bool
    
    task.spawn(function()
        while autoatk02 and task.wait() do
        if lp.PlayerGui.Wave.CurrentWave.Text == "Wave 51/150" and lp.PlayerGui.Wave.Enabled == true  then
        task.wait(.5)
        click(lp.PlayerGui.Controls.Desktop.Attack.ImageLabel)
        else if lp.PlayerGui.Wave.Enabled == false then
        end
        end
        end
end)
end)

Tab1:Toggle("Auto Rebirth",false,function(bool)
getgenv().autorb = bool
    task.spawn(function()
        while autorb and task.wait() do
        if lp.PlayerGui.HUD.Main.Gems.Amount.Text > "1,000" then
        task.wait(cooldownrb)
        click(lp.PlayerGui.HUD.Main["Button Holder"].Rebirth)
        task.wait(2)
        click(lp.PlayerGui.Menu.Tabs.Rebirth.Content.Purchase)
        task.wait(2)
        click(lp.PlayerGui.Menu.Tabs.Rebirth.Exit)
        end
        end
end)
end)

Tab1:Seperator("Settings")

Tab1:Slider("Cooldown Auto Rebirth",1,120,1,function(value)
        cooldownrb = (value)
    end)

Tab1:Seperator("Other")

Tab1:Button("Destroy GUI",function()
    DarkraiX:ToggleUi()
end)
