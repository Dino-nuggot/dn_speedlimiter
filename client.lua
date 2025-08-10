local l=false
local t=0
local n=0
local function o(o)return o/3.6 end
local function r(o)return o*3.6 end
local function a(o)return math.floor(o+0.5) end
local function s(o)
 if not o or not DoesEntityExist(o)then return end
 local x,y,z=table.unpack(GetEntityVelocity(o))
 local e=math.sqrt(x*x+y*y+z*z)
 if e<0.01 then return end
 if e<=t then return end
 local c=t/e
 SetEntityVelocity(o,x*c,y*c,z*c)
end
Citizen.CreateThread(function()
 while true do
  Citizen.Wait(0)
  local e=PlayerPedId()
  if IsPedInAnyVehicle(e,false)then
   local u=GetVehiclePedIsIn(e,false)
   if GetPedInVehicleSeat(u,-1)==e then
    if IsControlJustPressed(0,Config.ToggleKey)then
     local i=GetGameTimer()
     if i-n<Config.Cooldown then
      if Config.ShowCooldownNotify then
       Config.Notify("Cooldown aktiv","Bitte warte kurz bevor du erneut schaltest","top",2500,"orange-7","mdi-timer-sand")
      end
     else
      n=i
      if not l then
       local d=GetEntitySpeed(u)
       if d>o(Config.MinSpeed)then
        t=d
        l=true
        Config.Notify("Speed Lock aktiviert",a(r(t)).." km/h","top",4000,"green-7","mdi-speedometer")
        if Config.AntiBurnout then SetVehicleReduceGrip(u,true)end
       else
        Config.Notify("Zu langsam","Mindestens "..Config.MinSpeed.." km/h nötig","top",3000,"orange-7","mdi-speedometer-slow")
       end
      else
       l=false
       Config.Notify("Speed Lock deaktiviert","","top",3000,"red-7","mdi-speedometer-off")
       if Config.AntiBurnout then SetVehicleReduceGrip(u,false)end
      end
     end
    end
    if l then
     local d=GetEntitySpeed(u)
     local f=o(Config.SpeedToleranceKmh)
     if d>t+f then s(u)end
     if Config.AntiBurnout then
      if IsVehicleInBurnout(u)then SetVehicleReduceGrip(u,true)else SetVehicleReduceGrip(u,false)end
     end
    end
   else
    l=false
    if Config.AntiBurnout then SetVehicleReduceGrip(u,false)end
   end
  else l=false end
 end
end)
