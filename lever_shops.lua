-- Version 1.0
-- Script made by Joriku, or Joelslamospersson at github.
local thaisdiamond = Action()

function thaisdiamond.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local totalCost
    local rewardItemId
    local rewardAmount

    -- Determine the action based on the item's action ID (aid)
    if item:getActionId() == 31063 then
        totalCost = 100000  -- 100,000 gold or 10 crystal coins
        rewardItemId = 35901
        rewardAmount = 1000
    elseif item:getActionId() == 31021 then  -- sudden death
        totalCost = 60000   -- 60k or 6cc
        rewardItemId = 3155
        rewardAmount = 1000
	elseif item:getActionId() == 31023 then  -- ultimate mana p
        totalCost = 350000   -- 350k or 35cc
        rewardItemId = 23373
        rewardAmount = 1000
	elseif item:getActionId() == 31024 then  -- ultimate spirit
        totalCost = 350000   -- 350k or 35cc
        rewardItemId = 23374
        rewardAmount = 1000
	elseif item:getActionId() == 31022 then  -- supreme h p
        totalCost = 500000   -- 500k or 50cc
        rewardItemId = 23375
        rewardAmount = 1000
	elseif item:getActionId() == 31020 then  -- thunderstorm rune
        totalCost = 50000   -- 50k or 5cc
        rewardItemId = 3202
        rewardAmount = 1000
	elseif item:getActionId() == 31019 then  -- great fireball rune
        totalCost = 50000   -- 50k or 5cc
        rewardItemId = 3191
        rewardAmount = 1000
	elseif item:getActionId() == 31018 then  -- ava l rune
        totalCost = 50000   -- 50k or 5cc
        rewardItemId = 3161
        rewardAmount = 1000
	elseif item:getActionId() == 31018 then  -- ava l rune
        totalCost = 50000   -- 50k or 5cc
        rewardItemId = 3161
        rewardAmount = 1000
    else
        -- If the action ID is not recognized, do not proceed
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This item is not configured correctly.")
        return true
    end

    -- Transaction logic assuming getMoney and removeMoney functions
    if player:getMoney() >= totalCost then
        if player:removeMoney(totalCost) then -- Make sure money is removed from player
            player:addItem(rewardItemId, rewardAmount)
            player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have successfully purchased " .. rewardAmount .. " units of item ID " .. rewardItemId .. " for " .. totalCost .. " gold.")
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "An error occurred while processing your purchase. Please try again.")
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have enough money to complete this purchase. You need at least " .. totalCost .. " gold.")
    end

    -- Handle item transformation based on current state
    if item.itemid == 2772 then
        item:transform(2773)
    elseif item.itemid == 2773 then
        item:transform(2772)
    end
    
    return true
end

thaisdiamond:aid(31063, 31021, 31023, 31024, 31022, 31020, 31019, 31018) -- Register the action id of lever used
thaisdiamond:register()
