ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
local xPlayer = ESX.GetPlayerFromId(source)

RegisterCommand('deal', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem("trapphone").count and xPlayer.getInventoryItem("drugpackage").count >= 1 then
        TriggerClientEvent("onCommand", source)
    else
        TriggerClientEvent('dopeNotify2:Alert', source, "", "You need a Trap-Phone(1) and a Drug Shipment(1)", 5000, 'error')
    end
end)

RegisterNetEvent("PayOut1")
AddEventHandler("PayOut1", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local chance = math.random(1, 2)
    if xPlayer.getInventoryItem("drugpackage").count >= 1 then
        xPlayer.removeInventoryItem("drugpackage", 1)
        xPlayer.addInventoryItem("money", math.random(1300, 1500))
        if chance == 1 and Config.BonusItemAllowed then
            xPlayer.addInventoryItem(Config.BonusItem, Config.BonusItemCount)
        end
    else
        TriggerClientEvent('dopeNotify2:Alert', source, "", "You need a Drug Shipment(1)", 5000, 'error')
    end
end)

RegisterNetEvent("PayOut2")
AddEventHandler("PayOut2", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local chance = math.random(1, 2)
    if xPlayer.getInventoryItem("drugpackage").count >= 1 then
        xPlayer.removeInventoryItem("drugpackage", 1)
        xPlayer.addInventoryItem("money", math.random(500, 900))
        if chance == 1 and Config.BonusItemAllowed then
            xPlayer.addInventoryItem(Config.BonusItem, Config.BonusItemCount)
        end
    else
        TriggerClientEvent('dopeNotify2:Alert', source, "", "You need a Drug Shipment(1)", 5000, 'error')
    end
end)

RegisterNetEvent("PayOut3")
AddEventHandler("PayOut3", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local chance = math.random(1, 2)
    if xPlayer.getInventoryItem("drugpackage").count >= 1 then
        xPlayer.removeInventoryItem("drugpackage", 1)
        xPlayer.addInventoryItem("money", math.random(2000, 5300))
        if chance == 1 and Config.BonusItemAllowed then
            xPlayer.addInventoryItem(Config.BonusItem, Config.BonusItemCount)
        end
    else
        TriggerClientEvent('dopeNotify2:Alert', source, "", "You need a Drug Shipment(1)", 5000, 'error')
    end
end)

RegisterNetEvent("PayOut4")
AddEventHandler("PayOut4", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local chance = math.random(1, 2)
    if xPlayer.getInventoryItem("drugpackage").count >= 1 then
        xPlayer.removeInventoryItem("drugpackage", 1)
        xPlayer.addInventoryItem("money", math.random(1, 6800))
        if chance == 1 and Config.BonusItemAllowed then
            xPlayer.addInventoryItem(Config.BonusItem, Config.BonusItemCount)
        end
    else
        TriggerClientEvent('dopeNotify2:Alert', source, "", "You need a Drug Shipment(1)", 5000, 'error')
    end
end)

RegisterCommand('callplug', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem("plugphone").count then
        TriggerClientEvent("onPlug", source)
    else
        TriggerClientEvent('dopeNotify2:Alert', source, "", "You need a High-End Trap-Phone(1)", 5000, 'error')
    end
end)

RegisterNetEvent("GiveNote")
AddEventHandler("GiveNote", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem("bossnote", 1)
end)
RegisterNetEvent("TakeNote")
AddEventHandler("TakeNote", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem("bossnote").count >= 1 then
        xPlayer.removeInventoryItem("bossnote", 1)
    end
end)

RegisterNetEvent("GivePack")
AddEventHandler("GivePack", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem("drugpackage", math.random(1, 4))
end)

ESX.RegisterUsableItem('plugphone', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("onPlug", source)
    TriggerClientEvent('dopeNotify2:Alert', source, "", "Contacting the 'Plug'", 5000, 'success')
end)