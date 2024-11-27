ESX = nil

ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('addSnowball')
AddEventHandler('addSnowball', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.addInventoryItem('weapon_snowball', 1)
    else
        print('Hráč nebyl nalezen.')
    end
end)