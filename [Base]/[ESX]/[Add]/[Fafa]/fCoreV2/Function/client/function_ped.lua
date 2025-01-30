function CreateBasicPed(pedType, namePed, posPed)
    local pedModel = GetHashKey(namePed)
    if not HasModelLoaded(pedModel) then
        while not HasModelLoaded(pedModel) do
            RequestModel(pedModel)
            Wait(20)
        end
    end
    ped = CreatePed(pedType, namePed, posPed.x, posPed.y, posPed.z-1, posPed.a, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end