# QB-PRINTER
A QBCore based FiveM script for making printers workable.

---
## Description
- Take printout of real documents using in-game prop of Photocopy/Printer machine. Add printer to any location by just adding the coords of location in **config.lua** file
```lua
Config.Printer = {
    [1] = {coords = vector3(-42.3, -1749.29, 29.42), heading = 320.32, SpawnModel = true, count = 50, capacity = 100},
    
    -- Add new coord and heading 
    -- SpawnModel (spawn machine prop or not at given coords)
    -- capacity (Maximum number of A4 sheets machine can carry)
    -- count (Initial count of A4 sheets in printer, when resource start)
}
```
- Compatible with old version of QBCore as well, set it true in **config.lua** file.
```lua
Config.OldQBCore = true
```

- Supports *"okokNotify"* and *"pNotify"* for showing notification as well, set them in **config.lua** file.
```lua
Config.Notify = {
    ['QBCore'] = true, --(Default)
    ['okokNotify'] = false,
    ['pNotify'] = false,
}
```


## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [dpemotes](https://github.com/qbcore-framework/dpemotes)
- [interact-sound](https://github.com/qbcore-framework/interact-sound) (Optional if you want printing sounds. Check ogg file in assets and put that in interact-sound)

## Installation
- Drag and Drop assets file (given in assets folder) in mentioned folders

| File | Folder Path |
|------|-------------|
|printer.ogg|_interact-sound/client/html/sounds_|
|a4sheets.png|_qb-inventory/html/images_|
|printer_documents.png|_qb-inventory/html/images_|

- Add items in **shared.lua**, code snippet is given below
```lua
['printerdocument'] 			 = {['name'] = 'printerdocument', 				['label'] = 'Document', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'printer_documents.png', 	['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A nice document'},
["a4sheets"] 			 		 = {["name"] = "a4sheets", 						["label"] = "A4Sheets Pack", 			["weight"] = 2000, 		["type"] = "item", 		["image"] = "a4sheets.png", 		    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A bundle of 20 A4 Sheets"},
```
- Update **FormatItemInfo()** function in  _qb-inventory/html/js/**app.js**_ file as mentioned in code snippet
```javascript
function FormatItemInfo(itemData) {

    //Add else if condition for printerdocument item
    else if (itemData.name == "printerdocument") {
        $(".item-info-title").html('<p>'+itemData.label+'</p>')
        $(".item-info-description").html('<p>'+itemData.info.name+'</p><br/>');
    }

}
```

>Note: For any queries or help regarding installation, [Join our Discord](https://discord.gg/t6DTN3Q).

## Showcase

Checkout this video

[![qb-printer](https://cdn.discordapp.com/attachments/920981125856374785/921097121137041508/unknown.png)](https://youtu.be/eku1J2xxsQI)












