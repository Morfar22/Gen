local QBCore = select(2,...)

local module = {}

module.registerUseableItem = function(itemName,cb)
    QBCore.Functions.CreateUseableItem(itemName,function(source,item)
        cb(source,{
            name = item.name,
            label = item.label,
            weight = item.weight,
            count = item.count or item.amount,
            metadata = item.metadata or item.data or item.info,
            slot = item.slot
        },function(count)
            ti.players.removeInventoryItem(itemName,count,item.slot)
        end)
    end)
end

module.ensureItem = function(name,label,weight,typeof,unique,image,useable,shouldClose,combinable,description,rare,canRemove,degradeModifier)
    if not QBCore.Shared.Items[name] then
        QBCore.Functions.AddItem(name,{            
            ['name'] = name,             
            ['label'] = label,          
            ['weight'] = weight,     
            ['type'] = typeof,    
            ['image'] = image,       
            ['unique'] = unique,    
            ['useable'] = useable,   
            ['shouldClose'] = shouldClose,    
            ['combinable'] = combinable,   
            ['description'] = description
        })
    end
end

module.ensureItems = function(...)
    for i=1,select("#",...),1 do
        local t = select(i,...)
        module.ensureItem(table.unpack(t))
    end
end

return module