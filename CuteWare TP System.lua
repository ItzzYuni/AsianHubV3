-- Opened Sourced!
-- Made by EnzoBRZ#6461

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
local Window = Rayfield:CreateWindow({
    Name = "[V3] ™CuteWare Lua Softworks TP System",
    LoadingTitle = "Injecting...",
    LoadingSubtitle = "by CuteWare",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = ""
    },
    Discord = {
       Enabled = false,
       Invite = "",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "",
       Subtitle = "",
       Note = "",
       FileName = "",
       SaveKey = false,
       GrabKeyFromSite = false,
       Key = ""
    }
})

---- Local Functions

local Players = game:GetService("Players")
local PlayList = {}
for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        local name = v.Name .. " / " .. v.DisplayName
        table.insert(PlayList, v.Name)
    end
end

-- Tab

local UtilitiesTab = Window:CreateTab("Teleport-Utilties", 4483362458)

-- Dropdown

local Dropdown = UtilitiesTab:CreateDropdown({
   Name = "Player Teleport",
   Options = PlayList,
   CurrentOption = "None",
   Flag = "Dropdown1",
   Callback = function(Option)
    local targetPlayer = Players:FindFirstChild(string.split(Option, " / ")[1])
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local tween_s = game:GetService("TweenService")
            local tweeninfo = TweenInfo.new(1, Enum.EasingStyle.Linear)
            local cf = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position)
            local a = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweeninfo, { CFrame = cf })
            a:Play()
        end
   end,
})

-- Button

local Button = UtilitiesTab:CreateButton({
    Name = "Refresh PlayerList",
    Info = "Refresh's Player List",
    Interact = 'Refresh',
    Callback = function()
        table.clear(PlayList)
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                table.insert(PlayList,v.Name)
            end
        end
        Dropdown:Refresh(PlayList, "nil")
    end,
})
