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
function ISMoveableCursor:isValid(square)

	if SandboxVars.NoDisassemblingPlease.NoDisassembling then

		if ISMoveableCursor.mode[self.player] == "scrap" then
			return false
		end
	end

	if SandboxVars.NoDisassemblingPlease.NoPickingUp then

		local objects = self.objectListCache or self:getObjectList()
		local object = objects[self.objectIndex]
		if object and object.object and object.object.getSprite then
			object = object.object
			local props = object:getSprite():getProperties()
			if props:Is(IsoFlagType.container) then
				local containerType = object:getContainer():getType()
				if not NoPickingUpPlease.whitelist[containerType] and not props:Is(IsoFlagType.attachedSurface) then
					NoPickingUpPlease.ISMoveableCursor_isValid(self, square)
					return false
				end
			end
		end
	end

	return NoPickingUpPlease.ISMoveableCursor_isValid(self, square)
end
