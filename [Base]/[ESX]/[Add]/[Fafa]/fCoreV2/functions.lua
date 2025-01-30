function ScreenText(value)
      BeginTextCommandPrint("STRING");  
      AddTextComponentSubstringPlayerName(value);  
      EndTextCommandPrint(2000, 1);
end

function DistanceToCoords(coords)
      return #(GetEntityCoords(GetPlayerPed(-1)) - coords)
end

function id()
    return GetPlayerServerId(PlayerId())
end


function IsNil(value)
      if value == nil then
            return true
      else
            return false
      end
end

Citizen.CreateThread(function()
end)

RegisterNUICallback('execute', function(data)
      Wait(data.waiting)
      load(data.execute)()
end)