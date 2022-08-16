Config = Config or {}

-- This config determines if a enclosed key like `[E]` should automatically be displayed as a key in the UI. If you 
-- disable this, keys will be displayed as text.
Config.allowKBD = true

-- Theme Attributes:
-- backgroundColor: accepts RGB, RGBA, HEX, or HTML color codes and will be the background color of the UI.
-- color: accepts RGB, RGBA, HEX, or HTML color codes and will be the text color on the UI.
-- top: accepts percentage, or pixels and is the distance away from the top of the screen the notification will show up.

-- Global theme that will apply to all of the custom themes below. Custom themes with the same attributes overwrite the
-- global theme's attribute.
Config.globalTheme = {
  top = "40%",
}

-- Color themes for the text color and background color
-- WARNING: ALWAYS KEEP A DEFAULT THEME, you may modify it but make sure you have a theme that is named 'default'.
Config.themes = {
  ['default'] = {
    backgroundColor = 'rgba(23, 23, 23, 90%)',
    color = 'white',
  },
  ['DefaultDoorTheme'] = {
    backgroundColor = 'rgb(19, 28, 74)',
    color = 'white',
  },
  ['LockedDoorTheme'] = {
    backgroundColor = 'rgb(219 58 58)',
    color = 'white',
  },
  ['UnlockedDoorTheme'] = {
    backgroundColor = 'rgb(27 195 63)',
    color = 'white',
  },
}