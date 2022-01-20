local NoDisassemblingPlease = require("NoDisassemblingPlease/NoDisassemblingPlease_Auth")

local ISDestroyCursor_isValid = ISDestroyCursor.isValid
function ISDestroyCursor:isValid(square)

	if NoDisassemblingPlease.allowDestroyEverywhere(self.character) or NoDisassemblingPlease.allowDestroySafehouse(self.character, square) then
		return ISDestroyCursor_isValid(self, square)
	end
end
