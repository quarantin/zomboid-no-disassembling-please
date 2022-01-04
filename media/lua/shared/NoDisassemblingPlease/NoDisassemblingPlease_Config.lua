local NoDisassemblingPlease = {}

NoDisassemblingPlease.whitelist = {}
NoDisassemblingPlease.whitelist.barbecue  = true
-- TODO?
-- NoDisassemblingPlease.whitelist.bin = true
NoDisassemblingPlease.whitelist.fireplace = true
NoDisassemblingPlease.whitelist.freezer   = true
NoDisassemblingPlease.whitelist.fridge    = true
NoDisassemblingPlease.whitelist.microwave = true
NoDisassemblingPlease.whitelist.stove     = true
NoDisassemblingPlease.whitelist.woodstove = true

NoDisassemblingPlease.allowDisassembling = function(object)

	local sprite = object:getSprite()
	local props = sprite:getProperties()

	if props:Is(IsoFlagType.container) then
		local containerType = object:getContainer():getType()
		if not NoDisassemblingPlease.whitelist[containerType] then
			return false
		end
	end

	return true
end

return NoDisassemblingPlease
