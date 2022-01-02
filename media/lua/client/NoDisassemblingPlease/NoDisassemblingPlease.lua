

ISWorldMenuElements.ContextDisassemble = function()
	print("No disassembling allowed!")
end

--[[
    context.numOptions = context.numOptions - 1
    context.height = context.height - context.itemHgt
    context.scrollAreaHeight = context.scrollAreaHeight - context.itemHgt
    table.remove(context.options, 1)
--]]

--[[

ISDismantleAction_perform = ISDismantleAction.perform

ISDismantleAction.perform = function(self)
	print('Dismantling not allowed!')
	-- ISDismantleAction_perform(self)
end

ISRemoveBurntVehicle.perform = function(self)
	print('Dismantling cars not allowed!')
end

function onFillWorldObjectContextMenu(player, context, worldobjects, test)

	for i, v in pairs(context.options) do

		print('DEBUG: ' .. tostring(i) .. ' ' .. tostring(type(v)) .. ' ' .. tostring(v))

		for j, w in pairs(v) do

			print('\t ' .. tostring(j) .. ' ' .. tostring(w))
		--	for k, x in pairs(w) do

		--		print('\t\t - k = ' .. tostring(k) .. ' ' .. tostring(x))
		--	end
		end
	end

    context.numOptions = context.numOptions - 1
    context.height = context.height - context.itemHgt
    context.scrollAreaHeight = context.scrollAreaHeight - context.itemHgt
    table.remove(context.options, 1)

end

Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu)
--]]
