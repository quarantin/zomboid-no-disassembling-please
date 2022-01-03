local config = {}

config.exceptions = {
	'barbecue',
	'fireplace',
	'freezer',
	'fridge',
	'microwave',
	'stove',
	'woodstove',
}

config.whitelist = {}

for i, v in pairs(config.exceptions) do
	config.whitelist[v] = true
end

local ISMoveableCursor_isValid = ISMoveableCursor.isValid
ISMoveableCursor.isValid = function(self, square)

	local objects = square:getObjects()
	for i = 0, objects:size() - 1 do

		local object = objects:get(i);
		local sprite = object:getSprite()
		local props = sprite:getProperties()

		if props:Is(IsoFlagType.container) then
			local containerType = object:getContainer():getType()
			if not config.whitelist[containerType] then
				return false
			end
		end
	end

	return ISMoveableCursor_isValid(self, square)
end
