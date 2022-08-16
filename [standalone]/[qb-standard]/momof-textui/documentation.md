# Momof-TextUI Documentation
For easier access and ability for other developers to build on this, I have created a guide and exported events that are not used in the script for easier access building on top of the script.

## Client Events
- `momof-textui:client:ShowText`  
Sets the TextUI with the provided text, position, and theme. Omitting the position or theme will default to show on the left with the `default` theme  
Example Server Call: `TriggerClientEvent('momof-textui:client:ShowText', src, 'Hello World!, 'left', 'default')`  
Example Client Call: `TriggerEvent('momof-textui:client:ShowText', 'Hello World!, 'left', 'default')`  

- `momof-textui:client:HideText`  
Closes the current TextUI open.  
Example Server Call: `TriggerClientEvent('momof-textui:client:HideText', src)`  
Example Client Call: `TriggerEvent('momof-textui:client:HideText')`  

---

## Client Exports
- `ShowText`  
Opens the TextUI with the provided text, at the position, with the theme. Omitting the position or theme will default to show on the left with the `default` theme  
Example Call: `exports['momof-multijob']:ShowText('Hello World!, 'left', 'default')`  

- `HideText`  
Closes the current TextUI open.  
Example Call: `exports['momof-multijob']:HideText()`  

---

## Script Transitions Instructions
### QB-Core drawtext
After making this change, all default QBCore notifies will use this TextUI instead (this means you can use `exports['qb-core']:DrawText(...)` the same way you would `exports['momof-multijob']:ShowText(...)`). In `qb-core > client > drawtext.lua` replace the `hideText`, `drawText`, and `changeText` functions with the following:  

```
local function hideText()
    exports['momof-textui']:HideText()
end

local function drawText(text, position, theme)
    exports['momof-textui']:ShowText(text, position, theme)
end

local function changeText(text, position, theme)
    exports['momof-textui']:ShowText(text, position, theme)
end
```
### QB-Doorlock
This will change door locks to use this TextUI instead. I have also included the 3 default themes that come with qb-doorlock in the config. In `qb-doorlock > client > main.lua` replace the `displayNUIText` and `hideNUI` with the below:   

```
local function displayNUIText(text)
  local themeName = Config.ChangeColor and (closestDoor.data.locked and "LockedDoorTheme" or "UnlockedDoorTheme") or "DefaultDoorTheme"
  exports['momof-textui']:ShowText(text, "left", themeName)
end

local function hideNUI()
  exports['momof-textui']:HideText()
end
```