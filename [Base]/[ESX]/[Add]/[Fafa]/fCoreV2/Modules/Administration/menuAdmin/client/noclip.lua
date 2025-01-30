noclipActive = false 

index = 1

Citizen.CreateThread(function()
    local interval = 500
    buttons = setupScaleform("instructional_buttons")
    currentSpeed = noclip.speeds[index].speed
    Keys.Register('F2', "noCLip", "Mettre le noClip", function()
        if checkPerms("noclip") then
            noclipActive = not noclipActive
            
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                noclipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
            else
                noclipEntity = PlayerPedId()
            end
            
            if not noclipActive then
                ResetEntityAlpha(noclipEntity)
            else
                SetEntityAlpha(noclipEntity, math.floor(255 * 0.2), 0)
            end
            
            SetEntityCollision(noclipEntity, not noclipActive, not noclipActive)
            FreezeEntityPosition(noclipEntity, noclipActive)
            SetEntityInvincible(noclipEntity, noclipActive)
            SetVehicleRadioEnabled(noclipEntity, not noclipActive)
        else 
            cNotification(TranslationAdministration.MenuAdmin["CNotif_dontHavePermission"]) 
        end
    end)
    while true do    
        if noclipActive then
            interval = 0
            DrawScaleformMovieFullscreen(buttons)
            
            local yoff = 0.0
            local zoff = 0.0
            
            if IsControlJustPressed(1, noclip.controls.changeSpeed) then
                if index ~= 8 then
                    index = index+1
                    currentSpeed = noclip.speeds[index].speed
                else
                    currentSpeed = noclip.speeds[1].speed
                    index = 1
                end
                setupScaleform("instructional_buttons")
            end
                
                DisableControls()

            if IsDisabledControlPressed(0, noclip.controls.goForward) then
                yoff = noclip.offsets.y
            end
            
            if IsDisabledControlPressed(0, noclip.controls.goBackward) then
                yoff = -noclip.offsets.y
            end
            
            if IsDisabledControlPressed(0, noclip.controls.turnLeft) then
                SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity)+noclip.offsets.h)
            end
            
            if IsDisabledControlPressed(0, noclip.controls.turnRight) then
                SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity)-noclip.offsets.h)
            end
            
            if IsDisabledControlPressed(0, noclip.controls.goUp) then
                zoff = noclip.offsets.z
            end
            
            if IsDisabledControlPressed(0, noclip.controls.goDown) then
                zoff = -noclip.offsets.z
            end
            
            local newPos = GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))
            local heading = GetEntityHeading(noclipEntity)
            SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
            SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
            SetEntityHeading(noclipEntity, heading)
            SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, noclipActive, noclipActive, noclipActive)
        end
        Wait(interval)
    end
end)

function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function setupScaleform(scaleform)

    local scaleform = RequestScaleformMovie(scaleform)

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(1)
    end

    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(5)
    Button(GetControlInstructionalButton(2, noclip.controls.openKey, true))
    ButtonMessage("Disable Noclip")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(4)
    Button(GetControlInstructionalButton(2, noclip.controls.goUp, true))
    ButtonMessage("Go Up")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    Button(GetControlInstructionalButton(2, noclip.controls.goDown, true))
    ButtonMessage("Go Down")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    Button(GetControlInstructionalButton(1, noclip.controls.turnRight, true))
    Button(GetControlInstructionalButton(1, noclip.controls.turnLeft, true))
    ButtonMessage("Turn Left/Right")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    Button(GetControlInstructionalButton(1, noclip.controls.goBackward, true))
    Button(GetControlInstructionalButton(1, noclip.controls.goForward, true))
    ButtonMessage("Go Forwards/Backwards")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    Button(GetControlInstructionalButton(2, noclip.controls.changeSpeed, true))
    ButtonMessage("Change Speed ("..noclip.speeds[index].label..")")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(noclip.bgR)
    PushScaleformMovieFunctionParameterInt(noclip.bgG)
    PushScaleformMovieFunctionParameterInt(noclip.bgB)
    PushScaleformMovieFunctionParameterInt(noclip.bgA)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

function DisableControls()
    DisableControlAction(0, 30, true)
    DisableControlAction(0, 31, true)
    DisableControlAction(0, 32, true)
    DisableControlAction(0, 33, true)
    DisableControlAction(0, 34, true)
    DisableControlAction(0, 35, true)
    DisableControlAction(0, 266, true)
    DisableControlAction(0, 267, true)
    DisableControlAction(0, 268, true)
    DisableControlAction(0, 269, true)
    DisableControlAction(0, 44, true)
    DisableControlAction(0, 20, true)
    DisableControlAction(0, 74, true)
end
