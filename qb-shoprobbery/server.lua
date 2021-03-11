--------HUMBLEBEGGAR---------------------
---#####商店抢劫#####-------------
QBCore = nil
local alarmTriggered = false
----------------------------------------时间设置---------------------------------------------------

local timerRoberry = 3000*600 --设置抢劫冷却时间 (100*600 = 1min)  (200*600 = 2min) (1000*600 = 10min) (3000*600 = 30min)

----------------------------------------------------------------------------------------------------------------

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

local deadPeds = {}

RegisterServerEvent('humrp_robbery:pedDead')
AddEventHandler('humrp_robbery:pedDead', function(store)
    if not deadPeds[store] then
        deadPeds[store] = 'deadlol'
        TriggerClientEvent('humrp_robbery:onPedDeath', -1, store)
        local second = 1000
        local minute = 60 * second
        local hour = 60 * minute
        local cooldown = Config.Shops[store].cooldown
        local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
        Wait(wait)
        if not Config.Shops[store].robbed then
            for k, v in pairs(deadPeds) do if k == store then table.remove(deadPeds, k) end end
            TriggerClientEvent('humrp_robbery:resetStore', -1, store)
        end
        alarmTriggered = false
    end
end)

RegisterServerEvent('humrp_robbery:handsUp')
AddEventHandler('humrp_robbery:handsUp', function(store)
    TriggerClientEvent('humrp_robbery:handsUp', -1, store)
end)

RegisterServerEvent('humrp_robbery:pickUp')
AddEventHandler('humrp_robbery:pickUp', function(store)
    local xPlayer = QBCore.Functions.GetPlayer(source)  
    local randomAmount = math.random(Config.Shops[store].money[1], Config.Shops[store].money[2])
    xPlayer.Functions.AddMoney("cash", randomAmount, "sold-pawn-items")
	TriggerClientEvent('QBCore:Notify', source, 'Successful robbery you stole '..randomAmount..' $', "success")  
    
    TriggerClientEvent('humrp_robbery:removePickup', -1, store) 
end)

RegisterServerEvent('humrp_robbery:rob')
AddEventHandler('humrp_robbery:rob', function(store)
    local src = source
    Config.Shops[store].robbed = true
    TriggerClientEvent('humrp_robbery:rob', -1, store)

    Wait(timerRoberry) --set the timer between robberies

    TriggerClientEvent('humrp_robbery:robberyOver', src)

    local second = 1000
    local minute = 60 * second
    local hour = 60 * minute
    local cooldown = Config.Shops[store].cooldown
    local wait = cooldown.hour * hour + cooldown.minute * minute + cooldown.second * second
    Wait(wait)
    Config.Shops[store].robbed = false
    TriggerClientEvent('humrp_robbery:resetStore', -1, store)
    --for k, v in pairs(deadPeds) do if k == store then table.remove(deadPeds, k) end end
    --TriggerClientEvent('humrp_robbery:resetStore', -1, store)
    alarmTriggered = false
end)

Citizen.CreateThread(function()
    while true do
        for i = 1, #deadPeds do TriggerClientEvent('humrp_robbery:pedDead', -1, i) end -- update dead peds
        Citizen.Wait(500)
    end
end)


RegisterServerEvent('alarm:server:PoliceAlertMessage')
AddEventHandler('alarm:server:PoliceAlertMessage', function(title, coords, blip)
    local src = source
    local alertData = {
        title = title,
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = "Robbery Market",
    }

    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                if blip then
                    if not alarmTriggered then
                        TriggerClientEvent("cash-telephone:client:addPoliceAlert", v, alertData)
                        TriggerClientEvent("cash-vangelicoheist:client:PoliceAlertMessage", v, title, coords, blip)
                        alarmTriggered = true
                    end
                else
                    TriggerClientEvent("cash-telephone:client:addPoliceAlert", v, alertData)
                    TriggerClientEvent("cash-vangelicoheist:client:PoliceAlertMessage", v, title, coords, blip)
                end
            end
        end
    end
end)