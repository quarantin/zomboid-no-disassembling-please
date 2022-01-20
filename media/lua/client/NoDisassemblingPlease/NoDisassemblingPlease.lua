local ISWorldMenuElements_ContextDisassemble = ISWorldMenuElements.ContextDisassemble

ISWorldMenuElements.ContextDisassemble = function()

	local instance = ISWorldMenuElements_ContextDisassemble()
	ISWorldMenuElements_disassemble = instance.disassemble

	instance.disassemble = function(data, v)

		if not SandboxVars.NoDisassemblingPlease.NoDisassembling then
			return ISWorldMenuElements_disassemble(data, v)
		end

		data.player:setHaloNote(getText("IGUI_NoDisassemblingAllowed"))
	end

	return instance
end
