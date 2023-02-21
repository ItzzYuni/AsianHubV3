_G.OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local OrionLib = _G.OrionLib
local Window = OrionLib:MakeWindow({Name = "[V3] ™AsianHub Universal Visuals", IntroText ="™AsianHub Premium Suite", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

--[]

local lp = game:GetService("Players").LocalPlayer
local req = (type(syn) == "table" and syn.request) or (type(http) == "table" and http.request) or (type(fluxus) == "table" and fluxus.request) or http_request or request
local queue_on_teleport = (type(syn) == "table" and syn.queue_on_teleport) or (type(fluxus) == "table" and fluxus.queue_on_teleport) or queue_on_teleport
local hue = .0

for _, v in pairs(cont:FindFirstChild("Sounds"):GetChildren()) do
    table.insert(soundlist, 1, v.Name)
end

function setp(inst, prop)
    local r = type(prop) == "table" and prop or {}
    for i, v in pairs(r) do
        inst[i] = v
    end
end

if _G.IniNDS then
	_G.OrionLib:MakeNotification({
		Name = "Error - Already executed.",
		Content = "Tap RightShift to enable interface or rejoin the game if you have any issues.",
		Image = "rbxassetid://6962520787",
		Time = 6.5
	})
	return
end

repeat task.wait()
until game:IsLoaded()

getgenv().cham = false
getgenv().nameESP = false
getgenv().boxESP = false
getgenv().esp_loaded = false
getgenv().Visibility = false

--]

-- Home

local PrivateHome = Window:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://11129688807",
	PremiumOnly = false
})
PrivateHome:AddLabel("Updates")
PrivateHome:AddParagraph("Updates V3","Released!")
PrivateHome:AddLabel("Credits")
PrivateHome:AddParagraph("Developer","EnzoBRZ#6461")

-- Visuals

local PrivateVisuals = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://11129781601",
	PremiumOnly = false
})
PrivateVisuals:AddToggle({
	Name = "Enable ESP",
	Default = getgenv().Visibility,
	Callback = function(Value)
		if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().Visibility = Value
	end    
})
PrivateVisuals:AddToggle({
	Name = "Enable Box ESP",
	Default = getgenv().Visibility,
	Callback = function(Value)
		if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().boxESP = Value
	end    
})
PrivateVisuals:AddToggle({
	Name = "Enable Name ESP",
	Default = getgenv().Visibility,
	Callback = function(Value)
		if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().nameESP = Value
	end    
})
PrivateVisuals:AddToggle({
	Name = "Enable Chams ESP",
	Default = getgenv().Visibility,
	Callback = function(Value)
		if getgenv().esp_loaded == false and Value == true then
            getgenv().esp_loaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua", true))()
        end
		getgenv().cham = Value
	end    
})
PrivateVisuals:AddToggle({
    Name = "Enable Team Color",
    Default = false,
    Callback = function(Value)
        getgenv().useTeamColor = Value
    end
})

-- Credits

local PrivateCredits = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://6723742952",
	PremiumOnly = false
})
PrivateCredits:AddTextbox({
	Name = "Teleport To Player",
	Default = "default box input",
	TextDisappear = true,
	Callback = function(Value)
        if not OrionLib.Flags.autofarm.Value and Value ~= "" then
            for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                if (Value:lower() ~= lp.Name:lower():sub(1, #Value) or Value:lower() ~= lp.DisplayName:lower():sub(1, #Value)) and (Value:lower() == v.Name:lower():sub(1, #Value) or Value:lower() == v.DisplayName:lower():sub(1, #Value)) then
                    lp.Character:PivotTo(v.Character.PrimaryPart.CFrame + Vector3.new(0, 4.5, 0))
                end
            end
        end
	end
})
PrivateCredits:AddParagraph("Developer","EnzoBRZ#6461")
PrivateCredits:AddLabel("[Server Stuff]")
PrivateCredits:AddButton({
    Name = "Server-Hop",
    Callback = function()
        if req then
            notify("In Progress...", "Fetching servers, this might take a while...", "rbxassetid://6962520787", 5)
            local servers = {}
            local body = game:GetService("HttpService"):JSONDecode(req({Url = ("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId)}).Body)
            if body and body.data then
                for i, v in next, body.data do
                    if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                        table.insert(servers, 1, v.id)
                    end
                end
            end
            if #servers > 0 then
                notify("Teleporting...", "Teleport in progress, please wait...", "rbxassetid://6962520787", 5)
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], lp)
            else
                return notify("Error.", "Couldn't find a server, try again later.", "rbxassetid://6962520787", 7.5)
            end
        else
            notify("Error.", "Your exploit is unsupported. (Missing function: request)", "rbxassetid://6962520787", 7.5)
        end
    end
})
PrivateCredits:AddButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
        notify("Teleporting...", "Teleport in progress, please wait...", "rbxassetid://6962520787", 5)
    end
})
PrivateCredits:AddLabel("[GUI Stuff]")
PrivateCredits:AddButton({
	Name = "Destroy GUI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})
PrivateCredits:AddToggle({
    Name = "Keep GUI",
    Default = keepgui or false,
    Callback = function(Value)
        if not queue_on_teleport and Value then
            notify("Error.", "Your exploit is unsupported. (Missing function: queue_on_teleport)", "rbxassetid://6962520787", 7.5)
        end
    end,
    Flag = "keepgui"
})

-- End of Code

lp.OnTeleport:Connect(function() --Keep GUI
    if queue_on_teleport and OrionLib.Flags.keepgui.Value then
        queue_on_teleport([[
            repeat task.wait()
            until game:IsLoaded()
            keepgui = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/73GG/Game-Scripts/main/Natural%20Disaster%20Survival.lua"))()
            ]])
    end
end)

OrionLib:MakeNotification({
	Name = "™AsianHub Private ESP",
	Content = "Enjoy destroying kids now :))",
	Image = "rbxassetid://4483345998",
	Time = 3.5
})

_G.IniNDS = false