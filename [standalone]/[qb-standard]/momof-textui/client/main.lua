AddEventHandler('onClientResourceStart', function(resourceName)
  if GetCurrentResourceName() ~= resourceName then return end
  Wait(2000)
	SendNUIMessage({
		action = 'config',
		config = Config,
	})
end)

-- Exports
function ShowText(text, position, theme)
  if type(position) ~= "string" then position = "left" end
  if type(theme) ~= "string" then theme = "default" end

	SendNUIMessage({
		action = 'show',
		text = text,
		position = position,
		theme = theme,
	})
end

function HideText()
	SendNUIMessage({
		action = 'hide'
	})
end

-- Events
RegisterNetEvent('momof-textui:client:ShowText', function(text, position, theme)
	ShowText(text, position, theme)
end)

RegisterNetEvent('momof-textui:client:HideText', function()
	HideText()
end)
