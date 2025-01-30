
local visualisationOpen = nil

RegisterNetEvent("fCore:Concess:SetInformationTable")
AddEventHandler("fCore:Concess:SetInformationTable",function(table)
    visualisationOpen = table
end)

CreateThread(function()
    TriggerServerEvent("fCore:Concess:GetInformationTable")
    while visualisationOpen == nil do 
        Wait(1)
    end
    while true do 
        local interval = 1500
        local posPlayer = GetEntityCoords(PlayerPedId())
        for i = 1, #visualisationOpen do
            local v = visualisationOpen[i]
            local dest = v.point
            local dist = #(posPlayer-dest)
            if dist <= v.maxMarker then 
                interval = 0
                DrawMarker(v.markerType, dest.x, dest.y, dest.z, 0.0, 0.0, 0.0, v.rotX, v.rotY, v.rotX, v.sizeX, v.sizeY, v.sizeZ, v.r, v.g, v.b, v.a, false, false, 2, false, false, false, false)
                if dist <= v.max3D then 
                    DrawName3D(dest.x, dest.y, dest.z + 1, v.text, 255, 255, 255)
                    if IsControlJustPressed(1, 51) then 
                        visualisationMenuOpen(v, i)
                    end
                end
            end
        end
        Wait(interval)
    end
end)
