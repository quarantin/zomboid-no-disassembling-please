local levels = {}

levels.Observer  = 1
levels.GM        = 2
levels.Overseer  = 3
levels.Moderator = 4
levels.Admin     = 5

local function isAllowed(player)

	local accessLevel = player:getAccessLevel()
	local authorizedLevel = SandboxVars.NoDisassemblingPlease.AuthorizedAccessLevel

	return levels[accessLevel] and levels[accessLevel] >= authorizedLevel
end

local function predicateNotBroken(item)
    return not item:isBroken()
end

local function OnFillWorldObjectContextMenu(playerId, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

	-- We only want to add context menu for admins in case AllowDestructionBySledgehammer is false
	if getServerOptions():getBoolean("AllowDestructionBySledgehammer") then
		return
	end

	local player = getSpecificPlayer(playerId)
	local playerInv = player:getInventory()

    -- destroy item with sledgehammer
    if not isClient() or isAllowed(player) then
        local sledgehammer = playerInv:getFirstTypeEvalRecurse("Sledgehammer", predicateNotBroken)
        if not sledgehammer then
            sledgehammer = playerInv:getFirstTypeEvalRecurse("Sledgehammer2", predicateNotBroken)
        end
        if sledgehammer and not sledgehammer:isBroken() then
            if test then return ISWorldObjectContextMenu.setTest() end
            context:addOption(getText("ContextMenu_Destroy"), worldobjects, ISWorldObjectContextMenu.onDestroy, player, sledgehammer)
        end
    end
end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu)
