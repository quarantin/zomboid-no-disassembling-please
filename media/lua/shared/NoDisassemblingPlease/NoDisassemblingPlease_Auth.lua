local NoDisassemblingPlease = {}

NoDisassemblingPlease.everywhereLevels = {}
NoDisassemblingPlease.everywhereLevels.None      = 1
NoDisassemblingPlease.everywhereLevels.Observer  = 2
NoDisassemblingPlease.everywhereLevels.GM        = 3
NoDisassemblingPlease.everywhereLevels.Overseer  = 4
NoDisassemblingPlease.everywhereLevels.Moderator = 5
NoDisassemblingPlease.everywhereLevels.Admin     = 6

NoDisassemblingPlease.safehouseLevels = {}
NoDisassemblingPlease.safehouseLevels.None     = 1
NoDisassemblingPlease.safehouseLevels.Roommate = 2
NoDisassemblingPlease.safehouseLevels.Owner    = 3

function NoDisassemblingPlease.getSafehouseAccessLevel(player, safehouse)

	if safehouse:isOwner(player) then
		return "Owner"

	elseif safehouse:playerAllowed(player) then
		return "Roommate"

	else
		return "None"
	end
end

function NoDisassemblingPlease.allowDestroyEverywhere(player)

	local levels = NoDisassemblingPlease.everywhereLevels
	local accessLevel = player:getAccessLevel()
	local authorizedLevel = SandboxVars.NoDisassemblingPlease.AllowDestroyEverywhere

	return levels[accessLevel] and levels[accessLevel] >= authorizedLevel
end

function NoDisassemblingPlease.allowDestroySafehouse(player, square)

	local safehouse = SafeHouse.getSafeHouse(square)
	if safehouse then

		local levels = NoDisassemblingPlease.safehouseLevels
		local accessLevel = NoDisassemblingPlease.getSafehouseAccessLevel(player, safehouse)
		local authorizedLevel = SandboxVars.NoDisassemblingPlease.AllowDestroySafehouse

		return levels[accessLevel] and levels[accessLevel] >= authorizedLevel
	end
end

return NoDisassemblingPlease
