local function hideText()
    exports['momof-textui']:HideText()
end

local function drawText(text, position, theme)
    exports['momof-textui']:ShowText(text, position, theme)
end

local function changeText(text, position, theme)
    exports['momof-textui']:ShowText(text, position, theme)
end

local function hideText()
    exports['momof-textui']:HideText()
end

local function drawText(text, position, theme)
    exports['momof-textui']:ShowText(text, position, theme)
end

local function changeText(text, position, theme)
    exports['momof-textui']:ShowText(text, position, theme)
end

local function hideText()
    exports['momof-textui']:HideText()
end

RegisterNetEvent('qb-core:client:KeyPressed', function()
    keyPressed()
end)

exports('DrawText', drawText)
exports('ChangeText', changeText)
exports('HideText', hideText)
exports('KeyPressed', keyPressed)
