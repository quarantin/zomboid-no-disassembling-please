local NoDisassemblingPlease = require('NoDisassemblingPlease/NoDisassemblingPlease_Config')

NoDisassemblingPlease.ISMoveableCursor_isValid = ISMoveableCursor.isValid
ISMoveableCursor.isValid = function(self, square)

	local objects = square:getObjects()
	for i = 0, objects:size() - 1 do

		local object = objects:get(i)
		if not NoDisassemblingPlease.allowDisassembling(object) then
			return false
		end
	end

	return NoDisassemblingPlease.ISMoveableCursor_isValid(self, square)
end
