
if KillAuraHitCooldown==nil then getgenv().KillAuraHitCooldown=0.2 end
if SilentAimHitPart==nil then getgenv().SilentAimHitPart="Head"end;if is_sirhurt_closure then
Players.LocalPlayer:Kick("Get KRNL or OxygenU Sirhurt User! L Bozo")end
local __d=game:GetService("Players")local a_d=game:GetService("RunService")
local b_d=game:GetService("UserInputService")local c_d=__d.LocalPlayer:GetMouse()
local d_d=rawget(require(game.ReplicatedStorage.Framework.Nevermore),"_lookupTable")local _ad=rawget(d_d,"Network")
local aad=getupvalue(getsenv(_ad).GetEventHandler,1)
local bad=getupvalue(getsenv(_ad).GetFunctionHandler,1)local cad={}local dad={}local _bd={}local abd={}local bbd={}local cbd={}local dbd={}local _cd={}
local acd={"ez","get good: get .gg/EzDK4AD5Yj","trash","touch grass","retard","i love among us","the impostor?!?!?!","grass? whats that","having issues playing the game? get .gg/EzDK4AD5Yj","is your dad spiderman? because he far from home","do you ever have problems with light users parrying your ds???","how are you that bad??🤣🤣😂🤣🤣","EZ EZ EZ EZ EZ","dont even bother insulting me 🤣🤣😂","this script was brought to you by raid shadow legends!!","do you like cheese?","are you even trying to kill me???","get rekt noobie","go get .gg/EzDK4AD5Yj now","imagine dying",".gg/EzDK4AD5Yj on top (not really)","L Bozo","clapped","nothing personel kid","damn bro you got the whole squad laughing 😂😂🤣","imagine targetting someone. but get clapped afterwards","according to the rules. You should not be hacking because it can get you banned 🤓🤓🤓","nerds be like: OMG LOOK AT THAT HACKER!!! LET'S GET HIM!!!🤓🤓🤓","why am i still writing this? -Probably ZaneIs","haha got you!!!","how are you that bad??🤣😂","нуб бозо","my reaction to that information 😐","OmG nO wAY a hACker!!!","Super Idol的笑容","goddamn i'm still writing -Probably ZaneIs","have you ever heard the hitgame AmongUs???","fr?",'skill issue',"touch grass losers","this move is called 'Devious Lick'","*Gorilla Sounds*","What's up guys it's quandale dingle here.","Bro got fake Jordans 💀","Caught in 4K","Turi ip ip","Say goodbye to your Kneecaps"}getgenv().hitremote=nil;getgenv().swingremote=nil;getgenv().fallremote=
nil;getgenv().ragdollremote=nil;local bcd=SilentAimHitPart;local ccd
local dcd=Instance.new("Highlight",game.CoreGui)local _dd;local add;local bdd=false;local cdd;local ddd;local ___a=false;local a__a;local b__a=1;local c__a=16;local d__a;local _a_a;local aa_a
local ba_a;local ca_a;local da_a;local _b_a;local ab_a;local bb_a=50;local cb_a=false;local db_a=false;local _c_a=false;local ac_a;local bc_a;local cc_a
local dc_a=false;local _d_a;local ad_a=false;local bd_a=false;local cd_a=100;local dd_a=false;local __aa=false
getgenv().TracerColor=Color3.fromRGB(99,13,197)
for ddba,__ca in pairs(getgc(true))do
if
typeof(__ca)=="table"and rawget(__ca,"kick")then __ca.kick=function()return end end
if
typeof(__ca)=='table'and rawget(__ca,'getIsBodyMoverCreatedByGame')then __ca.getIsBodyMoverCreatedByGame=function(a_ca)return true end end
if
typeof(__ca)=="table"and rawget(__ca,"randomDelayKick")then __ca.randomDelayKick=function()return wait(9e9)end end end
table.foreach(aad,function(ddba,__ca)if rawget(__ca,"Remote")then
cad[rawget(__ca,"Remote")]=ddba end end)
table.foreach(bad,function(ddba,__ca)if rawget(__ca,"Remote")then
cad[rawget(__ca,"Remote")]=ddba end end)local a_aa
a_aa=hookmetamethod(game,"__index",function(ddba,__ca)if
(__ca=="Name"or __ca=="name")and cad[ddba]then return cad[ddba]end;return a_aa(ddba,__ca)end)local function b_aa(ddba)
for __ca,a_ca in pairs(cad)do if __ca.Name==ddba then return __ca end end end
local function c_aa()
local ddba=__d.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position;local __ca=math.huge;local a_ca
for b_ca,c_ca in pairs(game.Players:GetPlayers())do
if


c_ca.Character~=nil and c_ca~=__d.LocalPlayer and
c_ca.Character:FindFirstChild("HumanoidRootPart")~=nil and
c_ca.Character:FindFirstChild("Humanoid").Health>0 then local d_ca=c_ca.Character.HumanoidRootPart.Position
local _aca=(ddba-d_ca).Magnitude;if _aca<__ca then __ca=_aca;a_ca=c_ca end end end;return a_ca end
local function d_aa()local ddba,__ca=nil,math.huge
for a_ca,b_ca in pairs(__d:GetPlayers())do
if
b_ca~=__d.LocalPlayer and
b_ca.Character:FindFirstChild("Humanoid")and
b_ca.Character.Humanoid.Health>0 and
b_ca.Character:FindFirstChild("HumanoidRootPart")then
local c_ca,d_ca=workspace.CurrentCamera:WorldToViewportPoint(b_ca.Character.HumanoidRootPart.Position)
if d_ca then
local _aca=(Vector2.new(c_d.X,c_d.Y)-Vector2.new(c_ca.X,c_ca.Y)).Magnitude;if _aca<__ca then __ca=_aca;ddba=b_ca end end end end;return ddba end
local function _aaa(ddba)local __ca=
math.floor(Random.new().NextNumber(Random.new(),0,1)*100)/100;return __ca<=
math.floor(ddba)/100 end;FLYING=false;iyflyspeed=1;vehicleflyspeed=1
function sFLY(ddba)
repeat wait()until

__d.LocalPlayer and
__d.LocalPlayer.Character and __d.LocalPlayer.Character.HumanoidRootPart and
__d.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")repeat wait()until c_d;if flyKeyDown or flyKeyUp then
flyKeyDown:Disconnect()flyKeyUp:Disconnect()end
local __ca=__d.LocalPlayer.Character.HumanoidRootPart;local a_ca={F=0,B=0,L=0,R=0,Q=0,E=0}local b_ca={F=0,B=0,L=0,R=0,Q=0,E=0}local c_ca=0
local function d_ca()
FLYING=true;local _aca=Instance.new('BodyGyro')
local aaca=Instance.new('BodyVelocity')_aca.P=9e4;_aca.Parent=__ca;aaca.Parent=__ca
_aca.maxTorque=Vector3.new(9e9,9e9,9e9)_aca.cframe=__ca.CFrame;aaca.velocity=Vector3.new(0,0,0)
aaca.maxForce=Vector3.new(9e9,9e9,9e9)
task.spawn(function()
repeat wait()
if not ddba and
__d.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')then
__d.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand=true end
if a_ca.L+a_ca.R~=0 or a_ca.F+a_ca.B~=0 or a_ca.Q+
a_ca.E~=0 then c_ca=50 elseif not
(
a_ca.L+a_ca.R~=0 or a_ca.F+a_ca.B~=0 or a_ca.Q+a_ca.E~=0)and c_ca~=0 then
c_ca=0 end
if(a_ca.L+a_ca.R)~=0 or(a_ca.F+a_ca.B)~=0 or(
a_ca.Q+a_ca.E)~=0 then
aaca.velocity=
( (
workspace.CurrentCamera.CoordinateFrame.lookVector* (a_ca.F+a_ca.B))+
( (
workspace.CurrentCamera.CoordinateFrame*
CFrame.new(a_ca.L+a_ca.R,
(a_ca.F+a_ca.B+a_ca.Q+a_ca.E)*0.2,0).p)-
workspace.CurrentCamera.CoordinateFrame.p))*c_ca;b_ca={F=a_ca.F,B=a_ca.B,L=a_ca.L,R=a_ca.R}elseif

(a_ca.L+a_ca.R)==0 and(a_ca.F+a_ca.B)==0 and(a_ca.Q+a_ca.E)==
0 and c_ca~=0 then
aaca.velocity=
( (workspace.CurrentCamera.CoordinateFrame.lookVector* (b_ca.F+
b_ca.B))+
( (
workspace.CurrentCamera.CoordinateFrame*
CFrame.new(b_ca.L+b_ca.R,
(b_ca.F+b_ca.B+a_ca.Q+a_ca.E)*0.2,0).p)-
workspace.CurrentCamera.CoordinateFrame.p))*c_ca else aaca.velocity=Vector3.new(0,0,0)end;_aca.cframe=workspace.CurrentCamera.CoordinateFrame until
not FLYING;a_ca={F=0,B=0,L=0,R=0,Q=0,E=0}b_ca={F=0,B=0,L=0,R=0,Q=0,E=0}c_ca=0
_aca:Destroy()aaca:Destroy()if
__d.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')then
__d.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand=false end end)end
flyKeyDown=c_d.KeyDown:Connect(function(_aca)
if _aca:lower()=='w'then a_ca.F=(ddba and vehicleflyspeed or
iyflyspeed)elseif _aca:lower()=='s'then
a_ca.B=- (ddba and
vehicleflyspeed or iyflyspeed)elseif _aca:lower()=='a'then
a_ca.L=- (ddba and vehicleflyspeed or iyflyspeed)elseif _aca:lower()=='d'then
a_ca.R=(ddba and vehicleflyspeed or iyflyspeed)elseif QEfly and _aca:lower()=='e'then a_ca.Q=
(ddba and vehicleflyspeed or iyflyspeed)*2 elseif
QEfly and _aca:lower()=='q'then
a_ca.E=- (ddba and vehicleflyspeed or iyflyspeed)*2 end
pcall(function()
workspace.CurrentCamera.CameraType=Enum.CameraType.Track end)end)
flyKeyUp=c_d.KeyUp:Connect(function(_aca)
if _aca:lower()=='w'then a_ca.F=0 elseif _aca:lower()=='s'then
a_ca.B=0 elseif _aca:lower()=='a'then a_ca.L=0 elseif _aca:lower()=='d'then a_ca.R=0 elseif
_aca:lower()=='e'then a_ca.Q=0 elseif _aca:lower()=='q'then a_ca.E=0 end end)d_ca()end
function NOFLY()FLYING=false;if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect()
flyKeyUp:Disconnect()end;if
__d.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')then
__d.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand=false end
pcall(function()
workspace.CurrentCamera.CameraType=Enum.CameraType.Custom end)end
firehit=function(ddba,__ca)
local a_ca=ddba[bcd].Position+
Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5))
local b_ca={[1]=__d.LocalPlayer.Character:FindFirstChildOfClass("Tool"),[2]=ddba.Head,[3]=a_ca,[4]=ddba.Head.CFrame:ToObjectSpace(CFrame.new(a_ca)),[5]=
a_ca*
Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5)),[6]=tostring(b__a)}
b_aa("RangedHit"):FireServer(unpack(b_ca))end;getgenv().hitremote=b_aa("MeleeDamage")
getgenv().swingremote=b_aa("MeleeSwing")getgenv().fallremote=b_aa("TakeFallDamage")
for ddba,__ca in
pairs(getgc(true))do
if
typeof(__ca)=="table"and rawget(__ca,"connectCharacter")then __ca.connectCharacter=function(a_ca)return end end end;task.wait(0.5)
pcall(function()for i=1,25 do
b_aa("StartFastRespawn"):FireServer()
b_aa("CompleteFastRespawn"):FireServer()wait()end end)
local aaaa=loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local baaa=aaaa:CreateWindow({Name="Codex X - BETA",LoadingTitle="Codex Beta Version 1.16",LoadingSubtitle="Codex runs everything..",ConfigurationSaving={Enabled=true,FolderName=true,FileName="CodexConfig"},Discord={Enabled=false,Invite="invalid",RememberJoins=true},KeySystem=true,KeySettings={Title="Codex X",Subtitle="Note: Key changes every 24 hours!",Note="Join the discord (discord.gg/soon)",FileName="Codex",SaveKey=true,GrabKeyFromSite=false,Key="{CODEX-6594040e5c014947b1e165d1653df295}"}})
aaaa:Notify({Title="Welcome to Codex X",Content="Only the gifted have the true power of Codex..",Duration=10,Image=11401835408,Actions={Ignore={Name="Okay!",Callback=function(ddba)end}}})local caaa=baaa:CreateTab("Information",4483362458)
local daaa=caaa:CreateParagraph({Title="Trotex Information",Content="Welcome to Codex X, If you are reading this that means you are in the right direction for one of thje leading scripts. Everything in here is still in beta but works well, We hope to see you use this script more and share it upon others! Please note that this is unfinished and is still in beta with new features on the way every week!"})
local _baa=caaa:CreateLabel("!!!PLEASE NOTE ANTI PARRY AND AUTO PARRY ARE ENABLED UPON EXECUTING THIS SCRIPT!!!")local abaa=baaa:CreateTab("Player",7059346386)
local bbaa=abaa:CreateButton({Name="[ All Emotes ]",Callback=function(ddba)
for __ca,a_ca in
pairs(getgc(true))do
if
typeof(a_ca)=="table"and rawget(a_ca,"gamepassIdRequired")then
if a_ca.gamepassIdRequired=="danceEmotes"then a_ca.gamepassIdRequired=nil elseif
a_ca.gamepassIdRequired=="toxicEmotes"then a_ca.gamepassIdRequired=nil elseif a_ca.gamepassIdRequired==
"respectEmotes"then a_ca.gamepassIdRequired=nil end end end end})
local cbaa=abaa:CreateToggle({Name="[ Walk Speed]",CurrentValue=false,Flag="Toggle1",Callback=function(ddba)bd_a=ddba;if not ddba then
__d.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed=16 end end})
local dbaa=abaa:CreateSlider({Name="Walkspeed",Range={16,75},Increment=1,Suffix="Speed",CurrentValue=16,Flag="Walkspeed",Callback=function(ddba)c__a=ddba end})
local _caa=abaa:CreateSlider({Name="Jump Strength",Range={50,200},Increment=1,Suffix="Jump Strength",CurrentValue=50,Flag="JumpStrenth",Callback=function(ddba)bb_a=ddba end})
local acaa=abaa:CreateToggle({Name="Jump",CurrentValue=false,Flag="Toggle1",Callback=function(ddba)ad_a=ddba;if not ddba then
__d.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower=50 end end})
local bcaa=abaa:CreateKeybind({Name="Jump",CurrentKeybind="G",HoldToInteract=false,Flag="Keybind1",Callback=function(ddba)ad_a=ddba;if not ddba then
__d.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower=50 end end})local ccaa=true;local dcaa=baaa:CreateTab("Toggles",4483362458)
local _daa=dcaa:CreateToggle({Name="[ Infinite Stanima ]",CurrentValue=false,Flag="stanima",Callback=function(ddba)
for __ca,a_ca in
pairs(getgc(true))do
if typeof(a_ca)=="table"and rawget(a_ca,"_setStamina")then
local b_ca=a_ca._setStamina
a_ca._setStamina=function(c_ca,d_ca)
if ddba then c_ca._stamina=math.huge
c_ca._staminaChangedSignal:Fire(150)else return b_ca(c_ca,d_ca)end end end end end})local adaa=dcaa:CreateSection("Disable | Actions")
local bdaa=dcaa:CreateToggle({Name="[ Disable | Jump Cooldown ]",CurrentValue=false,Flag="Jump",Callback=function(ddba)
for __ca,a_ca in
pairs(getgc(true))do
if typeof(a_ca)=="table"and rawget(a_ca,"getCanJump")then
local b_ca=a_ca.getCanJump
if ddba then a_ca.getCanJump=function()return true end else return b_ca()end end end end})
local cdaa=dcaa:CreateToggle({Name="[Anti | Fire, Bear Trap]",CurrentValue=false,Flag="AntiFire",Callback=function(ddba)_a_a=ddba end})
local ddaa=dcaa:CreateToggle({Name="[ Disable | Fall Damage]",CurrentValue=false,Flag="falldamage",Callback=function(ddba)ca_a=ddba end})
local __ba=dcaa:CreateToggle({Name="[ Disable | Dash Cooldown ]",CurrentValue=false,Flag="DashCooldown",Callback=function(ddba)
for __ca,a_ca in pairs(getgc(true))do
if
typeof(a_ca)=="table"and rawget(a_ca,"DASH_COOLDOWN")then if ddba then
a_ca.DASH_COOLDOWN=0 else a_ca.DASH_COOLDOWN=3 end end end end})
local a_ba=dcaa:CreateToggle({Name="[ Disable | Ragdoll ]",CurrentValue=false,Flag="Ragdoll",Callback=function(ddba)
for __ca,a_ca in pairs(getgc(true))do
if
typeof(a_ca)=="table"and rawget(a_ca,"toggleRagdoll")then
local b_ca=a_ca.toggleRagdoll
a_ca.toggleRagdoll=function(c_ca,d_ca,_aca)if ddba then return else return b_ca(c_ca,d_ca,_aca)end end end end end})
local b_ba=dcaa:CreateToggle({Name="[ Hide Name ]",CurrentValue=false,Flag="hidename",Callback=function(ddba)_c_a=ddba end})
local c_ba=dcaa:CreateToggle({Name="[ Disable | Perry Cooldown ]",CurrentValue=false,Flag="PerryDisable",Callback=function(ddba)
for __ca,a_ca in pairs(getgc(true))do
if
type(a_ca)=="table"and rawget(a_ca,"PARRY_COOLDOWN_IN_SECONDS")and
rawget(a_ca,"PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY")then
if ddba then
a_ca.PARRY_COOLDOWN_IN_SECONDS=0;a_ca.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY=0 else
a_ca.PARRY_COOLDOWN_IN_SECONDS=3;a_ca.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY=0.33 end end end end})local d_ba=baaa:CreateTab("Main Combat",7485051733)
local _aba=d_ba:CreateToggle({Name="[ Kill Aura ]",CurrentValue=false,Flag="KillAura",Callback=function(ddba)
db_a=ddba end})
local aaba=d_ba:CreateToggle({Name="[ Stomp Aura ]",CurrentValue=false,Flag="Stomp",Callback=function(ddba)ab_a=ddba end})local baba=baaa:CreateTab("Aim-X",11348590105)
local caba=baba:CreateSection("Bow | Aimbot")
local daba=baba:CreateToggle({Name="[ Aimbot ]",CurrentValue=false,Flag="Aimbot",Callback=function(ddba)ac_a=ddba end})
local _bba=baba:CreateToggle({Name="[ Silent Aim ]",CurrentValue=false,Flag="SilentAim",Callback=function(ddba)bc_a=ddba end})
local abba=baba:CreateSlider({Name="Silent Aim | Chance",Range={0,100},Increment=1,Suffix="Silent-Aim",CurrentValue=10,Flag="aimchance",Callback=function(ddba)cd_a=ddba end})local bbba=baba:CreateSection("Toggles")
local cbba=baba:CreateToggle({Name="[Bow | Wallbang ]",CurrentValue=false,Flag="Wallbang",Callback=function(ddba)
if
ddba then
game.CollectionService:AddTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')else
game.CollectionService:RemoveTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')end end})
local dbba=baba:CreateToggle({Name="[ Bow | Anti-Spread ]",CurrentValue=false,Flag="Spread",Callback=function(ddba)_d_a=ddba end})
local _cba=baba:CreateToggle({Name="[ Anti-Recoil ]",CurrentValue=false,Flag="Recoil",Callback=function(ddba)
for __ca,a_ca in pairs(getgc(true))do
if typeof(a_ca)=="table"and
rawget(a_ca,"recoilAmount")then
if ddba then a_ca.recoilAmount=0;a_ca.recoilXMin=0
a_ca.recoilXMax=0;a_ca.recoilYMin=0;a_ca.recoilYMax=0;a_ca.recoilZMin=0;a_ca.recoilZMax=0 else
a_ca.recoilAmount=35;a_ca.recoilXMin=1.25;a_ca.recoilXMax=1.75;a_ca.recoilYMin=-1.5
a_ca.recoilYMax=1.5;a_ca.recoilZMin=-1.5;a_ca.recoilZMax=1.5 end end end end})
local acba=baba:CreateToggle({Name="[ Bow | Anti-Gravity ]",CurrentValue=false,Flag="Gravity",Callback=function(ddba)
for __ca,a_ca in pairs(getgc(true))do if
typeof(a_ca)=="table"and rawget(a_ca,"recoilAmount")then
if ddba then
a_ca.gravity=Vector3.new(0,0,0)else a_ca.gravity=Vector3.new(0,-10,0)end end end end})
local bcba=baba:CreateToggle({Name="[ Heavy Bow | Instant Charge ]",CurrentValue=false,Flag="HeavyBow",Callback=function(ddba)dd_a=ddba end})local ccba=baaa:CreateTab("Visuals",6523858422)
local dcba=ccba:CreateToggle({Name="[ Tracers ]",CurrentValue=false,Flag="Tracers",Callback=function(ddba)
ba_a=ddba end})
local _dba=ccba:CreateToggle({Name="[ Names/Text ]",CurrentValue=false,Flag="names",Callback=function(ddba)da_a=ddba end})
local adba=ccba:CreateToggle({Name="[ Boxes ]",CurrentValue=false,Flag="boxes",Callback=function(ddba)__aa=val end})
__d.PlayerRemoving:Connect(function(ddba)if table.find(abd,ddba.Name)then
table.remove(abd,abd[ddba.Name])end;if bbd[ddba]then
bbd[ddba]:Remove()bbd[ddba]=nil end end)
__d.LocalPlayer.leaderstats.Score.Changed:Connect(function()if
cb_a then
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(acd[math.random(1,
#acd)])end end)
for ddba,__ca in pairs(game.Players:GetPlayers())do
if __ca~=__d.LocalPlayer then
table.insert(abd,__ca.Name)
if __ca.Character then local a_ca=Drawing.new("Line")
a_ca.From=Vector2.new(
workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y)a_ca.Color=TracerColor;a_ca.Thickness=2;dad[__ca]=a_ca
local b_ca=Drawing.new("Text")b_ca.Text=__ca.Name;b_ca.Size=20;b_ca.Outline=true
b_ca.OutlineColor=Color3.new(0,0,0)b_ca.Center=true;_bd[__ca]=b_ca;local c_ca=Drawing.new("Square")
c_ca.Thickness=1;c_ca.Filled=false;c_ca.Visible=false;c_ca.ZIndex=50;bbd[__ca]=c_ca
local d_ca=Drawing.new("Square")d_ca.Visible=false;d_ca.Thickness=2;d_ca.Filled=false;d_ca.ZIndex=1
cbd[__ca]=d_ca;local _aca=Drawing.new("Square")_aca.Visible=false
_aca.Filled=true;_aca.Thickness=2;_aca.ZIndex=1;_cd[__ca]=_aca
local aaca=Drawing.new("Square")aaca.Visible=false;aaca.Filled=true;aaca.ZIndex=50;dbd[__ca]=aaca end
__ca.CharacterAdded:Connect(function()local a_ca=Drawing.new("Line")
a_ca.From=Vector2.new(
workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y)a_ca.Color=TracerColor;a_ca.Thickness=2;dad[__ca]=a_ca
local b_ca=Drawing.new("Text")b_ca.Text=__ca.Name;b_ca.Size=20;b_ca.Outline=true
b_ca.OutlineColor=Color3.new(0,0,0)b_ca.Center=true;_bd[__ca]=b_ca end)
__ca.CharacterRemoving:Connect(function()dad[__ca]:Remove()
dad[__ca]=nil;_bd[__ca]:Remove()_bd[__ca]=nil end)end end
__d.PlayerAdded:Connect(function(ddba)table.insert(abd,ddba.Name)
ddba.CharacterAdded:Connect(function()
local __ca=Drawing.new("Line")
__ca.From=Vector2.new(workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y)__ca.Color=TracerColor;__ca.Thickness=2;dad[ddba]=__ca
local a_ca=Drawing.new("Text")a_ca.Text=ddba.Name;a_ca.Size=20;a_ca.Outline=true
a_ca.OutlineColor=Color3.new(0,0,0)a_ca.Center=true;_bd[ddba]=a_ca
if
ddba~=__d.LocalPlayer and not bbd[ddba]then local b_ca=Drawing.new("Square")b_ca.Thickness=1
b_ca.Filled=false;b_ca.Visible=false;bbd[ddba]=b_ca
local c_ca=Drawing.new("Square")c_ca.Visible=false;c_ca.Thickness=2;c_ca.Filled=false;c_ca.ZIndex=1
cbd[ddba]=c_ca;local d_ca=Drawing.new("Square")d_ca.Visible=false
d_ca.Filled=true;d_ca.Thickness=2;d_ca.ZIndex=1;_cd[ddba]=d_ca
local _aca=Drawing.new("Square")_aca.Visible=false;_aca.Filled=true;_aca.ZIndex=50;dbd[ddba]=_aca end end)
ddba.CharacterRemoving:Connect(function()dad[ddba]:Remove()
dad[ddba]=nil;_bd[ddba]:Remove()_bd[ddba]=nil end)end)
c_d.KeyDown:Connect(function(ddba)if d__a and ddba==" "then
__d.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState(3)end end)
b_d.InputBegan:Connect(function(ddba)if
ddba.UserInputType==Enum.UserInputType.MouseButton2 then bdd=true;ddd=d_aa()end end)
b_d.InputEnded:Connect(function(ddba)
if
ddba.UserInputType==Enum.UserInputType.MouseButton2 then bdd=false;cdd=false;b_d.MouseBehavior=Enum.MouseBehavior.Default end end)local bdba
bdba=workspace.EffectsJunk.ChildAdded:Connect(function(ddba)
if
__d.LocalPlayer.Character:FindFirstChildOfClass("Tool")==nil then ___a=false;return end
local __ca=__d.LocalPlayer.Character:FindFirstChildOfClass("Tool")
if __ca:FindFirstChild("ClientAmmo")==nil then ___a=false;return end;if ___a and ddba:IsA("MeshPart")then ccd=ddba
Instance.new("SelectionBox",ddba).Adornee=ddba;___a=false end end)
for ddba,__ca in pairs(getgc(true))do
if
typeof(__ca)=="table"and rawget(__ca,"shoot")then local a_ca=__ca.shoot
__ca.shoot=function(b_ca)___a=true;b__a=b_ca.shotIdx;_dd=d_aa()
return a_ca(b_ca)end end
if
typeof(__ca)=="table"and rawget(__ca,"calculateFireDirection")then old=__ca.calculateFireDirection
__ca.calculateFireDirection=function(a_ca,b_ca,c_ca,d_ca)
local _aca=__d.LocalPlayer.Character:FindFirstChildOfClass("Tool")if _aca:FindFirstChild("ClientAmmo")==nil then return
old(a_ca,b_ca,c_ca,d_ca)end
if _d_a then b_ca=0;c_ca=0 end
if bc_a and ___a then local aaca=d_aa()
local baca=aaca.Character.Head.CFrame+ (
aaca.Character.Head.Velocity*0.19 +Vector3.new(0,.1,0))
return
(CFrame.lookAt(_aca.Contents.Handle.FirePoint.WorldCFrame.Position,baca.Position)).LookVector*30 end;return old(a_ca,b_ca,c_ca,d_ca)end end end
task.spawn(function()
while task.wait(KillAuraHitCooldown)do
if db_a then
pcall(function()
table.foreach(__d.LocalPlayer.Backpack:GetChildren(),function(__ca,a_ca)
if
a_ca:IsA("Tool")and a_ca:FindFirstChild("Hitboxes")then a__a=a_ca end end)local ddba=c_aa()
if
ddba.Character:FindFirstChild("SemiTransparentShield").Transparency==1 then
swingremote:FireServer(a__a,1)
hitremote:FireServer(a__a,ddba.Character:FindFirstChild("HumanoidRootPart"),a__a.Hitboxes.Hitbox,ddba.Character:FindFirstChild("HumanoidRootPart").Position)
hitremote:FireServer(a__a,ddba.Character:FindFirstChild("HumanoidRootPart"),a__a.Hitboxes.Hitbox,ddba.Character:FindFirstChild("HumanoidRootPart").Position)end end)end
if bc_a then
pcall(function()
local ddba=__d.LocalPlayer.Character:FindFirstChildOfClass("Tool")if _dd then dcd.Adornee=d_aa().Character end
if ccd then
if _dd then
if
(ccd.Position-
_dd.Character.HumanoidRootPart.Position).Magnitude<=15 then
if cd_a==100 then firehit(_dd.Character,ccd)ccd=nil;___a=false else
local __ca=_aaa(cd_a)
if __ca then firehit(_dd.Character,ccd)ccd=nil;___a=false end end end end end end)end end end)
task.spawn(function()
a_d.Stepped:Connect(function()
if bd_a then
if
not b_d:IsKeyDown(Enum.KeyCode.LeftShift)then
__d.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed=c__a else __d.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed=
c__a+10.56 end end;if ad_a then
__d.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower=bb_a end;if aa_a and
__d.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")then keypress(0x20)
keyrelease(0x20)end
if ab_a then
for __ca,a_ca in
pairs(__d:GetPlayers())do
if
a_ca~=__d.LocalPlayer and a_ca.Character:FindFirstChild("Humanoid")and
a_ca.Character:FindFirstChild("Humanoid").Health<=15 then
if
(
a_ca.Character.HumanoidRootPart.Position-__d.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<=4 then keypress(0x51)
keyrelease(0x51)end end end end
pcall(function()
if ac_a and bdd then cdd=true
if cdd and ddd~=nil then
local __ca=
ddd.Character.HumanoidRootPart.CFrame+ (ddd.Character.HumanoidRootPart.Velocity*0.19 +
Vector3.new(0,.1,0))
workspace.CurrentCamera.CFrame=CFrame.lookAt(workspace.CurrentCamera.CFrame.Position,__ca.Position)b_d.MouseBehavior=Enum.MouseBehavior.LockCenter end end end)if _c_a then
b_aa("UpdateIsCrouching"):FireServer(true)else
b_aa("UpdateIsCrouching"):FireServer(false)end
pcall(function()
for __ca,a_ca in
pairs(__d.LocalPlayer.Backpack:GetChildren())do
if a_ca:IsA("Tool")then
if a_ca:FindFirstChild("Hitboxes")~=nil then if dc_a and not
__d.LocalPlayer.Character:FindFirstChildOfClass("Tool")then
a_ca.Parent=__d.LocalPlayer.Character end end end end end)if _b_a then
for __ca,a_ca in
pairs(__d.LocalPlayer.Character:GetDescendants())do if a_ca:IsA("BasePart")then a_ca.CanCollide=false end end end
if ba_a then
for __ca,a_ca in
pairs(dad)do
if
__ca.Character and __ca.Character:FindFirstChild("HumanoidRootPart")then
local b_ca,c_ca=workspace.CurrentCamera:WorldToViewportPoint(__ca.Character.HumanoidRootPart.Position)a_ca.Color=TracerColor
a_ca.To=Vector2.new(b_ca.X,b_ca.Y)a_ca.Visible=c_ca else a_ca.Visible=false end end else for __ca,a_ca in pairs(dad)do a_ca.Visible=false end end
if da_a then
for __ca,a_ca in pairs(_bd)do
if
__ca.Character and __ca.Character:FindFirstChild("Head")then
local b_ca,c_ca=workspace.CurrentCamera:WorldToViewportPoint(__ca.Character.Head.Position)a_ca.Position=Vector2.new(b_ca.X,b_ca.Y-28)
a_ca.Color=TracerColor;a_ca.Visible=c_ca else a_ca.Visible=false end end else for __ca,a_ca in pairs(_bd)do a_ca.Visible=false end end
if __aa then
for __ca,a_ca in pairs(__d:GetPlayers())do
if
a_ca~=__d.LocalPlayer and
a_ca.Character:FindFirstChild("HumanoidRootPart")and
a_ca.Character:FindFirstChild("Humanoid")and
a_ca.Character.Humanoid.Health>0 then
local b_ca,c_ca=workspace.CurrentCamera:WorldToViewportPoint(a_ca.Character.HumanoidRootPart.Position)
local d_ca,_aca=workspace.CurrentCamera:WorldToViewportPoint(a_ca.Character.Head.Position+
Vector3.new(0,1,0))
local aaca,baca=workspace.CurrentCamera:WorldToViewportPoint(
a_ca.Character.HumanoidRootPart.Position-Vector3.new(0,3,0))local caca=2000 /b_ca.Z;local daca=d_ca.Y-aaca.Y
bbd[a_ca].Visible=c_ca;cbd[a_ca].Visible=c_ca;dbd[a_ca].Visible=c_ca
_cd[a_ca].Visible=c_ca
if c_ca then
bbd[a_ca].Position=Vector2.new(b_ca.X-bbd[a_ca].Size.X/2,
b_ca.Y-bbd[a_ca].Size.Y/2)bbd[a_ca].Size=Vector2.new(caca,daca)
bbd[a_ca].Color=TracerColor
cbd[a_ca].Position=Vector2.new(b_ca.X-bbd[a_ca].Size.X/2,
b_ca.Y-bbd[a_ca].Size.Y/2)cbd[a_ca].Size=Vector2.new(caca,daca)
_cd[a_ca].Size=Vector2.new(3,daca)
_cd[a_ca].Position=
Vector2.new(b_ca.X-bbd[a_ca].Size.X/2,
b_ca.Y-bbd[a_ca].Size.Y/2)-Vector2.new(6,0)
dbd[a_ca].Color=Color3.fromRGB(173,0,0):Lerp(Color3.fromRGB(0,160,0),
a_ca.Character:FindFirstChild("Humanoid").Health/a_ca.Character:FindFirstChild("Humanoid").MaxHealth)
dbd[a_ca].Size=Vector2.new(2,(-_cd[a_ca].Size.Y-2)*
(
a_ca.Character:FindFirstChild("Humanoid").Health/a_ca.Character:FindFirstChild("Humanoid").MaxHealth))dbd[a_ca].Position=_cd[a_ca].Position+
Vector2.new(1,-1 +_cd[a_ca].Size.Y)end else
if a_ca~=__d.LocalPlayer then bbd[a_ca].Visible=false
cbd[a_ca].Visible=false;dbd[a_ca].Visible=false;_cd[a_ca].Visible=false end end end else for __ca,a_ca in pairs(bbd)do a_ca.Visible=false end;for __ca,a_ca in pairs(cbd)do
a_ca.Visible=false end
for __ca,a_ca in pairs(dbd)do a_ca.Visible=false end;for __ca,a_ca in pairs(_cd)do a_ca.Visible=false end end
local ddba=__d.LocalPlayer.Character:FindFirstChildOfClass("Tool")if
ddba~=nil and ddba:FindFirstChild("ClientAmmo")==nil then return end
if __d.LocalPlayer.Character then
if
__d.LocalPlayer.Character:FindFirstChild('Longbow')and dd_a then
for __ca,a_ca in
pairs(getconnections(ddba.ChargeProgressClient:GetPropertyChangedSignal("Value")))do a_ca:Disable()end;ddba.ChargeProgressClient.Value=1 end end end)end)local cdba
cdba=hookmetamethod(game,"__namecall",function(ddba,...)
if not checkcaller()and
getnamecallmethod()=="FireServer"and _a_a and tostring(ddba)==
"GotHitRE"then return elseif

not
checkcaller()and getnamecallmethod()=="FireServer"and ca_a and ddba.Name==fallremote.Name then return elseif

(getnamecallmethod()=="Kick"or getnamecallmethod()=="kick")and ddba==game.Players.LocalPlayer then return end;return cdba(ddba,...)end)
for ddba,__ca in next,abd:GetPlayers()do task.spawn(Update,__ca)end
abd.PlayerAdded:Connect(function(ddba)task.spawn(Update,ddba)end)aaaa:LoadConfiguration()
