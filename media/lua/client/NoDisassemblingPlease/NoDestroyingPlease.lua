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

local ISWorldObjectContextMenu_onDestroy = ISWorldObjectContextMenu.onDestroy
function ISWorldObjectContextMenu.onDestroy(worldobjects, player, sledgehammer)

	if isAllowed(player) then
		return ISWorldObjectContextMenu_onDestroy(worldobjects, player, sledgehammer)
	end

	player:setHaloNote(getText("IGUI_NoDestroyingAllowed"))
end
