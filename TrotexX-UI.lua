
if KillAuraHitCooldown==nil then getgenv().KillAuraHitCooldown=0.2 end
if SilentAimHitPart==nil then getgenv().SilentAimHitPart="Head"end;if is_sirhurt_closure then
Players.LocalPlayer:Kick("Get KRNL or OxygenU Sirhurt User! L Bozo")end
local _dc=game:GetService("Players")local adc=game:GetService("RunService")
local bdc=game:GetService("UserInputService")local cdc=_dc.LocalPlayer:GetMouse()
local ddc=rawget(require(game.ReplicatedStorage.Framework.Nevermore),"_lookupTable")local __d=rawget(ddc,"Network")
local a_d=getupvalue(getsenv(__d).GetEventHandler,1)
local b_d=getupvalue(getsenv(__d).GetFunctionHandler,1)local c_d={}local d_d={}local _ad={}local aad={}local bad={}local cad={}local dad={}local _bd={}
local abd={"ez","get good: get .gg/EzDK4AD5Yj","trash","touch grass","retard","i love among us","the impostor?!?!?!","grass? whats that","having issues playing the game? get .gg/EzDK4AD5Yj","is your dad spiderman? because he far from home","do you ever have problems with light users parrying your ds???","how are you that bad??🤣🤣😂🤣🤣","EZ EZ EZ EZ EZ","dont even bother insulting me 🤣🤣😂","this script was brought to you by raid shadow legends!!","do you like cheese?","are you even trying to kill me???","get rekt noobie","go get .gg/EzDK4AD5Yj now","imagine dying",".gg/EzDK4AD5Yj on top (not really)","L Bozo","clapped","nothing personel kid","damn bro you got the whole squad laughing 😂😂🤣","imagine targetting someone. but get clapped afterwards","according to the rules. You should not be hacking because it can get you banned 🤓🤓🤓","nerds be like: OMG LOOK AT THAT HACKER!!! LET'S GET HIM!!!🤓🤓🤓","why am i still writing this? -Probably ZaneIs","haha got you!!!","how are you that bad??🤣😂","нуб бозо","my reaction to that information 😐","OmG nO wAY a hACker!!!","Super Idol的笑容","goddamn i'm still writing -Probably ZaneIs","have you ever heard the hitgame AmongUs???","fr?",'skill issue',"touch grass losers","this move is called 'Devious Lick'","*Gorilla Sounds*","What's up guys it's quandale dingle here.","Bro got fake Jordans 💀","Caught in 4K","Turi ip ip","Say goodbye to your Kneecaps"}getgenv().hitremote=nil;getgenv().swingremote=nil;getgenv().fallremote=
nil;getgenv().ragdollremote=nil;local bbd=SilentAimHitPart;local cbd
local dbd=Instance.new("Highlight",game.CoreGui)local _cd;local acd;local bcd=false;local ccd;local dcd;local _dd=false;local add;local bdd=1;local cdd=15;local ddd=16;local ___a;local a__a
local b__a;local c__a;local d__a;local _a_a;local aa_a;local ba_a;local ca_a=50;local da_a=false;local _b_a=false;local ab_a=false;local bb_a;local cb_a
local db_a;local _c_a=false;local ac_a;local bc_a=false;local cc_a=false;local dc_a=100;local _d_a=false;local ad_a=false
getgenv().TracerColor=Color3.fromRGB(99,13,197)
for dbba,_cba in pairs(getgc(true))do
if
typeof(_cba)=="table"and rawget(_cba,"kick")then _cba.kick=function()return end end
if
typeof(_cba)=='table'and rawget(_cba,'getIsBodyMoverCreatedByGame')then _cba.getIsBodyMoverCreatedByGame=function(acba)return true end end
if
typeof(_cba)=="table"and rawget(_cba,"randomDelayKick")then _cba.randomDelayKick=function()return wait(9e9)end end end
table.foreach(a_d,function(dbba,_cba)if rawget(_cba,"Remote")then
c_d[rawget(_cba,"Remote")]=dbba end end)
table.foreach(b_d,function(dbba,_cba)if rawget(_cba,"Remote")then
c_d[rawget(_cba,"Remote")]=dbba end end)local bd_a
bd_a=hookmetamethod(game,"__index",function(dbba,_cba)if
(_cba=="Name"or _cba=="name")and c_d[dbba]then return c_d[dbba]end;return bd_a(dbba,_cba)end)local function cd_a(dbba)
for _cba,acba in pairs(c_d)do if _cba.Name==dbba then return _cba end end end
local function dd_a()
local dbba=_dc.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position;local _cba=math.huge;local acba
for bcba,ccba in pairs(game.Players:GetPlayers())do
if


ccba.Character~=nil and ccba~=_dc.LocalPlayer and
ccba.Character:FindFirstChild("HumanoidRootPart")~=nil and
ccba.Character:FindFirstChild("Humanoid").Health>0 then local dcba=ccba.Character.HumanoidRootPart.Position
local _dba=(dbba-dcba).Magnitude;if _dba<_cba then _cba=_dba;acba=ccba end end end;return acba end
local function __aa()local dbba,_cba=nil,math.huge
for acba,bcba in pairs(_dc:GetPlayers())do
if
bcba~=_dc.LocalPlayer and
bcba.Character:FindFirstChild("Humanoid")and
bcba.Character.Humanoid.Health>0 and
bcba.Character:FindFirstChild("HumanoidRootPart")then
local ccba,dcba=workspace.CurrentCamera:WorldToViewportPoint(bcba.Character.HumanoidRootPart.Position)
if dcba then
local _dba=(Vector2.new(cdc.X,cdc.Y)-Vector2.new(ccba.X,ccba.Y)).Magnitude;if _dba<_cba then _cba=_dba;dbba=bcba end end end end;return dbba end
local function a_aa(dbba)local _cba=
math.floor(Random.new().NextNumber(Random.new(),0,1)*100)/100;return _cba<=
math.floor(dbba)/100 end;FLYING=false;iyflyspeed=1;vehicleflyspeed=1
function sFLY(dbba)
repeat wait()until

_dc.LocalPlayer and
_dc.LocalPlayer.Character and _dc.LocalPlayer.Character.HumanoidRootPart and
_dc.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")repeat wait()until cdc;if flyKeyDown or flyKeyUp then
flyKeyDown:Disconnect()flyKeyUp:Disconnect()end
local _cba=_dc.LocalPlayer.Character.HumanoidRootPart;local acba={F=0,B=0,L=0,R=0,Q=0,E=0}local bcba={F=0,B=0,L=0,R=0,Q=0,E=0}local ccba=0
local function dcba()
FLYING=true;local _dba=Instance.new('BodyGyro')
local adba=Instance.new('BodyVelocity')_dba.P=9e4;_dba.Parent=_cba;adba.Parent=_cba
_dba.maxTorque=Vector3.new(9e9,9e9,9e9)_dba.cframe=_cba.CFrame;adba.velocity=Vector3.new(0,0,0)
adba.maxForce=Vector3.new(9e9,9e9,9e9)
task.spawn(function()
repeat wait()
if not dbba and
_dc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')then
_dc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand=true end
if acba.L+acba.R~=0 or acba.F+acba.B~=0 or acba.Q+
acba.E~=0 then ccba=50 elseif not
(
acba.L+acba.R~=0 or acba.F+acba.B~=0 or acba.Q+acba.E~=0)and ccba~=0 then
ccba=0 end
if(acba.L+acba.R)~=0 or(acba.F+acba.B)~=0 or(
acba.Q+acba.E)~=0 then
adba.velocity=
( (
workspace.CurrentCamera.CoordinateFrame.lookVector* (acba.F+acba.B))+
( (
workspace.CurrentCamera.CoordinateFrame*
CFrame.new(acba.L+acba.R,
(acba.F+acba.B+acba.Q+acba.E)*0.2,0).p)-
workspace.CurrentCamera.CoordinateFrame.p))*ccba;bcba={F=acba.F,B=acba.B,L=acba.L,R=acba.R}elseif

(acba.L+acba.R)==0 and(acba.F+acba.B)==0 and(acba.Q+acba.E)==
0 and ccba~=0 then
adba.velocity=
( (workspace.CurrentCamera.CoordinateFrame.lookVector* (bcba.F+
bcba.B))+
( (
workspace.CurrentCamera.CoordinateFrame*
CFrame.new(bcba.L+bcba.R,
(bcba.F+bcba.B+acba.Q+acba.E)*0.2,0).p)-
workspace.CurrentCamera.CoordinateFrame.p))*ccba else adba.velocity=Vector3.new(0,0,0)end;_dba.cframe=workspace.CurrentCamera.CoordinateFrame until
not FLYING;acba={F=0,B=0,L=0,R=0,Q=0,E=0}bcba={F=0,B=0,L=0,R=0,Q=0,E=0}ccba=0
_dba:Destroy()adba:Destroy()if
_dc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')then
_dc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand=false end end)end
flyKeyDown=cdc.KeyDown:Connect(function(_dba)
if _dba:lower()=='w'then acba.F=(dbba and vehicleflyspeed or
iyflyspeed)elseif _dba:lower()=='s'then
acba.B=- (dbba and
vehicleflyspeed or iyflyspeed)elseif _dba:lower()=='a'then
acba.L=- (dbba and vehicleflyspeed or iyflyspeed)elseif _dba:lower()=='d'then
acba.R=(dbba and vehicleflyspeed or iyflyspeed)elseif QEfly and _dba:lower()=='e'then acba.Q=
(dbba and vehicleflyspeed or iyflyspeed)*2 elseif
QEfly and _dba:lower()=='q'then
acba.E=- (dbba and vehicleflyspeed or iyflyspeed)*2 end
pcall(function()
workspace.CurrentCamera.CameraType=Enum.CameraType.Track end)end)
flyKeyUp=cdc.KeyUp:Connect(function(_dba)
if _dba:lower()=='w'then acba.F=0 elseif _dba:lower()=='s'then
acba.B=0 elseif _dba:lower()=='a'then acba.L=0 elseif _dba:lower()=='d'then acba.R=0 elseif
_dba:lower()=='e'then acba.Q=0 elseif _dba:lower()=='q'then acba.E=0 end end)dcba()end
function NOFLY()FLYING=false;if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect()
flyKeyUp:Disconnect()end;if
_dc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')then
_dc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand=false end
pcall(function()
workspace.CurrentCamera.CameraType=Enum.CameraType.Custom end)end
firehit=function(dbba,_cba)
local acba=dbba[bbd].Position+
Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5))
local bcba={[1]=_dc.LocalPlayer.Character:FindFirstChildOfClass("Tool"),[2]=dbba.Head,[3]=acba,[4]=dbba.Head.CFrame:ToObjectSpace(CFrame.new(acba)),[5]=
acba*
Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5)),[6]=tostring(bdd)}
cd_a("RangedHit"):FireServer(unpack(bcba))end;getgenv().hitremote=cd_a("MeleeDamage")
getgenv().swingremote=cd_a("MeleeSwing")getgenv().fallremote=cd_a("TakeFallDamage")
for dbba,_cba in
pairs(getgc(true))do
if
typeof(_cba)=="table"and rawget(_cba,"connectCharacter")then _cba.connectCharacter=function(acba)return end end end;task.wait(0.5)
pcall(function()for i=1,25 do
cd_a("StartFastRespawn"):FireServer()
cd_a("CompleteFastRespawn"):FireServer()wait()end end)
local b_aa=loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local c_aa=b_aa:CreateWindow({Name="Trotex X - BETA",LoadingTitle="Trotex Beta Version 1.2.4",LoadingSubtitle="Thanks for choosing Trotex!",ConfigurationSaving={Enabled=true,FolderName=true,FileName="TrotexX"},Discord={Enabled=false,Invite="sirius",RememberJoins=true},KeySystem=true,KeySettings={Title="Trotex X",Subtitle="Note: Key changes every 24 hours!",Note="Join the discord (discord.gg/sirius)",FileName="TrotexKey",SaveKey=true,GrabKeyFromSite=false,Key="{TROTEX-6594040e5c014947b1e165d1653df295}"}})
b_aa:Notify({Title="Welcome to Trotex X",Content="Please note that this script is in beta and only works in COMBAT WARRIORS",Duration=10,Image=11401835408,Actions={Ignore={Name="Okay!",Callback=function(dbba)
print(combatwarriors)end}}})local d_aa=c_aa:CreateTab("Information",4483362458)
local _aaa=d_aa:CreateParagraph({Title="Trotex Information",Content="Welcome to Trotex X, If you are reading this that means you are in the right direction for one of thje leading scripts. Everything in here is still in beta but works well, We hope to see you use this script more and share it upon others! Please note that this is unfinished and is still in beta with new features on the way every week!"})
local aaaa=d_aa:CreateLabel("!!!PLEASE NOTE ANTI PARRY AND AUTO PARRY ARE ENABLED UPON EXECUTING THIS SCRIPT!!!")local baaa=c_aa:CreateTab("Main",7059346386)
local caaa=baaa:CreateButton({Name="[ All Emotes ]",Callback=function(dbba)
for _cba,acba in
pairs(getgc(true))do
if
typeof(acba)=="table"and rawget(acba,"gamepassIdRequired")then
if acba.gamepassIdRequired=="danceEmotes"then acba.gamepassIdRequired=nil elseif
acba.gamepassIdRequired=="toxicEmotes"then acba.gamepassIdRequired=nil elseif acba.gamepassIdRequired==
"respectEmotes"then acba.gamepassIdRequired=nil end end end end})local daaa=c_aa:CreateTab("Toggles",4483362458)
local _baa=daaa:CreateToggle({Name="[ Infinite Stanima ]",CurrentValue=false,Flag="stanima",Callback=function(dbba)
for _cba,acba in
pairs(getgc(true))do
if typeof(acba)=="table"and rawget(acba,"_setStamina")then
local bcba=acba._setStamina
acba._setStamina=function(ccba,dcba)
if dbba then ccba._stamina=math.huge
ccba._staminaChangedSignal:Fire(150)else return bcba(ccba,dcba)end end end end end})local abaa=daaa:CreateSection("Disable | Actions")
local bbaa=daaa:CreateToggle({Name="[ Disable | Jump Cooldown ]",CurrentValue=false,Flag="Jump",Callback=function(dbba)
for _cba,acba in
pairs(getgc(true))do
if typeof(acba)=="table"and rawget(acba,"getCanJump")then
local bcba=acba.getCanJump
if dbba then acba.getCanJump=function()return true end else return bcba()end end end end})
local cbaa=daaa:CreateToggle({Name="[Anti | Fire, Bear Trap]",CurrentValue=false,Flag="AntiFire",Callback=function(dbba)a__a=dbba end})
local dbaa=daaa:CreateToggle({Name="[ Disable | Fall Damage]",CurrentValue=false,Flag="falldamage",Callback=function(dbba)d__a=dbba end})
local _caa=daaa:CreateToggle({Name="[ Disable | Dash Cooldown ]",CurrentValue=false,Flag="DashCooldown",Callback=function(dbba)
for _cba,acba in pairs(getgc(true))do
if
typeof(acba)=="table"and rawget(acba,"DASH_COOLDOWN")then if dbba then
acba.DASH_COOLDOWN=0 else acba.DASH_COOLDOWN=3 end end end end})
local acaa=daaa:CreateToggle({Name="[ Disable | Ragdoll ]",CurrentValue=false,Flag="Ragdoll",Callback=function(dbba)
for _cba,acba in pairs(getgc(true))do
if
typeof(acba)=="table"and rawget(acba,"toggleRagdoll")then
local bcba=acba.toggleRagdoll
acba.toggleRagdoll=function(ccba,dcba,_dba)if dbba then return else return bcba(ccba,dcba,_dba)end end end end end})
local bcaa=daaa:CreateToggle({Name="[ Hide Name ]",CurrentValue=false,Flag="hidename",Callback=function(dbba)ab_a=dbba end})
local ccaa=daaa:CreateToggle({Name="[ Disable | Perry Cooldown ]",CurrentValue=false,Flag="PerryDisable",Callback=function(dbba)
for _cba,acba in pairs(getgc(true))do
if
type(acba)=="table"and rawget(acba,"PARRY_COOLDOWN_IN_SECONDS")and
rawget(acba,"PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY")then
if dbba then
acba.PARRY_COOLDOWN_IN_SECONDS=0;acba.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY=0 else
acba.PARRY_COOLDOWN_IN_SECONDS=3;acba.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY=0.33 end end end end})local dcaa=c_aa:CreateTab("Main Combat",7485051733)
local _daa=dcaa:CreateToggle({Name="[ Kill Aura ]",CurrentValue=false,Flag="KillAura",Callback=function(dbba)
_b_a=dbba end})
local adaa=dcaa:CreateToggle({Name="[ Stomp Aura ]",CurrentValue=false,Flag="Stomp",Callback=function(dbba)ba_a=dbba end})local bdaa=c_aa:CreateTab("Aim-X",11348590105)
local cdaa=bdaa:CreateSection("Bow | Aimbot")
local ddaa=bdaa:CreateToggle({Name="[ Aimbot ]",CurrentValue=false,Flag="Aimbot",Callback=function(dbba)bb_a=dbba end})
local __ba=bdaa:CreateToggle({Name="[ Silent Aim ]",CurrentValue=false,Flag="SilentAim",Callback=function(dbba)cb_a=dbba end})
local a_ba=bdaa:CreateSlider({Name="Silent Aim | Chance",Range={0,100},Increment=1,Suffix="Silent-Aim",CurrentValue=10,Flag="aimchance",Callback=function(dbba)dc_a=dbba end})local b_ba=bdaa:CreateSection("Toggles")
local c_ba=bdaa:CreateToggle({Name="[Bow | Wallbang ]",CurrentValue=false,Flag="Wallbang",Callback=function(dbba)
if
dbba then
game.CollectionService:AddTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')else
game.CollectionService:RemoveTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')end end})
local d_ba=bdaa:CreateToggle({Name="[ Bow | Anti-Spread ]",CurrentValue=false,Flag="Spread",Callback=function(dbba)ac_a=dbba end})
local _aba=bdaa:CreateToggle({Name="[ Anti-Recoil ]",CurrentValue=false,Flag="Recoil",Callback=function(dbba)
for _cba,acba in pairs(getgc(true))do
if typeof(acba)=="table"and
rawget(acba,"recoilAmount")then
if dbba then acba.recoilAmount=0;acba.recoilXMin=0
acba.recoilXMax=0;acba.recoilYMin=0;acba.recoilYMax=0;acba.recoilZMin=0;acba.recoilZMax=0 else
acba.recoilAmount=35;acba.recoilXMin=1.25;acba.recoilXMax=1.75;acba.recoilYMin=-1.5
acba.recoilYMax=1.5;acba.recoilZMin=-1.5;acba.recoilZMax=1.5 end end end end})
local aaba=bdaa:CreateToggle({Name="[ Bow | Anti-Gravity ]",CurrentValue=false,Flag="Gravity",Callback=function(dbba)
for _cba,acba in pairs(getgc(true))do if
typeof(acba)=="table"and rawget(acba,"recoilAmount")then
if dbba then
acba.gravity=Vector3.new(0,0,0)else acba.gravity=Vector3.new(0,-10,0)end end end end})
local baba=bdaa:CreateToggle({Name="[ Heavy Bow | Instant Charge ]",CurrentValue=false,Flag="HeavyBow",Callback=function(dbba)_d_a=dbba end})local caba=c_aa:CreateTab("Visuals",6523858422)
local daba=caba:CreateToggle({Name="[ Tracers ]",CurrentValue=false,Flag="Tracers",Callback=function(dbba)
c__a=dbba end})
local _bba=caba:CreateToggle({Name="[ Names/Text ]",CurrentValue=false,Flag="names",Callback=function(dbba)_a_a=dbba end})
local abba=caba:CreateToggle({Name="[ Boxes ]",CurrentValue=false,Flag="boxes",Callback=function(dbba)ad_a=val end})
_dc.PlayerRemoving:Connect(function(dbba)if table.find(aad,dbba.Name)then
table.remove(aad,aad[dbba.Name])end;if bad[dbba]then
bad[dbba]:Remove()bad[dbba]=nil end end)
_dc.LocalPlayer.leaderstats.Score.Changed:Connect(function()if
da_a then
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(abd[math.random(1,
#abd)])end end)
for dbba,_cba in pairs(game.Players:GetPlayers())do
if _cba~=_dc.LocalPlayer then
table.insert(aad,_cba.Name)
if _cba.Character then local acba=Drawing.new("Line")
acba.From=Vector2.new(
workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y)acba.Color=TracerColor;acba.Thickness=2;d_d[_cba]=acba
local bcba=Drawing.new("Text")bcba.Text=_cba.Name;bcba.Size=20;bcba.Outline=true
bcba.OutlineColor=Color3.new(0,0,0)bcba.Center=true;_ad[_cba]=bcba;local ccba=Drawing.new("Square")
ccba.Thickness=1;ccba.Filled=false;ccba.Visible=false;ccba.ZIndex=50;bad[_cba]=ccba
local dcba=Drawing.new("Square")dcba.Visible=false;dcba.Thickness=2;dcba.Filled=false;dcba.ZIndex=1
cad[_cba]=dcba;local _dba=Drawing.new("Square")_dba.Visible=false
_dba.Filled=true;_dba.Thickness=2;_dba.ZIndex=1;_bd[_cba]=_dba
local adba=Drawing.new("Square")adba.Visible=false;adba.Filled=true;adba.ZIndex=50;dad[_cba]=adba end
_cba.CharacterAdded:Connect(function()local acba=Drawing.new("Line")
acba.From=Vector2.new(
workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y)acba.Color=TracerColor;acba.Thickness=2;d_d[_cba]=acba
local bcba=Drawing.new("Text")bcba.Text=_cba.Name;bcba.Size=20;bcba.Outline=true
bcba.OutlineColor=Color3.new(0,0,0)bcba.Center=true;_ad[_cba]=bcba end)
_cba.CharacterRemoving:Connect(function()d_d[_cba]:Remove()
d_d[_cba]=nil;_ad[_cba]:Remove()_ad[_cba]=nil end)end end
_dc.PlayerAdded:Connect(function(dbba)table.insert(aad,dbba.Name)
dbba.CharacterAdded:Connect(function()
local _cba=Drawing.new("Line")
_cba.From=Vector2.new(workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y)_cba.Color=TracerColor;_cba.Thickness=2;d_d[dbba]=_cba
local acba=Drawing.new("Text")acba.Text=dbba.Name;acba.Size=20;acba.Outline=true
acba.OutlineColor=Color3.new(0,0,0)acba.Center=true;_ad[dbba]=acba
if
dbba~=_dc.LocalPlayer and not bad[dbba]then local bcba=Drawing.new("Square")bcba.Thickness=1
bcba.Filled=false;bcba.Visible=false;bad[dbba]=bcba
local ccba=Drawing.new("Square")ccba.Visible=false;ccba.Thickness=2;ccba.Filled=false;ccba.ZIndex=1
cad[dbba]=ccba;local dcba=Drawing.new("Square")dcba.Visible=false
dcba.Filled=true;dcba.Thickness=2;dcba.ZIndex=1;_bd[dbba]=dcba
local _dba=Drawing.new("Square")_dba.Visible=false;_dba.Filled=true;_dba.ZIndex=50;dad[dbba]=_dba end end)
dbba.CharacterRemoving:Connect(function()d_d[dbba]:Remove()
d_d[dbba]=nil;_ad[dbba]:Remove()_ad[dbba]=nil end)end)
cdc.KeyDown:Connect(function(dbba)if ___a and dbba==" "then
_dc.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState(3)end end)
bdc.InputBegan:Connect(function(dbba)if
dbba.UserInputType==Enum.UserInputType.MouseButton2 then bcd=true;dcd=__aa()end end)
bdc.InputEnded:Connect(function(dbba)
if
dbba.UserInputType==Enum.UserInputType.MouseButton2 then bcd=false;ccd=false;bdc.MouseBehavior=Enum.MouseBehavior.Default end end)local bbba
bbba=workspace.EffectsJunk.ChildAdded:Connect(function(dbba)
if
_dc.LocalPlayer.Character:FindFirstChildOfClass("Tool")==nil then _dd=false;return end
local _cba=_dc.LocalPlayer.Character:FindFirstChildOfClass("Tool")
if _cba:FindFirstChild("ClientAmmo")==nil then _dd=false;return end
if _dd and dbba:IsA("MeshPart")then cbd=dbba
Instance.new("SelectionBox",dbba).Adornee=dbba;_dd=false;print("arrow var set to arrow part")end end)
for dbba,_cba in pairs(getgc(true))do
if
typeof(_cba)=="table"and rawget(_cba,"shoot")then local acba=_cba.shoot
_cba.shoot=function(bcba)_dd=true;bdd=bcba.shotIdx;_cd=__aa()
return acba(bcba)end end
if
typeof(_cba)=="table"and rawget(_cba,"calculateFireDirection")then old=_cba.calculateFireDirection
_cba.calculateFireDirection=function(acba,bcba,ccba,dcba)
local _dba=_dc.LocalPlayer.Character:FindFirstChildOfClass("Tool")if _dba:FindFirstChild("ClientAmmo")==nil then return
old(acba,bcba,ccba,dcba)end
if ac_a then bcba=0;ccba=0 end
if cb_a and _dd then local adba=__aa()
local bdba=adba.Character.Head.CFrame+ (
adba.Character.Head.Velocity*0.19 +Vector3.new(0,.1,0))
return
(CFrame.lookAt(_dba.Contents.Handle.FirePoint.WorldCFrame.Position,bdba.Position)).LookVector*30 end;return old(acba,bcba,ccba,dcba)end end end
task.spawn(function()
while task.wait(KillAuraHitCooldown)do
if _b_a then
pcall(function()
table.foreach(_dc.LocalPlayer.Backpack:GetChildren(),function(_cba,acba)
if
acba:IsA("Tool")and acba:FindFirstChild("Hitboxes")then add=acba end end)local dbba=dd_a()
if
dbba.Character:FindFirstChild("SemiTransparentShield").Transparency==1 then
swingremote:FireServer(add,1)
hitremote:FireServer(add,dbba.Character:FindFirstChild("HumanoidRootPart"),add.Hitboxes.Hitbox,dbba.Character:FindFirstChild("HumanoidRootPart").Position)
hitremote:FireServer(add,dbba.Character:FindFirstChild("HumanoidRootPart"),add.Hitboxes.Hitbox,dbba.Character:FindFirstChild("HumanoidRootPart").Position)end end)end
if cb_a then
pcall(function()
local dbba=_dc.LocalPlayer.Character:FindFirstChildOfClass("Tool")if _cd then dbd.Adornee=__aa().Character end
if cbd then
if _cd then
if
(cbd.Position-
_cd.Character.HumanoidRootPart.Position).Magnitude<=15 then
if dc_a==100 then firehit(_cd.Character,cbd)cbd=nil;_dd=false
print("hit them (i think)")else local _cba=a_aa(dc_a)
if _cba then firehit(_cd.Character,cbd)cbd=nil
_dd=false;print("hit them (i think)")end end end end end end)end end end)
task.spawn(function()
adc.Stepped:Connect(function()
if cc_a then
if
not bdc:IsKeyDown(Enum.KeyCode.LeftShift)then
_dc.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed=ddd else _dc.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed=
ddd+10.56 end end;if bc_a then
_dc.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower=ca_a end;if b__a and
_dc.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")then keypress(0x20)
keyrelease(0x20)end
if ba_a then
for _cba,acba in
pairs(_dc:GetPlayers())do
if
acba~=_dc.LocalPlayer and acba.Character:FindFirstChild("Humanoid")and
acba.Character:FindFirstChild("Humanoid").Health<=15 then
if
(
acba.Character.HumanoidRootPart.Position-_dc.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<=4 then keypress(0x51)
keyrelease(0x51)end end end end
pcall(function()
if bb_a and bcd then ccd=true
if ccd and dcd~=nil then
local _cba=
dcd.Character.HumanoidRootPart.CFrame+ (dcd.Character.HumanoidRootPart.Velocity*0.19 +
Vector3.new(0,.1,0))
workspace.CurrentCamera.CFrame=CFrame.lookAt(workspace.CurrentCamera.CFrame.Position,_cba.Position)bdc.MouseBehavior=Enum.MouseBehavior.LockCenter end end end)if ab_a then
cd_a("UpdateIsCrouching"):FireServer(true)else
cd_a("UpdateIsCrouching"):FireServer(false)end
pcall(function()
for _cba,acba in
pairs(_dc.LocalPlayer.Backpack:GetChildren())do
if acba:IsA("Tool")then
if acba:FindFirstChild("Hitboxes")~=nil then if _c_a and not
_dc.LocalPlayer.Character:FindFirstChildOfClass("Tool")then
acba.Parent=_dc.LocalPlayer.Character end end end end end)if aa_a then
for _cba,acba in
pairs(_dc.LocalPlayer.Character:GetDescendants())do if acba:IsA("BasePart")then acba.CanCollide=false end end end
if c__a then
for _cba,acba in
pairs(d_d)do
if
_cba.Character and _cba.Character:FindFirstChild("HumanoidRootPart")then
local bcba,ccba=workspace.CurrentCamera:WorldToViewportPoint(_cba.Character.HumanoidRootPart.Position)acba.Color=TracerColor
acba.To=Vector2.new(bcba.X,bcba.Y)acba.Visible=ccba else acba.Visible=false end end else for _cba,acba in pairs(d_d)do acba.Visible=false end end
if _a_a then
for _cba,acba in pairs(_ad)do
if
_cba.Character and _cba.Character:FindFirstChild("Head")then
local bcba,ccba=workspace.CurrentCamera:WorldToViewportPoint(_cba.Character.Head.Position)acba.Position=Vector2.new(bcba.X,bcba.Y-28)
acba.Color=TracerColor;acba.Visible=ccba else acba.Visible=false end end else for _cba,acba in pairs(_ad)do acba.Visible=false end end
if ad_a then
for _cba,acba in pairs(_dc:GetPlayers())do
if
acba~=_dc.LocalPlayer and
acba.Character:FindFirstChild("HumanoidRootPart")and
acba.Character:FindFirstChild("Humanoid")and
acba.Character.Humanoid.Health>0 then
local bcba,ccba=workspace.CurrentCamera:WorldToViewportPoint(acba.Character.HumanoidRootPart.Position)
local dcba,_dba=workspace.CurrentCamera:WorldToViewportPoint(acba.Character.Head.Position+
Vector3.new(0,1,0))
local adba,bdba=workspace.CurrentCamera:WorldToViewportPoint(
acba.Character.HumanoidRootPart.Position-Vector3.new(0,3,0))local cdba=2000 /bcba.Z;local ddba=dcba.Y-adba.Y
bad[acba].Visible=ccba;cad[acba].Visible=ccba;dad[acba].Visible=ccba
_bd[acba].Visible=ccba
if ccba then
bad[acba].Position=Vector2.new(bcba.X-bad[acba].Size.X/2,
bcba.Y-bad[acba].Size.Y/2)bad[acba].Size=Vector2.new(cdba,ddba)
bad[acba].Color=TracerColor
cad[acba].Position=Vector2.new(bcba.X-bad[acba].Size.X/2,
bcba.Y-bad[acba].Size.Y/2)cad[acba].Size=Vector2.new(cdba,ddba)
_bd[acba].Size=Vector2.new(3,ddba)
_bd[acba].Position=
Vector2.new(bcba.X-bad[acba].Size.X/2,
bcba.Y-bad[acba].Size.Y/2)-Vector2.new(6,0)
dad[acba].Color=Color3.fromRGB(173,0,0):Lerp(Color3.fromRGB(0,160,0),
acba.Character:FindFirstChild("Humanoid").Health/acba.Character:FindFirstChild("Humanoid").MaxHealth)
dad[acba].Size=Vector2.new(2,(-_bd[acba].Size.Y-2)*
(
acba.Character:FindFirstChild("Humanoid").Health/acba.Character:FindFirstChild("Humanoid").MaxHealth))dad[acba].Position=_bd[acba].Position+
Vector2.new(1,-1 +_bd[acba].Size.Y)end else
if acba~=_dc.LocalPlayer then bad[acba].Visible=false
cad[acba].Visible=false;dad[acba].Visible=false;_bd[acba].Visible=false end end end else for _cba,acba in pairs(bad)do acba.Visible=false end;for _cba,acba in pairs(cad)do
acba.Visible=false end
for _cba,acba in pairs(dad)do acba.Visible=false end;for _cba,acba in pairs(_bd)do acba.Visible=false end end
local dbba=_dc.LocalPlayer.Character:FindFirstChildOfClass("Tool")if
dbba~=nil and dbba:FindFirstChild("ClientAmmo")==nil then return end
if _dc.LocalPlayer.Character then
if
_dc.LocalPlayer.Character:FindFirstChild('Longbow')and _d_a then
for _cba,acba in
pairs(getconnections(dbba.ChargeProgressClient:GetPropertyChangedSignal("Value")))do acba:Disable()end;dbba.ChargeProgressClient.Value=1 end end end)end)local cbba
cbba=hookmetamethod(game,"__namecall",function(dbba,...)
if not checkcaller()and
getnamecallmethod()=="FireServer"and a__a and tostring(dbba)==
"GotHitRE"then return elseif

not
checkcaller()and getnamecallmethod()=="FireServer"and d__a and dbba.Name==fallremote.Name then return elseif

(getnamecallmethod()=="Kick"or getnamecallmethod()=="kick")and dbba==game.Players.LocalPlayer then return end;return cbba(dbba,...)end)b_aa:LoadConfiguration()
