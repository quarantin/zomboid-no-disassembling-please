local NoDisassemblingPlease = require("NoDisassemblingPlease/NoDisassemblingPlease_Auth")

local function allowDestroySafehouse(player, worldobjects)

	for _, object in ipairs(worldobjects) do

		if NoDisassemblingPlease.allowDestroySafehouse(player, object:getSquare()) then
			return true
		end
	end
end

local ISWorldObjectContextMenu_onDestroy = ISWorldObjectContextMenu.onDestroy
function ISWorldObjectContextMenu.onDestroy(worldobjects, player, sledgehammer)

	if NoDisassemblingPlease.allowDestroyEverywhere(player) or allowDestroySafehouse(player, worldobjects) then
		return ISWorldObjectContextMenu_onDestroy(worldobjects, player, sledgehammer)
	end

	player:setHaloNote(getText("IGUI_NoDestroyingAllowed"))
end
