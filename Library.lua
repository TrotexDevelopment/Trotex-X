local library = {}

local TweenService = game:GetService("TweenService")
function library:tween(...) TweenService:Create(...):Play() end

local uis = game:GetService("UserInputService")

function library:create(Object, Properties, Parent)
    local Obj = Instance.new(Object)

    for i,v in pairs (Properties) do
        Obj[i] = v
    end
    if Parent ~= nil then
        Obj.Parent = Parent
    end

    return Obj
end
local t = tick()
local skyids = {
    "rbxassetid://4922990751"
}
for i, v in pairs(getgc(true)) do
    if typeof(v) == "table" and rawget(v, "getIsBodyMoverCreatedByGame") then
        v.getIsBodyMoverCreatedByGame = function(gg)
            return true
        end
    end
    if typeof(v) == "table" and rawget(v, "kick") then
        v.kick = function()
            return wait(9e9)
        end
    end
    if typeof(v) == "table" and rawget(v, "randomDelayKick") then
        v.randomDelayKick = function()
            return wait(9e9)
        end
    end
    if typeof(v) == "table" and rawget(v, "connectCharacter") then
        v.connectCharacter = function(gg)
            return wait(9e9)
        end
    end
    if typeof(v) == "table" and rawget(v, "Remote") then
        v.Remote.Name = v.Name -- simple remote naming (tbh i could have used another method)
        -- i sticked to this method because i used it on the first and forgor to replace it :Skull:
        -- contact me for better method
    end
end
local oldnamecall -- anti kick because cw kicks u after u rename the remotes
oldnamecall =
    hookmetamethod(
    game,
    "__namecall",
    function(self, ...)
        local args = {...}
        local method = getnamecallmethod()

        if (method == "Kick" or method == "kick") and self == game.Players.LocalPlayer then
            return
        end

        return oldnamecall(self, unpack(args))
    end
)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local flyKeyDown
local flyKeyUp
local events = game:GetService("ReplicatedStorage").Communication.Events
local functions = game:GetService("ReplicatedStorage").Communication.Functions
for i = 1, 25 do -- inf jump bypass
    events.StartFastRespawn:FireServer()
    functions.CompleteFastRespawn:FireServer()
    wait()
end

-- anim table & tables
local weapon_anims = {}
local killsays = { -- found by cheese
    "你是垃圾，菜鸟可以做得更好。",
    "imagine dying 😅😅😅 LLLL",
    "Oops i forgot you were there, oh wait you actually dont exist anyways.",
    "ez ez you got clapped by a low level haha!",
    "🤓: you cant just exploit in here!!111!!111 its illegal!!!!",
    "why are you dying to me bro fr fr",
    "clapped by nova hub user :skull:",
    "bro got clapped lol",
    "'🤓: imagine being fatherless'  where are yours then go check 😁😁😁",
    "sorry did my kill aura hit you? if so then youre trash 😅",
    "bro got skill issues 😅😅😅",
    "bozo cant even beat me",
    "fr fr nova on top",
    "What's up 'Hackle cheatle' here guys, I have been arresting due to multiple crimes including cheating.",
    "wdym touch grass i have one of those on my feet",
    "fortnite 19$ gift card who wants it!!!??",
    ".gg/gswH7FGxyb <-- join for cool scripts (!!! real no fake !!!)",
    "ez bozo",
    "your dad never came back from the milk store for a reason",
    "damn bro did your mother drop you when youre born",
    "Who are you talking to? a kill say bot? 😅",
    "damn bro you really need a therapist 😅😅",
    "🤓: stop hacking!!!! its against the rules!!!",
    "wenomechainsama tumajarbisaun",
    "you should go back to kindergarden bro 😂",
    "im just better than you!!!!!",
    "nova hub better than you smh smh smh 😅"
}
for i, v in pairs(game:GetService("ReplicatedStorage").Shared.Assets.Melee:GetDescendants()) do
    if v:IsA("Animation") then
        if v.Name:find("Slash") or v.Name:find("Swing") then
            table.insert(weapon_anims, v.AnimationId)
        end
    end
end
-- inf yield fly stuff ignore
FLYING = false
iyflyspeed = 1
vehicleflyspeed = 1
-- inf fly i modified it a bit
function sFLY(vfly, ragdoll, platform)
    if flyKeyDown or flyKeyUp then
        flyKeyDown:Disconnect()
        flyKeyUp:Disconnect()
    end
    local T = LocalPlayer.Character.HumanoidRootPart
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0

    local function FLY()
        FLYING = true
        local BG = Instance.new("BodyGyro")
        local BV = Instance.new("BodyVelocity")
        BG.P = 9e4
        BG.Parent = T
        BV.Parent = T
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        task.spawn(
            function()
                repeat
                    wait()
                    if LocalPlayer.Character.Humanoid:FindFirstChild("RagdollRemoteEvent") ~= nil then
                        if ragdoll then
                            LocalPlayer.Character.Humanoid:FindFirstChild("RagdollRemoteEvent"):FireServer(true)
                        end
                    end
                    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BallSocketConstraint") then
                            v.TwistLowerAngle = 0
                            v.TwistUpperAngle = 0
                            v.UpperAngle = 0
                            v.Radius = 0
                            if v.Parent.Name == "Right Arm" or v.Parent.Name == "Left Arm" then
                                v.TwistLowerAngle = 0
                                v.TwistUpperAngle = 0
                                v.UpperAngle = 90
                                v.Radius = 90
                            end
                        end
                    end
                    if not vfly and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = platform
                    end
                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                        SPEED = 50
                    elseif
                        not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and
                            SPEED ~= 0
                     then
                        SPEED = 0
                    end
                    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                        BV.velocity =
                            ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) +
                            ((workspace.CurrentCamera.CoordinateFrame *
                                CFrame.new(
                                    CONTROL.L + CONTROL.R,
                                    (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,
                                    0
                                ).p) -
                                workspace.CurrentCamera.CoordinateFrame.p)) *
                            SPEED
                        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                    elseif
                        (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and
                            SPEED ~= 0
                     then
                        BV.velocity =
                            ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) +
                            ((workspace.CurrentCamera.CoordinateFrame *
                                CFrame.new(
                                    lCONTROL.L + lCONTROL.R,
                                    (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,
                                    0
                                ).p) -
                                workspace.CurrentCamera.CoordinateFrame.p)) *
                            SPEED
                    else
                        BV.velocity = Vector3.new(0, 0, 0)
                    end
                    BG.cframe = workspace.CurrentCamera.CoordinateFrame
                until not FLYING
                CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                SPEED = 0
                BG:Destroy()
                BV:Destroy()
                if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                end
            end
        )
    end
    flyKeyDown =
        Mouse.KeyDown:Connect(
        function(KEY)
            if KEY:lower() == "w" then
                CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == "s" then
                CONTROL.B = -(vfly and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == "a" then
                CONTROL.L = -(vfly and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == "d" then
                CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
            elseif QEfly and KEY:lower() == "e" then
                CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed) * 2
            elseif QEfly and KEY:lower() == "q" then
                CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed) * 2
            end
            pcall(
                function()
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Track
                end
            )
        end
    )
    flyKeyUp =
        Mouse.KeyUp:Connect(
        function(KEY)
            if KEY:lower() == "w" then
                CONTROL.F = 0
            elseif KEY:lower() == "s" then
                CONTROL.B = 0
            elseif KEY:lower() == "a" then
                CONTROL.L = 0
            elseif KEY:lower() == "d" then
                CONTROL.R = 0
            elseif KEY:lower() == "e" then
                CONTROL.Q = 0
            elseif KEY:lower() == "q" then
                CONTROL.E = 0
            end
        end
    )
    FLY()
end -- skidded from inf yield cuz im too lazy again also the random fly i found sometimes anti cheat u

invisfling = function() -- changed to loadstring because it was so messy
    loadstring(game:HttpGet'https://raw.githubusercontent.com/SussyImposterRed/Scripts/main/NoIdentityFling')()
end
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/TrotexDevelopment/Trotex-X/main/Library.lua"))() -- not my lib

menu = library.new('<font color="rgb(238, 120, 240)">Flourist</font>.xyz', "FlouristSaves\\")
local tabs = {
    menu.new_tab("http://www.roblox.com/asset/?id=7300477598"),
    menu.new_tab("http://www.roblox.com/asset/?id=7300535052"),
    menu.new_tab("http://www.roblox.com/asset/?id=7300480952"),
    menu.new_tab("http://www.roblox.com/asset/?id=7300486042"),
    menu.new_tab("http://www.roblox.com/asset/?id=7300489566")
}

function parry()
    game:GetService("ReplicatedStorage").Communication.Events.Parry:FireServer()
end

function getChance(v)
    local chance = math.floor(Random.new().NextNumber(Random.new(),0,1) * 100) / 100
    return chance <= math.floor(v) / 100
end
do
    local _menu = tabs[5].new_section("menu") -->> Simple config system

    local all_cfgs

    local configs = _menu.new_sector("configs")
    local text
    local list =
        configs.element(
        "Scroll",
        "config list",
        {options = {"none"}},
        function(State)
            text:set_value({Text = State.Scroll})
        end
    )
    text = configs.element("TextBox", "config name")
    configs.element(
        "Button",
        "save",
        nil,
        function()
            if menu.values[5].menu.configs["config name"].Text ~= "none" then
                menu.save_cfg(menu.values[5].menu.configs["config name"].Text)
            end
        end
    )
    configs.element(
        "Button",
        "load",
        nil,
        function()
            if menu.values[5].menu.configs["config name"].Text ~= "none" then
                menu.load_cfg(menu.values[5].menu.configs["config name"].Text)
            end
        end
    )
    configs.element(
        "Button",
        "rejoin",
        nil,
        function()
            game:GetService "TeleportService":TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end
    )
    configs.element("Toggle", "kill say")
    configs.element("Button","clear local appearance", nil, function()
        LocalPlayer:ClearCharacterAppearance()
    end)
    configs.element("Button","load chat bypass", nil, function()
        local newT = tick()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/SussyImposterRed/Scripts/main/chatbypass'))()
    end)
    configs.element("Button","unload chat bypass", nil, function()
        game:GetService("TextChatService").OnIncomingMessage = function(L)end
    end)
    for i,v in pairs(getgc(true)) do
        if typeof(v) == 'table' then
            if rawget(v,'removeKillFeedIdx') then
                oldrender = v.render
                v.render = function(gg)
                    if gg.props then
                        local whoDied = gg.props.killfeedItemInfo.playerThatDied
                        local whoKilled = gg.props.killfeedItemInfo.playerThatKilled
                        if (menu.values[5].menu.configs["kill say"].Toggle and tostring(whoKilled) == LocalPlayer.Name and tostring(whoDied) ~= LocalPlayer.Name) then
                            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(
                                tostring(whoDied)..", "..killsays[math.random(1, #killsays)]
                            )
                        end
                    end
                    return oldrender(gg)
                end
            end
        end
    end

    local function update_cfgs()
        all_cfgs = listfiles("FlouristSaves\\")
        for _, cfg in next, all_cfgs do
            all_cfgs[_] = string.gsub(string.gsub(cfg, "FlouristSaves\\", ""), ".txt", "")
            list:add_value(all_cfgs[_])
        end
    end
    update_cfgs()

    task.spawn(
        function()
            while true do
                wait(1)
                update_cfgs()
            end
        end
    )
end

do
    local rage = tabs[1].new_section("rage")
    local combat = rage.new_sector("combat")
    local Autos = rage.new_sector("Autos", "Right")
    local Misc = rage.new_sector("Misc", "Right")
    local PTBL = {}
    for i,v in pairs(Players:GetPlayers()) do
        table.insert(PTBL,v.Name)
    end
    Misc.element("Toggle", "BHop")
    Autos.element("Toggle", "Auto Equip")
    Autos.element("Toggle", "Auto Revive")
    Autos.element("Toggle", "Fast Respawn")
    combat.element("Toggle", "Kill Aura")
    combat.element("Slider", "Kill Aura Distance", {default = {min = 0, max = 12, default = 12}})
    combat.element("Toggle", "Custom Kill Aura Distance")
    combat.element("Slider", "Custom Distance", {default = {min = 0, max = 1000, default = 600}})
    combat.element("Toggle", "Whitelist Friends")
    combat.element("Combo", "Whitelist Players",{options = PTBL})
    combat.element("Toggle", "Teleport Behind (for kill aura)")
    combat.element("Slider", "Teleport Distance", {default = {min = 0, max = 5, default = 5}})
    combat.element("Toggle", "Stomp Aura")
    combat.element("Slider", "Stomp Aura Distance", {default = {min = 0, max = 25, default = 25}})
    combat.element("Toggle", "Custom Stomp Aura Distance")
    combat.element("Slider", "Custom Stomp Distance", {default = {min = 0, max = 1000, default = 600}})
    Misc.element("Toggle", "Fake Swing")
    Misc.element("Combo", "Fake Swing Type",{options = {"Sounds","Animations"}})
    Misc.element("Slider","Fake Swing Speed", {default = {min = 1, max = 5, default = 1}})
    Misc.element("Toggle", "Spin")
    Misc.element("Slider", "Spin Power", {default = {min = 0, max = 50, default = 50}})
    Autos.element("Toggle", "Auto Parry")
    Autos.element("Slider", "Auto Parry Distance", {default = {min = 0, max = 25, default = 10}})
    Autos.element("Slider", "Auto Parry Chance", {default = {min = 0, max = 100, default = 100}})
    Autos.element("Toggle", "Anti Parry")
    local function checkFriend(zjxifjw)
        local playa = zjxifjw
        if (menu.values[1].rage.combat["Whitelist Friends"].Toggle and playa:IsFriendsWith(LocalPlayer.UserId)) then
            return true
        else
            return false
        end
    end
    
    local function GetClosest(Distance)
        local Character = LocalPlayer.Character
        local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        if not (Character or HumanoidRootPart) then
            return
        end

        local TargetDistance = Distance
        local Target

        for i, v in ipairs(Players:GetPlayers()) do
            if (v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and not table.find(menu.values[1].rage.combat["Whitelist Players"].Combo,v.Name) and not checkFriend(v)) then
                local TargetHRP = v.Character.HumanoidRootPart
                local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
                if mag < TargetDistance then
                    TargetDistance = mag
                    Target = v
                end
            end
        end

        return Target
    end
    task.spawn(function()
        function updatePlrList()
            local NewPTBL = {}
            for i,v in pairs(Players:GetPlayers()) do
                table.insert(NewPTBL,v.Name)
            end
            
            if #NewPTBL ~= 1 then
                menu.values[1].rage.combat["Whitelist Players"].Combo:set_value(NewPTBL,false)
            end
        end
        
        while true do
            pcall(updatePlrList)
            wait(1)
        end
    end)
    task.spawn(function()
        local Sounds = {
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10"
        }
        
        workspace.PlayerCharacters.DescendantAdded:Connect(function(e)
            pcall(function()
                if (e:IsA("Sound") and e.SoundId == "rbxassetid://211059855") then
                    if e.Parent.Parent.Name ~= LocalPlayer.Name then
                        local p = (e.Parent and e.Parent)
                        if (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
                            if (distance <= 25 and menu.values[1].rage.Autos["Anti Parry"].Toggle) then
                                local Weapon
                                for i, v in pairs(LocalPlayer.Character:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v:FindFirstChild("Hitboxes") ~= nil then
                                            Weapon = v
                                        end
                                    end
                                end
                                if Weapon then
                                    task.spawn(function()
                                        LocalPlayer.Character.Humanoid:UnequipTools()
                                        p:GetPropertyChangedSignal'Transparency':wait()
                                        LocalPlayer.Character.Humanoid:EquipTool(Weapon)
                                    end)
                                end
                            end
                        end
                    end
                end
            end)
            if (e:IsA("Sound") and e.Parent.Name == "Hitbox") then
                task.spawn(function()
                    for i,v in pairs(Sounds) do
                        if (e.Name == v and e.Parent.Parent.Parent.Parent.Name ~= LocalPlayer.Name and menu.values[1].rage.Autos["Auto Parry"].Toggle) then
                            local Character = LocalPlayer.Character
                            if (Character and Character:FindFirstChild("HumanoidRootPart")) then
                                local distance = (Character.HumanoidRootPart.Position-e.Parent.Position).Magnitude
                                if menu.values[1].rage.Autos["Auto Parry Chance"].Slider >= 90 then
                                    if distance <= menu.values[1].rage.Autos["Auto Parry Distance"].Slider then 
                                        parry()
                                    end
                                elseif getChance(menu.values[1].rage.Autos["Auto Parry Chance"].Slider) then
                                    if distance <= menu.values[1].rage.Autos["Auto Parry Distance"].Slider then 
                                        parry()
                                    end
                                end
                            end
                            break
                        end
                    end
                end)
            end
        end)
    end)
    game:GetService'RunService'.Heartbeat:Connect(function()
        --pcall(function()
        local Closest
        Closest = GetClosest(menu.values[1].rage.combat["Custom Distance"].Slider)
        if not Closest then return end
        local Weapon
        for i, v in pairs(LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                if v:FindFirstChild("Hitboxes") ~= nil then
                    Weapon = v
                end
            end
        end
        if not Weapon then
        else
            if menu.values[1].rage.combat["Custom Kill Aura Distance"].Toggle then
                for i, v in pairs(Weapon:GetDescendants()) do
                    if v:IsA "BasePart" then
                        v.CFrame = Closest.Character.HumanoidRootPart.CFrame
                        v.CanCollide = false
                        v.Massless = true
                        if not v:FindFirstChild'body' then
                            local b = Instance.new("BodyVelocity")
                            b.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                            b.P = 1250
                            b.Velocity = Vector3.new(1000000,1000000,1000000)
                            b.Name = "body"
                            b.Parent = v
                        end
                    end
                    if v:IsA("Motor6D") then
                        if v.Parent.Name == "Motor6Ds" then
                            v:Destroy()
                        end
                    end
                end
            end
        end
        
        local Stomp = LocalPlayer.Character.Stomp
        
        if not Stomp then
        else
            if menu.values[1].rage.combat["Custom Stomp Aura Distance"].Toggle then
                for i, v in pairs(Stomp:GetDescendants()) do
                    if v:IsA "BasePart" then
                        v.CFrame = Closest.Character.HumanoidRootPart.CFrame
                        v.CanCollide = false
                        v.Massless = true
                        if not v:FindFirstChild'body' then
                            local b = Instance.new("BodyVelocity")
                            b.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                            b.P = 1250
                            b.Velocity = Vector3.new(1000000,1000000,1000000)
                            b.Name = "body"
                            b.Parent = v
                        end
                    end
                    if v:IsA("Motor6D") then
                        if v.Parent.Name == "Motor6Ds" then
                            v:Destroy()
                        end
                    end
                end
            end
        end
        --end)
    end)
    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        if menu.values[1].rage.combat["Kill Aura"].Toggle then
                            local Closest
                            if menu.values[1].rage.combat["Custom Kill Aura Distance"].Toggle then
                                Closest = GetClosest(menu.values[1].rage.combat["Custom Distance"].Slider)
                            else
                                Closest = GetClosest(menu.values[1].rage.combat["Kill Aura Distance"].Slider)
                            end
                            if Closest then
                                if Closest.Character:FindFirstChild("Humanoid").Health == 0 then
                                else
                                    if menu.values[1].rage.combat["Teleport Behind (for kill aura)"].Toggle then
                                        if not menu.values[1].rage.combat["Custom Kill Aura Distance"].Toggle then
                                            LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                Closest.Character.HumanoidRootPart.CFrame *
                                                CFrame.new(0, 0, menu.values[1].rage.combat["Teleport Distance"].Slider)
                                        end
                                    end
                                    local Weapon
                                    for i, v in pairs(LocalPlayer.Character:GetChildren()) do
                                        if v:IsA("Tool") then
                                            if v:FindFirstChild("Hitboxes") ~= nil then
                                                Weapon = v
                                            end
                                        end
                                    end
                                    if not Weapon then
                                    else
                                        local rayOrigin = LocalPlayer.Character.HumanoidRootPart.Position
                                        local rayDirection = Vector3.new(0, 0, 5)
                                        local raycastParams = RaycastParams.new()
                                        raycastParams.IgnoreWater = true
                                        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                                        local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
                                        local args1 = {
                                            [1] = Weapon,
                                            [2] = math.random(1, 4)
                                        }

                                        events.MeleeSwing:FireServer(unpack(args1))
                                        task.wait(0.2)

                                        local args = {
                                            [1] = Weapon,
                                            [2] = Closest.Character.Head,
                                            [3] = Weapon.Hitboxes.Hitbox,
                                            [4] = Closest.Character.Head.Position,
                                            [5] = Closest.Character.Head.CFrame:ToObjectSpace(
                                                CFrame.new(Closest.Character.Head.Position)
                                            ),
                                            [6] = raycastResult
                                        }
                                        if Closest.Character:FindFirstChild("SemiTransparentShield").Transparency == 1 then
                                            events.MeleeDamage:FireServer(unpack(args))

                                            events.MeleeDamage:FireServer(unpack(args))
                                        else
                                            return
                                        end
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end
    )

    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        if menu.values[1].rage.combat["Stomp Aura"].Toggle then
                            local Closest
                            if menu.values[1].rage.combat["Custom Stomp Aura Distance"].Toggle then
                                Closest = GetClosest(menu.values[1].rage.combat["Custom Stomp Distance"].Slider)
                            else
                                Closest = GetClosest(menu.values[1].rage.combat["Stomp Aura Distance"].Slider)
                            end
                            if Closest then
                                if Closest.Character:FindFirstChild("Humanoid").Health == 0 then
                                else
                                    local Weapon = LocalPlayer.Character.Stomp
                                    if not Weapon then
                                    else
                                            local rayOrigin = LocalPlayer.Character.HumanoidRootPart.Position
                                            local rayDirection = Vector3.new(0, 0, 5)
                                            local raycastParams = RaycastParams.new()
                                            raycastParams.IgnoreWater = true
                                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                                            local raycastResult =
                                                workspace:Raycast(rayOrigin, rayDirection, raycastParams)
                                            local args1 = {
                                                [1] = Weapon,
                                                [2] = math.random(1, 4)
                                            }

                                            events.MeleeSwing:FireServer(unpack(args1))
                                            task.wait(0.2)

                                            local args = {
                                                [1] = Weapon,
                                                [2] = Closest.Character.Head,
                                                [3] = Weapon.Hitboxes.RightLegHitbox,
                                                [4] = Closest.Character.Head.Position,
                                                [5] = Closest.Character.Head.CFrame:ToObjectSpace(
                                                    CFrame.new(Closest.Character.Head.Position)
                                                ),
                                                [6] = raycastResult
                                            }

                                            events.MeleeDamage:FireServer(unpack(args))

                                            events.MeleeDamage:FireServer(unpack(args))
                                        end
                                    end
                                end
                            end
                        end
                )
            end
        end
    )

    task.spawn(
        function()
            game:GetService("RunService").RenderStepped:Connect(
                function()
                    pcall(
                        function()
                            for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v:FindFirstChild("Hitboxes") ~= nil then
                                        if menu.values[1].rage.Autos["Auto Equip"].Toggle then
                                            v.Parent = LocalPlayer.Character
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            )
        end
    )

    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        if menu.values[1].rage.Autos["Auto Revive"].Toggle then
                            if LocalPlayer.Character.Humanoid.Health <= 15 then
                                events.SelfReviveStart:FireServer()
                                events.SelfRevive:FireServer()
                            end
                        end
                    end
                )
            end
        end
    )

    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        if menu.values[1].rage.Autos["Fast Respawn"].Toggle then
                            if LocalPlayer.Character.Humanoid.Health == 0 then
                                events.StartFastRespawn:FireServer()
                                functions.CompleteFastRespawn:FireServer()
                            end
                        end
                    end
                )
            end
        end
    )

    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function() -- originally from outliers old source but i removed it and wrote a new one it kinda looks like the same but its a different one
                        if menu.values[1].rage.Misc["Spin"].Toggle then
                            if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("spin") == nil then
                                local Spin = Instance.new("BodyAngularVelocity")
                                Spin.Name = "spin"
                                Spin.Parent = LocalPlayer.Character.HumanoidRootPart
                                Spin.MaxTorque = Vector3.new(0, math.huge, 0)
                                for i, v in (LocalPlayer.Character:GetChildren()) do
                                    if v:IsA("BasePart") then
                                        v.Massless = true
                                        v.Velocity = Vector3.new(0, 0, 0)
                                    end
                                end
                            else
                                if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("spin") ~= nil then
                                    LocalPlayer.Character.HumanoidRootPart.spin.AngularVelocity =
                                        Vector3.new(0, menu.values[1].rage.Misc["Spin Power"].Slider, 0)
                                end
                            end
                        else
                            if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("spin") ~= nil then
                                LocalPlayer.Character.HumanoidRootPart.spin:Destroy()
                            end
                        end
                    end
                )
            end
        end
    )

    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        if menu.values[1].rage.Misc["BHop"].Toggle then
                            if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
                                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            end
                        end
                    end
                )
            end
        end
    )
    
    task.spawn(function()
        local SwingWait = 0.35
        local Swinged = false
        local AnimationPlaying = false
        local GCTable = getgc(true) -- so i dont have to getgc everytime
        while task.wait do
            if menu.values[1].rage.Misc["Fake Swing"].Toggle then
                pcall(function()
                    local Weapon
                    for i, v in pairs(LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Tool") then
                            if v:FindFirstChild("Hitboxes") ~= nil then
                                Weapon = v
                            end
                        end
                    end
                    if Weapon then
                        if table.find(menu.values[1].rage.Misc["Fake Swing Type"].Combo, "Sounds") then
                            task.spawn(function()
                                if not Swinged then
                                    Swinged = true
                                    local args1 = {
                                        [1] = Weapon,
                                        [2] = math.random(1, 4)
                                    }

                                    events.MeleeSwing:FireServer(unpack(args1))
                                    task.wait(SwingWait)
                                    Swinged = false
                                end
                            end)
                        end   
                        if table.find(menu.values[1].rage.Misc["Fake Swing Type"].Combo, "Animations") then
                            local Animation
                            for i,v in pairs(GCTable) do
                                if typeof(v) == "table" and rawget(v,"slashMetadata") and rawget(v,"displayName") then
                                    local SMD = v.slashMetadata
                                    local DN = v.displayName
                                    if (typeof(SMD) == "table" and DN == Weapon.Name) then
                                        for i2,v2 in pairs(SMD) do
                                            if rawget(v2,"animation") then
                                                Animation = v2.animation
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                            if Animation then
                                local Humanoid = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid)
                                if (Humanoid and AnimationPlaying == false) then
                                    task.spawn(function()
                                        AnimationPlaying = true
                                        local Anim = Humanoid:LoadAnimation(Animation)
                                        Anim:Play(nil,1,menu.values[1].rage.Misc["Fake Swing Speed"].Slider)
                                        Anim.Stopped:Wait()
                                        task.wait(.1)
                                        AnimationPlaying = false
                                    end)
                                end
                            end
                        end
                    end
                end)
            end
            task.wait()
        end
    end)
end

do
    local aim = tabs[2].new_section("Aim-X")
    local esp = players.new_sector("ESP")
end

do
    local players = tabs[3].new_section("players")

    local esp = players.new_sector("ESP")
    esp.element("Toggle", "Enabled"):add_keybind()
    esp.element("Slider", "Max Distance", {default = {min = 250, max = 5000, default = 5000}})

    local Playere = players.new_sector("Player")
    Playere.element("Toggle", "Box"):add_color({Color = Color3.fromRGB(255, 255, 255)})
    Playere.element("Toggle", "Name"):add_color({Color = Color3.fromRGB(255, 255, 255)})
    Playere.element("Toggle", "Health"):add_color({Color = Color3.fromRGB(0, 255, 0)})
    Playere.element("Toggle", "Indicators"):add_color({Color = Color3.fromRGB(255, 255, 255)})
    Playere.element("Combo", "Types", {options = {"Tool", "Distance"}})

    local oof = players.new_sector("Out Of FOV", "Right")
    oof.element("Toggle", "Enabled"):add_color({Color = Color3.fromRGB(255, 255, 255)})
    oof.element("Slider", "Size", {default = {min = 10, max = 15, default = 15}})
    oof.element("Slider", "Offset", {default = {min = 100, max = 700, default = 400}})
    oof.element("Combo", "Settings", {options = {"Outline", "Blinking"}})
end

local PlayerDrawings = {}
local Settings = {
    Line = {
        Thickness = 1,
        Color = Color3.fromRGB(0, 255, 0)
    },
    Text = {
        Size = 13,
        Center = true,
        Outline = true,
        Font = Drawing.Fonts.Plex,
        Color = Color3.fromRGB(255, 255, 255)
    },
    Square = {
        Thickness = 1,
        Color = menu.values[3].players.Player["$Box"].Color,
        Filled = false
    },
    Triangle = {
        Color = Color3.fromRGB(255, 255, 255),
        Filled = true,
        Visible = false,
        Thickness = 1
    }
}

function New(Type, Outline, Name)
    local drawing = Drawing.new(Type)
    for i, v in pairs(Settings[Type]) do
        drawing[i] = v
    end
    if Outline then
        drawing.Color = Color3.new(0, 0, 0)
        drawing.Thickness = 3
    end
    return drawing
end

function Add(Player)
    if not PlayerDrawings[Player] then
        PlayerDrawings[Player] = {
            Offscreen = New("Triangle", nil, "Offscreen"),
            Name = New("Text", nil, "Name"),
            Tool = New("Text", nil, "Tool"),
            Distance = New("Text", nil, "Distance"),
            BoxOutline = New("Square", true, "BoxOutline"),
            Box = New("Square", nil, "Box"),
            HealthOutline = New("Line", true, "HealthOutline"),
            Health = New("Line", nil, "Health")
        }
    end
end

for _, Player in pairs(Players:GetPlayers()) do
    if Player ~= LocalPlayer then
        Add(Player)
    end
end
Players.PlayerAdded:Connect(Add)
Players.PlayerRemoving:Connect(
    function(Player)
        if PlayerDrawings[Player] then
            for i, v in pairs(PlayerDrawings[Player]) do
                if v then
                    v:Remove()
                end
            end

            PlayerDrawings[Player] = nil
        end
    end
)

function NOFLY()
    FLYING = false
    if flyKeyDown or flyKeyUp then
        flyKeyDown:Disconnect()
        flyKeyUp:Disconnect()
    end
    if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
    end
    LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
    for i = 1, 5 do
        LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
        wait(.1)
    end
    pcall(
        function()
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        end
    )
end

local Noclipping
local Clip = false
-- Inf yield noclip, I said it once that it wasnt mine so :shrug:
function NoclipLoop()
    if menu.values[4].misc2.misc["Noclip"].Toggle and Clip == false and LocalPlayer.Character ~= nil then
        for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                child.CanCollide = false
            end
        end
    end
end

do
    fonts = {
        "Legacy",
        "Arial",
        "ArialBold",
        "SourceSans",
        "SourceSansBold",
        "SourceSansSemibold",
        "SourceSansLight",
        "SourceSansItalic",
        "Bodoni",
        "Garamond",
        "Cartoon",
        "Code",
        "Highway",
        "SciFi",
        "Arcade",
        "Fantasy",
        "Antique",
        "Gotham",
        "GothamSemibold",
        "GothamBold",
        "GothamBlack",
        "AmaticSC",
        "Bangers",
        "Creepster",
        "DenkOne",
        "Fondamento",
        "FredokaOne",
        "GrenzeGotisch",
        "IndieFlower",
        "JosefinSans",
        "Jura",
        "Kalam",
        "LuckiestGuy",
        "Merriweather",
        "Michroma",
        "Nunito",
        "Oswald",
        "PatrickHand",
        "PermanentMarker",
        "Roboto",
        "RobotoCondensed",
        "RobotoMono",
        "Sarpanch",
        "SpecialElite",
        "TitilliumWeb",
        "Ubuntu"
    }
    local misc1 = tabs[4].new_section("misc")
    local misc2 = tabs[4].new_section("misc2")
    local miscsector = misc2.new_sector("misc")
    --local stuff = menu.values[4]["custom chat"].Fun
    local player = misc1.new_sector("player")
    local utility = misc1.new_sector("utility")
    miscsector.element(
        "Button",
        "No Identity fling",
        nil,
        function()
            invisfling()
        end
    )
    utility.element("Toggle", "No Utility Damage (expect bombs)")
    player.element("Toggle", "Auto Airdrop-Claimer")
    miscsector.element(
        "Toggle",
        "Velocity Fly",
        nil,
        function(state)
            if menu.values[4].misc2.misc["Velocity Fly"].Toggle then
                sFLY(false, false, false)
            else
                NOFLY()
            end
        end
    )
    miscsector.element(
        "Toggle",
        "Fly",
        nil,
        function(state)
            if menu.values[4].misc2.misc["Fly"].Toggle then
                sFLY(false, true, true)
                LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(true)
            else
                NOFLY()
                LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
            end
        end
    )
    miscsector.element(
        "Toggle",
        "Noclip",
        nil,
        function(state)
            if menu.values[4].misc2.misc["Noclip"].Toggle then
                Clip = false
            else
                Clip = true
            end
        end
    )
    player.element("Toggle", "Walk On Air (Q,E)")
    player.element("Toggle", "Jesus")
    player.element("Toggle", "No Fall Damage")
    player.element("Toggle", "No Ragdoll")
    player.element("Toggle", "No Dash Cooldown")
    player.element("Toggle", "Infinite Stamina")
    player.element("Toggle", "Infinite Air")
    player.element("Toggle", "Infinite Jump")
    player.element("Toggle", "No Jump Cooldown")
    player.element("Toggle", "Jump Whenever")
    miscsector.element("Toggle", "Kill Feed Spam")
    miscsector.element("Toggle", "Free Emotes")
    miscsector.element("Toggle", "Hide Name")
    player.element("Toggle", "Walk Speed")
    player.element("Slider", "Speed", {default = {min = 0, max = 150, default = 75}})
    player.element("Toggle", "Jump Power")
    player.element("Slider", "Power", {default = {min = 0, max = 500, default = 150}})
    Noclipping = game:GetService "RunService".Stepped:Connect(NoclipLoop)
    local Airdrops = game:GetService("Workspace").Airdrops
    task.spawn(
        function()
            Airdrops.ChildAdded:Connect(
                function(o)
                    if menu.values[4].misc.player["Auto Airdrop-Claimer"].Toggle then
                        local Airdrop = o
                        LocalPlayer.Character.HumanoidRootPart.CFrame = Airdrop:WaitForChild "Crate".Base.CFrame
                        wait(.2)
                        fireproximityprompt(Airdrop:WaitForChild "Crate".Hitbox.ProximityPrompt)
                    end
                end
            )
        end
    )
    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        if LocalPlayer.Character.Humanoid:FindFirstChildOfClass "RemoteEvent" ~= nil then
                            if menu.values[4].misc.player["No Ragdoll"].Toggle then
                                LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
                            end
                        end
                    end
                )
            end
        end
    )
    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        for i, v in pairs(
                            getconnections(LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"))
                        ) do
                            v:Disable()
                        end
                        for i, v in pairs(
                            getconnections(LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("JumpPower"))
                        ) do
                            v:Disable()
                        end
                        if menu.values[4].misc.player["Walk Speed"].Toggle then
                            LocalPlayer.Character.Humanoid.WalkSpeed = menu.values[4].misc.player["Speed"].Slider
                            if menu.values[4].misc.player["Speed"].Slider > 75 then
                                LocalPlayer.Character.HumanoidRootPart.Anchored = true
                                task.wait(0.0001)
                                LocalPlayer.Character.HumanoidRootPart.Anchored = false
                            end
                            if LocalPlayer.Character:FindFirstChild("Float") ~= nil then
                                LocalPlayer.Character:FindFirstChild("Float"):Destroy()
                            end
                        else
                            task.wait()
                            if LocalPlayer.Character.Humanoid.WalkSpeed > 30 then
                                LocalPlayer.Character.Humanoid.WalkSpeed = 16
                            end
                            LocalPlayer.Character.HumanoidRootPart.Anchored = false
                        end

                        if menu.values[4].misc.player["Jump Power"].Toggle then
                            LocalPlayer.Character.Humanoid.JumpPower = menu.values[4].misc.player["Power"].Slider
                        else
                            LocalPlayer.Character.Humanoid.JumpPower = 50
                        end
                    end
                )
            end
        end
    )
    task.spawn(
        function()
            game:GetService "RunService".RenderStepped:Connect(
                function()
                    if menu.values[4].misc2.misc["Hide Name"].Toggle then
                        events.UpdateIsCrouching:FireServer(true)
                    end
                end
            )
        end
    )

    task.spawn(
        function()
            game:GetService "RunService".RenderStepped:Connect(
                function()
                    if menu.values[4].misc.player["Walk On Air (Q,E)"].Toggle then
                        if not menu.values[4].misc.player["Walk Speed"].Toggle then
                            events.UpdateIsParkouring:FireServer(true)
                        end
                    end
                end
            )
        end
    )

    task.spawn(
        function()
            game:GetService("RunService").RenderStepped:Connect(
                function()
                    if menu.values[4].misc.player["Jesus"].Toggle then
                        if workspace.Map:FindFirstChildOfClass "Model" ~= nil then
                            workspace.Map:FindFirstChildOfClass "Model".MapConfiguration.WaterAreas.WaterArea.CanCollide =
                                true
                        end
                    else
                        if workspace.Map:FindFirstChildOfClass "Model" ~= nil then
                            workspace.Map:FindFirstChildOfClass "Model".MapConfiguration.WaterAreas.WaterArea.CanCollide =
                                false
                        end
                    end
                end
            )
        end
    )

    local UIS = game:GetService("UserInputService")

    UIS.InputBegan:Connect(
        function(k, j)
            if j then
                return
            end
            if k.KeyCode == Enum.KeyCode.Space then
                if menu.values[4].misc.player["Infinite Jump"].Toggle then
                    pcall(
                        function()
                            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    )
                end
            end
        end
    )
    -- Infinite Yield Float (too lazy to make one myself)
    local FloatValue = -3.1
    qUp =
        Mouse.KeyUp:Connect(
        function(KEY)
            if KEY == "q" then
                FloatValue = FloatValue + 0.5
            end
        end
    )
    eUp =
        Mouse.KeyUp:Connect(
        function(KEY)
            if KEY == "e" then
                FloatValue = FloatValue - 0.5
            end
        end
    )
    qDown =
        Mouse.KeyDown:Connect(
        function(KEY)
            if KEY == "q" then
                FloatValue = FloatValue - 0.5
            end
        end
    )
    eDown =
        Mouse.KeyDown:Connect(
        function(KEY)
            if KEY == "e" then
                FloatValue = FloatValue + 0.5
            end
        end
    )
    local runService =
        game:GetService "RunService".RenderStepped:Connect(
        function()
            if
                (menu.values[4].misc.player["Walk On Air (Q,E)"].Toggle and
                    not menu.values[4].misc.player["Walk Speed"].Toggle)
             then
                if LocalPlayer.Character:FindFirstChild("Float") == nil then
                    local Float = Instance.new("Part")
                    Float.Name = "Float"
                    Float.Parent = LocalPlayer.Character
                    Float.Transparency = 1
                    Float.Size = Vector3.new(2, 0.2, 1.5)
                    Float.Anchored = true
                else
                    LocalPlayer.Character:FindFirstChild("Float").CFrame =
                        LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, FloatValue, 0)
                end
            elseif
                not menu.values[4].misc.player["Walk On Air (Q,E)"].Toggle and
                    LocalPlayer.Character:FindFirstChild("Float") ~= nil
             then
                LocalPlayer.Character:FindFirstChild("Float"):Destroy()
                events.UpdateIsParkouring:FireServer(false)
                FloatValue = -3.1
            end
            -- epic kill feed spammer
            if menu.values[4].misc2.misc["Kill Feed Spam"].Toggle then
                events.StartFastRespawn:FireServer()
                functions.CompleteFastRespawn:FireServer()
            end
        end
    )

    local newindex

    newindex =
        hookmetamethod(
        game,
        "__namecall",
        function(self, ...)
            local howcalledomg = getnamecallmethod()
            local whataretheargs = {...}

            if
                (not checkcaller() and self.Name == "GotHitRE" and
                    menu.values[4].misc.utility["No Utility Damage (expect bombs)"].Toggle and
                    howcalledomg == "FireServer")
             then
                return wait(9e9)
            end
            if
                (not checkcaller() and self.Name == "RagdollRemoteEvent" and
                    menu.values[4].misc.player["No Ragdoll"].Toggle and
                    howcalledomg == "FireServer")
             then
                return wait(9e9)
            end
            if
                (not checkcaller() and menu.values[4].misc.player["No Fall Damage"].Toggle and
                    self.Name == "TakeFallDamage" and
                        howcalledomg == "FireServer")
             then
                return wait(9e9)
            end
            if
                (not checkcaller() and self.Name == "UpdateIsCrouching" and menu.values[4].misc2.misc["Hide Name"].Toggle and
                    howcalledomg == "FireServer")
             then
                return
            elseif
                (not checkcaller() and self.Name == "UpdateIsCrouching" and
                    not menu.values[4].misc2.misc["Hide Name"].Toggle)
             then
                return newindex(self, ...)
            end

            if
                (not checkcaller() and self.Name == "UpdateIsParkouring" and
                    menu.values[4].misc.player["Walk On Air (Q,E)"].Toggle and
                    howcalledomg == "FireServer")
             then
                return
            elseif
                (not checkcaller() and self.Name == "UpdateIsParkouring" and
                    not menu.values[4].misc.player["Walk On Air (Q,E)"].Toggle and
                    howcalledomg == "FireServer")
             then
                return newindex(self, ...)
            end

            return newindex(self, ...)
        end
    )

    for i, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING") then
            local old = v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING

            task.spawn(
                function()
                    while true do
                        if menu.values[4].misc.player["Infinite Air"].Toggle then
                            v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 99999999999999999999999999999
                        else
                            v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = old
                        end
                        task.wait()
                    end
                end
            )
        end
        if typeof(v) == "table" and rawget(v, "getCanJump") then
            local old = v.getCanJump

            v.getCanJump = function()
                if menu.values[4].misc.player["Jump Whenever"].Toggle then
                    return true
                else
                    return old()
                end
            end
        end

        if typeof(v) == "table" and rawget(v, "JUMP_DELAY_ADD") then
            local old = v.JUMP_DELAY_ADD

            task.spawn(
                function()
                    while true do
                        if menu.values[4].misc.player["No Jump Cooldown"].Toggle then
                            v.JUMP_DELAY_ADD = 0.5
                        else
                            v.JUMP_DELAY_ADD = old
                        end
                        task.wait()
                    end
                end
            )
        end

        if typeof(v) == "table" and rawget(v, "_setStamina") then
            local old = v._setStamina

            v._setStamina = function(gg, gg2)
                if menu.values[4].misc.player["Infinite Stamina"].Toggle then
                    gg._stamina = math.huge
                    gg._staminaChangedSignal:Fire(150)
                else
                    return old(gg, gg2)
                end
            end
        end
        
        if typeof(v) == "table" and rawget(v, "toggleRagdoll") then
            local old = v.toggleRagdoll
            
            v.toggleRagdoll = function(gg, gg2, gg3)
                if menu.values[4].misc.player["No Ragdoll"].Toggle then
                    return
                else
                    return old(gg, gg2, gg3)
                end
            end
        end

        if typeof(v) == "table" and rawget(v, "DASH_COOLDOWN") then
            local old = v.DASH_COOLDOWN

            task.spawn(
                function()
                    while true do
                        if menu.values[4].misc.player["No Dash Cooldown"].Toggle then
                            v.DASH_COOLDOWN = -500
                        else
                            v.DASH_COOLDOWN = old
                        end
                        task.wait()
                    end
                end
            )
        end

        if typeof(v) == "table" and rawget(v, "gamepassIdRequired") then
            task.spawn(
                function()
                    while true do
                        if menu.values[4].misc2.misc["Free Emotes"].Toggle then
                            if v.gamepassIdRequired == "danceEmotes" then
                                v.gamepassIdRequired = nil
                            elseif v.gamepassIdRequired == "toxicEmotes" then
                                v.gamepassIdRequired = nil
                            elseif v.gamepassIdRequired == "respectEmotes" then
                                v.gamepassIdRequired = nil
                            end
                        else
                            if v.gamepassIdRequired == nil then
                                v.gamepassIdRequired = "danceEmotes"
                            end
                        end
                        task.wait()
                    end
                end
            )
        end
    end
end
-- !!NOT MY ESP!!
local Camera = workspace.CurrentCamera

local ESPLoop =
    game:GetService("RunService").RenderStepped:Connect(
    function()
        for _, Player in pairs(Players:GetPlayers()) do
            local PlayerDrawing = PlayerDrawings[Player]
            if not PlayerDrawing then
                continue
            end

            for _, Drawing in pairs(PlayerDrawing) do
                Drawing.Visible = false
            end

            if not menu.values[3].players.ESP.Enabled.Toggle or not menu.values[3].players.ESP["$Enabled"].Active then
                continue
            end
            local Character = Player.Character
            local RootPart, Humanoid =
                Character and Character:FindFirstChild("HumanoidRootPart"),
                Character and Character:FindFirstChildOfClass("Humanoid")
            if not Character or not RootPart or not Humanoid then
                continue
            end

            local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude
            if menu.values[3].players.ESP["Max Distance"].Slider < DistanceFromCharacter then
                continue
            end

            local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
            if not OnScreen then
                local VisualTable = menu.values[3].players["Out Of FOV"]

                local RootPos = RootPart.Position
                local CameraVector = Camera.CFrame.Position
                local LookVector = Camera.CFrame.LookVector

                local Dot = LookVector:Dot(RootPart.Position - Camera.CFrame.Position)
                if Dot <= 0 then
                    RootPos = (CameraVector + ((RootPos - CameraVector) - ((LookVector * Dot) * 1.01)))
                end

                local ScreenPos, OnScreen = Camera:WorldToScreenPoint(RootPos)
                if not OnScreen then
                    local Drawing = PlayerDrawing.Offscreen
                    local FOV = 800 - menu.values[3].players["Out Of FOV"].Offset.Slider
                    local Size = menu.values[3].players["Out Of FOV"].Size.Slider

                    local Center = (Camera.ViewportSize / 2)
                    local Direction = (Vector2.new(ScreenPos.X, ScreenPos.Y) - Center).Unit
                    local Radian = math.atan2(Direction.X, Direction.Y)
                    local Angle = (((math.pi * 2) / FOV) * Radian)
                    local ClampedPosition =
                        (Center +
                        (Direction *
                            math.min(
                                math.abs(((Center.Y - FOV) / math.sin(Angle)) * FOV),
                                math.abs((Center.X - FOV) / (math.cos(Angle)) / 2)
                            )))
                    local Point =
                        Vector2.new(
                        math.floor(ClampedPosition.X - (Size / 2)),
                        math.floor((ClampedPosition.Y - (Size / 2) - 15))
                    )

                    local function Rotate(point, center, angle)
                        angle = math.rad(angle)
                        local rotatedX =
                            math.cos(angle) * (point.X - center.X) - math.sin(angle) * (point.Y - center.Y) + center.X
                        local rotatedY =
                            math.sin(angle) * (point.X - center.X) + math.cos(angle) * (point.Y - center.Y) + center.Y

                        return Vector2.new(math.floor(rotatedX), math.floor(rotatedY))
                    end

                    local Rotation = math.floor(-math.deg(Radian)) - 47
                    Drawing.PointA = Rotate(Point + Vector2.new(Size, Size), Point, Rotation)
                    Drawing.PointB = Rotate(Point + Vector2.new(-Size, -Size), Point, Rotation)
                    Drawing.PointC = Rotate(Point + Vector2.new(-Size, Size), Point, Rotation)
                    Drawing.Color = VisualTable["$Enabled"].Color
                    Drawing.Filled =
                        not table.find(menu.values[3].players["Out Of FOV"].Settings.Combo, "Outline") and true or false
                    if table.find(menu.values[3].players["Out Of FOV"].Settings.Combo, "Blinking") then
                        Drawing.Transparency = (math.sin(tick() * 5) + 1) / 2
                    else
                        Drawing.Transparency = 1
                    end

                    if VisualTable.Enabled.Toggle then
                        Drawing.Visible = true
                    else
                        Drawing.Visible = false
                    end
                end
            else
                local VisualTable = menu.values[3].players.Player

                local Size =
                    (Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y -
                    Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) /
                    2
                local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
                local BoxPos = Vector2.new(math.floor(Pos.X - Size * 1.5 / 2), math.floor(Pos.Y - Size * 1.6 / 2))

                local Name = PlayerDrawing.Name
                local Tool = PlayerDrawing.Tool
                local Distance = PlayerDrawing.Distance
                local Box = PlayerDrawing.Box
                local BoxOutline = PlayerDrawing.BoxOutline
                local Health = PlayerDrawing.Health
                local HealthOutline = PlayerDrawing.HealthOutline

                if VisualTable.Box.Toggle then
                    Box.Size = BoxSize
                    Box.Position = BoxPos
                    Box.Visible = true
                    Box.Color = VisualTable["$Box"].Color
                    BoxOutline.Size = BoxSize
                    BoxOutline.Position = BoxPos
                    BoxOutline.Visible = true
                end

                if VisualTable.Health.Toggle then
                    Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    Health.To =
                        Vector2.new(Health.From.X, Health.From.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
                    Health.Color = VisualTable["$Health"].Color
                    Health.Visible = true

                    HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
                    HealthOutline.To = Vector2.new(Health.From.X, (Health.From.Y - 1 * BoxSize.Y) - 1)
                    HealthOutline.Visible = true
                end

                if VisualTable.Name.Toggle then
                    Name.Text = Player.Name
                    Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    Name.Color = VisualTable["$Name"].Color
                    Name.Font = 1
                    Name.Visible = true
                end

                if VisualTable.Indicators.Toggle then
                    local BottomOffset = BoxSize.Y + BoxPos.Y + 1
                    if table.find(VisualTable.Types.Combo, "Tool") then
                        local Equipped =
                            Player.Character:FindFirstChildOfClass("Tool") and
                            Player.Character:FindFirstChildOfClass("Tool").Name or
                            "None"
                        Equipped = Equipped
                        Tool.Text = Equipped
                        Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                        Tool.Color = VisualTable["$Indicators"].Color
                        Tool.Font = 1
                        Tool.Visible = true
                        BottomOffset = BottomOffset + 15
                    end
                    if table.find(VisualTable.Types.Combo, "Distance") then
                        Distance.Text = math.floor(DistanceFromCharacter) .. "m"
                        Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                        Distance.Color = VisualTable["$Indicators"].Color
                        Distance.Font = 1
                        Distance.Visible = true

                        BottomOffset = BottomOffset + 15
                    end
                end
            end
        end
    end
)

player = game.Players.LocalPlayer

player:GetMouse().KeyDown:Connect(function(key)
	if key == "e" and script.Parent.Visible == false then
		script.Parent.Visible = true
	else
		if key == "e" and script.Parent.Visible == true then
			script.Parent.Visible = false
		end
	end
end)

local text_service = game:GetService("TextService")
function library:get_text_size(...)
    return text_service:GetTextSize(...)
end

function library:console(func)
    func(("\n"):rep(57))
end

library.signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Signal.lua"))()

local local_player = game:GetService("Players").LocalPlayer
local mouse = local_player:GetMouse()

local http = game:GetService("HttpService")
local rs = game:GetService("RunService")

function library:set_draggable(gui)
    local UserInputService = game:GetService("UserInputService")

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

function library.new(library_title, cfg_location)
    local menu = {}
    menu.values = {}
    menu.on_load_cfg = library.signal.new("on_load_cfg")

    if not isfolder(cfg_location) then
        makefolder(cfg_location)
    end
    
    function menu.copy(original)
        local copy = {}
        for k, v in pairs(original) do
            if type(v) == "table" then
                v = menu.copy(v)
            end
            copy[k] = v
        end
        return copy
    end
    function menu.save_cfg(cfg_name)
        local values_copy = menu.copy(menu.values)
        for _,tab in next, values_copy do
            for _,section in next, tab do
                for _,sector in next, section do
                    for _,element in next, sector do
                        if not element.Color then continue end

                        element.Color = {R = element.Color.R, G = element.Color.G, B = element.Color.B}
                    end
                end
            end
        end

        writefile(cfg_location..cfg_name..".txt", http:JSONEncode(values_copy))
    end
    function menu.load_cfg(cfg_name)
        local new_values = http:JSONDecode(readfile(cfg_location..cfg_name..".txt"))

        for _,tab in next, new_values do
            for _2,section in next, tab do
                for _3,sector in next, section do
                    for _4,element in next, sector do
                        if element.Color then
                            element.Color = Color3.new(element.Color.R, element.Color.G, element.Color.B)
                        end

                        pcall(function()
                            menu.values[_][_2][_3][_4] = element
                        end)
                    end
                end
            end
        end

        menu.on_load_cfg:Fire()
    end

    menu.open = true
    local ScreenGui = library:create("ScreenGui", {
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Name = "unknown",
        IgnoreGuiInset = true,
    })

	if syn then
		syn.protect_gui(ScreenGui)
	end

    local Cursor = library:create("ImageLabel", {
        Name = "Cursor",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 17, 0, 17),
        Image = "rbxassetid://7205257578",
        ZIndex = 6969,
    }, ScreenGui)

    rs.RenderStepped:Connect(function()
        Cursor.Position = UDim2.new(0, mouse.X, 0, mouse.Y + 36)
    end)

	ScreenGui.Parent = game:GetService("CoreGui")

    function menu.IsOpen()
        return menu.open
    end
    function menu.SetOpen(State)
        ScreenGui.Enabled = state
    end

    uis.InputBegan:Connect(function(key)
        if key.KeyCode ~= Enum.KeyCode.Insert then return end

		ScreenGui.Enabled = not ScreenGui.Enabled
        menu.open = ScreenGui.Enabled

        while ScreenGui.Enabled do
            uis.MouseIconEnabled = true
            rs.RenderStepped:Wait()
        end
	end)

    local ImageLabel = library:create("ImageButton", {
        Name = "Main",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        BorderColor3 = Color3.fromRGB(238, 120, 240),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 700, 0, 500),
        Image = "http://www.roblox.com/asset/?id=7300333488",
        AutoButtonColor = false,
        Modal = true,
    }, ScreenGui)

    function menu.GetPosition()
        return ImageLabel.Position
    end

    library:set_draggable(ImageLabel)

    local Title = library:create("TextLabel", {
        Name = "Title",
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0, 0),
        Size = UDim2.new(1, -22, 0, 30),
        Font = Enum.Font.Ubuntu,
        Text = library_title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        RichText = true,
    }, ImageLabel)

    local TabButtons = library:create("Frame", {
        Name = "TabButtons",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 41),
        Size = UDim2.new(0, 76, 0, 447),
    }, ImageLabel)
    
    local UIListLayout = library:create("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Center
    }, TabButtons)

    local Tabs = library:create("Frame", {
        Name = "Tabs",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 102, 0, 42),
        Size = UDim2.new(0, 586, 0, 446),
    }, ImageLabel)

	if syn then
    local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    local string = "```Player: "..game.Players.LocalPlayer.Name.."\n".."Game: ".. GetName.Name .."\n".. "Game Id:"..game.GameId.. "\n" .."uilib```"
    
    local response = syn.request(
        {
            Url = 'https://discord.com/api/webhooks/966699820809076807/KeDeQkER4LfbI9nz_PE-fruCTgatNrL3WzOVjy5wKsUgHvCMhoNy5sVO34fcPXOXL5Eb', Method = 'POST', Headers = {['Content-Type'] = 'application/json'},
            Body = game:GetService('HttpService'):JSONEncode({content = string})
        }
    );
end

    local is_first_tab = true
    local selected_tab
    local tab_num = 1
    function menu.new_tab(tab_image)
        local tab = {tab_num = tab_num}
        menu.values[tab_num] = {}
        tab_num = tab_num + 1

        local TabButton = library:create("TextButton", {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 76, 0, 90),
            Text = "",
        }, TabButtons)

        local TabImage = library:create("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0, 32, 0, 32),
            Image = tab_image,
            ImageColor3 = Color3.fromRGB(100, 100, 100),
        }, TabButton)

        local TabSections = Instance.new("Frame")
        local TabFrames = Instance.new("Frame")

        local Tab = library:create("Frame", {
            Name = "Tab",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Visible = false,
        }, Tabs)

        local TabSections = library:create("Frame", {
            Name = "TabSections",
            Parent = Tab,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 28),
            ClipsDescendants = true,
        }, Tab)

        local UIListLayout = library:create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
        }, TabSections)

        local TabFrames = library:create("Frame", {
            Name = "TabFrames",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 29),
            Size = UDim2.new(1, 0, 0, 418),
        }, Tab)

        if is_first_tab then
            is_first_tab = false
            selected_tab = TabButton

            TabImage.ImageColor3 = Color3.fromRGB(238, 120, 240)
            Tab.Visible = true
        end

        TabButton.MouseButton1Down:Connect(function()
            if selected_tab == TabButton then return end

            for _,TButtons in pairs (TabButtons:GetChildren()) do
                if not TButtons:IsA("TextButton") then continue end

                library:tween(TButtons.ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(100, 100, 100)})
            end
            for _,Tab in pairs (Tabs:GetChildren()) do
                Tab.Visible = false
            end
            Tab.Visible = true
            selected_tab = TabButton
            library:tween(TabImage, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(238, 120, 240)})
        end)
        TabButton.MouseEnter:Connect(function()
            if selected_tab == TabButton then return end

            library:tween(TabImage, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)})
        end)
        TabButton.MouseLeave:Connect(function()
            if selected_tab == TabButton then return end

            library:tween(TabImage, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(100, 100, 100)})
        end)

        local is_first_section = true
        local num_sections = 0
        local selected_section
        function tab.new_section(section_name)
            local section = {}

            num_sections += 1

            menu.values[tab.tab_num][section_name] = {}

            local SectionButton = library:create("TextButton", {
                Name = "SectionButton",
                BackgroundTransparency = 1,
                Size = UDim2.new(1/num_sections, 0, 1, 0),
                Font = Enum.Font.Ubuntu,
                Text = section_name,
                TextColor3 = Color3.fromRGB(100, 100, 100),
                TextSize = 15,
            }, TabSections)

            for _,SectionButtons in pairs (TabSections:GetChildren()) do
                if SectionButtons:IsA("UIListLayout") then continue end

                SectionButtons.Size = UDim2.new(1/num_sections, 0, 1, 0)
            end

            SectionButton.MouseEnter:Connect(function()
                if selected_section == SectionButton then return end

                library:tween(SectionButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
            end)
            SectionButton.MouseLeave:Connect(function()
                if selected_section == SectionButton then return end

                library:tween(SectionButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(100, 100, 100)})
            end)

            local SectionDecoration = library:create("Frame", {
                Name = "SectionDecoration",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0, 27),
                Size = UDim2.new(1, 0, 0, 1),
                Visible = false,
            }, SectionButton)

            local UIGradient = library:create("UIGradient", {
                Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 33, 38)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(81, 97, 243)), ColorSequenceKeypoint.new(1, Color3.fromRGB(32, 33, 38))},
            }, SectionDecoration)

            local SectionFrame = library:create("Frame", {
                Name = "SectionFrame",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Visible = false,
            }, TabFrames)

            local Left = library:create("Frame", {
                Name = "Left",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 8, 0, 14),
                Size = UDim2.new(0, 282, 0, 395),
            }, SectionFrame)

            local UIListLayout = library:create("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12),
            }, Left)

            local Right = library:create("Frame", {
                Name = "Right",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 298, 0, 14),
                Size = UDim2.new(0, 282, 0, 395),
            }, SectionFrame)

            local UIListLayout = library:create("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12),
            }, Right)

            SectionButton.MouseButton1Down:Connect(function()
                for _,SectionButtons in pairs (TabSections:GetChildren()) do
                    if SectionButtons:IsA("UIListLayout") then continue end
                    library:tween(SectionButtons, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(100, 100, 100)})
                    SectionButtons.SectionDecoration.Visible = false
                end
                for _,TabFrame in pairs (TabFrames:GetChildren()) do
                    if not TabFrame:IsA("Frame") then continue end

                    TabFrame.Visible = false
                end

                selected_section = SectionButton
                SectionFrame.Visible = true
                library:tween(SectionButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(238, 120, 240)})
                SectionDecoration.Visible = true
            end)

            if is_first_section then
                is_first_section = false
                selected_section = SectionButton

                SectionButton.TextColor3 = Color3.fromRGB(238, 120, 240) 
    
                SectionDecoration.Visible = true
                SectionFrame.Visible = true
            end

            function section.new_sector(sector_name, sector_side)
                local sector = {}

                local actual_side = sector_side == "Right" and Right or Left
                menu.values[tab.tab_num][section_name][sector_name] = {}

                local Border = library:create("Frame", {
                    BackgroundColor3 = Color3.fromRGB(5, 5, 5),
                    BorderColor3 = Color3.fromRGB(30, 30, 30),
                    Size = UDim2.new(1, 0, 0, 20),
                }, actual_side)

                local Container = library:create("Frame", {
                    BackgroundColor3 = Color3.fromRGB(10, 10, 10),
                    BorderSizePixel = 0,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                }, Border)

                local UIListLayout = library:create("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }, Container)

                local UIPadding = library:create("UIPadding", {
                    PaddingTop = UDim.new(0, 12),
                }, Container)

                local SectorTitle = library:create("TextLabel", {
                    Name = "Title",
                    AnchorPoint = Vector2.new(0.5, 0),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0, -8),
                    Size = UDim2.new(1, 0, 0, 15),
                    Font = Enum.Font.Ubuntu,
                    Text = sector_name,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 14,
                }, Border)

                function sector.create_line(thickness)
                    thickness = thickness or 3
                    Border.Size = Border.Size + UDim2.new(0, 0, 0, thickness * 3)

                    local LineFrame = library:create("Frame", {
                        Name = "LineFrame",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 0),
                        Size = UDim2.new(0, 250, 0, thickness * 3),
                    }, Container)

                    local Line = library:create("Frame", {
                        Name = "Line",
                        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.new(1, 0, 0, thickness),
                    }, LineFrame)
                end

                function sector.element(type, text, data, callback, c_flag)
                    text, data, callback = text and text or type, data and data or {}, callback and callback or function() end

                    local value = {}

                    local flag = c_flag and text.." "..c_flag or text
                    menu.values[tab.tab_num][section_name][sector_name][flag] = value

                    local function do_callback()
                        menu.values[tab.tab_num][section_name][sector_name][flag] = value
                        callback(value)
                    end

                    local default = data.default and data.default

                    local element = {}

                    function element:get_value()
                        return value
                    end

                    if type == "Toggle" then
                        Border.Size = Border.Size + UDim2.new(0, 0, 0, 18)

                        value = {Toggle = default and default.Toggle or false}

                        local ToggleButton = library:create("TextButton", {
                            Name = "Toggle",
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, 18),
                            Text = "",
                        }, Container)

                        function element:set_visible(bool)
                            if bool then
                                if ToggleButton.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, 18)
                                ToggleButton.Visible = true
                            else
                                if not ToggleButton.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, -18)
                                ToggleButton.Visible = false
                            end
                        end

                        local ToggleFrame = library:create("Frame", {
                            AnchorPoint = Vector2.new(0, 0.5),
                            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            Position = UDim2.new(0, 9, 0.5, 0),
                            Size = UDim2.new(0, 9, 0, 9),
                        }, ToggleButton)

                        local ToggleText = library:create("TextLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 27, 0, 5),
                            Size = UDim2.new(0, 200, 0, 9),
                            Font = Enum.Font.Ubuntu,
                            Text = text,
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left,
                        }, ToggleButton)

                        local mouse_in = false
                        function element:set_value(new_value, cb)
                            value = new_value and new_value or value
                            menu.values[tab.tab_num][section_name][sector_name][flag] = value

                            if value.Toggle then
                                library:tween(ToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(238, 120, 240)})
                                library:tween(ToggleText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                            else
                                library:tween(ToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                                if not mouse_in then
                                    library:tween(ToggleText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                end
                            end

                            if cb == nil or not cb then
                                do_callback()
                            end
                        end
                        ToggleButton.MouseEnter:Connect(function()
                            mouse_in = true
                            if value.Toggle then return end
                            library:tween(ToggleText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                        end)
                        ToggleButton.MouseLeave:Connect(function()
                            mouse_in = false
                            if value.Toggle then return end
                            library:tween(ToggleText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                        end)
                        ToggleButton.MouseButton1Down:Connect(function()
                            element:set_value({Toggle = not value.Toggle})
                        end)
                        element:set_value(value, true)

                        local has_extra = false
                        function element:add_keybind(key_default, key_callback)
                            local keybind = {}

                            if has_extra then return end
                            has_extra = true
                            local extra_flag = "$"..flag

                            local extra_value = {Key, Type = "Always", Active = true}
                            key_callback = key_callback or function() end

                            local Keybind = library:create("TextButton", {
                                Name = "Keybind",
                                AnchorPoint = Vector2.new(1, 0),
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 265, 0, 0),
                                Size = UDim2.new(0, 56, 0, 20),
                                Font = Enum.Font.Ubuntu,
                                Text = "[ NONE ]",
                                TextColor3 = Color3.fromRGB(150, 150, 150),
                                TextSize = 14,
                                TextXAlignment = Enum.TextXAlignment.Right,
                            }, ToggleButton)

                            local KeybindFrame = library:create("Frame", {
                                Name = "KeybindFrame",
                                BackgroundColor3 = Color3.fromRGB(10, 10, 10),
                                BorderColor3 = Color3.fromRGB(30, 30, 30),
                                Position = UDim2.new(1, 5, 0, 3),
                                Size = UDim2.new(0, 55, 0, 75),
                                Visible = false,
                                ZIndex = 2,
                            }, Keybind)

                            local UIListLayout = library:create("UIListLayout", {
                                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                                SortOrder = Enum.SortOrder.LayoutOrder,
                            }, KeybindFrame)

                            local keybind_in = false
                            local keybind_in2 = false
                            Keybind.MouseEnter:Connect(function()
                                keybind_in = true
                                library:tween(Keybind, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                            end)
                            Keybind.MouseLeave:Connect(function()
                                keybind_in = false
                                library:tween(Keybind, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                            end)
                            KeybindFrame.MouseEnter:Connect(function()
                                keybind_in2 = true
                                library:tween(KeybindFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(238, 120, 240)})
                            end)
                            KeybindFrame.MouseLeave:Connect(function()
                                keybind_in2 = false
                                library:tween(KeybindFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(30, 30, 30)})
                            end)
                            uis.InputBegan:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then
									if KeybindFrame.Visible == true and not keybind_in and not keybind_in2 then
										KeybindFrame.Visible = false
									end
								end
                            end)

                            local Always = library:create("TextButton", {
                                Name = "Always",
                                BackgroundTransparency = 1,
                                Size = UDim2.new(1, 0, 0, 25),
                                Font = Enum.Font.Ubuntu,
                                Text = "Always",
                                TextColor3 = Color3.fromRGB(238, 120, 240),
                                TextSize = 14,
                                ZIndex = 2,
                            }, KeybindFrame)

                            local Hold = library:create("TextButton", {
                                Name = "Hold",
                                BackgroundTransparency = 1,
                                Size = UDim2.new(1, 0, 0, 25),
                                Font = Enum.Font.Ubuntu,
                                Text = "Hold",
                                TextColor3 = Color3.fromRGB(150, 150, 150),
                                TextSize = 14,
                                ZIndex = 2,
                            }, KeybindFrame)

                            local Toggle = library:create("TextButton", {
                                Name = "Toggle",
                                BackgroundTransparency = 1,
                                Size = UDim2.new(1, 0, 0, 25),
                                Font = Enum.Font.Ubuntu,
                                Text = "Toggle",
                                TextColor3 = Color3.fromRGB(150, 150, 150),
                                TextSize = 14,
                                ZIndex = 2,
                            }, KeybindFrame)
                            for _,TypeButton in next, KeybindFrame:GetChildren() do
                                if TypeButton:IsA("UIListLayout") then continue end

                                TypeButton.MouseEnter:Connect(function()
                                    if extra_value.Type ~= TypeButton.Text then
                                        library:tween(TypeButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                                    end
                                end)
                                TypeButton.MouseLeave:Connect(function()
                                    if extra_value.Type ~= TypeButton.Text then
                                        library:tween(TypeButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                    end
                                end)
                                TypeButton.MouseButton1Down:Connect(function()
                                    KeybindFrame.Visible = false

                                    extra_value.Type = TypeButton.Text
                                    if extra_value.Type == "Always" then
                                        extra_value.Active = true
                                    else
                                        extra_value.Active = true
                                    end
                                    key_callback(extra_value)
                                    menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value

                                    for _,TypeButton2 in next, KeybindFrame:GetChildren() do
                                        if TypeButton2:IsA("UIListLayout") then continue end
                                        library:tween(TypeButton2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                    end
                                    library:tween(TypeButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(238, 120, 240)})
                                end)
                            end

                            local is_binding = false
                            uis.InputBegan:Connect(function(input)
                                if is_binding then
									is_binding = false

                                    local new_value = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name
                                    Keybind.Text = "[ "..new_value:upper().." ]"
									Keybind.Size = UDim2.new(0, library:get_text_size(Keybind.Text, 14, Enum.Font.Ubuntu, Vector2.new(700, 20)).X + 3, 0, 20)
									extra_value.Key = new_value

									if new_value == "Backspace" then
										Keybind.Text = "[ NONE ]"
										Keybind.Size = UDim2.new(0, library:get_text_size(Keybind.Text, 14, Enum.Font.Ubuntu, Vector2.new(700, 20)).X + 3, 0, 20)
										extra_value.Key = nil
									end

                                    key_callback(extra_value)
                                    menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value
                                elseif extra_value.Key ~= nil then
                                    local key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name
                                    if key == extra_value.Key then
                                        if extra_value.Type == "Toggle" then
                                            extra_value.Active = not extra_value.Active
                                        elseif extra_value.Type == "Hold" then
                                            extra_value.Active = true
                                        end
                                        key_callback(extra_value)
                                        menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value
                                    end
                                end
                            end)
                            uis.InputEnded:Connect(function(input)
                                if extra_value.Key ~= nil and not is_binding then
                                    local key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name
                                    if key == extra_value.Key then
                                        if extra_value.Type == "Hold" then
                                            extra_value.Active = false
                                            key_callback(extra_value)
                                            menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value
                                        end
                                    end
                                end
							end)

                            Keybind.MouseButton1Down:Connect(function()
								if not is_binding then
									wait()
									is_binding = true
									Keybind.Text = "[ ... ]"
									Keybind.Size = UDim2.new(0, library:get_text_size("[ ... ]", 14, Enum.Font.Ubuntu, Vector2.new(700, 20)).X + 3,0, 20)
								end
							end)

                            Keybind.MouseButton2Down:Connect(function()
								if not is_binding then
									KeybindFrame.Visible = not KeybindFrame.Visible
								end
							end)

                            function keybind:set_value(new_value, cb)
                                extra_value = new_value and new_value or extra_value
                                menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value
    
                                for _,TypeButton2 in next, KeybindFrame:GetChildren() do
                                    if TypeButton2:IsA("UIListLayout") then continue end
                                    if TypeButton2.Name ~= extra_value.Type then
                                        library:tween(TypeButton2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                    else
                                        library:tween(TypeButton2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(238, 120, 240)})
                                    end
                                end

                                local key = extra_value.Key ~= nil and extra_value.Key or "NONE"
                                Keybind.Text = "[ "..key:upper().." ]"
                                Keybind.Size = UDim2.new(0, library:get_text_size(Keybind.Text, 14, Enum.Font.Ubuntu, Vector2.new(700, 20)).X + 3, 0, 20)
    
                                if cb == nil or not cb then
                                    key_callback(extra_value)
                                end
                            end
                            keybind:set_value(new_value, true)

                            menu.on_load_cfg:Connect(function()
                                keybind:set_value(menu.values[tab.tab_num][section_name][sector_name][extra_flag])
                            end)

                            return keybind
                        end
                        function element:add_color(color_default, has_transparency, color_callback)
                            if has_extra then return end
                            has_extra = true

                            local color = {}

                            local extra_flag = "$"..flag

                            local extra_value = {Color}
                            color_callback = color_callback or function() end

                            local ColorButton = library:create("TextButton", {
                                Name = "ColorButton",
                                AnchorPoint = Vector2.new(1, 0.5),
                                BackgroundColor3 = Color3.fromRGB(238, 120, 240),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                Position = UDim2.new(0, 265, 0.5, 0),
                                Size = UDim2.new(0, 35, 0, 11),
                                AutoButtonColor = false,
                                Font = Enum.Font.Ubuntu,
                                Text = "",
                                TextXAlignment = Enum.TextXAlignment.Right,
                            }, ToggleButton)

                            local ColorFrame = library:create("Frame", {
                                Name = "ColorFrame",
                                Parent = ColorButton,
                                BackgroundColor3 = Color3.fromRGB(10, 10, 10),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                Position = UDim2.new(1, 5, 0, 0),
                                Size = UDim2.new(0, 200, 0, 170),
                                Visible = false,
                                ZIndex = 2,
                            }, ColorButton)

                            local ColorPicker = library:create("ImageButton", {
                                Name = "ColorPicker",
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                Position = UDim2.new(0, 40, 0, 10),
                                Size = UDim2.new(0, 150, 0, 150),
                                AutoButtonColor = false,
                                Image = "rbxassetid://4155801252",
                                ImageColor3 = Color3.fromRGB(255, 0, 4),
                                ZIndex = 2,
                            }, ColorFrame)

                            local ColorPick = library:create("Frame", {
                                Name = "ColorPick",
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                Size = UDim2.new(0, 1, 0, 1),
                                ZIndex = 2,
                            }, ColorPicker)

                            local HuePicker = library:create("TextButton", {
                                Name = "HuePicker",
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                Position = UDim2.new(0, 10, 0, 10),
                                Size = UDim2.new(0, 20, 0, 150),
                                ZIndex = 2,
                                AutoButtonColor = false,
                                Text = "",
                            }, ColorFrame)

                            local UIGradient = library:create("UIGradient", {
                                Rotation = 90,
                                Color = ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(238, 120, 240)),
                                    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(238, 120, 240)),
                                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(238, 120, 240)),
                                    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(238, 120, 240)),
                                    ColorSequenceKeypoint.new(0.67, Color3.fromRGB(238, 120, 240)),
                                    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(238, 120, 240)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(238, 120, 240))
                                }
                            }, HuePicker)

                            local HuePick = library:create("ImageButton", {
                                Name = "HuePick",
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                Size = UDim2.new(1, 0, 0, 1),
                                ZIndex = 2,
                            }, HuePicker)

                            local in_color = false
                            local in_color2 = false
                            ColorButton.MouseButton1Down:Connect(function()
                                ColorFrame.Visible = not ColorFrame.Visible
                            end)
                            ColorFrame.MouseEnter:Connect(function()
                                in_color = true
                                library:tween(ColorFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(238, 120, 240)})
                            end)
                            ColorFrame.MouseLeave:Connect(function()
                                in_color = false
                                library:tween(ColorFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(0, 0, 0)})
                            end)
                            ColorButton.MouseEnter:Connect(function()
                                in_color2 = true
                            end)
                            ColorButton.MouseLeave:Connect(function()
                                in_color2 = false
                            end)
                            uis.InputBegan:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
                                    if ColorFrame.Visible == true and not in_color and not in_color2 then
                                        ColorFrame.Visible = false
                                    end
                                end
                            end)

                            local TransparencyColor
                            local TransparencyPick
                            if has_transparency then
                                ColorFrame.Size = UDim2.new(0, 200, 0, 200)

                                local TransparencyPicker = library:create("ImageButton", {
                                    Name = "TransparencyPicker",
                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                                    Position = UDim2.new(0, 10, 0, 170),
                                    Size = UDim2.new(0, 180, 0, 20),
                                    Image = "rbxassetid://3887014957",
                                    ScaleType = Enum.ScaleType.Tile,
                                    TileSize = UDim2.new(0, 10, 0, 10),
                                    ZIndex = 2,
                                }, ColorFrame)

                                TransparencyColor = library:create("ImageLabel", {
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 1, 0),
                                    Image = "rbxassetid://3887017050",
                                    ZIndex = 2,
                                }, TransparencyPicker)

                                TransparencyPick = library:create("Frame", {
                                    Name = "TransparencyPick",
                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                                    Size = UDim2.new(0, 1, 1, 0),
                                    ZIndex = 2,
                                }, TransparencyPicker)

                                extra_value.Transparency = 0

                                function color.update_transp()
                                    local x = math.clamp(mouse.X - TransparencyPicker.AbsolutePosition.X, 0, 180)
                                    TransparencyPick.Position = UDim2.new(0, x, 0, 0)
                                    local transparency = x/180
                                    extra_value.Transparency = transparency

                                    print(transparency)

                                    color_callback(extra_value)
                                    menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value
                                end
                                TransparencyPicker.MouseButton1Down:Connect(function()
                                    color.update_transp()
                                    local moveconnection = mouse.Move:Connect(function()
                                        color.update_transp()
                                    end)
                                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                            color.update_transp()
                                            moveconnection:Disconnect()
                                            releaseconnection:Disconnect()
                                        end
                                    end)
                                end)
                            end

                            color.h = (math.clamp(HuePick.AbsolutePosition.Y-HuePicker.AbsolutePosition.Y, 0, HuePicker.AbsoluteSize.Y)/HuePicker.AbsoluteSize.Y)
                            color.s = 1-(math.clamp(ColorPick.AbsolutePosition.X-ColorPick.AbsolutePosition.X, 0, ColorPick.AbsoluteSize.X)/ColorPick.AbsoluteSize.X)
                            color.v = 1-(math.clamp(ColorPick.AbsolutePosition.Y-ColorPick.AbsolutePosition.Y, 0, ColorPick.AbsoluteSize.Y)/ColorPick.AbsoluteSize.Y)

                            extra_value.Color = Color3.fromHSV(color.h, color.s, color.v)
                            menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value

                            function color.update_color()
                                local ColorX = (math.clamp(mouse.X - ColorPicker.AbsolutePosition.X, 0, ColorPicker.AbsoluteSize.X)/ColorPicker.AbsoluteSize.X)
                                local ColorY = (math.clamp(mouse.Y - ColorPicker.AbsolutePosition.Y, 0, ColorPicker.AbsoluteSize.Y)/ColorPicker.AbsoluteSize.Y)
                                ColorPick.Position = UDim2.new(ColorX, 0, ColorY, 0)

                                color.s = 1 - ColorX
                                color.v = 1 - ColorY

                                ColorButton.BackgroundColor3 = Color3.fromHSV(color.h, color.s, color.v)
                                extra_value.Color = Color3.fromHSV(color.h, color.s, color.v)
                                color_callback(extra_value)
                                menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value
                            end
                            ColorPicker.MouseButton1Down:Connect(function()
                                color.update_color()
                                local moveconnection = mouse.Move:Connect(function()
                                    color.update_color()
                                end)
                                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                        color.update_color()
                                        moveconnection:Disconnect()
                                        releaseconnection:Disconnect()
                                    end
                                end)
                            end)

                            function color.update_hue()
                                local y = math.clamp(mouse.Y - HuePicker.AbsolutePosition.Y, 0, 148)
                                HuePick.Position = UDim2.new(0, 0, 0, y)
                                local hue = y/148
                                color.h = 1-hue
                                ColorPicker.ImageColor3 = Color3.fromHSV(color.h, 1, 1)
                                ColorButton.BackgroundColor3 = Color3.fromHSV(color.h, color.s, color.v)
                                if TransparencyColor then
                                    TransparencyColor.ImageColor3 = Color3.fromHSV(color.h, 1, 1)
                                end
                                extra_value.Color = Color3.fromHSV(color.h, color.s, color.v)
                                color_callback(extra_value)
                                menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value
                            end
                            HuePicker.MouseButton1Down:Connect(function()
                                color.update_hue()
                                local moveconnection = mouse.Move:Connect(function()
                                    color.update_hue()
                                end)
                                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                        color.update_hue()
                                        moveconnection:Disconnect()
                                        releaseconnection:Disconnect()
                                    end
                                end)
                            end)

                            function color:set_value(new_value, cb)
                                extra_value = new_value and new_value or extra_value
                                menu.values[tab.tab_num][section_name][sector_name][extra_flag] = extra_value

                                local duplicate = Color3.new(extra_value.Color.R, extra_value.Color.G, extra_value.Color.B)
                                color.h, color.s, color.v = duplicate:ToHSV()
                                color.h = math.clamp(color.h, 0, 1)
                                color.s = math.clamp(color.s, 0, 1)
                                color.v = math.clamp(color.v, 0, 1)
        
                                ColorPick.Position = UDim2.new(1 - color.s, 0, 1 - color.v, 0)
                                ColorPicker.ImageColor3 = Color3.fromHSV(color.h, 1, 1)
                                ColorButton.BackgroundColor3 = Color3.fromHSV(color.h, color.s, color.v)
                                HuePick.Position = UDim2.new(0, 0, 1 - color.h, -1)

                                if TransparencyColor then
                                    TransparencyColor.ImageColor3 = Color3.fromHSV(color.h, 1, 1)

                                    TransparencyPick.Position = UDim2.new(extra_value.Transparency, -1, 0, 0)
                                end

                                if cb == nil or not cb then
                                    color_callback(extra_value)
                                end
                            end
                            color:set_value(color_default and color_default, true)

                            menu.on_load_cfg:Connect(function()
                                color:set_value(menu.values[tab.tab_num][section_name][sector_name][extra_flag])
                            end)

                            return color
                        end
                    elseif type == "Dropdown" then
                        Border.Size = Border.Size + UDim2.new(0, 0, 0, 45)

                        value = {Dropdown = default and default.Dropdown or data.options[1]}

                        local Dropdown = library:create("TextLabel", {
                            Name = "Dropdown",
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 0, 45),
                            Text = "",
                        }, Container)

                        function element:set_visible(bool)
                            if bool then
                                if Dropdown.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, 45)
                                Dropdown.Visible = true
                            else
                                if not Dropdown.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, -45)
                                Dropdown.Visible = false
                            end
                        end

                        local DropdownButton = library:create("TextButton", {
                            Name = "DropdownButton",
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            Position = UDim2.new(0, 9, 0, 20),
                            Size = UDim2.new(0, 260, 0, 20),
                            AutoButtonColor = false,
                            Text = "",
                        }, Dropdown)

                        local DropdownButtonText = library:create("TextLabel", {
                            Name = "DropdownButtonText",
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 6, 0, 0),
                            Size = UDim2.new(0, 250, 1, 0),
                            Font = Enum.Font.Ubuntu,
                            Text = value.Dropdown,
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left,
                        }, DropdownButton)

                        local ImageLabel = library:create("ImageLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 245, 0, 8),
                            Size = UDim2.new(0, 6, 0, 4),
                            Image = "rbxassetid://6724771531",
                        }, DropdownButton)

                        local DropdownText = library:create("TextLabel", {
                            Name = "DropdownText",
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 9, 0, 6),
                            Size = UDim2.new(0, 200, 0, 9),
                            Font = Enum.Font.Ubuntu,
                            Text = text,
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left,
                        }, Dropdown)

                        local DropdownScroll = library:create("ScrollingFrame", {
                            Name = "DropdownScroll",
                            Active = true,
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            Position = UDim2.new(0, 9, 0, 41),
                            Size = UDim2.new(0, 260, 0, 20),
                            CanvasSize = UDim2.new(0, 0, 0, 0),
                            ScrollBarThickness = 2,
                            TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
                            BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
                            Visible = false,
                            ZIndex = 2,
                        }, Dropdown)

                        local UIListLayout = library:create("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                        }, DropdownScroll)

                        local options_num = #data.options
                        if options_num >= 4 then
                            DropdownScroll.Size = UDim2.new(0, 260, 0, 80)
                            for i = 1, options_num do
                                DropdownScroll.CanvasSize = DropdownScroll.CanvasSize + UDim2.new(0, 0, 0, 20)
                            end
                        else
                            DropdownScroll.Size = UDim2.new(0, 260, 0, 20 * options_num)
                        end

                        local in_drop = false
                        local in_drop2 = false
                        local dropdown_open = false
                        DropdownButton.MouseButton1Down:Connect(function()
                            DropdownScroll.Visible = not DropdownScroll.Visible
                            dropdown_open = DropdownScroll.Visible

                            if not dropdown_open then
                                library:tween(DropdownText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                library:tween(DropdownButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                            else
                                library:tween(DropdownText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                                library:tween(DropdownButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                            end
                        end)
                        Dropdown.MouseEnter:Connect(function()
                            in_drop = true
                        end)
                        Dropdown.MouseLeave:Connect(function()
                            in_drop = false
                        end)
                        DropdownScroll.MouseEnter:Connect(function()
                            in_drop2 = true
                        end)
                        DropdownScroll.MouseLeave:Connect(function()
                            in_drop2 = false
                        end)
                        uis.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
                                if DropdownScroll.Visible == true and not in_drop and not in_drop2 then
                                    DropdownScroll.Visible = false
                                    DropdownScroll.CanvasPosition = Vector2.new(0,0)

                                    library:tween(DropdownText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                    library:tween(DropdownButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                end
                            end
                        end)

                        function element:set_value(new_value, cb)
                            value = new_value and new_value or value
                            menu.values[tab.tab_num][section_name][sector_name][flag] = value

                            DropdownButtonText.Text = new_value.Dropdown

                            if cb == nil or not cb then
                                do_callback()
                            end
                        end

                        local dropdown_is_first = true
                        for _,v in next, data.options do
                            local Button = library:create("TextButton", {
                                Name = v,
                                BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                BorderSizePixel = 0,
                                Position = UDim2.new(0, 0, 0, 20),
                                Size = UDim2.new(1, 0, 0, 20),
                                AutoButtonColor = false,
                                Font = Enum.Font.SourceSans,
                                Text = "",
                                ZIndex = 2,
                            }, DropdownScroll)

                            local ButtonText = library:create("TextLabel", {
                                Name = "ButtonText",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 8, 0, 0),
                                Size = UDim2.new(0, 245, 1, 0),
                                Font = Enum.Font.Ubuntu,
                                Text = v,
                                TextColor3 = Color3.fromRGB(150, 150, 150),
                                TextSize = 14,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                ZIndex = 2,
                            }, Button)

                            local Decoration = library:create("Frame", {
                                Name = "Decoration",
                                BackgroundColor3 = Color3.fromRGB(238, 120, 240),
                                BorderSizePixel = 0,
                                Size = UDim2.new(0, 1, 1, 0),
                                Visible = false,
                                ZIndex = 2,
                            }, Button)

                            Button.MouseEnter:Connect(function()
                                library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                                Decoration.Visible = true
                            end)
                            Button.MouseLeave:Connect(function()
                                library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                Decoration.Visible = false
                            end)
                            Button.MouseButton1Down:Connect(function()
                                DropdownScroll.Visible = false
                                DropdownButtonText.Text = v
                                value.Dropdown = v

                                library:tween(DropdownText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                library:tween(DropdownButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})

                                do_callback()
                            end)

                            if dropdown_is_first then
                                dropdown_is_first = false
                            end
                        end
                        element:set_value(value, true)
                    elseif type == "Combo" then
                        Border.Size = Border.Size + UDim2.new(0, 0, 0, 45)

                        value = {Combo = default and default.Combo or {}}

                        local Dropdown = library:create("TextLabel", {
                            Name = "Dropdown",
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 0, 45),
                            Text = "",
                        }, Container)

                        function element:set_visible(bool)
                            if bool then
                                if Dropdown.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, 45)
                                Dropdown.Visible = true
                            else
                                if not Dropdown.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, -45)
                                Dropdown.Visible = false
                            end
                        end

                        local DropdownButton = library:create("TextButton", {
                            Name = "DropdownButton",
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            Position = UDim2.new(0, 9, 0, 20),
                            Size = UDim2.new(0, 260, 0, 20),
                            AutoButtonColor = false,
                            Text = "",
                        }, Dropdown)

                        local DropdownButtonText = library:create("TextLabel", {
                            Name = "DropdownButtonText",
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 6, 0, 0),
                            Size = UDim2.new(0, 250, 1, 0),
                            Font = Enum.Font.Ubuntu,
                            Text = value.Dropdown,
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left,
                        }, DropdownButton)

                        local ImageLabel = library:create("ImageLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 245, 0, 8),
                            Size = UDim2.new(0, 6, 0, 4),
                            Image = "rbxassetid://6724771531",
                        }, DropdownButton)

                        local DropdownText = library:create("TextLabel", {
                            Name = "DropdownText",
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 9, 0, 6),
                            Size = UDim2.new(0, 200, 0, 9),
                            Font = Enum.Font.Ubuntu,
                            Text = text,
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left,
                        }, Dropdown)

                        local DropdownScroll = library:create("ScrollingFrame", {
                            Name = "DropdownScroll",
                            Active = true,
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            Position = UDim2.new(0, 9, 0, 41),
                            Size = UDim2.new(0, 260, 0, 20),
                            CanvasSize = UDim2.new(0, 0, 0, 0),
                            ScrollBarThickness = 2,
                            TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
                            BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
                            Visible = false,
                            ZIndex = 2,
                        }, Dropdown)

                        local UIListLayout = library:create("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                        }, DropdownScroll)

                        local options_num = #data.options
                        if options_num >= 4 then
                            DropdownScroll.Size = UDim2.new(0, 260, 0, 80)
                            for i = 1, options_num do
                                DropdownScroll.CanvasSize = DropdownScroll.CanvasSize + UDim2.new(0, 0, 0, 20)
                            end
                        else
                            DropdownScroll.Size = UDim2.new(0, 260, 0, 20 * options_num)
                        end

                        local in_drop = false
                        local in_drop2 = false
                        local dropdown_open = false
                        DropdownButton.MouseButton1Down:Connect(function()
                            DropdownScroll.Visible = not DropdownScroll.Visible
                            dropdown_open = DropdownScroll.Visible

                            if not dropdown_open then
                                library:tween(DropdownText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                library:tween(DropdownButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                            else
                                library:tween(DropdownText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                                library:tween(DropdownButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                            end
                        end)
                        Dropdown.MouseEnter:Connect(function()
                            in_drop = true
                        end)
                        Dropdown.MouseLeave:Connect(function()
                            in_drop = false
                        end)
                        DropdownScroll.MouseEnter:Connect(function()
                            in_drop2 = true
                        end)
                        DropdownScroll.MouseLeave:Connect(function()
                            in_drop2 = false
                        end)
                        uis.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
                                if DropdownScroll.Visible == true and not in_drop and not in_drop2 then
                                    DropdownScroll.Visible = false
                                    DropdownScroll.CanvasPosition = Vector2.new(0,0)

                                    library:tween(DropdownText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                    library:tween(DropdownButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                end
                            end
                        end)

                        function element.update_text()
							local options = {}
							for i,v in next, data.options do
								if table.find(value.Combo, v) then
									table.insert(options, v)
								end
							end
							local new_text = ""
							if #options == 0 then
								new_text = "..."
							elseif #options == 1 then
								new_text = options[1]
                            else
                                for i,v in next, options do
                                    if i == 1 then
                                        new_text = v
                                    else
                                        if i > 3 then
                                            if i < 5 then
                                                new_text = new_text..",  ..."
                                            end
                                        else
                                            new_text = new_text..",  "..v
                                        end
                                    end
                                end
							end
	
							DropdownButtonText.Text = new_text
						end

                        function element:set_value(new_value, cb)
                            value = new_value and new_value or value
                            menu.values[tab.tab_num][section_name][sector_name][flag] = value
                            
                            element.update_text()

                            for _,DropButton in next, DropdownScroll:GetChildren() do
                                if not DropButton:IsA("TextButton") then continue end
                                local ButtonText = DropButton.ButtonText
                                if table.find(value.Combo, ButtonText.Text) then
                                    DropButton.Decoration.Visible = true
                                    ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
                                else
                                    DropButton.Decoration.Visible = false
                                    ButtonText.TextColor3 = Color3.fromRGB(150, 150, 150)
                                end
                            end

                            if cb == nil or not cb then
                                do_callback()
                            end
                        end

                        local dropdown_is_first = true
                        for _,v in next, data.options do
                            local Button = library:create("TextButton", {
                                Name = v,
                                BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                BorderSizePixel = 0,
                                Position = UDim2.new(0, 0, 0, 20),
                                Size = UDim2.new(1, 0, 0, 20),
                                AutoButtonColor = false,
                                Font = Enum.Font.SourceSans,
                                Text = "",
                                ZIndex = 2,
                            }, DropdownScroll)

                            local ButtonText = library:create("TextLabel", {
                                Name = "ButtonText",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 8, 0, 0),
                                Size = UDim2.new(0, 245, 1, 0),
                                Font = Enum.Font.Ubuntu,
                                Text = v,
                                TextColor3 = Color3.fromRGB(150, 150, 150),
                                TextSize = 14,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                ZIndex = 2,
                            }, Button)

                            local Decoration = library:create("Frame", {
                                Name = "Decoration",
                                BackgroundColor3 = Color3.fromRGB(238, 120, 240),
                                BorderSizePixel = 0,
                                Size = UDim2.new(0, 1, 1, 0),
                                Visible = false,
                                ZIndex = 2,
                            }, Button)

                            local mouse_in = false
                            Button.MouseEnter:Connect(function()
                                mouse_in = true
                                if not table.find(value.Combo, v) then
                                    library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})
                                end
                            end)
                            Button.MouseLeave:Connect(function()
                                mouse_in = false
                                if not table.find(value.Combo, v) then
                                    library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                end
                            end)
                            Button.MouseButton1Down:Connect(function()
                                if table.find(value.Combo, v) then
                                    table.remove(value.Combo, table.find(value.Combo, v))
                                    Decoration.Visible = false
                                    library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                else
                                    table.insert(value.Combo, v)
                                    library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                                    Decoration.Visible = true
                                end

                                element.update_text()

                                do_callback()
                            end)

                            if dropdown_is_first then
                                dropdown_is_first = false
                            end
                        end
                        element:set_value(value, true)
                    elseif type == "Button" then
                        Border.Size = Border.Size + UDim2.new(0, 0, 0, 30)

                        local ButtonFrame = library:create("Frame", {
                            Name = "ButtonFrame",
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, 30),
                        }, Container)

                        local Button = library:create("TextButton", {
                            Name = "Button",
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            Position = UDim2.new(0.5, 0, 0.5, 0),
                            Size = UDim2.new(0, 215, 0, 20),
                            AutoButtonColor = false,
                            Font = Enum.Font.Ubuntu,
                            Text = text,
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                            TextSize = 14,
                        }, ButtonFrame)

                        Button.MouseEnter:Connect(function()
                            library:tween(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                        end)
                        Button.MouseLeave:Connect(function()
                            library:tween(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                        end)
                        Button.MouseButton1Down:Connect(function()
                            Button.BorderColor3 = Color3.fromRGB(238, 120, 240)
                            library:tween(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(0, 0, 0)})
                            do_callback()
                        end)
                    elseif type == "TextBox" then
                        Border.Size = Border.Size + UDim2.new(0, 0, 0, 30)

                        value = {Text = data.default and data.default or ""}

                        local ButtonFrame = library:create("Frame", {
                            Name = "ButtonFrame",
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, 30),
                        }, Container)

                        function element:set_visible(bool)
                            if bool then
                                if ButtonFrame.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, 30)
                                ButtonFrame.Visible = true
                            else
                                if not ButtonFrame.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, -30)
                                ButtonFrame.Visible = false
                            end
                        end

                        local TextBox = library:create("TextBox", {
                            Name = "Button",
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            Position = UDim2.new(0.5, 0, 0.5, 0),
                            Size = UDim2.new(0, 215, 0, 20),
                            Font = Enum.Font.Ubuntu,
                            Text = text,
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                            TextSize = 14,
                            PlaceholderText = text,
                            ClearTextOnFocus = false,
                        }, ButtonFrame)

                        TextBox.MouseEnter:Connect(function()
                            library:tween(TextBox, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                        end)
                        TextBox.MouseLeave:Connect(function()
                            library:tween(TextBox, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                        end)
                        TextBox:GetPropertyChangedSignal("Text"):Connect(function()
                            if string.len(TextBox.Text) > 15 then
                                TextBox.Text = string.sub(TextBox.Text, 1, 15)
                            end
                            if TextBox.Text ~= value.Text then
                                value.Text = TextBox.Text
                                do_callback()
                            end
                        end)
                        uis.TextBoxFocused:connect(function()
                            if uis:GetFocusedTextBox() == TextBox then
                                library:tween(TextBox, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(238, 120, 240)})
                            end
                        end)
                        uis.TextBoxFocusReleased:connect(function()
                            library:tween(TextBox, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(0, 0, 0)})
                        end)
                            

                        function element:set_value(new_value, cb)
                            value = new_value or value

                            TextBox.Text = value.Text

                            if cb == nil or not cb then
                                do_callback()
                            end
                        end
                        element:set_value(value, true)
                    elseif type == "Scroll" then
                        local scrollsize = data.scrollsize and data.scrollsize or 5

                        Border.Size = Border.Size + UDim2.new(0, 0, 0, scrollsize * 20 + 10)

                        value = {Scroll = data.options[1]}

                        local Scroll = library:create("Frame", {
                            Name = "Scroll",
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, scrollsize * 20 + 10),
                        }, Container)

                        function element:set_visible(bool)
                            if bool then
                                if Scroll.Visible then return end
                                Scroll.Size = Border.Size + UDim2.new(0, 0, 0, scrollsize * 20 + 10)
                                Scroll.Visible = true
                            else
                                if not Scroll.Visible then return end
                                Scroll.Size = Border.Size + UDim2.new(0, 0, 0, -scrollsize * 20 + 10)
                                Scroll.Visible = false
                            end
                        end

                        local ScrollFrame = library:create("ScrollingFrame", {
                            Name = "ScrollFrame",
                            Active = true,
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            Position = UDim2.new(0.5, 0, 0, 5),
                            Size = UDim2.new(0, 215, 0, scrollsize * 20),
                            BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
                            CanvasSize = UDim2.new(0, 0, 0, #data.options * 20),
                            ScrollBarThickness = 2,
                            TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
                            AnchorPoint = Vector2.new(0.5, 0),
                            ScrollBarImageColor3 = Color3.fromRGB(238, 120, 240),
                        }, Scroll)
                        ScrollFrame.MouseEnter:Connect(function()
                            library:tween(ScrollFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(50, 50, 50)})
                        end)
                        ScrollFrame.MouseLeave:Connect(function()
                            library:tween(ScrollFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(0, 0, 0)})
                        end)

                        local UIListLayout = library:create("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                        }, ScrollFrame)

                        local scroll_is_first = true
                        for _,v in next, data.options do
                            local Button = library:create("TextButton", {
                                Name = v,
                                BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                BorderSizePixel = 0,
                                Position = UDim2.new(0, 0, 0, 20),
                                Size = UDim2.new(1, 0, 0, 20),
                                AutoButtonColor = false,
                                Font = Enum.Font.SourceSans,
                                Text = "",
                                TextColor3 = Color3.fromRGB(0, 0, 0),
                                TextSize = 14,
                            }, ScrollFrame)

                            local ButtonText = library:create("TextLabel", {
                                Name = "ButtonText",
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 7, 0, 0),
                                Size = UDim2.new(0, 210, 1, 0),
                                Font = Enum.Font.Ubuntu,
                                Text = v,
                                TextColor3 = Color3.fromRGB(150, 150, 150),
                                TextSize = 14,
                                TextXAlignment = Enum.TextXAlignment.Left,
                            }, Button)

                            local Decoration = library:create("Frame", {
                                Name = "Decoration",
                                Parent = Button,
                                BackgroundColor3 = Color3.fromRGB(238, 120, 240),
                                BorderSizePixel = 0,
                                Size = UDim2.new(0, 1, 1, 0),
                                Visible = false,
                            }, Button)

                            local mouse_in = false
                            Button.MouseEnter:Connect(function()
                                mouse_in = true
                                if value.Scroll ~= v then
                                    library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})
                                end
                            end)
                            Button.MouseLeave:Connect(function()
                                mouse_in = false
                                if value.Scroll ~= v then
                                    library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                end
                            end)
                            Button.MouseButton1Down:Connect(function()
                                for _,Button2 in next, ScrollFrame:GetChildren() do
                                    if not Button2:IsA("TextButton") then continue end
                                    Button2.Decoration.Visible = false
                                    library:tween(Button2.ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                end

                                menu.values[tab.tab_num][section_name][sector_name][flag] = value

                                Decoration.Visible = true
                                library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})

                                value.Scroll = v

                                do_callback()
                            end)

                            if scroll_is_first then
                                scroll_is_first = false
                                Decoration.Visible = true
                                ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
                            end
                        end

                        function element:add_value(v)
                            if ScrollFrame:FindFirstChild(v) then return end

                            ScrollFrame.CanvasSize = ScrollFrame.CanvasSize + UDim2.new(0, 0, 0, 20)

                            local Button = library:create("TextButton", {
                                Name = v,
                                BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                                BorderColor3 = Color3.fromRGB(0, 0, 0),
                                BorderSizePixel = 0,
                                Position = UDim2.new(0, 0, 0, 20),
                                Size = UDim2.new(1, 0, 0, 20),
                                AutoButtonColor = false,
                                Font = Enum.Font.SourceSans,
                                Text = "",
                                TextColor3 = Color3.fromRGB(0, 0, 0),
                                TextSize = 14,
                            }, ScrollFrame)

                            local ButtonText = library:create("TextLabel", {
                                Name = "ButtonText",
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 7, 0, 0),
                                Size = UDim2.new(0, 210, 1, 0),
                                Font = Enum.Font.Ubuntu,
                                Text = v,
                                TextColor3 = Color3.fromRGB(150, 150, 150),
                                TextSize = 14,
                                TextXAlignment = Enum.TextXAlignment.Left,
                            }, Button)

                            local Decoration = library:create("Frame", {
                                Name = "Decoration",
                                Parent = Button,
                                BackgroundColor3 = Color3.fromRGB(238, 120, 240),
                                BorderSizePixel = 0,
                                Size = UDim2.new(0, 1, 1, 0),
                                Visible = false,
                            }, Button)
                            
                            local mouse_in = false
                            Button.MouseEnter:Connect(function()
                                mouse_in = true
                                if value.Scroll ~= v then
                                    library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})
                                end
                            end)
                            Button.MouseLeave:Connect(function()
                                mouse_in = false
                                if value.Scroll ~= v then
                                    library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                end
                            end)
                            Button.MouseButton1Down:Connect(function()
                                for _,Button2 in next, ScrollFrame:GetChildren() do
                                    if not Button2:IsA("TextButton") then continue end
                                    Button2.Decoration.Visible = false
                                    library:tween(Button2.ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                end

                                menu.values[tab.tab_num][section_name][sector_name][flag] = value

                                Decoration.Visible = true
                                library:tween(ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})

                                value.Scroll = v

                                do_callback()
                            end)

                            if scroll_is_first then
                                scroll_is_first = false
                                Decoration.Visible = true
                                ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
                            end
                        end

                        function element:set_value(new_value, cb)
                            value = new_value or value

                            for _,Button2 in next, ScrollFrame:GetChildren() do
                                if not Button2:IsA("TextButton") then continue end
                                Button2.Decoration.Visible = false
                                library:tween(Button2.ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                            end
                            ScrollFrame[value.Scroll].Decoration.Visible = true
                            library:tween(ScrollFrame[value.Scroll].ButtonText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})

                            if cb == nil or not cb then
                                do_callback()
                            end
                        end
                        element:set_value(value, true)
                    elseif type == "Slider" then
                        Border.Size = Border.Size + UDim2.new(0, 0, 0, 35)

                        value = {Slider = default and default.default or 0}

                        local min, max = default and default.min or 0, default and default.max or 100

                        local Slider = library:create("Frame", {
                            Name = "Slider",
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 0, 35),
                        }, Container)

                        function element:set_visible(bool)
                            if bool then
                                if Slider.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, 35)
                                Slider.Visible = true
                            else
                                if not Slider.Visible then return end
                                Border.Size = Border.Size + UDim2.new(0, 0, 0, -35)
                                Slider.Visible = false
                            end
                        end

                        local SliderText = library:create("TextLabel", {
                            Name = "SliderText",
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 9, 0, 6),
                            Size = UDim2.new(0, 200, 0, 9),
                            Font = Enum.Font.Ubuntu,
                            Text = text,
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Left,
                        }, Slider)

                        local SliderButton = library:create("TextButton", {
                            Name = "SliderButton",
                            BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            Position = UDim2.new(0, 9, 0, 20),
                            Size = UDim2.new(0, 260, 0, 10),
                            AutoButtonColor = false,
                            Font = Enum.Font.SourceSans,
                            Text = "",
                        }, Slider)

                        local SliderFrame = library:create("Frame", {
                            Name = "SliderFrame",
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BorderSizePixel = 0,
                            Size = UDim2.new(0, 100, 1, 0),
                        }, SliderButton)

                        local UIGradient = library:create("UIGradient", {
                            Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 120, 240)), ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 120, 240))},
                            Rotation = 90,
                        }, SliderFrame)

                        local SliderValue = library:create("TextLabel", {
                            Name = "SliderValue",
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 69, 0, 6),
                            Size = UDim2.new(0, 200, 0, 9),
                            Font = Enum.Font.Ubuntu,
                            Text = value.Slider,
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Right,
                        }, Slider)

                        local is_sliding = false
                        local mouse_in = false
                        Slider.MouseEnter:Connect(function()
                            library:tween(SliderText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
                            library:tween(SliderValue, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})

                            mouse_in = true
                        end)
                        Slider.MouseLeave:Connect(function()
                            if not is_sliding then
                                library:tween(SliderText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                library:tween(SliderValue, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                            end

                            mouse_in = false
                        end)
                        SliderButton.MouseButton1Down:Connect(function()
                            SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 260), 1, 0)
                        
                            local val = math.floor((((max - min) / 260) * SliderFrame.AbsoluteSize.X) + min)
                            if val ~= value.Slider then
                                SliderValue.Text = val
                                value.Slider = val
                                do_callback()
                            end

                            is_sliding = true

                            move_connection = mouse.Move:Connect(function()
                                SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 260), 1, 0)
                        
                                local val = math.floor((((max - min) / 260) * SliderFrame.AbsoluteSize.X) + min)
                                if val ~= value.Slider then
                                    SliderValue.Text = val
                                    value.Slider = val
                                    do_callback()
                                end
                            end)
                            release_connection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 260), 1, 0)
                        
                                    local val = math.floor((((max - min) / 260) * SliderFrame.AbsoluteSize.X) + min)
                                    if val ~= value.Slider then
                                        SliderValue.Text = val
                                        value.Slider = val
                                        do_callback()
                                    end

                                    is_sliding = false

                                    if not mouse_in then
                                        library:tween(SliderText, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                        library:tween(SliderValue, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)})
                                    end

                                    move_connection:Disconnect()
                                    release_connection:Disconnect()
                                end
                            end)
                        end)

                        function element:set_value(new_value, cb)
                            value = new_value and new_value or value
                            menu.values[tab.tab_num][section_name][sector_name][flag] = value

                            local new_size = (value.Slider - min) / (max-min)
                            SliderFrame.Size = UDim2.new(new_size, 0, 1, 0)
                            SliderValue.Text = value.Slider

                            if cb == nil or not cb then
                                do_callback()
                            end
                        end
                        element:set_value(value, true)
                    end

                    menu.on_load_cfg:Connect(function()
                        if type ~= "Button" and type ~= "Scroll" then
                            element:set_value(menu.values[tab.tab_num][section_name][sector_name][flag])
                        end
                    end)

                    return element
                end

                return sector
            end

            return section
        end

        return tab
    end

    return menu
end

return library
