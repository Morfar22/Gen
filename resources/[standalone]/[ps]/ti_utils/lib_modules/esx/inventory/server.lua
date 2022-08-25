local resName,ESX,invName = ...

local module = {}

module.registerUseableItem = function(itemName,cb)
    ESX.RegisterUsableItem(itemName,function(source,a,b,c)
        local item
 
        if invName == "mf-inventory" then
            if type(a) == "string" then
                item = c
            else
                item = b
            end
        elseif invName == "ox_inventory" then
            if type(a) == "table" then
                item = a
            else
                item = b
            end
        end

        cb(source,item,function(count)
            ti.players.removeInventoryItem(itemName,count,item.slot)
        end)
    end)
end

local oxItems

module.ensureItem = function(name,label,weight,typeof,unique,image,useable,shouldClose,combinable,description,rare,canRemove,degradeModifier)
    if invName == "mf-inventory" then
        local dbRows = exports["oxmysql"]:executeSync("SELECT * FROM items WHERE name=@name",{['@name'] = name})

        if #dbRows == 0 then
            exports["oxmysql"]:executeSync("INSERT INTO items SET name=@name,label=@label,weight=@weight,rare=@rare,can_remove=@can_remove,degrademodifier=@degrademodifier,description=@description,`unique`=@unique",{
                ['@name'] = name,
                ['@label'] = label,
                ['@weight'] = weight,
                ['@rare'] = rare,
                ['@can_remove'] = canRemove,
                ['@degrademodifier'] = degradeModifier,
                ['@description'] = description,
                ['@unique'] = unique
            })

            print("A required item ("..name..") has been added to your database, you will need to restart for this to take effect.")
        end
    elseif invName == "ox_inventory" then
        if not oxItems then
            oxItems = exports["ox_inventory"]:Items()
        end

        if not oxItems[name] then
            print("A required item ("..name..") has not been added to ox_inventory's item definitions. Check the README for more information.")
        end
    elseif invName == "default" then
        local dbRows = exports["oxmysql"]:executeSync("SELECT * FROM items WHERE name=@name",{['@name'] = name})

        if #dbRows == 0 then
            exports["oxmysql"]:executeSync("INSERT INTO items SET name=@name,label=@label,weight=@weight,rare=@rare,can_remove=@can_remove",{
                ['@name'] = name,
                ['@label'] = label,
                ['@weight'] = weight,
                ['@rare'] = rare,
                ['@can_remove'] = canRemove
            })

            print("A required item ("..name..") has been added to your database, you will need to restart for this to take effect.")
        end
    end
end

module.ensureItems = function(...)
    for i=1,select("#",...),1 do
        local t = select(i,...)
        module.ensureItem(table.unpack(t))
    end
end

return module