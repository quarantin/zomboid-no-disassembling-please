local NoPickingUpPlease = {}

NoPickingUpPlease.exceptions = {
	'barbecue',
	'fireplace',
	'freezer',
	'fridge',
	'microwave',
	'stove',
	'woodstove',
}

NoPickingUpPlease.whitelist = {}

for i, v in pairs(NoPickingUpPlease.exceptions) do
	NoPickingUpPlease.whitelist[v] = true
end

NoPickingUpPlease.ISMoveableCursor_isValid = ISMoveableCursor.isValid
ISMoveableCursor.isValid = function(self, square)

	-- Also prevent disassembling from the pickup tool
	if ISMoveableCursor.mode[self.player] == "scrap" then
		return false
	end

	local objects = square:getObjects()
	for i = 0, objects:size() - 1 do

		local object = objects:get(i);
		local sprite = object:getSprite()
		local props = sprite:getProperties()

		if props:Is(IsoFlagType.container) then
			local containerType = object:getContainer():getType()
			if not NoPickingUpPlease.whitelist[containerType] then
				return false
			end
		end
	end

	return NoPickingUpPlease.ISMoveableCursor_isValid(self, square)
end
