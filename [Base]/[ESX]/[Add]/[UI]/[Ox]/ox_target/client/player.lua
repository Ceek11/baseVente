exports.ox_target:addGlobalPlayer({
    {
        name = 'porter',
        icon = "fa-solid fa-handcuffs",
        label = 'Porter',
        distance = 1.5,
        onSelect = function(data)
            ExecuteCommand("porter")
        end
    },
    {
        name = 'Id',
        icon = "fa-solid fa-handcuffs",
        label = 'l’ID de la personne',
        distance = 1.5,
        onSelect = function(data)
            TriggerServerEvent("fCore:oxTarget:getId", GetPlayerIdFromPed(data.entity))
        end
    },
    {
        name = 'drive',
        icon = "fa-solid fa-handcuffs",
        label = 'Permis de conduire',
        distance = 1.5,
        onSelect = function(data)
            TriggerServerEvent("jsfour-idcard:open", GetPlayerServerId(PlayerId()), GetPlayerIdFromPed(data.entity), "driver")
        end
    },
    {
        name = 'PPA',
        icon = "fa-solid fa-handcuffs",
        label = 'PPA',
        distance = 1.5,
        onSelect = function(data)
            TriggerServerEvent("jsfour-idcard:open", GetPlayerServerId(PlayerId()), GetPlayerIdFromPed(data.entity), "weapon")
        end
    },
    {
        name = 'identity',
        icon = "fa-solid fa-handcuffs",
        label = 'Identité',
        distance = 1.5,
        onSelect = function(data)
            TriggerServerEvent("jsfour-idcard:open", GetPlayerServerId(PlayerId()), GetPlayerIdFromPed(data.entity))
        end
    },
})




objectChair = {
    {objName= "v_serv_ct_chair02", verticalOffsetX = 0.0, verticalOffsetY = 0.0, verticalOffsetZ = 0.5, direction = 180.0},
    {objName= "prop_off_chair_04", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_off_chair_03", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_off_chair_05", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_club_officechair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= .0},
    {objName= "v_ilev_leath_chr", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_corp_offchair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_med_emptybed", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_off_chair_01", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_table_01_chr_a", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.0, direction= 180.0},
    {objName= "prop_couch_sm_05", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_yaught_chair_01", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_gc_chair02", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_armchair_01", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_couch_sm_02", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_couch_sm_07", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_ret_gc_chair03", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_corp_cd_chair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_off_chair_04b", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_sol_chaise", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "hei_prop_yah_seat_02", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "hei_prop_yah_seat_01", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_table_04_chr", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_01a", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_08", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_clown_chair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_04a", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chateau_chair_01", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.05, direction= 180.0},
    {objName= "prop_chaise_02", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_05", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_table_06_chr", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chair_02", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_07", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_01b", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_table_05_chr", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chair_pile_01", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_old_deck_chair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_table_03b_chr", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_table_03_chr", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_table_01_chr_b", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_table_02_chr", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_10", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_04b", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_old_wood_chair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_03", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_09", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_old_wood_chair_lod", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chaise_06", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_01a", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_05", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_01c", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_04", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_09", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_08", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_06", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_02", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_10", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_bench_01b", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_03", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_11", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_banc_07", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chair_01a", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "mx_ocean_modernchairs", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "apa_mp_h_din_stool_04", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chair_04a", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_med_p_easychair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_waiting_seat_01", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_ilev_ph_bench", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "gabz_lamesapd_chair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "map4all_sh_chair01a", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "hei_heist_din_chair_05", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "map4all_ss_sheriff_props_bench02", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "map4all_ss_sheriff_props_bench01", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "gabz_pdprops_cell_bed", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "gabz_pdprops_chair03", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "gabz_pdprops_chair02", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "gabz_pdprops_chair04", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "rfc_paleto_hospital_bench", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "gabz_koi_chair_1", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "apa_mp_h_yacht_armchair_03", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "nikki_chair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "prop_chair_06", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_club_barchair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_ret_gc_chair02", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
    {objName= "v_ret_ps_chair", verticalOffsetX= 0.0, verticalOffsetY= 0.0, verticalOffsetZ= 0.5, direction= 180.0},
}

local entityModels = {}
for _, chair in pairs(objectChair) do
    entityModels[GetHashKey(chair.objName)] = chair
end

exports.ox_target:addGlobalObject({
    {
        name = "chaise",
        -- event = 'ox_target:debug',
        icon = 'fa-solid fa-bong',
        label = "S'asseoir sur la chaise",
        canInteract = function(entity, distance, coords)
            local entityModel = GetEntityModel(entity)
            return entityModels[entityModel] ~= nil
        end,
        onSelect = function(data)
            local entityModel = GetEntityModel(data.entity)
            local chairData = entityModels[entityModel]
            
            if chairData then
                cancelAnim()
                local objectcoords = GetEntityCoords(data.entity)
                TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", objectcoords.x + chairData.verticalOffsetX, objectcoords.y + chairData.verticalOffsetY, objectcoords.z + chairData.verticalOffsetZ, GetEntityHeading(data.entity) + chairData.direction, 0, true, true)
            end
        end
    }
})

function cancelAnim()
    local inAnim = true
    CreateThread(function()
        while inAnim do 
            HelpNotify({"E", "Arrêter l'animation", "Information", {255, 0, 0}})
            if IsControlJustPressed(1, 51) then 
                ClearPedTasks(PlayerPedId())
                inAnim = false
            end
            Wait(0)
        end
    end)
end

