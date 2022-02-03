ESX = nil
local PlayerData = {}
local active = false
local hasBox = false
local canKnock = true

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent("onCommand")
AddEventHandler("onCommand", function()
    CreateThread(function()
        if not active then
            active = true
            exports.rprogress:Custom({
                Label = "Looking for a sale",
                Duration = Config.TimeToGetDeal * 1000,
                Animation = {
                    scenario = "WORLD_HUMAN_STAND_MOBILE", -- https://pastebin.com/6mrYTdQv
                    animationDictionary = "", -- https://alexguirre.github.io/animations-list/
                    animationName = "",
                },
                DisableControls = {
                    Mouse = false,
                    Player = false,
                    Vehicle = false
                },
                onComplete = function(cancelled)
                    exports['mythic_notify']:SendAlert("inform", "You have found a customer. Meet them at the location marked on your gps.", 5000)
                    local buyerChoice = math.random(1, 5)
                    if buyerChoice == 1 then
                        TriggerEvent("JobLocation1", PlayerPedId())
                        SetNewWaypoint(1218.14, 2398.12)
                    elseif buyerChoice == 2 then
                        TriggerEvent("JobLocation2", PlayerPedId())
                        SetNewWaypoint(-1117.74, -1488.2)
                    elseif buyerChoice == 3 then
                        TriggerEvent("JobLocation3", PlayerPedId())
                        SetNewWaypoint(1321.39, -1746.13)
                    elseif buyerChoice == 4 then
                        TriggerEvent("JobLocation4", PlayerPedId())
                        SetNewWaypoint(-615.89, 476.87)
                    elseif buyerChoice == 5 then
                        TriggerEvent("JobLocation5", PlayerPedId())
                        SetNewWaypoint(-57.92, 6647.46)
                    end
                end
            })
        else
            exports['mythic_notify']:SendAlert("inform", "You have an active job already", 3000)
        end
    
    end)
end)

RegisterNetEvent("onPlug")
AddEventHandler("onPlug", function()
    CreateThread(function()
        if not active then
            active = true
            exports.rprogress:Custom({
                Label = "Dialing the connect",
                Duration = Config.TimeToCallPlug * 1000,
                Animation = {
                    scenario = "WORLD_HUMAN_STAND_MOBILE", -- https://pastebin.com/6mrYTdQv
                    animationDictionary = "", -- https://alexguirre.github.io/animations-list/
                    animationName = "",
                },
                DisableControls = {
                    Mouse = false,
                    Player = false,
                    Vehicle = false
                },
                onComplete = function(cancelled)
                    exports['mythic_notify']:SendAlert("inform", "Your connect would like to meet with you.", 5000)
                    TriggerEvent("callPlug", PlayerPedId())
                    SetNewWaypoint(124.91, -3119.02)
                end
            })
        else
            exports['mythic_notify']:SendAlert("inform", "You have an active job already", 3000)
        end
    end)
end)

AddEventHandler("JobLocation1", function()
    CreateThread(function()
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(1218.14, 2398.12, 66.1))
            if dist <= 10 then
                ShowFloatingHelpNotification("Call Kyle outside", vector3(1218.14, 2398.12, 66.1))
            end
            if IsControlJustReleased(1, 38) and dist <= 10 then
                RequestAnimDict("timetable@jimmy@doorknock@")
                while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Wait(0) end
                TaskPlayAnim(ped, 'timetable@jimmy@doorknock@', 'knockdoor_idle', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                local ped_hash = GetHashKey("cs_floyd")
                RequestModel(ped_hash)
                while not HasModelLoaded(ped_hash) do
                    Wait(1)
                end
                him = CreatePed(1, ped_hash, 1222.34, 2397.19, 66.11, 111.1, false, false)
                break
            end
        end
        
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(1222.34, 2397.19, 66.11))
            if dist <= 10 then
                ShowFloatingHelpNotification("Speak with Kyle", vector3(1222.34, 2397.19, 66.11))
            end
            if IsControlJustReleased(1, 38) and dist <= 3 then
                RequestAnimDict("mp_common")
                while (not HasAnimDictLoaded("mp_common")) do Wait(0) end
                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                TaskPlayAnim(him, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                DeleteEntity(him)
                TriggerServerEvent("PayOut1", ped)
                exports['mythic_notify']:SendAlert("inform", "Here's Your Money BRO!!", 4000)
                active = false
                break
            end
        end
    end)
end)

AddEventHandler("JobLocation2", function()
    CreateThread(function()
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(-1117.74, -1488.2, 4.73))
            if dist <= 10 then
                ShowFloatingHelpNotification("Call Chyenne outside", vector3(-1117.74, -1488.2, 4.73))
            end
            if IsControlJustReleased(1, 38) and dist <= 10 then
                RequestAnimDict("timetable@jimmy@doorknock@")
                while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Wait(0) end
                TaskPlayAnim(ped, 'timetable@jimmy@doorknock@', 'knockdoor_idle', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                local ped_hash = GetHashKey("a_f_m_downtown_01")
                RequestModel(ped_hash)
                while not HasModelLoaded(ped_hash) do
                    Wait(1)
                end
                her = CreatePed(1, ped_hash, -1120.69, -1489.61, 4.7, 302.55, false, false)
                break
            end
        end
        
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(-1120.69, -1489.61, 4.7))
            if dist <= 10 then
                ShowFloatingHelpNotification("Speak with Chyenne", vector3(-1120.69, -1489.61, 4.7))
            end
            if IsControlJustReleased(1, 38) and dist <= 2 then
                RequestAnimDict("mp_common")
                while (not HasAnimDictLoaded("mp_common")) do Wait(0) end
                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                TaskPlayAnim(her, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                DeleteEntity(her)
                TriggerServerEvent("PayOut2", ped)
                exports['mythic_notify']:SendAlert("inform", "Aww Baby. I'm a little short. Here!!", 5000)
                active = false
                break
            end
        end
    end)
end)

AddEventHandler("JobLocation3", function()
    CreateThread(function()
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(1323.6, -1746.38, 54.35))
            if dist <= 10 then
                ShowFloatingHelpNotification("Call Jose outside", vector3(1321.39, -1746.38, 54.7))
            end
            if IsControlJustReleased(1, 38) and dist <= 10 then
                RequestAnimDict("timetable@jimmy@doorknock@")
                while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Wait(0) end
                TaskPlayAnim(ped, 'timetable@jimmy@doorknock@', 'knockdoor_idle', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                local ped_hash = GetHashKey("g_m_y_mexgoon_03")
                RequestModel(ped_hash)
                while not HasModelLoaded(ped_hash) do
                    Wait(1)
                end
                her = CreatePed(1, ped_hash, 1323.6, -1746.38, 54.35, 117.51, false, false)
                break
            end
        
        end
        
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(1323.6, -1746.38, 54.35))
            if dist <= 10 then
                ShowFloatingHelpNotification("Speak with Jose", vector3(1323.6, -1746.38, 54.35))
            end
            if IsControlJustReleased(1, 38) and dist <= 2 then
                RequestAnimDict("mp_common")
                while (not HasAnimDictLoaded("mp_common")) do Wait(0) end
                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                TaskPlayAnim(her, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                DeleteEntity(her)
                TriggerServerEvent("PayOut1", ped)
                exports['mythic_notify']:SendAlert("inform", "Good Looks Foo. I'g going back to fuck your mom", 9000)
                active = false
                break
            end
        end
    end)
end)


AddEventHandler("JobLocation4", function()
    CreateThread(function()
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(-615.89, 476.87, 109.07))
            if dist <= 10 then
                ShowFloatingHelpNotification("Call Jackson", vector3(-615.89, 476.87, 109.07))
            end
            if IsControlJustReleased(1, 38) and dist <= 10 then
                RequestAnimDict("timetable@jimmy@doorknock@")
                while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Wait(0) end
                TaskPlayAnim(ped, 'timetable@jimmy@doorknock@', 'knockdoor_idle', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                local ped_hash = GetHashKey("cs_tom")
                RequestModel(ped_hash)
                while not HasModelLoaded(ped_hash) do
                    Wait(1)
                end
                her = CreatePed(1, ped_hash, -615.99, 470.95, 108.86, 334, 33, false, false)
                break
            end
        end
        
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(-615.99, 470.95, 108.86))
            if dist <= 10 then
                ShowFloatingHelpNotification("Speak with Jackson", vector3(-615.99, 470.95, 108.86))
            end
            if IsControlJustReleased(1, 38) and dist <= 2 then
                RequestAnimDict("mp_common")
                while (not HasAnimDictLoaded("mp_common")) do Wait(0) end
                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                TaskPlayAnim(her, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                DeleteEntity(her)
                TriggerServerEvent("PayOut3", ped)
                exports['mythic_notify']:SendAlert("inform", "Thanks Bro. Here's my allowance", 9000)
                active = false
                break
            end
        end
    end)
end)

AddEventHandler("JobLocation5", function()
    CreateThread(function()
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(-57.92, 6647.46, 31.08))
            if dist <= 10 then
                ShowFloatingHelpNotification("Call 'The Guy'", vector3(-57.92, 6647.46, 31.08))
            end
            if IsControlJustReleased(1, 38) and dist <= 10 then
                RequestAnimDict("timetable@jimmy@doorknock@")
                while (not HasAnimDictLoaded("timetable@jimmy@doorknock@")) do Wait(0) end
                TaskPlayAnim(ped, 'timetable@jimmy@doorknock@', 'knockdoor_idle', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                local ped_hash = GetHashKey("ig_lestercrest")
                RequestModel(ped_hash)
                while not HasModelLoaded(ped_hash) do
                    Wait(1)
                end
                her = CreatePed(1, ped_hash, -56.75, 6650.88, 29.75, 134.0, false, false)
                break
            end
        
        end
        
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(-56.75, 6650.88, 29.75))
            if dist <= 10 then
                ShowFloatingHelpNotification("Speak with 'The Guy'", vector3(-56.75, 6650.88, 29.75))
            end
            if IsControlJustReleased(1, 38) and dist <= 2 then
                RequestAnimDict("mp_common")
                while (not HasAnimDictLoaded("mp_common")) do Wait(0) end
                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                TaskPlayAnim(her, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)
                DeleteEntity(her)
                TriggerServerEvent("PayOut4", ped)
                exports['mythic_notify']:SendAlert("inform", "If you tell anyone I'm here. You will have no Wifi", 10000)
                active = false
                break
            end
        end
    end)
end)

AddEventHandler("callPlug", function()
    CreateThread(function()
        while true do
            Wait(0)
            local ped_hash = GetHashKey("g_m_m_korboss_01")
            RequestModel(ped_hash)
            while not HasModelLoaded(ped_hash) do
                Wait(1)
            end
            her = CreatePed(1, ped_hash, 124.91, -3110.02, 5.96, 319.83, false, false)
            break
        end
        while true do
            canBoss = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(124.91, -3110.02, 5.96))
            
            if dist <= 20 then
                ShowFloatingHelpNotification("Speak with 'The Plug'", vector3(124.91, -3110.02, 5.96))
            
            end
            if IsControlJustReleased(1, 38) and dist <= 10 then
                RequestAnimDict("gestures@m@standing@casual")
                while (not HasAnimDictLoaded("gestures@m@standing@casual")) do Wait(0) end
                TaskPlayAnim(ped, 'gestures@m@standing@casual', 'gesture_no_way', 8.0, -8.0, -1, 0, 0, false, false, false)
                TaskPlayAnim(her, 'gestures@f@standing@casual', 'gesture_point', 8.0, -8.0, -1, 0, 0, false, false, false)
                exports['mythic_notify']:SendAlert("inform", "Take this note and give it to Cortez at the airport. He is on the third level", 10000)
                Wait(1000)
                TriggerServerEvent("GiveNote", ped)
                SetNewWaypoint(-1043.82, -2635.57)
                Wait(7000)
                DeleteEntity(her)
                break
            end
        end
        
        while true do
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(-1043.82, -2635.57, 26.6))
            local ped_hash = GetHashKey("g_m_y_mexgoon_01")
            RequestModel(ped_hash)
            while not HasModelLoaded(ped_hash) do
                Wait(1)
            end
            if dist >= 10 then
                local vehCrds = vector3(-1051.03, -2634.18, 26.6)
                her = CreatePed(1, ped_hash, -1043.82, -2635.57, 26.6, 319.83, false, false)
                ESX.Game.SpawnVehicle("burrito", vehCrds, 271.18, function()
                    end)
            end
            break
        end
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local dist = #(pCrds - vector3(-1043.82, -2635.57, 26.6))
            if dist <= 10 then
                ShowFloatingHelpNotification("Speak with Cortez'", vector3(-1043.82, -2635.57, 26.6))
            end
            if IsControlJustReleased(1, 38) and dist <= 2 then
                RequestAnimDict("mp_common")
                while (not HasAnimDictLoaded("mp_common")) do Wait(0) end
                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                TaskPlayAnim(her, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 0, 0, false, false, false)
                TriggerServerEvent("TakeNote", ped)
                Wait(5000)
                DeleteEntity(her)
                exports['mythic_notify']:SendAlert("inform", "Thanks Foo. Take the shit from the van.", 10000)
                active = false
                break
            end
        end
        
        while true do
            canKnock = true
            Wait(0)
            local ped = PlayerPedId()
            local pCrds = GetEntityCoords(ped)
            local vehicle = ESX.Game.GetVehicleInDirection()
            local dist = #(pCrds - vector3(-1054.17, -2634.22, 26.6))
            if dist <= 10 then
                ShowFloatingHelpNotification("Grab the packages.", vector3(-1054.17, -2634.22, 26.6))
            end
            if IsControlJustReleased(1, 38) and dist <= 2 then
                RequestAnimDict("mini@repair")
                while (not HasAnimDictLoaded("mini@repair")) do Wait(0) end
                TaskPlayAnim(ped, 'mini@repair', 'fixing_a_ped', 8.0, -8.0, 5000, 0, 0, false, false, false)
                SetVehicleDoorOpen(vehicle, 2, 0, true)
                SetVehicleDoorOpen(vehicle, 3, 0, true)
                Wait(5000)
                DeleteVehicle(vehicle)
                TriggerServerEvent("GivePack", ped)
                Wait(5000)
                
                exports['mythic_notify']:SendAlert("inform", "Get out of the area.", 10000)
                active = false
                hasBox = true
                break
            end
        end
    end)
end)


function ShowFloatingHelpNotification(msg, coords)
    SetFloatingHelpTextWorldPosition(1, coords.x, coords.y, coords.z)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(2, false, true, 0)
end