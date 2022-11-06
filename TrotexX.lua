
if KillAuraHitCooldown==nil then getgenv().KillAuraHitCooldown=0.2 end
if SilentAimHitPart==nil then getgenv().SilentAimHitPart="Head"end;if is_sirhurt_closure then
Players.LocalPlayer:Kick("Get KRNL or OxygenU Sirhurt User! L Bozo")end;function parry()
game:GetService("ReplicatedStorage").Communication.Events.Parry:FireServer()end
local bcc=game:GetService("Players")local ccc=game:GetService("RunService")
local dcc=game:GetService("UserInputService")local _dc=bcc.LocalPlayer:GetMouse()
local adc=rawget(require(game.ReplicatedStorage.Framework.Nevermore),"_lookupTable")local bdc=rawget(adc,"Network")
local cdc=getupvalue(getsenv(bdc).GetEventHandler,1)
local ddc=getupvalue(getsenv(bdc).GetFunctionHandler,1)local __d={}local a_d={}local b_d={}local c_d={}local d_d={}local _ad={}local aad={}local bad={}
local cad={"ez","get good: get .gg/EzDK4AD5Yj","trash","touch grass","retard","i love among us","the impostor?!?!?!","grass? whats that","having issues playing the game? get .gg/EzDK4AD5Yj","is your dad spiderman? because he far from home","do you ever have problems with light users parrying your ds???","how are you that bad??�?���?���???�?���?��","EZ EZ EZ EZ EZ","dont even bother insulting me �?���?���???","this script was brought to you by raid shadow legends!!","do you like cheese?","are you even trying to kill me???","get rekt noobie","go get .gg/EzDK4AD5Yj now","imagine dying",".gg/EzDK4AD5Yj on top (not really)","L Bozo","clapped","nothing personel kid","damn bro you got the whole squad laughing �???�???�?��","imagine targetting someone. but get clapped afterwards","according to the rules. You should not be hacking because it can get you banned �?�?�?�?�?�?","nerds be like: OMG LOOK AT THAT HACKER!!! LET'S GET HIM!!!�?�?�?�?�?�?","why am i still writing this? -Probably ZaneIs","haha got you!!!","how are you that bad??�?���???","н�?б бозо","my reaction to that information �??�","OmG nO wAY a hACker!!!","Super Idol�??��?容","goddamn i'm still writing -Probably ZaneIs","have you ever heard the hitgame AmongUs???","fr?",'skill issue',"touch grass losers","this move is called 'Devious Lick'","*Gorilla Sounds*","What's up guys it's quandale dingle here.","Bro got fake Jordans �???","Caught in 4K","Turi ip ip","Say goodbye to your Kneecaps"}getgenv().hitremote=nil;getgenv().swingremote=nil;getgenv().fallremote=
nil;getgenv().ragdollremote=nil;local dad=SilentAimHitPart;local _bd
local abd=Instance.new("Highlight",game.CoreGui)local bbd;local cbd;local dbd=false;local _cd;local acd;local bcd=false;local ccd;local dcd=1;local _dd=16;local add;local bdd;local cdd;local ddd
local ___a;local a__a;local b__a;local c__a;local d__a=50;local _a_a=false;local aa_a=false;local ba_a=false;local ca_a;local da_a;local _b_a=false
local ab_a;local bb_a=false;local cb_a=false;local db_a=100;local _c_a=false;local ac_a=false
getgenv().TracerColor=Color3.fromRGB(99,13,197)
for caba,daba in pairs(getgc(true))do
if
typeof(daba)=="table"and rawget(daba,"kick")then daba.kick=function()return end end
if
typeof(daba)=='table'and rawget(daba,'getIsBodyMoverCreatedByGame')then daba.getIsBodyMoverCreatedByGame=function(_bba)return true end end
if
typeof(daba)=="table"and rawget(daba,"randomDelayKick")then daba.randomDelayKick=function()return wait(9e9)end end end
table.foreach(cdc,function(caba,daba)if rawget(daba,"Remote")then
__d[rawget(daba,"Remote")]=caba end end)
table.foreach(ddc,function(caba,daba)if rawget(daba,"Remote")then
__d[rawget(daba,"Remote")]=caba end end)local bc_a
bc_a=hookmetamethod(game,"__index",function(caba,daba)if
(daba=="Name"or daba=="name")and __d[caba]then return __d[caba]end;return bc_a(caba,daba)end)local function cc_a(caba)
for daba,_bba in pairs(__d)do if daba.Name==caba then return daba end end end
local function dc_a()
local caba=bcc.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position;local daba=math.huge;local _bba
for abba,bbba in pairs(game.Players:GetPlayers())do
if


bbba.Character~=nil and bbba~=bcc.LocalPlayer and
bbba.Character:FindFirstChild("HumanoidRootPart")~=nil and
bbba.Character:FindFirstChild("Humanoid").Health>0 then local cbba=bbba.Character.HumanoidRootPart.Position
local dbba=(caba-cbba).Magnitude;if dbba<daba then daba=dbba;_bba=bbba end end end;return _bba end
local function _d_a()local caba,daba=nil,math.huge
for _bba,abba in pairs(bcc:GetPlayers())do
if
abba~=bcc.LocalPlayer and
abba.Character:FindFirstChild("Humanoid")and
abba.Character.Humanoid.Health>0 and
abba.Character:FindFirstChild("HumanoidRootPart")then
local bbba,cbba=workspace.CurrentCamera:WorldToViewportPoint(abba.Character.HumanoidRootPart.Position)
if cbba then
local dbba=(Vector2.new(_dc.X,_dc.Y)-Vector2.new(bbba.X,bbba.Y)).Magnitude;if dbba<daba then daba=dbba;caba=abba end end end end;return caba end
local function ad_a(caba)local daba=
math.floor(Random.new().NextNumber(Random.new(),0,1)*100)/100;return daba<=
math.floor(caba)/100 end;FLYING=false;iyflyspeed=1;vehicleflyspeed=1
function sFLY(caba)
repeat wait()until

bcc.LocalPlayer and
bcc.LocalPlayer.Character and bcc.LocalPlayer.Character.HumanoidRootPart and
bcc.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")repeat wait()until _dc;if flyKeyDown or flyKeyUp then
flyKeyDown:Disconnect()flyKeyUp:Disconnect()end
local daba=bcc.LocalPlayer.Character.HumanoidRootPart;local _bba={F=0,B=0,L=0,R=0,Q=0,E=0}local abba={F=0,B=0,L=0,R=0,Q=0,E=0}local bbba=0
local function cbba()
FLYING=true;local dbba=Instance.new('BodyGyro')
local _cba=Instance.new('BodyVelocity')dbba.P=9e4;dbba.Parent=daba;_cba.Parent=daba
dbba.maxTorque=Vector3.new(9e9,9e9,9e9)dbba.cframe=daba.CFrame;_cba.velocity=Vector3.new(0,0,0)
_cba.maxForce=Vector3.new(9e9,9e9,9e9)
task.spawn(function()
repeat wait()
if not caba and
bcc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')then
bcc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand=true end
if _bba.L+_bba.R~=0 or _bba.F+_bba.B~=0 or _bba.Q+
_bba.E~=0 then bbba=50 elseif not
(
_bba.L+_bba.R~=0 or _bba.F+_bba.B~=0 or _bba.Q+_bba.E~=0)and bbba~=0 then
bbba=0 end
if(_bba.L+_bba.R)~=0 or(_bba.F+_bba.B)~=0 or(
_bba.Q+_bba.E)~=0 then
_cba.velocity=
( (
workspace.CurrentCamera.CoordinateFrame.lookVector* (_bba.F+_bba.B))+
( (
workspace.CurrentCamera.CoordinateFrame*
CFrame.new(_bba.L+_bba.R,
(_bba.F+_bba.B+_bba.Q+_bba.E)*0.2,0).p)-
workspace.CurrentCamera.CoordinateFrame.p))*bbba;abba={F=_bba.F,B=_bba.B,L=_bba.L,R=_bba.R}elseif

(_bba.L+_bba.R)==0 and(_bba.F+_bba.B)==0 and(_bba.Q+_bba.E)==
0 and bbba~=0 then
_cba.velocity=
( (workspace.CurrentCamera.CoordinateFrame.lookVector* (abba.F+
abba.B))+
( (
workspace.CurrentCamera.CoordinateFrame*
CFrame.new(abba.L+abba.R,
(abba.F+abba.B+_bba.Q+_bba.E)*0.2,0).p)-
workspace.CurrentCamera.CoordinateFrame.p))*bbba else _cba.velocity=Vector3.new(0,0,0)end;dbba.cframe=workspace.CurrentCamera.CoordinateFrame until
not FLYING;_bba={F=0,B=0,L=0,R=0,Q=0,E=0}abba={F=0,B=0,L=0,R=0,Q=0,E=0}bbba=0
dbba:Destroy()_cba:Destroy()if
bcc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')then
bcc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand=false end end)end
flyKeyDown=_dc.KeyDown:Connect(function(dbba)
if dbba:lower()=='w'then _bba.F=(caba and vehicleflyspeed or
iyflyspeed)elseif dbba:lower()=='s'then
_bba.B=- (caba and
vehicleflyspeed or iyflyspeed)elseif dbba:lower()=='a'then
_bba.L=- (caba and vehicleflyspeed or iyflyspeed)elseif dbba:lower()=='d'then
_bba.R=(caba and vehicleflyspeed or iyflyspeed)elseif QEfly and dbba:lower()=='e'then _bba.Q=
(caba and vehicleflyspeed or iyflyspeed)*2 elseif
QEfly and dbba:lower()=='q'then
_bba.E=- (caba and vehicleflyspeed or iyflyspeed)*2 end
pcall(function()
workspace.CurrentCamera.CameraType=Enum.CameraType.Track end)end)
flyKeyUp=_dc.KeyUp:Connect(function(dbba)
if dbba:lower()=='w'then _bba.F=0 elseif dbba:lower()=='s'then
_bba.B=0 elseif dbba:lower()=='a'then _bba.L=0 elseif dbba:lower()=='d'then _bba.R=0 elseif
dbba:lower()=='e'then _bba.Q=0 elseif dbba:lower()=='q'then _bba.E=0 end end)cbba()end
function NOFLY()FLYING=false;if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect()
flyKeyUp:Disconnect()end;if
bcc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')then
bcc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand=false end
pcall(function()
workspace.CurrentCamera.CameraType=Enum.CameraType.Custom end)end
firehit=function(caba,daba)
local _bba=caba[dad].Position+
Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5))
local abba={[1]=bcc.LocalPlayer.Character:FindFirstChildOfClass("Tool"),[2]=caba.Head,[3]=_bba,[4]=caba.Head.CFrame:ToObjectSpace(CFrame.new(_bba)),[5]=
_bba*
Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5)),[6]=tostring(dcd)}
cc_a("RangedHit"):FireServer(unpack(abba))end;getgenv().hitremote=cc_a("MeleeDamage")
getgenv().swingremote=cc_a("MeleeSwing")getgenv().fallremote=cc_a("TakeFallDamage")
for caba,daba in
pairs(getgc(true))do
if
typeof(daba)=="table"and rawget(daba,"connectCharacter")then daba.connectCharacter=function(_bba)return end end end;task.wait(0.5)
pcall(function()for i=1,25 do
cc_a("StartFastRespawn"):FireServer()
cc_a("CompleteFastRespawn"):FireServer()wait()end end)
local bd_a=loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local cd_a=bd_a:CreateWindow({Name="Trotex X - BETA",LoadingTitle="Trotex Beta Version 1.2.4",LoadingSubtitle="Thanks for choosing Trotex!",ConfigurationSaving={Enabled=true,FolderName=true,FileName="TrotexX"},Discord={Enabled=false,Invite="sirius",RememberJoins=true},KeySystem=true,KeySettings={Title="Trotex X",Subtitle="Note: Key changes every 24 hours!",Note="Join the discord (discord.gg/sirius)",FileName="TrotexKey",SaveKey=true,GrabKeyFromSite=false,Key="{TROTEX-6594040e5c014947b1e165d1653df295}"}})
bd_a:Notify({Title="Welcome to Trotex X",Content="Please note that this script is in beta and only works in COMBAT WARRIORS",Duration=10,Image=11401835408,Actions={Ignore={Name="Okay!",Callback=function(caba)
print(combatwarriors)end}}})local dd_a=cd_a:CreateTab("Information",4483362458)
local __aa=dd_a:CreateParagraph({Title="Trotex Information",Content="Welcome to Trotex X, If you are reading this that means you are in the right direction for one of thje leading scripts. Everything in here is still in beta but works well, We hope to see you use this script more and share it upon others! Please note that this is unfinished and is still in beta with new features on the way every week!"})local a_aa=cd_a:CreateTab("Main",7059346386)
local b_aa=a_aa:CreateButton({Name="[ All Emotes ]",Callback=function(caba)
for daba,_bba in
pairs(getgc(true))do
if
typeof(_bba)=="table"and rawget(_bba,"gamepassIdRequired")then
if _bba.gamepassIdRequired=="danceEmotes"then _bba.gamepassIdRequired=nil elseif
_bba.gamepassIdRequired=="toxicEmotes"then _bba.gamepassIdRequired=nil elseif _bba.gamepassIdRequired==
"respectEmotes"then _bba.gamepassIdRequired=nil end end end end})local c_aa=cd_a:CreateTab("Toggles",4483362458)
local d_aa=c_aa:CreateToggle({Name="[ Infinite Stanima ]",CurrentValue=false,Flag="stanima",Callback=function(caba)
for daba,_bba in
pairs(getgc(true))do
if typeof(_bba)=="table"and rawget(_bba,"_setStamina")then
local abba=_bba._setStamina
_bba._setStamina=function(bbba,cbba)
if caba then bbba._stamina=math.huge
bbba._staminaChangedSignal:Fire(150)else return abba(bbba,cbba)end end end end end})local _aaa=c_aa:CreateSection("Disable | Actions")
local aaaa=c_aa:CreateToggle({Name="[ Disable | Jump Cooldown ]",CurrentValue=false,Flag="Jump",Callback=function(caba)
for daba,_bba in
pairs(getgc(true))do
if typeof(_bba)=="table"and rawget(_bba,"getCanJump")then
local abba=_bba.getCanJump
if caba then _bba.getCanJump=function()return true end else return abba()end end end end})
local baaa=c_aa:CreateToggle({Name="[Anti | Fire, Bear Trap]",CurrentValue=false,Flag="AntiFire",Callback=function(caba)bdd=caba end})
local caaa=c_aa:CreateToggle({Name="[ Disable | Fall Damage]",CurrentValue=false,Flag="falldamage",Callback=function(caba)___a=caba end})
local daaa=c_aa:CreateToggle({Name="[ Disable | Dash Cooldown ]",CurrentValue=false,Flag="DashCooldown",Callback=function(caba)
for daba,_bba in pairs(getgc(true))do
if
typeof(_bba)=="table"and rawget(_bba,"DASH_COOLDOWN")then if caba then
_bba.DASH_COOLDOWN=0 else _bba.DASH_COOLDOWN=3 end end end end})
local _baa=c_aa:CreateToggle({Name="[ Disable | Ragdoll ]",CurrentValue=false,Flag="Ragdoll",Callback=function(caba)
for daba,_bba in pairs(getgc(true))do
if
typeof(_bba)=="table"and rawget(_bba,"toggleRagdoll")then
local abba=_bba.toggleRagdoll
_bba.toggleRagdoll=function(bbba,cbba,dbba)if caba then return else return abba(bbba,cbba,dbba)end end end end end})
local abaa=c_aa:CreateToggle({Name="[ Hide Name ]",CurrentValue=false,Flag="hidename",Callback=function(caba)ba_a=caba end})
local bbaa=c_aa:CreateToggle({Name="[ Disable | Perry Cooldown ]",CurrentValue=false,Flag="PerryDisable",Callback=function(caba)
for daba,_bba in pairs(getgc(true))do
if
type(_bba)=="table"and rawget(_bba,"PARRY_COOLDOWN_IN_SECONDS")and
rawget(_bba,"PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY")then
if caba then
_bba.PARRY_COOLDOWN_IN_SECONDS=0;_bba.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY=0 else
_bba.PARRY_COOLDOWN_IN_SECONDS=3;_bba.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY=0.33 end end end end})local cbaa=cd_a:CreateTab("Main Combat",7485051733)
local dbaa=cbaa:CreateToggle({Name="[ Kill Aura ]",CurrentValue=false,Flag="KillAura",Callback=function(caba)
aa_a=caba end})
local _caa=cbaa:CreateToggle({Name="[ Stomp Aura ]",CurrentValue=false,Flag="Stomp",Callback=function(caba)c__a=caba end})local acaa=cd_a:CreateTab("Aim-X",11348590105)
local bcaa=acaa:CreateSection("Bow | Aimbot")
local ccaa=acaa:CreateToggle({Name="[ Aimbot ]",CurrentValue=false,Flag="Aimbot",Callback=function(caba)ca_a=caba end})
local dcaa=acaa:CreateToggle({Name="[ Silent Aim ]",CurrentValue=false,Flag="SilentAim",Callback=function(caba)da_a=caba end})
local _daa=acaa:CreateSlider({Name="Silent Aim | Chance",Range={0,100},Increment=1,Suffix="Silent-Aim",CurrentValue=10,Flag="aimchance",Callback=function(caba)db_a=caba end})local adaa=acaa:CreateSection("Toggles")
local bdaa=acaa:CreateToggle({Name="[Bow | Wallbang ]",CurrentValue=false,Flag="Wallbang",Callback=function(caba)
if
caba then
game.CollectionService:AddTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')else
game.CollectionService:RemoveTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')end end})
local cdaa=acaa:CreateToggle({Name="[ Bow | Anti-Spread ]",CurrentValue=false,Flag="Spread",Callback=function(caba)ab_a=caba end})
local ddaa=acaa:CreateToggle({Name="[ Anti-Recoil ]",CurrentValue=false,Flag="Recoil",Callback=function(caba)
for daba,_bba in pairs(getgc(true))do
if typeof(_bba)=="table"and
rawget(_bba,"recoilAmount")then
if caba then _bba.recoilAmount=0;_bba.recoilXMin=0
_bba.recoilXMax=0;_bba.recoilYMin=0;_bba.recoilYMax=0;_bba.recoilZMin=0;_bba.recoilZMax=0 else
_bba.recoilAmount=35;_bba.recoilXMin=1.25;_bba.recoilXMax=1.75;_bba.recoilYMin=-1.5
_bba.recoilYMax=1.5;_bba.recoilZMin=-1.5;_bba.recoilZMax=1.5 end end end end})
local __ba=acaa:CreateToggle({Name="[ Bow | Anti-Gravity ]",CurrentValue=false,Flag="Gravity",Callback=function(caba)
for daba,_bba in pairs(getgc(true))do if
typeof(_bba)=="table"and rawget(_bba,"recoilAmount")then
if caba then
_bba.gravity=Vector3.new(0,0,0)else _bba.gravity=Vector3.new(0,-10,0)end end end end})
local a_ba=acaa:CreateToggle({Name="[ Heavy Bow | Instant Charge ]",CurrentValue=false,Flag="HeavyBow",Callback=function(caba)_c_a=caba end})local b_ba=cd_a:CreateTab("Visuals",6523858422)
local c_ba=b_ba:CreateToggle({Name="[ Tracers ]",CurrentValue=false,Flag="Tracers",Callback=function(caba)
ddd=caba end})
local d_ba=b_ba:CreateToggle({Name="[ Names/Text ]",CurrentValue=false,Flag="names",Callback=function(caba)a__a=caba end})
local _aba=b_ba:CreateToggle({Name="[ Boxes ]",CurrentValue=false,Flag="boxes",Callback=function(caba)ac_a=val end})
bcc.PlayerRemoving:Connect(function(caba)if table.find(c_d,caba.Name)then
table.remove(c_d,c_d[caba.Name])end;if d_d[caba]then
d_d[caba]:Remove()d_d[caba]=nil end end)
bcc.LocalPlayer.leaderstats.Score.Changed:Connect(function()if
_a_a then
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(cad[math.random(1,
#cad)])end end)
for caba,daba in pairs(game.Players:GetPlayers())do
if daba~=bcc.LocalPlayer then
table.insert(c_d,daba.Name)
if daba.Character then local _bba=Drawing.new("Line")
_bba.From=Vector2.new(
workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y)_bba.Color=TracerColor;_bba.Thickness=2;a_d[daba]=_bba
local abba=Drawing.new("Text")abba.Text=daba.Name;abba.Size=20;abba.Outline=true
abba.OutlineColor=Color3.new(0,0,0)abba.Center=true;b_d[daba]=abba;local bbba=Drawing.new("Square")
bbba.Thickness=1;bbba.Filled=false;bbba.Visible=false;bbba.ZIndex=50;d_d[daba]=bbba
local cbba=Drawing.new("Square")cbba.Visible=false;cbba.Thickness=2;cbba.Filled=false;cbba.ZIndex=1
_ad[daba]=cbba;local dbba=Drawing.new("Square")dbba.Visible=false
dbba.Filled=true;dbba.Thickness=2;dbba.ZIndex=1;bad[daba]=dbba
local _cba=Drawing.new("Square")_cba.Visible=false;_cba.Filled=true;_cba.ZIndex=50;aad[daba]=_cba end
daba.CharacterAdded:Connect(function()local _bba=Drawing.new("Line")
_bba.From=Vector2.new(
workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y)_bba.Color=TracerColor;_bba.Thickness=2;a_d[daba]=_bba
local abba=Drawing.new("Text")abba.Text=daba.Name;abba.Size=20;abba.Outline=true
abba.OutlineColor=Color3.new(0,0,0)abba.Center=true;b_d[daba]=abba end)
daba.CharacterRemoving:Connect(function()a_d[daba]:Remove()
a_d[daba]=nil;b_d[daba]:Remove()b_d[daba]=nil end)end end
bcc.PlayerAdded:Connect(function(caba)table.insert(c_d,caba.Name)
caba.CharacterAdded:Connect(function()
local daba=Drawing.new("Line")
daba.From=Vector2.new(workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y)daba.Color=TracerColor;daba.Thickness=2;a_d[caba]=daba
local _bba=Drawing.new("Text")_bba.Text=caba.Name;_bba.Size=20;_bba.Outline=true
_bba.OutlineColor=Color3.new(0,0,0)_bba.Center=true;b_d[caba]=_bba
if
caba~=bcc.LocalPlayer and not d_d[caba]then local abba=Drawing.new("Square")abba.Thickness=1
abba.Filled=false;abba.Visible=false;d_d[caba]=abba
local bbba=Drawing.new("Square")bbba.Visible=false;bbba.Thickness=2;bbba.Filled=false;bbba.ZIndex=1
_ad[caba]=bbba;local cbba=Drawing.new("Square")cbba.Visible=false
cbba.Filled=true;cbba.Thickness=2;cbba.ZIndex=1;bad[caba]=cbba
local dbba=Drawing.new("Square")dbba.Visible=false;dbba.Filled=true;dbba.ZIndex=50;aad[caba]=dbba end end)
caba.CharacterRemoving:Connect(function()a_d[caba]:Remove()
a_d[caba]=nil;b_d[caba]:Remove()b_d[caba]=nil end)end)
_dc.KeyDown:Connect(function(caba)if add and caba==" "then
bcc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState(3)end end)
dcc.InputBegan:Connect(function(caba)if
caba.UserInputType==Enum.UserInputType.MouseButton2 then dbd=true;acd=_d_a()end end)
dcc.InputEnded:Connect(function(caba)
if
caba.UserInputType==Enum.UserInputType.MouseButton2 then dbd=false;_cd=false;dcc.MouseBehavior=Enum.MouseBehavior.Default end end)local aaba
aaba=workspace.EffectsJunk.ChildAdded:Connect(function(caba)
if
bcc.LocalPlayer.Character:FindFirstChildOfClass("Tool")==nil then bcd=false;return end
local daba=bcc.LocalPlayer.Character:FindFirstChildOfClass("Tool")
if daba:FindFirstChild("ClientAmmo")==nil then bcd=false;return end
if bcd and caba:IsA("MeshPart")then _bd=caba
Instance.new("SelectionBox",caba).Adornee=caba;bcd=false;print("arrow var set to arrow part")end end)
for caba,daba in pairs(getgc(true))do
if
typeof(daba)=="table"and rawget(daba,"shoot")then local _bba=daba.shoot
daba.shoot=function(abba)bcd=true;dcd=abba.shotIdx;bbd=_d_a()
return _bba(abba)end end
if
typeof(daba)=="table"and rawget(daba,"calculateFireDirection")then old=daba.calculateFireDirection
daba.calculateFireDirection=function(_bba,abba,bbba,cbba)
local dbba=bcc.LocalPlayer.Character:FindFirstChildOfClass("Tool")if dbba:FindFirstChild("ClientAmmo")==nil then return
old(_bba,abba,bbba,cbba)end
if ab_a then abba=0;bbba=0 end
if da_a and bcd then local _cba=_d_a()
local acba=_cba.Character.Head.CFrame+ (
_cba.Character.Head.Velocity*0.19 +Vector3.new(0,.1,0))
return
(CFrame.lookAt(dbba.Contents.Handle.FirePoint.WorldCFrame.Position,acba.Position)).LookVector*30 end;return old(_bba,abba,bbba,cbba)end end end
task.spawn(function()
while task.wait(KillAuraHitCooldown)do
if aa_a then
pcall(function()
table.foreach(bcc.LocalPlayer.Backpack:GetChildren(),function(daba,_bba)
if
_bba:IsA("Tool")and _bba:FindFirstChild("Hitboxes")then ccd=_bba end end)local caba=dc_a()
if
caba.Character:FindFirstChild("SemiTransparentShield").Transparency==1 then
swingremote:FireServer(ccd,1)
hitremote:FireServer(ccd,caba.Character:FindFirstChild("HumanoidRootPart"),ccd.Hitboxes.Hitbox,caba.Character:FindFirstChild("HumanoidRootPart").Position)
hitremote:FireServer(ccd,caba.Character:FindFirstChild("HumanoidRootPart"),ccd.Hitboxes.Hitbox,caba.Character:FindFirstChild("HumanoidRootPart").Position)end end)end
if da_a then
pcall(function()
local caba=bcc.LocalPlayer.Character:FindFirstChildOfClass("Tool")if bbd then abd.Adornee=_d_a().Character end
if _bd then
if bbd then
if
(_bd.Position-
bbd.Character.HumanoidRootPart.Position).Magnitude<=15 then
if db_a==100 then firehit(bbd.Character,_bd)_bd=nil;bcd=false
print("hit them (i think)")else local daba=ad_a(db_a)
if daba then firehit(bbd.Character,_bd)_bd=nil
bcd=false;print("hit them (i think)")end end end end end end)end end end)
task.spawn(function()
ccc.Stepped:Connect(function()
if cb_a then
if
not dcc:IsKeyDown(Enum.KeyCode.LeftShift)then
bcc.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed=_dd else bcc.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed=
_dd+10.56 end end;if bb_a then
bcc.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower=d__a end;if cdd and
bcc.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")then keypress(0x20)
keyrelease(0x20)end
if c__a then
for daba,_bba in
pairs(bcc:GetPlayers())do
if
_bba~=bcc.LocalPlayer and _bba.Character:FindFirstChild("Humanoid")and
_bba.Character:FindFirstChild("Humanoid").Health<=15 then
if
(
_bba.Character.HumanoidRootPart.Position-bcc.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<=4 then keypress(0x51)
keyrelease(0x51)end end end end
pcall(function()
if ca_a and dbd then _cd=true
if _cd and acd~=nil then
local daba=
acd.Character.HumanoidRootPart.CFrame+ (acd.Character.HumanoidRootPart.Velocity*0.19 +
Vector3.new(0,.1,0))
workspace.CurrentCamera.CFrame=CFrame.lookAt(workspace.CurrentCamera.CFrame.Position,daba.Position)dcc.MouseBehavior=Enum.MouseBehavior.LockCenter end end end)if ba_a then
cc_a("UpdateIsCrouching"):FireServer(true)else
cc_a("UpdateIsCrouching"):FireServer(false)end
pcall(function()
for daba,_bba in
pairs(bcc.LocalPlayer.Backpack:GetChildren())do
if _bba:IsA("Tool")then
if _bba:FindFirstChild("Hitboxes")~=nil then if _b_a and not
bcc.LocalPlayer.Character:FindFirstChildOfClass("Tool")then
_bba.Parent=bcc.LocalPlayer.Character end end end end end)if b__a then
for daba,_bba in
pairs(bcc.LocalPlayer.Character:GetDescendants())do if _bba:IsA("BasePart")then _bba.CanCollide=false end end end
if ddd then
for daba,_bba in
pairs(a_d)do
if
daba.Character and daba.Character:FindFirstChild("HumanoidRootPart")then
local abba,bbba=workspace.CurrentCamera:WorldToViewportPoint(daba.Character.HumanoidRootPart.Position)_bba.Color=TracerColor
_bba.To=Vector2.new(abba.X,abba.Y)_bba.Visible=bbba else _bba.Visible=false end end else for daba,_bba in pairs(a_d)do _bba.Visible=false end end
if a__a then
for daba,_bba in pairs(b_d)do
if
daba.Character and daba.Character:FindFirstChild("Head")then
local abba,bbba=workspace.CurrentCamera:WorldToViewportPoint(daba.Character.Head.Position)_bba.Position=Vector2.new(abba.X,abba.Y-28)
_bba.Color=TracerColor;_bba.Visible=bbba else _bba.Visible=false end end else for daba,_bba in pairs(b_d)do _bba.Visible=false end end
if ac_a then
for daba,_bba in pairs(bcc:GetPlayers())do
if
_bba~=bcc.LocalPlayer and
_bba.Character:FindFirstChild("HumanoidRootPart")and
_bba.Character:FindFirstChild("Humanoid")and
_bba.Character.Humanoid.Health>0 then
local abba,bbba=workspace.CurrentCamera:WorldToViewportPoint(_bba.Character.HumanoidRootPart.Position)
local cbba,dbba=workspace.CurrentCamera:WorldToViewportPoint(_bba.Character.Head.Position+
Vector3.new(0,1,0))
local _cba,acba=workspace.CurrentCamera:WorldToViewportPoint(
_bba.Character.HumanoidRootPart.Position-Vector3.new(0,3,0))local bcba=2000 /abba.Z;local ccba=cbba.Y-_cba.Y
d_d[_bba].Visible=bbba;_ad[_bba].Visible=bbba;aad[_bba].Visible=bbba
bad[_bba].Visible=bbba
if bbba then
d_d[_bba].Position=Vector2.new(abba.X-d_d[_bba].Size.X/2,
abba.Y-d_d[_bba].Size.Y/2)d_d[_bba].Size=Vector2.new(bcba,ccba)
d_d[_bba].Color=TracerColor
_ad[_bba].Position=Vector2.new(abba.X-d_d[_bba].Size.X/2,
abba.Y-d_d[_bba].Size.Y/2)_ad[_bba].Size=Vector2.new(bcba,ccba)
bad[_bba].Size=Vector2.new(3,ccba)
bad[_bba].Position=
Vector2.new(abba.X-d_d[_bba].Size.X/2,
abba.Y-d_d[_bba].Size.Y/2)-Vector2.new(6,0)
aad[_bba].Color=Color3.fromRGB(173,0,0):Lerp(Color3.fromRGB(0,160,0),
_bba.Character:FindFirstChild("Humanoid").Health/_bba.Character:FindFirstChild("Humanoid").MaxHealth)
aad[_bba].Size=Vector2.new(2,(-bad[_bba].Size.Y-2)*
(
_bba.Character:FindFirstChild("Humanoid").Health/_bba.Character:FindFirstChild("Humanoid").MaxHealth))aad[_bba].Position=bad[_bba].Position+
Vector2.new(1,-1 +bad[_bba].Size.Y)end else
if _bba~=bcc.LocalPlayer then d_d[_bba].Visible=false
_ad[_bba].Visible=false;aad[_bba].Visible=false;bad[_bba].Visible=false end end end else for daba,_bba in pairs(d_d)do _bba.Visible=false end;for daba,_bba in pairs(_ad)do
_bba.Visible=false end
for daba,_bba in pairs(aad)do _bba.Visible=false end;for daba,_bba in pairs(bad)do _bba.Visible=false end end
local caba=bcc.LocalPlayer.Character:FindFirstChildOfClass("Tool")if
caba~=nil and caba:FindFirstChild("ClientAmmo")==nil then return end
if bcc.LocalPlayer.Character then
if
bcc.LocalPlayer.Character:FindFirstChild('Longbow')and _c_a then
for daba,_bba in
pairs(getconnections(caba.ChargeProgressClient:GetPropertyChangedSignal("Value")))do _bba:Disable()end;caba.ChargeProgressClient.Value=1 end end end)end)local baba
baba=hookmetamethod(game,"__namecall",function(caba,...)
if not checkcaller()and
getnamecallmethod()=="FireServer"and bdd and tostring(caba)==
"GotHitRE"then return elseif


not checkcaller()and getnamecallmethod()=="FireServer"and ___a and caba.Name==fallremote.Name then return elseif

(getnamecallmethod()=="Kick"or getnamecallmethod()=="kick")and caba==game.Players.LocalPlayer then return end;return baba(caba,...)end)bd_a:LoadConfiguration()
