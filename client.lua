ESX = nil
local isPickingUp = false

Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports["es_extended"]:getSharedObject()
        Citizen.Wait(0)
    end
end)

-- Funkce pro zobrazení help message
function ShowHelpNotification(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local inVehicle = IsPedInAnyVehicle(player, false)

        if not inVehicle and not isPickingUp then
            ShowHelpNotification("~INPUT_VEH_HEADLIGHT~ Sebrat kouli") -- Zobrazí hlášku "Stiskněte H pro sebrání"
            if IsControlJustPressed(1, 74) then -- 74 je klávesa H
                ExecuteCommand("snezkoule")
            end
        end
    end
end)

RegisterCommand("snezkoule", function()
    if isPickingUp then
        ESX.ShowNotification("Už sbíráte sněhovou kouli, počkejte prosím.")
        return
    end

    local player = PlayerPedId()

    if IsPedInAnyVehicle(player, false) then
        ESX.ShowNotification("Nemůžete sbírat sněhové koule z auta!")
        return
    end

    isPickingUp = true
    lib.progressBar({
        duration = 7000,
        label = "Sbíráte sněhovou kouli...",
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            combat = true,
        },
        anim = {
            dict = "anim@mp_snowball",
            clip = "pickup_snowball",
        },
    })

    TriggerServerEvent('addSnowball')
    isPickingUp = false
end, false)