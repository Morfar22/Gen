local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
ESX = nil
QS = nil
L0_1 = Config
L0_1 = L0_1.Framework
if "ESX" == L0_1 then
  L0_1 = TriggerEvent
  L1_1 = Config
  L1_1 = L1_1.getSharedObject
  function L2_1(A0_2)
    local L1_2
    ESX = A0_2
  end
  L0_1(L1_1, L2_1)
  L0_1 = TriggerEvent
  L1_1 = "qs-core:getSharedObject"
  function L2_1(A0_2)
    local L1_2
    QS = A0_2
  end
  L0_1(L1_1, L2_1)
  L0_1 = print
  L1_1 = "^4[qs-inventory] ^2The ESX version of Quasar Inventory is running.^0"
  L0_1(L1_1)
else
  L0_1 = Config
  L0_1 = L0_1.Framework
  if "QBCore" == L0_1 then
    L0_1 = exports
    L0_1 = L0_1["qb-core"]
    L1_1 = L0_1
    L0_1 = L0_1.GetCoreObject
    L0_1 = L0_1(L1_1)
    QBCore = L0_1
    L0_1 = print
    L1_1 = "^4[qs-inventory] ^2The QBCore version of Quasar Inventory is running.^0"
    L0_1(L1_1)
  end
end
L0_1 = {}
Drops = L0_1
L0_1 = {}
Trunks = L0_1
L0_1 = {}
Gloveboxes = L0_1
L0_1 = {}
Stashes = L0_1
L0_1 = {}
SellItems = L0_1
L0_1 = {}
ShopItems = L0_1
L0_1 = {}
GarbageItems = L0_1
L0_1 = {}
OpenedInventory = L0_1
L0_1 = CreateThread
function L1_1()
  local L0_2, L1_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = Config
    L1_2 = L1_2.GarbageRefreshTime
    L0_2(L1_2)
    L0_2 = {}
    GarbageItems = L0_2
    L0_2 = print
    L1_2 = "^4[qs-inventory] ^2Trash cans have been updated.^0"
    L0_2(L1_2)
  end
end
L0_1(L1_1)
L0_1 = CreateThread
function L1_1()
  local L0_2, L1_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = Config
    L1_2 = L1_2.DropRefreshTime
    L0_2(L1_2)
    L0_2 = {}
    Drops = L0_2
    L0_2 = print
    L1_2 = "^4[qs-inventory] ^2All drops were eliminated.^0"
    L0_2(L1_2)
  end
end
L0_1(L1_1)
L0_1 = RegisterServerEvent
L1_1 = "inventory:server:LoadDrops"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "inventory:server:LoadDrops"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = source
  L1_2 = next
  L2_2 = Drops
  L1_2 = L1_2(L2_2)
  if nil ~= L1_2 then
    L1_2 = TriggerClientEvent
    L2_2 = "inventory:client:AddDropItem"
    L3_2 = -1
    L4_2 = dropId
    L5_2 = source
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = TriggerClientEvent
    L2_2 = "inventory:client:AddDropItem"
    L3_2 = L0_2
    L4_2 = Drops
    L1_2(L2_2, L3_2, L4_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "playerDropped"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = Config
  L0_2 = L0_2.Framework
  if "ESX" == L0_2 then
    L0_2 = source
    L1_2 = QS
    L1_2 = L1_2.GetPlayerFromId
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L2_2 = pairs
      L3_2 = Trunks
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = L7_2.isOpen
        if L8_2 then
          L8_2 = L7_2.isOpen
          if L8_2 == L0_2 then
            L8_2 = TriggerEvent
            L9_2 = "inventory:server:SaveInventory:Internal"
            L10_2 = L0_2
            L11_2 = "trunk"
            L12_2 = L6_2
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
        end
      end
      L2_2 = pairs
      L3_2 = Gloveboxes
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = L7_2.isOpen
        if L8_2 then
          L8_2 = L7_2.isOpen
          if L8_2 == L0_2 then
            L8_2 = TriggerEvent
            L9_2 = "inventory:server:SaveInventory:Internal"
            L10_2 = L0_2
            L11_2 = "glovebox"
            L12_2 = L6_2
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
        end
      end
      L2_2 = pairs
      L3_2 = Stashes
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = L7_2.isOpen
        if L8_2 then
          L8_2 = L7_2.isOpen
          if L8_2 == L0_2 then
            L8_2 = TriggerEvent
            L9_2 = "inventory:server:SaveInventory:Internal"
            L10_2 = L0_2
            L11_2 = "stash"
            L12_2 = L6_2
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
        end
      end
      L2_2 = pairs
      L3_2 = Drops
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = L7_2.isOpen
        if L8_2 then
          L8_2 = L7_2.isOpen
          if L8_2 == L0_2 then
            L8_2 = TriggerEvent
            L9_2 = "inventory:server:SaveInventory:Internal"
            L10_2 = L0_2
            L11_2 = "drop"
            L12_2 = L6_2
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
        end
      end
    end
  else
    L0_2 = Config
    L0_2 = L0_2.Framework
    if "QBCore" == L0_2 then
      L0_2 = source
      L1_2 = QBCore
      L1_2 = L1_2.Functions
      L1_2 = L1_2.GetPlayer
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L2_2 = pairs
        L3_2 = Trunks
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = L7_2.isOpen
          if L8_2 then
            L8_2 = L7_2.isOpen
            if L8_2 == L0_2 then
              L8_2 = TriggerEvent
              L9_2 = "inventory:server:SaveInventory:Internal"
              L10_2 = L0_2
              L11_2 = "trunk"
              L12_2 = L6_2
              L8_2(L9_2, L10_2, L11_2, L12_2)
            end
          end
        end
        L2_2 = pairs
        L3_2 = Gloveboxes
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = L7_2.isOpen
          if L8_2 then
            L8_2 = L7_2.isOpen
            if L8_2 == L0_2 then
              L8_2 = TriggerEvent
              L9_2 = "inventory:server:SaveInventory:Internal"
              L10_2 = L0_2
              L11_2 = "glovebox"
              L12_2 = L6_2
              L8_2(L9_2, L10_2, L11_2, L12_2)
            end
          end
        end
        L2_2 = pairs
        L3_2 = Stashes
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = L7_2.isOpen
          if L8_2 then
            L8_2 = L7_2.isOpen
            if L8_2 == L0_2 then
              L8_2 = TriggerEvent
              L9_2 = "inventory:server:SaveInventory:Internal"
              L10_2 = L0_2
              L11_2 = "stash"
              L12_2 = L6_2
              L8_2(L9_2, L10_2, L11_2, L12_2)
            end
          end
        end
        L2_2 = pairs
        L3_2 = Drops
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = L7_2.isOpen
          if L8_2 then
            L8_2 = L7_2.isOpen
            if L8_2 == L0_2 then
              L8_2 = TriggerEvent
              L9_2 = "inventory:server:SaveInventory:Internal"
              L10_2 = L0_2
              L11_2 = "drop"
              L12_2 = L6_2
              L8_2(L9_2, L10_2, L11_2, L12_2)
            end
          end
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "inventory:server:SaveInventory:Internal"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = A0_2
  if "trunk" == A1_2 then
    L4_2 = Trunks
    L4_2 = L4_2[A2_2]
    if L4_2 then
      L4_2 = Trunks
      L4_2 = L4_2[A2_2]
      L4_2 = L4_2.isOpen
      if L4_2 == L3_2 then
        L4_2 = SaveOwnedVehicleItems
        L5_2 = A2_2
        L6_2 = Trunks
        L6_2 = L6_2[A2_2]
        L6_2 = L6_2.items
        L4_2(L5_2, L6_2)
      end
    end
  elseif "glovebox" == A1_2 then
    L4_2 = Gloveboxes
    L4_2 = L4_2[A2_2]
    if L4_2 then
      L4_2 = Gloveboxes
      L4_2 = L4_2[A2_2]
      L4_2 = L4_2.isOpen
      if L4_2 == L3_2 then
        L4_2 = SaveOwnedGloveboxItems
        L5_2 = A2_2
        L6_2 = Gloveboxes
        L6_2 = L6_2[A2_2]
        L6_2 = L6_2.items
        L4_2(L5_2, L6_2)
      end
    end
  elseif "stash" == A1_2 then
    L4_2 = Stashes
    L4_2 = L4_2[A2_2]
    if L4_2 then
      L4_2 = Stashes
      L4_2 = L4_2[A2_2]
      L4_2 = L4_2.isOpen
      if L4_2 == L3_2 then
        L4_2 = SaveStashItems
        L5_2 = A2_2
        L6_2 = Stashes
        L6_2 = L6_2[A2_2]
        L6_2 = L6_2.items
        L4_2(L5_2, L6_2)
      end
    end
  elseif "drop" == A1_2 then
    L4_2 = Drops
    L4_2 = L4_2[A2_2]
    if L4_2 then
      L4_2 = Drops
      L4_2 = L4_2[A2_2]
      L4_2 = L4_2.isOpen
      if L4_2 == L3_2 then
        L4_2 = Drops
        L4_2 = L4_2[A2_2]
        L4_2.isOpen = false
        L4_2 = Drops
        L4_2 = L4_2[A2_2]
        L4_2 = L4_2.items
        if nil ~= L4_2 then
          L4_2 = next
          L5_2 = Drops
          L5_2 = L5_2[A2_2]
          L5_2 = L5_2.items
          L4_2 = L4_2(L5_2)
          if nil ~= L4_2 then
            goto lbl_89
          end
        end
        L4_2 = Drops
        L4_2[A2_2] = nil
        L4_2 = TriggerClientEvent
        L5_2 = "inventory:client:RemoveDropItem"
        L6_2 = -1
        L7_2 = A2_2
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
  ::lbl_89::
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "inventory:server:combineItem"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "inventory:server:combineItem"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = source
    L4_2 = ESX
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = QS
    L5_2 = L5_2.GetPlayerFromId
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    if A0_2 and A1_2 and A2_2 then
      L6_2 = QS
      L6_2 = L6_2.Shared
      L6_2 = L6_2.Items
      L8_2 = A0_2
      L7_2 = A0_2.lower
      L7_2 = L7_2(L8_2)
      L6_2 = L6_2[L7_2]
      if L6_2 then
        L6_2 = QS
        L6_2 = L6_2.Shared
        L6_2 = L6_2.Items
        L8_2 = A1_2
        L7_2 = A1_2.lower
        L7_2 = L7_2(L8_2)
        L6_2 = L6_2[L7_2]
        if L6_2 then
          L6_2 = QS
          L6_2 = L6_2.Shared
          L6_2 = L6_2.Items
          L8_2 = A2_2
          L7_2 = A2_2.lower
          L7_2 = L7_2(L8_2)
          L6_2 = L6_2[L7_2]
          if L6_2 then
            L6_2 = QS
            L6_2 = L6_2.Shared
            L6_2 = L6_2.Items
            L8_2 = A2_2
            L7_2 = A2_2.lower
            L7_2 = L7_2(L8_2)
            L6_2 = L6_2[L7_2]
            L6_2 = L6_2.combinable
            if L6_2 then
              L6_2 = L4_2.getInventoryItem
              L8_2 = A1_2
              L7_2 = A1_2.lower
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2)
              L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
              L6_2 = L6_2.count
              L7_2 = L4_2.getInventoryItem
              L9_2 = A2_2
              L8_2 = A2_2.lower
              L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
              L7_2 = L7_2.count
              if L6_2 >= 1 and L7_2 >= 1 then
                L8_2 = L5_2.addItem
                L9_2 = A0_2
                L10_2 = 1
                L8_2 = L8_2(L9_2, L10_2)
                if L8_2 then
                  L8_2 = L5_2.removeItem
                  L9_2 = A1_2
                  L10_2 = 1
                  L8_2(L9_2, L10_2)
                  L8_2 = L5_2.removeItem
                  L9_2 = A2_2
                  L10_2 = 1
                  L8_2(L9_2, L10_2)
                  L8_2 = TriggerClientEvent
                  L9_2 = "inventory:client:combineItem:ItemBox"
                  L10_2 = L3_2
                  L11_2 = A0_2
                  L8_2(L9_2, L10_2, L11_2)
                else
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:sendMessage"
                  L10_2 = _ply
                  L11_2 = Lang
                  L12_2 = "NO_MORE_SPACE"
                  L11_2 = L11_2(L12_2)
                  L12_2 = "error"
                  L8_2(L9_2, L10_2, L11_2, L12_2)
                end
              end
            else
              L6_2 = print
              L7_2 = "qs-inventory: try to combine an item its not combinable"
              L6_2(L7_2)
            end
          end
        end
      end
    else
      L6_2 = print
      L7_2 = "qs-inventory: try to combine and item that doesnt exist"
      L6_2(L7_2)
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = source
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if A0_2 and A1_2 and A2_2 then
        L5_2 = QBCore
        L5_2 = L5_2.Shared
        L5_2 = L5_2.Items
        L7_2 = A0_2
        L6_2 = A0_2.lower
        L6_2 = L6_2(L7_2)
        L5_2 = L5_2[L6_2]
        if L5_2 then
          L5_2 = QBCore
          L5_2 = L5_2.Shared
          L5_2 = L5_2.Items
          L7_2 = A1_2
          L6_2 = A1_2.lower
          L6_2 = L6_2(L7_2)
          L5_2 = L5_2[L6_2]
          if L5_2 then
            L5_2 = QBCore
            L5_2 = L5_2.Shared
            L5_2 = L5_2.Items
            L7_2 = A2_2
            L6_2 = A2_2.lower
            L6_2 = L6_2(L7_2)
            L5_2 = L5_2[L6_2]
            if L5_2 then
              L5_2 = QBCore
              L5_2 = L5_2.Shared
              L5_2 = L5_2.Items
              L7_2 = A2_2
              L6_2 = A2_2.lower
              L6_2 = L6_2(L7_2)
              L5_2 = L5_2[L6_2]
              L5_2 = L5_2.combinable
              if L5_2 then
                L5_2 = L4_2.Functions
                L5_2 = L5_2.GetItemByName
                L6_2 = A1_2
                L5_2 = L5_2(L6_2)
                L6_2 = L4_2.Functions
                L6_2 = L6_2.GetItemByName
                L7_2 = A2_2
                L6_2 = L6_2(L7_2)
                if L5_2 and L6_2 then
                  L7_2 = L5_2.amount
                  if L7_2 >= 1 then
                    L7_2 = L6_2.amount
                    if L7_2 >= 1 then
                      L7_2 = L4_2.Functions
                      L7_2 = L7_2.AddItem
                      L8_2 = A0_2
                      L9_2 = 1
                      L7_2 = L7_2(L8_2, L9_2)
                      if L7_2 then
                        L7_2 = L4_2.Functions
                        L7_2 = L7_2.RemoveItem
                        L8_2 = A1_2
                        L9_2 = 1
                        L7_2(L8_2, L9_2)
                        L7_2 = L4_2.Functions
                        L7_2 = L7_2.RemoveItem
                        L8_2 = A2_2
                        L9_2 = 1
                        L7_2(L8_2, L9_2)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "inventory:server:UseItem"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "inventory:server:UseItem"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = source
    L3_2 = QS
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if "player" == A0_2 or "hotbar" == A0_2 then
      L4_2 = L3_2.GetItemBySlot
      L5_2 = A1_2.slot
      L4_2 = L4_2(L5_2)
      if nil ~= L4_2 then
        L5_2 = TriggerClientEvent
        L6_2 = "qs-core:useItem"
        L7_2 = L2_2
        L8_2 = L4_2
        L5_2(L6_2, L7_2, L8_2)
      end
      L5_2 = A1_2.name
      if "vehiclekeys" == L5_2 then
        L5_2 = TriggerClientEvent
        L6_2 = "qs-vehiclekeys:client:vehicleControl"
        L7_2 = L2_2
        L8_2 = L4_2.info
        L8_2 = L8_2.vPlate
        L5_2(L6_2, L7_2, L8_2)
      end
    end
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = source
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      if "player" == A0_2 or "hotbar" == A0_2 then
        L4_2 = L3_2.Functions
        L4_2 = L4_2.GetItemBySlot
        L5_2 = A1_2.slot
        L4_2 = L4_2(L5_2)
        if nil ~= L4_2 then
          L5_2 = TriggerClientEvent
          L6_2 = "QBCore:Client:UseItem"
          L7_2 = L2_2
          L8_2 = L4_2
          L5_2(L6_2, L7_2, L8_2)
        end
        L5_2 = A1_2.name
        if "backpack" == L5_2 then
          L5_2 = TriggerClientEvent
          L6_2 = "inventory:useBag"
          L7_2 = L2_2
          L8_2 = L4_2.info
          L8_2 = L8_2.id
          L5_2(L6_2, L7_2, L8_2)
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "inventory:server:addItem"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = A0_2
    L4_2 = QS
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = QS
    L5_2 = L5_2.Shared
    L5_2 = L5_2.Items
    L6_2 = tostring
    L7_2 = A1_2
    L6_2 = L6_2(L7_2)
    L7_2 = L6_2
    L6_2 = L6_2.lower
    L6_2 = L6_2(L7_2)
    L5_2 = L5_2[L6_2]
    L6_2 = L4_2.addItem
    L7_2 = A1_2
    L8_2 = A2_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L6_2 = TriggerClientEvent
      L7_2 = "inventory:client:ItemBox"
      L8_2 = L3_2
      L9_2 = QS
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L10_2 = L5_2.name
      L9_2 = L9_2[L10_2]
      L10_2 = "add"
      L6_2(L7_2, L8_2, L9_2, L10_2)
    else
      L6_2 = TriggerClientEvent
      L7_2 = "qs-inventory:sendMessage"
      L8_2 = L3_2
      L9_2 = Lang
      L10_2 = "NO_MORE_SPACE"
      L9_2 = L9_2(L10_2)
      L10_2 = "error"
      L6_2(L7_2, L8_2, L9_2, L10_2)
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = A0_2
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = QBCore
      L5_2 = L5_2.Functions
      L5_2 = L5_2.GetPlayer
      L6_2 = src
      L5_2 = L5_2(L6_2)
      L6_2 = QBCore
      L6_2 = L6_2.Shared
      L6_2 = L6_2.Items
      L7_2 = tostring
      L8_2 = A1_2
      L7_2 = L7_2(L8_2)
      L8_2 = L7_2
      L7_2 = L7_2.lower
      L7_2 = L7_2(L8_2)
      L6_2 = L6_2[L7_2]
      L7_2 = L4_2.Functions
      L7_2 = L7_2.AddItem
      L8_2 = A1_2
      L9_2 = A2_2
      L7_2 = L7_2(L8_2, L9_2)
      if L7_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "inventory:client:ItemBox"
        L9_2 = L3_2
        L10_2 = QBCore
        L10_2 = L10_2.Shared
        L10_2 = L10_2.Items
        L11_2 = L6_2.name
        L10_2 = L10_2[L11_2]
        L11_2 = "add"
        L7_2(L8_2, L9_2, L10_2, L11_2)
      else
        L7_2 = TriggerClientEvent
        L8_2 = "qs-inventory:sendMessage"
        L9_2 = source
        L10_2 = Lang
        L11_2 = "NO_MORE_SPACE"
        L10_2 = L10_2(L11_2)
        L11_2 = "error"
        L7_2(L8_2, L9_2, L10_2, L11_2)
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "inventory:server:addItem:weapon"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = A0_2
    L4_2 = QS
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = QS
    L5_2 = L5_2.Shared
    L5_2 = L5_2.Items
    L6_2 = tostring
    L7_2 = A1_2
    L6_2 = L6_2(L7_2)
    L7_2 = L6_2
    L6_2 = L6_2.lower
    L6_2 = L6_2(L7_2)
    L5_2 = L5_2[L6_2]
    if L5_2 then
      L6_2 = L5_2.type
      if "weapon" == L6_2 then
        L6_2 = L4_2.addItem
        L7_2 = A1_2
        L8_2 = A2_2
        L6_2 = L6_2(L7_2, L8_2)
        if L6_2 then
          L6_2 = TriggerClientEvent
          L7_2 = "inventory:client:ItemBox"
          L8_2 = L3_2
          L9_2 = QS
          L9_2 = L9_2.Shared
          L9_2 = L9_2.Items
          L10_2 = L5_2.name
          L9_2 = L9_2[L10_2]
          L10_2 = "add"
          L6_2(L7_2, L8_2, L9_2, L10_2)
        else
          L6_2 = TriggerClientEvent
          L7_2 = "qs-inventory:sendMessage"
          L8_2 = L3_2
          L9_2 = Lang
          L10_2 = "NO_MORE_SPACE"
          L9_2 = L9_2(L10_2)
          L10_2 = "error"
          L6_2(L7_2, L8_2, L9_2, L10_2)
        end
      end
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = A0_2
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = src
      L4_2 = L4_2(L5_2)
      L5_2 = QBCore
      L5_2 = L5_2.Shared
      L5_2 = L5_2.Items
      L6_2 = tostring
      L7_2 = A1_2
      L6_2 = L6_2(L7_2)
      L7_2 = L6_2
      L6_2 = L6_2.lower
      L6_2 = L6_2(L7_2)
      L5_2 = L5_2[L6_2]
      if L5_2 then
        L6_2 = L5_2.type
        if "weapon" == L6_2 then
          L6_2 = L4_2.Functions
          L6_2 = L6_2.addItem
          L7_2 = A1_2
          L8_2 = A2_2
          L6_2 = L6_2(L7_2, L8_2)
          if L6_2 then
            L6_2 = TriggerClientEvent
            L7_2 = "inventory:client:ItemBox"
            L8_2 = L3_2
            L9_2 = QBCore
            L9_2 = L9_2.Shared
            L9_2 = L9_2.Items
            L10_2 = L5_2.name
            L9_2 = L9_2[L10_2]
            L10_2 = "add"
            L6_2(L7_2, L8_2, L9_2, L10_2)
          else
            L6_2 = TriggerClientEvent
            L7_2 = "qs-inventory:sendMessage"
            L8_2 = L3_2
            L9_2 = Lang
            L10_2 = "NO_MORE_SPACE"
            L9_2 = L9_2(L10_2)
            L10_2 = "error"
            L6_2(L7_2, L8_2, L9_2, L10_2)
          end
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "inventory:server:removeItem"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = A0_2
    L4_2 = QS
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = ESX
      L5_2 = L5_2.GetPlayerFromId
      L6_2 = src
      L5_2 = L5_2(L6_2)
      L6_2 = QS
      L6_2 = L6_2.Shared
      L6_2 = L6_2.Items
      L7_2 = tostring
      L8_2 = A1_2
      L7_2 = L7_2(L8_2)
      L8_2 = L7_2
      L7_2 = L7_2.lower
      L7_2 = L7_2(L8_2)
      L6_2 = L6_2[L7_2]
      L7_2 = TriggerClientEvent
      L8_2 = "inventory:client:ItemBox"
      L9_2 = L3_2
      L10_2 = QS
      L10_2 = L10_2.Shared
      L10_2 = L10_2.Items
      L11_2 = L6_2.name
      L10_2 = L10_2[L11_2]
      L11_2 = "remove"
      L7_2(L8_2, L9_2, L10_2, L11_2)
      L7_2 = L4_2.removeItem
      L8_2 = A1_2
      L9_2 = A2_2
      L7_2(L8_2, L9_2)
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = A0_2
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = QBCore
      L5_2 = L5_2.Shared
      L5_2 = L5_2.Items
      L6_2 = tostring
      L7_2 = A1_2
      L6_2 = L6_2(L7_2)
      L7_2 = L6_2
      L6_2 = L6_2.lower
      L6_2 = L6_2(L7_2)
      L5_2 = L5_2[L6_2]
      L6_2 = TriggerClientEvent
      L7_2 = "inventory:client:ItemBox"
      L8_2 = L3_2
      L9_2 = QBCore
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L10_2 = L5_2.name
      L9_2 = L9_2[L10_2]
      L10_2 = "remove"
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L6_2 = L4_2.Functions
      L6_2 = L6_2.RemoveItem
      L7_2 = A1_2
      L8_2 = A2_2
      L6_2(L7_2, L8_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "inventory:server:SetIsOpenState"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "inventory:server:SetIsOpenState"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2
  if not A0_2 then
    if "stash" == A1_2 then
      L3_2 = Stashes
      L3_2 = L3_2[A2_2]
      L3_2.isOpen = false
    elseif "trunk" == A1_2 then
      L3_2 = Trunks
      L3_2 = L3_2[A2_2]
      L3_2.isOpen = false
    elseif "glovebox" == A1_2 then
      L3_2 = Gloveboxes
      L3_2 = L3_2[A2_2]
      L3_2.isOpen = false
    elseif "drop" == A1_2 then
      L3_2 = Drops
      L3_2 = L3_2[A2_2]
      L3_2.isOpen = false
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "inventory:server:OpenInventory"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "inventory:server:OpenInventory"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = source
    L4_2 = QS
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = ESX
    L5_2 = L5_2.GetPlayerFromId
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L6_2 = OpenedInventory
    L6_2[L3_2] = true
    if nil ~= A0_2 and nil ~= A1_2 then
      L6_2 = {}
      if "stash" == A0_2 then
        L7_2 = Stashes
        L7_2 = L7_2[A1_2]
        if nil ~= L7_2 then
          L7_2 = Stashes
          L7_2 = L7_2[A1_2]
          L7_2 = L7_2.isOpen
          if L7_2 then
            L7_2 = QS
            L7_2 = L7_2.GetPlayerFromId
            L8_2 = Stashes
            L8_2 = L8_2[A1_2]
            L8_2 = L8_2.isOpen
            L7_2 = L7_2(L8_2)
            if nil ~= L7_2 then
              L8_2 = TriggerClientEvent
              L9_2 = "inventory:client:CheckOpenState"
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L10_2 = L10_2.isOpen
              L11_2 = A0_2
              L12_2 = A1_2
              L13_2 = Stashes
              L13_2 = L13_2[A1_2]
              L13_2 = L13_2.label
              L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
            else
              L8_2 = Stashes
              L8_2 = L8_2[A1_2]
              L8_2.isOpen = false
            end
          end
        end
        L7_2 = Config
        L7_2 = L7_2.StashWeight
        L8_2 = Config
        L8_2 = L8_2.StashSlots
        if nil ~= A2_2 then
          L9_2 = A2_2.maxweight
          if nil ~= L9_2 then
            L9_2 = A2_2.maxweight
            if L9_2 then
              goto lbl_70
              L7_2 = L9_2 or L7_2
            end
          end
          L9_2 = Config
          L7_2 = L9_2.StashWeight
          ::lbl_70::
          L9_2 = A2_2.slots
          if nil ~= L9_2 then
            L9_2 = A2_2.slots
            if L9_2 then
              goto lbl_78
              L8_2 = L9_2 or L8_2
            end
          end
          L9_2 = Config
          L8_2 = L9_2.StashSlots
        end
        ::lbl_78::
        L6_2.maxweight = L7_2
        L6_2.slots = L8_2
        L9_2 = "stash-"
        L10_2 = A1_2
        L9_2 = L9_2 .. L10_2
        L6_2.name = L9_2
        L9_2 = Lang
        L10_2 = "STASH_LABEL"
        L9_2 = L9_2(L10_2)
        L10_2 = A1_2
        L9_2 = L9_2 .. L10_2
        L6_2.label = L9_2
        L9_2 = {}
        L6_2.inventory = L9_2
        L9_2 = Stashes
        L9_2 = L9_2[A1_2]
        if nil ~= L9_2 then
          L9_2 = Stashes
          L9_2 = L9_2[A1_2]
          L9_2 = L9_2.isOpen
          if L9_2 then
            L9_2 = TriggerClientEvent
            L10_2 = "qs-inventory:sendMessage"
            L11_2 = L3_2
            L12_2 = Lang
            L13_2 = "INVENTORY_ALREADY_OPENED"
            L12_2 = L12_2(L13_2)
            L13_2 = "error"
            L9_2(L10_2, L11_2, L12_2, L13_2)
            L9_2 = TriggerClientEvent
            L10_2 = "qs-inventory:closeInventory"
            L11_2 = L3_2
            L9_2(L10_2, L11_2)
            return
        end
        else
          L9_2 = GetStashItems
          L10_2 = A1_2
          L9_2 = L9_2(L10_2)
          if "Invalid" == L9_2 then
            return
          end
          L10_2 = next
          L11_2 = L9_2
          L10_2 = L10_2(L11_2)
          if nil ~= L10_2 then
            L10_2 = Stashes
            L10_2 = L10_2[A1_2]
            if L10_2 then
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L10_2 = L10_2.isOpen
              if not L10_2 then
                L6_2.inventory = L9_2
                L10_2 = Stashes
                L11_2 = {}
                L10_2[A1_2] = L11_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2.items = L9_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2.isOpen = L3_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L11_2 = L6_2.label
                L10_2.label = L11_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L11_2 = L6_2.maxweight
                L10_2.maxweight = L11_2
              else
                L10_2 = TriggerClientEvent
                L11_2 = "qs-inventory:sendMessage"
                L12_2 = L3_2
                L13_2 = Lang
                L14_2 = "INVENTORY_ALREADY_OPENED"
                L13_2 = L13_2(L14_2)
                L14_2 = "error"
                L10_2(L11_2, L12_2, L13_2, L14_2)
                L10_2 = TriggerClientEvent
                L11_2 = "qs-inventory:closeInventory"
                L12_2 = L3_2
                L10_2(L11_2, L12_2)
                return
              end
            else
              L6_2.inventory = L9_2
              L10_2 = Stashes
              L11_2 = {}
              L10_2[A1_2] = L11_2
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L10_2.items = L9_2
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L10_2.isOpen = L3_2
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L11_2 = L6_2.label
              L10_2.label = L11_2
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L11_2 = L6_2.maxweight
              L10_2.maxweight = L11_2
            end
          else
            L10_2 = Stashes
            L10_2 = L10_2[A1_2]
            if nil ~= L10_2 then
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L10_2 = L10_2.isOpen
              if not L10_2 then
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2.isOpen = L3_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2 = L10_2.items
                L6_2.inventory = L10_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L11_2 = L6_2.label
                L10_2.label = L11_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L11_2 = L6_2.maxweight
                L10_2.maxweight = L11_2
              else
                L10_2 = TriggerClientEvent
                L11_2 = "qs-inventory:sendMessage"
                L12_2 = L3_2
                L13_2 = Lang
                L14_2 = "INVENTORY_ALREADY_OPENED"
                L13_2 = L13_2(L14_2)
                L14_2 = "error"
                L10_2(L11_2, L12_2, L13_2, L14_2)
                L10_2 = TriggerClientEvent
                L11_2 = "qs-inventory:closeInventory"
                L12_2 = L3_2
                L10_2(L11_2, L12_2)
                return
              end
            else
              L10_2 = Stashes
              L11_2 = {}
              L10_2[A1_2] = L11_2
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L10_2.isOpen = L3_2
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L11_2 = {}
              L10_2.items = L11_2
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L11_2 = L6_2.label
              L10_2.label = L11_2
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              L11_2 = L6_2.maxweight
              L10_2.maxweight = L11_2
            end
          end
        end
      elseif "trunk" == A0_2 then
        L7_2 = Trunks
        L7_2 = L7_2[A1_2]
        if nil ~= L7_2 then
          L7_2 = Trunks
          L7_2 = L7_2[A1_2]
          L7_2 = L7_2.isOpen
          if L7_2 then
            L7_2 = QS
            L7_2 = L7_2.GetPlayerFromId
            L8_2 = Trunks
            L8_2 = L8_2[A1_2]
            L8_2 = L8_2.isOpen
            L7_2 = L7_2(L8_2)
            if nil ~= L7_2 then
              L8_2 = TriggerClientEvent
              L9_2 = "inventory:client:CheckOpenState"
              L10_2 = Trunks
              L10_2 = L10_2[A1_2]
              L10_2 = L10_2.isOpen
              L11_2 = A0_2
              L12_2 = A1_2
              L13_2 = Trunks
              L13_2 = L13_2[A1_2]
              L13_2 = L13_2.label
              L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
            else
              L8_2 = Trunks
              L8_2 = L8_2[A1_2]
              L8_2.isOpen = false
            end
          end
        end
        L7_2 = "trunk-"
        L8_2 = A1_2
        L7_2 = L7_2 .. L8_2
        L6_2.name = L7_2
        L7_2 = Lang
        L8_2 = "TRUNK_LABEL"
        L7_2 = L7_2(L8_2)
        L8_2 = A1_2
        L7_2 = L7_2 .. L8_2
        L6_2.label = L7_2
        L7_2 = A2_2.maxweight
        if nil ~= L7_2 then
          L7_2 = A2_2.maxweight
          if L7_2 then
            goto lbl_301
          end
        end
        L7_2 = 60000
        ::lbl_301::
        L6_2.maxweight = L7_2
        L7_2 = A2_2.slots
        if nil ~= L7_2 then
          L7_2 = A2_2.slots
          if L7_2 then
            goto lbl_309
          end
        end
        L7_2 = 50
        ::lbl_309::
        L6_2.slots = L7_2
        L7_2 = {}
        L6_2.inventory = L7_2
        L7_2 = Trunks
        L7_2 = L7_2[A1_2]
        if nil ~= L7_2 then
          L7_2 = Trunks
          L7_2 = L7_2[A1_2]
          L7_2 = L7_2.isOpen
          if L7_2 then
            L7_2 = TriggerClientEvent
            L8_2 = "qs-inventory:sendMessage"
            L9_2 = L3_2
            L10_2 = Lang
            L11_2 = "INVENTORY_ALREADY_OPENED"
            L10_2 = L10_2(L11_2)
            L11_2 = "error"
            L7_2(L8_2, L9_2, L10_2, L11_2)
            L7_2 = TriggerClientEvent
            L8_2 = "qs-inventory:closeInventory"
            L9_2 = L3_2
            L7_2(L8_2, L9_2)
            return
        end
        elseif nil ~= A1_2 then
          L7_2 = GetOwnedVehicleItems
          L8_2 = A1_2
          L7_2 = L7_2(L8_2)
          if "Invalid" == L7_2 then
            return
          end
          L8_2 = Config
          L8_2 = L8_2.OpenTrunkAll
          if L8_2 then
            L8_2 = next
            L9_2 = L7_2
            L8_2 = L8_2(L9_2)
            if nil ~= L8_2 then
              L8_2 = Trunks
              L8_2 = L8_2[A1_2]
              if L8_2 then
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2 = L8_2.isOpen
                if not L8_2 then
                  L6_2.inventory = L7_2
                  L8_2 = Trunks
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.items = L7_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                else
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:sendMessage"
                  L10_2 = L3_2
                  L11_2 = Lang
                  L12_2 = "INVENTORY_ALREADY_OPENED"
                  L11_2 = L11_2(L12_2)
                  L12_2 = "error"
                  L8_2(L9_2, L10_2, L11_2, L12_2)
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:closeInventory"
                  L10_2 = L3_2
                  L8_2(L9_2, L10_2)
                  return
                end
              else
                L6_2.inventory = L7_2
                L8_2 = Trunks
                L9_2 = {}
                L8_2[A1_2] = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2.items = L7_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = L3_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.label
                L8_2.label = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.maxweight
                L8_2.maxweight = L9_2
              end
            else
              L8_2 = Trunks
              L8_2 = L8_2[A1_2]
              if nil ~= L8_2 then
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2 = L8_2.isOpen
                if not L8_2 then
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.items
                  L6_2.inventory = L8_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                else
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:sendMessage"
                  L10_2 = L3_2
                  L11_2 = Lang
                  L12_2 = "INVENTORY_ALREADY_OPENED"
                  L11_2 = L11_2(L12_2)
                  L12_2 = "error"
                  L8_2(L9_2, L10_2, L11_2, L12_2)
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:closeInventory"
                  L10_2 = L3_2
                  L8_2(L9_2, L10_2)
                  return
                end
              else
                L8_2 = Trunks
                L9_2 = {}
                L8_2[A1_2] = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = L3_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = {}
                L8_2.items = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.label
                L8_2.label = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.maxweight
                L8_2.maxweight = L9_2
              end
            end
          else
            L8_2 = IsVehicleOwnedAbleToOpen
            L9_2 = A1_2
            L10_2 = L3_2
            L8_2 = L8_2(L9_2, L10_2)
            if not L8_2 then
              L8_2 = Config
              L8_2 = L8_2.OpenTrunkPolice
              if not L8_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "qs-inventory:sendMessage"
                L10_2 = L3_2
                L11_2 = Lang
                L12_2 = "INVENTORY_NOT_YOURS"
                L11_2 = L11_2(L12_2)
                L12_2 = "error"
                L8_2(L9_2, L10_2, L11_2, L12_2)
                L8_2 = TriggerClientEvent
                L9_2 = "qs-inventory:closeInventory"
                L10_2 = L3_2
                L8_2(L9_2, L10_2)
                return
              end
              L8_2 = L5_2.job
              L8_2 = L8_2.name
              if "police" ~= L8_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "qs-inventory:sendMessage"
                L10_2 = L3_2
                L11_2 = Lang
                L12_2 = "INVENTORY_NOT_YOURS"
                L11_2 = L11_2(L12_2)
                L12_2 = "error"
                L8_2(L9_2, L10_2, L11_2, L12_2)
                L8_2 = TriggerClientEvent
                L9_2 = "qs-inventory:closeInventory"
                L10_2 = L3_2
                L8_2(L9_2, L10_2)
                return
              end
              L8_2 = L5_2.job
              L8_2 = L8_2.grade
              L9_2 = Config
              L9_2 = L9_2.OpenTrunkPoliceGrade
              if not (L8_2 >= L9_2) then
                L8_2 = TriggerClientEvent
                L9_2 = "qs-inventory:sendMessage"
                L10_2 = L3_2
                L11_2 = Lang
                L12_2 = "INVENTORY_NOT_YOURS"
                L11_2 = L11_2(L12_2)
                L12_2 = "error"
                L8_2(L9_2, L10_2, L11_2, L12_2)
                L8_2 = TriggerClientEvent
                L9_2 = "qs-inventory:closeInventory"
                L10_2 = L3_2
                L8_2(L9_2, L10_2)
                return
              end
            end
            L8_2 = next
            L9_2 = L7_2
            L8_2 = L8_2(L9_2)
            if nil ~= L8_2 then
              L8_2 = Trunks
              L8_2 = L8_2[A1_2]
              if L8_2 then
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2 = L8_2.isOpen
                if not L8_2 then
                  L6_2.inventory = L7_2
                  L8_2 = Trunks
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.items = L7_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                else
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:sendMessage"
                  L10_2 = L3_2
                  L11_2 = Lang
                  L12_2 = "INVENTORY_ALREADY_OPENED"
                  L11_2 = L11_2(L12_2)
                  L12_2 = "error"
                  L8_2(L9_2, L10_2, L11_2, L12_2)
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:closeInventory"
                  L10_2 = L3_2
                  L8_2(L9_2, L10_2)
                  return
                end
              else
                L6_2.inventory = L7_2
                L8_2 = Trunks
                L9_2 = {}
                L8_2[A1_2] = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2.items = L7_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = L3_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.label
                L8_2.label = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.maxweight
                L8_2.maxweight = L9_2
              end
            else
              L8_2 = Trunks
              L8_2 = L8_2[A1_2]
              if nil ~= L8_2 then
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2 = L8_2.isOpen
                if not L8_2 then
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.items
                  L6_2.inventory = L8_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                else
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:sendMessage"
                  L10_2 = L3_2
                  L11_2 = Lang
                  L12_2 = "INVENTORY_ALREADY_OPENED"
                  L11_2 = L11_2(L12_2)
                  L12_2 = "error"
                  L8_2(L9_2, L10_2, L11_2, L12_2)
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:closeInventory"
                  L10_2 = L3_2
                  L8_2(L9_2, L10_2)
                  return
                end
              else
                L8_2 = Trunks
                L9_2 = {}
                L8_2[A1_2] = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = L3_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = {}
                L8_2.items = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.label
                L8_2.label = L9_2
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.maxweight
                L8_2.maxweight = L9_2
                goto lbl_637
              end
            end
          end
        end
        ::lbl_637::
        L7_2 = Config
        L7_2 = L7_2.EnableActionNotifications
        if L7_2 then
          L7_2 = TriggerClientEvent
          L8_2 = "ActionNotifications"
          L9_2 = L3_2
          L10_2 = "trunk"
          L11_2 = L3_2
          L12_2 = GetPlayerName
          L13_2 = L3_2
          L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        end
      elseif "glovebox" == A0_2 then
        L7_2 = Gloveboxes
        L7_2 = L7_2[A1_2]
        if nil ~= L7_2 then
          L7_2 = Gloveboxes
          L7_2 = L7_2[A1_2]
          L7_2 = L7_2.isOpen
          if L7_2 then
            L7_2 = QS
            L7_2 = L7_2.GetPlayerFromId
            L8_2 = Gloveboxes
            L8_2 = L8_2[A1_2]
            L8_2 = L8_2.isOpen
            L7_2 = L7_2(L8_2)
            if nil ~= L7_2 then
              L8_2 = TriggerClientEvent
              L9_2 = "inventory:client:CheckOpenState"
              L10_2 = Gloveboxes
              L10_2 = L10_2[A1_2]
              L10_2 = L10_2.isOpen
              L11_2 = A0_2
              L12_2 = A1_2
              L13_2 = Gloveboxes
              L13_2 = L13_2[A1_2]
              L13_2 = L13_2.label
              L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
            else
              L8_2 = Gloveboxes
              L8_2 = L8_2[A1_2]
              L8_2.isOpen = false
            end
          end
        end
        L7_2 = "glovebox-"
        L8_2 = A1_2
        L7_2 = L7_2 .. L8_2
        L6_2.name = L7_2
        L7_2 = Lang
        L8_2 = "GLOVEBOX_LABEL"
        L7_2 = L7_2(L8_2)
        L8_2 = A1_2
        L7_2 = L7_2 .. L8_2
        L6_2.label = L7_2
        L7_2 = Config
        L7_2 = L7_2.GloveboxWeight
        L6_2.maxweight = L7_2
        L7_2 = Config
        L7_2 = L7_2.GloveboxSlots
        L6_2.slots = L7_2
        L7_2 = {}
        L6_2.inventory = L7_2
        L7_2 = Gloveboxes
        L7_2 = L7_2[A1_2]
        if nil ~= L7_2 then
          L7_2 = Gloveboxes
          L7_2 = L7_2[A1_2]
          L7_2 = L7_2.isOpen
          if L7_2 then
            L6_2.name = "none-inv"
            L6_2.label = "Glovebox-None"
            L6_2.maxweight = 100000
            L7_2 = {}
            L6_2.inventory = L7_2
            L6_2.slots = 0
        end
        elseif nil ~= A1_2 then
          L7_2 = GetOwnedVehicleGloveboxItems
          L8_2 = A1_2
          L7_2 = L7_2(L8_2)
          if "Invalid" == L7_2 then
            return
          end
          L8_2 = Config
          L8_2 = L8_2.OpenGloveboxesAll
          if L8_2 then
            L8_2 = next
            L9_2 = L7_2
            L8_2 = L8_2(L9_2)
            if nil ~= L8_2 then
              L8_2 = Gloveboxes
              L8_2 = L8_2[A1_2]
              if L8_2 then
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2 = L8_2.isOpen
                if not L8_2 then
                  L6_2.inventory = L7_2
                  L8_2 = Gloveboxes
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.items = L7_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                else
                  L6_2.name = "none-inv"
                  L6_2.label = "Glovebox-None"
                  L6_2.maxweight = 100000
                  L8_2 = {}
                  L6_2.inventory = L8_2
                  L6_2.slots = 0
                end
              else
                L6_2.inventory = L7_2
                L8_2 = Gloveboxes
                L9_2 = {}
                L8_2[A1_2] = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2.items = L7_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = L3_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.label
                L8_2.label = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.maxweight
                L8_2.maxweight = L9_2
              end
            else
              L8_2 = Gloveboxes
              L8_2 = L8_2[A1_2]
              if nil ~= L8_2 then
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2 = L8_2.isOpen
                if not L8_2 then
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.items
                  L6_2.inventory = L8_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                else
                  L6_2.name = "none-inv"
                  L6_2.label = "Glovebox-None"
                  L6_2.maxweight = 100000
                  L8_2 = {}
                  L6_2.inventory = L8_2
                  L6_2.slots = 0
                end
              else
                L8_2 = Gloveboxes
                L9_2 = {}
                L8_2[A1_2] = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = L3_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = {}
                L8_2.items = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.label
                L8_2.label = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.maxweight
                L8_2.maxweight = L9_2
              end
            end
          else
            L8_2 = IsVehicleOwnedAbleToOpen
            L9_2 = A1_2
            L10_2 = L3_2
            L8_2 = L8_2(L9_2, L10_2)
            if not L8_2 then
              L8_2 = Config
              L8_2 = L8_2.OpenGloveboxesPolice
              if not L8_2 then
                L6_2.name = "none-inv"
                L6_2.label = "Glovebox-None"
                L6_2.maxweight = 100000
                L8_2 = {}
                L6_2.inventory = L8_2
                L6_2.slots = 0
              end
              L8_2 = L5_2.job
              L8_2 = L8_2.name
              if "police" ~= L8_2 then
                L6_2.name = "none-inv"
                L6_2.label = "Glovebox-None"
                L6_2.maxweight = 100000
                L8_2 = {}
                L6_2.inventory = L8_2
                L6_2.slots = 0
              end
              L8_2 = L5_2.job
              L8_2 = L8_2.grade
              L9_2 = Config
              L9_2 = L9_2.OpenGloveboxesPoliceGrade
              if not (L8_2 >= L9_2) then
                L6_2.name = "none-inv"
                L6_2.label = "Glovebox-None"
                L6_2.maxweight = 100000
                L8_2 = {}
                L6_2.inventory = L8_2
                L6_2.slots = 0
              end
            end
            L8_2 = next
            L9_2 = L7_2
            L8_2 = L8_2(L9_2)
            if nil ~= L8_2 then
              L8_2 = Gloveboxes
              L8_2 = L8_2[A1_2]
              if L8_2 then
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2 = L8_2.isOpen
                if not L8_2 then
                  L6_2.inventory = L7_2
                  L8_2 = Gloveboxes
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.items = L7_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                else
                  L6_2.name = "none-inv"
                  L6_2.label = "Glovebox-None"
                  L6_2.maxweight = 100000
                  L8_2 = {}
                  L6_2.inventory = L8_2
                  L6_2.slots = 0
                end
              else
                L6_2.inventory = L7_2
                L8_2 = Gloveboxes
                L9_2 = {}
                L8_2[A1_2] = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2.items = L7_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = L3_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.label
                L8_2.label = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.maxweight
                L8_2.maxweight = L9_2
              end
            else
              L8_2 = Gloveboxes
              L8_2 = L8_2[A1_2]
              if nil ~= L8_2 then
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2 = L8_2.isOpen
                if not L8_2 then
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.items
                  L6_2.inventory = L8_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                else
                  L6_2.name = "none-inv"
                  L6_2.label = "Glovebox-None"
                  L6_2.maxweight = 100000
                  L8_2 = {}
                  L6_2.inventory = L8_2
                  L6_2.slots = 0
                end
              else
                L8_2 = Gloveboxes
                L9_2 = {}
                L8_2[A1_2] = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = L3_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = {}
                L8_2.items = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.label
                L8_2.label = L9_2
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L9_2 = L6_2.maxweight
                L8_2.maxweight = L9_2
                goto lbl_992
              end
            end
          end
        end
        ::lbl_992::
        L7_2 = Config
        L7_2 = L7_2.EnableActionNotifications
        if L7_2 then
          L7_2 = TriggerClientEvent
          L8_2 = "ActionNotifications"
          L9_2 = L3_2
          L10_2 = "glovebox"
          L11_2 = L3_2
          L12_2 = GetPlayerName
          L13_2 = L3_2
          L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        end
      elseif "shop" == A0_2 then
        L7_2 = "itemshop-"
        L8_2 = A1_2
        L7_2 = L7_2 .. L8_2
        L6_2.name = L7_2
        L7_2 = A2_2.label
        L6_2.label = L7_2
        L6_2.maxweight = 900000
        L7_2 = SetupShopItems
        L8_2 = A1_2
        L9_2 = A2_2.items
        L7_2 = L7_2(L8_2, L9_2)
        L6_2.inventory = L7_2
        L7_2 = ShopItems
        L8_2 = {}
        L7_2[A1_2] = L8_2
        L7_2 = ShopItems
        L7_2 = L7_2[A1_2]
        L8_2 = A2_2.items
        L7_2.items = L8_2
        L7_2 = ShopItems
        L7_2 = L7_2[A1_2]
        L8_2 = A2_2.type
        L7_2.type = L8_2
        L7_2 = A2_2.items
        L7_2 = #L7_2
        L6_2.slots = L7_2
        L7_2 = Config
        L7_2 = L7_2.EnableActionNotifications
        if L7_2 then
          L7_2 = TriggerClientEvent
          L8_2 = "ActionNotifications"
          L9_2 = L3_2
          L10_2 = "shop"
          L11_2 = L3_2
          L12_2 = GetPlayerName
          L13_2 = L3_2
          L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        end
      elseif "crafting" == A0_2 then
        L6_2.name = "crafting"
        L7_2 = A2_2.label
        L6_2.label = L7_2
        L6_2.maxweight = 900000
        L7_2 = A2_2.items
        L6_2.inventory = L7_2
        L7_2 = A2_2.items
        L7_2 = #L7_2
        L6_2.slots = L7_2
      elseif "attachment_crafting" == A0_2 then
        L6_2.name = "attachment_crafting"
        L7_2 = A2_2.label
        L6_2.label = L7_2
        L6_2.maxweight = 900000
        L7_2 = A2_2.items
        L6_2.inventory = L7_2
        L7_2 = A2_2.items
        L7_2 = #L7_2
        L6_2.slots = L7_2
      elseif "garbage" == A0_2 then
        L7_2 = "garbage_"
        L8_2 = A1_2
        L7_2 = L7_2 .. L8_2
        L6_2.name = L7_2
        L7_2 = Lang
        L8_2 = "GARBAGE_LABEL"
        L7_2 = L7_2(L8_2)
        L8_2 = A1_2
        L7_2 = L7_2 .. L8_2
        L6_2.label = L7_2
        L6_2.maxweight = 100000
        L7_2 = GarbageItems
        L7_2 = L7_2[A1_2]
        if nil == L7_2 then
          L7_2 = GarbageItems
          L8_2 = {}
          L7_2[A1_2] = L8_2
          L7_2 = Config
          L7_2 = L7_2.GarbageItems
          L8_2 = A2_2.items
          L9_2 = math
          L9_2 = L9_2.random
          L10_2 = 1
          L11_2 = A2_2.items
          L11_2 = #L11_2
          L9_2 = L9_2(L10_2, L11_2)
          L8_2 = L8_2[L9_2]
          L7_2[A1_2] = L8_2
          L7_2 = GarbageItems
          L7_2 = L7_2[A1_2]
          L8_2 = Config
          L8_2 = L8_2.GarbageItems
          L8_2 = L8_2[A1_2]
          L7_2.items = L8_2
        end
        L7_2 = SetupGarbageItems
        L8_2 = A1_2
        L9_2 = GarbageItems
        L9_2 = L9_2[A1_2]
        L9_2 = L9_2.items
        L7_2 = L7_2(L8_2, L9_2)
        L6_2.inventory = L7_2
        L6_2.slots = 30
        L7_2 = Config
        L7_2 = L7_2.EnableActionNotifications
        if L7_2 then
          L7_2 = TriggerClientEvent
          L8_2 = "ActionNotifications"
          L9_2 = L3_2
          L10_2 = "garbage"
          L11_2 = L3_2
          L12_2 = GetPlayerName
          L13_2 = L3_2
          L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        end
      elseif "selling" == A0_2 then
        L7_2 = "selling-"
        L8_2 = A1_2
        L7_2 = L7_2 .. L8_2
        L6_2.name = L7_2
        L7_2 = A2_2.label
        L6_2.label = L7_2
        L6_2.maxweight = 900000
        L7_2 = SetupSellingItems
        L8_2 = A1_2
        L9_2 = A2_2.items
        L7_2 = L7_2(L8_2, L9_2)
        L6_2.inventory = L7_2
        L7_2 = SellItems
        L8_2 = {}
        L7_2[A1_2] = L8_2
        L7_2 = SellItems
        L7_2 = L7_2[A1_2]
        L8_2 = A2_2.items
        L7_2.items = L8_2
        L7_2 = A2_2.items
        L7_2 = #L7_2
        L6_2.slots = L7_2
      elseif "otherplayer" == A0_2 then
        L7_2 = Config
        L7_2 = L7_2.EnableSearchOtherPlayersInventory
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.DistanceCheckEnable
          if L7_2 then
            L7_2 = GetPlayerPed
            L8_2 = L3_2
            L7_2 = L7_2(L8_2)
            L8_2 = GetPlayerPed
            L9_2 = A1_2
            L8_2 = L8_2(L9_2)
            L9_2 = GetEntityCoords
            L10_2 = L7_2
            L9_2 = L9_2(L10_2)
            L10_2 = GetEntityCoords
            L11_2 = L8_2
            L10_2 = L10_2(L11_2)
            L11_2 = L9_2 - L10_2
            L11_2 = #L11_2
            L12_2 = Config
            L12_2 = L12_2.DistanceCheckSteal
            if L11_2 > L12_2 then
              L12_2 = sendToDiscordStealLog
              L13_2 = L3_2
              L14_2 = A1_2
              L15_2 = L11_2
              L16_2 = 1
              L12_2(L13_2, L14_2, L15_2, L16_2)
              return
            end
          end
          L7_2 = QS
          L7_2 = L7_2.GetPlayerFromId
          L8_2 = tonumber
          L9_2 = A1_2
          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L8_2(L9_2)
          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          if nil ~= L7_2 then
            L8_2 = "otherplayer-"
            L9_2 = A1_2
            L8_2 = L8_2 .. L9_2
            L6_2.name = L8_2
            L6_2.id = A1_2
            L8_2 = "Player-"
            L9_2 = A1_2
            L8_2 = L8_2 .. L9_2
            L6_2.label = L8_2
            L8_2 = QS
            L8_2 = L8_2.Config
            L8_2 = L8_2.Player
            L8_2 = L8_2.MaxWeight
            L6_2.maxweight = L8_2
            L8_2 = L7_2.PlayerData
            L8_2 = L8_2.items
            L6_2.inventory = L8_2
            L8_2 = Config
            L8_2 = L8_2.MaxInventorySlots
            L8_2 = L8_2 - 1
            L6_2.slots = L8_2
            L8_2 = Citizen
            L8_2 = L8_2.Wait
            L9_2 = 250
            L8_2(L9_2)
          end
          L8_2 = Config
          L8_2 = L8_2.EnableActionNotifications
          if L8_2 then
            L8_2 = TriggerClientEvent
            L9_2 = "ActionNotifications"
            L10_2 = L3_2
            L11_2 = "otherplayer"
            L12_2 = L3_2
            L13_2 = GetPlayerName
            L14_2 = L3_2
            L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
            L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          end
        end
      else
        L7_2 = Drops
        L7_2 = L7_2[A1_2]
        if nil ~= L7_2 then
          L7_2 = Drops
          L7_2 = L7_2[A1_2]
          L7_2 = L7_2.isOpen
          if L7_2 then
            L7_2 = QS
            L7_2 = L7_2.GetPlayerFromId
            L8_2 = Drops
            L8_2 = L8_2[A1_2]
            L8_2 = L8_2.isOpen
            L7_2 = L7_2(L8_2)
            if nil ~= L7_2 then
              L8_2 = TriggerClientEvent
              L9_2 = "inventory:client:CheckOpenState"
              L10_2 = Drops
              L10_2 = L10_2[A1_2]
              L10_2 = L10_2.isOpen
              L11_2 = A0_2
              L12_2 = A1_2
              L13_2 = Drops
              L13_2 = L13_2[A1_2]
              L13_2 = L13_2.label
              L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
            else
              L8_2 = Drops
              L8_2 = L8_2[A1_2]
              L8_2.isOpen = false
            end
          end
        end
        L7_2 = Drops
        L7_2 = L7_2[A1_2]
        if L7_2 then
          L7_2 = Drops
          L7_2 = L7_2[A1_2]
          L7_2 = L7_2.isOpen
          if not L7_2 then
            L6_2.name = A1_2
            L7_2 = Lang
            L8_2 = "GROUND_LABEL"
            L7_2 = L7_2(L8_2)
            L8_2 = tostring
            L9_2 = A1_2
            L8_2 = L8_2(L9_2)
            L7_2 = L7_2 .. L8_2
            L6_2.label = L7_2
            L6_2.maxweight = 100000
            L7_2 = Drops
            L7_2 = L7_2[A1_2]
            L7_2 = L7_2.items
            L6_2.inventory = L7_2
            L7_2 = Config
            L7_2 = L7_2.MaxInventorySlots
            L7_2 = L7_2 - 1
            L6_2.slots = L7_2
            L7_2 = Drops
            L7_2 = L7_2[A1_2]
            L7_2.isOpen = L3_2
            L7_2 = Drops
            L7_2 = L7_2[A1_2]
            L8_2 = L6_2.label
            L7_2.label = L8_2
          else
            L7_2 = TriggerClientEvent
            L8_2 = "qs-inventory:sendMessage"
            L9_2 = L3_2
            L10_2 = Lang
            L11_2 = "INVENTORY_NOT_YOURS"
            L10_2 = L10_2(L11_2)
            L11_2 = "error"
            L7_2(L8_2, L9_2, L10_2, L11_2)
            return
          end
        else
          L6_2.name = "none-inv"
          L6_2.label = "Dropped-None"
          L6_2.maxweight = 100000
          L7_2 = {}
          L6_2.inventory = L7_2
          L6_2.slots = 0
        end
      end
      if nil ~= L4_2 then
        L7_2 = TriggerClientEvent
        L8_2 = "inventory:client:OpenInventory"
        L9_2 = L3_2
        L10_2 = 0
        L11_2 = L4_2.PlayerData
        L11_2 = L11_2.items
        L12_2 = L6_2
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      else
        L7_2 = ShowConsoleError
        L8_2 = "^0Player = nil, es_extended possible bad installed, also check \"QSConfig.IdentifierType\" Config in qs-core config (if you use ESX Legacy, remember to enable \"QSConfig.Multicharacter\")"
        L7_2(L8_2)
      end
    elseif nil ~= L4_2 then
      L6_2 = TriggerClientEvent
      L7_2 = "inventory:client:OpenInventory"
      L8_2 = L3_2
      L9_2 = 0
      L10_2 = L4_2.PlayerData
      L10_2 = L10_2.items
      L6_2(L7_2, L8_2, L9_2, L10_2)
    else
      L6_2 = ShowConsoleError
      L7_2 = "^0Player = nil, es_extended possible bad installed, also check \"QSConfig.IdentifierType\" Config in qs-core config (if you use ESX Legacy, remember to enable \"QSConfig.Multicharacter\")"
      L6_2(L7_2)
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = source
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = QBCore
      L5_2 = L5_2.Functions
      L5_2 = L5_2.GetPlayer
      L6_2 = L3_2
      L5_2 = L5_2(L6_2)
      L6_2 = OpenedInventory
      L6_2[L3_2] = true
      if nil ~= A0_2 and nil ~= A1_2 then
        L6_2 = {}
        if "stash" == A0_2 then
          L7_2 = Stashes
          L7_2 = L7_2[A1_2]
          if nil ~= L7_2 then
            L7_2 = Stashes
            L7_2 = L7_2[A1_2]
            L7_2 = L7_2.isOpen
            if L7_2 then
              L7_2 = QBCore
              L7_2 = L7_2.Functions
              L7_2 = L7_2.GetPlayer
              L8_2 = Stashes
              L8_2 = L8_2[A1_2]
              L8_2 = L8_2.isOpen
              L7_2 = L7_2(L8_2)
              if nil ~= L7_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "inventory:client:CheckOpenState"
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2 = L10_2.isOpen
                L11_2 = A0_2
                L12_2 = A1_2
                L13_2 = Stashes
                L13_2 = L13_2[A1_2]
                L13_2 = L13_2.label
                L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
              else
                L8_2 = Stashes
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = false
              end
            end
          end
          L7_2 = Config
          L7_2 = L7_2.StashWeight
          L8_2 = Config
          L8_2 = L8_2.StashSlots
          if nil ~= A2_2 then
            L9_2 = A2_2.maxweight
            if nil ~= L9_2 then
              L9_2 = A2_2.maxweight
              if L9_2 then
                L9_2 = A2_2.slots
                if nil ~= L9_2 then
                  L9_2 = A2_2.slots
                  if L9_2 then
                    goto lbl_1437
                    L8_2 = L9_2 or L8_2
                  end
                end
                L9_2 = Config
                L8_2 = L9_2.StashSlots
                L7_2 = L9_2 or L7_2
              end
            end
            L9_2 = Config
            L7_2 = L9_2.StashWeight
          end
          ::lbl_1437::
          L6_2.maxweight = L7_2
          L6_2.slots = L8_2
          L9_2 = "stash-"
          L10_2 = A1_2
          L9_2 = L9_2 .. L10_2
          L6_2.name = L9_2
          L9_2 = Lang
          L10_2 = "STASH_LABEL"
          L9_2 = L9_2(L10_2)
          L10_2 = A1_2
          L9_2 = L9_2 .. L10_2
          L6_2.label = L9_2
          L9_2 = {}
          L6_2.inventory = L9_2
          L9_2 = Stashes
          L9_2 = L9_2[A1_2]
          if nil ~= L9_2 then
            L9_2 = Stashes
            L9_2 = L9_2[A1_2]
            L9_2 = L9_2.isOpen
            if L9_2 then
              L9_2 = TriggerClientEvent
              L10_2 = "qs-inventory:sendMessage"
              L11_2 = L3_2
              L12_2 = Lang
              L13_2 = "INVENTORY_ALREADY_OPENED"
              L12_2 = L12_2(L13_2)
              L13_2 = "error"
              L9_2(L10_2, L11_2, L12_2, L13_2)
              L9_2 = TriggerClientEvent
              L10_2 = "qs-inventory:closeInventory"
              L11_2 = L3_2
              L9_2(L10_2, L11_2)
              return
          end
          else
            L9_2 = GetStashItems
            L10_2 = A1_2
            L9_2 = L9_2(L10_2)
            if "Invalid" == L9_2 then
              return
            end
            L10_2 = next
            L11_2 = L9_2
            L10_2 = L10_2(L11_2)
            if nil ~= L10_2 then
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              if L10_2 then
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2 = L10_2.isOpen
                if not L10_2 then
                  L6_2.inventory = L9_2
                  L10_2 = Stashes
                  L11_2 = {}
                  L10_2[A1_2] = L11_2
                  L10_2 = Stashes
                  L10_2 = L10_2[A1_2]
                  L10_2.items = L9_2
                  L10_2 = Stashes
                  L10_2 = L10_2[A1_2]
                  L10_2.isOpen = L3_2
                  L10_2 = Stashes
                  L10_2 = L10_2[A1_2]
                  L11_2 = L6_2.label
                  L10_2.label = L11_2
                  L10_2 = Stashes
                  L10_2 = L10_2[A1_2]
                  L11_2 = L6_2.maxweight
                  L10_2.maxweight = L11_2
                else
                  L10_2 = TriggerClientEvent
                  L11_2 = "qs-inventory:sendMessage"
                  L12_2 = L3_2
                  L13_2 = Lang
                  L14_2 = "INVENTORY_ALREADY_OPENED"
                  L13_2 = L13_2(L14_2)
                  L14_2 = "error"
                  L10_2(L11_2, L12_2, L13_2, L14_2)
                  L10_2 = TriggerClientEvent
                  L11_2 = "qs-inventory:closeInventory"
                  L12_2 = L3_2
                  L10_2(L11_2, L12_2)
                  return
                end
              else
                L6_2.inventory = L9_2
                L10_2 = Stashes
                L11_2 = {}
                L10_2[A1_2] = L11_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2.items = L9_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2.isOpen = L3_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L11_2 = L6_2.label
                L10_2.label = L11_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L11_2 = L6_2.maxweight
                L10_2.maxweight = L11_2
              end
            else
              L10_2 = Stashes
              L10_2 = L10_2[A1_2]
              if nil ~= L10_2 then
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2 = L10_2.isOpen
                if not L10_2 then
                  L10_2 = Stashes
                  L10_2 = L10_2[A1_2]
                  L10_2.isOpen = L3_2
                  L10_2 = Stashes
                  L10_2 = L10_2[A1_2]
                  L10_2 = L10_2.items
                  L6_2.inventory = L10_2
                  L10_2 = Stashes
                  L10_2 = L10_2[A1_2]
                  L11_2 = L6_2.label
                  L10_2.label = L11_2
                  L10_2 = Stashes
                  L10_2 = L10_2[A1_2]
                  L11_2 = L6_2.maxweight
                  L10_2.maxweight = L11_2
                else
                  L10_2 = TriggerClientEvent
                  L11_2 = "qs-inventory:sendMessage"
                  L12_2 = L3_2
                  L13_2 = Lang
                  L14_2 = "INVENTORY_ALREADY_OPENED"
                  L13_2 = L13_2(L14_2)
                  L14_2 = "error"
                  L10_2(L11_2, L12_2, L13_2, L14_2)
                  L10_2 = TriggerClientEvent
                  L11_2 = "qs-inventory:closeInventory"
                  L12_2 = L3_2
                  L10_2(L11_2, L12_2)
                  return
                end
              else
                L10_2 = Stashes
                L11_2 = {}
                L10_2[A1_2] = L11_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L10_2.isOpen = L3_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L11_2 = {}
                L10_2.items = L11_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L11_2 = L6_2.label
                L10_2.label = L11_2
                L10_2 = Stashes
                L10_2 = L10_2[A1_2]
                L11_2 = L6_2.maxweight
                L10_2.maxweight = L11_2
              end
            end
          end
        elseif "trunk" == A0_2 then
          L7_2 = Trunks
          L7_2 = L7_2[A1_2]
          if nil ~= L7_2 then
            L7_2 = Trunks
            L7_2 = L7_2[A1_2]
            L7_2 = L7_2.isOpen
            if L7_2 then
              L7_2 = QBCore
              L7_2 = L7_2.Functions
              L7_2 = L7_2.GetPlayer
              L8_2 = Trunks
              L8_2 = L8_2[A1_2]
              L8_2 = L8_2.isOpen
              L7_2 = L7_2(L8_2)
              if nil ~= L7_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "inventory:client:CheckOpenState"
                L10_2 = Trunks
                L10_2 = L10_2[A1_2]
                L10_2 = L10_2.isOpen
                L11_2 = A0_2
                L12_2 = A1_2
                L13_2 = Trunks
                L13_2 = L13_2[A1_2]
                L13_2 = L13_2.label
                L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
              else
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = false
              end
            end
          end
          L7_2 = "trunk-"
          L8_2 = A1_2
          L7_2 = L7_2 .. L8_2
          L6_2.name = L7_2
          L7_2 = Lang
          L8_2 = "TRUNK_LABEL"
          L7_2 = L7_2(L8_2)
          L8_2 = A1_2
          L7_2 = L7_2 .. L8_2
          L6_2.label = L7_2
          L7_2 = A2_2.maxweight
          if nil ~= L7_2 then
            L7_2 = A2_2.maxweight
            if L7_2 then
              goto lbl_1661
            end
          end
          L7_2 = 60000
          ::lbl_1661::
          L6_2.maxweight = L7_2
          L7_2 = A2_2.slots
          if nil ~= L7_2 then
            L7_2 = A2_2.slots
            if L7_2 then
              goto lbl_1669
            end
          end
          L7_2 = 50
          ::lbl_1669::
          L6_2.slots = L7_2
          L7_2 = {}
          L6_2.inventory = L7_2
          L7_2 = Trunks
          L7_2 = L7_2[A1_2]
          if nil ~= L7_2 then
            L7_2 = Trunks
            L7_2 = L7_2[A1_2]
            L7_2 = L7_2.isOpen
            if L7_2 then
              L7_2 = TriggerClientEvent
              L8_2 = "qs-inventory:sendMessage"
              L9_2 = L3_2
              L10_2 = Lang
              L11_2 = "INVENTORY_ALREADY_OPENED"
              L10_2 = L10_2(L11_2)
              L11_2 = "error"
              L7_2(L8_2, L9_2, L10_2, L11_2)
              L7_2 = TriggerClientEvent
              L8_2 = "qs-inventory:closeInventory"
              L9_2 = L3_2
              L7_2(L8_2, L9_2)
              return
          end
          elseif nil ~= A1_2 then
            L7_2 = GetOwnedVehicleItems
            L8_2 = A1_2
            L7_2 = L7_2(L8_2)
            if "Invalid" == L7_2 then
              return
            end
            L8_2 = Config
            L8_2 = L8_2.OpenTrunkAll
            if L8_2 then
              L8_2 = next
              L9_2 = L7_2
              L8_2 = L8_2(L9_2)
              if nil ~= L8_2 then
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                if L8_2 then
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.isOpen
                  if not L8_2 then
                    L6_2.inventory = L7_2
                    L8_2 = Trunks
                    L9_2 = {}
                    L8_2[A1_2] = L9_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L8_2.items = L7_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L8_2.isOpen = L3_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.maxweight
                    L8_2.maxweight = L9_2
                  else
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-inventory:sendMessage"
                    L10_2 = L3_2
                    L11_2 = Lang
                    L12_2 = "INVENTORY_ALREADY_OPENED"
                    L11_2 = L11_2(L12_2)
                    L12_2 = "error"
                    L8_2(L9_2, L10_2, L11_2, L12_2)
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-inventory:closeInventory"
                    L10_2 = L3_2
                    L8_2(L9_2, L10_2)
                    return
                  end
                else
                  L6_2.inventory = L7_2
                  L8_2 = Trunks
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.items = L7_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                end
              else
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                if nil ~= L8_2 then
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.isOpen
                  if not L8_2 then
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L8_2.isOpen = L3_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L8_2 = L8_2.items
                    L6_2.inventory = L8_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.maxweight
                    L8_2.maxweight = L9_2
                  else
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-inventory:sendMessage"
                    L10_2 = L3_2
                    L11_2 = Lang
                    L12_2 = "INVENTORY_ALREADY_OPENED"
                    L11_2 = L11_2(L12_2)
                    L12_2 = "error"
                    L8_2(L9_2, L10_2, L11_2, L12_2)
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-inventory:closeInventory"
                    L10_2 = L3_2
                    L8_2(L9_2, L10_2)
                    return
                  end
                else
                  L8_2 = Trunks
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = {}
                  L8_2.items = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                end
              end
            else
              L8_2 = IsVehicleOwnedAbleToOpen
              L9_2 = A1_2
              L10_2 = L3_2
              L8_2 = L8_2(L9_2, L10_2)
              if not L8_2 then
                L8_2 = Config
                L8_2 = L8_2.OpenTrunkPolice
                if not L8_2 then
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:sendMessage"
                  L10_2 = L3_2
                  L11_2 = Lang
                  L12_2 = "INVENTORY_NOT_YOURS"
                  L11_2 = L11_2(L12_2)
                  L12_2 = "error"
                  L8_2(L9_2, L10_2, L11_2, L12_2)
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:closeInventory"
                  L10_2 = L3_2
                  L8_2(L9_2, L10_2)
                  return
                end
                L8_2 = L4_2.PlayerData
                L8_2 = L8_2.job
                L8_2 = L8_2.name
                if "police" ~= L8_2 then
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:sendMessage"
                  L10_2 = L3_2
                  L11_2 = Lang
                  L12_2 = "INVENTORY_NOT_YOURS"
                  L11_2 = L11_2(L12_2)
                  L12_2 = "error"
                  L8_2(L9_2, L10_2, L11_2, L12_2)
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:closeInventory"
                  L10_2 = L3_2
                  L8_2(L9_2, L10_2)
                  return
                end
                L8_2 = L4_2.PlayerData
                L8_2 = L8_2.grade
                L9_2 = Config
                L9_2 = L9_2.OpenTrunkPoliceGrade
                if not (L8_2 >= L9_2) then
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:sendMessage"
                  L10_2 = L3_2
                  L11_2 = Lang
                  L12_2 = "INVENTORY_NOT_YOURS"
                  L11_2 = L11_2(L12_2)
                  L12_2 = "error"
                  L8_2(L9_2, L10_2, L11_2, L12_2)
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-inventory:closeInventory"
                  L10_2 = L3_2
                  L8_2(L9_2, L10_2)
                  return
                end
              end
              L8_2 = next
              L9_2 = L7_2
              L8_2 = L8_2(L9_2)
              if nil ~= L8_2 then
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                if L8_2 then
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.isOpen
                  if not L8_2 then
                    L6_2.inventory = L7_2
                    L8_2 = Trunks
                    L9_2 = {}
                    L8_2[A1_2] = L9_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L8_2.items = L7_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L8_2.isOpen = L3_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.maxweight
                    L8_2.maxweight = L9_2
                  else
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-inventory:sendMessage"
                    L10_2 = L3_2
                    L11_2 = Lang
                    L12_2 = "INVENTORY_ALREADY_OPENED"
                    L11_2 = L11_2(L12_2)
                    L12_2 = "error"
                    L8_2(L9_2, L10_2, L11_2, L12_2)
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-inventory:closeInventory"
                    L10_2 = L3_2
                    L8_2(L9_2, L10_2)
                    return
                  end
                else
                  L6_2.inventory = L7_2
                  L8_2 = Trunks
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.items = L7_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                end
              else
                L8_2 = Trunks
                L8_2 = L8_2[A1_2]
                if nil ~= L8_2 then
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.isOpen
                  if not L8_2 then
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L8_2.isOpen = L3_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L8_2 = L8_2.items
                    L6_2.inventory = L8_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L8_2 = Trunks
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.maxweight
                    L8_2.maxweight = L9_2
                  else
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-inventory:sendMessage"
                    L10_2 = L3_2
                    L11_2 = Lang
                    L12_2 = "INVENTORY_ALREADY_OPENED"
                    L11_2 = L11_2(L12_2)
                    L12_2 = "error"
                    L8_2(L9_2, L10_2, L11_2, L12_2)
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-inventory:closeInventory"
                    L10_2 = L3_2
                    L8_2(L9_2, L10_2)
                    return
                  end
                else
                  L8_2 = Trunks
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = {}
                  L8_2.items = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Trunks
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                  goto lbl_1998
                end
              end
            end
          end
          ::lbl_1998::
          L7_2 = Config
          L7_2 = L7_2.EnableActionNotifications
          if L7_2 then
            L7_2 = TriggerClientEvent
            L8_2 = "ActionNotifications"
            L9_2 = L3_2
            L10_2 = "trunk"
            L11_2 = L3_2
            L12_2 = GetPlayerName
            L13_2 = L3_2
            L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          end
        elseif "glovebox" == A0_2 then
          L7_2 = Gloveboxes
          L7_2 = L7_2[A1_2]
          if nil ~= L7_2 then
            L7_2 = Gloveboxes
            L7_2 = L7_2[A1_2]
            L7_2 = L7_2.isOpen
            if L7_2 then
              L7_2 = QBCore
              L7_2 = L7_2.Functions
              L7_2 = L7_2.GetPlayer
              L8_2 = Gloveboxes
              L8_2 = L8_2[A1_2]
              L8_2 = L8_2.isOpen
              L7_2 = L7_2(L8_2)
              if nil ~= L7_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "inventory:client:CheckOpenState"
                L10_2 = Gloveboxes
                L10_2 = L10_2[A1_2]
                L10_2 = L10_2.isOpen
                L11_2 = A0_2
                L12_2 = A1_2
                L13_2 = Gloveboxes
                L13_2 = L13_2[A1_2]
                L13_2 = L13_2.label
                L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
              else
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = false
              end
            end
          end
          L7_2 = "glovebox-"
          L8_2 = A1_2
          L7_2 = L7_2 .. L8_2
          L6_2.name = L7_2
          L7_2 = Lang
          L8_2 = "GLOVEBOX_LABEL"
          L7_2 = L7_2(L8_2)
          L8_2 = A1_2
          L7_2 = L7_2 .. L8_2
          L6_2.label = L7_2
          L7_2 = Config
          L7_2 = L7_2.GloveboxWeight
          L6_2.maxweight = L7_2
          L7_2 = Config
          L7_2 = L7_2.GloveboxSlots
          L6_2.slots = L7_2
          L7_2 = {}
          L6_2.inventory = L7_2
          L7_2 = Gloveboxes
          L7_2 = L7_2[A1_2]
          if nil ~= L7_2 then
            L7_2 = Gloveboxes
            L7_2 = L7_2[A1_2]
            L7_2 = L7_2.isOpen
            if L7_2 then
              L6_2.name = "none-inv"
              L6_2.label = "Glovebox-None"
              L6_2.maxweight = 100000
              L7_2 = {}
              L6_2.inventory = L7_2
              L6_2.slots = 0
          end
          elseif nil ~= A1_2 then
            L7_2 = GetOwnedVehicleGloveboxItems
            L8_2 = A1_2
            L7_2 = L7_2(L8_2)
            if "Invalid" == L7_2 then
              return
            end
            L8_2 = Config
            L8_2 = L8_2.OpenGloveboxesAll
            if L8_2 then
              L8_2 = next
              L9_2 = L7_2
              L8_2 = L8_2(L9_2)
              if nil ~= L8_2 then
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                if L8_2 then
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.isOpen
                  if not L8_2 then
                    L6_2.inventory = L7_2
                    L8_2 = Gloveboxes
                    L9_2 = {}
                    L8_2[A1_2] = L9_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L8_2.items = L7_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L8_2.isOpen = L3_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.maxweight
                    L8_2.maxweight = L9_2
                  else
                    L6_2.name = "none-inv"
                    L6_2.label = "Glovebox-None"
                    L6_2.maxweight = 100000
                    L8_2 = {}
                    L6_2.inventory = L8_2
                    L6_2.slots = 0
                  end
                else
                  L6_2.inventory = L7_2
                  L8_2 = Gloveboxes
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.items = L7_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                end
              else
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                if nil ~= L8_2 then
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.isOpen
                  if not L8_2 then
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L8_2.isOpen = L3_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L8_2 = L8_2.items
                    L6_2.inventory = L8_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.maxweight
                    L8_2.maxweight = L9_2
                  else
                    L6_2.name = "none-inv"
                    L6_2.label = "Glovebox-None"
                    L6_2.maxweight = 100000
                    L8_2 = {}
                    L6_2.inventory = L8_2
                    L6_2.slots = 0
                  end
                else
                  L8_2 = Gloveboxes
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = {}
                  L8_2.items = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                end
              end
            else
              L8_2 = IsVehicleOwnedAbleToOpen
              L9_2 = A1_2
              L10_2 = L3_2
              L8_2 = L8_2(L9_2, L10_2)
              if not L8_2 then
                L8_2 = Config
                L8_2 = L8_2.OpenGloveboxesPolice
                if not L8_2 then
                  L6_2.name = "none-inv"
                  L6_2.label = "Glovebox-None"
                  L6_2.maxweight = 100000
                  L8_2 = {}
                  L6_2.inventory = L8_2
                  L6_2.slots = 0
                end
                L8_2 = L4_2.PlayerData
                L8_2 = L8_2.job
                L8_2 = L8_2.name
                if "police" ~= L8_2 then
                  L6_2.name = "none-inv"
                  L6_2.label = "Glovebox-None"
                  L6_2.maxweight = 100000
                  L8_2 = {}
                  L6_2.inventory = L8_2
                  L6_2.slots = 0
                end
                L8_2 = L4_2.PlayerData
                L8_2 = L8_2.job
                L8_2 = L8_2.grade
                L9_2 = Config
                L9_2 = L9_2.OpenGloveboxesPoliceGrade
                if not (L8_2 >= L9_2) then
                  L6_2.name = "none-inv"
                  L6_2.label = "Glovebox-None"
                  L6_2.maxweight = 100000
                  L8_2 = {}
                  L6_2.inventory = L8_2
                  L6_2.slots = 0
                end
              end
              L8_2 = next
              L9_2 = L7_2
              L8_2 = L8_2(L9_2)
              if nil ~= L8_2 then
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                if L8_2 then
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.isOpen
                  if not L8_2 then
                    L6_2.inventory = L7_2
                    L8_2 = Gloveboxes
                    L9_2 = {}
                    L8_2[A1_2] = L9_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L8_2.items = L7_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L8_2.isOpen = L3_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.maxweight
                    L8_2.maxweight = L9_2
                  else
                    L6_2.name = "none-inv"
                    L6_2.label = "Glovebox-None"
                    L6_2.maxweight = 100000
                    L8_2 = {}
                    L6_2.inventory = L8_2
                    L6_2.slots = 0
                  end
                else
                  L6_2.inventory = L7_2
                  L8_2 = Gloveboxes
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.items = L7_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                end
              else
                L8_2 = Gloveboxes
                L8_2 = L8_2[A1_2]
                if nil ~= L8_2 then
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2 = L8_2.isOpen
                  if not L8_2 then
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L8_2.isOpen = L3_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L8_2 = L8_2.items
                    L6_2.inventory = L8_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L8_2 = Gloveboxes
                    L8_2 = L8_2[A1_2]
                    L9_2 = L6_2.maxweight
                    L8_2.maxweight = L9_2
                  else
                    L6_2.name = "none-inv"
                    L6_2.label = "Glovebox-None"
                    L6_2.maxweight = 100000
                    L8_2 = {}
                    L6_2.inventory = L8_2
                    L6_2.slots = 0
                  end
                else
                  L8_2 = Gloveboxes
                  L9_2 = {}
                  L8_2[A1_2] = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L8_2.isOpen = L3_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = {}
                  L8_2.items = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.label
                  L8_2.label = L9_2
                  L8_2 = Gloveboxes
                  L8_2 = L8_2[A1_2]
                  L9_2 = L6_2.maxweight
                  L8_2.maxweight = L9_2
                  goto lbl_2356
                end
              end
            end
          end
          ::lbl_2356::
          L7_2 = Config
          L7_2 = L7_2.EnableActionNotifications
          if L7_2 then
            L7_2 = TriggerClientEvent
            L8_2 = "ActionNotifications"
            L9_2 = L3_2
            L10_2 = "glovebox"
            L11_2 = L3_2
            L12_2 = GetPlayerName
            L13_2 = L3_2
            L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          end
        elseif "shop" == A0_2 then
          L7_2 = "itemshop-"
          L8_2 = A1_2
          L7_2 = L7_2 .. L8_2
          L6_2.name = L7_2
          L7_2 = A2_2.label
          L6_2.label = L7_2
          L6_2.maxweight = 900000
          L7_2 = SetupShopItems
          L8_2 = A1_2
          L9_2 = A2_2.items
          L7_2 = L7_2(L8_2, L9_2)
          L6_2.inventory = L7_2
          L7_2 = ShopItems
          L8_2 = {}
          L7_2[A1_2] = L8_2
          L7_2 = ShopItems
          L7_2 = L7_2[A1_2]
          L8_2 = A2_2.items
          L7_2.items = L8_2
          L7_2 = ShopItems
          L7_2 = L7_2[A1_2]
          L8_2 = A2_2.type
          L7_2.type = L8_2
          L7_2 = A2_2.items
          L7_2 = #L7_2
          L6_2.slots = L7_2
          L7_2 = Config
          L7_2 = L7_2.EnableActionNotifications
          if L7_2 then
            L7_2 = TriggerClientEvent
            L8_2 = "ActionNotifications"
            L9_2 = L3_2
            L10_2 = "shop"
            L11_2 = L3_2
            L12_2 = GetPlayerName
            L13_2 = L3_2
            L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          end
        elseif "crafting" == A0_2 then
          L6_2.name = "crafting"
          L7_2 = A2_2.label
          L6_2.label = L7_2
          L6_2.maxweight = 900000
          L7_2 = A2_2.items
          L6_2.inventory = L7_2
          L7_2 = A2_2.items
          L7_2 = #L7_2
          L6_2.slots = L7_2
        elseif "attachment_crafting" == A0_2 then
          L6_2.name = "attachment_crafting"
          L7_2 = A2_2.label
          L6_2.label = L7_2
          L6_2.maxweight = 900000
          L7_2 = A2_2.items
          L6_2.inventory = L7_2
          L7_2 = A2_2.items
          L7_2 = #L7_2
          L6_2.slots = L7_2
        elseif "garbage" == A0_2 then
          L7_2 = "garbage_"
          L8_2 = A1_2
          L7_2 = L7_2 .. L8_2
          L6_2.name = L7_2
          L7_2 = Lang
          L8_2 = "GARBAGE_LABEL"
          L7_2 = L7_2(L8_2)
          L8_2 = A1_2
          L7_2 = L7_2 .. L8_2
          L6_2.label = L7_2
          L6_2.maxweight = 100000
          L7_2 = GarbageItems
          L7_2 = L7_2[A1_2]
          if nil == L7_2 then
            L7_2 = GarbageItems
            L8_2 = {}
            L7_2[A1_2] = L8_2
            L7_2 = Config
            L7_2 = L7_2.GarbageItems
            L8_2 = A2_2.items
            L9_2 = math
            L9_2 = L9_2.random
            L10_2 = 1
            L11_2 = A2_2.items
            L11_2 = #L11_2
            L9_2 = L9_2(L10_2, L11_2)
            L8_2 = L8_2[L9_2]
            L7_2[A1_2] = L8_2
            L7_2 = GarbageItems
            L7_2 = L7_2[A1_2]
            L8_2 = Config
            L8_2 = L8_2.GarbageItems
            L8_2 = L8_2[A1_2]
            L7_2.items = L8_2
          end
          L7_2 = SetupGarbageItems
          L8_2 = A1_2
          L9_2 = GarbageItems
          L9_2 = L9_2[A1_2]
          L9_2 = L9_2.items
          L7_2 = L7_2(L8_2, L9_2)
          L6_2.inventory = L7_2
          L6_2.slots = 30
          L7_2 = Config
          L7_2 = L7_2.EnableActionNotifications
          if L7_2 then
            L7_2 = TriggerClientEvent
            L8_2 = "ActionNotifications"
            L9_2 = L3_2
            L10_2 = "garbage"
            L11_2 = L3_2
            L12_2 = GetPlayerName
            L13_2 = L3_2
            L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          end
        elseif "selling" == A0_2 then
          L7_2 = "selling-"
          L8_2 = A1_2
          L7_2 = L7_2 .. L8_2
          L6_2.name = L7_2
          L7_2 = A2_2.label
          L6_2.label = L7_2
          L6_2.maxweight = 900000
          L7_2 = SetupSellingItems
          L8_2 = A1_2
          L9_2 = A2_2.items
          L7_2 = L7_2(L8_2, L9_2)
          L6_2.inventory = L7_2
          L7_2 = SellItems
          L8_2 = {}
          L7_2[A1_2] = L8_2
          L7_2 = SellItems
          L7_2 = L7_2[A1_2]
          L8_2 = A2_2.items
          L7_2.items = L8_2
          L7_2 = A2_2.items
          L7_2 = #L7_2
          L6_2.slots = L7_2
        elseif "otherplayer" == A0_2 then
          L7_2 = Config
          L7_2 = L7_2.EnableSearchOtherPlayersInventory
          if L7_2 then
            L7_2 = Config
            L7_2 = L7_2.DistanceCheckEnable
            if L7_2 then
              L7_2 = GetPlayerPed
              L8_2 = L3_2
              L7_2 = L7_2(L8_2)
              L8_2 = GetPlayerPed
              L9_2 = A1_2
              L8_2 = L8_2(L9_2)
              L9_2 = GetEntityCoords
              L10_2 = L7_2
              L9_2 = L9_2(L10_2)
              L10_2 = GetEntityCoords
              L11_2 = L8_2
              L10_2 = L10_2(L11_2)
              L11_2 = L9_2 - L10_2
              L11_2 = #L11_2
              L12_2 = Config
              L12_2 = L12_2.DistanceCheckSteal
              if L11_2 > L12_2 then
                L12_2 = sendToDiscordStealLog
                L13_2 = L3_2
                L14_2 = A1_2
                L15_2 = L11_2
                L16_2 = 1
                L12_2(L13_2, L14_2, L15_2, L16_2)
                return
              end
            end
            L7_2 = QBCore
            L7_2 = L7_2.Functions
            L7_2 = L7_2.GetPlayer
            L8_2 = tonumber
            L9_2 = A1_2
            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L8_2(L9_2)
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            if nil ~= L7_2 then
              L8_2 = "otherplayer-"
              L9_2 = A1_2
              L8_2 = L8_2 .. L9_2
              L6_2.name = L8_2
              L6_2.id = A1_2
              L8_2 = "Player-"
              L9_2 = A1_2
              L8_2 = L8_2 .. L9_2
              L6_2.label = L8_2
              L8_2 = QBCore
              L8_2 = L8_2.Config
              L8_2 = L8_2.Player
              L8_2 = L8_2.MaxWeight
              L6_2.maxweight = L8_2
              L8_2 = L7_2.PlayerData
              L8_2 = L8_2.items
              L6_2.inventory = L8_2
              L8_2 = Config
              L8_2 = L8_2.StashSlots
              L6_2.slots = L8_2
              L8_2 = Citizen
              L8_2 = L8_2.Wait
              L9_2 = 250
              L8_2(L9_2)
            end
            L8_2 = Config
            L8_2 = L8_2.EnableActionNotifications
            if L8_2 then
              L8_2 = TriggerClientEvent
              L9_2 = "ActionNotifications"
              L10_2 = L3_2
              L11_2 = "otherplayer"
              L12_2 = L3_2
              L13_2 = GetPlayerName
              L14_2 = L3_2
              L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
              L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            end
          end
        else
          L7_2 = Drops
          L7_2 = L7_2[A1_2]
          if nil ~= L7_2 then
            L7_2 = Drops
            L7_2 = L7_2[A1_2]
            L7_2 = L7_2.isOpen
            if L7_2 then
              L7_2 = QBCore
              L7_2 = L7_2.Functions
              L7_2 = L7_2.GetPlayer
              L8_2 = Drops
              L8_2 = L8_2[A1_2]
              L8_2 = L8_2.isOpen
              L7_2 = L7_2(L8_2)
              if nil ~= L7_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "inventory:client:CheckOpenState"
                L10_2 = Drops
                L10_2 = L10_2[A1_2]
                L10_2 = L10_2.isOpen
                L11_2 = A0_2
                L12_2 = A1_2
                L13_2 = Drops
                L13_2 = L13_2[A1_2]
                L13_2 = L13_2.label
                L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
              else
                L8_2 = Drops
                L8_2 = L8_2[A1_2]
                L8_2.isOpen = false
              end
            end
          end
          L7_2 = Drops
          L7_2 = L7_2[A1_2]
          if L7_2 then
            L7_2 = Drops
            L7_2 = L7_2[A1_2]
            L7_2 = L7_2.isOpen
            if not L7_2 then
              L6_2.name = A1_2
              L7_2 = Lang
              L8_2 = "GROUND_LABEL"
              L7_2 = L7_2(L8_2)
              L8_2 = tostring
              L9_2 = A1_2
              L8_2 = L8_2(L9_2)
              L7_2 = L7_2 .. L8_2
              L6_2.label = L7_2
              L6_2.maxweight = 100000
              L7_2 = Drops
              L7_2 = L7_2[A1_2]
              L7_2 = L7_2.items
              L6_2.inventory = L7_2
              L7_2 = Config
              L7_2 = L7_2.MaxInventorySlots
              L7_2 = L7_2 - 1
              L6_2.slots = L7_2
              L7_2 = Drops
              L7_2 = L7_2[A1_2]
              L7_2.isOpen = L3_2
              L7_2 = Drops
              L7_2 = L7_2[A1_2]
              L8_2 = L6_2.label
              L7_2.label = L8_2
            else
              L7_2 = TriggerClientEvent
              L8_2 = "qs-inventory:sendMessage"
              L9_2 = L3_2
              L10_2 = Lang
              L11_2 = "INVENTORY_NOT_YOURS"
              L10_2 = L10_2(L11_2)
              L11_2 = "error"
              L7_2(L8_2, L9_2, L10_2, L11_2)
              return
            end
          else
            L6_2.name = "none-inv"
            L6_2.label = "Dropped-None"
            L6_2.maxweight = 100000
            L7_2 = {}
            L6_2.inventory = L7_2
            L6_2.slots = 0
          end
        end
        if nil ~= L4_2 then
          L7_2 = TriggerClientEvent
          L8_2 = "inventory:client:OpenInventory"
          L9_2 = L3_2
          L10_2 = 0
          L11_2 = L4_2.PlayerData
          L11_2 = L11_2.items
          L12_2 = L6_2
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
        else
          L7_2 = ShowConsoleError
          L8_2 = "^0Player = nil, es_extended possible bad installed, also check \"QSConfig.IdentifierType\" Config in qs-core config (if you use ESX Legacy, remember to enable \"QSConfig.Multicharacter\")"
          L7_2(L8_2)
        end
      elseif nil ~= L4_2 then
        L6_2 = TriggerClientEvent
        L7_2 = "inventory:client:OpenInventory"
        L8_2 = L3_2
        L9_2 = 0
        L10_2 = L4_2.PlayerData
        L10_2 = L10_2.items
        L6_2(L7_2, L8_2, L9_2, L10_2)
      else
        L6_2 = ShowConsoleError
        L7_2 = "^0Player = nil, es_extended possible bad installed, also check \"QSConfig.IdentifierType\" Config in qs-core config (if you use ESX Legacy, remember to enable \"QSConfig.Multicharacter\")"
        L6_2(L7_2)
      end
    end
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.SellItems
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = pairs
    L8_2 = L6_2.items
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = L12_2.name
      if L13_2 == A0_2 then
        L13_2 = L12_2.price
        return L13_2
      end
    end
  end
  L1_2 = false
  return L1_2
end
L1_1 = RegisterServerEvent
L2_1 = "inventory:server:SaveInventory"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "inventory:server:SaveInventory"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = source
  if "trunk" == A0_2 then
    L3_2 = Trunks
    L3_2 = L3_2[A1_2]
    if L3_2 then
      L3_2 = Trunks
      L3_2 = L3_2[A1_2]
      L3_2 = L3_2.isOpen
      if L3_2 == L2_2 then
        L3_2 = SaveOwnedVehicleItems
        L4_2 = A1_2
        L5_2 = Trunks
        L5_2 = L5_2[A1_2]
        L5_2 = L5_2.items
        L3_2(L4_2, L5_2)
      end
    end
  elseif "glovebox" == A0_2 then
    L3_2 = Gloveboxes
    L3_2 = L3_2[A1_2]
    if L3_2 then
      L3_2 = Gloveboxes
      L3_2 = L3_2[A1_2]
      L3_2 = L3_2.isOpen
      if L3_2 == L2_2 then
        L3_2 = SaveOwnedGloveboxItems
        L4_2 = A1_2
        L5_2 = Gloveboxes
        L5_2 = L5_2[A1_2]
        L5_2 = L5_2.items
        L3_2(L4_2, L5_2)
      end
    end
  elseif "stash" == A0_2 then
    L3_2 = Stashes
    L3_2 = L3_2[A1_2]
    if L3_2 then
      L3_2 = Stashes
      L3_2 = L3_2[A1_2]
      L3_2 = L3_2.isOpen
      if L3_2 == L2_2 then
        L3_2 = SaveStashItems
        L4_2 = A1_2
        L5_2 = Stashes
        L5_2 = L5_2[A1_2]
        L5_2 = L5_2.items
        L3_2(L4_2, L5_2)
      end
    end
  elseif "drop" == A0_2 then
    L3_2 = Drops
    L3_2 = L3_2[A1_2]
    if L3_2 then
      L3_2 = Drops
      L3_2 = L3_2[A1_2]
      L3_2 = L3_2.isOpen
      if L3_2 == L2_2 then
        L3_2 = Drops
        L3_2 = L3_2[A1_2]
        L3_2.isOpen = false
        L3_2 = Drops
        L3_2 = L3_2[A1_2]
        L3_2 = L3_2.items
        if nil ~= L3_2 then
          L3_2 = next
          L4_2 = Drops
          L4_2 = L4_2[A1_2]
          L4_2 = L4_2.items
          L3_2 = L3_2(L4_2)
          if nil ~= L3_2 then
            goto lbl_89
          end
        end
        L3_2 = Drops
        L3_2[A1_2] = nil
        L3_2 = TriggerClientEvent
        L4_2 = "inventory:client:RemoveDropItem"
        L5_2 = -1
        L6_2 = A1_2
        L3_2(L4_2, L5_2, L6_2)
      end
    end
  end
  ::lbl_89::
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "inventory:server:UseItemSlot"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "inventory:server:UseItemSlot"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = source
    L4_2 = QS
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = L4_2.GetItemBySlot
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    L6_2 = A1_2 or L6_2
    if not A1_2 then
      L6_2 = false
    end
    if nil ~= L5_2 then
      L7_2 = QS
      L7_2 = L7_2.Shared
      L7_2 = L7_2.Items
      L8_2 = L5_2.name
      L7_2 = L7_2[L8_2]
      L8_2 = L5_2.type
      if "weapon" == L8_2 then
        L8_2 = L5_2.info
        L8_2 = L8_2.quality
        if nil ~= L8_2 then
          L8_2 = L5_2.info
          L8_2 = L8_2.quality
          if L8_2 > 0 then
            L8_2 = TriggerClientEvent
            L9_2 = "inventory:client:UseWeapon"
            L10_2 = L3_2
            L11_2 = L5_2
            L12_2 = true
            L8_2(L9_2, L10_2, L11_2, L12_2)
          else
            L8_2 = TriggerClientEvent
            L9_2 = "inventory:client:UseWeapon"
            L10_2 = L3_2
            L11_2 = L5_2
            L12_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
        else
          L8_2 = TriggerClientEvent
          L9_2 = "inventory:client:UseWeapon"
          L10_2 = L3_2
          L11_2 = L5_2
          L12_2 = true
          L8_2(L9_2, L10_2, L11_2, L12_2)
        end
        L8_2 = Config
        L8_2 = L8_2.ShowWeapons
        if L8_2 then
          L8_2 = TriggerClientEvent
          L9_2 = "inventory:client:ItemBox"
          L10_2 = L3_2
          L11_2 = L7_2
          L12_2 = "use"
          L8_2(L9_2, L10_2, L11_2, L12_2)
        end
      else
        L8_2 = L5_2.useable
        if L8_2 then
          if L6_2 then
            L8_2 = Config
            L8_2 = L8_2.ItemsUsableFromHotbar
            if not L8_2 then
          end
          elseif A2_2 then
            L8_2 = Config
            L8_2 = L8_2.ItemsUsableFromHotbarInVehicle
            if L8_2 then
              L8_2 = TriggerClientEvent
              L9_2 = "qs-core:useItem"
              L10_2 = L3_2
              L11_2 = L5_2
              L8_2(L9_2, L10_2, L11_2)
              L8_2 = Config
              L8_2 = L8_2.ShowItems
              if L8_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "inventory:client:ItemBox"
                L10_2 = L3_2
                L11_2 = L7_2
                L12_2 = "use"
                L8_2(L9_2, L10_2, L11_2, L12_2)
                L8_2 = L5_2.name
                if "vehiclekeys" == L8_2 then
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-vehiclekeys:client:vehicleControl"
                  L10_2 = L3_2
                  L11_2 = L5_2.info
                  L11_2 = L11_2.vPlate
                  L8_2(L9_2, L10_2, L11_2)
                end
              end
            end
          else
            L8_2 = TriggerClientEvent
            L9_2 = "qs-core:useItem"
            L10_2 = L3_2
            L11_2 = L5_2
            L8_2(L9_2, L10_2, L11_2)
            L8_2 = Config
            L8_2 = L8_2.ShowItems
            if L8_2 then
              L8_2 = TriggerClientEvent
              L9_2 = "inventory:client:ItemBox"
              L10_2 = L3_2
              L11_2 = L7_2
              L12_2 = "use"
              L8_2(L9_2, L10_2, L11_2, L12_2)
              L8_2 = L5_2.name
              if "vehiclekeys" == L8_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "qs-vehiclekeys:client:vehicleControl"
                L10_2 = L3_2
                L11_2 = L5_2.info
                L11_2 = L11_2.vPlate
                L8_2(L9_2, L10_2, L11_2)
              end
            end
          end
        end
      end
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = source
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = L4_2.Functions
      L5_2 = L5_2.GetItemBySlot
      L6_2 = A0_2
      L5_2 = L5_2(L6_2)
      L6_2 = A1_2 or L6_2
      if not A1_2 then
        L6_2 = false
      end
      if nil ~= L5_2 then
        L7_2 = QBCore
        L7_2 = L7_2.Shared
        L7_2 = L7_2.Items
        L8_2 = L5_2.name
        L7_2 = L7_2[L8_2]
        L8_2 = L5_2.type
        if "weapon" == L8_2 then
          L8_2 = L5_2.info
          L8_2 = L8_2.quality
          if nil ~= L8_2 then
            L8_2 = L5_2.info
            L8_2 = L8_2.quality
            if L8_2 > 0 then
              L8_2 = TriggerClientEvent
              L9_2 = "inventory:client:UseWeapon"
              L10_2 = L3_2
              L11_2 = L5_2
              L12_2 = true
              L8_2(L9_2, L10_2, L11_2, L12_2)
            else
              L8_2 = TriggerClientEvent
              L9_2 = "inventory:client:UseWeapon"
              L10_2 = L3_2
              L11_2 = L5_2
              L12_2 = false
              L8_2(L9_2, L10_2, L11_2, L12_2)
            end
          else
            L8_2 = TriggerClientEvent
            L9_2 = "inventory:client:UseWeapon"
            L10_2 = L3_2
            L11_2 = L5_2
            L12_2 = true
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
          L8_2 = Config
          L8_2 = L8_2.ShowWeapons
          if L8_2 then
            L8_2 = TriggerClientEvent
            L9_2 = "inventory:client:ItemBox"
            L10_2 = L3_2
            L11_2 = L7_2
            L12_2 = "use"
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
        else
          L8_2 = L5_2.useable
          if L8_2 then
            if L6_2 then
              L8_2 = Config
              L8_2 = L8_2.ItemsUsableFromHotbar
              if not L8_2 then
            end
            elseif A2_2 then
              L8_2 = Config
              L8_2 = L8_2.ItemsUsableFromHotbarInVehicle
              if L8_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "QBCore:Client:UseItem"
                L10_2 = L3_2
                L11_2 = L5_2
                L8_2(L9_2, L10_2, L11_2)
                L8_2 = Config
                L8_2 = L8_2.ShowItems
                if L8_2 then
                  L8_2 = TriggerClientEvent
                  L9_2 = "inventory:client:ItemBox"
                  L10_2 = L3_2
                  L11_2 = L7_2
                  L12_2 = "use"
                  L8_2(L9_2, L10_2, L11_2, L12_2)
                  L8_2 = L5_2.name
                  if "vehiclekeys" == L8_2 then
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-vehiclekeys:client:vehicleControl"
                    L10_2 = L3_2
                    L11_2 = L5_2.info
                    L11_2 = L11_2.vPlate
                    L8_2(L9_2, L10_2, L11_2)
                  end
                end
              end
            else
              L8_2 = TriggerClientEvent
              L9_2 = "QBCore:Client:UseItem"
              L10_2 = L3_2
              L11_2 = L5_2
              L8_2(L9_2, L10_2, L11_2)
              L8_2 = Config
              L8_2 = L8_2.ShowItems
              if L8_2 then
                L8_2 = TriggerClientEvent
                L9_2 = "inventory:client:ItemBox"
                L10_2 = L3_2
                L11_2 = L7_2
                L12_2 = "use"
                L8_2(L9_2, L10_2, L11_2, L12_2)
                L8_2 = L5_2.name
                if "vehiclekeys" == L8_2 then
                  L8_2 = TriggerClientEvent
                  L9_2 = "qs-vehiclekeys:client:vehicleControl"
                  L10_2 = L3_2
                  L11_2 = L5_2.info
                  L11_2 = L11_2.vPlate
                  L8_2(L9_2, L10_2, L11_2)
                end
              end
            end
          end
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "inventory:server:CraftItems"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "inventory:server:CraftItems"
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L5_2 = Config
  L5_2 = L5_2.Framework
  if "ESX" == L5_2 then
    L5_2 = source
    L6_2 = QS
    L6_2 = L6_2.GetPlayerFromId
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    L7_2 = ESX
    L7_2 = L7_2.GetPlayerFromId
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    L8_2 = tonumber
    L9_2 = A2_2
    L8_2 = L8_2(L9_2)
    if L6_2 and L7_2 and nil ~= A0_2 and nil ~= A1_2 then
      L9_2 = false
      L10_2 = pairs
      L11_2 = A1_2
      L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
      for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
        L16_2 = L7_2.getInventoryItem
        L18_2 = L14_2
        L17_2 = L14_2.lower
        L17_2, L18_2 = L17_2(L18_2)
        L16_2 = L16_2(L17_2, L18_2)
        if L16_2 then
          L17_2 = L16_2.count
          L18_2 = L15_2 * L8_2
          if L17_2 >= L18_2 then
            L9_2 = true
        end
        else
          L9_2 = false
          break
        end
      end
      if L9_2 then
        L10_2 = L6_2.addItem
        L11_2 = A0_2
        L12_2 = L8_2
        L13_2 = A3_2
        L10_2 = L10_2(L11_2, L12_2, L13_2)
        if L10_2 then
          L10_2 = pairs
          L11_2 = A1_2
          L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
          for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
            L16_2 = L6_2.removeItem
            L17_2 = L14_2
            L18_2 = L15_2 * L8_2
            L16_2(L17_2, L18_2)
          end
          L10_2 = L6_2.SetMetaData
          L11_2 = "craftingrep"
          L12_2 = L6_2.PlayerData
          L12_2 = L12_2.metadata
          L12_2 = L12_2.craftingrep
          L13_2 = A4_2 * L8_2
          L12_2 = L12_2 + L13_2
          L10_2(L11_2, L12_2)
          L10_2 = TriggerClientEvent
          L11_2 = "inventory:client:ItemBox"
          L12_2 = L5_2
          L13_2 = QS
          L13_2 = L13_2.Shared
          L13_2 = L13_2.Items
          L13_2 = L13_2[A0_2]
          L14_2 = "add"
          L10_2(L11_2, L12_2, L13_2, L14_2)
          L10_2 = TriggerClientEvent
          L11_2 = "inventory:client:UpdatePlayerInventory"
          L12_2 = L5_2
          L13_2 = false
          L10_2(L11_2, L12_2, L13_2)
        end
      end
    end
  else
    L5_2 = Config
    L5_2 = L5_2.Framework
    if "QBCore" == L5_2 then
      L5_2 = source
      L6_2 = QBCore
      L6_2 = L6_2.Functions
      L6_2 = L6_2.GetPlayer
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      L7_2 = QBCore
      L7_2 = L7_2.Functions
      L7_2 = L7_2.GetPlayer
      L8_2 = L5_2
      L7_2 = L7_2(L8_2)
      L8_2 = tonumber
      L9_2 = A2_2
      L8_2 = L8_2(L9_2)
      if L6_2 and L7_2 and nil ~= A0_2 and nil ~= A1_2 then
        L9_2 = false
        L10_2 = pairs
        L11_2 = A1_2
        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
        for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
          L16_2 = L7_2.getInventoryItem
          L18_2 = L14_2
          L17_2 = L14_2.lower
          L17_2, L18_2 = L17_2(L18_2)
          L16_2 = L16_2(L17_2, L18_2)
          if L16_2 then
            L17_2 = L16_2.count
            L18_2 = L15_2 * L8_2
            if L17_2 >= L18_2 then
              L9_2 = true
          end
          else
            L9_2 = false
            break
          end
        end
        if L9_2 then
          L10_2 = L6_2.Functions
          L10_2 = L10_2.AddItem
          L11_2 = A0_2
          L12_2 = L8_2
          L13_2 = A3_2
          L10_2 = L10_2(L11_2, L12_2, L13_2)
          if L10_2 then
            L10_2 = pairs
            L11_2 = A1_2
            L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
            for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
              L16_2 = L6_2.Functions
              L16_2 = L16_2.RemoveItem
              L17_2 = L14_2
              L18_2 = L15_2 * L8_2
              L16_2(L17_2, L18_2)
            end
            L10_2 = L6_2.SetMetaData
            L11_2 = "craftingrep"
            L12_2 = L6_2.PlayerData
            L12_2 = L12_2.metadata
            L12_2 = L12_2.craftingrep
            L13_2 = A4_2 * L8_2
            L12_2 = L12_2 + L13_2
            L10_2(L11_2, L12_2)
            L10_2 = TriggerClientEvent
            L11_2 = "inventory:client:ItemBox"
            L12_2 = L5_2
            L13_2 = QBCore
            L13_2 = L13_2.Shared
            L13_2 = L13_2.Items
            L13_2 = L13_2[A0_2]
            L14_2 = "add"
            L10_2(L11_2, L12_2, L13_2, L14_2)
            L10_2 = TriggerClientEvent
            L11_2 = "inventory:client:UpdatePlayerInventory"
            L12_2 = L5_2
            L13_2 = false
            L10_2(L11_2, L12_2, L13_2)
          end
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "inventory:server:SetInventoryData"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "inventory:server:SetInventoryData"
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L6_2 = Config
  L6_2 = L6_2.Framework
  if "ESX" == L6_2 then
    L6_2 = source
    L7_2 = QS
    L7_2 = L7_2.GetPlayerFromId
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L8_2 = ESX
    L8_2 = L8_2.GetPlayerFromId
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    L9_2 = tonumber
    L10_2 = A2_2
    L9_2 = L9_2(L10_2)
    L10_2 = tonumber
    L11_2 = A3_2
    L10_2 = L10_2(L11_2)
    if A4_2 then
      L11_2 = tonumber
      L12_2 = A4_2
      L11_2 = L11_2(L12_2)
      if L11_2 then
        L11_2 = tonumber
        L12_2 = A4_2
        L11_2 = L11_2(L12_2)
        L12_2 = math
        L12_2 = L12_2.floor
        L13_2 = tonumber
        L14_2 = A4_2
        L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L13_2(L14_2)
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        if L11_2 ~= L12_2 then
          L11_2 = TriggerClientEvent
          L12_2 = "qs-inventory:closeInventory"
          L13_2 = L6_2
          L11_2(L12_2, L13_2)
          return
        end
      end
    end
    if "player" == A0_2 or "hotbar" == A0_2 then
      L11_2 = QS
      L11_2 = L11_2.Shared
      L11_2 = L11_2.SplitStr
      L12_2 = A1_2
      L13_2 = "-"
      L11_2 = L11_2(L12_2, L13_2)
      L11_2 = L11_2[1]
      if "itemshop" == L11_2 or "crafting" == A1_2 then
        return
      end
    end
    L11_2 = QS
    L11_2 = L11_2.Shared
    L11_2 = L11_2.SplitStr
    L12_2 = A0_2
    L13_2 = "-"
    L11_2 = L11_2(L12_2, L13_2)
    L11_2 = L11_2[1]
    if "selling" == L11_2 then
      return
    end
    if "player" == A0_2 or "hotbar" == A0_2 then
      L11_2 = QS
      L11_2 = L11_2.Shared
      L11_2 = L11_2.SplitStr
      L12_2 = A1_2
      L13_2 = "-"
      L11_2 = L11_2(L12_2, L13_2)
      L11_2 = L11_2[1]
      if "selling" == L11_2 then
        L11_2 = L7_2.GetItemBySlot
        L12_2 = L9_2
        L11_2 = L11_2(L12_2)
        L12_2 = tonumber
        L13_2 = A4_2
        L12_2 = L12_2(L13_2)
        if nil ~= L12_2 then
          L12_2 = tonumber
          L13_2 = A4_2
          L12_2 = L12_2(L13_2)
          if L12_2 then
            goto lbl_96
          end
        end
        L12_2 = L11_2.amount
        ::lbl_96::
        if nil ~= L11_2 then
          L13_2 = L11_2.amount
          if L12_2 <= L13_2 then
            L13_2 = QS
            L13_2 = L13_2.Shared
            L13_2 = L13_2.SplitStr
            L14_2 = A1_2
            L15_2 = "-"
            L13_2 = L13_2(L14_2, L15_2)
            L13_2 = L13_2[2]
            L14_2 = SellItems
            L14_2 = L14_2[L13_2]
            L14_2 = L14_2.items
            L14_2 = L14_2[L10_2]
            if L14_2 then
              L15_2 = L14_2.name
              L16_2 = L11_2.name
              if L15_2 == L16_2 then
                L15_2 = L7_2.removeItem
                L16_2 = L11_2.name
                L17_2 = L12_2
                L18_2 = L9_2
                L15_2(L16_2, L17_2, L18_2)
                L15_2 = L0_1
                L16_2 = L11_2.name
                L15_2 = L15_2(L16_2)
                if not L15_2 then
                  L16_2 = print
                  L17_2 = "MISSING PRICE !"
                  return L16_2(L17_2)
                end
                L16_2 = L8_2.addMoney
                L17_2 = L15_2 * L12_2
                L16_2(L17_2)
                L16_2 = TriggerClientEvent
                L17_2 = "qs-inventory:sendMessage"
                L18_2 = L6_2
                L19_2 = Lang
                L20_2 = "SALES_SUCCESS"
                L19_2 = L19_2(L20_2)
                L20_2 = L15_2 * L12_2
                L19_2 = L19_2 .. L20_2
                L20_2 = "success"
                L16_2(L17_2, L18_2, L19_2, L20_2)
            end
            else
              L15_2 = TriggerClientEvent
              L16_2 = "qs-inventory:sendMessage"
              L17_2 = L6_2
              L18_2 = Lang
              L19_2 = "SALES_INVALID"
              L18_2 = L18_2(L19_2)
              L19_2 = "error"
              L15_2(L16_2, L17_2, L18_2, L19_2)
            end
        end
        else
          L13_2 = TriggerClientEvent
          L14_2 = "qs-inventory:sendMessage"
          L15_2 = L6_2
          L16_2 = Lang
          L17_2 = "INVENTORY_INVALID"
          L16_2 = L16_2(L17_2)
          L17_2 = "error"
          L13_2(L14_2, L15_2, L16_2, L17_2)
        end
      else
        L11_2 = L7_2.GetItemBySlot
        L12_2 = L9_2
        L11_2 = L11_2(L12_2)
        L12_2 = tonumber
        L13_2 = A4_2
        L12_2 = L12_2(L13_2)
        if nil ~= L12_2 then
          L12_2 = tonumber
          L13_2 = A4_2
          L12_2 = L12_2(L13_2)
          if L12_2 then
            goto lbl_180
          end
        end
        L12_2 = L11_2.amount
        ::lbl_180::
        if nil ~= L11_2 then
          L13_2 = L11_2.amount
          if L12_2 <= L13_2 then
            if "player" == A1_2 or "hotbar" == A1_2 then
              L13_2 = L7_2.GetItemBySlot
              L14_2 = L10_2
              L13_2 = L13_2(L14_2)
              L14_2 = L7_2.removeItem
              L15_2 = L11_2.name
              L16_2 = L12_2
              L17_2 = L9_2
              L14_2(L15_2, L16_2, L17_2)
              L14_2 = TriggerClientEvent
              L15_2 = "inventory:client:CheckWeapon"
              L16_2 = L6_2
              L17_2 = L11_2.name
              L14_2(L15_2, L16_2, L17_2)
              if nil ~= L13_2 then
                L14_2 = tonumber
                L15_2 = A5_2
                L14_2 = L14_2(L15_2)
                if nil ~= L14_2 then
                  L14_2 = tonumber
                  L15_2 = A5_2
                  L14_2 = L14_2(L15_2)
                  if L14_2 then
                    goto lbl_215
                  end
                end
                L14_2 = L13_2.amount
                ::lbl_215::
                L15_2 = L13_2.name
                L16_2 = L11_2.name
                if L15_2 ~= L16_2 then
                  L15_2 = L7_2.removeItem
                  L16_2 = L13_2.name
                  L17_2 = L14_2
                  L18_2 = L10_2
                  L15_2(L16_2, L17_2, L18_2)
                  L15_2 = L7_2.addItem
                  L16_2 = L13_2.name
                  L17_2 = L14_2
                  L18_2 = L9_2
                  L19_2 = L13_2.info
                  L15_2(L16_2, L17_2, L18_2, L19_2)
                end
              end
              L14_2 = L7_2.addItem
              L15_2 = L11_2.name
              L16_2 = L12_2
              L17_2 = L10_2
              L18_2 = L11_2.info
              L14_2(L15_2, L16_2, L17_2, L18_2)
            else
              L13_2 = QS
              L13_2 = L13_2.Shared
              L13_2 = L13_2.SplitStr
              L14_2 = A1_2
              L15_2 = "-"
              L13_2 = L13_2(L14_2, L15_2)
              L13_2 = L13_2[1]
              if "otherplayer" == L13_2 then
                L13_2 = Config
                L13_2 = L13_2.EnableSearchOtherPlayersInventory
                if L13_2 then
                  L13_2 = tonumber
                  L14_2 = QS
                  L14_2 = L14_2.Shared
                  L14_2 = L14_2.SplitStr
                  L15_2 = A1_2
                  L16_2 = "-"
                  L14_2 = L14_2(L15_2, L16_2)
                  L14_2 = L14_2[2]
                  L13_2 = L13_2(L14_2)
                  L14_2 = QS
                  L14_2 = L14_2.GetPlayerFromId
                  L15_2 = L13_2
                  L14_2 = L14_2(L15_2)
                  if L14_2 then
                    L15_2 = L14_2.PlayerData
                    L15_2 = L15_2.items
                    L15_2 = L15_2[L10_2]
                    if nil ~= L15_2 then
                      L16_2 = L15_2.unique
                      if L16_2 then
                        L16_2 = L11_2.unique
                      end
                      if not L16_2 then
                        L16_2 = L15_2.name
                        L17_2 = L16_2
                        L16_2 = L16_2.lower
                        L16_2 = L16_2(L17_2)
                        L17_2 = L11_2.name
                        L18_2 = L17_2
                        L17_2 = L17_2.lower
                        L17_2 = L17_2(L18_2)
                        if L16_2 ~= L17_2 then
                        else
                          L16_2 = L8_2.getInventoryItem
                          L17_2 = L11_2.name
                          L18_2 = L17_2
                          L17_2 = L17_2.lower
                          L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2(L18_2)
                          L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                          L16_2 = L16_2.count
                          if L12_2 <= L16_2 then
                            L17_2 = L7_2.removeItem
                            L18_2 = L11_2.name
                            L19_2 = L12_2
                            L20_2 = L9_2
                            L17_2(L18_2, L19_2, L20_2)
                            L17_2 = TriggerClientEvent
                            L18_2 = "inventory:client:CheckWeapon"
                            L19_2 = L6_2
                            L20_2 = L11_2.name
                            L17_2(L18_2, L19_2, L20_2)
                            L17_2 = QS
                            L17_2 = L17_2.Shared
                            L17_2 = L17_2.Items
                            L18_2 = L11_2.name
                            L19_2 = L18_2
                            L18_2 = L18_2.lower
                            L18_2 = L18_2(L19_2)
                            L17_2 = L17_2[L18_2]
                            L18_2 = L14_2.addItem
                            L19_2 = L17_2.name
                            L20_2 = L12_2
                            L21_2 = L10_2
                            L22_2 = L11_2.info
                            L18_2(L19_2, L20_2, L21_2, L22_2)
                            L18_2 = TriggerClientEvent
                            L19_2 = "qs-inventory:sendMessage"
                            L20_2 = L13_2
                            L21_2 = Lang
                            L22_2 = "INVENTORY_RECEIVE_ITEM"
                            L21_2 = L21_2(L22_2)
                            L22_2 = L17_2.label
                            L23_2 = " x"
                            L24_2 = L12_2
                            L21_2 = L21_2 .. L22_2 .. L23_2 .. L24_2
                            L22_2 = "inform"
                            L18_2(L19_2, L20_2, L21_2, L22_2)
                          else
                            L17_2 = UpdateInventory
                            L18_2 = L6_2
                            L17_2(L18_2)
                          end
                        end
                      end
                    end
                  end
                end
              else
                L13_2 = QS
                L13_2 = L13_2.Shared
                L13_2 = L13_2.SplitStr
                L14_2 = A1_2
                L15_2 = "-"
                L13_2 = L13_2(L14_2, L15_2)
                L13_2 = L13_2[1]
                if "trunk" == L13_2 then
                  L13_2 = QS
                  L13_2 = L13_2.Shared
                  L13_2 = L13_2.SplitStr
                  L14_2 = A1_2
                  L15_2 = "-"
                  L13_2 = L13_2(L14_2, L15_2)
                  L13_2 = L13_2[2]
                  L14_2 = Trunks
                  L14_2 = L14_2[L13_2]
                  if L14_2 then
                    L14_2 = Trunks
                    L14_2 = L14_2[L13_2]
                    L14_2 = L14_2.isOpen
                    if L14_2 then
                      L14_2 = Trunks
                      L14_2 = L14_2[L13_2]
                      L14_2 = L14_2.isOpen
                      if L14_2 == L6_2 then
                        L14_2 = Trunks
                        L14_2 = L14_2[L13_2]
                        L14_2 = L14_2.items
                        L14_2 = L14_2[L10_2]
                        L15_2 = QS
                        L15_2 = L15_2.Shared
                        L15_2 = L15_2.Items
                        L16_2 = L11_2.name
                        L17_2 = L16_2
                        L16_2 = L16_2.lower
                        L16_2 = L16_2(L17_2)
                        L15_2 = L15_2[L16_2]
                        if nil ~= L14_2 then
                          L16_2 = L14_2.unique
                          if L16_2 then
                            L16_2 = L11_2.unique
                          end
                          if not L16_2 then
                            L16_2 = L14_2.name
                            L17_2 = L16_2
                            L16_2 = L16_2.lower
                            L16_2 = L16_2(L17_2)
                            L17_2 = L11_2.name
                            L18_2 = L17_2
                            L17_2 = L17_2.lower
                            L17_2 = L17_2(L18_2)
                            if L16_2 ~= L17_2 then
                            else
                              L16_2 = L8_2.getInventoryItem
                              L17_2 = L11_2.name
                              L18_2 = L17_2
                              L17_2 = L17_2.lower
                              L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2(L18_2)
                              L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                              L16_2 = L16_2.count
                              if L12_2 <= L16_2 then
                                L17_2 = AddToTrunk
                                L18_2 = L13_2
                                L19_2 = L10_2
                                L20_2 = L9_2
                                L21_2 = L15_2.name
                                L22_2 = L12_2
                                L23_2 = L11_2.info
                                L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                                if L17_2 then
                                  L17_2 = L7_2.removeItem
                                  L18_2 = L11_2.name
                                  L19_2 = L12_2
                                  L20_2 = L9_2
                                  L17_2(L18_2, L19_2, L20_2)
                                  L17_2 = sendToDiscordVehicles
                                  L18_2 = Config
                                  L18_2 = L18_2.WebhookTranslates
                                  L18_2 = L18_2.vehicles
                                  L18_2 = L18_2.title
                                  L19_2 = "**"
                                  L20_2 = GetPlayerName
                                  L21_2 = L6_2
                                  L20_2 = L20_2(L21_2)
                                  L21_2 = Config
                                  L21_2 = L21_2.WebhookTranslates
                                  L21_2 = L21_2.vehicles
                                  L21_2 = L21_2.trunk_deposit
                                  L22_2 = L13_2
                                  L23_2 = Config
                                  L23_2 = L23_2.WebhookTranslates
                                  L23_2 = L23_2.vehicles
                                  L23_2 = L23_2.item_remove
                                  L24_2 = L15_2.name
                                  L25_2 = " x "
                                  L26_2 = L12_2
                                  L19_2 = L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2
                                  L20_2 = 7393279
                                  L17_2(L18_2, L19_2, L20_2)
                                  L17_2 = TriggerClientEvent
                                  L18_2 = "inventory:client:CheckWeapon"
                                  L19_2 = L6_2
                                  L20_2 = L11_2.name
                                  L17_2(L18_2, L19_2, L20_2)
                                else
                                  L17_2 = UpdateInventory
                                  L18_2 = L6_2
                                  L17_2(L18_2)
                                end
                              else
                                L17_2 = UpdateInventory
                                L18_2 = L6_2
                                L17_2(L18_2)
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                else
                  L13_2 = QS
                  L13_2 = L13_2.Shared
                  L13_2 = L13_2.SplitStr
                  L14_2 = A1_2
                  L15_2 = "-"
                  L13_2 = L13_2(L14_2, L15_2)
                  L13_2 = L13_2[1]
                  if "glovebox" == L13_2 then
                    L13_2 = QS
                    L13_2 = L13_2.Shared
                    L13_2 = L13_2.SplitStr
                    L14_2 = A1_2
                    L15_2 = "-"
                    L13_2 = L13_2(L14_2, L15_2)
                    L13_2 = L13_2[2]
                    L14_2 = Gloveboxes
                    L14_2 = L14_2[L13_2]
                    if L14_2 then
                      L14_2 = Gloveboxes
                      L14_2 = L14_2[L13_2]
                      L14_2 = L14_2.isOpen
                      if L14_2 then
                        L14_2 = Gloveboxes
                        L14_2 = L14_2[L13_2]
                        L14_2 = L14_2.isOpen
                        if L14_2 == L6_2 then
                          L14_2 = Gloveboxes
                          L14_2 = L14_2[L13_2]
                          L14_2 = L14_2.items
                          L14_2 = L14_2[L10_2]
                          L15_2 = QS
                          L15_2 = L15_2.Shared
                          L15_2 = L15_2.Items
                          L16_2 = L11_2.name
                          L17_2 = L16_2
                          L16_2 = L16_2.lower
                          L16_2 = L16_2(L17_2)
                          L15_2 = L15_2[L16_2]
                          if nil ~= L14_2 then
                            L16_2 = L14_2.unique
                            if L16_2 then
                              L16_2 = L11_2.unique
                            end
                            if not L16_2 then
                              L16_2 = L14_2.name
                              L17_2 = L16_2
                              L16_2 = L16_2.lower
                              L16_2 = L16_2(L17_2)
                              L17_2 = L11_2.name
                              L18_2 = L17_2
                              L17_2 = L17_2.lower
                              L17_2 = L17_2(L18_2)
                              if L16_2 ~= L17_2 then
                              else
                                L16_2 = L8_2.getInventoryItem
                                L17_2 = L11_2.name
                                L18_2 = L17_2
                                L17_2 = L17_2.lower
                                L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2(L18_2)
                                L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                                L16_2 = L16_2.count
                                if L12_2 <= L16_2 then
                                  L17_2 = AddToGlovebox
                                  L18_2 = L13_2
                                  L19_2 = L10_2
                                  L20_2 = L9_2
                                  L21_2 = L15_2.name
                                  L22_2 = L12_2
                                  L23_2 = L11_2.info
                                  L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                                  if L17_2 then
                                    L17_2 = L7_2.removeItem
                                    L18_2 = L11_2.name
                                    L19_2 = L12_2
                                    L20_2 = L9_2
                                    L17_2(L18_2, L19_2, L20_2)
                                    L17_2 = TriggerClientEvent
                                    L18_2 = "inventory:client:CheckWeapon"
                                    L19_2 = L6_2
                                    L20_2 = L11_2.name
                                    L17_2(L18_2, L19_2, L20_2)
                                    L17_2 = sendToDiscordVehicles
                                    L18_2 = Config
                                    L18_2 = L18_2.WebhookTranslates
                                    L18_2 = L18_2.vehicles
                                    L18_2 = L18_2.title
                                    L19_2 = "**"
                                    L20_2 = GetPlayerName
                                    L21_2 = L6_2
                                    L20_2 = L20_2(L21_2)
                                    L21_2 = Config
                                    L21_2 = L21_2.WebhookTranslates
                                    L21_2 = L21_2.vehicles
                                    L21_2 = L21_2.glove_deposit
                                    L22_2 = L13_2
                                    L23_2 = Config
                                    L23_2 = L23_2.WebhookTranslates
                                    L23_2 = L23_2.vehicles
                                    L23_2 = L23_2.item_deposit
                                    L24_2 = L15_2.name
                                    L25_2 = " x "
                                    L26_2 = L12_2
                                    L19_2 = L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2
                                    L20_2 = 7393279
                                    L17_2(L18_2, L19_2, L20_2)
                                  else
                                    L17_2 = UpdateInventory
                                    L18_2 = L6_2
                                    L17_2(L18_2)
                                  end
                                else
                                  L17_2 = UpdateInventory
                                  L18_2 = L6_2
                                  L17_2(L18_2)
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  else
                    L13_2 = QS
                    L13_2 = L13_2.Shared
                    L13_2 = L13_2.SplitStr
                    L14_2 = A1_2
                    L15_2 = "-"
                    L13_2 = L13_2(L14_2, L15_2)
                    L13_2 = L13_2[1]
                    if "stash" == L13_2 then
                      L13_2 = QS
                      L13_2 = L13_2.Shared
                      L13_2 = L13_2.SplitStr
                      L14_2 = A1_2
                      L15_2 = "-"
                      L13_2 = L13_2(L14_2, L15_2)
                      L13_2 = L13_2[2]
                      L14_2 = Stashes
                      L14_2 = L14_2[L13_2]
                      if L14_2 then
                        L14_2 = Stashes
                        L14_2 = L14_2[L13_2]
                        L14_2 = L14_2.isOpen
                        if L14_2 then
                          L14_2 = Stashes
                          L14_2 = L14_2[L13_2]
                          L14_2 = L14_2.isOpen
                          if L14_2 == L6_2 then
                            L14_2 = Stashes
                            L14_2 = L14_2[L13_2]
                            L14_2 = L14_2.items
                            L14_2 = L14_2[L10_2]
                            L15_2 = QS
                            L15_2 = L15_2.Shared
                            L15_2 = L15_2.Items
                            L16_2 = L11_2.name
                            L17_2 = L16_2
                            L16_2 = L16_2.lower
                            L16_2 = L16_2(L17_2)
                            L15_2 = L15_2[L16_2]
                            if nil ~= L14_2 then
                              L16_2 = L14_2.unique
                              if L16_2 then
                                L16_2 = L11_2.unique
                              end
                              if not L16_2 then
                                L16_2 = L14_2.name
                                L17_2 = L16_2
                                L16_2 = L16_2.lower
                                L16_2 = L16_2(L17_2)
                                L17_2 = L11_2.name
                                L18_2 = L17_2
                                L17_2 = L17_2.lower
                                L17_2 = L17_2(L18_2)
                                if L16_2 ~= L17_2 then
                                else
                                  L16_2 = L8_2.getInventoryItem
                                  L17_2 = L11_2.name
                                  L18_2 = L17_2
                                  L17_2 = L17_2.lower
                                  L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2(L18_2)
                                  L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                                  L16_2 = L16_2.count
                                  if L12_2 <= L16_2 then
                                    L17_2 = AddToStash
                                    L18_2 = L13_2
                                    L19_2 = L10_2
                                    L20_2 = L9_2
                                    L21_2 = L15_2.name
                                    L22_2 = L12_2
                                    L23_2 = L11_2.info
                                    L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                                    if L17_2 then
                                      L17_2 = L7_2.removeItem
                                      L18_2 = L11_2.name
                                      L19_2 = L12_2
                                      L20_2 = L9_2
                                      L17_2(L18_2, L19_2, L20_2)
                                      L17_2 = TriggerClientEvent
                                      L18_2 = "inventory:client:CheckWeapon"
                                      L19_2 = L6_2
                                      L20_2 = L11_2.name
                                      L17_2(L18_2, L19_2, L20_2)
                                      L17_2 = sendToDiscordStash
                                      L18_2 = Config
                                      L18_2 = L18_2.WebhookTranslates
                                      L18_2 = L18_2.stash
                                      L18_2 = L18_2.title
                                      L19_2 = "**"
                                      L20_2 = GetPlayerName
                                      L21_2 = L6_2
                                      L20_2 = L20_2(L21_2)
                                      L21_2 = Config
                                      L21_2 = L21_2.WebhookTranslates
                                      L21_2 = L21_2.stash
                                      L21_2 = L21_2.stash_deposit
                                      L22_2 = L13_2
                                      L23_2 = Config
                                      L23_2 = L23_2.WebhookTranslates
                                      L23_2 = L23_2.stash
                                      L23_2 = L23_2.item_deposit
                                      L24_2 = L15_2.name
                                      L25_2 = " x "
                                      L26_2 = L12_2
                                      L19_2 = L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2
                                      L20_2 = 7393279
                                      L17_2(L18_2, L19_2, L20_2)
                                    else
                                      L17_2 = UpdateInventory
                                      L18_2 = L6_2
                                      L17_2(L18_2)
                                    end
                                  else
                                    L17_2 = UpdateInventory
                                    L18_2 = L6_2
                                    L17_2(L18_2)
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    elseif "crafting" == A0_2 then
                      L13_2 = exports
                      L13_2 = L13_2["qs-crafting"]
                      L14_2 = L13_2
                      L13_2 = L13_2.GetFItems
                      L13_2 = L13_2(L14_2)
                      L13_2 = L13_2[L9_2]
                      L14_2 = hasCraftItems
                      L15_2 = L6_2
                      L16_2 = L13_2.costs
                      L17_2 = L12_2
                      L14_2 = L14_2(L15_2, L16_2, L17_2)
                      if L14_2 then
                        L14_2 = TriggerClientEvent
                        L15_2 = "inventory:client:CraftItems"
                        L16_2 = L6_2
                        L17_2 = L13_2.name
                        L18_2 = L13_2.costs
                        L19_2 = L12_2
                        L20_2 = L10_2
                        L21_2 = L13_2.points
                        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
                      else
                        L14_2 = TriggerClientEvent
                        L15_2 = "inventory:client:UpdatePlayerInventory"
                        L16_2 = L6_2
                        L17_2 = true
                        L14_2(L15_2, L16_2, L17_2)
                        L14_2 = TriggerClientEvent
                        L15_2 = "qs-inventory:sendMessage"
                        L16_2 = source
                        L17_2 = Lang
                        L18_2 = "INVENTORY_NO_ITEM"
                        L17_2 = L17_2(L18_2)
                        L18_2 = "error"
                        L14_2(L15_2, L16_2, L17_2, L18_2)
                      end
                    else
                      L13_2 = tonumber
                      L14_2 = A1_2
                      L13_2 = L13_2(L14_2)
                      A1_2 = L13_2
                      if nil == A1_2 or 0 == A1_2 then
                        L13_2 = CreateNewDrop
                        L14_2 = L6_2
                        L15_2 = L9_2
                        L16_2 = L10_2
                        L17_2 = L12_2
                        L13_2(L14_2, L15_2, L16_2, L17_2)
                      else
                        L13_2 = Drops
                        L13_2 = L13_2[A1_2]
                        L13_2 = L13_2.items
                        L13_2 = L13_2[L10_2]
                        if nil ~= L13_2 then
                          L14_2 = L13_2.unique
                          if L14_2 then
                            L14_2 = L11_2.unique
                            if L14_2 then
                              return
                            end
                          end
                          L14_2 = L13_2.name
                          L15_2 = L14_2
                          L14_2 = L14_2.lower
                          L14_2 = L14_2(L15_2)
                          L15_2 = L11_2.name
                          L16_2 = L15_2
                          L15_2 = L15_2.lower
                          L15_2 = L15_2(L16_2)
                          if L14_2 ~= L15_2 then
                        end
                        else
                          L14_2 = Drops
                          L14_2 = L14_2[A1_2]
                          if not L14_2 then
                            return
                          end
                          L14_2 = Drops
                          L14_2 = L14_2[A1_2]
                          L14_2 = L14_2.isOpen
                          if not L14_2 then
                            return
                          end
                          L14_2 = Drops
                          L14_2 = L14_2[A1_2]
                          L14_2 = L14_2.isOpen
                          if L14_2 ~= L6_2 then
                            return
                          end
                          L14_2 = L8_2.getInventoryItem
                          L15_2 = L11_2.name
                          L16_2 = L15_2
                          L15_2 = L15_2.lower
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L15_2(L16_2)
                          L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                          L14_2 = L14_2.count
                          if not (L12_2 <= L14_2) then
                            return
                          end
                          L15_2 = L7_2.removeItem
                          L16_2 = L11_2.name
                          L17_2 = L12_2
                          L18_2 = L9_2
                          L15_2(L16_2, L17_2, L18_2)
                          L15_2 = TriggerClientEvent
                          L16_2 = "inventory:client:CheckWeapon"
                          L17_2 = L6_2
                          L18_2 = L11_2.name
                          L15_2(L16_2, L17_2, L18_2)
                          if nil ~= L13_2 then
                            L15_2 = QS
                            L15_2 = L15_2.Shared
                            L15_2 = L15_2.Items
                            L16_2 = L13_2.name
                            L17_2 = L16_2
                            L16_2 = L16_2.lower
                            L16_2 = L16_2(L17_2)
                            L15_2 = L15_2[L16_2]
                            L16_2 = tonumber
                            L17_2 = A5_2
                            L16_2 = L16_2(L17_2)
                            if nil ~= L16_2 then
                              L16_2 = tonumber
                              L17_2 = A5_2
                              L16_2 = L16_2(L17_2)
                              if L16_2 then
                                goto lbl_816
                              end
                            end
                            L16_2 = L13_2.amount
                            ::lbl_816::
                            L17_2 = L13_2.name
                            L18_2 = L11_2.name
                            if L17_2 ~= L18_2 then
                              L17_2 = L7_2.addItem
                              L18_2 = L13_2.name
                              L19_2 = L16_2
                              L20_2 = L9_2
                              L21_2 = L13_2.info
                              L17_2(L18_2, L19_2, L20_2, L21_2)
                              L17_2 = RemoveFromDrop
                              L18_2 = A1_2
                              L19_2 = L9_2
                              L20_2 = L15_2.name
                              L21_2 = L16_2
                              L17_2(L18_2, L19_2, L20_2, L21_2)
                            end
                          else
                            L15_2 = QS
                            L15_2 = L15_2.Shared
                            L15_2 = L15_2.Items
                            L16_2 = L11_2.name
                            L17_2 = L16_2
                            L16_2 = L16_2.lower
                            L16_2 = L16_2(L17_2)
                            L15_2 = L15_2[L16_2]
                          end
                          L15_2 = QS
                          L15_2 = L15_2.Shared
                          L15_2 = L15_2.Items
                          L16_2 = L11_2.name
                          L17_2 = L16_2
                          L16_2 = L16_2.lower
                          L16_2 = L16_2(L17_2)
                          L15_2 = L15_2[L16_2]
                          L16_2 = AddToDrop
                          L17_2 = A1_2
                          L18_2 = L10_2
                          L19_2 = L15_2.name
                          L20_2 = L12_2
                          L21_2 = L11_2.info
                          L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
                          L16_2 = sendToDiscordDrop
                          L17_2 = Config
                          L17_2 = L17_2.WebhookTranslates
                          L17_2 = L17_2.drop
                          L17_2 = L17_2.title
                          L18_2 = "**"
                          L19_2 = GetPlayerName
                          L20_2 = L6_2
                          L19_2 = L19_2(L20_2)
                          L20_2 = Config
                          L20_2 = L20_2.WebhookTranslates
                          L20_2 = L20_2.drop
                          L20_2 = L20_2.throw
                          L21_2 = L15_2.name
                          L22_2 = " x "
                          L23_2 = L12_2
                          L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2
                          L19_2 = 7393279
                          L16_2(L17_2, L18_2, L19_2)
                          L16_2 = L15_2.name
                          if "radio" == L16_2 then
                            L16_2 = TriggerClientEvent
                            L17_2 = "scully_radio:leaveChannel"
                            L18_2 = L6_2
                            L19_2 = true
                            L16_2(L17_2, L18_2, L19_2)
                          end
                          L16_2 = TriggerClientEvent
                          L17_2 = "inventory:ClearWeapons"
                          L18_2 = L6_2
                          L16_2(L17_2, L18_2)
                        end
                      end
                    end
                  end
                end
              end
            end
        end
        else
          L13_2 = TriggerClientEvent
          L14_2 = "qs-inventory:sendMessage"
          L15_2 = source
          L16_2 = Lang
          L17_2 = "INVENTORY_NO_ITEM"
          L16_2 = L16_2(L17_2)
          L17_2 = "error"
          L13_2(L14_2, L15_2, L16_2, L17_2)
        end
      end
    else
      L11_2 = QS
      L11_2 = L11_2.Shared
      L11_2 = L11_2.SplitStr
      L12_2 = A0_2
      L13_2 = "-"
      L11_2 = L11_2(L12_2, L13_2)
      L11_2 = L11_2[1]
      if "otherplayer" == L11_2 then
        L11_2 = tonumber
        L12_2 = QS
        L12_2 = L12_2.Shared
        L12_2 = L12_2.SplitStr
        L13_2 = A0_2
        L14_2 = "-"
        L12_2 = L12_2(L13_2, L14_2)
        L12_2 = L12_2[2]
        L11_2 = L11_2(L12_2)
        L12_2 = QS
        L12_2 = L12_2.GetPlayerFromId
        L13_2 = L11_2
        L12_2 = L12_2(L13_2)
        if not L12_2 then
          return
        end
        L13_2 = L12_2.PlayerData
        L13_2 = L13_2.items
        L13_2 = L13_2[L9_2]
        L14_2 = tonumber
        L15_2 = A4_2
        L14_2 = L14_2(L15_2)
        if nil ~= L14_2 then
          L14_2 = tonumber
          L15_2 = A4_2
          L14_2 = L14_2(L15_2)
          if L14_2 then
            goto lbl_933
          end
        end
        L14_2 = L13_2.amount
        ::lbl_933::
        if nil ~= L13_2 then
          L15_2 = L13_2.amount
          if L14_2 <= L15_2 then
            L15_2 = QS
            L15_2 = L15_2.Shared
            L15_2 = L15_2.Items
            L16_2 = L13_2.name
            L17_2 = L16_2
            L16_2 = L16_2.lower
            L16_2 = L16_2(L17_2)
            L15_2 = L15_2[L16_2]
            if "player" == A1_2 or "hotbar" == A1_2 then
              L16_2 = L7_2.GetItemBySlot
              L17_2 = L10_2
              L16_2 = L16_2(L17_2)
              L17_2 = L7_2.addItem
              L18_2 = L13_2.name
              L19_2 = L14_2
              L20_2 = L10_2
              L21_2 = L13_2.info
              L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
              if not L17_2 then
                return
              end
              L17_2 = L12_2.removeItem
              L18_2 = L15_2.name
              L19_2 = L14_2
              L20_2 = L9_2
              L17_2(L18_2, L19_2, L20_2)
              L17_2 = TriggerClientEvent
              L18_2 = "inventory:client:CheckWeapon"
              L19_2 = L12_2.PlayerData
              L19_2 = L19_2.source
              L20_2 = L13_2.name
              L17_2(L18_2, L19_2, L20_2)
              L17_2 = TriggerClientEvent
              L18_2 = "qs-inventory:sendMessage"
              L19_2 = L11_2
              L20_2 = Lang
              L21_2 = "INVENTORY_TAKED_ITEM"
              L20_2 = L20_2(L21_2)
              L21_2 = L15_2.label
              L22_2 = " x"
              L23_2 = L14_2
              L20_2 = L20_2 .. L21_2 .. L22_2 .. L23_2
              L21_2 = "inform"
              L17_2(L18_2, L19_2, L20_2, L21_2)
              if nil ~= L16_2 then
                L17_2 = QS
                L17_2 = L17_2.Shared
                L17_2 = L17_2.Items
                L18_2 = L16_2.name
                L19_2 = L18_2
                L18_2 = L18_2.lower
                L18_2 = L18_2(L19_2)
                L17_2 = L17_2[L18_2]
                L18_2 = tonumber
                L19_2 = A5_2
                L18_2 = L18_2(L19_2)
                if nil ~= L18_2 then
                  L18_2 = tonumber
                  L19_2 = A5_2
                  L18_2 = L18_2(L19_2)
                  if L18_2 then
                    goto lbl_1003
                  end
                end
                L18_2 = L16_2.amount
                ::lbl_1003::
                L19_2 = L16_2.name
                L20_2 = L13_2.name
                if L19_2 ~= L20_2 then
                  L19_2 = L7_2.removeItem
                  L20_2 = L16_2.name
                  L21_2 = L18_2
                  L22_2 = L10_2
                  L19_2(L20_2, L21_2, L22_2)
                  L19_2 = L12_2.addItem
                  L20_2 = L17_2.name
                  L21_2 = L18_2
                  L22_2 = L9_2
                  L23_2 = L16_2.info
                  L19_2(L20_2, L21_2, L22_2, L23_2)
                end
              else
                L17_2 = sendToDiscordSteal
                L18_2 = Config
                L18_2 = L18_2.WebhookTranslates
                L18_2 = L18_2.steal
                L18_2 = L18_2.title
                L19_2 = "**"
                L20_2 = GetPlayerName
                L21_2 = L6_2
                L20_2 = L20_2(L21_2)
                L21_2 = Config
                L21_2 = L21_2.WebhookTranslates
                L21_2 = L21_2.steal
                L21_2 = L21_2.steal_player
                L22_2 = GetPlayerName
                L23_2 = L12_2.PlayerData
                L23_2 = L23_2.source
                L22_2 = L22_2(L23_2)
                L23_2 = Config
                L23_2 = L23_2.WebhookTranslates
                L23_2 = L23_2.steal
                L23_2 = L23_2.item_stealed
                L24_2 = L13_2.name
                L25_2 = " x "
                L26_2 = L14_2
                L19_2 = L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2
                L20_2 = 7393279
                L17_2(L18_2, L19_2, L20_2)
              end
            else
              L16_2 = L12_2.PlayerData
              L16_2 = L16_2.items
              L16_2 = L16_2[L10_2]
              L17_2 = L12_2.removeItem
              L18_2 = L15_2.name
              L19_2 = L14_2
              L20_2 = L9_2
              L17_2(L18_2, L19_2, L20_2)
              if nil ~= L16_2 then
                L17_2 = QS
                L17_2 = L17_2.Shared
                L17_2 = L17_2.Items
                L18_2 = L16_2.name
                L19_2 = L18_2
                L18_2 = L18_2.lower
                L18_2 = L18_2(L19_2)
                L17_2 = L17_2[L18_2]
                L18_2 = tonumber
                L19_2 = A5_2
                L18_2 = L18_2(L19_2)
                if nil ~= L18_2 then
                  L18_2 = tonumber
                  L19_2 = A5_2
                  L18_2 = L18_2(L19_2)
                  if L18_2 then
                    goto lbl_1075
                  end
                end
                L18_2 = L16_2.amount
                ::lbl_1075::
                L19_2 = L16_2.name
                L20_2 = L13_2.name
                if L19_2 ~= L20_2 then
                  L19_2 = QS
                  L19_2 = L19_2.Shared
                  L19_2 = L19_2.Items
                  L20_2 = L16_2.name
                  L21_2 = L20_2
                  L20_2 = L20_2.lower
                  L20_2 = L20_2(L21_2)
                  L19_2 = L19_2[L20_2]
                  L20_2 = L12_2.removeItem
                  L21_2 = L19_2.name
                  L22_2 = L18_2
                  L23_2 = L10_2
                  L20_2(L21_2, L22_2, L23_2)
                  L20_2 = L12_2.addItem
                  L21_2 = L19_2.name
                  L22_2 = L18_2
                  L23_2 = L9_2
                  L24_2 = L16_2.info
                  L20_2(L21_2, L22_2, L23_2, L24_2)
                end
              end
              L17_2 = QS
              L17_2 = L17_2.Shared
              L17_2 = L17_2.Items
              L18_2 = L13_2.name
              L19_2 = L18_2
              L18_2 = L18_2.lower
              L18_2 = L18_2(L19_2)
              L17_2 = L17_2[L18_2]
              L18_2 = L12_2.addItem
              L19_2 = L17_2.name
              L20_2 = L14_2
              L21_2 = L10_2
              L22_2 = L13_2.info
              L18_2(L19_2, L20_2, L21_2, L22_2)
            end
        end
        else
          L15_2 = TriggerClientEvent
          L16_2 = "qs-inventory:sendMessage"
          L17_2 = L6_2
          L18_2 = Lang
          L19_2 = "INVENTORY_INVALID"
          L18_2 = L18_2(L19_2)
          L19_2 = "error"
          L15_2(L16_2, L17_2, L18_2, L19_2)
        end
      else
        L11_2 = QS
        L11_2 = L11_2.Shared
        L11_2 = L11_2.SplitStr
        L12_2 = A0_2
        L13_2 = "-"
        L11_2 = L11_2(L12_2, L13_2)
        L11_2 = L11_2[1]
        if "trunk" == L11_2 then
          L11_2 = QS
          L11_2 = L11_2.Shared
          L11_2 = L11_2.SplitStr
          L12_2 = A0_2
          L13_2 = "-"
          L11_2 = L11_2(L12_2, L13_2)
          L11_2 = L11_2[2]
          L12_2 = Trunks
          L12_2 = L12_2[L11_2]
          if not L12_2 then
            return
          end
          L12_2 = Trunks
          L12_2 = L12_2[L11_2]
          L12_2 = L12_2.isOpen
          if not L12_2 then
            return
          end
          L12_2 = Trunks
          L12_2 = L12_2[L11_2]
          L12_2 = L12_2.isOpen
          if L12_2 ~= L6_2 then
            return
          end
          L12_2 = Trunks
          L12_2 = L12_2[L11_2]
          L12_2 = L12_2.items
          L12_2 = L12_2[L9_2]
          L13_2 = tonumber
          L14_2 = A4_2
          L13_2 = L13_2(L14_2)
          if nil ~= L13_2 then
            L13_2 = tonumber
            L14_2 = A4_2
            L13_2 = L13_2(L14_2)
            if L13_2 then
              goto lbl_1165
            end
          end
          L13_2 = L12_2.amount
          ::lbl_1165::
          if nil ~= L12_2 then
            L14_2 = L12_2.amount
            if L13_2 <= L14_2 then
              L14_2 = QS
              L14_2 = L14_2.Shared
              L14_2 = L14_2.Items
              L15_2 = L12_2.name
              L16_2 = L15_2
              L15_2 = L15_2.lower
              L15_2 = L15_2(L16_2)
              L14_2 = L14_2[L15_2]
              if "player" == A1_2 or "hotbar" == A1_2 then
                L15_2 = L7_2.GetItemBySlot
                L16_2 = L10_2
                L15_2 = L15_2(L16_2)
                if nil ~= L15_2 then
                  L16_2 = L15_2.unique
                  if L16_2 then
                    L16_2 = L12_2.unique
                  end
                  if not L16_2 then
                    L16_2 = L15_2.name
                    L17_2 = L16_2
                    L16_2 = L16_2.lower
                    L16_2 = L16_2(L17_2)
                    L17_2 = L12_2.name
                    L18_2 = L17_2
                    L17_2 = L17_2.lower
                    L17_2 = L17_2(L18_2)
                    if L16_2 ~= L17_2 then
                    else
                      L16_2 = L7_2.addItem
                      L17_2 = L12_2.name
                      L18_2 = L13_2
                      L19_2 = L10_2
                      L20_2 = L12_2.info
                      L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                      if L16_2 then
                        L16_2 = RemoveFromTrunk
                        L17_2 = L11_2
                        L18_2 = L9_2
                        L19_2 = L14_2.name
                        L20_2 = L13_2
                        L16_2(L17_2, L18_2, L19_2, L20_2)
                        L16_2 = sendToDiscordVehicles
                        L17_2 = Config
                        L17_2 = L17_2.WebhookTranslates
                        L17_2 = L17_2.vehicles
                        L17_2 = L17_2.title
                        L18_2 = "**"
                        L19_2 = GetPlayerName
                        L20_2 = L6_2
                        L19_2 = L19_2(L20_2)
                        L20_2 = Config
                        L20_2 = L20_2.WebhookTranslates
                        L20_2 = L20_2.vehicles
                        L20_2 = L20_2.trunk_extract
                        L21_2 = L11_2
                        L22_2 = Config
                        L22_2 = L22_2.WebhookTranslates
                        L22_2 = L22_2.vehicles
                        L22_2 = L22_2.item_remove
                        L23_2 = L14_2.name
                        L24_2 = " x "
                        L25_2 = L13_2
                        L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2
                        L19_2 = 7393279
                        L16_2(L17_2, L18_2, L19_2)
                      else
                        L16_2 = UpdateInventory
                        L17_2 = L6_2
                        L16_2(L17_2)
                      end
                    end
                  end
                end
              else
                L15_2 = Trunks
                L15_2 = L15_2[L11_2]
                L15_2 = L15_2.items
                L15_2 = L15_2[L10_2]
                L16_2 = RemoveFromTrunk
                L17_2 = L11_2
                L18_2 = L9_2
                L19_2 = L14_2.name
                L20_2 = L13_2
                L16_2(L17_2, L18_2, L19_2, L20_2)
                if nil ~= L15_2 then
                  L16_2 = QS
                  L16_2 = L16_2.Shared
                  L16_2 = L16_2.Items
                  L17_2 = L15_2.name
                  L18_2 = L17_2
                  L17_2 = L17_2.lower
                  L17_2 = L17_2(L18_2)
                  L16_2 = L16_2[L17_2]
                  L17_2 = tonumber
                  L18_2 = A5_2
                  L17_2 = L17_2(L18_2)
                  if nil ~= L17_2 then
                    L17_2 = tonumber
                    L18_2 = A5_2
                    L17_2 = L17_2(L18_2)
                    if L17_2 then
                      goto lbl_1274
                    end
                  end
                  L17_2 = L15_2.amount
                  ::lbl_1274::
                  L18_2 = L15_2.name
                  L19_2 = L12_2.name
                  if L18_2 ~= L19_2 then
                    L18_2 = QS
                    L18_2 = L18_2.Shared
                    L18_2 = L18_2.Items
                    L19_2 = L15_2.name
                    L20_2 = L19_2
                    L19_2 = L19_2.lower
                    L19_2 = L19_2(L20_2)
                    L18_2 = L18_2[L19_2]
                    L19_2 = RemoveFromTrunk
                    L20_2 = L11_2
                    L21_2 = L10_2
                    L22_2 = L18_2.name
                    L23_2 = L17_2
                    L19_2(L20_2, L21_2, L22_2, L23_2)
                    L19_2 = AddToTrunk
                    L20_2 = L11_2
                    L21_2 = L9_2
                    L22_2 = L10_2
                    L23_2 = L18_2.name
                    L24_2 = L17_2
                    L25_2 = L15_2.info
                    L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
                  end
                end
                L16_2 = QS
                L16_2 = L16_2.Shared
                L16_2 = L16_2.Items
                L17_2 = L12_2.name
                L18_2 = L17_2
                L17_2 = L17_2.lower
                L17_2 = L17_2(L18_2)
                L16_2 = L16_2[L17_2]
                L17_2 = AddToTrunk
                L18_2 = L11_2
                L19_2 = L10_2
                L20_2 = L9_2
                L21_2 = L16_2.name
                L22_2 = L13_2
                L23_2 = L12_2.info
                L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
              end
          end
          else
            L14_2 = TriggerClientEvent
            L15_2 = "qs-inventory:sendMessage"
            L16_2 = L6_2
            L17_2 = Lang
            L18_2 = "INVENTORY_INVALID"
            L17_2 = L17_2(L18_2)
            L18_2 = "error"
            L14_2(L15_2, L16_2, L17_2, L18_2)
          end
        else
          L11_2 = QS
          L11_2 = L11_2.Shared
          L11_2 = L11_2.SplitStr
          L12_2 = A0_2
          L13_2 = "-"
          L11_2 = L11_2(L12_2, L13_2)
          L11_2 = L11_2[1]
          if "glovebox" == L11_2 then
            L11_2 = QS
            L11_2 = L11_2.Shared
            L11_2 = L11_2.SplitStr
            L12_2 = A0_2
            L13_2 = "-"
            L11_2 = L11_2(L12_2, L13_2)
            L11_2 = L11_2[2]
            L12_2 = Gloveboxes
            L12_2 = L12_2[L11_2]
            if not L12_2 then
              return
            end
            L12_2 = Gloveboxes
            L12_2 = L12_2[L11_2]
            L12_2 = L12_2.isOpen
            if not L12_2 then
              return
            end
            L12_2 = Gloveboxes
            L12_2 = L12_2[L11_2]
            L12_2 = L12_2.isOpen
            if L12_2 ~= L6_2 then
              return
            end
            L12_2 = Gloveboxes
            L12_2 = L12_2[L11_2]
            L12_2 = L12_2.items
            L12_2 = L12_2[L9_2]
            L13_2 = tonumber
            L14_2 = A4_2
            L13_2 = L13_2(L14_2)
            if nil ~= L13_2 then
              L13_2 = tonumber
              L14_2 = A4_2
              L13_2 = L13_2(L14_2)
              if L13_2 then
                goto lbl_1369
              end
            end
            L13_2 = L12_2.amount
            ::lbl_1369::
            if nil ~= L12_2 then
              L14_2 = L12_2.amount
              if L13_2 <= L14_2 then
                L14_2 = QS
                L14_2 = L14_2.Shared
                L14_2 = L14_2.Items
                L15_2 = L12_2.name
                L16_2 = L15_2
                L15_2 = L15_2.lower
                L15_2 = L15_2(L16_2)
                L14_2 = L14_2[L15_2]
                if "player" == A1_2 or "hotbar" == A1_2 then
                  L15_2 = L7_2.GetItemBySlot
                  L16_2 = L10_2
                  L15_2 = L15_2(L16_2)
                  if nil ~= L15_2 then
                    L16_2 = L15_2.unique
                    if L16_2 then
                      L16_2 = L12_2.unique
                    end
                    if not L16_2 then
                      L16_2 = L15_2.name
                      L17_2 = L16_2
                      L16_2 = L16_2.lower
                      L16_2 = L16_2(L17_2)
                      L17_2 = L12_2.name
                      L18_2 = L17_2
                      L17_2 = L17_2.lower
                      L17_2 = L17_2(L18_2)
                      if L16_2 ~= L17_2 then
                      else
                        L16_2 = L7_2.addItem
                        L17_2 = L12_2.name
                        L18_2 = L13_2
                        L19_2 = L10_2
                        L20_2 = L12_2.info
                        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                        if L16_2 then
                          L16_2 = RemoveFromGlovebox
                          L17_2 = L11_2
                          L18_2 = L9_2
                          L19_2 = L14_2.name
                          L20_2 = L13_2
                          L16_2(L17_2, L18_2, L19_2, L20_2)
                          L16_2 = sendToDiscordVehicles
                          L17_2 = Config
                          L17_2 = L17_2.WebhookTranslates
                          L17_2 = L17_2.vehicles
                          L17_2 = L17_2.title
                          L18_2 = "**"
                          L19_2 = GetPlayerName
                          L20_2 = L6_2
                          L19_2 = L19_2(L20_2)
                          L20_2 = Config
                          L20_2 = L20_2.WebhookTranslates
                          L20_2 = L20_2.vehicles
                          L20_2 = L20_2.glove_extract
                          L21_2 = L11_2
                          L22_2 = Config
                          L22_2 = L22_2.WebhookTranslates
                          L22_2 = L22_2.vehicles
                          L22_2 = L22_2.item_remove
                          L23_2 = L14_2.name
                          L24_2 = " x "
                          L25_2 = L13_2
                          L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2
                          L19_2 = 7393279
                          L16_2(L17_2, L18_2, L19_2)
                        else
                          L16_2 = UpdateInventory
                          L17_2 = L6_2
                          L16_2(L17_2)
                        end
                      end
                    end
                  end
                else
                  L15_2 = Gloveboxes
                  L15_2 = L15_2[L11_2]
                  L15_2 = L15_2.items
                  L15_2 = L15_2[L10_2]
                  L16_2 = RemoveFromGlovebox
                  L17_2 = L11_2
                  L18_2 = L9_2
                  L19_2 = L14_2.name
                  L20_2 = L13_2
                  L16_2(L17_2, L18_2, L19_2, L20_2)
                  if nil ~= L15_2 then
                    L16_2 = QS
                    L16_2 = L16_2.Shared
                    L16_2 = L16_2.Items
                    L17_2 = L15_2.name
                    L18_2 = L17_2
                    L17_2 = L17_2.lower
                    L17_2 = L17_2(L18_2)
                    L16_2 = L16_2[L17_2]
                    L17_2 = tonumber
                    L18_2 = A5_2
                    L17_2 = L17_2(L18_2)
                    if nil ~= L17_2 then
                      L17_2 = tonumber
                      L18_2 = A5_2
                      L17_2 = L17_2(L18_2)
                      if L17_2 then
                        goto lbl_1478
                      end
                    end
                    L17_2 = L15_2.amount
                    ::lbl_1478::
                    L18_2 = L15_2.name
                    L19_2 = L12_2.name
                    if L18_2 ~= L19_2 then
                      L18_2 = QS
                      L18_2 = L18_2.Shared
                      L18_2 = L18_2.Items
                      L19_2 = L15_2.name
                      L20_2 = L19_2
                      L19_2 = L19_2.lower
                      L19_2 = L19_2(L20_2)
                      L18_2 = L18_2[L19_2]
                      L19_2 = RemoveFromGlovebox
                      L20_2 = L11_2
                      L21_2 = L10_2
                      L22_2 = L18_2.name
                      L23_2 = L17_2
                      L19_2(L20_2, L21_2, L22_2, L23_2)
                      L19_2 = AddToGlovebox
                      L20_2 = L11_2
                      L21_2 = L9_2
                      L22_2 = L10_2
                      L23_2 = L18_2.name
                      L24_2 = L17_2
                      L25_2 = L15_2.info
                      L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
                    end
                  end
                  L16_2 = QS
                  L16_2 = L16_2.Shared
                  L16_2 = L16_2.Items
                  L17_2 = L12_2.name
                  L18_2 = L17_2
                  L17_2 = L17_2.lower
                  L17_2 = L17_2(L18_2)
                  L16_2 = L16_2[L17_2]
                  L17_2 = AddToGlovebox
                  L18_2 = L11_2
                  L19_2 = L10_2
                  L20_2 = L9_2
                  L21_2 = L16_2.name
                  L22_2 = L13_2
                  L23_2 = L12_2.info
                  L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                end
            end
            else
              L14_2 = TriggerClientEvent
              L15_2 = "qs-inventory:sendMessage"
              L16_2 = L6_2
              L17_2 = Lang
              L18_2 = "INVENTORY_INVALID"
              L17_2 = L17_2(L18_2)
              L18_2 = "error"
              L14_2(L15_2, L16_2, L17_2, L18_2)
            end
          else
            L11_2 = QS
            L11_2 = L11_2.Shared
            L11_2 = L11_2.SplitStr
            L12_2 = A0_2
            L13_2 = "-"
            L11_2 = L11_2(L12_2, L13_2)
            L11_2 = L11_2[1]
            if "stash" == L11_2 then
              L11_2 = QS
              L11_2 = L11_2.Shared
              L11_2 = L11_2.SplitStr
              L12_2 = A0_2
              L13_2 = "-"
              L11_2 = L11_2(L12_2, L13_2)
              L11_2 = L11_2[2]
              L12_2 = Stashes
              L12_2 = L12_2[L11_2]
              if not L12_2 then
                return
              end
              L12_2 = Stashes
              L12_2 = L12_2[L11_2]
              L12_2 = L12_2.isOpen
              if not L12_2 then
                return
              end
              L12_2 = Stashes
              L12_2 = L12_2[L11_2]
              L12_2 = L12_2.isOpen
              if L12_2 ~= L6_2 then
                return
              end
              L12_2 = Stashes
              L12_2 = L12_2[L11_2]
              L12_2 = L12_2.items
              L12_2 = L12_2[L9_2]
              L13_2 = tonumber
              L14_2 = A4_2
              L13_2 = L13_2(L14_2)
              if nil ~= L13_2 then
                L13_2 = tonumber
                L14_2 = A4_2
                L13_2 = L13_2(L14_2)
                if L13_2 then
                  goto lbl_1573
                end
              end
              L13_2 = L12_2.amount
              ::lbl_1573::
              if nil ~= L12_2 then
                L14_2 = L12_2.amount
                if L13_2 <= L14_2 then
                  L14_2 = QS
                  L14_2 = L14_2.Shared
                  L14_2 = L14_2.Items
                  L15_2 = L12_2.name
                  L16_2 = L15_2
                  L15_2 = L15_2.lower
                  L15_2 = L15_2(L16_2)
                  L14_2 = L14_2[L15_2]
                  if "player" == A1_2 or "hotbar" == A1_2 then
                    L15_2 = L7_2.GetItemBySlot
                    L16_2 = L10_2
                    L15_2 = L15_2(L16_2)
                    if nil ~= L15_2 then
                      L16_2 = L15_2.unique
                      if L16_2 then
                        L16_2 = L12_2.unique
                      end
                      if not L16_2 then
                        L16_2 = L15_2.name
                        L17_2 = L16_2
                        L16_2 = L16_2.lower
                        L16_2 = L16_2(L17_2)
                        L17_2 = L12_2.name
                        L18_2 = L17_2
                        L17_2 = L17_2.lower
                        L17_2 = L17_2(L18_2)
                        if L16_2 ~= L17_2 then
                        else
                          L16_2 = L7_2.addItem
                          L17_2 = L12_2.name
                          L18_2 = L13_2
                          L19_2 = L10_2
                          L20_2 = L12_2.info
                          L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                          if L16_2 then
                            L16_2 = RemoveFromStash
                            L17_2 = L11_2
                            L18_2 = L9_2
                            L19_2 = L14_2.name
                            L20_2 = L13_2
                            L16_2(L17_2, L18_2, L19_2, L20_2)
                            L16_2 = sendToDiscordStash
                            L17_2 = Config
                            L17_2 = L17_2.WebhookTranslates
                            L17_2 = L17_2.stash
                            L17_2 = L17_2.title
                            L18_2 = "**"
                            L19_2 = GetPlayerName
                            L20_2 = L6_2
                            L19_2 = L19_2(L20_2)
                            L20_2 = Config
                            L20_2 = L20_2.WebhookTranslates
                            L20_2 = L20_2.stash
                            L20_2 = L20_2.stash_extract
                            L21_2 = L11_2
                            L22_2 = Config
                            L22_2 = L22_2.WebhookTranslates
                            L22_2 = L22_2.stash
                            L22_2 = L22_2.item_remove
                            L23_2 = L14_2.name
                            L24_2 = " x "
                            L25_2 = L13_2
                            L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2
                            L19_2 = 7393279
                            L16_2(L17_2, L18_2, L19_2)
                          else
                            L16_2 = UpdateInventory
                            L17_2 = L6_2
                            L16_2(L17_2)
                          end
                        end
                      end
                    end
                  else
                    L15_2 = Stashes
                    L15_2 = L15_2[L11_2]
                    L15_2 = L15_2.items
                    L15_2 = L15_2[L10_2]
                    L16_2 = RemoveFromStash
                    L17_2 = L11_2
                    L18_2 = L9_2
                    L19_2 = L14_2.name
                    L20_2 = L13_2
                    L16_2(L17_2, L18_2, L19_2, L20_2)
                    if nil ~= L15_2 then
                      L16_2 = QS
                      L16_2 = L16_2.Shared
                      L16_2 = L16_2.Items
                      L17_2 = L15_2.name
                      L18_2 = L17_2
                      L17_2 = L17_2.lower
                      L17_2 = L17_2(L18_2)
                      L16_2 = L16_2[L17_2]
                      L17_2 = tonumber
                      L18_2 = A5_2
                      L17_2 = L17_2(L18_2)
                      if nil ~= L17_2 then
                        L17_2 = tonumber
                        L18_2 = A5_2
                        L17_2 = L17_2(L18_2)
                        if L17_2 then
                          goto lbl_1682
                        end
                      end
                      L17_2 = L15_2.amount
                      ::lbl_1682::
                      L18_2 = L15_2.name
                      L19_2 = L12_2.name
                      if L18_2 ~= L19_2 then
                        L18_2 = QS
                        L18_2 = L18_2.Shared
                        L18_2 = L18_2.Items
                        L19_2 = L15_2.name
                        L20_2 = L19_2
                        L19_2 = L19_2.lower
                        L19_2 = L19_2(L20_2)
                        L18_2 = L18_2[L19_2]
                        L19_2 = RemoveFromStash
                        L20_2 = L11_2
                        L21_2 = L10_2
                        L22_2 = L18_2.name
                        L23_2 = L17_2
                        L19_2(L20_2, L21_2, L22_2, L23_2)
                        L19_2 = AddToStash
                        L20_2 = L11_2
                        L21_2 = L9_2
                        L22_2 = L10_2
                        L23_2 = L18_2.name
                        L24_2 = L17_2
                        L25_2 = L15_2.info
                        L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
                      end
                    end
                    L16_2 = QS
                    L16_2 = L16_2.Shared
                    L16_2 = L16_2.Items
                    L17_2 = L12_2.name
                    L18_2 = L17_2
                    L17_2 = L17_2.lower
                    L17_2 = L17_2(L18_2)
                    L16_2 = L16_2[L17_2]
                    L17_2 = AddToStash
                    L18_2 = L11_2
                    L19_2 = L10_2
                    L20_2 = L9_2
                    L21_2 = L16_2.name
                    L22_2 = L13_2
                    L23_2 = L12_2.info
                    L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                  end
              end
              else
                L14_2 = TriggerClientEvent
                L15_2 = "qs-inventory:sendMessage"
                L16_2 = L6_2
                L17_2 = Lang
                L18_2 = "INVENTORY_INVALID"
                L17_2 = L17_2(L18_2)
                L18_2 = "error"
                L14_2(L15_2, L16_2, L17_2, L18_2)
              end
            else
              L11_2 = QS
              L11_2 = L11_2.Shared
              L11_2 = L11_2.SplitStr
              L12_2 = A0_2
              L13_2 = "_"
              L11_2 = L11_2(L12_2, L13_2)
              L11_2 = L11_2[1]
              if "garbage" == L11_2 then
                L11_2 = QS
                L11_2 = L11_2.Shared
                L11_2 = L11_2.SplitStr
                L12_2 = A0_2
                L13_2 = "_"
                L11_2 = L11_2(L12_2, L13_2)
                L11_2 = L11_2[2]
                L12_2 = GarbageItems
                L12_2 = L12_2[L11_2]
                L12_2 = L12_2.items
                L12_2 = L12_2[L9_2]
                if L12_2 then
                  L13_2 = QS
                  L13_2 = L13_2.Shared
                  L13_2 = L13_2.Items
                  L14_2 = L12_2.name
                  L15_2 = L14_2
                  L14_2 = L14_2.lower
                  L14_2 = L14_2(L15_2)
                  L13_2 = L13_2[L14_2]
                  L14_2 = L7_2.GetItemBySlot
                  L15_2 = L10_2
                  L14_2 = L14_2(L15_2)
                  if nil ~= L14_2 then
                    L15_2 = L14_2.unique
                    if L15_2 then
                      L15_2 = L12_2.unique
                    end
                    if not L15_2 then
                      L15_2 = L14_2.name
                      L16_2 = L15_2
                      L15_2 = L15_2.lower
                      L15_2 = L15_2(L16_2)
                      L16_2 = L12_2.name
                      L17_2 = L16_2
                      L16_2 = L16_2.lower
                      L16_2 = L16_2(L17_2)
                      if L15_2 ~= L16_2 then
                      else
                        L15_2 = L7_2.addItem
                        L16_2 = L12_2.name
                        L17_2 = A4_2
                        L18_2 = L10_2
                        L19_2 = L12_2.info
                        L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2)
                        if L15_2 then
                          L15_2 = RemoveFromGarbage
                          L16_2 = L11_2
                          L17_2 = L9_2
                          L18_2 = L12_2.name
                          L19_2 = A4_2
                          L15_2(L16_2, L17_2, L18_2, L19_2)
                          L15_2 = sendToDiscordGarbage
                          L16_2 = Config
                          L16_2 = L16_2.WebhookTranslates
                          L16_2 = L16_2.garbage
                          L16_2 = L16_2.title
                          L17_2 = "**"
                          L18_2 = GetPlayerName
                          L19_2 = L6_2
                          L18_2 = L18_2(L19_2)
                          L19_2 = Config
                          L19_2 = L19_2.WebhookTranslates
                          L19_2 = L19_2.garbage
                          L19_2 = L19_2.pickup
                          L20_2 = L11_2
                          L21_2 = Config
                          L21_2 = L21_2.WebhookTranslates
                          L21_2 = L21_2.garbage
                          L21_2 = L21_2.items
                          L22_2 = L13_2.label
                          L23_2 = " x "
                          L24_2 = A4_2
                          L17_2 = L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2
                          L18_2 = 7393279
                          L15_2(L16_2, L17_2, L18_2)
                        end
                      end
                    end
                  end
                else
                  L13_2 = UpdateInventory
                  L14_2 = L6_2
                  L13_2(L14_2)
                end
              else
                L11_2 = QS
                L11_2 = L11_2.Shared
                L11_2 = L11_2.SplitStr
                L12_2 = A0_2
                L13_2 = "-"
                L11_2 = L11_2(L12_2, L13_2)
                L11_2 = L11_2[1]
                if "itemshop" == L11_2 then
                  L11_2 = QS
                  L11_2 = L11_2.Shared
                  L11_2 = L11_2.SplitStr
                  L12_2 = A0_2
                  L13_2 = "-"
                  L11_2 = L11_2(L12_2, L13_2)
                  L11_2 = L11_2[2]
                  if L11_2 then
                    L12_2 = QS
                    L12_2 = L12_2.Shared
                    L12_2 = L12_2.SplitStr
                    L13_2 = L11_2
                    L14_2 = "_"
                    L12_2 = L12_2(L13_2, L14_2)
                    L12_2 = L12_2[1]
                    if "Customshop" ~= L12_2 then
                      L12_2 = ShopItems
                      L12_2 = L12_2[L11_2]
                      L12_2 = L12_2.items
                      L12_2 = L12_2[L9_2]
                      L13_2 = QS
                      L13_2 = L13_2.Shared
                      L13_2 = L13_2.Items
                      L14_2 = L12_2.name
                      L15_2 = L14_2
                      L14_2 = L14_2.lower
                      L14_2 = L14_2(L15_2)
                      L13_2 = L13_2[L14_2]
                      L14_2 = L13_2.type
                      if "weapon" ~= L14_2 then
                        L14_2 = L13_2.unique
                        if true ~= L14_2 then
                          goto lbl_1869
                        end
                      end
                      A4_2 = 1
                      ::lbl_1869::
                      L14_2 = tonumber
                      L15_2 = L12_2.price
                      L15_2 = L15_2 * A4_2
                      L14_2 = L14_2(L15_2)
                      L15_2 = ShopItems
                      L15_2 = L15_2[L11_2]
                      L15_2 = L15_2.type
                      if not L15_2 then
                        L15_2 = "cash"
                      end
                      L16_2 = L7_2.GetItemBySlot
                      L17_2 = L10_2
                      L16_2 = L16_2(L17_2)
                      if nil ~= L16_2 then
                        L17_2 = L16_2.unique
                        if L17_2 then
                          L17_2 = L12_2.unique
                        end
                        if not L17_2 then
                          L17_2 = L16_2.name
                          L18_2 = L17_2
                          L17_2 = L17_2.lower
                          L17_2 = L17_2(L18_2)
                          L18_2 = L12_2.name
                          L19_2 = L18_2
                          L18_2 = L18_2.lower
                          L18_2 = L18_2(L19_2)
                          if L17_2 ~= L18_2 then
                          elseif "cash" == L15_2 then
                            L17_2 = L8_2.getMoney
                            L17_2 = L17_2()
                            if L14_2 <= L17_2 then
                              L17_2 = L7_2.addItem
                              L18_2 = L12_2.name
                              L19_2 = A4_2
                              L20_2 = L10_2
                              L21_2 = L12_2.info
                              L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
                              if L17_2 then
                                L17_2 = L8_2.removeMoney
                                L18_2 = L14_2
                                L17_2(L18_2)
                                L17_2 = TriggerClientEvent
                                L18_2 = "inventory:client:UpdatePlayerInventory"
                                L19_2 = L6_2
                                L17_2(L18_2, L19_2)
                                L17_2 = TriggerClientEvent
                                L18_2 = "qs-inventory:sendMessage"
                                L19_2 = L6_2
                                L20_2 = Lang
                                L21_2 = "INVENTORY_YOU_BUY"
                                L20_2 = L20_2(L21_2)
                                L21_2 = QS
                                L21_2 = L21_2.Shared
                                L21_2 = L21_2.Items
                                L22_2 = L12_2.name
                                L23_2 = L22_2
                                L22_2 = L22_2.lower
                                L22_2 = L22_2(L23_2)
                                L21_2 = L21_2[L22_2]
                                L21_2 = L21_2.label
                                L20_2 = L20_2 .. L21_2
                                L21_2 = "success"
                                L17_2(L18_2, L19_2, L20_2, L21_2)
                                L17_2 = sendToDiscordShops
                                L18_2 = Config
                                L18_2 = L18_2.WebhookTranslates
                                L18_2 = L18_2.shop
                                L18_2 = L18_2.title
                                L19_2 = "**"
                                L20_2 = GetPlayerName
                                L21_2 = L6_2
                                L20_2 = L20_2(L21_2)
                                L21_2 = Config
                                L21_2 = L21_2.WebhookTranslates
                                L21_2 = L21_2.shop
                                L21_2 = L21_2.buy
                                L22_2 = L13_2.label
                                L23_2 = " x "
                                L24_2 = A4_2
                                L25_2 = Config
                                L25_2 = L25_2.WebhookTranslates
                                L25_2 = L25_2.shop
                                L25_2 = L25_2.cost
                                L26_2 = L14_2
                                L19_2 = L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2
                                L20_2 = 7393279
                                L17_2(L18_2, L19_2, L20_2)
                              else
                                L17_2 = UpdateInventory
                                L18_2 = L6_2
                                L17_2(L18_2)
                              end
                            else
                              L17_2 = TriggerClientEvent
                              L18_2 = "inventory:client:UpdatePlayerInventory"
                              L19_2 = L6_2
                              L17_2(L18_2, L19_2)
                              L17_2 = TriggerClientEvent
                              L18_2 = "inventory:client:UpdateDebug"
                              L19_2 = L6_2
                              L17_2(L18_2, L19_2)
                              L17_2 = TriggerClientEvent
                              L18_2 = "qs-inventory:sendMessage"
                              L19_2 = L6_2
                              L20_2 = Lang
                              L21_2 = "NO_MONEY"
                              L20_2 = L20_2(L21_2)
                              L21_2 = "error"
                              L17_2(L18_2, L19_2, L20_2, L21_2)
                            end
                          else
                            L17_2 = L8_2.getAccount
                            L18_2 = L15_2
                            L17_2 = L17_2(L18_2)
                            L17_2 = L17_2.money
                            if L14_2 <= L17_2 then
                              L17_2 = L7_2.addItem
                              L18_2 = L12_2.name
                              L19_2 = A4_2
                              L20_2 = L10_2
                              L21_2 = L12_2.info
                              L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
                              if L17_2 then
                                L17_2 = L8_2.removeAccountMoney
                                L18_2 = L15_2
                                L19_2 = L14_2
                                L17_2(L18_2, L19_2)
                                L17_2 = TriggerClientEvent
                                L18_2 = "inventory:client:UpdatePlayerInventory"
                                L19_2 = L6_2
                                L17_2(L18_2, L19_2)
                                L17_2 = TriggerClientEvent
                                L18_2 = "qs-inventory:sendMessage"
                                L19_2 = L6_2
                                L20_2 = Lang
                                L21_2 = "INVENTORY_YOU_BUY"
                                L20_2 = L20_2(L21_2)
                                L21_2 = QS
                                L21_2 = L21_2.Shared
                                L21_2 = L21_2.Items
                                L22_2 = L12_2.name
                                L23_2 = L22_2
                                L22_2 = L22_2.lower
                                L22_2 = L22_2(L23_2)
                                L21_2 = L21_2[L22_2]
                                L21_2 = L21_2.label
                                L20_2 = L20_2 .. L21_2
                                L21_2 = "success"
                                L17_2(L18_2, L19_2, L20_2, L21_2)
                                L17_2 = sendToDiscordShops
                                L18_2 = Config
                                L18_2 = L18_2.WebhookTranslates
                                L18_2 = L18_2.shop
                                L18_2 = L18_2.title
                                L19_2 = "**"
                                L20_2 = GetPlayerName
                                L21_2 = L6_2
                                L20_2 = L20_2(L21_2)
                                L21_2 = Config
                                L21_2 = L21_2.WebhookTranslates
                                L21_2 = L21_2.shop
                                L21_2 = L21_2.buy
                                L22_2 = L13_2.label
                                L23_2 = " x "
                                L24_2 = A4_2
                                L25_2 = Config
                                L25_2 = L25_2.WebhookTranslates
                                L25_2 = L25_2.shop
                                L25_2 = L25_2.cost
                                L26_2 = L14_2
                                L19_2 = L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2
                                L20_2 = 7393279
                                L17_2(L18_2, L19_2, L20_2)
                              else
                                L17_2 = UpdateInventory
                                L18_2 = L6_2
                                L17_2(L18_2)
                              end
                            else
                              L17_2 = TriggerClientEvent
                              L18_2 = "inventory:client:UpdatePlayerInventory"
                              L19_2 = L6_2
                              L17_2(L18_2, L19_2)
                              L17_2 = TriggerClientEvent
                              L18_2 = "inventory:client:UpdateDebug"
                              L19_2 = L6_2
                              L17_2(L18_2, L19_2)
                              L17_2 = TriggerClientEvent
                              L18_2 = "qs-inventory:sendMessage"
                              L19_2 = L6_2
                              L20_2 = Lang
                              L21_2 = "NO_MONEY"
                              L20_2 = L20_2(L21_2)
                              L21_2 = "error"
                              L17_2(L18_2, L19_2, L20_2, L21_2)
                            end
                          end
                        end
                      end
                  end
                  else
                    return
                  end
                elseif "crafting" == A0_2 then
                  L11_2 = exports
                  L11_2 = L11_2["qs-crafting"]
                  L12_2 = L11_2
                  L11_2 = L11_2.GetFItems
                  L11_2 = L11_2(L12_2)
                  L11_2 = L11_2[L9_2]
                  L12_2 = hasCraftItems
                  L13_2 = L6_2
                  L14_2 = L11_2.costs
                  L15_2 = A4_2
                  L12_2 = L12_2(L13_2, L14_2, L15_2)
                  if L12_2 then
                    L12_2 = TriggerClientEvent
                    L13_2 = "inventory:client:CraftItems"
                    L14_2 = L6_2
                    L15_2 = L11_2.name
                    L16_2 = L11_2.costs
                    L17_2 = A4_2
                    L18_2 = L10_2
                    L19_2 = L11_2.points
                    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
                  else
                    L12_2 = TriggerClientEvent
                    L13_2 = "inventory:client:UpdatePlayerInventory"
                    L14_2 = L6_2
                    L15_2 = true
                    L12_2(L13_2, L14_2, L15_2)
                    L12_2 = TriggerClientEvent
                    L13_2 = "qs-inventory:sendMessage"
                    L14_2 = L6_2
                    L15_2 = Lang
                    L16_2 = "CRAFTING_ERROR"
                    L15_2 = L15_2(L16_2)
                    L16_2 = "error"
                    L12_2(L13_2, L14_2, L15_2, L16_2)
                  end
                else
                  L11_2 = TriggerClientEvent
                  L12_2 = "inventory:ClearWeapons"
                  L13_2 = L6_2
                  L11_2(L12_2, L13_2)
                  L11_2 = tonumber
                  L12_2 = A0_2
                  L11_2 = L11_2(L12_2)
                  A0_2 = L11_2
                  L11_2 = Drops
                  L11_2 = L11_2[A0_2]
                  if not L11_2 then
                    return
                  end
                  L11_2 = Drops
                  L11_2 = L11_2[A0_2]
                  L11_2 = L11_2.isOpen
                  if not L11_2 then
                    return
                  end
                  L11_2 = Drops
                  L11_2 = L11_2[A0_2]
                  L11_2 = L11_2.isOpen
                  if L11_2 ~= L6_2 then
                    return
                  end
                  L11_2 = Drops
                  L11_2 = L11_2[A0_2]
                  L11_2 = L11_2.items
                  L11_2 = L11_2[L9_2]
                  L12_2 = tonumber
                  L13_2 = A4_2
                  L12_2 = L12_2(L13_2)
                  if nil ~= L12_2 then
                    L12_2 = tonumber
                    L13_2 = A4_2
                    L12_2 = L12_2(L13_2)
                    if L12_2 then
                      goto lbl_2146
                    end
                  end
                  L12_2 = L11_2.amount
                  ::lbl_2146::
                  L13_2 = ESX
                  L13_2 = L13_2.GetPlayerFromId
                  L14_2 = source
                  L13_2 = L13_2(L14_2)
                  if nil == L11_2 then
                    return
                  end
                  L14_2 = L11_2.amount
                  if not (L12_2 <= L14_2) then
                    return
                  end
                  L14_2 = QS
                  L14_2 = L14_2.Shared
                  L14_2 = L14_2.Items
                  L15_2 = L11_2.name
                  L16_2 = L15_2
                  L15_2 = L15_2.lower
                  L15_2 = L15_2(L16_2)
                  L14_2 = L14_2[L15_2]
                  if "player" == A1_2 or "hotbar" == A1_2 then
                    L15_2 = L7_2.GetItemBySlot
                    L16_2 = L10_2
                    L15_2 = L15_2(L16_2)
                    if nil ~= L15_2 then
                      L16_2 = L15_2.unique
                      if L16_2 then
                        L16_2 = L11_2.unique
                        if L16_2 then
                          return
                        end
                      end
                      L16_2 = L15_2.name
                      L17_2 = L16_2
                      L16_2 = L16_2.lower
                      L16_2 = L16_2(L17_2)
                      L17_2 = L11_2.name
                      L18_2 = L17_2
                      L17_2 = L17_2.lower
                      L17_2 = L17_2(L18_2)
                      if L16_2 ~= L17_2 then
                    end
                    else
                      L16_2 = L7_2.addItem
                      L17_2 = L11_2.name
                      L18_2 = L12_2
                      L19_2 = L10_2
                      L20_2 = L11_2.info
                      L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                      if not L16_2 then
                        return
                      end
                      L16_2 = RemoveFromDrop
                      L17_2 = A0_2
                      L18_2 = L9_2
                      L19_2 = L14_2.name
                      L20_2 = L12_2
                      L16_2(L17_2, L18_2, L19_2, L20_2)
                      if nil ~= L15_2 then
                        L16_2 = tonumber
                        L17_2 = A5_2
                        L16_2 = L16_2(L17_2)
                        if nil ~= L16_2 then
                          L16_2 = tonumber
                          L17_2 = A5_2
                          L16_2 = L16_2(L17_2)
                          if L16_2 then
                            goto lbl_2213
                          end
                        end
                        L16_2 = L15_2.amount
                        ::lbl_2213::
                        L17_2 = L15_2.name
                        L18_2 = L11_2.name
                        if L17_2 ~= L18_2 then
                          L17_2 = L11_2.name
                          L18_2 = L15_2.name
                          if L17_2 == L18_2 then
                            L17_2 = L7_2.removeItem
                            L18_2 = L15_2.name
                            L19_2 = L16_2
                            L20_2 = L10_2
                            L17_2(L18_2, L19_2, L20_2)
                            L17_2 = AddToDrop
                            L18_2 = A0_2
                            L19_2 = L10_2
                            L20_2 = L15_2.name
                            L21_2 = L16_2
                            L22_2 = L15_2.info
                            L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
                          end
                        end
                      else
                        L16_2 = sendToDiscordDrop
                        L17_2 = Config
                        L17_2 = L17_2.WebhookTranslates
                        L17_2 = L17_2.drop
                        L17_2 = L17_2.title
                        L18_2 = "**"
                        L19_2 = GetPlayerName
                        L20_2 = source
                        L19_2 = L19_2(L20_2)
                        L20_2 = Config
                        L20_2 = L20_2.WebhookTranslates
                        L20_2 = L20_2.drop
                        L20_2 = L20_2.pickup
                        L21_2 = L11_2.name
                        L22_2 = " x "
                        L23_2 = L12_2
                        L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2
                        L19_2 = 7393279
                        L16_2(L17_2, L18_2, L19_2)
                      end
                    end
                  else
                    L15_2 = tonumber
                    L16_2 = A1_2
                    L15_2 = L15_2(L16_2)
                    A1_2 = L15_2
                    L15_2 = Drops
                    L15_2 = L15_2[A1_2]
                    L15_2 = L15_2.items
                    L15_2 = L15_2[L10_2]
                    L16_2 = RemoveFromDrop
                    L17_2 = A0_2
                    L18_2 = L9_2
                    L19_2 = L14_2.name
                    L20_2 = L12_2
                    L16_2(L17_2, L18_2, L19_2, L20_2)
                    if nil ~= L15_2 then
                      L16_2 = QS
                      L16_2 = L16_2.Shared
                      L16_2 = L16_2.Items
                      L17_2 = L15_2.name
                      L18_2 = L17_2
                      L17_2 = L17_2.lower
                      L17_2 = L17_2(L18_2)
                      L16_2 = L16_2[L17_2]
                      L17_2 = tonumber
                      L18_2 = A5_2
                      L17_2 = L17_2(L18_2)
                      if nil ~= L17_2 then
                        L17_2 = tonumber
                        L18_2 = A5_2
                        L17_2 = L17_2(L18_2)
                        if L17_2 then
                          goto lbl_2288
                        end
                      end
                      L17_2 = L15_2.amount
                      ::lbl_2288::
                      L18_2 = L15_2.name
                      L19_2 = L11_2.name
                      if L18_2 ~= L19_2 then
                        L18_2 = QS
                        L18_2 = L18_2.Shared
                        L18_2 = L18_2.Items
                        L19_2 = L15_2.name
                        L20_2 = L19_2
                        L19_2 = L19_2.lower
                        L19_2 = L19_2(L20_2)
                        L18_2 = L18_2[L19_2]
                        L19_2 = RemoveFromDrop
                        L20_2 = A1_2
                        L21_2 = L10_2
                        L22_2 = L18_2.name
                        L23_2 = L17_2
                        L19_2(L20_2, L21_2, L22_2, L23_2)
                        L19_2 = AddToDrop
                        L20_2 = A0_2
                        L21_2 = L9_2
                        L22_2 = L18_2.name
                        L23_2 = L17_2
                        L24_2 = L15_2.info
                        L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
                      end
                    end
                    L16_2 = QS
                    L16_2 = L16_2.Shared
                    L16_2 = L16_2.Items
                    L17_2 = L11_2.name
                    L18_2 = L17_2
                    L17_2 = L17_2.lower
                    L17_2 = L17_2(L18_2)
                    L16_2 = L16_2[L17_2]
                    L17_2 = AddToDrop
                    L18_2 = A1_2
                    L19_2 = L10_2
                    L20_2 = L16_2.name
                    L21_2 = L12_2
                    L22_2 = L11_2.info
                    L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
                  end
                end
              end
            end
          end
        end
      end
    end
  else
    L6_2 = Config
    L6_2 = L6_2.Framework
    if "QBCore" == L6_2 then
      L6_2 = source
      L7_2 = QBCore
      L7_2 = L7_2.Functions
      L7_2 = L7_2.GetPlayer
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      L8_2 = QBCore
      L8_2 = L8_2.Functions
      L8_2 = L8_2.GetPlayer
      L9_2 = L6_2
      L8_2 = L8_2(L9_2)
      L9_2 = tonumber
      L10_2 = A2_2
      L9_2 = L9_2(L10_2)
      L10_2 = tonumber
      L11_2 = A3_2
      L10_2 = L10_2(L11_2)
      if "player" == A0_2 or "hotbar" == A0_2 then
        L11_2 = QBCore
        L11_2 = L11_2.Shared
        L11_2 = L11_2.SplitStr
        L12_2 = A1_2
        L13_2 = "-"
        L11_2 = L11_2(L12_2, L13_2)
        L11_2 = L11_2[1]
        if "itemshop" == L11_2 or "crafting" == A1_2 then
          return
        end
      end
      if A4_2 then
        L11_2 = tonumber
        L12_2 = A4_2
        L11_2 = L11_2(L12_2)
        if L11_2 then
          L11_2 = tonumber
          L12_2 = A4_2
          L11_2 = L11_2(L12_2)
          L12_2 = math
          L12_2 = L12_2.floor
          L13_2 = tonumber
          L14_2 = A4_2
          L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L13_2(L14_2)
          L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
          if L11_2 ~= L12_2 then
            L11_2 = TriggerClientEvent
            L12_2 = "qs-inventory:closeInventory"
            L13_2 = L6_2
            L11_2(L12_2, L13_2)
            return
          end
        end
      end
      if "player" == A0_2 or "hotbar" == A0_2 then
        L11_2 = L7_2.Functions
        L11_2 = L11_2.GetItemBySlot
        L12_2 = L9_2
        L11_2 = L11_2(L12_2)
        L12_2 = tonumber
        L13_2 = A4_2
        L12_2 = L12_2(L13_2)
        if nil ~= L12_2 then
          L12_2 = tonumber
          L13_2 = A4_2
          L12_2 = L12_2(L13_2)
          if L12_2 then
            goto lbl_2406
          end
        end
        L12_2 = L11_2.amount
        ::lbl_2406::
        if nil ~= L11_2 then
          L13_2 = L11_2.amount
          if L12_2 <= L13_2 then
            if "player" == A1_2 or "hotbar" == A1_2 then
              L13_2 = L7_2.Functions
              L13_2 = L13_2.GetItemBySlot
              L14_2 = L10_2
              L13_2 = L13_2(L14_2)
              L14_2 = L7_2.Functions
              L14_2 = L14_2.RemoveItem
              L15_2 = L11_2.name
              L16_2 = L12_2
              L17_2 = L9_2
              L14_2(L15_2, L16_2, L17_2)
              L14_2 = TriggerClientEvent
              L15_2 = "inventory:client:CheckWeapon"
              L16_2 = L6_2
              L17_2 = L11_2.name
              L14_2(L15_2, L16_2, L17_2)
              if nil ~= L13_2 then
                L14_2 = tonumber
                L15_2 = A5_2
                L14_2 = L14_2(L15_2)
                if nil ~= L14_2 then
                  L14_2 = tonumber
                  L15_2 = A5_2
                  L14_2 = L14_2(L15_2)
                  if L14_2 then
                    goto lbl_2443
                  end
                end
                L14_2 = L13_2.amount
                ::lbl_2443::
                L15_2 = L13_2.name
                L16_2 = L11_2.name
                if L15_2 ~= L16_2 then
                  L15_2 = L7_2.Functions
                  L15_2 = L15_2.RemoveItem
                  L16_2 = L13_2.name
                  L17_2 = L14_2
                  L18_2 = L10_2
                  L15_2(L16_2, L17_2, L18_2)
                  L15_2 = L7_2.Functions
                  L15_2 = L15_2.AddItem
                  L16_2 = L13_2.name
                  L17_2 = L14_2
                  L18_2 = L9_2
                  L19_2 = L13_2.info
                  L15_2(L16_2, L17_2, L18_2, L19_2)
                end
              end
              L14_2 = L7_2.Functions
              L14_2 = L14_2.AddItem
              L15_2 = L11_2.name
              L16_2 = L12_2
              L17_2 = L10_2
              L18_2 = L11_2.info
              L14_2(L15_2, L16_2, L17_2, L18_2)
            else
              L13_2 = QBCore
              L13_2 = L13_2.Shared
              L13_2 = L13_2.SplitStr
              L14_2 = A1_2
              L15_2 = "-"
              L13_2 = L13_2(L14_2, L15_2)
              L13_2 = L13_2[1]
              if "otherplayer" == L13_2 then
                L13_2 = tonumber
                L14_2 = QBCore
                L14_2 = L14_2.Shared
                L14_2 = L14_2.SplitStr
                L15_2 = A1_2
                L16_2 = "-"
                L14_2 = L14_2(L15_2, L16_2)
                L14_2 = L14_2[2]
                L13_2 = L13_2(L14_2)
                L14_2 = QBCore
                L14_2 = L14_2.Functions
                L14_2 = L14_2.GetPlayer
                L15_2 = L13_2
                L14_2 = L14_2(L15_2)
                L15_2 = L14_2.PlayerData
                L15_2 = L15_2.items
                L15_2 = L15_2[L10_2]
                if nil ~= L15_2 then
                  L16_2 = L15_2.unique
                  if L16_2 then
                    L16_2 = L11_2.unique
                  end
                  if not L16_2 then
                    L16_2 = L15_2.name
                    L17_2 = L16_2
                    L16_2 = L16_2.lower
                    L16_2 = L16_2(L17_2)
                    L17_2 = L11_2.name
                    L18_2 = L17_2
                    L17_2 = L17_2.lower
                    L17_2 = L17_2(L18_2)
                    if L16_2 ~= L17_2 then
                    else
                      L16_2 = L8_2.Functions
                      L16_2 = L16_2.GetItemByName
                      L17_2 = L11_2.name
                      L18_2 = L17_2
                      L17_2 = L17_2.lower
                      L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2(L18_2)
                      L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                      L16_2 = L16_2.amount
                      if L12_2 <= L16_2 then
                        L17_2 = L7_2.Functions
                        L17_2 = L17_2.RemoveItem
                        L18_2 = L11_2.name
                        L19_2 = L12_2
                        L20_2 = L9_2
                        L17_2(L18_2, L19_2, L20_2)
                        L17_2 = TriggerClientEvent
                        L18_2 = "inventory:client:CheckWeapon"
                        L19_2 = L6_2
                        L20_2 = L11_2.name
                        L17_2(L18_2, L19_2, L20_2)
                        L17_2 = QBCore
                        L17_2 = L17_2.Shared
                        L17_2 = L17_2.Items
                        L18_2 = L11_2.name
                        L19_2 = L18_2
                        L18_2 = L18_2.lower
                        L18_2 = L18_2(L19_2)
                        L17_2 = L17_2[L18_2]
                        L18_2 = L14_2.Functions
                        L18_2 = L18_2.AddItem
                        L19_2 = L17_2.name
                        L20_2 = L12_2
                        L21_2 = L10_2
                        L22_2 = L11_2.info
                        L18_2(L19_2, L20_2, L21_2, L22_2)
                      else
                        L17_2 = UpdateInventory
                        L18_2 = L6_2
                        L17_2(L18_2)
                      end
                    end
                  end
                end
              else
                L13_2 = QBCore
                L13_2 = L13_2.Shared
                L13_2 = L13_2.SplitStr
                L14_2 = A1_2
                L15_2 = "-"
                L13_2 = L13_2(L14_2, L15_2)
                L13_2 = L13_2[1]
                if "trunk" == L13_2 then
                  L13_2 = QBCore
                  L13_2 = L13_2.Shared
                  L13_2 = L13_2.SplitStr
                  L14_2 = A1_2
                  L15_2 = "-"
                  L13_2 = L13_2(L14_2, L15_2)
                  L13_2 = L13_2[2]
                  L14_2 = Trunks
                  L14_2 = L14_2[L13_2]
                  L14_2 = L14_2.items
                  L14_2 = L14_2[L10_2]
                  L15_2 = QBCore
                  L15_2 = L15_2.Shared
                  L15_2 = L15_2.Items
                  L16_2 = L11_2.name
                  L17_2 = L16_2
                  L16_2 = L16_2.lower
                  L16_2 = L16_2(L17_2)
                  L15_2 = L15_2[L16_2]
                  if nil ~= L14_2 then
                    L16_2 = L14_2.unique
                    if L16_2 then
                      L16_2 = L11_2.unique
                    end
                    if not L16_2 then
                      L16_2 = L14_2.name
                      L17_2 = L16_2
                      L16_2 = L16_2.lower
                      L16_2 = L16_2(L17_2)
                      L17_2 = L11_2.name
                      L18_2 = L17_2
                      L17_2 = L17_2.lower
                      L17_2 = L17_2(L18_2)
                      if L16_2 ~= L17_2 then
                      else
                        L16_2 = L8_2.Functions
                        L16_2 = L16_2.GetItemByName
                        L17_2 = L11_2.name
                        L18_2 = L17_2
                        L17_2 = L17_2.lower
                        L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2(L18_2)
                        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                        L16_2 = L16_2.amount
                        if L12_2 <= L16_2 then
                          L17_2 = AddToTrunk
                          L18_2 = L13_2
                          L19_2 = L10_2
                          L20_2 = L9_2
                          L21_2 = L15_2.name
                          L22_2 = L12_2
                          L23_2 = L11_2.info
                          L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                          if L17_2 then
                            L17_2 = L7_2.Functions
                            L17_2 = L17_2.RemoveItem
                            L18_2 = L11_2.name
                            L19_2 = L12_2
                            L20_2 = L9_2
                            L17_2(L18_2, L19_2, L20_2)
                            L17_2 = TriggerClientEvent
                            L18_2 = "inventory:client:CheckWeapon"
                            L19_2 = L6_2
                            L20_2 = L11_2.name
                            L17_2(L18_2, L19_2, L20_2)
                          else
                            L17_2 = UpdateInventory
                            L18_2 = L6_2
                            L17_2(L18_2)
                          end
                        else
                          L17_2 = UpdateInventory
                          L18_2 = L6_2
                          L17_2(L18_2)
                        end
                      end
                    end
                  end
                else
                  L13_2 = QBCore
                  L13_2 = L13_2.Shared
                  L13_2 = L13_2.SplitStr
                  L14_2 = A1_2
                  L15_2 = "-"
                  L13_2 = L13_2(L14_2, L15_2)
                  L13_2 = L13_2[1]
                  if "glovebox" == L13_2 then
                    L13_2 = QBCore
                    L13_2 = L13_2.Shared
                    L13_2 = L13_2.SplitStr
                    L14_2 = A1_2
                    L15_2 = "-"
                    L13_2 = L13_2(L14_2, L15_2)
                    L13_2 = L13_2[2]
                    L14_2 = Gloveboxes
                    L14_2 = L14_2[L13_2]
                    L14_2 = L14_2.items
                    L14_2 = L14_2[L10_2]
                    L15_2 = QBCore
                    L15_2 = L15_2.Shared
                    L15_2 = L15_2.Items
                    L16_2 = L11_2.name
                    L17_2 = L16_2
                    L16_2 = L16_2.lower
                    L16_2 = L16_2(L17_2)
                    L15_2 = L15_2[L16_2]
                    if nil ~= L14_2 then
                      L16_2 = L14_2.unique
                      if L16_2 then
                        L16_2 = L11_2.unique
                      end
                      if not L16_2 then
                        L16_2 = L14_2.name
                        L17_2 = L16_2
                        L16_2 = L16_2.lower
                        L16_2 = L16_2(L17_2)
                        L17_2 = L11_2.name
                        L18_2 = L17_2
                        L17_2 = L17_2.lower
                        L17_2 = L17_2(L18_2)
                        if L16_2 ~= L17_2 then
                        else
                          L16_2 = L8_2.Functions
                          L16_2 = L16_2.GetItemByName
                          L17_2 = L11_2.name
                          L18_2 = L17_2
                          L17_2 = L17_2.lower
                          L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2(L18_2)
                          L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                          L16_2 = L16_2.amount
                          if L12_2 <= L16_2 then
                            L17_2 = AddToGlovebox
                            L18_2 = L13_2
                            L19_2 = L10_2
                            L20_2 = L9_2
                            L21_2 = L15_2.name
                            L22_2 = L12_2
                            L23_2 = L11_2.info
                            L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                            if L17_2 then
                              L17_2 = L7_2.Functions
                              L17_2 = L17_2.RemoveItem
                              L18_2 = L11_2.name
                              L19_2 = L12_2
                              L20_2 = L9_2
                              L17_2(L18_2, L19_2, L20_2)
                              L17_2 = TriggerClientEvent
                              L18_2 = "inventory:client:CheckWeapon"
                              L19_2 = L6_2
                              L20_2 = L11_2.name
                              L17_2(L18_2, L19_2, L20_2)
                            else
                              L17_2 = UpdateInventory
                              L18_2 = L6_2
                              L17_2(L18_2)
                            end
                          else
                            L17_2 = UpdateInventory
                            L18_2 = L6_2
                            L17_2(L18_2)
                          end
                        end
                      end
                    end
                  else
                    L13_2 = QBCore
                    L13_2 = L13_2.Shared
                    L13_2 = L13_2.SplitStr
                    L14_2 = A1_2
                    L15_2 = "-"
                    L13_2 = L13_2(L14_2, L15_2)
                    L13_2 = L13_2[1]
                    if "stash" == L13_2 then
                      L13_2 = QBCore
                      L13_2 = L13_2.Shared
                      L13_2 = L13_2.SplitStr
                      L14_2 = A1_2
                      L15_2 = "-"
                      L13_2 = L13_2(L14_2, L15_2)
                      L13_2 = L13_2[2]
                      L14_2 = Stashes
                      L14_2 = L14_2[L13_2]
                      L14_2 = L14_2.items
                      L14_2 = L14_2[L10_2]
                      L15_2 = QBCore
                      L15_2 = L15_2.Shared
                      L15_2 = L15_2.Items
                      L16_2 = L11_2.name
                      L17_2 = L16_2
                      L16_2 = L16_2.lower
                      L16_2 = L16_2(L17_2)
                      L15_2 = L15_2[L16_2]
                      if nil ~= L14_2 then
                        L16_2 = L14_2.unique
                        if L16_2 then
                          L16_2 = L11_2.unique
                        end
                        if not L16_2 then
                          L16_2 = L14_2.name
                          L17_2 = L16_2
                          L16_2 = L16_2.lower
                          L16_2 = L16_2(L17_2)
                          L17_2 = L11_2.name
                          L18_2 = L17_2
                          L17_2 = L17_2.lower
                          L17_2 = L17_2(L18_2)
                          if L16_2 ~= L17_2 then
                          else
                            L16_2 = L8_2.Functions
                            L16_2 = L16_2.GetItemByName
                            L17_2 = L11_2.name
                            L18_2 = L17_2
                            L17_2 = L17_2.lower
                            L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2(L18_2)
                            L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                            L16_2 = L16_2.amount
                            if L12_2 <= L16_2 then
                              L17_2 = AddToStash
                              L18_2 = L13_2
                              L19_2 = L10_2
                              L20_2 = L9_2
                              L21_2 = L15_2.name
                              L22_2 = L12_2
                              L23_2 = L11_2.info
                              L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                              if L17_2 then
                                L17_2 = L7_2.Functions
                                L17_2 = L17_2.RemoveItem
                                L18_2 = L11_2.name
                                L19_2 = L12_2
                                L20_2 = L9_2
                                L17_2(L18_2, L19_2, L20_2)
                                L17_2 = TriggerClientEvent
                                L18_2 = "inventory:client:CheckWeapon"
                                L19_2 = L6_2
                                L20_2 = L11_2.name
                                L17_2(L18_2, L19_2, L20_2)
                                L17_2 = sendToDiscordStash
                                L18_2 = Config
                                L18_2 = L18_2.WebhookTranslates
                                L18_2 = L18_2.stash
                                L18_2 = L18_2.title
                                L19_2 = "**"
                                L20_2 = GetPlayerName
                                L21_2 = source
                                L20_2 = L20_2(L21_2)
                                L21_2 = Config
                                L21_2 = L21_2.WebhookTranslates
                                L21_2 = L21_2.stash
                                L21_2 = L21_2.stash_deposit
                                L22_2 = L13_2
                                L23_2 = Config
                                L23_2 = L23_2.WebhookTranslates
                                L23_2 = L23_2.stash
                                L23_2 = L23_2.item_deposit
                                L24_2 = L15_2.name
                                L25_2 = " x "
                                L26_2 = L12_2
                                L19_2 = L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2
                                L20_2 = 7393279
                                L17_2(L18_2, L19_2, L20_2)
                              else
                                L17_2 = UpdateInventory
                                L18_2 = L6_2
                                L17_2(L18_2)
                              end
                            else
                              L17_2 = UpdateInventory
                              L18_2 = L6_2
                              L17_2(L18_2)
                            end
                          end
                        end
                      end
                    else
                      L13_2 = tonumber
                      L14_2 = A1_2
                      L13_2 = L13_2(L14_2)
                      A1_2 = L13_2
                      if nil == A1_2 or 0 == A1_2 then
                        L13_2 = CreateNewDrop
                        L14_2 = L6_2
                        L15_2 = L9_2
                        L16_2 = L10_2
                        L17_2 = L12_2
                        L13_2(L14_2, L15_2, L16_2, L17_2)
                      else
                        L13_2 = Drops
                        L13_2 = L13_2[A1_2]
                        L13_2 = L13_2.items
                        L13_2 = L13_2[L10_2]
                        if nil ~= L13_2 then
                          L14_2 = L13_2.unique
                          if L14_2 then
                            L14_2 = L11_2.unique
                            if L14_2 then
                              return
                            end
                          end
                          L14_2 = L13_2.name
                          L15_2 = L14_2
                          L14_2 = L14_2.lower
                          L14_2 = L14_2(L15_2)
                          L15_2 = L11_2.name
                          L16_2 = L15_2
                          L15_2 = L15_2.lower
                          L15_2 = L15_2(L16_2)
                          if L14_2 ~= L15_2 then
                        end
                        else
                          L14_2 = L8_2.Functions
                          L14_2 = L14_2.GetItemByName
                          L15_2 = L11_2.name
                          L16_2 = L15_2
                          L15_2 = L15_2.lower
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L15_2(L16_2)
                          L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                          L14_2 = L14_2.amount
                          if not (L12_2 <= L14_2) then
                            return
                          end
                          L15_2 = L7_2.Functions
                          L15_2 = L15_2.RemoveItem
                          L16_2 = L11_2.name
                          L17_2 = L12_2
                          L18_2 = L9_2
                          L15_2(L16_2, L17_2, L18_2)
                          L15_2 = TriggerClientEvent
                          L16_2 = "inventory:client:CheckWeapon"
                          L17_2 = L6_2
                          L18_2 = L11_2.name
                          L15_2(L16_2, L17_2, L18_2)
                          if nil ~= L13_2 then
                            L15_2 = QBCore
                            L15_2 = L15_2.Shared
                            L15_2 = L15_2.Items
                            L16_2 = L13_2.name
                            L17_2 = L16_2
                            L16_2 = L16_2.lower
                            L16_2 = L16_2(L17_2)
                            L15_2 = L15_2[L16_2]
                            L16_2 = tonumber
                            L17_2 = A5_2
                            L16_2 = L16_2(L17_2)
                            if nil ~= L16_2 then
                              L16_2 = tonumber
                              L17_2 = A5_2
                              L16_2 = L16_2(L17_2)
                              if L16_2 then
                                goto lbl_2899
                              end
                            end
                            L16_2 = L13_2.amount
                            ::lbl_2899::
                            L17_2 = L13_2.name
                            L18_2 = L11_2.name
                            if L17_2 ~= L18_2 then
                              L17_2 = L7_2.Functions
                              L17_2 = L17_2.AddItem
                              L18_2 = L13_2.name
                              L19_2 = L16_2
                              L20_2 = L9_2
                              L21_2 = L13_2.info
                              L17_2(L18_2, L19_2, L20_2, L21_2)
                              L17_2 = RemoveFromDrop
                              L18_2 = A1_2
                              L19_2 = L9_2
                              L20_2 = L15_2.name
                              L21_2 = L16_2
                              L17_2(L18_2, L19_2, L20_2, L21_2)
                            end
                          else
                            L15_2 = QBCore
                            L15_2 = L15_2.Shared
                            L15_2 = L15_2.Items
                            L16_2 = L11_2.name
                            L17_2 = L16_2
                            L16_2 = L16_2.lower
                            L16_2 = L16_2(L17_2)
                            L15_2 = L15_2[L16_2]
                          end
                          L15_2 = QBCore
                          L15_2 = L15_2.Shared
                          L15_2 = L15_2.Items
                          L16_2 = L11_2.name
                          L17_2 = L16_2
                          L16_2 = L16_2.lower
                          L16_2 = L16_2(L17_2)
                          L15_2 = L15_2[L16_2]
                          L16_2 = AddToDrop
                          L17_2 = A1_2
                          L18_2 = L10_2
                          L19_2 = L15_2.name
                          L20_2 = L12_2
                          L21_2 = L11_2.info
                          L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
                          L16_2 = L15_2.name
                          if "radio" == L16_2 then
                            L16_2 = TriggerClientEvent
                            L17_2 = "scully_radio:leaveChannel"
                            L18_2 = L6_2
                            L19_2 = true
                            L16_2(L17_2, L18_2, L19_2)
                          end
                          L16_2 = TriggerClientEvent
                          L17_2 = "inventory:ClearWeapons"
                          L18_2 = L6_2
                          L16_2(L17_2, L18_2)
                        end
                      end
                    end
                  end
                end
              end
            end
        end
        else
          L13_2 = TriggerClientEvent
          L14_2 = "qs-inventory:sendMessage"
          L15_2 = source
          L16_2 = Lang
          L17_2 = "INVENTORY_NO_ITEM"
          L16_2 = L16_2(L17_2)
          L17_2 = "error"
          L13_2(L14_2, L15_2, L16_2, L17_2)
        end
      else
        L11_2 = QBCore
        L11_2 = L11_2.Shared
        L11_2 = L11_2.SplitStr
        L12_2 = A0_2
        L13_2 = "-"
        L11_2 = L11_2(L12_2, L13_2)
        L11_2 = L11_2[1]
        if "otherplayer" == L11_2 then
          L11_2 = tonumber
          L12_2 = QBCore
          L12_2 = L12_2.Shared
          L12_2 = L12_2.SplitStr
          L13_2 = A0_2
          L14_2 = "-"
          L12_2 = L12_2(L13_2, L14_2)
          L12_2 = L12_2[2]
          L11_2 = L11_2(L12_2)
          L12_2 = QBCore
          L12_2 = L12_2.Functions
          L12_2 = L12_2.GetPlayer
          L13_2 = L11_2
          L12_2 = L12_2(L13_2)
          L13_2 = L12_2.PlayerData
          L13_2 = L13_2.items
          L13_2 = L13_2[L9_2]
          L14_2 = tonumber
          L15_2 = A4_2
          L14_2 = L14_2(L15_2)
          if nil ~= L14_2 then
            L14_2 = tonumber
            L15_2 = A4_2
            L14_2 = L14_2(L15_2)
            if L14_2 then
              goto lbl_2997
            end
          end
          L14_2 = L13_2.amount
          ::lbl_2997::
          if nil ~= L13_2 then
            L15_2 = L13_2.amount
            if L14_2 <= L15_2 then
              L15_2 = QBCore
              L15_2 = L15_2.Shared
              L15_2 = L15_2.Items
              L16_2 = L13_2.name
              L17_2 = L16_2
              L16_2 = L16_2.lower
              L16_2 = L16_2(L17_2)
              L15_2 = L15_2[L16_2]
              if "player" == A1_2 or "hotbar" == A1_2 then
                L16_2 = L7_2.Functions
                L16_2 = L16_2.GetItemBySlot
                L17_2 = L10_2
                L16_2 = L16_2(L17_2)
                L17_2 = L7_2.Functions
                L17_2 = L17_2.AddItem
                L18_2 = L13_2.name
                L19_2 = L14_2
                L20_2 = L10_2
                L21_2 = L13_2.info
                L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
                if not L17_2 then
                  return
                end
                L17_2 = L12_2.Functions
                L17_2 = L17_2.RemoveItem
                L18_2 = L15_2.name
                L19_2 = L14_2
                L20_2 = L9_2
                L17_2(L18_2, L19_2, L20_2)
                L17_2 = TriggerClientEvent
                L18_2 = "inventory:client:CheckWeapon"
                L19_2 = L12_2.PlayerData
                L19_2 = L19_2.source
                L20_2 = L13_2.name
                L17_2(L18_2, L19_2, L20_2)
                if nil ~= L16_2 then
                  L17_2 = QBCore
                  L17_2 = L17_2.Shared
                  L17_2 = L17_2.Items
                  L18_2 = L16_2.name
                  L19_2 = L18_2
                  L18_2 = L18_2.lower
                  L18_2 = L18_2(L19_2)
                  L17_2 = L17_2[L18_2]
                  L18_2 = tonumber
                  L19_2 = A5_2
                  L18_2 = L18_2(L19_2)
                  if nil ~= L18_2 then
                    L18_2 = tonumber
                    L19_2 = A5_2
                    L18_2 = L18_2(L19_2)
                    if L18_2 then
                      goto lbl_3058
                    end
                  end
                  L18_2 = L16_2.amount
                  ::lbl_3058::
                  L19_2 = L16_2.name
                  L20_2 = L13_2.name
                  if L19_2 ~= L20_2 then
                    L19_2 = L7_2.Functions
                    L19_2 = L19_2.RemoveItem
                    L20_2 = L16_2.name
                    L21_2 = L18_2
                    L22_2 = L10_2
                    L19_2(L20_2, L21_2, L22_2)
                    L19_2 = L12_2.Functions
                    L19_2 = L19_2.AddItem
                    L20_2 = L17_2.name
                    L21_2 = L18_2
                    L22_2 = L9_2
                    L23_2 = L16_2.info
                    L19_2(L20_2, L21_2, L22_2, L23_2)
                  end
                else
                  L17_2 = sendToDiscordSteal
                  L18_2 = Config
                  L18_2 = L18_2.WebhookTranslates
                  L18_2 = L18_2.steal
                  L18_2 = L18_2.title
                  L19_2 = "**"
                  L20_2 = GetPlayerName
                  L21_2 = source
                  L20_2 = L20_2(L21_2)
                  L21_2 = Config
                  L21_2 = L21_2.WebhookTranslates
                  L21_2 = L21_2.steal
                  L21_2 = L21_2.steal_player
                  L22_2 = GetPlayerName
                  L23_2 = L12_2.PlayerData
                  L23_2 = L23_2.source
                  L22_2 = L22_2(L23_2)
                  L23_2 = Config
                  L23_2 = L23_2.WebhookTranslates
                  L23_2 = L23_2.steal
                  L23_2 = L23_2.item_stealed
                  L24_2 = L13_2.name
                  L25_2 = " x "
                  L26_2 = L14_2
                  L19_2 = L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2
                  L20_2 = 7393279
                  L17_2(L18_2, L19_2, L20_2)
                end
              else
                L16_2 = L12_2.PlayerData
                L16_2 = L16_2.items
                L16_2 = L16_2[L10_2]
                L17_2 = L12_2.Functions
                L17_2 = L17_2.RemoveItem
                L18_2 = L15_2.name
                L19_2 = L14_2
                L20_2 = L9_2
                L17_2(L18_2, L19_2, L20_2)
                if nil ~= L16_2 then
                  L17_2 = QBCore
                  L17_2 = L17_2.Shared
                  L17_2 = L17_2.Items
                  L18_2 = L16_2.name
                  L19_2 = L18_2
                  L18_2 = L18_2.lower
                  L18_2 = L18_2(L19_2)
                  L17_2 = L17_2[L18_2]
                  L18_2 = tonumber
                  L19_2 = A5_2
                  L18_2 = L18_2(L19_2)
                  if nil ~= L18_2 then
                    L18_2 = tonumber
                    L19_2 = A5_2
                    L18_2 = L18_2(L19_2)
                    if L18_2 then
                      goto lbl_3133
                    end
                  end
                  L18_2 = L16_2.amount
                  ::lbl_3133::
                  L19_2 = L16_2.name
                  L20_2 = L13_2.name
                  if L19_2 ~= L20_2 then
                    L19_2 = QBCore
                    L19_2 = L19_2.Shared
                    L19_2 = L19_2.Items
                    L20_2 = L16_2.name
                    L21_2 = L20_2
                    L20_2 = L20_2.lower
                    L20_2 = L20_2(L21_2)
                    L19_2 = L19_2[L20_2]
                    L20_2 = L12_2.Functions
                    L20_2 = L20_2.RemoveItem
                    L21_2 = L19_2.name
                    L22_2 = L18_2
                    L23_2 = L10_2
                    L20_2(L21_2, L22_2, L23_2)
                    L20_2 = L12_2.Functions
                    L20_2 = L20_2.AddItem
                    L21_2 = L19_2.name
                    L22_2 = L18_2
                    L23_2 = L9_2
                    L24_2 = L16_2.info
                    L20_2(L21_2, L22_2, L23_2, L24_2)
                  end
                end
                L17_2 = QBCore
                L17_2 = L17_2.Shared
                L17_2 = L17_2.Items
                L18_2 = L13_2.name
                L19_2 = L18_2
                L18_2 = L18_2.lower
                L18_2 = L18_2(L19_2)
                L17_2 = L17_2[L18_2]
                L18_2 = L12_2.Functions
                L18_2 = L18_2.AddItem
                L19_2 = L17_2.name
                L20_2 = L14_2
                L21_2 = L10_2
                L22_2 = L13_2.info
                L18_2(L19_2, L20_2, L21_2, L22_2)
              end
          end
          else
            L15_2 = TriggerClientEvent
            L16_2 = "qs-inventory:sendMessage"
            L17_2 = source
            L18_2 = Lang
            L19_2 = "INVENTORY_INVALID"
            L18_2 = L18_2(L19_2)
            L19_2 = "error"
            L15_2(L16_2, L17_2, L18_2, L19_2)
          end
        else
          L11_2 = QBCore
          L11_2 = L11_2.Shared
          L11_2 = L11_2.SplitStr
          L12_2 = A0_2
          L13_2 = "-"
          L11_2 = L11_2(L12_2, L13_2)
          L11_2 = L11_2[1]
          if "trunk" == L11_2 then
            L11_2 = QBCore
            L11_2 = L11_2.Shared
            L11_2 = L11_2.SplitStr
            L12_2 = A0_2
            L13_2 = "-"
            L11_2 = L11_2(L12_2, L13_2)
            L11_2 = L11_2[2]
            L12_2 = Trunks
            L12_2 = L12_2[L11_2]
            L12_2 = L12_2.items
            L12_2 = L12_2[L9_2]
            L13_2 = tonumber
            L14_2 = A4_2
            L13_2 = L13_2(L14_2)
            if nil ~= L13_2 then
              L13_2 = tonumber
              L14_2 = A4_2
              L13_2 = L13_2(L14_2)
              if L13_2 then
                goto lbl_3212
              end
            end
            L13_2 = L12_2.amount
            ::lbl_3212::
            if nil ~= L12_2 then
              L14_2 = L12_2.amount
              if L13_2 <= L14_2 then
                L14_2 = QBCore
                L14_2 = L14_2.Shared
                L14_2 = L14_2.Items
                L15_2 = L12_2.name
                L16_2 = L15_2
                L15_2 = L15_2.lower
                L15_2 = L15_2(L16_2)
                L14_2 = L14_2[L15_2]
                if "player" == A1_2 or "hotbar" == A1_2 then
                  L15_2 = L7_2.Functions
                  L15_2 = L15_2.GetItemBySlot
                  L16_2 = L10_2
                  L15_2 = L15_2(L16_2)
                  if nil ~= L15_2 then
                    L16_2 = L15_2.unique
                    if L16_2 then
                      L16_2 = L12_2.unique
                    end
                    if not L16_2 then
                      L16_2 = L15_2.name
                      L17_2 = L16_2
                      L16_2 = L16_2.lower
                      L16_2 = L16_2(L17_2)
                      L17_2 = L12_2.name
                      L18_2 = L17_2
                      L17_2 = L17_2.lower
                      L17_2 = L17_2(L18_2)
                      if L16_2 ~= L17_2 then
                      else
                        L16_2 = L7_2.Functions
                        L16_2 = L16_2.AddItem
                        L17_2 = L12_2.name
                        L18_2 = L13_2
                        L19_2 = L10_2
                        L20_2 = L12_2.info
                        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                        if L16_2 then
                          L16_2 = RemoveFromTrunk
                          L17_2 = L11_2
                          L18_2 = L9_2
                          L19_2 = L14_2.name
                          L20_2 = L13_2
                          L16_2(L17_2, L18_2, L19_2, L20_2)
                        else
                          L16_2 = UpdateInventory
                          L17_2 = L6_2
                          L16_2(L17_2)
                        end
                      end
                    end
                  end
                else
                  L15_2 = Trunks
                  L15_2 = L15_2[L11_2]
                  L15_2 = L15_2.items
                  L15_2 = L15_2[L10_2]
                  L16_2 = RemoveFromTrunk
                  L17_2 = L11_2
                  L18_2 = L9_2
                  L19_2 = L14_2.name
                  L20_2 = L13_2
                  L16_2(L17_2, L18_2, L19_2, L20_2)
                  if nil ~= L15_2 then
                    L16_2 = QBCore
                    L16_2 = L16_2.Shared
                    L16_2 = L16_2.Items
                    L17_2 = L15_2.name
                    L18_2 = L17_2
                    L17_2 = L17_2.lower
                    L17_2 = L17_2(L18_2)
                    L16_2 = L16_2[L17_2]
                    L17_2 = tonumber
                    L18_2 = A5_2
                    L17_2 = L17_2(L18_2)
                    if nil ~= L17_2 then
                      L17_2 = tonumber
                      L18_2 = A5_2
                      L17_2 = L17_2(L18_2)
                      if L17_2 then
                        goto lbl_3299
                      end
                    end
                    L17_2 = L15_2.amount
                    ::lbl_3299::
                    L18_2 = L15_2.name
                    L19_2 = L12_2.name
                    if L18_2 ~= L19_2 then
                      L18_2 = QBCore
                      L18_2 = L18_2.Shared
                      L18_2 = L18_2.Items
                      L19_2 = L15_2.name
                      L20_2 = L19_2
                      L19_2 = L19_2.lower
                      L19_2 = L19_2(L20_2)
                      L18_2 = L18_2[L19_2]
                      L19_2 = RemoveFromTrunk
                      L20_2 = L11_2
                      L21_2 = L10_2
                      L22_2 = L18_2.name
                      L23_2 = L17_2
                      L19_2(L20_2, L21_2, L22_2, L23_2)
                      L19_2 = AddToTrunk
                      L20_2 = L11_2
                      L21_2 = L9_2
                      L22_2 = L10_2
                      L23_2 = L18_2.name
                      L24_2 = L17_2
                      L25_2 = L15_2.info
                      L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
                    end
                  end
                  L16_2 = QBCore
                  L16_2 = L16_2.Shared
                  L16_2 = L16_2.Items
                  L17_2 = L12_2.name
                  L18_2 = L17_2
                  L17_2 = L17_2.lower
                  L17_2 = L17_2(L18_2)
                  L16_2 = L16_2[L17_2]
                  L17_2 = AddToTrunk
                  L18_2 = L11_2
                  L19_2 = L10_2
                  L20_2 = L9_2
                  L21_2 = L16_2.name
                  L22_2 = L13_2
                  L23_2 = L12_2.info
                  L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                end
            end
            else
              L14_2 = TriggerClientEvent
              L15_2 = "qs-inventory:sendMessage"
              L16_2 = source
              L17_2 = Lang
              L18_2 = "INVENTORY_INVALID"
              L17_2 = L17_2(L18_2)
              L18_2 = "error"
              L14_2(L15_2, L16_2, L17_2, L18_2)
            end
          else
            L11_2 = QBCore
            L11_2 = L11_2.Shared
            L11_2 = L11_2.SplitStr
            L12_2 = A0_2
            L13_2 = "-"
            L11_2 = L11_2(L12_2, L13_2)
            L11_2 = L11_2[1]
            if "glovebox" == L11_2 then
              L11_2 = QBCore
              L11_2 = L11_2.Shared
              L11_2 = L11_2.SplitStr
              L12_2 = A0_2
              L13_2 = "-"
              L11_2 = L11_2(L12_2, L13_2)
              L11_2 = L11_2[2]
              L12_2 = Gloveboxes
              L12_2 = L12_2[L11_2]
              L12_2 = L12_2.items
              L12_2 = L12_2[L9_2]
              L13_2 = tonumber
              L14_2 = A4_2
              L13_2 = L13_2(L14_2)
              if nil ~= L13_2 then
                L13_2 = tonumber
                L14_2 = A4_2
                L13_2 = L13_2(L14_2)
                if L13_2 then
                  goto lbl_3380
                end
              end
              L13_2 = L12_2.amount
              ::lbl_3380::
              if nil ~= L12_2 then
                L14_2 = L12_2.amount
                if L13_2 <= L14_2 then
                  L14_2 = QBCore
                  L14_2 = L14_2.Shared
                  L14_2 = L14_2.Items
                  L15_2 = L12_2.name
                  L16_2 = L15_2
                  L15_2 = L15_2.lower
                  L15_2 = L15_2(L16_2)
                  L14_2 = L14_2[L15_2]
                  if "player" == A1_2 or "hotbar" == A1_2 then
                    L15_2 = L7_2.Functions
                    L15_2 = L15_2.GetItemBySlot
                    L16_2 = L10_2
                    L15_2 = L15_2(L16_2)
                    if nil ~= L15_2 then
                      L16_2 = L15_2.unique
                      if L16_2 then
                        L16_2 = L12_2.unique
                      end
                      if not L16_2 then
                        L16_2 = L15_2.name
                        L17_2 = L16_2
                        L16_2 = L16_2.lower
                        L16_2 = L16_2(L17_2)
                        L17_2 = L12_2.name
                        L18_2 = L17_2
                        L17_2 = L17_2.lower
                        L17_2 = L17_2(L18_2)
                        if L16_2 ~= L17_2 then
                        else
                          L16_2 = L7_2.Functions
                          L16_2 = L16_2.AddItem
                          L17_2 = L12_2.name
                          L18_2 = L13_2
                          L19_2 = L10_2
                          L20_2 = L12_2.info
                          L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                          if L16_2 then
                            L16_2 = RemoveFromGlovebox
                            L17_2 = L11_2
                            L18_2 = L9_2
                            L19_2 = L14_2.name
                            L20_2 = L13_2
                            L16_2(L17_2, L18_2, L19_2, L20_2)
                          else
                            L16_2 = UpdateInventory
                            L17_2 = L6_2
                            L16_2(L17_2)
                          end
                        end
                      end
                    end
                  else
                    L15_2 = Gloveboxes
                    L15_2 = L15_2[L11_2]
                    L15_2 = L15_2.items
                    L15_2 = L15_2[L10_2]
                    L16_2 = RemoveFromGlovebox
                    L17_2 = L11_2
                    L18_2 = L9_2
                    L19_2 = L14_2.name
                    L20_2 = L13_2
                    L16_2(L17_2, L18_2, L19_2, L20_2)
                    if nil ~= L15_2 then
                      L16_2 = QBCore
                      L16_2 = L16_2.Shared
                      L16_2 = L16_2.Items
                      L17_2 = L15_2.name
                      L18_2 = L17_2
                      L17_2 = L17_2.lower
                      L17_2 = L17_2(L18_2)
                      L16_2 = L16_2[L17_2]
                      L17_2 = tonumber
                      L18_2 = A5_2
                      L17_2 = L17_2(L18_2)
                      if nil ~= L17_2 then
                        L17_2 = tonumber
                        L18_2 = A5_2
                        L17_2 = L17_2(L18_2)
                        if L17_2 then
                          goto lbl_3467
                        end
                      end
                      L17_2 = L15_2.amount
                      ::lbl_3467::
                      L18_2 = L15_2.name
                      L19_2 = L12_2.name
                      if L18_2 ~= L19_2 then
                        L18_2 = QBCore
                        L18_2 = L18_2.Shared
                        L18_2 = L18_2.Items
                        L19_2 = L15_2.name
                        L20_2 = L19_2
                        L19_2 = L19_2.lower
                        L19_2 = L19_2(L20_2)
                        L18_2 = L18_2[L19_2]
                        L19_2 = RemoveFromGlovebox
                        L20_2 = L11_2
                        L21_2 = L10_2
                        L22_2 = L18_2.name
                        L23_2 = L17_2
                        L19_2(L20_2, L21_2, L22_2, L23_2)
                        L19_2 = AddToGlovebox
                        L20_2 = L11_2
                        L21_2 = L9_2
                        L22_2 = L10_2
                        L23_2 = L18_2.name
                        L24_2 = L17_2
                        L25_2 = L15_2.info
                        L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
                      end
                    end
                    L16_2 = QBCore
                    L16_2 = L16_2.Shared
                    L16_2 = L16_2.Items
                    L17_2 = L12_2.name
                    L18_2 = L17_2
                    L17_2 = L17_2.lower
                    L17_2 = L17_2(L18_2)
                    L16_2 = L16_2[L17_2]
                    L17_2 = AddToGlovebox
                    L18_2 = L11_2
                    L19_2 = L10_2
                    L20_2 = L9_2
                    L21_2 = L16_2.name
                    L22_2 = L13_2
                    L23_2 = L12_2.info
                    L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                  end
              end
              else
                L14_2 = TriggerClientEvent
                L15_2 = "qs-inventory:sendMessage"
                L16_2 = source
                L17_2 = Lang
                L18_2 = "INVENTORY_INVALID"
                L17_2 = L17_2(L18_2)
                L18_2 = "error"
                L14_2(L15_2, L16_2, L17_2, L18_2)
              end
            else
              L11_2 = QBCore
              L11_2 = L11_2.Shared
              L11_2 = L11_2.SplitStr
              L12_2 = A0_2
              L13_2 = "-"
              L11_2 = L11_2(L12_2, L13_2)
              L11_2 = L11_2[1]
              if "stash" == L11_2 then
                L11_2 = QBCore
                L11_2 = L11_2.Shared
                L11_2 = L11_2.SplitStr
                L12_2 = A0_2
                L13_2 = "-"
                L11_2 = L11_2(L12_2, L13_2)
                L11_2 = L11_2[2]
                L12_2 = Stashes
                L12_2 = L12_2[L11_2]
                L12_2 = L12_2.items
                L12_2 = L12_2[L9_2]
                L13_2 = tonumber
                L14_2 = A4_2
                L13_2 = L13_2(L14_2)
                if nil ~= L13_2 then
                  L13_2 = tonumber
                  L14_2 = A4_2
                  L13_2 = L13_2(L14_2)
                  if L13_2 then
                    goto lbl_3548
                  end
                end
                L13_2 = L12_2.amount
                ::lbl_3548::
                if nil ~= L12_2 then
                  L14_2 = L12_2.amount
                  if L13_2 <= L14_2 then
                    L14_2 = QBCore
                    L14_2 = L14_2.Shared
                    L14_2 = L14_2.Items
                    L15_2 = L12_2.name
                    L16_2 = L15_2
                    L15_2 = L15_2.lower
                    L15_2 = L15_2(L16_2)
                    L14_2 = L14_2[L15_2]
                    if "player" == A1_2 or "hotbar" == A1_2 then
                      L15_2 = L7_2.Functions
                      L15_2 = L15_2.GetItemBySlot
                      L16_2 = L10_2
                      L15_2 = L15_2(L16_2)
                      if nil ~= L15_2 then
                        L16_2 = L15_2.unique
                        if L16_2 then
                          L16_2 = L12_2.unique
                        end
                        if not L16_2 then
                          L16_2 = L15_2.name
                          L17_2 = L16_2
                          L16_2 = L16_2.lower
                          L16_2 = L16_2(L17_2)
                          L17_2 = L12_2.name
                          L18_2 = L17_2
                          L17_2 = L17_2.lower
                          L17_2 = L17_2(L18_2)
                          if L16_2 ~= L17_2 then
                          else
                            L16_2 = L7_2.Functions
                            L16_2 = L16_2.AddItem
                            L17_2 = L12_2.name
                            L18_2 = L13_2
                            L19_2 = L10_2
                            L20_2 = L12_2.info
                            L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                            if L16_2 then
                              L16_2 = RemoveFromStash
                              L17_2 = L11_2
                              L18_2 = L9_2
                              L19_2 = L14_2.name
                              L20_2 = L13_2
                              L16_2(L17_2, L18_2, L19_2, L20_2)
                              L16_2 = sendToDiscordStash
                              L17_2 = Config
                              L17_2 = L17_2.WebhookTranslates
                              L17_2 = L17_2.stash
                              L17_2 = L17_2.title
                              L18_2 = "**"
                              L19_2 = GetPlayerName
                              L20_2 = source
                              L19_2 = L19_2(L20_2)
                              L20_2 = Config
                              L20_2 = L20_2.WebhookTranslates
                              L20_2 = L20_2.stash
                              L20_2 = L20_2.stash_deposit
                              L21_2 = L11_2
                              L22_2 = Config
                              L22_2 = L22_2.WebhookTranslates
                              L22_2 = L22_2.stash
                              L22_2 = L22_2.item_deposit
                              L23_2 = L14_2.name
                              L24_2 = " x "
                              L25_2 = L13_2
                              L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2
                              L19_2 = 7393279
                              L16_2(L17_2, L18_2, L19_2)
                            else
                              L16_2 = UpdateInventory
                              L17_2 = L6_2
                              L16_2(L17_2)
                            end
                          end
                        end
                      end
                    else
                      L15_2 = Stashes
                      L15_2 = L15_2[L11_2]
                      L15_2 = L15_2.items
                      L15_2 = L15_2[L10_2]
                      L16_2 = RemoveFromStash
                      L17_2 = L11_2
                      L18_2 = L9_2
                      L19_2 = L14_2.name
                      L20_2 = L13_2
                      L16_2(L17_2, L18_2, L19_2, L20_2)
                      if nil ~= L15_2 then
                        L16_2 = QBCore
                        L16_2 = L16_2.Shared
                        L16_2 = L16_2.Items
                        L17_2 = L15_2.name
                        L18_2 = L17_2
                        L17_2 = L17_2.lower
                        L17_2 = L17_2(L18_2)
                        L16_2 = L16_2[L17_2]
                        L17_2 = tonumber
                        L18_2 = A5_2
                        L17_2 = L17_2(L18_2)
                        if nil ~= L17_2 then
                          L17_2 = tonumber
                          L18_2 = A5_2
                          L17_2 = L17_2(L18_2)
                          if L17_2 then
                            goto lbl_3659
                          end
                        end
                        L17_2 = L15_2.amount
                        ::lbl_3659::
                        L18_2 = L15_2.name
                        L19_2 = L12_2.name
                        if L18_2 ~= L19_2 then
                          L18_2 = QBCore
                          L18_2 = L18_2.Shared
                          L18_2 = L18_2.Items
                          L19_2 = L15_2.name
                          L20_2 = L19_2
                          L19_2 = L19_2.lower
                          L19_2 = L19_2(L20_2)
                          L18_2 = L18_2[L19_2]
                          L19_2 = RemoveFromStash
                          L20_2 = L11_2
                          L21_2 = L10_2
                          L22_2 = L18_2.name
                          L23_2 = L17_2
                          L19_2(L20_2, L21_2, L22_2, L23_2)
                          L19_2 = AddToStash
                          L20_2 = L11_2
                          L21_2 = L9_2
                          L22_2 = L10_2
                          L23_2 = L18_2.name
                          L24_2 = L17_2
                          L25_2 = L15_2.info
                          L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
                        end
                      end
                      L16_2 = QBCore
                      L16_2 = L16_2.Shared
                      L16_2 = L16_2.Items
                      L17_2 = L12_2.name
                      L18_2 = L17_2
                      L17_2 = L17_2.lower
                      L17_2 = L17_2(L18_2)
                      L16_2 = L16_2[L17_2]
                      L17_2 = AddToStash
                      L18_2 = L11_2
                      L19_2 = L10_2
                      L20_2 = L9_2
                      L21_2 = L16_2.name
                      L22_2 = L13_2
                      L23_2 = L12_2.info
                      L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                    end
                end
                else
                  L14_2 = TriggerClientEvent
                  L15_2 = "qs-inventory:sendMessage"
                  L16_2 = source
                  L17_2 = Lang
                  L18_2 = "INVENTORY_INVALID"
                  L17_2 = L17_2(L18_2)
                  L18_2 = "error"
                  L14_2(L15_2, L16_2, L17_2, L18_2)
                end
              else
                L11_2 = QBCore
                L11_2 = L11_2.Shared
                L11_2 = L11_2.SplitStr
                L12_2 = A0_2
                L13_2 = "_"
                L11_2 = L11_2(L12_2, L13_2)
                L11_2 = L11_2[1]
                if "garbage" == L11_2 then
                  L11_2 = QBCore
                  L11_2 = L11_2.Shared
                  L11_2 = L11_2.SplitStr
                  L12_2 = A0_2
                  L13_2 = "_"
                  L11_2 = L11_2(L12_2, L13_2)
                  L11_2 = L11_2[2]
                  L12_2 = GarbageItems
                  L12_2 = L12_2[L11_2]
                  L12_2 = L12_2.items
                  L12_2 = L12_2[L9_2]
                  if L12_2 then
                    L13_2 = QBCore
                    L13_2 = L13_2.Shared
                    L13_2 = L13_2.Items
                    L14_2 = L12_2.name
                    L15_2 = L14_2
                    L14_2 = L14_2.lower
                    L14_2 = L14_2(L15_2)
                    L13_2 = L13_2[L14_2]
                    L14_2 = L7_2.Functions
                    L14_2 = L14_2.GetItemBySlot
                    L15_2 = L10_2
                    L14_2 = L14_2(L15_2)
                    if nil ~= L14_2 then
                      L15_2 = L14_2.unique
                      if L15_2 then
                        L15_2 = L12_2.unique
                      end
                      if not L15_2 then
                        L15_2 = L14_2.name
                        L16_2 = L15_2
                        L15_2 = L15_2.lower
                        L15_2 = L15_2(L16_2)
                        L16_2 = L12_2.name
                        L17_2 = L16_2
                        L16_2 = L16_2.lower
                        L16_2 = L16_2(L17_2)
                        if L15_2 ~= L16_2 then
                        else
                          L15_2 = L7_2.Functions
                          L15_2 = L15_2.AddItem
                          L16_2 = L12_2.name
                          L17_2 = A4_2
                          L18_2 = L10_2
                          L19_2 = L12_2.info
                          L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2)
                          if L15_2 then
                            L15_2 = RemoveFromGarbage
                            L16_2 = L11_2
                            L17_2 = L9_2
                            L18_2 = L12_2.name
                            L19_2 = A4_2
                            L15_2(L16_2, L17_2, L18_2, L19_2)
                            L15_2 = sendToDiscordGarbage
                            L16_2 = Config
                            L16_2 = L16_2.WebhookTranslates
                            L16_2 = L16_2.garbage
                            L16_2 = L16_2.title
                            L17_2 = "**"
                            L18_2 = GetPlayerName
                            L19_2 = source
                            L18_2 = L18_2(L19_2)
                            L19_2 = Config
                            L19_2 = L19_2.WebhookTranslates
                            L19_2 = L19_2.garbage
                            L19_2 = L19_2.pickup
                            L20_2 = L11_2
                            L21_2 = Config
                            L21_2 = L21_2.WebhookTranslates
                            L21_2 = L21_2.garbage
                            L21_2 = L21_2.items
                            L22_2 = L13_2.label
                            L23_2 = " x "
                            L24_2 = A4_2
                            L17_2 = L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2
                            L18_2 = 7393279
                            L15_2(L16_2, L17_2, L18_2)
                          end
                        end
                      end
                    end
                  else
                    L13_2 = UpdateInventory
                    L14_2 = L6_2
                    L13_2(L14_2)
                  end
                else
                  L11_2 = QBCore
                  L11_2 = L11_2.Shared
                  L11_2 = L11_2.SplitStr
                  L12_2 = A0_2
                  L13_2 = "-"
                  L11_2 = L11_2(L12_2, L13_2)
                  L11_2 = L11_2[1]
                  if "itemshop" == L11_2 then
                    L11_2 = false
                    L12_2 = QBCore
                    L12_2 = L12_2.Shared
                    L12_2 = L12_2.SplitStr
                    L13_2 = A0_2
                    L14_2 = "-"
                    L12_2 = L12_2(L13_2, L14_2)
                    L12_2 = L12_2[2]
                    if L12_2 then
                      L13_2 = QBCore
                      L13_2 = L13_2.Shared
                      L13_2 = L13_2.SplitStr
                      L14_2 = L12_2
                      L15_2 = "_"
                      L13_2 = L13_2(L14_2, L15_2)
                      L13_2 = L13_2[1]
                      if "Customshop" ~= L13_2 then
                        L13_2 = ShopItems
                        L13_2 = L13_2[L12_2]
                        L13_2 = L13_2.items
                        L13_2 = L13_2[L9_2]
                        L14_2 = QBCore
                        L14_2 = L14_2.Shared
                        L14_2 = L14_2.Items
                        L15_2 = L13_2.name
                        L16_2 = L15_2
                        L15_2 = L15_2.lower
                        L15_2 = L15_2(L16_2)
                        L14_2 = L14_2[L15_2]
                        L15_2 = L14_2.type
                        if "weapon" ~= L15_2 then
                          L15_2 = L14_2.unique
                          if true ~= L15_2 then
                            goto lbl_3896
                          end
                        end
                        if A4_2 then
                          L15_2 = tonumber
                          L16_2 = A4_2
                          L15_2 = L15_2(L16_2)
                          if L15_2 > 1 then
                            A4_2 = 1
                            L11_2 = true
                          end
                        end
                        L15_2 = L14_2.type
                        if "weapon" == L15_2 then
                          L15_2 = L13_2.info
                          L16_2 = tostring
                          L17_2 = QBCore
                          L17_2 = L17_2.Shared
                          L17_2 = L17_2.RandomInt
                          L18_2 = 2
                          L17_2 = L17_2(L18_2)
                          L18_2 = QBCore
                          L18_2 = L18_2.Shared
                          L18_2 = L18_2.RandomStr
                          L19_2 = 3
                          L18_2 = L18_2(L19_2)
                          L19_2 = QBCore
                          L19_2 = L19_2.Shared
                          L19_2 = L19_2.RandomInt
                          L20_2 = 1
                          L19_2 = L19_2(L20_2)
                          L20_2 = QBCore
                          L20_2 = L20_2.Shared
                          L20_2 = L20_2.RandomStr
                          L21_2 = 2
                          L20_2 = L20_2(L21_2)
                          L21_2 = QBCore
                          L21_2 = L21_2.Shared
                          L21_2 = L21_2.RandomInt
                          L22_2 = 3
                          L21_2 = L21_2(L22_2)
                          L22_2 = QBCore
                          L22_2 = L22_2.Shared
                          L22_2 = L22_2.RandomStr
                          L23_2 = 4
                          L22_2 = L22_2(L23_2)
                          L17_2 = L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
                          L16_2 = L16_2(L17_2)
                          L15_2.serie = L16_2
                          L11_2 = true
                        end
                        ::lbl_3896::
                        L15_2 = tonumber
                        L16_2 = L13_2.price
                        L16_2 = L16_2 * A4_2
                        L15_2 = L15_2(L16_2)
                        L16_2 = ShopItems
                        L16_2 = L16_2[L12_2]
                        L16_2 = L16_2.type
                        if not L16_2 then
                          L16_2 = "cash"
                        end
                        if "money" == L16_2 then
                          L16_2 = "cash"
                        end
                        L17_2 = L8_2.PlayerData
                        L17_2 = L17_2.money
                        L17_2 = L17_2[L16_2]
                        L18_2 = L7_2.Functions
                        L18_2 = L18_2.GetItemBySlot
                        L19_2 = L10_2
                        L18_2 = L18_2(L19_2)
                        if nil ~= L18_2 then
                          L19_2 = L18_2.unique
                          if L19_2 then
                            L19_2 = L13_2.unique
                          end
                          if not L19_2 then
                            L19_2 = L18_2.name
                            L20_2 = L19_2
                            L19_2 = L19_2.lower
                            L19_2 = L19_2(L20_2)
                            L20_2 = L13_2.name
                            L21_2 = L20_2
                            L20_2 = L20_2.lower
                            L20_2 = L20_2(L21_2)
                            if L19_2 ~= L20_2 then
                            elseif "cash" == L16_2 then
                              if L15_2 <= L17_2 then
                                L19_2 = L7_2.Functions
                                L19_2 = L19_2.AddItem
                                L20_2 = L13_2.name
                                L21_2 = A4_2
                                L22_2 = L10_2
                                L23_2 = L13_2.info
                                L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
                                if L19_2 then
                                  L19_2 = L8_2.Functions
                                  L19_2 = L19_2.RemoveMoney
                                  L20_2 = "cash"
                                  L21_2 = L15_2
                                  L19_2(L20_2, L21_2)
                                  if L11_2 then
                                    L19_2 = TriggerClientEvent
                                    L20_2 = "inventory:client:UpdatePlayerInventory"
                                    L21_2 = L6_2
                                    L19_2(L20_2, L21_2)
                                  end
                                  L19_2 = TriggerClientEvent
                                  L20_2 = "qs-shops:client:UpdateShop"
                                  L21_2 = L6_2
                                  L22_2 = QBCore
                                  L22_2 = L22_2.Shared
                                  L22_2 = L22_2.SplitStr
                                  L23_2 = L12_2
                                  L24_2 = "_"
                                  L22_2 = L22_2(L23_2, L24_2)
                                  L22_2 = L22_2[2]
                                  L23_2 = L13_2
                                  L24_2 = A4_2
                                  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
                                  L19_2 = TriggerClientEvent
                                  L20_2 = "qs-inventory:sendMessage"
                                  L21_2 = L6_2
                                  L22_2 = Lang
                                  L23_2 = "INVENTORY_YOU_BUY"
                                  L22_2 = L22_2(L23_2)
                                  L23_2 = L14_2.label
                                  L22_2 = L22_2 .. L23_2
                                  L23_2 = "success"
                                  L19_2(L20_2, L21_2, L22_2, L23_2)
                                  L19_2 = sendToDiscordShops
                                  L20_2 = Config
                                  L20_2 = L20_2.WebhookTranslates
                                  L20_2 = L20_2.shop
                                  L20_2 = L20_2.title
                                  L21_2 = "**"
                                  L22_2 = GetPlayerName
                                  L23_2 = L6_2
                                  L22_2 = L22_2(L23_2)
                                  L23_2 = Config
                                  L23_2 = L23_2.WebhookTranslates
                                  L23_2 = L23_2.shop
                                  L23_2 = L23_2.buy
                                  L24_2 = L14_2.label
                                  L25_2 = " x "
                                  L26_2 = A4_2
                                  L27_2 = Config
                                  L27_2 = L27_2.WebhookTranslates
                                  L27_2 = L27_2.shop
                                  L27_2 = L27_2.cost
                                  L28_2 = L15_2
                                  L21_2 = L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2 .. L27_2 .. L28_2
                                  L22_2 = 7393279
                                  L19_2(L20_2, L21_2, L22_2)
                                else
                                  L19_2 = UpdateInventory
                                  L20_2 = L6_2
                                  L19_2(L20_2)
                                end
                              else
                                L19_2 = TriggerClientEvent
                                L20_2 = "inventory:client:UpdatePlayerInventory"
                                L21_2 = L6_2
                                L19_2(L20_2, L21_2)
                                L19_2 = TriggerClientEvent
                                L20_2 = "inventory:client:UpdateDebug"
                                L21_2 = L6_2
                                L19_2(L20_2, L21_2)
                                L19_2 = TriggerClientEvent
                                L20_2 = "qs-inventory:sendMessage"
                                L21_2 = L6_2
                                L22_2 = Lang
                                L23_2 = "NO_MONEY"
                                L22_2 = L22_2(L23_2)
                                L23_2 = "error"
                                L19_2(L20_2, L21_2, L22_2, L23_2)
                              end
                            elseif L15_2 <= L17_2 then
                              L19_2 = L7_2.Functions
                              L19_2 = L19_2.AddItem
                              L20_2 = L13_2.name
                              L21_2 = A4_2
                              L22_2 = L10_2
                              L23_2 = L13_2.info
                              L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
                              if L19_2 then
                                L19_2 = L8_2.Functions
                                L19_2 = L19_2.RemoveMoney
                                L20_2 = "bank"
                                L21_2 = L15_2
                                L19_2(L20_2, L21_2)
                                if L11_2 then
                                  L19_2 = TriggerClientEvent
                                  L20_2 = "inventory:client:UpdatePlayerInventory"
                                  L21_2 = L6_2
                                  L19_2(L20_2, L21_2)
                                end
                                L19_2 = TriggerClientEvent
                                L20_2 = "qs-shops:client:UpdateShop"
                                L21_2 = L6_2
                                L22_2 = QBCore
                                L22_2 = L22_2.Shared
                                L22_2 = L22_2.SplitStr
                                L23_2 = L12_2
                                L24_2 = "_"
                                L22_2 = L22_2(L23_2, L24_2)
                                L22_2 = L22_2[2]
                                L23_2 = L13_2
                                L24_2 = A4_2
                                L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
                                L19_2 = TriggerClientEvent
                                L20_2 = "qs-inventory:sendMessage"
                                L21_2 = L6_2
                                L22_2 = Lang
                                L23_2 = "INVENTORY_YOU_BUY"
                                L22_2 = L22_2(L23_2)
                                L23_2 = L14_2.label
                                L22_2 = L22_2 .. L23_2
                                L23_2 = "success"
                                L19_2(L20_2, L21_2, L22_2, L23_2)
                                L19_2 = sendToDiscordShops
                                L20_2 = Config
                                L20_2 = L20_2.WebhookTranslates
                                L20_2 = L20_2.shop
                                L20_2 = L20_2.title
                                L21_2 = "**"
                                L22_2 = GetPlayerName
                                L23_2 = L6_2
                                L22_2 = L22_2(L23_2)
                                L23_2 = Config
                                L23_2 = L23_2.WebhookTranslates
                                L23_2 = L23_2.shop
                                L23_2 = L23_2.buy
                                L24_2 = L14_2.label
                                L25_2 = " x "
                                L26_2 = A4_2
                                L27_2 = Config
                                L27_2 = L27_2.WebhookTranslates
                                L27_2 = L27_2.shop
                                L27_2 = L27_2.cost
                                L28_2 = L15_2
                                L21_2 = L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2 .. L27_2 .. L28_2
                                L22_2 = 7393279
                                L19_2(L20_2, L21_2, L22_2)
                              else
                                L19_2 = UpdateInventory
                                L20_2 = L6_2
                                L19_2(L20_2)
                              end
                            else
                              L19_2 = TriggerClientEvent
                              L20_2 = "inventory:client:UpdatePlayerInventory"
                              L21_2 = L6_2
                              L19_2(L20_2, L21_2)
                              L19_2 = TriggerClientEvent
                              L20_2 = "inventory:client:UpdateDebug"
                              L21_2 = L6_2
                              L19_2(L20_2, L21_2)
                              L19_2 = TriggerClientEvent
                              L20_2 = "qs-inventory:sendMessage"
                              L21_2 = L6_2
                              L22_2 = Lang
                              L23_2 = "NO_MONEY"
                              L22_2 = L22_2(L23_2)
                              L23_2 = "error"
                              L19_2(L20_2, L21_2, L22_2, L23_2)
                            end
                          end
                        end
                    end
                    else
                      return
                    end
                  elseif "crafting" == A0_2 then
                    L11_2 = Config
                    L11_2 = L11_2.CraftingItems
                    L11_2 = L11_2.items
                    L11_2 = L11_2[L9_2]
                    L12_2 = hasCraftItems
                    L13_2 = L6_2
                    L14_2 = L11_2.costs
                    L15_2 = A4_2
                    L12_2 = L12_2(L13_2, L14_2, L15_2)
                    if L12_2 then
                      L12_2 = TriggerClientEvent
                      L13_2 = "inventory:client:CraftItems"
                      L14_2 = L6_2
                      L15_2 = L11_2.name
                      L16_2 = L11_2.costs
                      L17_2 = A4_2
                      L18_2 = L10_2
                      L19_2 = L11_2.points
                      L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
                      L12_2 = sendToDiscordShops
                      L13_2 = Config
                      L13_2 = L13_2.WebhookTranslates
                      L13_2 = L13_2.crafting
                      L13_2 = L13_2.title
                      L14_2 = "**"
                      L15_2 = GetPlayerName
                      L16_2 = source
                      L15_2 = L15_2(L16_2)
                      L16_2 = Config
                      L16_2 = L16_2.WebhookTranslates
                      L16_2 = L16_2.crafting
                      L16_2 = L16_2.crafting_item
                      L17_2 = L11_2.name
                      L18_2 = " x "
                      L19_2 = A4_2
                      L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                      L15_2 = 7393279
                      L12_2(L13_2, L14_2, L15_2)
                    else
                      L12_2 = TriggerClientEvent
                      L13_2 = "inventory:client:UpdatePlayerInventory"
                      L14_2 = L6_2
                      L15_2 = true
                      L12_2(L13_2, L14_2, L15_2)
                      L12_2 = TriggerClientEvent
                      L13_2 = "inventory:client:UpdateDebug"
                      L14_2 = source
                      L12_2(L13_2, L14_2)
                      L12_2 = TriggerClientEvent
                      L13_2 = "qs-inventory:sendMessage"
                      L14_2 = source
                      L15_2 = Lang
                      L16_2 = "INVENTORY_CRAFTING_ERROR"
                      L15_2 = L15_2(L16_2)
                      L16_2 = "error"
                      L12_2(L13_2, L14_2, L15_2, L16_2)
                    end
                  elseif "attachment_crafting" == A0_2 then
                    L11_2 = Config
                    L11_2 = L11_2.AttachmentCrafting
                    L11_2 = L11_2.items
                    L11_2 = L11_2[L9_2]
                    L12_2 = hasCraftItems
                    L13_2 = L6_2
                    L14_2 = L11_2.costs
                    L15_2 = A4_2
                    L12_2 = L12_2(L13_2, L14_2, L15_2)
                    if L12_2 then
                      L12_2 = TriggerClientEvent
                      L13_2 = "inventory:client:CraftAttachment"
                      L14_2 = L6_2
                      L15_2 = L11_2.name
                      L16_2 = L11_2.costs
                      L17_2 = A4_2
                      L18_2 = L10_2
                      L19_2 = L11_2.points
                      L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
                      L12_2 = sendToDiscordShops
                      L13_2 = Config
                      L13_2 = L13_2.WebhookTranslates
                      L13_2 = L13_2.crafting
                      L13_2 = L13_2.title_att
                      L14_2 = "**"
                      L15_2 = GetPlayerName
                      L16_2 = source
                      L15_2 = L15_2(L16_2)
                      L16_2 = Config
                      L16_2 = L16_2.WebhookTranslates
                      L16_2 = L16_2.crafting
                      L16_2 = L16_2.crafting_att
                      L17_2 = L11_2.name
                      L18_2 = " x "
                      L19_2 = A4_2
                      L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                      L15_2 = 7393279
                      L12_2(L13_2, L14_2, L15_2)
                    else
                      L12_2 = TriggerClientEvent
                      L13_2 = "inventory:client:UpdatePlayerInventory"
                      L14_2 = L6_2
                      L15_2 = true
                      L12_2(L13_2, L14_2, L15_2)
                      L12_2 = TriggerClientEvent
                      L13_2 = "inventory:client:UpdateDebug"
                      L14_2 = source
                      L12_2(L13_2, L14_2)
                      L12_2 = TriggerClientEvent
                      L13_2 = "qs-inventory:sendMessage"
                      L14_2 = source
                      L15_2 = Lang
                      L16_2 = "INVENTORY_CRAFTING_ERROR"
                      L15_2 = L15_2(L16_2)
                      L16_2 = "error"
                      L12_2(L13_2, L14_2, L15_2, L16_2)
                    end
                  else
                    L11_2 = TriggerClientEvent
                    L12_2 = "inventory:ClearWeapons"
                    L13_2 = L6_2
                    L11_2(L12_2, L13_2)
                    L11_2 = tonumber
                    L12_2 = A0_2
                    L11_2 = L11_2(L12_2)
                    A0_2 = L11_2
                    L11_2 = Drops
                    L11_2 = L11_2[A0_2]
                    L11_2 = L11_2.items
                    L11_2 = L11_2[L9_2]
                    L12_2 = tonumber
                    L13_2 = A4_2
                    L12_2 = L12_2(L13_2)
                    if nil ~= L12_2 then
                      L12_2 = tonumber
                      L13_2 = A4_2
                      L12_2 = L12_2(L13_2)
                      if L12_2 then
                        goto lbl_4263
                      end
                    end
                    L12_2 = L11_2.amount
                    ::lbl_4263::
                    L13_2 = QBCore
                    L13_2 = L13_2.Functions
                    L13_2 = L13_2.GetPlayer
                    L14_2 = source
                    L13_2 = L13_2(L14_2)
                    if nil ~= L11_2 then
                      L14_2 = L11_2.amount
                      if L12_2 <= L14_2 then
                        L14_2 = QBCore
                        L14_2 = L14_2.Shared
                        L14_2 = L14_2.Items
                        L15_2 = L11_2.name
                        L16_2 = L15_2
                        L15_2 = L15_2.lower
                        L15_2 = L15_2(L16_2)
                        L14_2 = L14_2[L15_2]
                        if "player" == A1_2 or "hotbar" == A1_2 then
                          L15_2 = L7_2.Functions
                          L15_2 = L15_2.GetItemBySlot
                          L16_2 = L10_2
                          L15_2 = L15_2(L16_2)
                          if nil ~= L15_2 then
                            L16_2 = L15_2.unique
                            if L16_2 then
                              L16_2 = L11_2.unique
                              if L16_2 then
                                return
                              end
                            end
                            L16_2 = L15_2.name
                            L17_2 = L16_2
                            L16_2 = L16_2.lower
                            L16_2 = L16_2(L17_2)
                            L17_2 = L11_2.name
                            L18_2 = L17_2
                            L17_2 = L17_2.lower
                            L17_2 = L17_2(L18_2)
                            if L16_2 ~= L17_2 then
                          end
                          else
                            L16_2 = L7_2.Functions
                            L16_2 = L16_2.AddItem
                            L17_2 = L11_2.name
                            L18_2 = L12_2
                            L19_2 = L10_2
                            L20_2 = L11_2.info
                            L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                            if not L16_2 then
                              return
                            end
                            L16_2 = RemoveFromDrop
                            L17_2 = A0_2
                            L18_2 = L9_2
                            L19_2 = L14_2.name
                            L20_2 = L12_2
                            L16_2(L17_2, L18_2, L19_2, L20_2)
                            if nil ~= L15_2 then
                              L16_2 = tonumber
                              L17_2 = A5_2
                              L16_2 = L16_2(L17_2)
                              if nil ~= L16_2 then
                                L16_2 = tonumber
                                L17_2 = A5_2
                                L16_2 = L16_2(L17_2)
                                if L16_2 then
                                  goto lbl_4333
                                end
                              end
                              L16_2 = L15_2.amount
                              ::lbl_4333::
                              L17_2 = L15_2.name
                              L18_2 = L11_2.name
                              if L17_2 ~= L18_2 then
                                L17_2 = L11_2.name
                                L18_2 = L15_2.name
                                if L17_2 == L18_2 then
                                  L17_2 = L7_2.Functions
                                  L17_2 = L17_2.RemoveItem
                                  L18_2 = L15_2.name
                                  L19_2 = L16_2
                                  L20_2 = L10_2
                                  L17_2(L18_2, L19_2, L20_2)
                                  L17_2 = AddToDrop
                                  L18_2 = A0_2
                                  L19_2 = L10_2
                                  L20_2 = L15_2.name
                                  L21_2 = L16_2
                                  L22_2 = L15_2.info
                                  L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
                                end
                              end
                            else
                              L16_2 = sendToDiscordDrop
                              L17_2 = Config
                              L17_2 = L17_2.WebhookTranslates
                              L17_2 = L17_2.drop
                              L17_2 = L17_2.title
                              L18_2 = "**"
                              L19_2 = GetPlayerName
                              L20_2 = source
                              L19_2 = L19_2(L20_2)
                              L20_2 = Config
                              L20_2 = L20_2.WebhookTranslates
                              L20_2 = L20_2.drop
                              L20_2 = L20_2.pickup
                              L21_2 = L11_2.name
                              L22_2 = " x "
                              L23_2 = L12_2
                              L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2
                              L19_2 = 7393279
                              L16_2(L17_2, L18_2, L19_2)
                            end
                          end
                        else
                          L15_2 = tonumber
                          L16_2 = A1_2
                          L15_2 = L15_2(L16_2)
                          A1_2 = L15_2
                          L15_2 = Drops
                          L15_2 = L15_2[A1_2]
                          L15_2 = L15_2.items
                          L15_2 = L15_2[L10_2]
                          L16_2 = RemoveFromDrop
                          L17_2 = A0_2
                          L18_2 = L9_2
                          L19_2 = L14_2.name
                          L20_2 = L12_2
                          L16_2(L17_2, L18_2, L19_2, L20_2)
                          if nil ~= L15_2 then
                            L16_2 = QBCore
                            L16_2 = L16_2.Shared
                            L16_2 = L16_2.Items
                            L17_2 = L15_2.name
                            L18_2 = L17_2
                            L17_2 = L17_2.lower
                            L17_2 = L17_2(L18_2)
                            L16_2 = L16_2[L17_2]
                            L17_2 = tonumber
                            L18_2 = A5_2
                            L17_2 = L17_2(L18_2)
                            if nil ~= L17_2 then
                              L17_2 = tonumber
                              L18_2 = A5_2
                              L17_2 = L17_2(L18_2)
                              if L17_2 then
                                goto lbl_4409
                              end
                            end
                            L17_2 = L15_2.amount
                            ::lbl_4409::
                            L18_2 = L15_2.name
                            L19_2 = L11_2.name
                            if L18_2 ~= L19_2 then
                              L18_2 = QBCore
                              L18_2 = L18_2.Shared
                              L18_2 = L18_2.Items
                              L19_2 = L15_2.name
                              L20_2 = L19_2
                              L19_2 = L19_2.lower
                              L19_2 = L19_2(L20_2)
                              L18_2 = L18_2[L19_2]
                              L19_2 = RemoveFromDrop
                              L20_2 = A1_2
                              L21_2 = L10_2
                              L22_2 = L18_2.name
                              L23_2 = L17_2
                              L19_2(L20_2, L21_2, L22_2, L23_2)
                              L19_2 = AddToDrop
                              L20_2 = A0_2
                              L21_2 = L9_2
                              L22_2 = L18_2.name
                              L23_2 = L17_2
                              L24_2 = L15_2.info
                              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
                            end
                          end
                          L16_2 = QBCore
                          L16_2 = L16_2.Shared
                          L16_2 = L16_2.Items
                          L17_2 = L11_2.name
                          L18_2 = L17_2
                          L17_2 = L17_2.lower
                          L17_2 = L17_2(L18_2)
                          L16_2 = L16_2[L17_2]
                          L17_2 = AddToDrop
                          L18_2 = A1_2
                          L19_2 = L10_2
                          L20_2 = L16_2.name
                          L21_2 = L12_2
                          L22_2 = L11_2.info
                          L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "inventory:ClosedInv"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "inventory:ClosedInv"
function L3_1()
  local L0_2, L1_2
  L0_2 = source
  L1_2 = OpenedInventory
  L1_2[L0_2] = nil
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "inventory:server:useable"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "inventory:server:useable"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = QS
    L2_2 = L2_2.RegisterUsableItem
    L3_2 = A0_2
    L4_2 = A1_2
    L2_2(L3_2, L4_2)
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = QBCore
      L2_2 = L2_2.Functions
      L2_2 = L2_2.CreateUseableItem
      L3_2 = A0_2
      L4_2 = A1_2
      L2_2(L3_2, L4_2)
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "inventory:server:RobCash"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = Config
  L1_2 = L1_2.HandsUp
  if L1_2 then
    L1_2 = source
    L2_2 = Config
    L2_2 = L2_2.DistanceCheckEnable
    if L2_2 then
      L2_2 = GetPlayerPed
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L3_2 = GetPlayerPed
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L4_2 = GetEntityCoords
      L5_2 = L2_2
      L4_2 = L4_2(L5_2)
      L5_2 = GetEntityCoords
      L6_2 = L3_2
      L5_2 = L5_2(L6_2)
      L6_2 = L4_2 - L5_2
      L6_2 = #L6_2
      L7_2 = Config
      L7_2 = L7_2.DistanceCheckSteal
      if L6_2 > L7_2 then
        L7_2 = sendToDiscordStealLog
        L8_2 = L1_2
        L9_2 = A0_2
        L10_2 = L6_2
        L11_2 = 2
        L7_2(L8_2, L9_2, L10_2, L11_2)
        return
      end
    end
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = QBCore
      L2_2 = L2_2.Functions
      L2_2 = L2_2.GetPlayer
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      if not L2_2 or not L3_2 then
        return
      end
      L4_2 = pairs
      L5_2 = Config
      L5_2 = L5_2.ListAccountsSteal
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = L3_2.PlayerData
        L10_2 = L10_2.money
        L11_2 = L9_2.account
        L10_2 = L10_2[L11_2]
        if L10_2 then
          if L10_2 > 0 then
            L11_2 = L2_2.Functions
            L11_2 = L11_2.AddMoney
            L12_2 = L9_2.account
            L13_2 = L10_2
            L14_2 = "police-player-robbed"
            L11_2(L12_2, L13_2, L14_2)
            L11_2 = L3_2.Functions
            L11_2 = L11_2.RemoveMoney
            L12_2 = L9_2.account
            L13_2 = L10_2
            L14_2 = "police-player-robbed"
            L11_2(L12_2, L13_2, L14_2)
            L11_2 = TriggerClientEvent
            L12_2 = "qs-inventory:sendMessage"
            L13_2 = L3_2.PlayerData
            L13_2 = L13_2.source
            L14_2 = Lang
            L15_2 = "INVENTORY_TAKED_ITEM"
            L14_2 = L14_2(L15_2)
            L15_2 = Lang
            L16_2 = "CURRENCY_SYMBOL"
            L15_2 = L15_2(L16_2)
            L16_2 = L10_2
            L17_2 = " "
            L18_2 = L9_2.name
            L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
            L15_2 = "success"
            L11_2(L12_2, L13_2, L14_2, L15_2)
            L11_2 = TriggerClientEvent
            L12_2 = "qs-inventory:sendMessage"
            L13_2 = L2_2.PlayerData
            L13_2 = L13_2.source
            L14_2 = Lang
            L15_2 = "INVENTORY_RECEIVE_ITEM"
            L14_2 = L14_2(L15_2)
            L15_2 = Lang
            L16_2 = "CURRENCY_SYMBOL"
            L15_2 = L15_2(L16_2)
            L16_2 = L10_2
            L17_2 = " "
            L18_2 = L9_2.name
            L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
            L15_2 = "error"
            L11_2(L12_2, L13_2, L14_2, L15_2)
          else
            L11_2 = TriggerClientEvent
            L12_2 = "qs-inventory:sendMessage"
            L13_2 = L2_2.PlayerData
            L13_2 = L13_2.source
            L14_2 = Lang
            L15_2 = "INVENTORY_RECEIVE_ITEM"
            L14_2 = L14_2(L15_2)
            L15_2 = Lang
            L16_2 = "CURRENCY_SYMBOL"
            L15_2 = L15_2(L16_2)
            L16_2 = 0
            L17_2 = " "
            L18_2 = L9_2.name
            L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
            L15_2 = "error"
            L11_2(L12_2, L13_2, L14_2, L15_2)
          end
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = Config
L1_1 = L1_1.Framework
if "ESX" == L1_1 then
  L1_1 = ESX
  L1_1 = L1_1.RegisterServerCallback
  L2_1 = "inventory:getDead"
  function L3_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2
    if A2_2 then
      L3_2 = ESX
      L3_2 = L3_2.GetPlayerFromId
      L4_2 = A2_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L3_2 = false
        L4_2 = ESX
        L4_2 = L4_2.GetPlayerFromId
        L5_2 = A2_2
        L4_2 = L4_2(L5_2)
        L5_2 = L4_2.PlayerData
        L5_2 = L5_2.metadata
        L5_2 = L5_2.isdead
        if L5_2 then
          L3_2 = true
        else
          L5_2 = L4_2.PlayerData
          L5_2 = L5_2.metadata
          L5_2 = L5_2.inlaststand
          if L5_2 then
            L3_2 = true
          end
        end
        L5_2 = A1_2
        L6_2 = L3_2
        L5_2(L6_2)
      else
        L3_2 = A1_2
        L4_2 = false
        L3_2(L4_2)
      end
    else
      L3_2 = A1_2
      L4_2 = false
      L3_2(L4_2)
    end
  end
  L1_1(L2_1, L3_1)
else
  L1_1 = Config
  L1_1 = L1_1.Framework
  if "QBCore" == L1_1 then
    L1_1 = QBCore
    L1_1 = L1_1.Functions
    L1_1 = L1_1.CreateCallback
    L2_1 = "inventory:getDead"
    function L3_1(A0_2, A1_2, A2_2)
      local L3_2, L4_2, L5_2, L6_2
      if A2_2 then
        L3_2 = QBCore
        L3_2 = L3_2.Functions
        L3_2 = L3_2.GetPlayer
        L4_2 = A2_2
        L3_2 = L3_2(L4_2)
        if L3_2 then
          L3_2 = false
          L4_2 = QBCore
          L4_2 = L4_2.Functions
          L4_2 = L4_2.GetPlayer
          L5_2 = A2_2
          L4_2 = L4_2(L5_2)
          L5_2 = L4_2.PlayerData
          L5_2 = L5_2.metadata
          L5_2 = L5_2.isdead
          if L5_2 then
            L3_2 = true
          else
            L5_2 = L4_2.PlayerData
            L5_2 = L5_2.metadata
            L5_2 = L5_2.inlaststand
            if L5_2 then
              L3_2 = true
            end
          end
          L5_2 = A1_2
          L6_2 = L3_2
          L5_2(L6_2)
        else
          L3_2 = A1_2
          L4_2 = false
          L3_2(L4_2)
        end
      else
        L3_2 = A1_2
        L4_2 = false
        L3_2(L4_2)
      end
    end
    L1_1(L2_1, L3_1)
  end
end
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = false
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = ESX
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L4_2 = MySQL
      L4_2 = L4_2.Sync
      L4_2 = L4_2.fetchAll
      L5_2 = "SELECT * FROM  `owned_vehicles` WHERE `plate` = '"
      L6_2 = A0_2
      L7_2 = "' LIMIT 1"
      L5_2 = L5_2 .. L6_2 .. L7_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L5_2 = L4_2[1]
        if nil ~= L5_2 then
          L5_2 = L4_2[1]
          L5_2 = L5_2.owner
          L6_2 = L3_2.identifier
          if L5_2 == L6_2 then
            L2_2 = true
          else
            L2_2 = false
          end
      end
      else
        L2_2 = true
      end
      return L2_2
    else
      return L2_2
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = A1_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L4_2 = MySQL
        L4_2 = L4_2.Sync
        L4_2 = L4_2.fetchAll
        L5_2 = "SELECT * FROM  `player_vehicles` WHERE `plate` = '"
        L6_2 = A0_2
        L7_2 = "' LIMIT 1"
        L5_2 = L5_2 .. L6_2 .. L7_2
        L4_2 = L4_2(L5_2)
        if L4_2 then
          L5_2 = L4_2[1]
          if nil ~= L5_2 then
            L5_2 = L4_2[1]
            L5_2 = L5_2.citizenid
            L6_2 = L3_2.PlayerData
            L6_2 = L6_2.citizenid
            if L5_2 == L6_2 then
              L2_2 = true
            else
              L2_2 = false
            end
        end
        else
          L2_2 = true
        end
        return L2_2
      else
        return L2_2
      end
    end
  end
end
IsVehicleOwnedAbleToOpen = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = {}
  if nil ~= A1_2 then
    L3_2 = next
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if nil ~= L3_2 then
      L3_2 = pairs
      L4_2 = A1_2
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
        L9_2 = Config
        L9_2 = L9_2.Framework
        if "ESX" == L9_2 then
          L9_2 = QS
          L9_2 = L9_2.Shared
          L9_2 = L9_2.Items
          L10_2 = L8_2.name
          L11_2 = L10_2
          L10_2 = L10_2.lower
          L10_2 = L10_2(L11_2)
          L9_2 = L9_2[L10_2]
          if nil ~= L9_2 then
            L10_2 = L8_2.slot
            L11_2 = {}
            L12_2 = L9_2.name
            L11_2.name = L12_2
            L12_2 = tonumber
            L13_2 = L8_2.amount
            L12_2 = L12_2(L13_2)
            L11_2.amount = L12_2
            L12_2 = L8_2.info
            if nil ~= L12_2 then
              L12_2 = L8_2.info
              if L12_2 then
                goto lbl_43
              end
            end
            L12_2 = ""
            ::lbl_43::
            L11_2.info = L12_2
            L12_2 = L9_2.label
            L11_2.label = L12_2
            L12_2 = L9_2.description
            if nil ~= L12_2 then
              L12_2 = L9_2.description
              if L12_2 then
                goto lbl_53
              end
            end
            L12_2 = ""
            ::lbl_53::
            L11_2.description = L12_2
            L12_2 = L9_2.weight
            L11_2.weight = L12_2
            L12_2 = L9_2.type
            L11_2.type = L12_2
            L12_2 = L9_2.unique
            L11_2.unique = L12_2
            L12_2 = L9_2.useable
            L11_2.useable = L12_2
            L12_2 = L8_2.price
            L11_2.price = L12_2
            L12_2 = L8_2.info
            if L12_2 then
              L12_2 = L8_2.info
              L12_2 = L12_2.image
              if L12_2 then
                L12_2 = L8_2.info
                L12_2 = L12_2.image
                L13_2 = ".png"
                L12_2 = L12_2 .. L13_2
                if L12_2 then
                  goto lbl_78
                end
              end
            end
            L12_2 = L9_2.image
            ::lbl_78::
            L11_2.image = L12_2
            L12_2 = L8_2.slot
            L11_2.slot = L12_2
            L2_2[L10_2] = L11_2
          else
            L10_2 = ShowConsoleError
            L11_2 = "^0Error in Information of config from Shops or Vending Item."
            L10_2(L11_2)
            L10_2 = nil
            return L10_2
          end
        else
          L9_2 = Config
          L9_2 = L9_2.Framework
          if "QBCore" == L9_2 then
            L9_2 = QBCore
            L9_2 = L9_2.Shared
            L9_2 = L9_2.Items
            L10_2 = L8_2.name
            L11_2 = L10_2
            L10_2 = L10_2.lower
            L10_2 = L10_2(L11_2)
            L9_2 = L9_2[L10_2]
            if nil ~= L9_2 then
              L10_2 = L8_2.slot
              L11_2 = {}
              L12_2 = L9_2.name
              L11_2.name = L12_2
              L12_2 = tonumber
              L13_2 = L8_2.amount
              L12_2 = L12_2(L13_2)
              L11_2.amount = L12_2
              L12_2 = L8_2.info
              if nil ~= L12_2 then
                L12_2 = L8_2.info
                if L12_2 then
                  goto lbl_118
                end
              end
              L12_2 = ""
              ::lbl_118::
              L11_2.info = L12_2
              L12_2 = L9_2.label
              L11_2.label = L12_2
              L12_2 = L9_2.description
              if nil ~= L12_2 then
                L12_2 = L9_2.description
                if L12_2 then
                  goto lbl_128
                end
              end
              L12_2 = ""
              ::lbl_128::
              L11_2.description = L12_2
              L12_2 = L9_2.weight
              L11_2.weight = L12_2
              L12_2 = L9_2.type
              L11_2.type = L12_2
              L12_2 = L9_2.unique
              L11_2.unique = L12_2
              L12_2 = L9_2.useable
              L11_2.useable = L12_2
              L12_2 = L8_2.price
              L11_2.price = L12_2
              L12_2 = L8_2.info
              if L12_2 then
                L12_2 = L8_2.info
                L12_2 = L12_2.image
                if L12_2 then
                  L12_2 = L8_2.info
                  L12_2 = L12_2.image
                  L13_2 = ".png"
                  L12_2 = L12_2 .. L13_2
                  if L12_2 then
                    goto lbl_153
                  end
                end
              end
              L12_2 = L9_2.image
              ::lbl_153::
              L11_2.image = L12_2
              L12_2 = L8_2.slot
              L11_2.slot = L12_2
              L2_2[L10_2] = L11_2
            else
              L10_2 = ShowConsoleError
              L11_2 = "^0Error in Information of config from Shops or Vending Item."
              L10_2(L11_2)
              L10_2 = nil
              return L10_2
            end
          end
        end
      end
    end
  end
  return L2_2
end
SetupShopItems = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if nil ~= A1_2 then
    L2_2 = next
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if nil ~= L2_2 then
      L2_2 = pairs
      L3_2 = A1_2
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = Config
        L8_2 = L8_2.Framework
        if "ESX" == L8_2 then
          L8_2 = QS
          L8_2 = L8_2.Shared
          L8_2 = L8_2.Items
          L9_2 = L7_2.name
          L10_2 = L9_2
          L9_2 = L9_2.lower
          L9_2 = L9_2(L10_2)
          L8_2 = L8_2[L9_2]
          if nil ~= L8_2 then
            L9_2 = L7_2.slot
            L10_2 = {}
            L11_2 = L8_2.name
            L10_2.name = L11_2
            L11_2 = tonumber
            L12_2 = L7_2.amount
            L11_2 = L11_2(L12_2)
            L10_2.amount = L11_2
            L11_2 = L7_2.info
            if nil ~= L11_2 then
              L11_2 = L7_2.info
              if L11_2 then
                goto lbl_41
              end
            end
            L11_2 = ""
            ::lbl_41::
            L10_2.info = L11_2
            L11_2 = L8_2.label
            L10_2.label = L11_2
            L11_2 = L8_2.description
            if nil ~= L11_2 then
              L11_2 = L8_2.description
              if L11_2 then
                goto lbl_51
              end
            end
            L11_2 = ""
            ::lbl_51::
            L10_2.description = L11_2
            L11_2 = L8_2.weight
            L10_2.weight = L11_2
            L11_2 = L8_2.type
            L10_2.type = L11_2
            L11_2 = L8_2.unique
            L10_2.unique = L11_2
            L11_2 = L8_2.useable
            L10_2.useable = L11_2
            L11_2 = L7_2.info
            if L11_2 then
              L11_2 = L7_2.info
              L11_2 = L11_2.image
              if L11_2 then
                L11_2 = L7_2.info
                L11_2 = L11_2.image
                L12_2 = ".png"
                L11_2 = L11_2 .. L12_2
                if L11_2 then
                  goto lbl_74
                end
              end
            end
            L11_2 = L8_2.image
            ::lbl_74::
            L10_2.image = L11_2
            L11_2 = L7_2.slot
            L10_2.slot = L11_2
            A1_2[L9_2] = L10_2
          else
            L9_2 = ShowConsoleError
            L10_2 = "^0Error in Information in Garbage Items."
            L9_2(L10_2)
            L9_2 = nil
            return L9_2
          end
        else
          L8_2 = Config
          L8_2 = L8_2.Framework
          if "QBCore" == L8_2 then
            L8_2 = QBCore
            L8_2 = L8_2.Shared
            L8_2 = L8_2.Items
            L9_2 = L7_2.name
            L10_2 = L9_2
            L9_2 = L9_2.lower
            L9_2 = L9_2(L10_2)
            L8_2 = L8_2[L9_2]
            if nil ~= L8_2 then
              L9_2 = L7_2.slot
              L10_2 = {}
              L11_2 = L8_2.name
              L10_2.name = L11_2
              L11_2 = tonumber
              L12_2 = L7_2.amount
              L11_2 = L11_2(L12_2)
              L10_2.amount = L11_2
              L11_2 = L7_2.info
              if nil ~= L11_2 then
                L11_2 = L7_2.info
                if L11_2 then
                  goto lbl_114
                end
              end
              L11_2 = ""
              ::lbl_114::
              L10_2.info = L11_2
              L11_2 = L8_2.label
              L10_2.label = L11_2
              L11_2 = L8_2.description
              if nil ~= L11_2 then
                L11_2 = L8_2.description
                if L11_2 then
                  goto lbl_124
                end
              end
              L11_2 = ""
              ::lbl_124::
              L10_2.description = L11_2
              L11_2 = L8_2.weight
              L10_2.weight = L11_2
              L11_2 = L8_2.type
              L10_2.type = L11_2
              L11_2 = L8_2.unique
              L10_2.unique = L11_2
              L11_2 = L8_2.useable
              L10_2.useable = L11_2
              L11_2 = L7_2.info
              if L11_2 then
                L11_2 = L7_2.info
                L11_2 = L11_2.image
                if L11_2 then
                  L11_2 = L7_2.info
                  L11_2 = L11_2.image
                  L12_2 = ".png"
                  L11_2 = L11_2 .. L12_2
                  if L11_2 then
                    goto lbl_147
                  end
                end
              end
              L11_2 = L8_2.image
              ::lbl_147::
              L10_2.image = L11_2
              L11_2 = L7_2.slot
              L10_2.slot = L11_2
              A1_2[L9_2] = L10_2
            else
              L9_2 = ShowConsoleError
              L10_2 = "^0Error in Information in Garbage Items."
              L9_2(L10_2)
              L9_2 = nil
              return L9_2
            end
          end
        end
      end
    end
  end
  return A1_2
end
SetupGarbageItems = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = {}
  L2_2 = MySQL
  L2_2 = L2_2.Sync
  L2_2 = L2_2.fetchAll
  L3_2 = "SELECT * FROM qs_stash WHERE stash = ?"
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    if not L2_2 then
      goto lbl_221
    end
    L3_2 = L2_2[1]
    if nil == L3_2 then
      goto lbl_221
    end
    L3_2 = L2_2[1]
    L3_2 = L3_2.items
    if nil == L3_2 then
      goto lbl_221
    end
    L3_2 = L2_2[1]
    L4_2 = json
    L4_2 = L4_2.decode
    L5_2 = L2_2[1]
    L5_2 = L5_2.items
    L4_2 = L4_2(L5_2)
    L3_2.items = L4_2
    L3_2 = L2_2[1]
    L3_2 = L3_2.items
    if nil == L3_2 then
      goto lbl_221
    end
    L3_2 = pairs
    L4_2 = L2_2[1]
    L4_2 = L4_2.items
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = QS
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L10_2 = L8_2.name
      L11_2 = L10_2
      L10_2 = L10_2.lower
      L10_2 = L10_2(L11_2)
      L9_2 = L9_2[L10_2]
      if nil ~= L9_2 then
        L10_2 = L8_2.slot
        L11_2 = {}
        L12_2 = L9_2.name
        L11_2.name = L12_2
        L12_2 = tonumber
        L13_2 = L8_2.amount
        L12_2 = L12_2(L13_2)
        L11_2.amount = L12_2
        L12_2 = L8_2.info
        if nil ~= L12_2 then
          L12_2 = L8_2.info
          if L12_2 then
            goto lbl_66
          end
        end
        L12_2 = ""
        ::lbl_66::
        L11_2.info = L12_2
        L12_2 = L9_2.label
        L11_2.label = L12_2
        L12_2 = L9_2.description
        if nil ~= L12_2 then
          L12_2 = L9_2.description
          if L12_2 then
            goto lbl_76
          end
        end
        L12_2 = ""
        ::lbl_76::
        L11_2.description = L12_2
        L12_2 = L9_2.weight
        L11_2.weight = L12_2
        L12_2 = L9_2.type
        L11_2.type = L12_2
        L12_2 = L9_2.unique
        L11_2.unique = L12_2
        L12_2 = L9_2.useable
        L11_2.useable = L12_2
        L12_2 = L8_2.info
        if L12_2 then
          L12_2 = L8_2.info
          L12_2 = L12_2.image
          if L12_2 then
            L12_2 = L8_2.info
            L12_2 = L12_2.image
            L13_2 = ".png"
            L12_2 = L12_2 .. L13_2
            if L12_2 then
              goto lbl_99
            end
          end
        end
        L12_2 = L9_2.image
        ::lbl_99::
        L11_2.image = L12_2
        L12_2 = L8_2.slot
        L11_2.slot = L12_2
        L1_2[L10_2] = L11_2
      else
        L10_2 = ShowConsoleError
        L11_2 = "^0Error in Information in Stash Items. Item probably missing in qs-core/shared.lua: "
        L12_2 = L8_2.name
        L13_2 = " StashId: "
        L14_2 = A0_2
        L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
        L10_2(L11_2)
        L1_2 = "Invalid"
        break
      end
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 and L2_2 then
      L3_2 = L2_2[1]
      if nil ~= L3_2 then
        L3_2 = L2_2[1]
        L3_2 = L3_2.items
        if nil ~= L3_2 then
          L3_2 = L2_2[1]
          L4_2 = json
          L4_2 = L4_2.decode
          L5_2 = L2_2[1]
          L5_2 = L5_2.items
          L4_2 = L4_2(L5_2)
          L3_2.items = L4_2
          L3_2 = L2_2[1]
          L3_2 = L3_2.items
          if nil ~= L3_2 then
            L3_2 = pairs
            L4_2 = L2_2[1]
            L4_2 = L4_2.items
            L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
            for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
              L9_2 = QBCore
              L9_2 = L9_2.Shared
              L9_2 = L9_2.Items
              L10_2 = L8_2.name
              L11_2 = L10_2
              L10_2 = L10_2.lower
              L10_2 = L10_2(L11_2)
              L9_2 = L9_2[L10_2]
              if nil ~= L9_2 then
                L10_2 = L8_2.slot
                L11_2 = {}
                L12_2 = L9_2.name
                L11_2.name = L12_2
                L12_2 = tonumber
                L13_2 = L8_2.amount
                L12_2 = L12_2(L13_2)
                L11_2.amount = L12_2
                L12_2 = L8_2.info
                if nil ~= L12_2 then
                  L12_2 = L8_2.info
                  if L12_2 then
                    goto lbl_171
                  end
                end
                L12_2 = ""
                ::lbl_171::
                L11_2.info = L12_2
                L12_2 = L9_2.label
                L11_2.label = L12_2
                L12_2 = L9_2.description
                if nil ~= L12_2 then
                  L12_2 = L9_2.description
                  if L12_2 then
                    goto lbl_181
                  end
                end
                L12_2 = ""
                ::lbl_181::
                L11_2.description = L12_2
                L12_2 = L9_2.weight
                L11_2.weight = L12_2
                L12_2 = L9_2.type
                L11_2.type = L12_2
                L12_2 = L9_2.unique
                L11_2.unique = L12_2
                L12_2 = L9_2.useable
                L11_2.useable = L12_2
                L12_2 = L8_2.info
                if L12_2 then
                  L12_2 = L8_2.info
                  L12_2 = L12_2.image
                  if L12_2 then
                    L12_2 = L8_2.info
                    L12_2 = L12_2.image
                    L13_2 = ".png"
                    L12_2 = L12_2 .. L13_2
                    if L12_2 then
                      goto lbl_204
                    end
                  end
                end
                L12_2 = L9_2.image
                ::lbl_204::
                L11_2.image = L12_2
                L12_2 = L8_2.slot
                L11_2.slot = L12_2
                L1_2[L10_2] = L11_2
              else
                L10_2 = ShowConsoleError
                L11_2 = "^0Error in Information in Stash Items. Item probably missing in qs-core/shared.lua: "
                L12_2 = L8_2.name
                L13_2 = " StashId: "
                L14_2 = A0_2
                L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
                L10_2(L11_2)
                L1_2 = "Invalid"
                break
              end
            end
          end
        end
      end
    end
  end
  ::lbl_221::
  return L1_2
end
GetStashItems = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Stashes
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.label
  if "Stash-None" ~= L2_2 and nil ~= A1_2 then
    L2_2 = pairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L7_2.description = nil
    end
    L2_2 = MySQL
    L2_2 = L2_2.Async
    L2_2 = L2_2.fetchAll
    L3_2 = "SELECT * FROM `qs_stash` WHERE `stash` = '"
    L4_2 = A0_2
    L5_2 = "'"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = {}
    function L5_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      if A0_3 then
        L1_3 = A0_3[1]
        if nil ~= L1_3 then
          L1_3 = MySQL
          L1_3 = L1_3.Async
          L1_3 = L1_3.execute
          L2_3 = "UPDATE `qs_stash` SET `items` = '"
          L3_3 = EscapeSqli
          L4_3 = json
          L4_3 = L4_3.encode
          L5_3 = A1_2
          L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
          L4_3 = "' WHERE `stash` = '"
          L5_3 = A0_2
          L6_3 = "'"
          L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
          L3_3 = {}
          function L4_3(A0_4)
            local L1_4, L2_4
            L1_4 = Stashes
            L2_4 = A0_2
            L1_4 = L1_4[L2_4]
            L1_4.isOpen = false
          end
          L1_3(L2_3, L3_3, L4_3)
      end
      else
        L1_3 = MySQL
        L1_3 = L1_3.Async
        L1_3 = L1_3.insert
        L2_3 = "INSERT INTO `qs_stash` (`stash`, `items`) VALUES ('"
        L3_3 = A0_2
        L4_3 = "', '"
        L5_3 = EscapeSqli
        L6_3 = json
        L6_3 = L6_3.encode
        L7_3 = A1_2
        L6_3, L7_3 = L6_3(L7_3)
        L5_3 = L5_3(L6_3, L7_3)
        L6_3 = "')"
        L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
        L3_3 = {}
        function L4_3(A0_4)
          local L1_4, L2_4
          L1_4 = Stashes
          L2_4 = A0_2
          L1_4 = L1_4[L2_4]
          L1_4.isOpen = false
        end
        L1_3(L2_3, L3_3, L4_3)
      end
    end
    L2_2(L3_2, L4_2, L5_2)
  end
end
SaveStashItems = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L6_2 = Config
  L6_2 = L6_2.Framework
  if "ESX" == L6_2 then
    L6_2 = tonumber
    L7_2 = A4_2
    L6_2 = L6_2(L7_2)
    L7_2 = QS
    L7_2 = L7_2.Shared
    L7_2 = L7_2.Items
    L7_2 = L7_2[A3_2]
    L8_2 = GetInventoryTotalWeight
    L9_2 = A0_2
    L10_2 = "stash"
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = QS
    L9_2 = L9_2.Shared
    L9_2 = L9_2.Items
    L11_2 = A3_2
    L10_2 = A3_2.lower
    L10_2 = L10_2(L11_2)
    L9_2 = L9_2[L10_2]
    L9_2 = L9_2.weight
    L9_2 = L9_2 * L6_2
    L10_2 = L9_2 + L8_2
    L11_2 = Stashes
    L11_2 = L11_2[A0_2]
    L11_2 = L11_2.maxweight
    if L10_2 <= L11_2 then
      L10_2 = L7_2.unique
      if not L10_2 then
        L10_2 = Stashes
        L10_2 = L10_2[A0_2]
        L10_2 = L10_2.items
        L10_2 = L10_2[A1_2]
        if nil ~= L10_2 then
          L10_2 = Stashes
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          L10_2 = L10_2.name
          if L10_2 == A3_2 then
            L10_2 = Stashes
            L10_2 = L10_2[A0_2]
            L10_2 = L10_2.items
            L10_2 = L10_2[A1_2]
            L11_2 = Stashes
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L11_2 = L11_2[A1_2]
            L11_2 = L11_2.amount
            L11_2 = L11_2 + L6_2
            L10_2.amount = L11_2
        end
        else
          L10_2 = QS
          L10_2 = L10_2.Shared
          L10_2 = L10_2.Items
          L12_2 = A3_2
          L11_2 = A3_2.lower
          L11_2 = L11_2(L12_2)
          L10_2 = L10_2[L11_2]
          L11_2 = Stashes
          L11_2 = L11_2[A0_2]
          L11_2 = L11_2.items
          L12_2 = {}
          L13_2 = L10_2.name
          L12_2.name = L13_2
          L12_2.amount = L6_2
          L13_2 = A5_2 or L13_2
          if nil == A5_2 or not A5_2 then
            L13_2 = ""
          end
          L12_2.info = L13_2
          L13_2 = L10_2.label
          L12_2.label = L13_2
          L13_2 = L10_2.description
          if nil ~= L13_2 then
            L13_2 = L10_2.description
            if L13_2 then
              goto lbl_90
            end
          end
          L13_2 = ""
          ::lbl_90::
          L12_2.description = L13_2
          L13_2 = L10_2.weight
          L12_2.weight = L13_2
          L13_2 = L10_2.type
          L12_2.type = L13_2
          L13_2 = L10_2.unique
          L12_2.unique = L13_2
          L13_2 = L10_2.useable
          L12_2.useable = L13_2
          if A5_2 then
            L13_2 = A5_2.image
            if L13_2 then
              L13_2 = A5_2.image
              L14_2 = ".png"
              L13_2 = L13_2 .. L14_2
              if L13_2 then
                goto lbl_110
              end
            end
          end
          L13_2 = L10_2.image
          ::lbl_110::
          L12_2.image = L13_2
          L12_2.slot = A1_2
          L11_2[A1_2] = L12_2
        end
      else
        L10_2 = Stashes
        L10_2 = L10_2[A0_2]
        L10_2 = L10_2.items
        L10_2 = L10_2[A1_2]
        if nil ~= L10_2 then
          L10_2 = Stashes
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          L10_2 = L10_2.name
          if L10_2 == A3_2 then
            L10_2 = QS
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L12_2 = A3_2
            L11_2 = A3_2.lower
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2[L11_2]
            L11_2 = Stashes
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L12_2 = {}
            L13_2 = L10_2.name
            L12_2.name = L13_2
            L12_2.amount = L6_2
            L13_2 = A5_2 or L13_2
            if nil == A5_2 or not A5_2 then
              L13_2 = ""
            end
            L12_2.info = L13_2
            L13_2 = L10_2.label
            L12_2.label = L13_2
            L13_2 = L10_2.description
            if nil ~= L13_2 then
              L13_2 = L10_2.description
              if L13_2 then
                goto lbl_156
              end
            end
            L13_2 = ""
            ::lbl_156::
            L12_2.description = L13_2
            L13_2 = L10_2.weight
            L12_2.weight = L13_2
            L13_2 = L10_2.type
            L12_2.type = L13_2
            L13_2 = L10_2.unique
            L12_2.unique = L13_2
            L13_2 = L10_2.useable
            L12_2.useable = L13_2
            if A5_2 then
              L13_2 = A5_2.image
              if L13_2 then
                L13_2 = A5_2.image
                L14_2 = ".png"
                L13_2 = L13_2 .. L14_2
                if L13_2 then
                  goto lbl_176
                end
              end
            end
            L13_2 = L10_2.image
            ::lbl_176::
            L12_2.image = L13_2
            L12_2.slot = A2_2
            L11_2[A2_2] = L12_2
        end
        else
          L10_2 = QS
          L10_2 = L10_2.Shared
          L10_2 = L10_2.Items
          L12_2 = A3_2
          L11_2 = A3_2.lower
          L11_2 = L11_2(L12_2)
          L10_2 = L10_2[L11_2]
          L11_2 = Stashes
          L11_2 = L11_2[A0_2]
          L11_2 = L11_2.items
          L12_2 = {}
          L13_2 = L10_2.name
          L12_2.name = L13_2
          L12_2.amount = L6_2
          L13_2 = A5_2 or L13_2
          if nil == A5_2 or not A5_2 then
            L13_2 = ""
          end
          L12_2.info = L13_2
          L13_2 = L10_2.label
          L12_2.label = L13_2
          L13_2 = L10_2.description
          if nil ~= L13_2 then
            L13_2 = L10_2.description
            if L13_2 then
              goto lbl_209
            end
          end
          L13_2 = ""
          ::lbl_209::
          L12_2.description = L13_2
          L13_2 = L10_2.weight
          L12_2.weight = L13_2
          L13_2 = L10_2.type
          L12_2.type = L13_2
          L13_2 = L10_2.unique
          L12_2.unique = L13_2
          L13_2 = L10_2.useable
          L12_2.useable = L13_2
          if A5_2 then
            L13_2 = A5_2.image
            if L13_2 then
              L13_2 = A5_2.image
              L14_2 = ".png"
              L13_2 = L13_2 .. L14_2
              if L13_2 then
                goto lbl_229
              end
            end
          end
          L13_2 = L10_2.image
          ::lbl_229::
          L12_2.image = L13_2
          L12_2.slot = A1_2
          L11_2[A1_2] = L12_2
        end
      end
      L10_2 = true
      return L10_2
    else
      L10_2 = false
      return L10_2
    end
  else
    L6_2 = Config
    L6_2 = L6_2.Framework
    if "QBCore" == L6_2 then
      L6_2 = tonumber
      L7_2 = A4_2
      L6_2 = L6_2(L7_2)
      L7_2 = QBCore
      L7_2 = L7_2.Shared
      L7_2 = L7_2.Items
      L7_2 = L7_2[A3_2]
      L8_2 = GetInventoryTotalWeight
      L9_2 = A0_2
      L10_2 = "stash"
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = QBCore
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L11_2 = A3_2
      L10_2 = A3_2.lower
      L10_2 = L10_2(L11_2)
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.weight
      L9_2 = L9_2 * L6_2
      L10_2 = L9_2 + L8_2
      L11_2 = Stashes
      L11_2 = L11_2[A0_2]
      L11_2 = L11_2.maxweight
      if L10_2 <= L11_2 then
        L10_2 = L7_2.unique
        if not L10_2 then
          L10_2 = Stashes
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          if nil ~= L10_2 then
            L10_2 = Stashes
            L10_2 = L10_2[A0_2]
            L10_2 = L10_2.items
            L10_2 = L10_2[A1_2]
            L10_2 = L10_2.name
            if L10_2 == A3_2 then
              L10_2 = Stashes
              L10_2 = L10_2[A0_2]
              L10_2 = L10_2.items
              L10_2 = L10_2[A1_2]
              L11_2 = Stashes
              L11_2 = L11_2[A0_2]
              L11_2 = L11_2.items
              L11_2 = L11_2[A1_2]
              L11_2 = L11_2.amount
              L11_2 = L11_2 + L6_2
              L10_2.amount = L11_2
          end
          else
            L10_2 = QBCore
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L12_2 = A3_2
            L11_2 = A3_2.lower
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2[L11_2]
            L11_2 = Stashes
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L12_2 = {}
            L13_2 = L10_2.name
            L12_2.name = L13_2
            L12_2.amount = L6_2
            L13_2 = A5_2 or L13_2
            if nil == A5_2 or not A5_2 then
              L13_2 = ""
            end
            L12_2.info = L13_2
            L13_2 = L10_2.label
            L12_2.label = L13_2
            L13_2 = L10_2.description
            if nil ~= L13_2 then
              L13_2 = L10_2.description
              if L13_2 then
                goto lbl_327
              end
            end
            L13_2 = ""
            ::lbl_327::
            L12_2.description = L13_2
            L13_2 = L10_2.weight
            L12_2.weight = L13_2
            L13_2 = L10_2.type
            L12_2.type = L13_2
            L13_2 = L10_2.unique
            L12_2.unique = L13_2
            L13_2 = L10_2.useable
            L12_2.useable = L13_2
            if A5_2 then
              L13_2 = A5_2.image
              if L13_2 then
                L13_2 = A5_2.image
                L14_2 = ".png"
                L13_2 = L13_2 .. L14_2
                if L13_2 then
                  goto lbl_347
                end
              end
            end
            L13_2 = L10_2.image
            ::lbl_347::
            L12_2.image = L13_2
            L12_2.slot = A1_2
            L11_2[A1_2] = L12_2
          end
        else
          L10_2 = Stashes
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          if nil ~= L10_2 then
            L10_2 = Stashes
            L10_2 = L10_2[A0_2]
            L10_2 = L10_2.items
            L10_2 = L10_2[A1_2]
            L10_2 = L10_2.name
            if L10_2 == A3_2 then
              L10_2 = QBCore
              L10_2 = L10_2.Shared
              L10_2 = L10_2.Items
              L12_2 = A3_2
              L11_2 = A3_2.lower
              L11_2 = L11_2(L12_2)
              L10_2 = L10_2[L11_2]
              L11_2 = Stashes
              L11_2 = L11_2[A0_2]
              L11_2 = L11_2.items
              L12_2 = {}
              L13_2 = L10_2.name
              L12_2.name = L13_2
              L12_2.amount = L6_2
              L13_2 = A5_2 or L13_2
              if nil == A5_2 or not A5_2 then
                L13_2 = ""
              end
              L12_2.info = L13_2
              L13_2 = L10_2.label
              L12_2.label = L13_2
              L13_2 = L10_2.description
              if nil ~= L13_2 then
                L13_2 = L10_2.description
                if L13_2 then
                  goto lbl_393
                end
              end
              L13_2 = ""
              ::lbl_393::
              L12_2.description = L13_2
              L13_2 = L10_2.weight
              L12_2.weight = L13_2
              L13_2 = L10_2.type
              L12_2.type = L13_2
              L13_2 = L10_2.unique
              L12_2.unique = L13_2
              L13_2 = L10_2.useable
              L12_2.useable = L13_2
              if A5_2 then
                L13_2 = A5_2.image
                if L13_2 then
                  L13_2 = A5_2.image
                  L14_2 = ".png"
                  L13_2 = L13_2 .. L14_2
                  if L13_2 then
                    goto lbl_413
                  end
                end
              end
              L13_2 = L10_2.image
              ::lbl_413::
              L12_2.image = L13_2
              L12_2.slot = A2_2
              L11_2[A2_2] = L12_2
          end
          else
            L10_2 = QBCore
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L12_2 = A3_2
            L11_2 = A3_2.lower
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2[L11_2]
            L11_2 = Stashes
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L12_2 = {}
            L13_2 = L10_2.name
            L12_2.name = L13_2
            L12_2.amount = L6_2
            L13_2 = A5_2 or L13_2
            if nil == A5_2 or not A5_2 then
              L13_2 = ""
            end
            L12_2.info = L13_2
            L13_2 = L10_2.label
            L12_2.label = L13_2
            L13_2 = L10_2.description
            if nil ~= L13_2 then
              L13_2 = L10_2.description
              if L13_2 then
                goto lbl_446
              end
            end
            L13_2 = ""
            ::lbl_446::
            L12_2.description = L13_2
            L13_2 = L10_2.weight
            L12_2.weight = L13_2
            L13_2 = L10_2.type
            L12_2.type = L13_2
            L13_2 = L10_2.unique
            L12_2.unique = L13_2
            L13_2 = L10_2.useable
            L12_2.useable = L13_2
            if A5_2 then
              L13_2 = A5_2.image
              if L13_2 then
                L13_2 = A5_2.image
                L14_2 = ".png"
                L13_2 = L13_2 .. L14_2
                if L13_2 then
                  goto lbl_466
                end
              end
            end
            L13_2 = L10_2.image
            ::lbl_466::
            L12_2.image = L13_2
            L12_2.slot = A1_2
            L11_2[A1_2] = L12_2
          end
        end
        L10_2 = true
        return L10_2
      end
    end
  end
end
AddToStash = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = tonumber
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  L5_2 = Stashes
  L5_2 = L5_2[A0_2]
  L5_2 = L5_2.items
  L5_2 = L5_2[A1_2]
  if nil ~= L5_2 then
    L5_2 = Stashes
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.items
    L5_2 = L5_2[A1_2]
    L5_2 = L5_2.name
    if L5_2 == A2_2 then
      L5_2 = Stashes
      L5_2 = L5_2[A0_2]
      L5_2 = L5_2.items
      L5_2 = L5_2[A1_2]
      L5_2 = L5_2.amount
      if L4_2 < L5_2 then
        L5_2 = Stashes
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L5_2 = L5_2[A1_2]
        L6_2 = Stashes
        L6_2 = L6_2[A0_2]
        L6_2 = L6_2.items
        L6_2 = L6_2[A1_2]
        L6_2 = L6_2.amount
        L6_2 = L6_2 - L4_2
        L5_2.amount = L6_2
      else
        L5_2 = Stashes
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L5_2[A1_2] = nil
        L5_2 = next
        L6_2 = Stashes
        L6_2 = L6_2[A0_2]
        L6_2 = L6_2.items
        L5_2 = L5_2(L6_2)
        if nil == L5_2 then
          L5_2 = Stashes
          L5_2 = L5_2[A0_2]
          L6_2 = {}
          L5_2.items = L6_2
        end
      end
  end
  else
    L5_2 = Stashes
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.items
    L5_2[A1_2] = nil
    L5_2 = Stashes
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.items
    if nil == L5_2 then
      L5_2 = Stashes
      L5_2 = L5_2[A0_2]
      L5_2 = L5_2.items
      L5_2[A1_2] = nil
    end
  end
end
RemoveFromStash = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = tonumber
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GarbageItems
  L5_2 = L5_2[A0_2]
  L5_2 = L5_2.items
  L5_2 = L5_2[A1_2]
  if nil ~= L5_2 then
    L5_2 = GarbageItems
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.items
    L5_2 = L5_2[A1_2]
    L5_2 = L5_2.name
    if L5_2 == A2_2 then
      L5_2 = GarbageItems
      L5_2 = L5_2[A0_2]
      L5_2 = L5_2.items
      L5_2 = L5_2[A1_2]
      L5_2 = L5_2.amount
      if L4_2 < L5_2 then
        L5_2 = GarbageItems
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L5_2 = L5_2[A1_2]
        L6_2 = GarbageItems
        L6_2 = L6_2[A0_2]
        L6_2 = L6_2.items
        L6_2 = L6_2[A1_2]
        L6_2 = L6_2.amount
        L6_2 = L6_2 - L4_2
        L5_2.amount = L6_2
      else
        L5_2 = GarbageItems
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L5_2[A1_2] = nil
        L5_2 = next
        L6_2 = GarbageItems
        L6_2 = L6_2[A0_2]
        L6_2 = L6_2.items
        L5_2 = L5_2(L6_2)
        if nil == L5_2 then
          L5_2 = GarbageItems
          L5_2 = L5_2[A0_2]
          L6_2 = {}
          L5_2.items = L6_2
        end
      end
  end
  else
    L5_2 = GarbageItems
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.items
    L5_2[A1_2] = nil
    L5_2 = GarbageItems
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.items
    if nil == L5_2 then
      L5_2 = GarbageItems
      L5_2 = L5_2[A0_2]
      L5_2 = L5_2.items
      L5_2[A1_2] = nil
    end
  end
end
RemoveFromGarbage = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = {}
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = MySQL
    L2_2 = L2_2.Sync
    L2_2 = L2_2.fetchAll
    L3_2 = "SELECT * FROM `qs_trunk` WHERE `plate` = '"
    L4_2 = A0_2
    L5_2 = "'"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      goto lbl_228
    end
    L3_2 = L2_2[1]
    if nil == L3_2 then
      goto lbl_228
    end
    L3_2 = L2_2[1]
    L3_2 = L3_2.items
    if nil == L3_2 then
      goto lbl_228
    end
    L3_2 = L2_2[1]
    L4_2 = json
    L4_2 = L4_2.decode
    L5_2 = L2_2[1]
    L5_2 = L5_2.items
    L4_2 = L4_2(L5_2)
    L3_2.items = L4_2
    L3_2 = L2_2[1]
    L3_2 = L3_2.items
    if nil == L3_2 then
      goto lbl_228
    end
    L3_2 = pairs
    L4_2 = L2_2[1]
    L4_2 = L4_2.items
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = QS
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L10_2 = L8_2.name
      L11_2 = L10_2
      L10_2 = L10_2.lower
      L10_2 = L10_2(L11_2)
      L9_2 = L9_2[L10_2]
      if nil ~= L9_2 then
        L10_2 = L8_2.slot
        L11_2 = {}
        L12_2 = L9_2.name
        L11_2.name = L12_2
        L12_2 = tonumber
        L13_2 = L8_2.amount
        L12_2 = L12_2(L13_2)
        L11_2.amount = L12_2
        L12_2 = L8_2.info
        if nil ~= L12_2 then
          L12_2 = L8_2.info
          if L12_2 then
            goto lbl_65
          end
        end
        L12_2 = ""
        ::lbl_65::
        L11_2.info = L12_2
        L12_2 = L9_2.label
        L11_2.label = L12_2
        L12_2 = L9_2.description
        if nil ~= L12_2 then
          L12_2 = L9_2.description
          if L12_2 then
            goto lbl_75
          end
        end
        L12_2 = ""
        ::lbl_75::
        L11_2.description = L12_2
        L12_2 = L9_2.weight
        L11_2.weight = L12_2
        L12_2 = L9_2.type
        L11_2.type = L12_2
        L12_2 = L9_2.unique
        L11_2.unique = L12_2
        L12_2 = L9_2.useable
        L11_2.useable = L12_2
        L12_2 = L8_2.info
        if L12_2 then
          L12_2 = L8_2.info
          L12_2 = L12_2.image
          if L12_2 then
            L12_2 = L8_2.info
            L12_2 = L12_2.image
            L13_2 = ".png"
            L12_2 = L12_2 .. L13_2
            if L12_2 then
              goto lbl_98
            end
          end
        end
        L12_2 = L9_2.image
        ::lbl_98::
        L11_2.image = L12_2
        L12_2 = L8_2.slot
        L11_2.slot = L12_2
        L1_2[L10_2] = L11_2
      else
        L10_2 = ShowConsoleError
        L11_2 = "^0Error in Information in Trunk Items. Item probably missing in qs-core/shared.lua: "
        L12_2 = L8_2.name
        L13_2 = " Plate: "
        L14_2 = A0_2
        L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
        L10_2(L11_2)
        L1_2 = "Invalid"
        break
      end
    end
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = MySQL
      L2_2 = L2_2.Sync
      L2_2 = L2_2.fetchAll
      L3_2 = "SELECT * FROM `qs_trunk` WHERE `plate` = '"
      L4_2 = A0_2
      L5_2 = "'"
      L3_2 = L3_2 .. L4_2 .. L5_2
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L3_2 = L2_2[1]
        if nil ~= L3_2 then
          L3_2 = L2_2[1]
          L3_2 = L3_2.items
          if nil ~= L3_2 then
            L3_2 = L2_2[1]
            L4_2 = json
            L4_2 = L4_2.decode
            L5_2 = L2_2[1]
            L5_2 = L5_2.items
            L4_2 = L4_2(L5_2)
            L3_2.items = L4_2
            L3_2 = L2_2[1]
            L3_2 = L3_2.items
            if nil ~= L3_2 then
              L3_2 = pairs
              L4_2 = L2_2[1]
              L4_2 = L4_2.items
              L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
              for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
                L9_2 = QBCore
                L9_2 = L9_2.Shared
                L9_2 = L9_2.Items
                L10_2 = L8_2.name
                L11_2 = L10_2
                L10_2 = L10_2.lower
                L10_2 = L10_2(L11_2)
                L9_2 = L9_2[L10_2]
                if nil ~= L9_2 then
                  L10_2 = L8_2.slot
                  L11_2 = {}
                  L12_2 = L9_2.name
                  L11_2.name = L12_2
                  L12_2 = tonumber
                  L13_2 = L8_2.amount
                  L12_2 = L12_2(L13_2)
                  L11_2.amount = L12_2
                  L12_2 = L8_2.info
                  if nil ~= L12_2 then
                    L12_2 = L8_2.info
                    if L12_2 then
                      goto lbl_178
                    end
                  end
                  L12_2 = ""
                  ::lbl_178::
                  L11_2.info = L12_2
                  L12_2 = L9_2.label
                  L11_2.label = L12_2
                  L12_2 = L9_2.description
                  if nil ~= L12_2 then
                    L12_2 = L9_2.description
                    if L12_2 then
                      goto lbl_188
                    end
                  end
                  L12_2 = ""
                  ::lbl_188::
                  L11_2.description = L12_2
                  L12_2 = L9_2.weight
                  L11_2.weight = L12_2
                  L12_2 = L9_2.type
                  L11_2.type = L12_2
                  L12_2 = L9_2.unique
                  L11_2.unique = L12_2
                  L12_2 = L9_2.useable
                  L11_2.useable = L12_2
                  L12_2 = L8_2.info
                  if L12_2 then
                    L12_2 = L8_2.info
                    L12_2 = L12_2.image
                    if L12_2 then
                      L12_2 = L8_2.info
                      L12_2 = L12_2.image
                      L13_2 = ".png"
                      L12_2 = L12_2 .. L13_2
                      if L12_2 then
                        goto lbl_211
                      end
                    end
                  end
                  L12_2 = L9_2.image
                  ::lbl_211::
                  L11_2.image = L12_2
                  L12_2 = L8_2.slot
                  L11_2.slot = L12_2
                  L1_2[L10_2] = L11_2
                else
                  L10_2 = ShowConsoleError
                  L11_2 = "^0Error in Information in Trunk Items. Item probably missing in qs-core/shared.lua: "
                  L12_2 = L8_2.name
                  L13_2 = " Plate: "
                  L14_2 = A0_2
                  L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
                  L10_2(L11_2)
                  L1_2 = "Invalid"
                  break
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_228::
  return L1_2
end
GetOwnedVehicleItems = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Trunks
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.label
  if "Trunk-None" ~= L2_2 and nil ~= A1_2 then
    L2_2 = pairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L7_2.description = nil
    end
    L2_2 = MySQL
    L2_2 = L2_2.Async
    L2_2 = L2_2.fetchAll
    L3_2 = "SELECT * FROM `qs_trunk` WHERE `plate` = '"
    L4_2 = A0_2
    L5_2 = "'"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = {}
    function L5_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      if A0_3 then
        L1_3 = A0_3[1]
        if nil ~= L1_3 then
          L1_3 = MySQL
          L1_3 = L1_3.Async
          L1_3 = L1_3.execute
          L2_3 = "UPDATE `qs_trunk` SET `items` = '"
          L3_3 = EscapeSqli
          L4_3 = json
          L4_3 = L4_3.encode
          L5_3 = A1_2
          L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
          L4_3 = "' WHERE `plate` = '"
          L5_3 = A0_2
          L6_3 = "'"
          L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
          L3_3 = {}
          function L4_3(A0_4)
            local L1_4, L2_4
            L1_4 = Trunks
            L2_4 = A0_2
            L1_4 = L1_4[L2_4]
            L1_4.isOpen = false
          end
          L1_3(L2_3, L3_3, L4_3)
      end
      else
        L1_3 = MySQL
        L1_3 = L1_3.Async
        L1_3 = L1_3.insert
        L2_3 = "INSERT INTO `qs_trunk` (`plate`, `items`) VALUES ('"
        L3_3 = A0_2
        L4_3 = "', '"
        L5_3 = EscapeSqli
        L6_3 = json
        L6_3 = L6_3.encode
        L7_3 = A1_2
        L6_3, L7_3 = L6_3(L7_3)
        L5_3 = L5_3(L6_3, L7_3)
        L6_3 = "')"
        L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
        L3_3 = {}
        function L4_3(A0_4)
          local L1_4, L2_4
          L1_4 = Trunks
          L2_4 = A0_2
          L1_4 = L1_4[L2_4]
          L1_4.isOpen = false
        end
        L1_3(L2_3, L3_3, L4_3)
      end
    end
    L2_2(L3_2, L4_2, L5_2)
  end
end
SaveOwnedVehicleItems = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L6_2 = Config
  L6_2 = L6_2.Framework
  if "ESX" == L6_2 then
    L6_2 = tonumber
    L7_2 = A4_2
    L6_2 = L6_2(L7_2)
    L7_2 = QS
    L7_2 = L7_2.Shared
    L7_2 = L7_2.Items
    L7_2 = L7_2[A3_2]
    L8_2 = GetInventoryTotalWeight
    L9_2 = A0_2
    L10_2 = "trunk"
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = QS
    L9_2 = L9_2.Shared
    L9_2 = L9_2.Items
    L11_2 = A3_2
    L10_2 = A3_2.lower
    L10_2 = L10_2(L11_2)
    L9_2 = L9_2[L10_2]
    L9_2 = L9_2.weight
    L9_2 = L9_2 * L6_2
    L10_2 = L9_2 + L8_2
    L11_2 = Trunks
    L11_2 = L11_2[A0_2]
    L11_2 = L11_2.maxweight
    if L10_2 <= L11_2 then
      L10_2 = L7_2.unique
      if not L10_2 then
        L10_2 = Trunks
        L10_2 = L10_2[A0_2]
        L10_2 = L10_2.items
        L10_2 = L10_2[A1_2]
        if nil ~= L10_2 then
          L10_2 = Trunks
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          L10_2 = L10_2.name
          if L10_2 == A3_2 then
            L10_2 = Trunks
            L10_2 = L10_2[A0_2]
            L10_2 = L10_2.items
            L10_2 = L10_2[A1_2]
            L11_2 = Trunks
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L11_2 = L11_2[A1_2]
            L11_2 = L11_2.amount
            L11_2 = L11_2 + L6_2
            L10_2.amount = L11_2
        end
        else
          L10_2 = QS
          L10_2 = L10_2.Shared
          L10_2 = L10_2.Items
          L12_2 = A3_2
          L11_2 = A3_2.lower
          L11_2 = L11_2(L12_2)
          L10_2 = L10_2[L11_2]
          L11_2 = Trunks
          L11_2 = L11_2[A0_2]
          L11_2 = L11_2.items
          L12_2 = {}
          L13_2 = L10_2.name
          L12_2.name = L13_2
          L12_2.amount = L6_2
          L13_2 = A5_2 or L13_2
          if nil == A5_2 or not A5_2 then
            L13_2 = ""
          end
          L12_2.info = L13_2
          L13_2 = L10_2.label
          L12_2.label = L13_2
          L13_2 = L10_2.description
          if nil ~= L13_2 then
            L13_2 = L10_2.description
            if L13_2 then
              goto lbl_90
            end
          end
          L13_2 = ""
          ::lbl_90::
          L12_2.description = L13_2
          L13_2 = L10_2.weight
          L12_2.weight = L13_2
          L13_2 = L10_2.type
          L12_2.type = L13_2
          L13_2 = L10_2.unique
          L12_2.unique = L13_2
          L13_2 = L10_2.useable
          L12_2.useable = L13_2
          if A5_2 then
            L13_2 = A5_2.image
            if L13_2 then
              L13_2 = A5_2.image
              L14_2 = ".png"
              L13_2 = L13_2 .. L14_2
              if L13_2 then
                goto lbl_110
              end
            end
          end
          L13_2 = L10_2.image
          ::lbl_110::
          L12_2.image = L13_2
          L12_2.slot = A1_2
          L11_2[A1_2] = L12_2
        end
      else
        L10_2 = Trunks
        L10_2 = L10_2[A0_2]
        L10_2 = L10_2.items
        L10_2 = L10_2[A1_2]
        if nil ~= L10_2 then
          L10_2 = Trunks
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          L10_2 = L10_2.name
          if L10_2 == A3_2 then
            L10_2 = QS
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L12_2 = A3_2
            L11_2 = A3_2.lower
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2[L11_2]
            L11_2 = Trunks
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L12_2 = {}
            L13_2 = L10_2.name
            L12_2.name = L13_2
            L12_2.amount = L6_2
            L13_2 = A5_2 or L13_2
            if nil == A5_2 or not A5_2 then
              L13_2 = ""
            end
            L12_2.info = L13_2
            L13_2 = L10_2.label
            L12_2.label = L13_2
            L13_2 = L10_2.description
            if nil ~= L13_2 then
              L13_2 = L10_2.description
              if L13_2 then
                goto lbl_156
              end
            end
            L13_2 = ""
            ::lbl_156::
            L12_2.description = L13_2
            L13_2 = L10_2.weight
            L12_2.weight = L13_2
            L13_2 = L10_2.type
            L12_2.type = L13_2
            L13_2 = L10_2.unique
            L12_2.unique = L13_2
            L13_2 = L10_2.useable
            L12_2.useable = L13_2
            if A5_2 then
              L13_2 = A5_2.image
              if L13_2 then
                L13_2 = A5_2.image
                L14_2 = ".png"
                L13_2 = L13_2 .. L14_2
                if L13_2 then
                  goto lbl_176
                end
              end
            end
            L13_2 = L10_2.image
            ::lbl_176::
            L12_2.image = L13_2
            L12_2.slot = A2_2
            L11_2[A2_2] = L12_2
        end
        else
          L10_2 = QS
          L10_2 = L10_2.Shared
          L10_2 = L10_2.Items
          L12_2 = A3_2
          L11_2 = A3_2.lower
          L11_2 = L11_2(L12_2)
          L10_2 = L10_2[L11_2]
          L11_2 = Trunks
          L11_2 = L11_2[A0_2]
          L11_2 = L11_2.items
          L12_2 = {}
          L13_2 = L10_2.name
          L12_2.name = L13_2
          L12_2.amount = L6_2
          L13_2 = A5_2 or L13_2
          if nil == A5_2 or not A5_2 then
            L13_2 = ""
          end
          L12_2.info = L13_2
          L13_2 = L10_2.label
          L12_2.label = L13_2
          L13_2 = L10_2.description
          if nil ~= L13_2 then
            L13_2 = L10_2.description
            if L13_2 then
              goto lbl_209
            end
          end
          L13_2 = ""
          ::lbl_209::
          L12_2.description = L13_2
          L13_2 = L10_2.weight
          L12_2.weight = L13_2
          L13_2 = L10_2.type
          L12_2.type = L13_2
          L13_2 = L10_2.unique
          L12_2.unique = L13_2
          L13_2 = L10_2.useable
          L12_2.useable = L13_2
          if A5_2 then
            L13_2 = A5_2.image
            if L13_2 then
              L13_2 = A5_2.image
              L14_2 = ".png"
              L13_2 = L13_2 .. L14_2
              if L13_2 then
                goto lbl_229
              end
            end
          end
          L13_2 = L10_2.image
          ::lbl_229::
          L12_2.image = L13_2
          L12_2.slot = A1_2
          L11_2[A1_2] = L12_2
        end
      end
      L10_2 = true
      return L10_2
    else
      L10_2 = false
      return L10_2
    end
  else
    L6_2 = Config
    L6_2 = L6_2.Framework
    if "QBCore" == L6_2 then
      L6_2 = tonumber
      L7_2 = A4_2
      L6_2 = L6_2(L7_2)
      L7_2 = QBCore
      L7_2 = L7_2.Shared
      L7_2 = L7_2.Items
      L7_2 = L7_2[A3_2]
      L8_2 = GetInventoryTotalWeight
      L9_2 = A0_2
      L10_2 = "trunk"
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = QBCore
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L11_2 = A3_2
      L10_2 = A3_2.lower
      L10_2 = L10_2(L11_2)
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.weight
      L9_2 = L9_2 * L6_2
      L10_2 = L9_2 + L8_2
      L11_2 = Trunks
      L11_2 = L11_2[A0_2]
      L11_2 = L11_2.maxweight
      if L10_2 <= L11_2 then
        L10_2 = L7_2.unique
        if not L10_2 then
          L10_2 = Trunks
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          if nil ~= L10_2 then
            L10_2 = Trunks
            L10_2 = L10_2[A0_2]
            L10_2 = L10_2.items
            L10_2 = L10_2[A1_2]
            L10_2 = L10_2.name
            if L10_2 == A3_2 then
              L10_2 = Trunks
              L10_2 = L10_2[A0_2]
              L10_2 = L10_2.items
              L10_2 = L10_2[A1_2]
              L11_2 = Trunks
              L11_2 = L11_2[A0_2]
              L11_2 = L11_2.items
              L11_2 = L11_2[A1_2]
              L11_2 = L11_2.amount
              L11_2 = L11_2 + L6_2
              L10_2.amount = L11_2
          end
          else
            L10_2 = QBCore
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L12_2 = A3_2
            L11_2 = A3_2.lower
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2[L11_2]
            L11_2 = Trunks
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L12_2 = {}
            L13_2 = L10_2.name
            L12_2.name = L13_2
            L12_2.amount = L6_2
            L13_2 = A5_2 or L13_2
            if nil == A5_2 or not A5_2 then
              L13_2 = ""
            end
            L12_2.info = L13_2
            L13_2 = L10_2.label
            L12_2.label = L13_2
            L13_2 = L10_2.description
            if nil ~= L13_2 then
              L13_2 = L10_2.description
              if L13_2 then
                goto lbl_327
              end
            end
            L13_2 = ""
            ::lbl_327::
            L12_2.description = L13_2
            L13_2 = L10_2.weight
            L12_2.weight = L13_2
            L13_2 = L10_2.type
            L12_2.type = L13_2
            L13_2 = L10_2.unique
            L12_2.unique = L13_2
            L13_2 = L10_2.useable
            L12_2.useable = L13_2
            if A5_2 then
              L13_2 = A5_2.image
              if L13_2 then
                L13_2 = A5_2.image
                L14_2 = ".png"
                L13_2 = L13_2 .. L14_2
                if L13_2 then
                  goto lbl_347
                end
              end
            end
            L13_2 = L10_2.image
            ::lbl_347::
            L12_2.image = L13_2
            L12_2.slot = A1_2
            L11_2[A1_2] = L12_2
          end
        else
          L10_2 = Trunks
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          if nil ~= L10_2 then
            L10_2 = Trunks
            L10_2 = L10_2[A0_2]
            L10_2 = L10_2.items
            L10_2 = L10_2[A1_2]
            L10_2 = L10_2.name
            if L10_2 == A3_2 then
              L10_2 = QBCore
              L10_2 = L10_2.Shared
              L10_2 = L10_2.Items
              L12_2 = A3_2
              L11_2 = A3_2.lower
              L11_2 = L11_2(L12_2)
              L10_2 = L10_2[L11_2]
              L11_2 = Trunks
              L11_2 = L11_2[A0_2]
              L11_2 = L11_2.items
              L12_2 = {}
              L13_2 = L10_2.name
              L12_2.name = L13_2
              L12_2.amount = L6_2
              L13_2 = A5_2 or L13_2
              if nil == A5_2 or not A5_2 then
                L13_2 = ""
              end
              L12_2.info = L13_2
              L13_2 = L10_2.label
              L12_2.label = L13_2
              L13_2 = L10_2.description
              if nil ~= L13_2 then
                L13_2 = L10_2.description
                if L13_2 then
                  goto lbl_393
                end
              end
              L13_2 = ""
              ::lbl_393::
              L12_2.description = L13_2
              L13_2 = L10_2.weight
              L12_2.weight = L13_2
              L13_2 = L10_2.type
              L12_2.type = L13_2
              L13_2 = L10_2.unique
              L12_2.unique = L13_2
              L13_2 = L10_2.useable
              L12_2.useable = L13_2
              if A5_2 then
                L13_2 = A5_2.image
                if L13_2 then
                  L13_2 = A5_2.image
                  L14_2 = ".png"
                  L13_2 = L13_2 .. L14_2
                  if L13_2 then
                    goto lbl_413
                  end
                end
              end
              L13_2 = L10_2.image
              ::lbl_413::
              L12_2.image = L13_2
              L12_2.slot = A2_2
              L11_2[A2_2] = L12_2
          end
          else
            L10_2 = QBCore
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L12_2 = A3_2
            L11_2 = A3_2.lower
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2[L11_2]
            L11_2 = Trunks
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L12_2 = {}
            L13_2 = L10_2.name
            L12_2.name = L13_2
            L12_2.amount = L6_2
            L13_2 = A5_2 or L13_2
            if nil == A5_2 or not A5_2 then
              L13_2 = ""
            end
            L12_2.info = L13_2
            L13_2 = L10_2.label
            L12_2.label = L13_2
            L13_2 = L10_2.description
            if nil ~= L13_2 then
              L13_2 = L10_2.description
              if L13_2 then
                goto lbl_446
              end
            end
            L13_2 = ""
            ::lbl_446::
            L12_2.description = L13_2
            L13_2 = L10_2.weight
            L12_2.weight = L13_2
            L13_2 = L10_2.type
            L12_2.type = L13_2
            L13_2 = L10_2.unique
            L12_2.unique = L13_2
            L13_2 = L10_2.useable
            L12_2.useable = L13_2
            if A5_2 then
              L13_2 = A5_2.image
              if L13_2 then
                L13_2 = A5_2.image
                L14_2 = ".png"
                L13_2 = L13_2 .. L14_2
                if L13_2 then
                  goto lbl_466
                end
              end
            end
            L13_2 = L10_2.image
            ::lbl_466::
            L12_2.image = L13_2
            L12_2.slot = A1_2
            L11_2[A1_2] = L12_2
          end
        end
        L10_2 = true
        return L10_2
      else
        L10_2 = false
        return L10_2
      end
    end
  end
end
AddToTrunk = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = Trunks
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2.items
  L4_2 = L4_2[A1_2]
  if nil ~= L4_2 then
    L4_2 = Trunks
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.items
    L4_2 = L4_2[A1_2]
    L4_2 = L4_2.name
    if L4_2 == A2_2 then
      L4_2 = Trunks
      L4_2 = L4_2[A0_2]
      L4_2 = L4_2.items
      L4_2 = L4_2[A1_2]
      L4_2 = L4_2.amount
      if A3_2 < L4_2 then
        L4_2 = Trunks
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.items
        L4_2 = L4_2[A1_2]
        L5_2 = Trunks
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L5_2 = L5_2[A1_2]
        L5_2 = L5_2.amount
        L5_2 = L5_2 - A3_2
        L4_2.amount = L5_2
      else
        L4_2 = Trunks
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.items
        L4_2[A1_2] = nil
        L4_2 = next
        L5_2 = Trunks
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L4_2 = L4_2(L5_2)
        if nil == L4_2 then
          L4_2 = Trunks
          L4_2 = L4_2[A0_2]
          L5_2 = {}
          L4_2.items = L5_2
        end
      end
  end
  else
    L4_2 = Trunks
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.items
    L4_2[A1_2] = nil
    L4_2 = Trunks
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.items
    if nil == L4_2 then
      L4_2 = Trunks
      L4_2 = L4_2[A0_2]
      L4_2 = L4_2.items
      L4_2[A1_2] = nil
    end
  end
end
RemoveFromTrunk = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = {}
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = MySQL
    L2_2 = L2_2.Sync
    L2_2 = L2_2.fetchAll
    L3_2 = "SELECT * FROM `qs_glovebox` WHERE `plate` = '"
    L4_2 = A0_2
    L5_2 = "'"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      goto lbl_228
    end
    L3_2 = L2_2[1]
    if nil == L3_2 then
      goto lbl_228
    end
    L3_2 = L2_2[1]
    L3_2 = L3_2.items
    if nil == L3_2 then
      goto lbl_228
    end
    L3_2 = L2_2[1]
    L4_2 = json
    L4_2 = L4_2.decode
    L5_2 = L2_2[1]
    L5_2 = L5_2.items
    L4_2 = L4_2(L5_2)
    L3_2.items = L4_2
    L3_2 = L2_2[1]
    L3_2 = L3_2.items
    if nil == L3_2 then
      goto lbl_228
    end
    L3_2 = pairs
    L4_2 = L2_2[1]
    L4_2 = L4_2.items
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = QS
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L10_2 = L8_2.name
      L11_2 = L10_2
      L10_2 = L10_2.lower
      L10_2 = L10_2(L11_2)
      L9_2 = L9_2[L10_2]
      if nil ~= L9_2 then
        L10_2 = L8_2.slot
        L11_2 = {}
        L12_2 = L9_2.name
        L11_2.name = L12_2
        L12_2 = tonumber
        L13_2 = L8_2.amount
        L12_2 = L12_2(L13_2)
        L11_2.amount = L12_2
        L12_2 = L8_2.info
        if nil ~= L12_2 then
          L12_2 = L8_2.info
          if L12_2 then
            goto lbl_65
          end
        end
        L12_2 = ""
        ::lbl_65::
        L11_2.info = L12_2
        L12_2 = L9_2.label
        L11_2.label = L12_2
        L12_2 = L9_2.description
        if nil ~= L12_2 then
          L12_2 = L9_2.description
          if L12_2 then
            goto lbl_75
          end
        end
        L12_2 = ""
        ::lbl_75::
        L11_2.description = L12_2
        L12_2 = L9_2.weight
        L11_2.weight = L12_2
        L12_2 = L9_2.type
        L11_2.type = L12_2
        L12_2 = L9_2.unique
        L11_2.unique = L12_2
        L12_2 = L9_2.useable
        L11_2.useable = L12_2
        L12_2 = L8_2.info
        if L12_2 then
          L12_2 = L8_2.info
          L12_2 = L12_2.image
          if L12_2 then
            L12_2 = L8_2.info
            L12_2 = L12_2.image
            L13_2 = ".png"
            L12_2 = L12_2 .. L13_2
            if L12_2 then
              goto lbl_98
            end
          end
        end
        L12_2 = L9_2.image
        ::lbl_98::
        L11_2.image = L12_2
        L12_2 = L8_2.slot
        L11_2.slot = L12_2
        L1_2[L10_2] = L11_2
      else
        L10_2 = ShowConsoleError
        L11_2 = "^0Error in Information in Glovebox Items. Item probably missing in qs-core/shared.lua: "
        L12_2 = L8_2.name
        L13_2 = " Plate: "
        L14_2 = A0_2
        L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
        L10_2(L11_2)
        L1_2 = "Invalid"
        break
      end
    end
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = MySQL
      L2_2 = L2_2.Sync
      L2_2 = L2_2.fetchAll
      L3_2 = "SELECT * FROM `qs_glovebox` WHERE `plate` = '"
      L4_2 = A0_2
      L5_2 = "'"
      L3_2 = L3_2 .. L4_2 .. L5_2
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L3_2 = L2_2[1]
        if nil ~= L3_2 then
          L3_2 = L2_2[1]
          L3_2 = L3_2.items
          if nil ~= L3_2 then
            L3_2 = L2_2[1]
            L4_2 = json
            L4_2 = L4_2.decode
            L5_2 = L2_2[1]
            L5_2 = L5_2.items
            L4_2 = L4_2(L5_2)
            L3_2.items = L4_2
            L3_2 = L2_2[1]
            L3_2 = L3_2.items
            if nil ~= L3_2 then
              L3_2 = pairs
              L4_2 = L2_2[1]
              L4_2 = L4_2.items
              L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
              for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
                L9_2 = QBCore
                L9_2 = L9_2.Shared
                L9_2 = L9_2.Items
                L10_2 = L8_2.name
                L11_2 = L10_2
                L10_2 = L10_2.lower
                L10_2 = L10_2(L11_2)
                L9_2 = L9_2[L10_2]
                if nil ~= L9_2 then
                  L10_2 = L8_2.slot
                  L11_2 = {}
                  L12_2 = L9_2.name
                  L11_2.name = L12_2
                  L12_2 = tonumber
                  L13_2 = L8_2.amount
                  L12_2 = L12_2(L13_2)
                  L11_2.amount = L12_2
                  L12_2 = L8_2.info
                  if nil ~= L12_2 then
                    L12_2 = L8_2.info
                    if L12_2 then
                      goto lbl_178
                    end
                  end
                  L12_2 = ""
                  ::lbl_178::
                  L11_2.info = L12_2
                  L12_2 = L9_2.label
                  L11_2.label = L12_2
                  L12_2 = L9_2.description
                  if nil ~= L12_2 then
                    L12_2 = L9_2.description
                    if L12_2 then
                      goto lbl_188
                    end
                  end
                  L12_2 = ""
                  ::lbl_188::
                  L11_2.description = L12_2
                  L12_2 = L9_2.weight
                  L11_2.weight = L12_2
                  L12_2 = L9_2.type
                  L11_2.type = L12_2
                  L12_2 = L9_2.unique
                  L11_2.unique = L12_2
                  L12_2 = L9_2.useable
                  L11_2.useable = L12_2
                  L12_2 = L8_2.info
                  if L12_2 then
                    L12_2 = L8_2.info
                    L12_2 = L12_2.image
                    if L12_2 then
                      L12_2 = L8_2.info
                      L12_2 = L12_2.image
                      L13_2 = ".png"
                      L12_2 = L12_2 .. L13_2
                      if L12_2 then
                        goto lbl_211
                      end
                    end
                  end
                  L12_2 = L9_2.image
                  ::lbl_211::
                  L11_2.image = L12_2
                  L12_2 = L8_2.slot
                  L11_2.slot = L12_2
                  L1_2[L10_2] = L11_2
                else
                  L10_2 = ShowConsoleError
                  L11_2 = "^0Error in Information in Glovebox Items. Item probably missing in qs-core/shared.lua: "
                  L12_2 = L8_2.name
                  L13_2 = " Plate: "
                  L14_2 = A0_2
                  L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
                  L10_2(L11_2)
                  L1_2 = "Invalid"
                  break
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_228::
  return L1_2
end
GetOwnedVehicleGloveboxItems = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Gloveboxes
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.label
  if "Stash-None" ~= L2_2 and nil ~= A1_2 then
    L2_2 = pairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L7_2.description = nil
    end
    L2_2 = MySQL
    L2_2 = L2_2.Async
    L2_2 = L2_2.fetchAll
    L3_2 = "SELECT * FROM `qs_glovebox` WHERE `plate` = '"
    L4_2 = A0_2
    L5_2 = "'"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = {}
    function L5_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      if A0_3 then
        L1_3 = A0_3[1]
        if nil ~= L1_3 then
          L1_3 = MySQL
          L1_3 = L1_3.Async
          L1_3 = L1_3.execute
          L2_3 = "UPDATE `qs_glovebox` SET `items` = '"
          L3_3 = EscapeSqli
          L4_3 = json
          L4_3 = L4_3.encode
          L5_3 = A1_2
          L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
          L4_3 = "' WHERE `plate` = '"
          L5_3 = A0_2
          L6_3 = "'"
          L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
          L3_3 = {}
          function L4_3(A0_4)
            local L1_4, L2_4
            L1_4 = Gloveboxes
            L2_4 = A0_2
            L1_4 = L1_4[L2_4]
            L1_4.isOpen = false
          end
          L1_3(L2_3, L3_3, L4_3)
      end
      else
        L1_3 = MySQL
        L1_3 = L1_3.Async
        L1_3 = L1_3.insert
        L2_3 = "INSERT INTO `qs_glovebox` (`plate`, `items`) VALUES ('"
        L3_3 = A0_2
        L4_3 = "', '"
        L5_3 = EscapeSqli
        L6_3 = json
        L6_3 = L6_3.encode
        L7_3 = A1_2
        L6_3, L7_3 = L6_3(L7_3)
        L5_3 = L5_3(L6_3, L7_3)
        L6_3 = "')"
        L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
        L3_3 = {}
        function L4_3(A0_4)
          local L1_4, L2_4
          L1_4 = Gloveboxes
          L2_4 = A0_2
          L1_4 = L1_4[L2_4]
          L1_4.isOpen = false
        end
        L1_3(L2_3, L3_3, L4_3)
      end
    end
    L2_2(L3_2, L4_2, L5_2)
  end
end
SaveOwnedGloveboxItems = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L6_2 = Config
  L6_2 = L6_2.Framework
  if "ESX" == L6_2 then
    L6_2 = tonumber
    L7_2 = A4_2
    L6_2 = L6_2(L7_2)
    L7_2 = QS
    L7_2 = L7_2.Shared
    L7_2 = L7_2.Items
    L7_2 = L7_2[A3_2]
    L8_2 = GetInventoryTotalWeight
    L9_2 = A0_2
    L10_2 = "glovebox"
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = QS
    L9_2 = L9_2.Shared
    L9_2 = L9_2.Items
    L11_2 = A3_2
    L10_2 = A3_2.lower
    L10_2 = L10_2(L11_2)
    L9_2 = L9_2[L10_2]
    L9_2 = L9_2.weight
    L9_2 = L9_2 * L6_2
    L10_2 = L9_2 + L8_2
    L11_2 = Gloveboxes
    L11_2 = L11_2[A0_2]
    L11_2 = L11_2.maxweight
    if L10_2 <= L11_2 then
      L10_2 = L7_2.unique
      if not L10_2 then
        L10_2 = Gloveboxes
        L10_2 = L10_2[A0_2]
        L10_2 = L10_2.items
        L10_2 = L10_2[A1_2]
        if nil ~= L10_2 then
          L10_2 = Gloveboxes
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          L10_2 = L10_2.name
          if L10_2 == A3_2 then
            L10_2 = Gloveboxes
            L10_2 = L10_2[A0_2]
            L10_2 = L10_2.items
            L10_2 = L10_2[A1_2]
            L11_2 = Gloveboxes
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L11_2 = L11_2[A1_2]
            L11_2 = L11_2.amount
            L11_2 = L11_2 + L6_2
            L10_2.amount = L11_2
        end
        else
          L10_2 = QS
          L10_2 = L10_2.Shared
          L10_2 = L10_2.Items
          L12_2 = A3_2
          L11_2 = A3_2.lower
          L11_2 = L11_2(L12_2)
          L10_2 = L10_2[L11_2]
          L11_2 = Gloveboxes
          L11_2 = L11_2[A0_2]
          L11_2 = L11_2.items
          L12_2 = {}
          L13_2 = L10_2.name
          L12_2.name = L13_2
          L12_2.amount = L6_2
          L13_2 = A5_2 or L13_2
          if nil == A5_2 or not A5_2 then
            L13_2 = ""
          end
          L12_2.info = L13_2
          L13_2 = L10_2.label
          L12_2.label = L13_2
          L13_2 = L10_2.description
          if nil ~= L13_2 then
            L13_2 = L10_2.description
            if L13_2 then
              goto lbl_90
            end
          end
          L13_2 = ""
          ::lbl_90::
          L12_2.description = L13_2
          L13_2 = L10_2.weight
          L12_2.weight = L13_2
          L13_2 = L10_2.type
          L12_2.type = L13_2
          L13_2 = L10_2.unique
          L12_2.unique = L13_2
          L13_2 = L10_2.useable
          L12_2.useable = L13_2
          if A5_2 then
            L13_2 = A5_2.image
            if L13_2 then
              L13_2 = A5_2.image
              L14_2 = ".png"
              L13_2 = L13_2 .. L14_2
              if L13_2 then
                goto lbl_110
              end
            end
          end
          L13_2 = L10_2.image
          ::lbl_110::
          L12_2.image = L13_2
          L12_2.slot = A1_2
          L11_2[A1_2] = L12_2
        end
      else
        L10_2 = Gloveboxes
        L10_2 = L10_2[A0_2]
        L10_2 = L10_2.items
        L10_2 = L10_2[A1_2]
        if nil ~= L10_2 then
          L10_2 = Gloveboxes
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          L10_2 = L10_2.name
          if L10_2 == A3_2 then
            L10_2 = QS
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L12_2 = A3_2
            L11_2 = A3_2.lower
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2[L11_2]
            L11_2 = Gloveboxes
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L12_2 = {}
            L13_2 = L10_2.name
            L12_2.name = L13_2
            L12_2.amount = L6_2
            L13_2 = A5_2 or L13_2
            if nil == A5_2 or not A5_2 then
              L13_2 = ""
            end
            L12_2.info = L13_2
            L13_2 = L10_2.label
            L12_2.label = L13_2
            L13_2 = L10_2.description
            if nil ~= L13_2 then
              L13_2 = L10_2.description
              if L13_2 then
                goto lbl_156
              end
            end
            L13_2 = ""
            ::lbl_156::
            L12_2.description = L13_2
            L13_2 = L10_2.weight
            L12_2.weight = L13_2
            L13_2 = L10_2.type
            L12_2.type = L13_2
            L13_2 = L10_2.unique
            L12_2.unique = L13_2
            L13_2 = L10_2.useable
            L12_2.useable = L13_2
            if A5_2 then
              L13_2 = A5_2.image
              if L13_2 then
                L13_2 = A5_2.image
                L14_2 = ".png"
                L13_2 = L13_2 .. L14_2
                if L13_2 then
                  goto lbl_176
                end
              end
            end
            L13_2 = L10_2.image
            ::lbl_176::
            L12_2.image = L13_2
            L12_2.slot = A2_2
            L11_2[A2_2] = L12_2
        end
        else
          L10_2 = QS
          L10_2 = L10_2.Shared
          L10_2 = L10_2.Items
          L12_2 = A3_2
          L11_2 = A3_2.lower
          L11_2 = L11_2(L12_2)
          L10_2 = L10_2[L11_2]
          L11_2 = Gloveboxes
          L11_2 = L11_2[A0_2]
          L11_2 = L11_2.items
          L12_2 = {}
          L13_2 = L10_2.name
          L12_2.name = L13_2
          L12_2.amount = L6_2
          L13_2 = A5_2 or L13_2
          if nil == A5_2 or not A5_2 then
            L13_2 = ""
          end
          L12_2.info = L13_2
          L13_2 = L10_2.label
          L12_2.label = L13_2
          L13_2 = L10_2.description
          if nil ~= L13_2 then
            L13_2 = L10_2.description
            if L13_2 then
              goto lbl_209
            end
          end
          L13_2 = ""
          ::lbl_209::
          L12_2.description = L13_2
          L13_2 = L10_2.weight
          L12_2.weight = L13_2
          L13_2 = L10_2.type
          L12_2.type = L13_2
          L13_2 = L10_2.unique
          L12_2.unique = L13_2
          L13_2 = L10_2.useable
          L12_2.useable = L13_2
          if A5_2 then
            L13_2 = A5_2.image
            if L13_2 then
              L13_2 = A5_2.image
              L14_2 = ".png"
              L13_2 = L13_2 .. L14_2
              if L13_2 then
                goto lbl_229
              end
            end
          end
          L13_2 = L10_2.image
          ::lbl_229::
          L12_2.image = L13_2
          L12_2.slot = A1_2
          L11_2[A1_2] = L12_2
        end
      end
      L10_2 = true
      return L10_2
    else
      L10_2 = false
      return L10_2
    end
  else
    L6_2 = Config
    L6_2 = L6_2.Framework
    if "QBCore" == L6_2 then
      L6_2 = tonumber
      L7_2 = A4_2
      L6_2 = L6_2(L7_2)
      L7_2 = QBCore
      L7_2 = L7_2.Shared
      L7_2 = L7_2.Items
      L7_2 = L7_2[A3_2]
      L8_2 = GetInventoryTotalWeight
      L9_2 = A0_2
      L10_2 = "glovebox"
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = QBCore
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L11_2 = A3_2
      L10_2 = A3_2.lower
      L10_2 = L10_2(L11_2)
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.weight
      L9_2 = L9_2 * L6_2
      L10_2 = L9_2 + L8_2
      L11_2 = Gloveboxes
      L11_2 = L11_2[A0_2]
      L11_2 = L11_2.maxweight
      if L10_2 <= L11_2 then
        L10_2 = L7_2.unique
        if not L10_2 then
          L10_2 = Gloveboxes
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          if nil ~= L10_2 then
            L10_2 = Gloveboxes
            L10_2 = L10_2[A0_2]
            L10_2 = L10_2.items
            L10_2 = L10_2[A1_2]
            L10_2 = L10_2.name
            if L10_2 == A3_2 then
              L10_2 = Gloveboxes
              L10_2 = L10_2[A0_2]
              L10_2 = L10_2.items
              L10_2 = L10_2[A1_2]
              L11_2 = Gloveboxes
              L11_2 = L11_2[A0_2]
              L11_2 = L11_2.items
              L11_2 = L11_2[A1_2]
              L11_2 = L11_2.amount
              L11_2 = L11_2 + L6_2
              L10_2.amount = L11_2
          end
          else
            L10_2 = QBCore
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L12_2 = A3_2
            L11_2 = A3_2.lower
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2[L11_2]
            L11_2 = Gloveboxes
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L12_2 = {}
            L13_2 = L10_2.name
            L12_2.name = L13_2
            L12_2.amount = L6_2
            L13_2 = A5_2 or L13_2
            if nil == A5_2 or not A5_2 then
              L13_2 = ""
            end
            L12_2.info = L13_2
            L13_2 = L10_2.label
            L12_2.label = L13_2
            L13_2 = L10_2.description
            if nil ~= L13_2 then
              L13_2 = L10_2.description
              if L13_2 then
                goto lbl_327
              end
            end
            L13_2 = ""
            ::lbl_327::
            L12_2.description = L13_2
            L13_2 = L10_2.weight
            L12_2.weight = L13_2
            L13_2 = L10_2.type
            L12_2.type = L13_2
            L13_2 = L10_2.unique
            L12_2.unique = L13_2
            L13_2 = L10_2.useable
            L12_2.useable = L13_2
            if A5_2 then
              L13_2 = A5_2.image
              if L13_2 then
                L13_2 = A5_2.image
                L14_2 = ".png"
                L13_2 = L13_2 .. L14_2
                if L13_2 then
                  goto lbl_347
                end
              end
            end
            L13_2 = L10_2.image
            ::lbl_347::
            L12_2.image = L13_2
            L12_2.slot = A1_2
            L11_2[A1_2] = L12_2
          end
        else
          L10_2 = Gloveboxes
          L10_2 = L10_2[A0_2]
          L10_2 = L10_2.items
          L10_2 = L10_2[A1_2]
          if nil ~= L10_2 then
            L10_2 = Gloveboxes
            L10_2 = L10_2[A0_2]
            L10_2 = L10_2.items
            L10_2 = L10_2[A1_2]
            L10_2 = L10_2.name
            if L10_2 == A3_2 then
              L10_2 = QBCore
              L10_2 = L10_2.Shared
              L10_2 = L10_2.Items
              L12_2 = A3_2
              L11_2 = A3_2.lower
              L11_2 = L11_2(L12_2)
              L10_2 = L10_2[L11_2]
              L11_2 = Gloveboxes
              L11_2 = L11_2[A0_2]
              L11_2 = L11_2.items
              L12_2 = {}
              L13_2 = L10_2.name
              L12_2.name = L13_2
              L12_2.amount = L6_2
              L13_2 = A5_2 or L13_2
              if nil == A5_2 or not A5_2 then
                L13_2 = ""
              end
              L12_2.info = L13_2
              L13_2 = L10_2.label
              L12_2.label = L13_2
              L13_2 = L10_2.description
              if nil ~= L13_2 then
                L13_2 = L10_2.description
                if L13_2 then
                  goto lbl_393
                end
              end
              L13_2 = ""
              ::lbl_393::
              L12_2.description = L13_2
              L13_2 = L10_2.weight
              L12_2.weight = L13_2
              L13_2 = L10_2.type
              L12_2.type = L13_2
              L13_2 = L10_2.unique
              L12_2.unique = L13_2
              L13_2 = L10_2.useable
              L12_2.useable = L13_2
              if A5_2 then
                L13_2 = A5_2.image
                if L13_2 then
                  L13_2 = A5_2.image
                  L14_2 = ".png"
                  L13_2 = L13_2 .. L14_2
                  if L13_2 then
                    goto lbl_413
                  end
                end
              end
              L13_2 = L10_2.image
              ::lbl_413::
              L12_2.image = L13_2
              L12_2.slot = A2_2
              L11_2[A2_2] = L12_2
          end
          else
            L10_2 = QBCore
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L12_2 = A3_2
            L11_2 = A3_2.lower
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2[L11_2]
            L11_2 = Gloveboxes
            L11_2 = L11_2[A0_2]
            L11_2 = L11_2.items
            L12_2 = {}
            L13_2 = L10_2.name
            L12_2.name = L13_2
            L12_2.amount = L6_2
            L13_2 = A5_2 or L13_2
            if nil == A5_2 or not A5_2 then
              L13_2 = ""
            end
            L12_2.info = L13_2
            L13_2 = L10_2.label
            L12_2.label = L13_2
            L13_2 = L10_2.description
            if nil ~= L13_2 then
              L13_2 = L10_2.description
              if L13_2 then
                goto lbl_446
              end
            end
            L13_2 = ""
            ::lbl_446::
            L12_2.description = L13_2
            L13_2 = L10_2.weight
            L12_2.weight = L13_2
            L13_2 = L10_2.type
            L12_2.type = L13_2
            L13_2 = L10_2.unique
            L12_2.unique = L13_2
            L13_2 = L10_2.useable
            L12_2.useable = L13_2
            if A5_2 then
              L13_2 = A5_2.image
              if L13_2 then
                L13_2 = A5_2.image
                L14_2 = ".png"
                L13_2 = L13_2 .. L14_2
                if L13_2 then
                  goto lbl_466
                end
              end
            end
            L13_2 = L10_2.image
            ::lbl_466::
            L12_2.image = L13_2
            L12_2.slot = A1_2
            L11_2[A1_2] = L12_2
          end
        end
        L10_2 = true
        return L10_2
      else
        L10_2 = false
        return L10_2
      end
    end
  end
end
AddToGlovebox = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = Gloveboxes
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2.items
  L4_2 = L4_2[A1_2]
  if nil ~= L4_2 then
    L4_2 = Gloveboxes
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.items
    L4_2 = L4_2[A1_2]
    L4_2 = L4_2.name
    if L4_2 == A2_2 then
      L4_2 = Gloveboxes
      L4_2 = L4_2[A0_2]
      L4_2 = L4_2.items
      L4_2 = L4_2[A1_2]
      L4_2 = L4_2.amount
      if A3_2 < L4_2 then
        L4_2 = Gloveboxes
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.items
        L4_2 = L4_2[A1_2]
        L5_2 = Gloveboxes
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L5_2 = L5_2[A1_2]
        L5_2 = L5_2.amount
        L5_2 = L5_2 - A3_2
        L4_2.amount = L5_2
      else
        L4_2 = Gloveboxes
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.items
        L4_2[A1_2] = nil
        L4_2 = next
        L5_2 = Gloveboxes
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L4_2 = L4_2(L5_2)
        if nil == L4_2 then
          L4_2 = Gloveboxes
          L4_2 = L4_2[A0_2]
          L5_2 = {}
          L4_2.items = L5_2
        end
      end
  end
  else
    L4_2 = Gloveboxes
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.items
    L4_2[A1_2] = nil
    L4_2 = Gloveboxes
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.items
    if nil == L4_2 then
      L4_2 = Gloveboxes
      L4_2 = L4_2[A0_2]
      L4_2 = L4_2.items
      L4_2[A1_2] = nil
    end
  end
end
RemoveFromGlovebox = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = tonumber
  L6_2 = A3_2
  L5_2 = L5_2(L6_2)
  L6_2 = Drops
  L6_2 = L6_2[A0_2]
  L6_2 = L6_2.items
  L6_2 = L6_2[A1_2]
  if nil ~= L6_2 then
    L6_2 = Drops
    L6_2 = L6_2[A0_2]
    L6_2 = L6_2.items
    L6_2 = L6_2[A1_2]
    L6_2 = L6_2.name
    if L6_2 == A2_2 then
      L6_2 = Drops
      L6_2 = L6_2[A0_2]
      L6_2 = L6_2.items
      L6_2 = L6_2[A1_2]
      L7_2 = Drops
      L7_2 = L7_2[A0_2]
      L7_2 = L7_2.items
      L7_2 = L7_2[A1_2]
      L7_2 = L7_2.amount
      L7_2 = L7_2 + L5_2
      L6_2.amount = L7_2
  end
  else
    L6_2 = Config
    L6_2 = L6_2.Framework
    if "ESX" == L6_2 then
      L6_2 = QS
      L6_2 = L6_2.Shared
      L6_2 = L6_2.Items
      L8_2 = A2_2
      L7_2 = A2_2.lower
      L7_2 = L7_2(L8_2)
      L6_2 = L6_2[L7_2]
      L7_2 = Drops
      L7_2 = L7_2[A0_2]
      L7_2 = L7_2.items
      L8_2 = {}
      L9_2 = L6_2.name
      L8_2.name = L9_2
      L8_2.amount = L5_2
      L9_2 = A4_2 or L9_2
      if nil == A4_2 or not A4_2 then
        L9_2 = ""
      end
      L8_2.info = L9_2
      L9_2 = L6_2.label
      L8_2.label = L9_2
      L9_2 = L6_2.description
      if nil ~= L9_2 then
        L9_2 = L6_2.description
        if L9_2 then
          goto lbl_63
        end
      end
      L9_2 = ""
      ::lbl_63::
      L8_2.description = L9_2
      L9_2 = L6_2.weight
      L8_2.weight = L9_2
      L9_2 = L6_2.type
      L8_2.type = L9_2
      L9_2 = L6_2.unique
      L8_2.unique = L9_2
      L9_2 = L6_2.useable
      L8_2.useable = L9_2
      if A4_2 then
        L9_2 = A4_2.image
        if L9_2 then
          L9_2 = A4_2.image
          L10_2 = ".png"
          L9_2 = L9_2 .. L10_2
          if L9_2 then
            goto lbl_83
          end
        end
      end
      L9_2 = L6_2.image
      ::lbl_83::
      L8_2.image = L9_2
      L8_2.slot = A1_2
      L8_2.id = A0_2
      L7_2[A1_2] = L8_2
    else
      L6_2 = Config
      L6_2 = L6_2.Framework
      if "QBCore" == L6_2 then
        L6_2 = QBCore
        L6_2 = L6_2.Shared
        L6_2 = L6_2.Items
        L8_2 = A2_2
        L7_2 = A2_2.lower
        L7_2 = L7_2(L8_2)
        L6_2 = L6_2[L7_2]
        L7_2 = Drops
        L7_2 = L7_2[A0_2]
        L7_2 = L7_2.items
        L8_2 = {}
        L9_2 = L6_2.name
        L8_2.name = L9_2
        L8_2.amount = L5_2
        L9_2 = A4_2 or L9_2
        if nil == A4_2 or not A4_2 then
          L9_2 = ""
        end
        L8_2.info = L9_2
        L9_2 = L6_2.label
        L8_2.label = L9_2
        L9_2 = L6_2.description
        if nil ~= L9_2 then
          L9_2 = L6_2.description
          if L9_2 then
            goto lbl_121
          end
        end
        L9_2 = ""
        ::lbl_121::
        L8_2.description = L9_2
        L9_2 = L6_2.weight
        L8_2.weight = L9_2
        L9_2 = L6_2.type
        L8_2.type = L9_2
        L9_2 = L6_2.unique
        L8_2.unique = L9_2
        L9_2 = L6_2.useable
        L8_2.useable = L9_2
        if A4_2 then
          L9_2 = A4_2.image
          if L9_2 then
            L9_2 = A4_2.image
            L10_2 = ".png"
            L9_2 = L9_2 .. L10_2
            if L9_2 then
              goto lbl_141
            end
          end
        end
        L9_2 = L6_2.image
        ::lbl_141::
        L8_2.image = L9_2
        L8_2.slot = A1_2
        L8_2.id = A0_2
        L7_2[A1_2] = L8_2
      end
    end
  end
end
AddToDrop = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = Drops
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2.items
  L4_2 = L4_2[A1_2]
  if nil ~= L4_2 then
    L4_2 = Drops
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.items
    L4_2 = L4_2[A1_2]
    L4_2 = L4_2.name
    if L4_2 == A2_2 then
      L4_2 = Drops
      L4_2 = L4_2[A0_2]
      L4_2 = L4_2.items
      L4_2 = L4_2[A1_2]
      L4_2 = L4_2.amount
      if A3_2 < L4_2 then
        L4_2 = Drops
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.items
        L4_2 = L4_2[A1_2]
        L5_2 = Drops
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L5_2 = L5_2[A1_2]
        L5_2 = L5_2.amount
        L5_2 = L5_2 - A3_2
        L4_2.amount = L5_2
      else
        L4_2 = Drops
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.items
        L4_2[A1_2] = nil
        L4_2 = next
        L5_2 = Drops
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.items
        L4_2 = L4_2(L5_2)
        if nil == L4_2 then
          L4_2 = Drops
          L4_2 = L4_2[A0_2]
          L5_2 = {}
          L4_2.items = L5_2
        end
      end
  end
  else
    L4_2 = Drops
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.items
    L4_2[A1_2] = nil
    L4_2 = Drops
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.items
    if nil == L4_2 then
      L4_2 = Drops
      L4_2 = L4_2[A0_2]
      L4_2 = L4_2.items
      L4_2[A1_2] = nil
    end
  end
end
RemoveFromDrop = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = Drops
  if nil ~= L0_2 then
    L0_2 = math
    L0_2 = L0_2.random
    L1_2 = 10000
    L2_2 = 99999
    L0_2 = L0_2(L1_2, L2_2)
    L1_2 = L0_2
    while true do
      L2_2 = Drops
      L2_2 = L2_2[L1_2]
      if nil == L2_2 then
        break
      end
      L2_2 = math
      L2_2 = L2_2.random
      L3_2 = 10000
      L4_2 = 99999
      L2_2 = L2_2(L3_2, L4_2)
      L0_2 = L2_2
      L1_2 = L0_2
    end
    return L1_2
  else
    L0_2 = math
    L0_2 = L0_2.random
    L1_2 = 10000
    L2_2 = 99999
    L0_2 = L0_2(L1_2, L2_2)
    L1_2 = L0_2
    return L1_2
  end
end
CreateDropId = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L4_2 = Config
  L4_2 = L4_2.Framework
  if "ESX" == L4_2 then
    L4_2 = A0_2
    L5_2 = QS
    L5_2 = L5_2.GetPlayerFromId
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L6_2 = L5_2.GetItemBySlot
    L7_2 = A1_2
    L6_2 = L6_2(L7_2)
    L7_2 = L5_2.removeItem
    L8_2 = L6_2.name
    L9_2 = A3_2
    L10_2 = L6_2.slot
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if L7_2 then
      L7_2 = TriggerClientEvent
      L8_2 = "inventory:client:CheckWeapon"
      L9_2 = L4_2
      L10_2 = L6_2.name
      L7_2(L8_2, L9_2, L10_2)
      L7_2 = QS
      L7_2 = L7_2.Shared
      L7_2 = L7_2.Items
      L8_2 = L6_2.name
      L9_2 = L8_2
      L8_2 = L8_2.lower
      L8_2 = L8_2(L9_2)
      L7_2 = L7_2[L8_2]
      L8_2 = CreateDropId
      L8_2 = L8_2()
      L9_2 = Drops
      L10_2 = {}
      L9_2[L8_2] = L10_2
      L9_2 = Drops
      L9_2 = L9_2[L8_2]
      L10_2 = {}
      L9_2.items = L10_2
      L9_2 = Drops
      L9_2 = L9_2[L8_2]
      L9_2 = L9_2.items
      L10_2 = {}
      L11_2 = L7_2.name
      L10_2.name = L11_2
      L10_2.amount = A3_2
      L11_2 = L6_2.info
      if nil ~= L11_2 then
        L11_2 = L6_2.info
        if L11_2 then
          goto lbl_58
        end
      end
      L11_2 = ""
      ::lbl_58::
      L10_2.info = L11_2
      L11_2 = L7_2.label
      L10_2.label = L11_2
      L11_2 = L7_2.description
      if nil ~= L11_2 then
        L11_2 = L7_2.description
        if L11_2 then
          goto lbl_68
        end
      end
      L11_2 = ""
      ::lbl_68::
      L10_2.description = L11_2
      L11_2 = L7_2.weight
      L10_2.weight = L11_2
      L11_2 = L7_2.type
      L10_2.type = L11_2
      L11_2 = L7_2.unique
      L10_2.unique = L11_2
      L11_2 = L7_2.useable
      L10_2.useable = L11_2
      L11_2 = info
      if L11_2 then
        L11_2 = info
        L11_2 = L11_2.image
        if L11_2 then
          L11_2 = info
          L11_2 = L11_2.image
          L12_2 = ".png"
          L11_2 = L11_2 .. L12_2
          if L11_2 then
            goto lbl_91
          end
        end
      end
      L11_2 = L7_2.image
      ::lbl_91::
      L10_2.image = L11_2
      L10_2.slot = A2_2
      L10_2.id = L8_2
      L9_2[A2_2] = L10_2
      L9_2 = sendToDiscordDrop
      L10_2 = Config
      L10_2 = L10_2.WebhookTranslates
      L10_2 = L10_2.drop
      L10_2 = L10_2.title
      L11_2 = "**"
      L12_2 = GetPlayerName
      L13_2 = L4_2
      L12_2 = L12_2(L13_2)
      L13_2 = Config
      L13_2 = L13_2.WebhookTranslates
      L13_2 = L13_2.drop
      L13_2 = L13_2.throw
      L14_2 = L6_2.name
      L15_2 = " x "
      L16_2 = A3_2
      L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2
      L12_2 = 7393279
      L9_2(L10_2, L11_2, L12_2)
      L9_2 = TriggerClientEvent
      L10_2 = "inventory:client:DropItemAnim"
      L11_2 = L4_2
      L9_2(L10_2, L11_2)
      L9_2 = TriggerClientEvent
      L10_2 = "inventory:client:AddDropItem"
      L11_2 = -1
      L12_2 = L8_2
      L13_2 = L4_2
      L9_2(L10_2, L11_2, L12_2, L13_2)
      L9_2 = L6_2.name
      L10_2 = L9_2
      L9_2 = L9_2.lower
      L9_2 = L9_2(L10_2)
      if "radio" == L9_2 then
        L9_2 = TriggerClientEvent
        L10_2 = "qs-radio:onRadioDrop"
        L11_2 = L4_2
        L9_2(L10_2, L11_2)
      end
    else
      L7_2 = TriggerClientEvent
      L8_2 = "qs-inventory:sendMessage"
      L9_2 = L4_2
      L10_2 = Lang
      L11_2 = "INVENTORY_NO_ITEM"
      L10_2 = L10_2(L11_2)
      L11_2 = "error"
      L7_2(L8_2, L9_2, L10_2, L11_2)
      return
    end
  else
    L4_2 = Config
    L4_2 = L4_2.Framework
    if "QBCore" == L4_2 then
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      L5_2 = L4_2.Functions
      L5_2 = L5_2.GetItemBySlot
      L6_2 = A1_2
      L5_2 = L5_2(L6_2)
      L6_2 = L4_2.Functions
      L6_2 = L6_2.RemoveItem
      L7_2 = L5_2.name
      L8_2 = A3_2
      L9_2 = L5_2.slot
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      if L6_2 then
        L6_2 = TriggerClientEvent
        L7_2 = "inventory:client:CheckWeapon"
        L8_2 = A0_2
        L9_2 = L5_2.name
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = QBCore
        L6_2 = L6_2.Shared
        L6_2 = L6_2.Items
        L7_2 = L5_2.name
        L8_2 = L7_2
        L7_2 = L7_2.lower
        L7_2 = L7_2(L8_2)
        L6_2 = L6_2[L7_2]
        L7_2 = CreateDropId
        L7_2 = L7_2()
        L8_2 = Drops
        L9_2 = {}
        L8_2[L7_2] = L9_2
        L8_2 = Drops
        L8_2 = L8_2[L7_2]
        L9_2 = {}
        L8_2.items = L9_2
        L8_2 = Drops
        L8_2 = L8_2[L7_2]
        L8_2 = L8_2.items
        L9_2 = {}
        L10_2 = L6_2.name
        L9_2.name = L10_2
        L9_2.amount = A3_2
        L10_2 = L5_2.info
        if nil ~= L10_2 then
          L10_2 = L5_2.info
          if L10_2 then
            goto lbl_203
          end
        end
        L10_2 = ""
        ::lbl_203::
        L9_2.info = L10_2
        L10_2 = L6_2.label
        L9_2.label = L10_2
        L10_2 = L6_2.description
        if nil ~= L10_2 then
          L10_2 = L6_2.description
          if L10_2 then
            goto lbl_213
          end
        end
        L10_2 = ""
        ::lbl_213::
        L9_2.description = L10_2
        L10_2 = L6_2.weight
        L9_2.weight = L10_2
        L10_2 = L6_2.type
        L9_2.type = L10_2
        L10_2 = L6_2.unique
        L9_2.unique = L10_2
        L10_2 = L6_2.useable
        L9_2.useable = L10_2
        L10_2 = L6_2.image
        L9_2.image = L10_2
        L9_2.slot = A2_2
        L9_2.id = L7_2
        L8_2[A2_2] = L9_2
        L8_2 = sendToDiscordDrop
        L9_2 = Config
        L9_2 = L9_2.WebhookTranslates
        L9_2 = L9_2.drop
        L9_2 = L9_2.title
        L10_2 = "**"
        L11_2 = GetPlayerName
        L12_2 = A0_2
        L11_2 = L11_2(L12_2)
        L12_2 = Config
        L12_2 = L12_2.WebhookTranslates
        L12_2 = L12_2.drop
        L12_2 = L12_2.throw
        L13_2 = L5_2.name
        L14_2 = " x "
        L15_2 = A3_2
        L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
        L11_2 = 7393279
        L8_2(L9_2, L10_2, L11_2)
        L8_2 = TriggerClientEvent
        L9_2 = "inventory:client:DropItemAnim"
        L10_2 = A0_2
        L8_2(L9_2, L10_2)
        L8_2 = TriggerClientEvent
        L9_2 = "inventory:client:AddDropItem"
        L10_2 = -1
        L11_2 = L7_2
        L12_2 = A0_2
        L8_2(L9_2, L10_2, L11_2, L12_2)
        L8_2 = L5_2.name
        L9_2 = L8_2
        L8_2 = L8_2.lower
        L8_2 = L8_2(L9_2)
        if "radio" == L8_2 then
          L8_2 = TriggerClientEvent
          L9_2 = "qs-radio:onRadioDrop"
          L10_2 = A0_2
          L8_2(L9_2, L10_2)
        end
      else
        L6_2 = TriggerClientEvent
        L7_2 = "qs-inventory:sendMessage"
        L8_2 = A0_2
        L9_2 = Lang
        L10_2 = "INVENTORY_NO_ITEM"
        L9_2 = L9_2(L10_2)
        L10_2 = "error"
        L6_2(L7_2, L8_2, L9_2, L10_2)
        return
      end
    end
  end
end
CreateNewDrop = L1_1
L1_1 = Config
L1_1 = L1_1.Framework
if "ESX" == L1_1 then
  L1_1 = ESX
  L1_1 = L1_1.RegisterServerCallback
  L2_1 = "qb-inventory:GetInventoryData"
  function L3_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2
    L2_2 = A1_2
    L3_2 = QS
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L3_2 = L3_2.PlayerData
    L3_2 = L3_2.items
    L2_2(L3_2)
  end
  L1_1(L2_1, L3_1)
else
  L1_1 = Config
  L1_1 = L1_1.Framework
  if "QBCore" == L1_1 then
    L1_1 = QBCore
    L1_1 = L1_1.Functions
    L1_1 = L1_1.CreateCallback
    L2_1 = "qb-inventory:GetInventoryData"
    function L3_1(A0_2, A1_2)
      local L2_2, L3_2, L4_2
      L2_2 = A1_2
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L3_2 = L3_2.PlayerData
      L3_2 = L3_2.items
      L2_2(L3_2)
    end
    L1_1(L2_1, L3_1)
  end
end
L1_1 = RegisterServerEvent
L2_1 = "inventory:server:GiveItem"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "inventory:server:GiveItem"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L3_2 = tonumber
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = A2_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  if L3_2 ~= L4_2 then
    L3_2 = TriggerClientEvent
    L4_2 = "qs-inventory:sendMessage"
    L5_2 = src
    L6_2 = Lang
    L7_2 = "WENT_WRONG"
    L6_2 = L6_2(L7_2)
    L7_2 = "error"
    L3_2(L4_2, L5_2, L6_2, L7_2)
    return
  end
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = source
    L4_2 = ESX
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = QS
    L5_2 = L5_2.GetPlayerFromId
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L6_2 = QS
    L6_2 = L6_2.GetPlayerFromId
    L7_2 = tonumber
    L8_2 = A0_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L7_2(L8_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    if L5_2 and L6_2 then
      L7_2 = L6_2.PlayerData
      L7_2 = L7_2.name
      L8_2 = L5_2.PlayerData
      L8_2 = L8_2.name
      L9_2 = L4_2.getInventoryItem
      L10_2 = A1_2.name
      L11_2 = L10_2
      L10_2 = L10_2.lower
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L10_2(L11_2)
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      L9_2 = L9_2.count
      L10_2 = L5_2.GetItemBySlot
      L11_2 = A1_2.slot
      L10_2 = L10_2(L11_2)
      if A2_2 <= L9_2 and L10_2 then
        L11_2 = A1_2.name
        L12_2 = L11_2
        L11_2 = L11_2.lower
        L11_2 = L11_2(L12_2)
        L12_2 = L10_2.name
        L13_2 = L12_2
        L12_2 = L12_2.lower
        L12_2 = L12_2(L13_2)
        if L11_2 == L12_2 then
          L11_2 = L10_2.amount
          if A2_2 <= L11_2 then
            if nil ~= A2_2 then
              L11_2 = A1_2.amount
              if nil ~= L11_2 and A2_2 > 0 then
                L11_2 = A1_2.amount
                if A2_2 <= L11_2 then
                  L11_2 = L6_2.addItem
                  L12_2 = A1_2.name
                  L13_2 = A2_2
                  L14_2 = nil
                  L15_2 = A1_2.info
                  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
                  if L11_2 then
                    L11_2 = L5_2.removeItem
                    L12_2 = A1_2.name
                    L13_2 = A2_2
                    L14_2 = A1_2.slot
                    L11_2(L12_2, L13_2, L14_2)
                    L11_2 = TriggerClientEvent
                    L12_2 = "qs-inventory:sendMessage"
                    L13_2 = L3_2
                    L14_2 = Lang
                    L15_2 = "INVENTORY_GIVE_ITEM"
                    L14_2 = L14_2(L15_2)
                    L15_2 = A1_2.label
                    L16_2 = " x"
                    L17_2 = A2_2
                    L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2
                    L15_2 = "inform"
                    L11_2(L12_2, L13_2, L14_2, L15_2)
                    L11_2 = TriggerClientEvent
                    L12_2 = "qs-inventory:sendMessage"
                    L13_2 = tonumber
                    L14_2 = A0_2
                    L13_2 = L13_2(L14_2)
                    L14_2 = Lang
                    L15_2 = "INVENTORY_RECEIVE_ITEM"
                    L14_2 = L14_2(L15_2)
                    L15_2 = A1_2.label
                    L16_2 = " x"
                    L17_2 = A2_2
                    L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2
                    L15_2 = "inform"
                    L11_2(L12_2, L13_2, L14_2, L15_2)
                    L11_2 = TriggerClientEvent
                    L12_2 = "inventory:client:ItemBox"
                    L13_2 = L3_2
                    L14_2 = QS
                    L14_2 = L14_2.Shared
                    L14_2 = L14_2.Items
                    L15_2 = A1_2.name
                    L14_2 = L14_2[L15_2]
                    L15_2 = "remove"
                    L11_2(L12_2, L13_2, L14_2, L15_2)
                    L11_2 = TriggerClientEvent
                    L12_2 = "inventory:giveitemtoplayer:animation"
                    L13_2 = L3_2
                    L11_2(L12_2, L13_2)
                    L11_2 = Config
                    L11_2 = L11_2.EnableActionNotifications
                    if L11_2 then
                      L11_2 = TriggerClientEvent
                      L12_2 = "ActionNotifications"
                      L13_2 = L3_2
                      L14_2 = "givetoplayer"
                      L15_2 = L3_2
                      L16_2 = GetPlayerName
                      L17_2 = L3_2
                      L16_2 = L16_2(L17_2)
                      L17_2 = A1_2.name
                      L18_2 = A2_2
                      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
                    end
                    L11_2 = TriggerClientEvent
                    L12_2 = "inventory:client:ItemBox"
                    L13_2 = tonumber
                    L14_2 = A0_2
                    L13_2 = L13_2(L14_2)
                    L14_2 = QS
                    L14_2 = L14_2.Shared
                    L14_2 = L14_2.Items
                    L15_2 = A1_2.name
                    L14_2 = L14_2[L15_2]
                    L15_2 = "add"
                    L11_2(L12_2, L13_2, L14_2, L15_2)
                    L11_2 = sendToDiscordGiveItem
                    L12_2 = Config
                    L12_2 = L12_2.WebhookTranslates
                    L12_2 = L12_2.giveitem
                    L12_2 = L12_2.title
                    L13_2 = "**"
                    L14_2 = GetPlayerName
                    L15_2 = L3_2
                    L14_2 = L14_2(L15_2)
                    L15_2 = Config
                    L15_2 = L15_2.WebhookTranslates
                    L15_2 = L15_2.giveitem
                    L15_2 = L15_2.give
                    L16_2 = A1_2.name
                    L17_2 = " x "
                    L18_2 = A2_2
                    L19_2 = Config
                    L19_2 = L19_2.WebhookTranslates
                    L19_2 = L19_2.giveitem
                    L19_2 = L19_2.to
                    L20_2 = GetPlayerName
                    L21_2 = A0_2
                    L20_2 = L20_2(L21_2)
                    L21_2 = "**"
                    L13_2 = L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2
                    L14_2 = 7393279
                    L11_2(L12_2, L13_2, L14_2)
                  else
                    L11_2 = TriggerClientEvent
                    L12_2 = "qs-inventory:sendMessage"
                    L13_2 = L3_2
                    L14_2 = Lang
                    L15_2 = "INVENTORY_FULL"
                    L14_2 = L14_2(L15_2)
                    L15_2 = "inform"
                    L11_2(L12_2, L13_2, L14_2, L15_2)
                  end
              end
            end
            else
              L11_2 = TriggerClientEvent
              L12_2 = "qs-inventory:sendMessage"
              L13_2 = L3_2
              L14_2 = Lang
              L15_2 = "WENT_WRONG"
              L14_2 = L14_2(L15_2)
              L15_2 = "error"
              L11_2(L12_2, L13_2, L14_2, L15_2)
            end
          end
        end
      end
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = source
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = QBCore
      L5_2 = L5_2.Functions
      L5_2 = L5_2.GetPlayer
      L6_2 = tonumber
      L7_2 = A0_2
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L6_2(L7_2)
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      L6_2 = L5_2.PlayerData
      L6_2 = L6_2.name
      L7_2 = L4_2.PlayerData
      L7_2 = L7_2.name
      L8_2 = L4_2.Functions
      L8_2 = L8_2.GetItemBySlot
      L9_2 = A1_2.slot
      L8_2 = L8_2(L9_2)
      if L8_2 then
        L9_2 = A1_2.name
        L10_2 = L9_2
        L9_2 = L9_2.lower
        L9_2 = L9_2(L10_2)
        L10_2 = L8_2.name
        L11_2 = L10_2
        L10_2 = L10_2.lower
        L10_2 = L10_2(L11_2)
        if L9_2 == L10_2 then
          L9_2 = L8_2.amount
          if A2_2 <= L9_2 then
            if nil ~= A2_2 then
              L9_2 = A1_2.amount
              if nil ~= L9_2 and A2_2 > 0 then
                L9_2 = A1_2.amount
                if A2_2 <= L9_2 then
                  L9_2 = L5_2.Functions
                  L9_2 = L9_2.AddItem
                  L10_2 = A1_2.name
                  L11_2 = A2_2
                  L12_2 = nil
                  L13_2 = A1_2.info
                  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
                  if L9_2 then
                    L9_2 = L4_2.Functions
                    L9_2 = L9_2.RemoveItem
                    L10_2 = A1_2.name
                    L11_2 = A2_2
                    L12_2 = A1_2.slot
                    L9_2(L10_2, L11_2, L12_2)
                    L9_2 = TriggerClientEvent
                    L10_2 = "qs-inventory:sendMessage"
                    L11_2 = L3_2
                    L12_2 = Lang
                    L13_2 = "INVENTORY_GIVE_ITEM"
                    L12_2 = L12_2(L13_2)
                    L13_2 = A1_2.label
                    L14_2 = " x"
                    L15_2 = A2_2
                    L12_2 = L12_2 .. L13_2 .. L14_2 .. L15_2
                    L9_2(L10_2, L11_2, L12_2)
                    L9_2 = TriggerClientEvent
                    L10_2 = "inventory:client:ItemBox"
                    L11_2 = L3_2
                    L12_2 = QBCore
                    L12_2 = L12_2.Shared
                    L12_2 = L12_2.Items
                    L13_2 = A1_2.name
                    L12_2 = L12_2[L13_2]
                    L13_2 = "remove"
                    L9_2(L10_2, L11_2, L12_2, L13_2)
                    L9_2 = TriggerClientEvent
                    L10_2 = "inventory:client:ItemBox"
                    L11_2 = tonumber
                    L12_2 = A0_2
                    L11_2 = L11_2(L12_2)
                    L12_2 = QBCore
                    L12_2 = L12_2.Shared
                    L12_2 = L12_2.Items
                    L13_2 = A1_2.name
                    L12_2 = L12_2[L13_2]
                    L13_2 = "add"
                    L9_2(L10_2, L11_2, L12_2, L13_2)
                    L9_2 = sendToDiscordGiveItem
                    L10_2 = Config
                    L10_2 = L10_2.WebhookTranslates
                    L10_2 = L10_2.giveitem
                    L10_2 = L10_2.title
                    L11_2 = "**"
                    L12_2 = GetPlayerName
                    L13_2 = source
                    L12_2 = L12_2(L13_2)
                    L13_2 = Config
                    L13_2 = L13_2.WebhookTranslates
                    L13_2 = L13_2.giveitem
                    L13_2 = L13_2.give
                    L14_2 = A1_2.name
                    L15_2 = " x "
                    L16_2 = A2_2
                    L17_2 = Config
                    L17_2 = L17_2.WebhookTranslates
                    L17_2 = L17_2.giveitem
                    L17_2 = L17_2.to
                    L18_2 = GetPlayerName
                    L19_2 = A0_2
                    L18_2 = L18_2(L19_2)
                    L19_2 = "**"
                    L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                    L12_2 = 7393279
                    L9_2(L10_2, L11_2, L12_2)
                  else
                    L9_2 = TriggerClientEvent
                    L10_2 = "qs-inventory:sendMessage"
                    L11_2 = source
                    L12_2 = Lang
                    L13_2 = "INVENTORY_FULL"
                    L12_2 = L12_2(L13_2)
                    L13_2 = "inform"
                    L9_2(L10_2, L11_2, L12_2, L13_2)
                  end
              end
            end
            else
              L9_2 = TriggerClientEvent
              L10_2 = "qs-inventory:sendMessage"
              L11_2 = source
              L12_2 = Lang
              L13_2 = "WENT_WRONG"
              L12_2 = L12_2(L13_2)
              L13_2 = "error"
              L9_2(L10_2, L11_2, L12_2, L13_2)
            end
          end
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = Config
L1_1 = L1_1.Framework
if "ESX" == L1_1 then
  L1_1 = ESX
  L1_1 = L1_1.RegisterServerCallback
  L2_1 = "inventory:PlayerInventoryOpened"
  function L3_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2
    L3_2 = A1_2
    L4_2 = OpenedInventory
    L4_2 = L4_2[A2_2]
    L3_2(L4_2)
  end
  L1_1(L2_1, L3_1)
else
  L1_1 = Config
  L1_1 = L1_1.Framework
  if "QBCore" == L1_1 then
    L1_1 = QBCore
    L1_1 = L1_1.Functions
    L1_1 = L1_1.CreateCallback
    L2_1 = "inventory:PlayerInventoryOpened"
    function L3_1(A0_2, A1_2, A2_2)
      local L3_2, L4_2
      L3_2 = A1_2
      L4_2 = OpenedInventory
      L4_2 = L4_2[A2_2]
      L3_2(L4_2)
    end
    L1_1(L2_1, L3_1)
  end
end
L1_1 = Config
L1_1 = L1_1.Framework
if "ESX" == L1_1 then
  L1_1 = ESX
  L1_1 = L1_1.RegisterServerCallback
  L2_1 = "inventory:PlayerInventoryOpened"
  function L3_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2
    L3_2 = A1_2
    L4_2 = OpenedInventory
    L4_2 = L4_2[A2_2]
    L3_2(L4_2)
  end
  L1_1(L2_1, L3_1)
else
  L1_1 = Config
  L1_1 = L1_1.Framework
  if "QBCore" == L1_1 then
    L1_1 = QBCore
    L1_1 = L1_1.Functions
    L1_1 = L1_1.CreateCallback
    L2_1 = "inventory:PlayerInventoryOpened"
    function L3_1(A0_2, A1_2, A2_2)
      local L3_2, L4_2
      L3_2 = A1_2
      L4_2 = OpenedInventory
      L4_2 = L4_2[A2_2]
      L3_2(L4_2)
    end
    L1_1(L2_1, L3_1)
  end
end
L1_1 = Config
L1_1 = L1_1.Framework
if "ESX" == L1_1 then
  L1_1 = ESX
  L1_1 = L1_1.RegisterServerCallback
  L2_1 = "inventory:server:IdCard"
  function L3_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2
    L2_2 = QS
    L2_2 = L2_2.GetPlayerFromId
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = ESX
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = {}
    L5_2 = L2_2.PlayerData
    L5_2 = L5_2.firstname
    L4_2.firstname = L5_2
    L5_2 = L2_2.PlayerData
    L5_2 = L5_2.lastname
    L4_2.lastname = L5_2
    L5_2 = L2_2.PlayerData
    L5_2 = L5_2.dateofbirth
    L4_2.birthdate = L5_2
    L5_2 = L2_2.PlayerData
    L5_2 = L5_2.sex
    L4_2.gender = L5_2
    L5_2 = A1_2
    L6_2 = L4_2
    L5_2(L6_2)
  end
  L1_1(L2_1, L3_1)
else
  L1_1 = Config
  L1_1 = L1_1.Framework
  if "QBCore" == L1_1 then
    L1_1 = QBCore
    L1_1 = L1_1.Functions
    L1_1 = L1_1.CreateCallback
    L2_1 = "inventory:server:IdCard"
    function L3_1(A0_2, A1_2)
      local L2_2, L3_2, L4_2, L5_2, L6_2
      L2_2 = QBCore
      L2_2 = L2_2.Functions
      L2_2 = L2_2.GetPlayer
      L3_2 = A0_2
      L2_2 = L2_2(L3_2)
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L4_2 = {}
      L5_2 = L2_2.PlayerData
      L5_2 = L5_2.firstname
      L4_2.firstname = L5_2
      L5_2 = L2_2.PlayerData
      L5_2 = L5_2.lastname
      L4_2.lastname = L5_2
      L5_2 = L2_2.PlayerData
      L5_2 = L5_2.dateofbirth
      L4_2.birthdate = L5_2
      L5_2 = L2_2.PlayerData
      L5_2 = L5_2.sex
      L4_2.gender = L5_2
      L5_2 = A1_2
      L6_2 = L4_2
      L5_2(L6_2)
    end
    L1_1(L2_1, L3_1)
  end
end
L1_1 = Config
L1_1 = L1_1.Framework
if "ESX" == L1_1 then
  L1_1 = ESX
  L1_1 = L1_1.RegisterServerCallback
  L2_1 = "inventory:server:WeaponLicense"
  function L3_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2
    L2_2 = QS
    L2_2 = L2_2.GetPlayerFromId
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = ESX
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = {}
    L5_2 = L2_2.PlayerData
    L5_2 = L5_2.firstname
    L4_2.name = L5_2
    L5_2 = L2_2.PlayerData
    L5_2 = L5_2.lastname
    L4_2.lastname = L5_2
    L5_2 = L2_2.PlayerData
    L5_2 = L5_2.sex
    L4_2.gender = L5_2
    L5_2 = L2_2.PlayerData
    L5_2 = L5_2.dateofbirth
    L4_2.dateofbirth = L5_2
    L5_2 = A1_2
    L6_2 = L4_2
    L5_2(L6_2)
  end
  L1_1(L2_1, L3_1)
end
L1_1 = AddEventHandler
L2_1 = "clearinventory:command"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2
  L3_2 = A1_2
  L4_2 = Config
  L4_2 = L4_2.Framework
  if "ESX" == L4_2 then
    if L3_2 then
      L4_2 = L3_2[1]
      if L4_2 then
        L4_2 = tonumber
        L5_2 = L3_2[1]
        L4_2 = L4_2(L5_2)
        if L4_2 then
          L4_2 = QS
          L4_2 = L4_2.GetPlayerFromId
          L5_2 = tonumber
          L6_2 = L3_2[1]
          L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
          if L4_2 then
            L5_2 = L4_2.ClearInventory
            L5_2()
            L5_2 = print
            L6_2 = "Inventory of ID: "
            L7_2 = L3_2[1]
            L8_2 = " deleted"
            L6_2 = L6_2 .. L7_2 .. L8_2
            L5_2(L6_2)
          end
        end
    end
    else
      L4_2 = QS
      L4_2 = L4_2.GetPlayerFromId
      L5_2 = L2_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L5_2 = L4_2.ClearInventory
        L5_2()
        L5_2 = print
        L6_2 = "Own Inventory ID: "
        L7_2 = L2_2
        L8_2 = " deleted"
        L6_2 = L6_2 .. L7_2 .. L8_2
        L5_2(L6_2)
      end
    end
  else
    L4_2 = Config
    L4_2 = L4_2.Framework
    if "QBCore" == L4_2 then
      if L3_2 then
        L4_2 = L3_2[1]
        if L4_2 then
          L4_2 = tonumber
          L5_2 = L3_2[1]
          L4_2 = L4_2(L5_2)
          if L4_2 then
            L4_2 = QBCore
            L4_2 = L4_2.Functions
            L4_2 = L4_2.GetPlayer
            L5_2 = tonumber
            L6_2 = L3_2[1]
            L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
            L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
            if L4_2 then
              L5_2 = L4_2.Functions
              L5_2 = L5_2.ClearInventory
              L5_2()
              L5_2 = print
              L6_2 = "Inventory of ID: "
              L7_2 = L3_2[1]
              L8_2 = " deleted"
              L6_2 = L6_2 .. L7_2 .. L8_2
              L5_2(L6_2)
            end
          end
      end
      else
        L4_2 = QBCore
        L4_2 = L4_2.Functions
        L4_2 = L4_2.GetPlayer
        L5_2 = L2_2
        L4_2 = L4_2(L5_2)
        if L4_2 then
          L5_2 = L4_2.Functions
          L5_2 = L5_2.ClearInventory
          L5_2()
          L5_2 = print
          L6_2 = "Own Inventory ID: "
          L7_2 = L2_2
          L8_2 = " deleted"
          L6_2 = L6_2 .. L7_2 .. L8_2
          L5_2(L6_2)
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = AddEventHandler
L2_1 = "giveweapon:command"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = Config
  L1_2 = L1_2.Framework
  if "ESX" == L1_2 then
    L1_2 = QS
    L1_2 = L1_2.GetPlayerFromId
    L2_2 = A0_2.player
    L1_2 = L1_2(L2_2)
    L2_2 = tonumber
    L3_2 = A0_2.ammo
    L2_2 = L2_2(L3_2)
    L3_2 = QS
    L3_2 = L3_2.Shared
    L3_2 = L3_2.Items
    L4_2 = tostring
    L5_2 = A0_2.weapon
    L4_2 = L4_2(L5_2)
    L5_2 = L4_2
    L4_2 = L4_2.lower
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    if nil ~= L1_2 then
      if L2_2 and L2_2 > 0 then
        if nil ~= L3_2 then
          L4_2 = {}
          L5_2 = L3_2.type
          if "item" == L5_2 then
            L5_2 = TriggerClientEvent
            L6_2 = "qs-inventory:sendMessage"
            L7_2 = A0_2.player
            L8_2 = Lang
            L9_2 = "COMMAND_EXCLUSIVE_WEAPONS"
            L8_2 = L8_2(L9_2)
            L9_2 = "error"
            L5_2(L6_2, L7_2, L8_2, L9_2)
            return
          else
            L5_2 = L3_2.type
            if "weapon" == L5_2 then
              L2_2 = 1
              L5_2 = tostring
              L6_2 = QS
              L6_2 = L6_2.Shared
              L6_2 = L6_2.RandomInt
              L7_2 = 2
              L6_2 = L6_2(L7_2)
              L7_2 = QS
              L7_2 = L7_2.Shared
              L7_2 = L7_2.RandomStr
              L8_2 = 3
              L7_2 = L7_2(L8_2)
              L8_2 = QS
              L8_2 = L8_2.Shared
              L8_2 = L8_2.RandomInt
              L9_2 = 1
              L8_2 = L8_2(L9_2)
              L9_2 = QS
              L9_2 = L9_2.Shared
              L9_2 = L9_2.RandomStr
              L10_2 = 2
              L9_2 = L9_2(L10_2)
              L10_2 = QS
              L10_2 = L10_2.Shared
              L10_2 = L10_2.RandomInt
              L11_2 = 3
              L10_2 = L10_2(L11_2)
              L11_2 = QS
              L11_2 = L11_2.Shared
              L11_2 = L11_2.RandomStr
              L12_2 = 4
              L11_2 = L11_2(L12_2)
              L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
              L5_2 = L5_2(L6_2)
              L4_2.serie = L5_2
              L5_2 = A0_2.ammo
              L4_2.ammo = L5_2
            end
          end
          L5_2 = L1_2.addItem
          L6_2 = L3_2.name
          L7_2 = L2_2
          L8_2 = false
          L9_2 = L4_2
          L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
          if L5_2 then
            L5_2 = TriggerClientEvent
            L6_2 = "inventory:client:ItemBox"
            L7_2 = A0_2.player
            L8_2 = QS
            L8_2 = L8_2.Shared
            L8_2 = L8_2.Items
            L9_2 = L3_2.name
            L8_2 = L8_2[L9_2]
            L9_2 = "add"
            L5_2(L6_2, L7_2, L8_2, L9_2)
            L5_2 = TriggerClientEvent
            L6_2 = "qs-inventory:sendMessage"
            L7_2 = A0_2.player
            L8_2 = Lang
            L9_2 = "INVENTORY_GIVE_SUCCESS"
            L8_2 = L8_2(L9_2)
            L9_2 = L3_2.name
            L10_2 = " x"
            L11_2 = L2_2
            L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
            L9_2 = "sucess"
            L5_2(L6_2, L7_2, L8_2, L9_2)
          else
            L5_2 = TriggerClientEvent
            L6_2 = "qs-inventory:sendMessage"
            L7_2 = A0_2.player
            L8_2 = Lang
            L9_2 = "SEND_ERROR"
            L8_2 = L8_2(L9_2)
            L9_2 = "error"
            L5_2(L6_2, L7_2, L8_2, L9_2)
          end
        else
          L4_2 = TriggerClientEvent
          L5_2 = "qs-inventory:sendMessage"
          L6_2 = A0_2.player
          L7_2 = Lang
          L8_2 = "INVALID_ITEM"
          L7_2 = L7_2(L8_2)
          L8_2 = "error"
          L4_2(L5_2, L6_2, L7_2, L8_2)
        end
      else
        L4_2 = TriggerClientEvent
        L5_2 = "qs-inventory:sendMessage"
        L6_2 = A0_2.player
        L7_2 = Lang
        L8_2 = "INVENTORY_QUANTITY"
        L7_2 = L7_2(L8_2)
        L8_2 = "error"
        L4_2(L5_2, L6_2, L7_2, L8_2)
      end
    else
      L4_2 = TriggerClientEvent
      L5_2 = "qs-inventory:sendMessage"
      L6_2 = A0_2.player
      L7_2 = Lang
      L8_2 = "PLAYER_NOT_EXIST"
      L7_2 = L7_2(L8_2)
      L8_2 = "error"
      L4_2(L5_2, L6_2, L7_2, L8_2)
    end
  else
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = A0_2[1]
      L2_2 = QBCore
      L2_2 = L2_2.Functions
      L2_2 = L2_2.GetPlayer
      L3_2 = tonumber
      L4_2 = L1_2
      L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L3_2(L4_2)
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L3_2 = tonumber
      L4_2 = A0_2[3]
      L3_2 = L3_2(L4_2)
      L4_2 = QBCore
      L4_2 = L4_2.Shared
      L4_2 = L4_2.Items
      L5_2 = tostring
      L6_2 = A0_2[2]
      L5_2 = L5_2(L6_2)
      L6_2 = L5_2
      L5_2 = L5_2.lower
      L5_2 = L5_2(L6_2)
      L4_2 = L4_2[L5_2]
      if nil ~= L2_2 then
        if L3_2 and L3_2 > 0 then
          if nil ~= L4_2 then
            L5_2 = {}
            L6_2 = L4_2.type
            if "item" == L6_2 then
              L6_2 = TriggerClientEvent
              L7_2 = "qs-inventory:sendMessage"
              L8_2 = L1_2
              L9_2 = Lang
              L10_2 = "COMMAND_EXCLUSIVE_WEAPONS"
              L9_2 = L9_2(L10_2)
              L10_2 = "error"
              L6_2(L7_2, L8_2, L9_2, L10_2)
              return
            else
              L6_2 = L4_2.type
              if "weapon" == L6_2 then
                L3_2 = 1
                L6_2 = tostring
                L7_2 = QBCore
                L7_2 = L7_2.Shared
                L7_2 = L7_2.RandomInt
                L8_2 = 2
                L7_2 = L7_2(L8_2)
                L8_2 = QBCore
                L8_2 = L8_2.Shared
                L8_2 = L8_2.RandomStr
                L9_2 = 3
                L8_2 = L8_2(L9_2)
                L9_2 = QBCore
                L9_2 = L9_2.Shared
                L9_2 = L9_2.RandomInt
                L10_2 = 1
                L9_2 = L9_2(L10_2)
                L10_2 = QBCore
                L10_2 = L10_2.Shared
                L10_2 = L10_2.RandomStr
                L11_2 = 2
                L10_2 = L10_2(L11_2)
                L11_2 = QBCore
                L11_2 = L11_2.Shared
                L11_2 = L11_2.RandomInt
                L12_2 = 3
                L11_2 = L11_2(L12_2)
                L12_2 = QBCore
                L12_2 = L12_2.Shared
                L12_2 = L12_2.RandomStr
                L13_2 = 4
                L12_2 = L12_2(L13_2)
                L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
                L6_2 = L6_2(L7_2)
                L5_2.serie = L6_2
                L6_2 = A0_2[3]
                L5_2.ammo = L6_2
              end
            end
            L6_2 = L2_2.Functions
            L6_2 = L6_2.AddItem
            L7_2 = L4_2.name
            L8_2 = L3_2
            L9_2 = false
            L10_2 = L5_2
            L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
            if L6_2 then
              L6_2 = TriggerClientEvent
              L7_2 = "inventory:client:ItemBox"
              L8_2 = L1_2
              L9_2 = QBCore
              L9_2 = L9_2.Shared
              L9_2 = L9_2.Items
              L10_2 = L4_2.name
              L9_2 = L9_2[L10_2]
              L10_2 = "add"
              L6_2(L7_2, L8_2, L9_2, L10_2)
              L6_2 = TriggerClientEvent
              L7_2 = "qs-inventory:sendMessage"
              L8_2 = L1_2
              L9_2 = Lang
              L10_2 = "INVENTORY_GIVE_SUCCESS"
              L9_2 = L9_2(L10_2)
              L10_2 = L4_2.name
              L11_2 = " x"
              L12_2 = L3_2
              L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2
              L10_2 = "sucess"
              L6_2(L7_2, L8_2, L9_2, L10_2)
            else
              L6_2 = TriggerClientEvent
              L7_2 = "qs-inventory:sendMessage"
              L8_2 = L1_2
              L9_2 = Lang
              L10_2 = "SEND_ERROR"
              L9_2 = L9_2(L10_2)
              L10_2 = "error"
              L6_2(L7_2, L8_2, L9_2, L10_2)
            end
          else
            L5_2 = TriggerClientEvent
            L6_2 = "qs-inventory:sendMessage"
            L7_2 = L1_2
            L8_2 = Lang
            L9_2 = "INVALID_ITEM"
            L8_2 = L8_2(L9_2)
            L9_2 = "error"
            L5_2(L6_2, L7_2, L8_2, L9_2)
          end
        else
          L5_2 = TriggerClientEvent
          L6_2 = "qs-inventory:sendMessage"
          L7_2 = L1_2
          L8_2 = Lang
          L9_2 = "INVENTORY_QUANTITY"
          L8_2 = L8_2(L9_2)
          L9_2 = "error"
          L5_2(L6_2, L7_2, L8_2, L9_2)
        end
      else
        L5_2 = TriggerClientEvent
        L6_2 = "qs-inventory:sendMessage"
        L7_2 = L1_2
        L8_2 = Lang
        L9_2 = "PLAYER_NOT_EXIST"
        L8_2 = L8_2(L9_2)
        L9_2 = "error"
        L5_2(L6_2, L7_2, L8_2, L9_2)
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = AddEventHandler
L2_1 = "giveweaponcolor:command"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = Config
  L1_2 = L1_2.Framework
  if "ESX" == L1_2 then
    L1_2 = QS
    L1_2 = L1_2.GetPlayerFromId
    L2_2 = A0_2.player
    L1_2 = L1_2(L2_2)
    L2_2 = tonumber
    L3_2 = A0_2.ammo
    L2_2 = L2_2(L3_2)
    L3_2 = A0_2.color
    L4_2 = QS
    L4_2 = L4_2.Shared
    L4_2 = L4_2.Items
    L5_2 = tostring
    L6_2 = A0_2.weapon
    L5_2 = L5_2(L6_2)
    L6_2 = L5_2
    L5_2 = L5_2.lower
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2[L5_2]
    if nil ~= L1_2 then
      if L2_2 and L2_2 > 0 then
        if nil ~= L4_2 then
          L5_2 = {}
          L6_2 = L4_2.type
          if "item" == L6_2 then
            L6_2 = TriggerClientEvent
            L7_2 = "qs-inventory:sendMessage"
            L8_2 = A0_2.player
            L9_2 = Lang
            L10_2 = "COMMAND_EXCLUSIVE_WEAPONS"
            L9_2 = L9_2(L10_2)
            L10_2 = "error"
            L6_2(L7_2, L8_2, L9_2, L10_2)
            return
          else
            L6_2 = L4_2.type
            if "weapon" == L6_2 then
              L6_2 = Config
              L6_2 = L6_2.WeaponAttachments
              L7_2 = tostring
              L8_2 = A0_2.weapon
              L7_2 = L7_2(L8_2)
              L8_2 = L7_2
              L7_2 = L7_2.upper
              L7_2 = L7_2(L8_2)
              L6_2 = L6_2[L7_2]
              if L6_2 then
                L2_2 = 1
                L7_2 = tostring
                L8_2 = QS
                L8_2 = L8_2.Shared
                L8_2 = L8_2.RandomInt
                L9_2 = 2
                L8_2 = L8_2(L9_2)
                L9_2 = QS
                L9_2 = L9_2.Shared
                L9_2 = L9_2.RandomStr
                L10_2 = 3
                L9_2 = L9_2(L10_2)
                L10_2 = QS
                L10_2 = L10_2.Shared
                L10_2 = L10_2.RandomInt
                L11_2 = 1
                L10_2 = L10_2(L11_2)
                L11_2 = QS
                L11_2 = L11_2.Shared
                L11_2 = L11_2.RandomStr
                L12_2 = 2
                L11_2 = L11_2(L12_2)
                L12_2 = QS
                L12_2 = L12_2.Shared
                L12_2 = L12_2.RandomInt
                L13_2 = 3
                L12_2 = L12_2(L13_2)
                L13_2 = QS
                L13_2 = L13_2.Shared
                L13_2 = L13_2.RandomStr
                L14_2 = 4
                L13_2 = L13_2(L14_2)
                L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
                L7_2 = L7_2(L8_2)
                L5_2.serie = L7_2
                L7_2 = A0_2.ammo
                L5_2.ammo = L7_2
                if "green" == L3_2 then
                  L6_2 = L6_2.weaponcolor1
                  if L6_2 then
                    L7_2 = {}
                    L8_2 = {}
                    L8_2.component = "weaponcolor1"
                    L8_2.urltint = "none"
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L7_2[1] = L8_2
                    L5_2.attachments = L7_2
                  else
                    L7_2 = TriggerClientEvent
                    L8_2 = "qs-inventory:sendMessage"
                    L9_2 = target
                    L10_2 = Lang
                    L11_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                    L10_2 = L10_2(L11_2)
                    L11_2 = "error"
                    L7_2(L8_2, L9_2, L10_2, L11_2)
                    return
                  end
                elseif "gold" == L3_2 then
                  L6_2 = L6_2.weaponcolor2
                  if L6_2 then
                    L7_2 = {}
                    L8_2 = {}
                    L8_2.component = "weaponcolor2"
                    L8_2.urltint = "none"
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L7_2[1] = L8_2
                    L5_2.attachments = L7_2
                  else
                    L7_2 = TriggerClientEvent
                    L8_2 = "qs-inventory:sendMessage"
                    L9_2 = target
                    L10_2 = Lang
                    L11_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                    L10_2 = L10_2(L11_2)
                    L11_2 = "error"
                    L7_2(L8_2, L9_2, L10_2, L11_2)
                    return
                  end
                elseif "pink" == L3_2 then
                  L6_2 = L6_2.weaponcolor3
                  if L6_2 then
                    L7_2 = {}
                    L8_2 = {}
                    L8_2.component = "weaponcolor3"
                    L8_2.urltint = "none"
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L7_2[1] = L8_2
                    L5_2.attachments = L7_2
                  else
                    L7_2 = TriggerClientEvent
                    L8_2 = "qs-inventory:sendMessage"
                    L9_2 = target
                    L10_2 = Lang
                    L11_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                    L10_2 = L10_2(L11_2)
                    L11_2 = "error"
                    L7_2(L8_2, L9_2, L10_2, L11_2)
                    return
                  end
                elseif "army" == L3_2 then
                  L6_2 = L6_2.weaponcolor4
                  if L6_2 then
                    L7_2 = {}
                    L8_2 = {}
                    L8_2.component = "weaponcolor4"
                    L8_2.urltint = "none"
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L7_2[1] = L8_2
                    L5_2.attachments = L7_2
                  else
                    L7_2 = TriggerClientEvent
                    L8_2 = "qs-inventory:sendMessage"
                    L9_2 = target
                    L10_2 = Lang
                    L11_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                    L10_2 = L10_2(L11_2)
                    L11_2 = "error"
                    L7_2(L8_2, L9_2, L10_2, L11_2)
                    return
                  end
                elseif "lspd" == L3_2 then
                  L6_2 = L6_2.weaponcolor5
                  if L6_2 then
                    L7_2 = {}
                    L8_2 = {}
                    L8_2.component = "weaponcolor5"
                    L8_2.urltint = "none"
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L7_2[1] = L8_2
                    L5_2.attachments = L7_2
                  else
                    L7_2 = TriggerClientEvent
                    L8_2 = "qs-inventory:sendMessage"
                    L9_2 = target
                    L10_2 = Lang
                    L11_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                    L10_2 = L10_2(L11_2)
                    L11_2 = "error"
                    L7_2(L8_2, L9_2, L10_2, L11_2)
                    return
                  end
                elseif "orange" == L3_2 then
                  L6_2 = L6_2.weaponcolor6
                  if L6_2 then
                    L7_2 = {}
                    L8_2 = {}
                    L8_2.component = "weaponcolor6"
                    L8_2.urltint = "none"
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L7_2[1] = L8_2
                    L5_2.attachments = L7_2
                  else
                    L7_2 = TriggerClientEvent
                    L8_2 = "qs-inventory:sendMessage"
                    L9_2 = target
                    L10_2 = Lang
                    L11_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                    L10_2 = L10_2(L11_2)
                    L11_2 = "error"
                    L7_2(L8_2, L9_2, L10_2, L11_2)
                    return
                  end
                elseif "platinum" == L3_2 then
                  L6_2 = L6_2.weaponcolor7
                  if L6_2 then
                    L7_2 = {}
                    L8_2 = {}
                    L8_2.component = "weaponcolor7"
                    L8_2.urltint = "none"
                    L9_2 = L6_2.label
                    L8_2.label = L9_2
                    L7_2[1] = L8_2
                    L5_2.attachments = L7_2
                  else
                    L7_2 = TriggerClientEvent
                    L8_2 = "qs-inventory:sendMessage"
                    L9_2 = target
                    L10_2 = Lang
                    L11_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                    L10_2 = L10_2(L11_2)
                    L11_2 = "error"
                    L7_2(L8_2, L9_2, L10_2, L11_2)
                    return
                  end
                else
                  L7_2 = TriggerClientEvent
                  L8_2 = "qs-inventory:sendMessage"
                  L9_2 = target
                  L10_2 = Lang
                  L11_2 = "WEAPON_TINT_ERROR_MESSAGE"
                  L10_2 = L10_2(L11_2)
                  L11_2 = "error"
                  L7_2(L8_2, L9_2, L10_2, L11_2)
                  return
                end
              else
                return
              end
            end
          end
          L6_2 = L1_2.addItem
          L7_2 = L4_2.name
          L8_2 = L2_2
          L9_2 = false
          L10_2 = L5_2
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
          if L6_2 then
            L6_2 = TriggerClientEvent
            L7_2 = "inventory:client:ItemBox"
            L8_2 = A0_2.player
            L9_2 = QS
            L9_2 = L9_2.Shared
            L9_2 = L9_2.Items
            L10_2 = L4_2.name
            L9_2 = L9_2[L10_2]
            L10_2 = "add"
            L6_2(L7_2, L8_2, L9_2, L10_2)
            L6_2 = TriggerClientEvent
            L7_2 = "qs-inventory:sendMessage"
            L8_2 = A0_2.player
            L9_2 = Lang
            L10_2 = "INVENTORY_GIVE_SUCCESS"
            L9_2 = L9_2(L10_2)
            L10_2 = L4_2.name
            L11_2 = " x"
            L12_2 = L2_2
            L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2
            L10_2 = "sucess"
            L6_2(L7_2, L8_2, L9_2, L10_2)
          end
        else
          L5_2 = TriggerClientEvent
          L6_2 = "qs-inventory:sendMessage"
          L7_2 = A0_2.player
          L8_2 = Lang
          L9_2 = "INVALID_ITEM"
          L8_2 = L8_2(L9_2)
          L9_2 = "error"
          L5_2(L6_2, L7_2, L8_2, L9_2)
        end
      else
        L5_2 = TriggerClientEvent
        L6_2 = "qs-inventory:sendMessage"
        L7_2 = A0_2.player
        L8_2 = Lang
        L9_2 = "INVENTORY_QUANTITY"
        L8_2 = L8_2(L9_2)
        L9_2 = "error"
        L5_2(L6_2, L7_2, L8_2, L9_2)
      end
    else
      L5_2 = TriggerClientEvent
      L6_2 = "qs-inventory:sendMessage"
      L7_2 = A0_2.player
      L8_2 = Lang
      L9_2 = "PLAYER_NOT_EXIST"
      L8_2 = L8_2(L9_2)
      L9_2 = "error"
      L5_2(L6_2, L7_2, L8_2, L9_2)
    end
  else
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = A0_2[1]
      L2_2 = QBCore
      L2_2 = L2_2.Functions
      L2_2 = L2_2.GetPlayer
      L3_2 = tonumber
      L4_2 = L1_2
      L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L3_2(L4_2)
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      L3_2 = tonumber
      L4_2 = A0_2[3]
      L3_2 = L3_2(L4_2)
      L4_2 = A0_2[4]
      L5_2 = QBCore
      L5_2 = L5_2.Shared
      L5_2 = L5_2.Items
      L6_2 = tostring
      L7_2 = A0_2[2]
      L6_2 = L6_2(L7_2)
      L7_2 = L6_2
      L6_2 = L6_2.lower
      L6_2 = L6_2(L7_2)
      L5_2 = L5_2[L6_2]
      if nil ~= L2_2 then
        if L3_2 and L3_2 > 0 then
          if nil ~= L5_2 then
            L6_2 = {}
            L7_2 = L5_2.type
            if "item" == L7_2 then
              L7_2 = TriggerClientEvent
              L8_2 = "qs-inventory:sendMessage"
              L9_2 = L1_2
              L10_2 = Lang
              L11_2 = "COMMAND_EXCLUSIVE_WEAPONS"
              L10_2 = L10_2(L11_2)
              L11_2 = "error"
              L7_2(L8_2, L9_2, L10_2, L11_2)
              return
            else
              L7_2 = L5_2.type
              if "weapon" == L7_2 then
                L7_2 = Config
                L7_2 = L7_2.WeaponAttachments
                L8_2 = tostring
                L9_2 = A0_2[2]
                L8_2 = L8_2(L9_2)
                L9_2 = L8_2
                L8_2 = L8_2.upper
                L8_2 = L8_2(L9_2)
                L7_2 = L7_2[L8_2]
                if L7_2 then
                  L3_2 = 1
                  L8_2 = tostring
                  L9_2 = QBCore
                  L9_2 = L9_2.Shared
                  L9_2 = L9_2.RandomInt
                  L10_2 = 2
                  L9_2 = L9_2(L10_2)
                  L10_2 = QBCore
                  L10_2 = L10_2.Shared
                  L10_2 = L10_2.RandomStr
                  L11_2 = 3
                  L10_2 = L10_2(L11_2)
                  L11_2 = QBCore
                  L11_2 = L11_2.Shared
                  L11_2 = L11_2.RandomInt
                  L12_2 = 1
                  L11_2 = L11_2(L12_2)
                  L12_2 = QBCore
                  L12_2 = L12_2.Shared
                  L12_2 = L12_2.RandomStr
                  L13_2 = 2
                  L12_2 = L12_2(L13_2)
                  L13_2 = QBCore
                  L13_2 = L13_2.Shared
                  L13_2 = L13_2.RandomInt
                  L14_2 = 3
                  L13_2 = L13_2(L14_2)
                  L14_2 = QBCore
                  L14_2 = L14_2.Shared
                  L14_2 = L14_2.RandomStr
                  L15_2 = 4
                  L14_2 = L14_2(L15_2)
                  L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2
                  L8_2 = L8_2(L9_2)
                  L6_2.serie = L8_2
                  L8_2 = A0_2[3]
                  L6_2.ammo = L8_2
                  if "green" == L4_2 then
                    L7_2 = L7_2.weaponcolor1
                    if L7_2 then
                      L8_2 = {}
                      L9_2 = {}
                      L9_2.component = "weaponcolor1"
                      L9_2.urltint = "none"
                      L10_2 = L7_2.label
                      L9_2.label = L10_2
                      L8_2[1] = L9_2
                      L6_2.attachments = L8_2
                    else
                      L8_2 = TriggerClientEvent
                      L9_2 = "qs-inventory:sendMessage"
                      L10_2 = L1_2
                      L11_2 = Lang
                      L12_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                      L11_2 = L11_2(L12_2)
                      L12_2 = "error"
                      L8_2(L9_2, L10_2, L11_2, L12_2)
                      return
                    end
                  elseif "gold" == L4_2 then
                    L7_2 = L7_2.weaponcolor2
                    if L7_2 then
                      L8_2 = {}
                      L9_2 = {}
                      L9_2.component = "weaponcolor2"
                      L9_2.urltint = "none"
                      L10_2 = L7_2.label
                      L9_2.label = L10_2
                      L8_2[1] = L9_2
                      L6_2.attachments = L8_2
                    else
                      L8_2 = TriggerClientEvent
                      L9_2 = "qs-inventory:sendMessage"
                      L10_2 = L1_2
                      L11_2 = Lang
                      L12_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                      L11_2 = L11_2(L12_2)
                      L12_2 = "error"
                      L8_2(L9_2, L10_2, L11_2, L12_2)
                      return
                    end
                  elseif "pink" == L4_2 then
                    L7_2 = L7_2.weaponcolor3
                    if L7_2 then
                      L8_2 = {}
                      L9_2 = {}
                      L9_2.component = "weaponcolor3"
                      L9_2.urltint = "none"
                      L10_2 = L7_2.label
                      L9_2.label = L10_2
                      L8_2[1] = L9_2
                      L6_2.attachments = L8_2
                    else
                      L8_2 = TriggerClientEvent
                      L9_2 = "qs-inventory:sendMessage"
                      L10_2 = L1_2
                      L11_2 = Lang
                      L12_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                      L11_2 = L11_2(L12_2)
                      L12_2 = "error"
                      L8_2(L9_2, L10_2, L11_2, L12_2)
                      return
                    end
                  elseif "army" == L4_2 then
                    L7_2 = L7_2.weaponcolor4
                    if L7_2 then
                      L8_2 = {}
                      L9_2 = {}
                      L9_2.component = "weaponcolor4"
                      L9_2.urltint = "none"
                      L10_2 = L7_2.label
                      L9_2.label = L10_2
                      L8_2[1] = L9_2
                      L6_2.attachments = L8_2
                    else
                      L8_2 = TriggerClientEvent
                      L9_2 = "qs-inventory:sendMessage"
                      L10_2 = L1_2
                      L11_2 = Lang
                      L12_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                      L11_2 = L11_2(L12_2)
                      L12_2 = "error"
                      L8_2(L9_2, L10_2, L11_2, L12_2)
                      return
                    end
                  elseif "lspd" == L4_2 then
                    L7_2 = L7_2.weaponcolor5
                    if L7_2 then
                      L8_2 = {}
                      L9_2 = {}
                      L9_2.component = "weaponcolor5"
                      L9_2.urltint = "none"
                      L10_2 = L7_2.label
                      L9_2.label = L10_2
                      L8_2[1] = L9_2
                      L6_2.attachments = L8_2
                    else
                      L8_2 = TriggerClientEvent
                      L9_2 = "qs-inventory:sendMessage"
                      L10_2 = L1_2
                      L11_2 = Lang
                      L12_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                      L11_2 = L11_2(L12_2)
                      L12_2 = "error"
                      L8_2(L9_2, L10_2, L11_2, L12_2)
                      return
                    end
                  elseif "orange" == L4_2 then
                    L7_2 = L7_2.weaponcolor6
                    if L7_2 then
                      L8_2 = {}
                      L9_2 = {}
                      L9_2.component = "weaponcolor6"
                      L9_2.urltint = "none"
                      L10_2 = L7_2.label
                      L9_2.label = L10_2
                      L8_2[1] = L9_2
                      L6_2.attachments = L8_2
                    else
                      L8_2 = TriggerClientEvent
                      L9_2 = "qs-inventory:sendMessage"
                      L10_2 = L1_2
                      L11_2 = Lang
                      L12_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                      L11_2 = L11_2(L12_2)
                      L12_2 = "error"
                      L8_2(L9_2, L10_2, L11_2, L12_2)
                      return
                    end
                  elseif "platinum" == L4_2 then
                    L7_2 = L7_2.weaponcolor7
                    if L7_2 then
                      L8_2 = {}
                      L9_2 = {}
                      L9_2.component = "weaponcolor7"
                      L9_2.urltint = "none"
                      L10_2 = L7_2.label
                      L9_2.label = L10_2
                      L8_2[1] = L9_2
                      L6_2.attachments = L8_2
                    else
                      L8_2 = TriggerClientEvent
                      L9_2 = "qs-inventory:sendMessage"
                      L10_2 = L1_2
                      L11_2 = Lang
                      L12_2 = "WEAPON_TINT_ERROR_NOT_EXIST"
                      L11_2 = L11_2(L12_2)
                      L12_2 = "error"
                      L8_2(L9_2, L10_2, L11_2, L12_2)
                      return
                    end
                  else
                    L8_2 = TriggerClientEvent
                    L9_2 = "qs-inventory:sendMessage"
                    L10_2 = L1_2
                    L11_2 = Lang
                    L12_2 = "WEAPON_TINT_ERROR_MESSAGE"
                    L11_2 = L11_2(L12_2)
                    L12_2 = "error"
                    L8_2(L9_2, L10_2, L11_2, L12_2)
                    return
                  end
                else
                  return
                end
              end
            end
            L7_2 = L2_2.Functions
            L7_2 = L7_2.AddItem
            L8_2 = L5_2.name
            L9_2 = L3_2
            L10_2 = false
            L11_2 = L6_2
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
            if L7_2 then
              L7_2 = TriggerClientEvent
              L8_2 = "inventory:client:ItemBox"
              L9_2 = L1_2
              L10_2 = QBCore
              L10_2 = L10_2.Shared
              L10_2 = L10_2.Items
              L11_2 = L5_2.name
              L10_2 = L10_2[L11_2]
              L11_2 = "add"
              L7_2(L8_2, L9_2, L10_2, L11_2)
              L7_2 = TriggerClientEvent
              L8_2 = "qs-inventory:sendMessage"
              L9_2 = L1_2
              L10_2 = Lang
              L11_2 = "INVENTORY_GIVE_SUCCESS"
              L10_2 = L10_2(L11_2)
              L11_2 = L5_2.name
              L12_2 = " x"
              L13_2 = L3_2
              L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2
              L11_2 = "sucess"
              L7_2(L8_2, L9_2, L10_2, L11_2)
            end
          else
            L6_2 = TriggerClientEvent
            L7_2 = "qs-inventory:sendMessage"
            L8_2 = L1_2
            L9_2 = Lang
            L10_2 = "INVALID_ITEM"
            L9_2 = L9_2(L10_2)
            L10_2 = "error"
            L6_2(L7_2, L8_2, L9_2, L10_2)
          end
        else
          L6_2 = TriggerClientEvent
          L7_2 = "qs-inventory:sendMessage"
          L8_2 = L1_2
          L9_2 = Lang
          L10_2 = "INVENTORY_QUANTITY"
          L9_2 = L9_2(L10_2)
          L10_2 = "error"
          L6_2(L7_2, L8_2, L9_2, L10_2)
        end
      else
        L6_2 = TriggerClientEvent
        L7_2 = "qs-inventory:sendMessage"
        L8_2 = L1_2
        L9_2 = Lang
        L10_2 = "PLAYER_NOT_EXIST"
        L9_2 = L9_2(L10_2)
        L10_2 = "error"
        L6_2(L7_2, L8_2, L9_2, L10_2)
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = AddEventHandler
L2_1 = "giveitem:command"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = Config
  L1_2 = L1_2.Framework
  if "ESX" == L1_2 then
    L1_2 = ESX
    L1_2 = L1_2.GetPlayerFromId
    L2_2 = A0_2.player
    L1_2 = L1_2(L2_2)
    L2_2 = QS
    L2_2 = L2_2.GetPlayerFromId
    L3_2 = A0_2.player
    L2_2 = L2_2(L3_2)
    L3_2 = tonumber
    L4_2 = A0_2.count
    L3_2 = L3_2(L4_2)
    L4_2 = QS
    L4_2 = L4_2.Shared
    L4_2 = L4_2.Items
    L5_2 = tostring
    L6_2 = A0_2.item
    L5_2 = L5_2(L6_2)
    L6_2 = L5_2
    L5_2 = L5_2.lower
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2[L5_2]
    L5_2 = A0_2.item
    if "pokemon_card" == L5_2 then
      L5_2 = TriggerClientEvent
      L6_2 = "qs-inventory:sendMessage"
      L7_2 = A0_2.player
      L8_2 = "The item pokemon_card cannot be gived."
      L9_2 = "error"
      L5_2(L6_2, L7_2, L8_2, L9_2)
      return
    end
    if nil ~= L2_2 and nil ~= L1_2 then
      L5_2 = MySQL
      L5_2 = L5_2.Sync
      L5_2 = L5_2.fetchAll
      L6_2 = "SELECT * FROM users WHERE identifier = @identifier"
      L7_2 = {}
      L8_2 = L1_2.identifier
      L7_2["@identifier"] = L8_2
      L5_2 = L5_2(L6_2, L7_2)
      if L3_2 > 0 then
        if nil ~= L4_2 then
          L6_2 = {}
          L7_2 = L4_2.name
          if "id_card" == L7_2 then
            L7_2 = L5_2[1]
            L7_2 = L7_2.firstname
            L6_2.firstname = L7_2
            L7_2 = L5_2[1]
            L7_2 = L7_2.lastname
            L6_2.lastname = L7_2
            L7_2 = L5_2[1]
            L7_2 = L7_2.dateofbirth
            L6_2.birthdate = L7_2
            L7_2 = L5_2[1]
            L7_2 = L7_2.sex
            L6_2.gender = L7_2
          else
            L7_2 = L4_2.name
            if "weapon_license" == L7_2 then
              L7_2 = {}
              L8_2 = L5_2[1]
              L8_2 = L8_2.firstname
              L7_2.name = L8_2
              L8_2 = L5_2[1]
              L8_2 = L8_2.lastname
              L7_2.lastname = L8_2
              L8_2 = L5_2[1]
              L8_2 = L8_2.sex
              L7_2.gender = L8_2
              L8_2 = L5_2[1]
              L8_2 = L8_2.dateofbirth
              L7_2.dateofbirth = L8_2
              L6_2 = L7_2
            else
              L7_2 = L4_2.type
              if "weapon" == L7_2 then
                L3_2 = 1
                L7_2 = tostring
                L8_2 = QS
                L8_2 = L8_2.Shared
                L8_2 = L8_2.RandomInt
                L9_2 = 2
                L8_2 = L8_2(L9_2)
                L9_2 = QS
                L9_2 = L9_2.Shared
                L9_2 = L9_2.RandomStr
                L10_2 = 3
                L9_2 = L9_2(L10_2)
                L10_2 = QS
                L10_2 = L10_2.Shared
                L10_2 = L10_2.RandomInt
                L11_2 = 1
                L10_2 = L10_2(L11_2)
                L11_2 = QS
                L11_2 = L11_2.Shared
                L11_2 = L11_2.RandomStr
                L12_2 = 2
                L11_2 = L11_2(L12_2)
                L12_2 = QS
                L12_2 = L12_2.Shared
                L12_2 = L12_2.RandomInt
                L13_2 = 3
                L12_2 = L12_2(L13_2)
                L13_2 = QS
                L13_2 = L13_2.Shared
                L13_2 = L13_2.RandomStr
                L14_2 = 4
                L13_2 = L13_2(L14_2)
                L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
                L7_2 = L7_2(L8_2)
                L6_2.serie = L7_2
              else
                L7_2 = L4_2.name
                if "markedbills" == L7_2 then
                  L7_2 = math
                  L7_2 = L7_2.random
                  L8_2 = 5000
                  L9_2 = 10000
                  L7_2 = L7_2(L8_2, L9_2)
                  L6_2.worth = L7_2
                else
                  L7_2 = L4_2.name
                  if "backpack" == L7_2 then
                    L7_2 = math
                    L7_2 = L7_2.random
                    L8_2 = 11111
                    L9_2 = 99999
                    L7_2 = L7_2(L8_2, L9_2)
                    L6_2.bagid = L7_2
                  else
                    L7_2 = L4_2.name
                    if "game_ticket" == L7_2 then
                      L7_2 = {}
                      L7_2.type = "game_ticket"
                      L8_2 = math
                      L8_2 = L8_2.random
                      L9_2 = 11111111
                      L10_2 = 99999999
                      L8_2 = L8_2(L9_2, L10_2)
                      L7_2.cardnumber = L8_2
                      L6_2 = L7_2
                    end
                  end
                end
              end
            end
          end
          L7_2 = L2_2.addItem
          L8_2 = L4_2.name
          L9_2 = L3_2
          L10_2 = false
          L11_2 = L6_2
          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
          if L7_2 then
            L7_2 = TriggerClientEvent
            L8_2 = "inventory:client:ItemBox"
            L9_2 = A0_2.player
            L10_2 = QS
            L10_2 = L10_2.Shared
            L10_2 = L10_2.Items
            L11_2 = L4_2.name
            L10_2 = L10_2[L11_2]
            L11_2 = "add"
            L7_2(L8_2, L9_2, L10_2, L11_2)
            L7_2 = TriggerClientEvent
            L8_2 = "qs-inventory:sendMessage"
            L9_2 = A0_2.player
            L10_2 = Lang
            L11_2 = "INVENTORY_GIVE_SUCCESS"
            L10_2 = L10_2(L11_2)
            L11_2 = L4_2.name
            L12_2 = " x"
            L13_2 = L3_2
            L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2
            L11_2 = "sucess"
            L7_2(L8_2, L9_2, L10_2, L11_2)
          else
            L7_2 = TriggerClientEvent
            L8_2 = "qs-inventory:sendMessage"
            L9_2 = A0_2.player
            L10_2 = Lang
            L11_2 = "SEND_ERROR"
            L10_2 = L10_2(L11_2)
            L11_2 = "error"
            L7_2(L8_2, L9_2, L10_2, L11_2)
          end
        else
          L6_2 = TriggerClientEvent
          L7_2 = "qs-inventory:sendMessage"
          L8_2 = A0_2.player
          L9_2 = Lang
          L10_2 = "INVALID_ITEM"
          L9_2 = L9_2(L10_2)
          L10_2 = "error"
          L6_2(L7_2, L8_2, L9_2, L10_2)
        end
      else
        L6_2 = TriggerClientEvent
        L7_2 = "qs-inventory:sendMessage"
        L8_2 = A0_2.player
        L9_2 = Lang
        L10_2 = "INVENTORY_QUANTITY"
        L9_2 = L9_2(L10_2)
        L10_2 = "error"
        L6_2(L7_2, L8_2, L9_2, L10_2)
      end
    else
      L5_2 = TriggerClientEvent
      L6_2 = "qs-inventory:sendMessage"
      L7_2 = A0_2.player
      L8_2 = Lang
      L9_2 = "PLAYER_NOT_EXIST"
      L8_2 = L8_2(L9_2)
      L9_2 = "error"
      L5_2(L6_2, L7_2, L8_2, L9_2)
    end
  else
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = QBCore
      L1_2 = L1_2.Functions
      L1_2 = L1_2.GetPlayer
      L2_2 = A0_2.player
      L1_2 = L1_2(L2_2)
      L2_2 = QBCore
      L2_2 = L2_2.Functions
      L2_2 = L2_2.GetPlayer
      L3_2 = A0_2.player
      L2_2 = L2_2(L3_2)
      L3_2 = tonumber
      L4_2 = A0_2.amount
      L3_2 = L3_2(L4_2)
      L4_2 = QBCore
      L4_2 = L4_2.Shared
      L4_2 = L4_2.Items
      L5_2 = tostring
      L6_2 = A0_2.item
      L5_2 = L5_2(L6_2)
      L6_2 = L5_2
      L5_2 = L5_2.lower
      L5_2 = L5_2(L6_2)
      L4_2 = L4_2[L5_2]
      if nil ~= L2_2 and nil ~= L1_2 then
        L5_2 = exports
        L5_2 = L5_2.oxmysql
        L6_2 = L5_2
        L5_2 = L5_2.fetchSync
        L7_2 = "SELECT * FROM users WHERE identifier = @identifier"
        L8_2 = {}
        L9_2 = L1_2.PlayerData
        L9_2 = L9_2.citizenid
        L8_2["@identifier"] = L9_2
        L5_2 = L5_2(L6_2, L7_2, L8_2)
        if L3_2 > 0 then
          if nil ~= L4_2 then
            L6_2 = {}
            L7_2 = L4_2.name
            if "id_card" == L7_2 then
              L7_2 = L5_2[1]
              L7_2 = L7_2.firstname
              L6_2.firstname = L7_2
              L7_2 = L5_2[1]
              L7_2 = L7_2.lastname
              L6_2.lastname = L7_2
              L7_2 = L5_2[1]
              L7_2 = L7_2.dateofbirth
              L6_2.birthdate = L7_2
              L7_2 = L5_2[1]
              L7_2 = L7_2.sex
              L6_2.gender = L7_2
            else
              L7_2 = L4_2.name
              if "weapon_license" == L7_2 then
                L7_2 = {}
                L8_2 = L5_2[1]
                L8_2 = L8_2.firstname
                L7_2.name = L8_2
                L8_2 = L5_2[1]
                L8_2 = L8_2.lastname
                L7_2.lastname = L8_2
                L8_2 = L5_2[1]
                L8_2 = L8_2.sex
                L7_2.gender = L8_2
                L8_2 = L5_2[1]
                L8_2 = L8_2.dateofbirth
                L7_2.dateofbirth = L8_2
                L6_2 = L7_2
              else
                L7_2 = L4_2.type
                if "weapon" == L7_2 then
                  L3_2 = 1
                  L7_2 = tostring
                  L8_2 = QBCore
                  L8_2 = L8_2.Shared
                  L8_2 = L8_2.RandomInt
                  L9_2 = 2
                  L8_2 = L8_2(L9_2)
                  L9_2 = QBCore
                  L9_2 = L9_2.Shared
                  L9_2 = L9_2.RandomStr
                  L10_2 = 3
                  L9_2 = L9_2(L10_2)
                  L10_2 = QBCore
                  L10_2 = L10_2.Shared
                  L10_2 = L10_2.RandomInt
                  L11_2 = 1
                  L10_2 = L10_2(L11_2)
                  L11_2 = QBCore
                  L11_2 = L11_2.Shared
                  L11_2 = L11_2.RandomStr
                  L12_2 = 2
                  L11_2 = L11_2(L12_2)
                  L12_2 = QBCore
                  L12_2 = L12_2.Shared
                  L12_2 = L12_2.RandomInt
                  L13_2 = 3
                  L12_2 = L12_2(L13_2)
                  L13_2 = QBCore
                  L13_2 = L13_2.Shared
                  L13_2 = L13_2.RandomStr
                  L14_2 = 4
                  L13_2 = L13_2(L14_2)
                  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
                  L7_2 = L7_2(L8_2)
                  L6_2.serie = L7_2
                else
                  L7_2 = L4_2.name
                  if "backpack" == L7_2 then
                    L7_2 = {}
                    L8_2 = math
                    L8_2 = L8_2.random
                    L9_2 = 111111
                    L10_2 = 999999
                    L8_2 = L8_2(L9_2, L10_2)
                    L7_2.id = L8_2
                    L6_2 = L7_2
                  else
                    L7_2 = L4_2.name
                    if "game_ticket" == L7_2 then
                      L7_2 = {}
                      L7_2.type = "game_ticket"
                      L8_2 = math
                      L8_2 = L8_2.random
                      L9_2 = 11111111
                      L10_2 = 99999999
                      L8_2 = L8_2(L9_2, L10_2)
                      L7_2.cardnumber = L8_2
                      L6_2 = L7_2
                    end
                  end
                end
              end
            end
            L7_2 = L2_2.Functions
            L7_2 = L7_2.AddItem
            L8_2 = L4_2.name
            L9_2 = L3_2
            L10_2 = false
            L11_2 = L6_2
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
            if L7_2 then
              L7_2 = TriggerClientEvent
              L8_2 = "inventory:client:ItemBox"
              L9_2 = A0_2.player
              L10_2 = QBCore
              L10_2 = L10_2.Shared
              L10_2 = L10_2.Items
              L11_2 = L4_2.name
              L10_2 = L10_2[L11_2]
              L11_2 = "add"
              L7_2(L8_2, L9_2, L10_2, L11_2)
              L7_2 = TriggerClientEvent
              L8_2 = "qs-inventory:sendMessage"
              L9_2 = A0_2.player
              L10_2 = Lang
              L11_2 = "INVENTORY_GIVE_SUCCESS"
              L10_2 = L10_2(L11_2)
              L11_2 = L4_2.name
              L12_2 = " x"
              L13_2 = L3_2
              L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2
              L11_2 = "sucess"
              L7_2(L8_2, L9_2, L10_2, L11_2)
            else
              L7_2 = TriggerClientEvent
              L8_2 = "qs-inventory:sendMessage"
              L9_2 = A0_2.player
              L10_2 = Lang
              L11_2 = "SEND_ERROR"
              L10_2 = L10_2(L11_2)
              L11_2 = "error"
              L7_2(L8_2, L9_2, L10_2, L11_2)
            end
          else
            L6_2 = TriggerClientEvent
            L7_2 = "qs-inventory:sendMessage"
            L8_2 = A0_2.player
            L9_2 = Lang
            L10_2 = "INVALID_ITEM"
            L9_2 = L9_2(L10_2)
            L10_2 = "error"
            L6_2(L7_2, L8_2, L9_2, L10_2)
          end
        else
          L6_2 = TriggerClientEvent
          L7_2 = "qs-inventory:sendMessage"
          L8_2 = A0_2.player
          L9_2 = Lang
          L10_2 = "INVENTORY_QUANTITY"
          L9_2 = L9_2(L10_2)
          L10_2 = "error"
          L6_2(L7_2, L8_2, L9_2, L10_2)
        end
      else
        L5_2 = TriggerClientEvent
        L6_2 = "qs-inventory:sendMessage"
        L7_2 = A0_2.player
        L8_2 = Lang
        L9_2 = "PLAYER_NOT_EXIST"
        L8_2 = L8_2(L9_2)
        L9_2 = "error"
        L5_2(L6_2, L7_2, L8_2, L9_2)
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = AddEventHandler
L2_1 = "randomitems:command"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = Config
  L1_2 = L1_2.Framework
  if "ESX" == L1_2 then
    L1_2 = QS
    L1_2 = L1_2.GetPlayerFromId
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L2_2 = {}
    L3_2 = pairs
    L4_2 = QS
    L4_2 = L4_2.Shared
    L4_2 = L4_2.Items
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = QS
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L9_2 = L9_2[L7_2]
      L9_2 = L9_2.type
      if "weapon" ~= L9_2 then
        L9_2 = table
        L9_2 = L9_2.insert
        L10_2 = L2_2
        L11_2 = L8_2
        L9_2(L10_2, L11_2)
      end
    end
    L3_2 = 1
    L4_2 = 10
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = math
      L7_2 = L7_2.random
      L8_2 = 1
      L9_2 = #L2_2
      L7_2 = L7_2(L8_2, L9_2)
      L7_2 = L2_2[L7_2]
      L8_2 = math
      L8_2 = L8_2.random
      L9_2 = 1
      L10_2 = 10
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = L7_2.unique
      if L9_2 then
        L8_2 = 1
      end
      L9_2 = L1_2.addItem
      L10_2 = L7_2.name
      L11_2 = L8_2
      L9_2 = L9_2(L10_2, L11_2)
      if L9_2 then
        L9_2 = TriggerClientEvent
        L10_2 = "inventory:client:ItemBox"
        L11_2 = A0_2
        L12_2 = QS
        L12_2 = L12_2.Shared
        L12_2 = L12_2.Items
        L13_2 = L7_2.name
        L12_2 = L12_2[L13_2]
        L13_2 = "add"
        L9_2(L10_2, L11_2, L12_2, L13_2)
        L9_2 = Citizen
        L9_2 = L9_2.Wait
        L10_2 = 500
        L9_2(L10_2)
      end
    end
  else
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = QBCore
      L1_2 = L1_2.Functions
      L1_2 = L1_2.GetPlayer
      L2_2 = A0_2
      L1_2 = L1_2(L2_2)
      L2_2 = {}
      L3_2 = pairs
      L4_2 = QBCore
      L4_2 = L4_2.Shared
      L4_2 = L4_2.Items
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
        L9_2 = QBCore
        L9_2 = L9_2.Shared
        L9_2 = L9_2.Items
        L9_2 = L9_2[L7_2]
        L9_2 = L9_2.type
        if "weapon" ~= L9_2 then
          L9_2 = table
          L9_2 = L9_2.insert
          L10_2 = L2_2
          L11_2 = L8_2
          L9_2(L10_2, L11_2)
        end
      end
      L3_2 = 1
      L4_2 = 10
      L5_2 = 1
      for L6_2 = L3_2, L4_2, L5_2 do
        L7_2 = math
        L7_2 = L7_2.random
        L8_2 = 1
        L9_2 = #L2_2
        L7_2 = L7_2(L8_2, L9_2)
        L7_2 = L2_2[L7_2]
        L8_2 = math
        L8_2 = L8_2.random
        L9_2 = 1
        L10_2 = 10
        L8_2 = L8_2(L9_2, L10_2)
        L9_2 = L7_2.unique
        if L9_2 then
          L8_2 = 1
        end
        L9_2 = L1_2.Functions
        L9_2 = L9_2.AddItem
        L10_2 = L7_2.name
        L11_2 = L8_2
        L9_2 = L9_2(L10_2, L11_2)
        if L9_2 then
          L9_2 = TriggerClientEvent
          L10_2 = "inventory:client:ItemBox"
          L11_2 = A0_2
          L12_2 = QBCore
          L12_2 = L12_2.Shared
          L12_2 = L12_2.Items
          L13_2 = L7_2.name
          L12_2 = L12_2[L13_2]
          L13_2 = "add"
          L9_2(L10_2, L11_2, L12_2, L13_2)
          L9_2 = Citizen
          L9_2 = L9_2.Wait
          L10_2 = 500
          L9_2(L10_2)
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = Config
L1_1 = L1_1.Framework
if "ESX" == L1_1 then
  L1_1 = ESX
  L1_1 = L1_1.RegisterServerCallback
  L2_1 = "qs-core:hasItem"
  function L3_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2
    L3_2 = false
    L4_2 = QS
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if nil ~= L4_2 and A2_2 then
      L5_2 = L4_2.GetItemByName
      L6_2 = A2_2
      L5_2 = L5_2(L6_2)
      if nil ~= L5_2 then
        L3_2 = true
      end
    end
    L5_2 = A1_2
    L6_2 = L3_2
    L5_2(L6_2)
  end
  L1_1(L2_1, L3_1)
else
  L1_1 = Config
  L1_1 = L1_1.Framework
  if "QBCore" == L1_1 then
    L1_1 = QBCore
    L1_1 = L1_1.Functions
    L1_1 = L1_1.CreateCallback
    L2_1 = "qs-core:hasItem"
    function L3_1(A0_2, A1_2, A2_2)
      local L3_2, L4_2, L5_2, L6_2
      L3_2 = false
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      if nil ~= L4_2 and A2_2 then
        L5_2 = L4_2.Functions
        L5_2 = L5_2.GetItemByName
        L6_2 = A2_2
        L5_2 = L5_2(L6_2)
        if nil ~= L5_2 then
          L3_2 = true
        end
      end
      L5_2 = A1_2
      L6_2 = L3_2
      L5_2(L6_2)
    end
    L1_1(L2_1, L3_1)
  end
end
L1_1 = {}
L2_1 = Config
L2_1 = L2_1.Framework
if "ESX" == L2_1 then
  L2_1 = ESX
  L2_1 = L2_1.RegisterServerCallback
  L3_1 = "weapons:server:GetConfig"
  function L4_1(A0_2, A1_2)
    local L2_2, L3_2
    L2_2 = A1_2
    L3_2 = Config
    L3_2 = L3_2.WeaponRepairPoints
    L2_2(L3_2)
  end
  L2_1(L3_1, L4_1)
else
  L2_1 = Config
  L2_1 = L2_1.Framework
  if "QBCore" == L2_1 then
    L2_1 = QBCore
    L2_1 = L2_1.Functions
    L2_1 = L2_1.CreateCallback
    L3_1 = "weapons:server:GetConfig"
    function L4_1(A0_2, A1_2)
      local L2_2, L3_2
      L2_2 = A1_2
      L3_2 = Config
      L3_2 = L3_2.WeaponRepairPoints
      L2_2(L3_2)
    end
    L2_1(L3_1, L4_1)
  end
end
L2_1 = Config
L2_1 = L2_1.Framework
if "QBCore" == L2_1 then
  L2_1 = RegisterServerEvent
  L3_1 = "qs-core:removeItem"
  L2_1(L3_1)
  L2_1 = AddEventHandler
  L3_1 = "qs-core:removeItem"
  function L4_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L3_2 = source
    L4_2 = QBCore
    L4_2 = L4_2.Functions
    L4_2 = L4_2.GetPlayer
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = tonumber
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    if L4_2 and L5_2 then
      L6_2 = L4_2.Functions
      L6_2 = L6_2.RemoveItem
      L7_2 = A0_2
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
    end
  end
  L2_1(L3_1, L4_1)
end
L2_1 = RegisterServerEvent
L3_1 = "weapons:server:AddWeaponAmmo"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "weapons:server:AddWeaponAmmo"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = source
    L3_2 = QS
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = tonumber
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if nil ~= A0_2 then
      L5_2 = L3_2.PlayerData
      L5_2 = L5_2.items
      L6_2 = A0_2.slot
      L5_2 = L5_2[L6_2]
      if nil ~= L5_2 then
        L5_2 = L3_2.PlayerData
        L5_2 = L5_2.items
        L6_2 = A0_2.slot
        L5_2 = L5_2[L6_2]
        L5_2 = L5_2.info
        L5_2.ammo = L4_2
      end
      L5_2 = L3_2.SetInventory
      L6_2 = L3_2.PlayerData
      L6_2 = L6_2.items
      L5_2(L6_2)
    end
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = source
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = tonumber
      L5_2 = A1_2
      L4_2 = L4_2(L5_2)
      if nil ~= A0_2 then
        L5_2 = L3_2.PlayerData
        L5_2 = L5_2.items
        L6_2 = A0_2.slot
        L5_2 = L5_2[L6_2]
        if nil ~= L5_2 then
          L5_2 = L3_2.PlayerData
          L5_2 = L5_2.items
          L6_2 = A0_2.slot
          L5_2 = L5_2[L6_2]
          L5_2 = L5_2.info
          L5_2.ammo = L4_2
        end
        L5_2 = L3_2.Functions
        L5_2 = L5_2.SetInventory
        L6_2 = L3_2.PlayerData
        L6_2 = L6_2.items
        L5_2(L6_2)
      end
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterServerEvent
L3_1 = "weapons:server:UpdateWeaponAmmo"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "weapons:server:UpdateWeaponAmmo"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = source
    L3_2 = QS
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = tonumber
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if L3_2 and nil ~= A0_2 then
      L5_2 = L3_2.PlayerData
      L5_2 = L5_2.items
      L6_2 = A0_2.slot
      L5_2 = L5_2[L6_2]
      if nil ~= L5_2 then
        L5_2 = L3_2.PlayerData
        L5_2 = L5_2.items
        L6_2 = A0_2.slot
        L5_2 = L5_2[L6_2]
        L5_2 = L5_2.info
        L5_2 = L5_2.ammo
        if L5_2 then
          L5_2 = tonumber
          L6_2 = L3_2.PlayerData
          L6_2 = L6_2.items
          L7_2 = A0_2.slot
          L6_2 = L6_2[L7_2]
          L6_2 = L6_2.info
          L6_2 = L6_2.ammo
          L5_2 = L5_2(L6_2)
          if L4_2 < L5_2 then
            L6_2 = L3_2.PlayerData
            L6_2 = L6_2.items
            L7_2 = A0_2.slot
            L6_2 = L6_2[L7_2]
            L6_2 = L6_2.info
            L6_2.ammo = L4_2
            L6_2 = L3_2.SetInventoryWithoutUpdatePlayerData
            L7_2 = L3_2.PlayerData
            L7_2 = L7_2.items
            L6_2(L7_2)
          end
        else
          L5_2 = L3_2.PlayerData
          L5_2 = L5_2.items
          L6_2 = A0_2.slot
          L5_2 = L5_2[L6_2]
          L5_2 = L5_2.info
          L5_2.ammo = L4_2
          L5_2 = L3_2.SetInventoryWithoutUpdatePlayerData
          L6_2 = L3_2.PlayerData
          L6_2 = L6_2.items
          L5_2(L6_2)
        end
      end
    end
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = source
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = tonumber
      L5_2 = A1_2
      L4_2 = L4_2(L5_2)
      if L3_2 and nil ~= A0_2 then
        L5_2 = L3_2.PlayerData
        L5_2 = L5_2.items
        L6_2 = A0_2.slot
        L5_2 = L5_2[L6_2]
        if nil ~= L5_2 then
          L5_2 = L3_2.PlayerData
          L5_2 = L5_2.items
          L6_2 = A0_2.slot
          L5_2 = L5_2[L6_2]
          L5_2 = L5_2.info
          L5_2.ammo = L4_2
        end
        L5_2 = L3_2.Functions
        L5_2 = L5_2.SetInventory
        L6_2 = L3_2.PlayerData
        L6_2 = L6_2.items
        L5_2(L6_2)
      end
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = Config
L2_1 = L2_1.Framework
if "ESX" == L2_1 then
  L2_1 = ESX
  L2_1 = L2_1.RegisterServerCallback
  L3_1 = "weapon:server:GetWeaponAmmo"
  function L4_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2
    L3_2 = QS
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = 0
    if nil ~= A2_2 and nil ~= L3_2 then
      L5_2 = L3_2.GetItemBySlot
      L6_2 = A2_2.slot
      L5_2 = L5_2(L6_2)
      if nil ~= L5_2 then
        L6_2 = L5_2.info
        L6_2 = L6_2.ammo
        if nil ~= L6_2 then
          L6_2 = L5_2.info
          L6_2 = L6_2.ammo
          if L6_2 then
            goto lbl_24
            L4_2 = L6_2 or L4_2
          end
        end
        L4_2 = 0
      end
    end
    ::lbl_24::
    L5_2 = A1_2
    L6_2 = L4_2
    L5_2(L6_2)
  end
  L2_1(L3_1, L4_1)
else
  L2_1 = Config
  L2_1 = L2_1.Framework
  if "QBCore" == L2_1 then
    L2_1 = QBCore
    L2_1 = L2_1.Functions
    L2_1 = L2_1.CreateCallback
    L3_1 = "weapon:server:GetWeaponAmmo"
    function L4_1(A0_2, A1_2, A2_2)
      local L3_2, L4_2, L5_2, L6_2
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L4_2 = 0
      if nil ~= A2_2 and nil ~= L3_2 then
        L5_2 = L3_2.Functions
        L5_2 = L5_2.GetItemBySlot
        L6_2 = A2_2.slot
        L5_2 = L5_2(L6_2)
        if nil ~= L5_2 then
          L6_2 = L5_2.info
          L6_2 = L6_2.ammo
          if nil ~= L6_2 then
            L6_2 = L5_2.info
            L6_2 = L6_2.ammo
            if L6_2 then
              goto lbl_26
              L4_2 = L6_2 or L4_2
            end
          end
          L4_2 = 0
        end
      end
      ::lbl_26::
      L5_2 = A1_2
      L6_2 = L4_2
      L5_2(L6_2)
    end
    L2_1(L3_1, L4_1)
  end
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = false
  L2_2 = pairs
  L3_2 = Config
  L3_2 = L3_2.DurabilityBlockedWeapons
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 == A0_2 then
      L1_2 = true
      break
    end
  end
  return L1_2
end
IsWeaponBlocked = L2_1
L2_1 = RegisterServerEvent
L3_1 = "weapons:server:UpdateWeaponQuality"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "weapons:server:UpdateWeaponQuality"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = source
    L3_2 = QS
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = QS
    L4_2 = L4_2.Shared
    L4_2 = L4_2.Weapons
    L5_2 = GetHashKey
    L6_2 = A0_2.name
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2[L5_2]
    L5_2 = L3_2.PlayerData
    L5_2 = L5_2.items
    L6_2 = A0_2.slot
    L5_2 = L5_2[L6_2]
    L6_2 = Config
    L6_2 = L6_2.DurabilityMultiplier
    L7_2 = A0_2.name
    L6_2 = L6_2[L7_2]
    if L6_2 and L6_2 > 0 then
      if nil ~= L5_2 then
        L7_2 = IsWeaponBlocked
        L8_2 = L4_2.name
        L7_2 = L7_2(L8_2)
        if not L7_2 then
          L7_2 = L5_2.info
          L7_2 = L7_2.quality
          if nil ~= L7_2 then
            L7_2 = 1
            L8_2 = A1_2
            L9_2 = 1
            for L10_2 = L7_2, L8_2, L9_2 do
              L11_2 = L5_2.info
              L11_2 = L11_2.quality
              L11_2 = L11_2 - L6_2
              if L11_2 > 0 then
                L11_2 = L5_2.info
                L12_2 = L5_2.info
                L12_2 = L12_2.quality
                L12_2 = L12_2 - L6_2
                L11_2.quality = L12_2
              else
                L11_2 = L5_2.info
                L11_2.quality = 0
                L11_2 = TriggerClientEvent
                L12_2 = "inventory:client:UseWeapon"
                L13_2 = L2_2
                L14_2 = A0_2
                L11_2(L12_2, L13_2, L14_2)
                L11_2 = TriggerClientEvent
                L12_2 = "qs-inventory:sendMessage"
                L13_2 = L2_2
                L14_2 = Lang
                L15_2 = "WEAPON_NEED_REPAIR"
                L14_2 = L14_2(L15_2)
                L15_2 = "inform"
                L11_2(L12_2, L13_2, L14_2, L15_2)
                break
              end
            end
          else
            L7_2 = L5_2.info
            L7_2.quality = 100
            L7_2 = 1
            L8_2 = A1_2
            L9_2 = 1
            for L10_2 = L7_2, L8_2, L9_2 do
              L11_2 = L5_2.info
              L11_2 = L11_2.quality
              L11_2 = L11_2 - L6_2
              if L11_2 > 0 then
                L11_2 = L5_2.info
                L12_2 = L5_2.info
                L12_2 = L12_2.quality
                L12_2 = L12_2 - L6_2
                L11_2.quality = L12_2
              else
                L11_2 = L5_2.info
                L11_2.quality = 0
                L11_2 = TriggerClientEvent
                L12_2 = "inventory:client:UseWeapon"
                L13_2 = L2_2
                L14_2 = A0_2
                L11_2(L12_2, L13_2, L14_2)
                L11_2 = TriggerClientEvent
                L12_2 = "qs-inventory:sendMessage"
                L13_2 = L2_2
                L14_2 = Lang
                L15_2 = "WEAPON_NEED_REPAIR"
                L14_2 = L14_2(L15_2)
                L15_2 = "inform"
                L11_2(L12_2, L13_2, L14_2, L15_2)
                break
              end
            end
          end
        end
      end
      L7_2 = L3_2.SetInventoryWithoutUpdatePlayerData
      L8_2 = L3_2.PlayerData
      L8_2 = L8_2.items
      L7_2(L8_2)
    end
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = source
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = QBCore
      L4_2 = L4_2.Shared
      L4_2 = L4_2.Weapons
      L5_2 = GetHashKey
      L6_2 = A0_2.name
      L5_2 = L5_2(L6_2)
      L4_2 = L4_2[L5_2]
      L5_2 = L3_2.PlayerData
      L5_2 = L5_2.items
      L6_2 = A0_2.slot
      L5_2 = L5_2[L6_2]
      L6_2 = Config
      L6_2 = L6_2.DurabilityMultiplier
      L7_2 = A0_2.name
      L6_2 = L6_2[L7_2]
      if nil ~= L5_2 then
        L7_2 = IsWeaponBlocked
        L8_2 = L4_2.name
        L7_2 = L7_2(L8_2)
        if not L7_2 then
          L7_2 = L5_2.info
          L7_2 = L7_2.quality
          if nil ~= L7_2 then
            L7_2 = 1
            L8_2 = A1_2
            L9_2 = 1
            for L10_2 = L7_2, L8_2, L9_2 do
              L11_2 = L5_2.info
              L11_2 = L11_2.quality
              L11_2 = L11_2 - L6_2
              if L11_2 > 0 then
                L11_2 = L5_2.info
                L12_2 = L5_2.info
                L12_2 = L12_2.quality
                L12_2 = L12_2 - L6_2
                L11_2.quality = L12_2
              else
                L11_2 = L5_2.info
                L11_2.quality = 0
                L11_2 = TriggerClientEvent
                L12_2 = "inventory:client:UseWeapon"
                L13_2 = L2_2
                L14_2 = A0_2
                L11_2(L12_2, L13_2, L14_2)
                L11_2 = TriggerClientEvent
                L12_2 = "qs-inventory:sendMessage"
                L13_2 = source
                L14_2 = Lang
                L15_2 = "WEAPON_NEED_REPAIR"
                L14_2 = L14_2(L15_2)
                L15_2 = "inform"
                L11_2(L12_2, L13_2, L14_2, L15_2)
                break
              end
            end
          else
            L7_2 = L5_2.info
            L7_2.quality = 100
            L7_2 = 1
            L8_2 = A1_2
            L9_2 = 1
            for L10_2 = L7_2, L8_2, L9_2 do
              L11_2 = L5_2.info
              L11_2 = L11_2.quality
              L11_2 = L11_2 - L6_2
              if L11_2 > 0 then
                L11_2 = L5_2.info
                L12_2 = L5_2.info
                L12_2 = L12_2.quality
                L12_2 = L12_2 - L6_2
                L11_2.quality = L12_2
              else
                L11_2 = L5_2.info
                L11_2.quality = 0
                L11_2 = TriggerClientEvent
                L12_2 = "inventory:client:UseWeapon"
                L13_2 = L2_2
                L14_2 = A0_2
                L11_2(L12_2, L13_2, L14_2)
                L11_2 = TriggerClientEvent
                L12_2 = "qs-inventory:sendMessage"
                L13_2 = source
                L14_2 = Lang
                L15_2 = "WEAPON_NEED_REPAIR"
                L14_2 = L14_2(L15_2)
                L15_2 = "inform"
                L11_2(L12_2, L13_2, L14_2, L15_2)
                break
              end
            end
          end
        end
      end
      L7_2 = L3_2.Functions
      L7_2 = L7_2.SetInventory
      L8_2 = L3_2.PlayerData
      L8_2 = L8_2.items
      L7_2(L8_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterServerEvent
L3_1 = "weapons:server:SetWeaponQuality"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "weapons:server:SetWeaponQuality"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = source
    L3_2 = QS
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = QS
    L4_2 = L4_2.Shared
    L4_2 = L4_2.Weapons
    L5_2 = GetHashKey
    L6_2 = A0_2.name
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2[L5_2]
    L5_2 = L3_2.PlayerData
    L5_2 = L5_2.items
    L6_2 = A0_2.slot
    L5_2 = L5_2[L6_2]
    L6_2 = Config
    L6_2 = L6_2.DurabilityMultiplier
    L7_2 = A0_2.name
    L6_2 = L6_2[L7_2]
    L7_2 = L5_2.info
    L7_2.quality = A1_2
    L7_2 = L3_2.SetInventory
    L8_2 = L3_2.PlayerData
    L8_2 = L8_2.items
    L7_2(L8_2)
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = source
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = QBCore
      L4_2 = L4_2.Shared
      L4_2 = L4_2.Weapons
      L5_2 = GetHashKey
      L6_2 = A0_2.name
      L5_2 = L5_2(L6_2)
      L4_2 = L4_2[L5_2]
      L5_2 = L3_2.PlayerData
      L5_2 = L5_2.items
      L6_2 = A0_2.slot
      L5_2 = L5_2[L6_2]
      L6_2 = Config
      L6_2 = L6_2.DurabilityMultiplier
      L7_2 = A0_2.name
      L6_2 = L6_2[L7_2]
      L7_2 = L5_2.info
      L7_2.quality = A1_2
      L7_2 = L3_2.Functions
      L7_2 = L7_2.SetInventory
      L8_2 = L3_2.PlayerData
      L8_2 = L8_2.items
      L7_2(L8_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = Config
L2_1 = L2_1.Framework
if "ESX" == L2_1 then
  L2_1 = ESX
  L2_1 = L2_1.RegisterServerCallback
  L3_1 = "weapons:server:RepairWeapon"
  function L4_1(A0_2, A1_2, A2_2, A3_2)
    local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
    L4_2 = A0_2
    L5_2 = ESX
    L5_2 = L5_2.GetPlayerFromId
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L6_2 = QS
    L6_2 = L6_2.GetPlayerFromId
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    L7_2 = 60000
    L8_2 = math
    L8_2 = L8_2.random
    L9_2 = 5 * L7_2
    L10_2 = 10 * L7_2
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = QS
    L9_2 = L9_2.Shared
    L9_2 = L9_2.Weapons
    L10_2 = GetHashKey
    L11_2 = A3_2.name
    L10_2 = L10_2(L11_2)
    L9_2 = L9_2[L10_2]
    L10_2 = QS
    L10_2 = L10_2.Shared
    L10_2 = L10_2.SplitStr
    L11_2 = L9_2.ammotype
    L12_2 = "_"
    L10_2 = L10_2(L11_2, L12_2)
    L10_2 = L10_2[2]
    L11_2 = L10_2
    L10_2 = L10_2.lower
    L10_2 = L10_2(L11_2)
    L11_2 = L6_2.PlayerData
    L11_2 = L11_2.items
    L12_2 = A3_2.slot
    L11_2 = L11_2[L12_2]
    if nil ~= L11_2 then
      L11_2 = L6_2.PlayerData
      L11_2 = L11_2.items
      L12_2 = A3_2.slot
      L11_2 = L11_2[L12_2]
      L11_2 = L11_2.info
      L11_2 = L11_2.quality
      if nil ~= L11_2 then
        L11_2 = L6_2.PlayerData
        L11_2 = L11_2.items
        L12_2 = A3_2.slot
        L11_2 = L11_2[L12_2]
        L11_2 = L11_2.info
        L11_2 = L11_2.quality
        if 100 ~= L11_2 then
          L11_2 = Config
          L11_2 = L11_2.RepairAccount
          if "money" == L11_2 then
            L11_2 = L5_2.getMoney
            L11_2 = L11_2()
            L12_2 = Config
            L12_2 = L12_2.WeaponRepairCotsts
            L12_2 = L12_2[L10_2]
            if L11_2 >= L12_2 then
              L11_2 = L5_2.removeMoney
              L12_2 = Config
              L12_2 = L12_2.WeaponRepairCotsts
              L12_2 = L12_2[L10_2]
              L11_2(L12_2)
              L11_2 = Config
              L11_2 = L11_2.WeaponRepairPoints
              L11_2 = L11_2[A2_2]
              L11_2.IsRepairing = true
              L11_2 = Config
              L11_2 = L11_2.WeaponRepairPoints
              L11_2 = L11_2[A2_2]
              L12_2 = {}
              L13_2 = L5_2.identifier
              L12_2.Identifier = L13_2
              L13_2 = L6_2.PlayerData
              L13_2 = L13_2.items
              L14_2 = A3_2.slot
              L13_2 = L13_2[L14_2]
              L12_2.WeaponData = L13_2
              L12_2.Ready = false
              L11_2.RepairingData = L12_2
              L11_2 = TriggerClientEvent
              L12_2 = "inventory:client:ItemBox"
              L13_2 = L4_2
              L14_2 = QS
              L14_2 = L14_2.Shared
              L14_2 = L14_2.Items
              L15_2 = A3_2.name
              L14_2 = L14_2[L15_2]
              L15_2 = "remove"
              L11_2(L12_2, L13_2, L14_2, L15_2)
              L11_2 = TriggerClientEvent
              L12_2 = "inventory:client:CheckWeapon"
              L13_2 = L4_2
              L14_2 = A3_2.name
              L11_2(L12_2, L13_2, L14_2)
              L11_2 = TriggerClientEvent
              L12_2 = "weapons:client:SyncRepairShops"
              L13_2 = L4_2
              L14_2 = Config
              L14_2 = L14_2.WeaponRepairPoints
              L14_2 = L14_2[A2_2]
              L15_2 = A2_2
              L11_2(L12_2, L13_2, L14_2, L15_2)
              L11_2 = SetTimeout
              L12_2 = 4000
              function L13_2()
                local L0_3, L1_3, L2_3, L3_3, L4_3
                L0_3 = Config
                L0_3 = L0_3.WeaponRepairPoints
                L1_3 = A2_2
                L0_3 = L0_3[L1_3]
                L0_3.IsRepairing = false
                L0_3 = Config
                L0_3 = L0_3.WeaponRepairPoints
                L1_3 = A2_2
                L0_3 = L0_3[L1_3]
                L0_3 = L0_3.RepairingData
                L0_3.Ready = true
                L0_3 = TriggerClientEvent
                L1_3 = "weapons:client:SyncRepairShops"
                L2_3 = L4_2
                L3_3 = Config
                L3_3 = L3_3.WeaponRepairPoints
                L4_3 = A2_2
                L3_3 = L3_3[L4_3]
                L4_3 = A2_2
                L0_3(L1_3, L2_3, L3_3, L4_3)
                L0_3 = SetTimeout
                L1_3 = 420000
                function L2_3()
                  local L0_4, L1_4, L2_4, L3_4, L4_4
                  L0_4 = Config
                  L0_4 = L0_4.WeaponRepairPoints
                  L1_4 = A2_2
                  L0_4 = L0_4[L1_4]
                  L0_4 = L0_4.RepairingData
                  L0_4 = L0_4.Ready
                  if L0_4 then
                    L0_4 = Config
                    L0_4 = L0_4.WeaponRepairPoints
                    L1_4 = A2_2
                    L0_4 = L0_4[L1_4]
                    L0_4.IsRepairing = false
                    L0_4 = Config
                    L0_4 = L0_4.WeaponRepairPoints
                    L1_4 = A2_2
                    L0_4 = L0_4[L1_4]
                    L1_4 = {}
                    L0_4.RepairingData = L1_4
                    L0_4 = TriggerClientEvent
                    L1_4 = "weapons:client:SyncRepairShops"
                    L2_4 = L4_2
                    L3_4 = Config
                    L3_4 = L3_4.WeaponRepairPoints
                    L4_4 = A2_2
                    L3_4 = L3_4[L4_4]
                    L4_4 = A2_2
                    L0_4(L1_4, L2_4, L3_4, L4_4)
                  end
                end
                L0_3(L1_3, L2_3)
              end
              L11_2(L12_2, L13_2)
              L11_2 = A1_2
              L12_2 = true
              L11_2(L12_2)
            else
              L11_2 = TriggerClientEvent
              L12_2 = "qs-inventory:sendMessage"
              L13_2 = L4_2
              L14_2 = Lang
              L15_2 = "NO_MONEY"
              L14_2 = L14_2(L15_2)
              L15_2 = "error"
              L11_2(L12_2, L13_2, L14_2, L15_2)
              L11_2 = A1_2
              L12_2 = false
              L11_2(L12_2)
            end
          else
            L11_2 = Config
            L11_2 = L11_2.RepairAccount
            if "bank" == L11_2 then
              L11_2 = L5_2.getAccount
              L12_2 = "bank"
              L11_2 = L11_2(L12_2)
              L11_2 = L11_2.money
              L12_2 = Config
              L12_2 = L12_2.WeaponRepairCotsts
              L12_2 = L12_2[L10_2]
              if L11_2 >= L12_2 then
                L11_2 = L5_2.removeAccountMoney
                L12_2 = "bank"
                L13_2 = Config
                L13_2 = L13_2.WeaponRepairCotsts
                L13_2 = L13_2[L10_2]
                L11_2(L12_2, L13_2)
                L11_2 = Config
                L11_2 = L11_2.WeaponRepairPoints
                L11_2 = L11_2[A2_2]
                L11_2.IsRepairing = true
                L11_2 = Config
                L11_2 = L11_2.WeaponRepairPoints
                L11_2 = L11_2[A2_2]
                L12_2 = {}
                L13_2 = L5_2.identifier
                L12_2.Identifier = L13_2
                L13_2 = L6_2.PlayerData
                L13_2 = L13_2.items
                L14_2 = A3_2.slot
                L13_2 = L13_2[L14_2]
                L12_2.WeaponData = L13_2
                L12_2.Ready = false
                L11_2.RepairingData = L12_2
                L11_2 = TriggerClientEvent
                L12_2 = "inventory:client:ItemBox"
                L13_2 = L4_2
                L14_2 = QS
                L14_2 = L14_2.Shared
                L14_2 = L14_2.Items
                L15_2 = A3_2.name
                L14_2 = L14_2[L15_2]
                L15_2 = "remove"
                L11_2(L12_2, L13_2, L14_2, L15_2)
                L11_2 = TriggerClientEvent
                L12_2 = "inventory:client:CheckWeapon"
                L13_2 = L4_2
                L14_2 = A3_2.name
                L11_2(L12_2, L13_2, L14_2)
                L11_2 = TriggerClientEvent
                L12_2 = "weapons:client:SyncRepairShops"
                L13_2 = L4_2
                L14_2 = Config
                L14_2 = L14_2.WeaponRepairPoints
                L14_2 = L14_2[A2_2]
                L15_2 = A2_2
                L11_2(L12_2, L13_2, L14_2, L15_2)
                L11_2 = SetTimeout
                L12_2 = 4000
                function L13_2()
                  local L0_3, L1_3, L2_3, L3_3, L4_3
                  L0_3 = Config
                  L0_3 = L0_3.WeaponRepairPoints
                  L1_3 = A2_2
                  L0_3 = L0_3[L1_3]
                  L0_3.IsRepairing = false
                  L0_3 = Config
                  L0_3 = L0_3.WeaponRepairPoints
                  L1_3 = A2_2
                  L0_3 = L0_3[L1_3]
                  L0_3 = L0_3.RepairingData
                  L0_3.Ready = true
                  L0_3 = TriggerClientEvent
                  L1_3 = "weapons:client:SyncRepairShops"
                  L2_3 = L4_2
                  L3_3 = Config
                  L3_3 = L3_3.WeaponRepairPoints
                  L4_3 = A2_2
                  L3_3 = L3_3[L4_3]
                  L4_3 = A2_2
                  L0_3(L1_3, L2_3, L3_3, L4_3)
                  L0_3 = SetTimeout
                  L1_3 = 420000
                  function L2_3()
                    local L0_4, L1_4, L2_4, L3_4, L4_4
                    L0_4 = Config
                    L0_4 = L0_4.WeaponRepairPoints
                    L1_4 = A2_2
                    L0_4 = L0_4[L1_4]
                    L0_4 = L0_4.RepairingData
                    L0_4 = L0_4.Ready
                    if L0_4 then
                      L0_4 = Config
                      L0_4 = L0_4.WeaponRepairPoints
                      L1_4 = A2_2
                      L0_4 = L0_4[L1_4]
                      L0_4.IsRepairing = false
                      L0_4 = Config
                      L0_4 = L0_4.WeaponRepairPoints
                      L1_4 = A2_2
                      L0_4 = L0_4[L1_4]
                      L1_4 = {}
                      L0_4.RepairingData = L1_4
                      L0_4 = TriggerClientEvent
                      L1_4 = "weapons:client:SyncRepairShops"
                      L2_4 = L4_2
                      L3_4 = Config
                      L3_4 = L3_4.WeaponRepairPoints
                      L4_4 = A2_2
                      L3_4 = L3_4[L4_4]
                      L4_4 = A2_2
                      L0_4(L1_4, L2_4, L3_4, L4_4)
                    end
                  end
                  L0_3(L1_3, L2_3)
                end
                L11_2(L12_2, L13_2)
                L11_2 = A1_2
                L12_2 = true
                L11_2(L12_2)
              else
                L11_2 = TriggerClientEvent
                L12_2 = "qs-inventory:sendMessage"
                L13_2 = L4_2
                L14_2 = Lang
                L15_2 = "NO_MONEY"
                L14_2 = L14_2(L15_2)
                L15_2 = "error"
                L11_2(L12_2, L13_2, L14_2, L15_2)
                L11_2 = A1_2
                L12_2 = false
                L11_2(L12_2)
              end
            else
              L11_2 = Config
              L11_2 = L11_2.RepairAccount
              if "black_money" == L11_2 then
                L11_2 = L5_2.getAccount
                L12_2 = "black_money"
                L11_2 = L11_2(L12_2)
                L11_2 = L11_2.money
                L12_2 = Config
                L12_2 = L12_2.WeaponRepairCotsts
                L12_2 = L12_2[L10_2]
                if L11_2 >= L12_2 then
                  L11_2 = L5_2.removeAccountMoney
                  L12_2 = "black_money"
                  L13_2 = Config
                  L13_2 = L13_2.WeaponRepairCotsts
                  L13_2 = L13_2[L10_2]
                  L11_2(L12_2, L13_2)
                  L11_2 = Config
                  L11_2 = L11_2.WeaponRepairPoints
                  L11_2 = L11_2[A2_2]
                  L11_2.IsRepairing = true
                  L11_2 = Config
                  L11_2 = L11_2.WeaponRepairPoints
                  L11_2 = L11_2[A2_2]
                  L12_2 = {}
                  L13_2 = L5_2.identifier
                  L12_2.Identifier = L13_2
                  L13_2 = L6_2.PlayerData
                  L13_2 = L13_2.items
                  L14_2 = A3_2.slot
                  L13_2 = L13_2[L14_2]
                  L12_2.WeaponData = L13_2
                  L12_2.Ready = false
                  L11_2.RepairingData = L12_2
                  L11_2 = TriggerClientEvent
                  L12_2 = "inventory:client:ItemBox"
                  L13_2 = L4_2
                  L14_2 = QS
                  L14_2 = L14_2.Shared
                  L14_2 = L14_2.Items
                  L15_2 = A3_2.name
                  L14_2 = L14_2[L15_2]
                  L15_2 = "remove"
                  L11_2(L12_2, L13_2, L14_2, L15_2)
                  L11_2 = TriggerClientEvent
                  L12_2 = "inventory:client:CheckWeapon"
                  L13_2 = L4_2
                  L14_2 = A3_2.name
                  L11_2(L12_2, L13_2, L14_2)
                  L11_2 = TriggerClientEvent
                  L12_2 = "weapons:client:SyncRepairShops"
                  L13_2 = L4_2
                  L14_2 = Config
                  L14_2 = L14_2.WeaponRepairPoints
                  L14_2 = L14_2[A2_2]
                  L15_2 = A2_2
                  L11_2(L12_2, L13_2, L14_2, L15_2)
                  L11_2 = SetTimeout
                  L12_2 = 4000
                  function L13_2()
                    local L0_3, L1_3, L2_3, L3_3, L4_3
                    L0_3 = Config
                    L0_3 = L0_3.WeaponRepairPoints
                    L1_3 = A2_2
                    L0_3 = L0_3[L1_3]
                    L0_3.IsRepairing = false
                    L0_3 = Config
                    L0_3 = L0_3.WeaponRepairPoints
                    L1_3 = A2_2
                    L0_3 = L0_3[L1_3]
                    L0_3 = L0_3.RepairingData
                    L0_3.Ready = true
                    L0_3 = TriggerClientEvent
                    L1_3 = "weapons:client:SyncRepairShops"
                    L2_3 = L4_2
                    L3_3 = Config
                    L3_3 = L3_3.WeaponRepairPoints
                    L4_3 = A2_2
                    L3_3 = L3_3[L4_3]
                    L4_3 = A2_2
                    L0_3(L1_3, L2_3, L3_3, L4_3)
                    L0_3 = SetTimeout
                    L1_3 = 420000
                    function L2_3()
                      local L0_4, L1_4, L2_4, L3_4, L4_4
                      L0_4 = Config
                      L0_4 = L0_4.WeaponRepairPoints
                      L1_4 = A2_2
                      L0_4 = L0_4[L1_4]
                      L0_4 = L0_4.RepairingData
                      L0_4 = L0_4.Ready
                      if L0_4 then
                        L0_4 = Config
                        L0_4 = L0_4.WeaponRepairPoints
                        L1_4 = A2_2
                        L0_4 = L0_4[L1_4]
                        L0_4.IsRepairing = false
                        L0_4 = Config
                        L0_4 = L0_4.WeaponRepairPoints
                        L1_4 = A2_2
                        L0_4 = L0_4[L1_4]
                        L1_4 = {}
                        L0_4.RepairingData = L1_4
                        L0_4 = TriggerClientEvent
                        L1_4 = "weapons:client:SyncRepairShops"
                        L2_4 = L4_2
                        L3_4 = Config
                        L3_4 = L3_4.WeaponRepairPoints
                        L4_4 = A2_2
                        L3_4 = L3_4[L4_4]
                        L4_4 = A2_2
                        L0_4(L1_4, L2_4, L3_4, L4_4)
                      end
                    end
                    L0_3(L1_3, L2_3)
                  end
                  L11_2(L12_2, L13_2)
                  L11_2 = A1_2
                  L12_2 = true
                  L11_2(L12_2)
                else
                  L11_2 = TriggerClientEvent
                  L12_2 = "qs-inventory:sendMessage"
                  L13_2 = L4_2
                  L14_2 = Lang
                  L15_2 = "NO_MONEY"
                  L14_2 = L14_2(L15_2)
                  L15_2 = "error"
                  L11_2(L12_2, L13_2, L14_2, L15_2)
                  L11_2 = A1_2
                  L12_2 = false
                  L11_2(L12_2)
                end
              end
            end
          end
        else
          L11_2 = TriggerClientEvent
          L12_2 = "qs-inventory:sendMessage"
          L13_2 = L4_2
          L14_2 = Lang
          L15_2 = "WEAPON_NO_BROKEN"
          L14_2 = L14_2(L15_2)
          L15_2 = "error"
          L11_2(L12_2, L13_2, L14_2, L15_2)
          L11_2 = A1_2
          L12_2 = false
          L11_2(L12_2)
        end
      else
        L11_2 = TriggerClientEvent
        L12_2 = "qs-inventory:sendMessage"
        L13_2 = L4_2
        L14_2 = Lang
        L15_2 = "WEAPON_NO_BROKEN"
        L14_2 = L14_2(L15_2)
        L15_2 = "error"
        L11_2(L12_2, L13_2, L14_2, L15_2)
        L11_2 = A1_2
        L12_2 = false
        L11_2(L12_2)
      end
    else
      L11_2 = TriggerClientEvent
      L12_2 = "qs-inventory:sendMessage"
      L13_2 = L4_2
      L14_2 = Lang
      L15_2 = "NO_WEAPONS"
      L14_2 = L14_2(L15_2)
      L15_2 = "error"
      L11_2(L12_2, L13_2, L14_2, L15_2)
      L11_2 = TriggerClientEvent
      L12_2 = "weapons:client:SetCurrentWeapon"
      L13_2 = L4_2
      L14_2 = {}
      L15_2 = false
      L11_2(L12_2, L13_2, L14_2, L15_2)
      L11_2 = A1_2
      L12_2 = false
      L11_2(L12_2)
    end
  end
  L2_1(L3_1, L4_1)
else
  L2_1 = Config
  L2_1 = L2_1.Framework
  if "QBCore" == L2_1 then
    L2_1 = QBCore
    L2_1 = L2_1.Functions
    L2_1 = L2_1.CreateCallback
    L3_1 = "weapons:server:RepairWeapon"
    function L4_1(A0_2, A1_2, A2_2, A3_2)
      local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
      L4_2 = A0_2
      L5_2 = QBCore
      L5_2 = L5_2.Functions
      L5_2 = L5_2.GetPlayer
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L6_2 = L5_2
      L7_2 = 60000
      L8_2 = math
      L8_2 = L8_2.random
      L9_2 = 5 * L7_2
      L10_2 = 10 * L7_2
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = QBCore
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Weapons
      L10_2 = GetHashKey
      L11_2 = A3_2.name
      L10_2 = L10_2(L11_2)
      L9_2 = L9_2[L10_2]
      L10_2 = QBCore
      L10_2 = L10_2.Shared
      L10_2 = L10_2.SplitStr
      L11_2 = L9_2.ammotype
      L12_2 = "_"
      L10_2 = L10_2(L11_2, L12_2)
      L10_2 = L10_2[2]
      L11_2 = L10_2
      L10_2 = L10_2.lower
      L10_2 = L10_2(L11_2)
      L11_2 = L5_2.PlayerData
      L11_2 = L11_2.money
      L12_2 = Config
      L12_2 = L12_2.RepairAccount
      L11_2 = L11_2[L12_2]
      L12_2 = L6_2.PlayerData
      L12_2 = L12_2.items
      L13_2 = A3_2.slot
      L12_2 = L12_2[L13_2]
      if nil ~= L12_2 then
        L12_2 = L6_2.PlayerData
        L12_2 = L12_2.items
        L13_2 = A3_2.slot
        L12_2 = L12_2[L13_2]
        L12_2 = L12_2.info
        L12_2 = L12_2.quality
        if nil ~= L12_2 then
          L12_2 = L6_2.PlayerData
          L12_2 = L12_2.items
          L13_2 = A3_2.slot
          L12_2 = L12_2[L13_2]
          L12_2 = L12_2.info
          L12_2 = L12_2.quality
          if 100 ~= L12_2 then
            L12_2 = Config
            L12_2 = L12_2.RepairAccount
            if L12_2 then
              if L11_2 then
                L12_2 = Config
                L12_2 = L12_2.WeaponRepairCotsts
                L12_2 = L12_2[L10_2]
                if L11_2 >= L12_2 then
                  L12_2 = L5_2.Functions
                  L12_2 = L12_2.RemoveMoney
                  L13_2 = Config
                  L13_2 = L13_2.RepairAccount
                  L14_2 = Config
                  L14_2 = L14_2.WeaponRepairCotsts
                  L14_2 = L14_2[L10_2]
                  L12_2(L13_2, L14_2)
                  L12_2 = Config
                  L12_2 = L12_2.WeaponRepairPoints
                  L12_2 = L12_2[A2_2]
                  L12_2.IsRepairing = true
                  L12_2 = Config
                  L12_2 = L12_2.WeaponRepairPoints
                  L12_2 = L12_2[A2_2]
                  L13_2 = {}
                  L14_2 = L6_2.PlayerData
                  L14_2 = L14_2.citizenid
                  L13_2.Identifier = L14_2
                  L14_2 = L6_2.PlayerData
                  L14_2 = L14_2.items
                  L15_2 = A3_2.slot
                  L14_2 = L14_2[L15_2]
                  L13_2.WeaponData = L14_2
                  L13_2.Ready = false
                  L12_2.RepairingData = L13_2
                  L12_2 = TriggerClientEvent
                  L13_2 = "inventory:client:ItemBox"
                  L14_2 = L4_2
                  L15_2 = QBCore
                  L15_2 = L15_2.Shared
                  L15_2 = L15_2.Items
                  L16_2 = A3_2.name
                  L15_2 = L15_2[L16_2]
                  L16_2 = "remove"
                  L12_2(L13_2, L14_2, L15_2, L16_2)
                  L12_2 = TriggerClientEvent
                  L13_2 = "inventory:client:CheckWeapon"
                  L14_2 = L4_2
                  L15_2 = A3_2.name
                  L12_2(L13_2, L14_2, L15_2)
                  L12_2 = TriggerClientEvent
                  L13_2 = "weapons:client:SyncRepairShops"
                  L14_2 = L4_2
                  L15_2 = Config
                  L15_2 = L15_2.WeaponRepairPoints
                  L15_2 = L15_2[A2_2]
                  L16_2 = A2_2
                  L12_2(L13_2, L14_2, L15_2, L16_2)
                  L12_2 = SetTimeout
                  L13_2 = 4000
                  function L14_2()
                    local L0_3, L1_3, L2_3, L3_3, L4_3
                    L0_3 = Config
                    L0_3 = L0_3.WeaponRepairPoints
                    L1_3 = A2_2
                    L0_3 = L0_3[L1_3]
                    L0_3.IsRepairing = false
                    L0_3 = Config
                    L0_3 = L0_3.WeaponRepairPoints
                    L1_3 = A2_2
                    L0_3 = L0_3[L1_3]
                    L0_3 = L0_3.RepairingData
                    L0_3.Ready = true
                    L0_3 = TriggerClientEvent
                    L1_3 = "weapons:client:SyncRepairShops"
                    L2_3 = L4_2
                    L3_3 = Config
                    L3_3 = L3_3.WeaponRepairPoints
                    L4_3 = A2_2
                    L3_3 = L3_3[L4_3]
                    L4_3 = A2_2
                    L0_3(L1_3, L2_3, L3_3, L4_3)
                    L0_3 = SetTimeout
                    L1_3 = 420000
                    function L2_3()
                      local L0_4, L1_4, L2_4, L3_4, L4_4
                      L0_4 = Config
                      L0_4 = L0_4.WeaponRepairPoints
                      L1_4 = A2_2
                      L0_4 = L0_4[L1_4]
                      L0_4 = L0_4.RepairingData
                      L0_4 = L0_4.Ready
                      if L0_4 then
                        L0_4 = Config
                        L0_4 = L0_4.WeaponRepairPoints
                        L1_4 = A2_2
                        L0_4 = L0_4[L1_4]
                        L0_4.IsRepairing = false
                        L0_4 = Config
                        L0_4 = L0_4.WeaponRepairPoints
                        L1_4 = A2_2
                        L0_4 = L0_4[L1_4]
                        L1_4 = {}
                        L0_4.RepairingData = L1_4
                        L0_4 = TriggerClientEvent
                        L1_4 = "weapons:client:SyncRepairShops"
                        L2_4 = L4_2
                        L3_4 = Config
                        L3_4 = L3_4.WeaponRepairPoints
                        L4_4 = A2_2
                        L3_4 = L3_4[L4_4]
                        L4_4 = A2_2
                        L0_4(L1_4, L2_4, L3_4, L4_4)
                      end
                    end
                    L0_3(L1_3, L2_3)
                  end
                  L12_2(L13_2, L14_2)
                  L12_2 = A1_2
                  L13_2 = true
                  L12_2(L13_2)
              end
              else
                L12_2 = TriggerClientEvent
                L13_2 = "qs-inventory:sendMessage"
                L14_2 = L4_2
                L15_2 = Lang
                L16_2 = "NO_MONEY"
                L15_2 = L15_2(L16_2)
                L16_2 = "error"
                L12_2(L13_2, L14_2, L15_2, L16_2)
                L12_2 = A1_2
                L13_2 = false
                L12_2(L13_2)
              end
            else
              L12_2 = TriggerClientEvent
              L13_2 = "qs-inventory:sendMessage"
              L14_2 = L4_2
              L15_2 = Lang
              L16_2 = "WEAPON_NO_BROKEN"
              L15_2 = L15_2(L16_2)
              L16_2 = "error"
              L12_2(L13_2, L14_2, L15_2, L16_2)
              L12_2 = A1_2
              L13_2 = false
              L12_2(L13_2)
            end
          end
        else
          L12_2 = TriggerClientEvent
          L13_2 = "qs-inventory:sendMessage"
          L14_2 = L4_2
          L15_2 = Lang
          L16_2 = "WEAPON_NO_BROKEN"
          L15_2 = L15_2(L16_2)
          L16_2 = "error"
          L12_2(L13_2, L14_2, L15_2, L16_2)
          L12_2 = A1_2
          L13_2 = false
          L12_2(L13_2)
        end
      else
        L12_2 = TriggerClientEvent
        L13_2 = "qs-inventory:sendMessage"
        L14_2 = L4_2
        L15_2 = Lang
        L16_2 = "NO_WEAPONS"
        L15_2 = L15_2(L16_2)
        L16_2 = "error"
        L12_2(L13_2, L14_2, L15_2, L16_2)
        L12_2 = TriggerClientEvent
        L13_2 = "weapons:client:SetCurrentWeapon"
        L14_2 = L4_2
        L15_2 = {}
        L16_2 = false
        L12_2(L13_2, L14_2, L15_2, L16_2)
        L12_2 = A1_2
        L13_2 = false
        L12_2(L13_2)
      end
    end
    L2_1(L3_1, L4_1)
  end
end
L2_1 = RegisterServerEvent
L3_1 = "weapons:server:TakeBackWeapon"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "weapons:server:TakeBackWeapon"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = source
    L3_2 = ESX
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = QS
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    if L4_2 and L3_2 then
      L5_2 = Config
      L5_2 = L5_2.WeaponRepairPoints
      L5_2 = L5_2[A0_2]
      L5_2 = L5_2.RepairingData
      L5_2 = L5_2.WeaponData
      L6_2 = L5_2.type
      if "weapon" == L6_2 then
        L6_2 = L4_2.GetItemBySlot
        L7_2 = L5_2.slot
        L6_2 = L6_2(L7_2)
        if L6_2 then
          L7_2 = L6_2.amount
          if L7_2 then
            L7_2 = L6_2.amount
            if L7_2 > 0 then
              L7_2 = L5_2.info
              L7_2.quality = 100
              L7_2 = L4_2.removeItem
              L8_2 = L5_2.name
              L9_2 = 1
              L10_2 = L5_2.slot
              L7_2(L8_2, L9_2, L10_2)
              L7_2 = L4_2.addItem
              L8_2 = L5_2.name
              L9_2 = 1
              L10_2 = false
              L11_2 = L5_2.info
              L7_2(L8_2, L9_2, L10_2, L11_2)
              L7_2 = TriggerClientEvent
              L8_2 = "inventory:client:ItemBox"
              L9_2 = L2_2
              L10_2 = QS
              L10_2 = L10_2.Shared
              L10_2 = L10_2.Items
              L11_2 = L5_2.name
              L10_2 = L10_2[L11_2]
              L11_2 = "add"
              L7_2(L8_2, L9_2, L10_2, L11_2)
              L7_2 = Config
              L7_2 = L7_2.WeaponRepairPoints
              L7_2 = L7_2[A0_2]
              L7_2.IsRepairing = false
              L7_2 = Config
              L7_2 = L7_2.WeaponRepairPoints
              L7_2 = L7_2[A0_2]
              L8_2 = {}
              L7_2.RepairingData = L8_2
              L7_2 = TriggerClientEvent
              L8_2 = "weapons:client:SyncRepairShops"
              L9_2 = L2_2
              L10_2 = Config
              L10_2 = L10_2.WeaponRepairPoints
              L10_2 = L10_2[A0_2]
              L11_2 = A0_2
              L7_2(L8_2, L9_2, L10_2, L11_2)
            end
          end
        end
      end
    end
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = source
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L4_2 = Config
        L4_2 = L4_2.WeaponRepairPoints
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.RepairingData
        L4_2 = L4_2.WeaponData
        L5_2 = L4_2.type
        if "weapon" == L5_2 then
          L5_2 = L3_2.Functions
          L5_2 = L5_2.GetItemBySlot
          L6_2 = L4_2.slot
          L5_2 = L5_2(L6_2)
          if L5_2 then
            L6_2 = L5_2.amount
            if L6_2 then
              L6_2 = L5_2.amount
              if L6_2 > 0 then
                L6_2 = L4_2.info
                L6_2.quality = 100
                L6_2 = L3_2.Functions
                L6_2 = L6_2.RemoveItem
                L7_2 = L4_2.name
                L8_2 = 1
                L9_2 = L4_2.slot
                L6_2(L7_2, L8_2, L9_2)
                L6_2 = L3_2.Functions
                L6_2 = L6_2.AddItem
                L7_2 = L4_2.name
                L8_2 = 1
                L9_2 = false
                L10_2 = L4_2.info
                L6_2(L7_2, L8_2, L9_2, L10_2)
                L6_2 = TriggerClientEvent
                L7_2 = "inventory:client:ItemBox"
                L8_2 = L2_2
                L9_2 = QBCore
                L9_2 = L9_2.Shared
                L9_2 = L9_2.Items
                L10_2 = L4_2.name
                L9_2 = L9_2[L10_2]
                L10_2 = "add"
                L6_2(L7_2, L8_2, L9_2, L10_2)
                L6_2 = Config
                L6_2 = L6_2.WeaponRepairPoints
                L6_2 = L6_2[A0_2]
                L6_2.IsRepairing = false
                L6_2 = Config
                L6_2 = L6_2.WeaponRepairPoints
                L6_2 = L6_2[A0_2]
                L7_2 = {}
                L6_2.RepairingData = L7_2
                L6_2 = TriggerClientEvent
                L7_2 = "weapons:client:SyncRepairShops"
                L8_2 = L2_2
                L9_2 = Config
                L9_2 = L9_2.WeaponRepairPoints
                L9_2 = L9_2[A0_2]
                L10_2 = A0_2
                L6_2(L7_2, L8_2, L9_2, L10_2)
              end
            end
          end
        end
      end
    end
  end
end
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = false
  L3_2 = nil
  L4_2 = pairs
  L5_2 = A1_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.component
    if L10_2 == A0_2 then
      L3_2 = L8_2
      L2_2 = true
    end
  end
  L4_2 = L2_2
  L5_2 = L3_2
  return L4_2, L5_2
end
HasAttachment = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = nil
  L3_2 = pairs
  L4_2 = Config
  L4_2 = L4_2.WeaponAttachments
  L4_2 = L4_2[A0_2]
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.component
    if L9_2 == A1_2 then
      L2_2 = L8_2.item
    end
  end
  return L2_2
end
GetAttachmentItem = L2_1
L2_1 = RegisterServerEvent
L3_1 = "weapons:server:EquipAttachment"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "weapons:server:EquipAttachment"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = source
    L4_2 = QS
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = L4_2.PlayerData
    L5_2 = L5_2.items
    L6_2 = nil
    L7_2 = "none"
    L8_2 = L4_2.GetItemBySlot
    L9_2 = A0_2.slot
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L9_2 = L8_2.name
      L10_2 = A0_2.name
      if L9_2 == L10_2 then
        L9_2 = L8_2.amount
        if L9_2 > 0 then
          L9_2 = A0_2.info
          L9_2 = L9_2.urltint
          if nil ~= L9_2 then
            L9_2 = tostring
            L10_2 = A0_2.info
            L10_2 = L10_2.urltint
            L9_2 = L9_2(L10_2)
            L7_2 = L9_2
          end
          L9_2 = A1_2.slot
          L9_2 = L5_2[L9_2]
          if nil ~= L9_2 then
            L9_2 = A1_2.slot
            L9_2 = L5_2[L9_2]
            L9_2 = L9_2.info
            L9_2 = L9_2.attachments
            if nil ~= L9_2 then
              L9_2 = next
              L10_2 = A1_2.slot
              L10_2 = L5_2[L10_2]
              L10_2 = L10_2.info
              L10_2 = L10_2.attachments
              L9_2 = L9_2(L10_2)
              if nil ~= L9_2 then
                L9_2 = HasAttachment
                L10_2 = A2_2.component
                L11_2 = A1_2.slot
                L11_2 = L5_2[L11_2]
                L11_2 = L11_2.info
                L11_2 = L11_2.attachments
                L9_2, L10_2 = L9_2(L10_2, L11_2)
                if not L9_2 then
                  L11_2 = A1_2.name
                  if "weapon_compactrifle" == L11_2 then
                    L11_2 = "COMPONENT_COMPACTRIFLE_CLIP_03"
                    L12_2 = A2_2.component
                    if "COMPONENT_COMPACTRIFLE_CLIP_03" == L12_2 then
                      L11_2 = "COMPONENT_COMPACTRIFLE_CLIP_02"
                    end
                    L12_2 = pairs
                    L13_2 = A1_2.slot
                    L13_2 = L5_2[L13_2]
                    L13_2 = L13_2.info
                    L13_2 = L13_2.attachments
                    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
                    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
                      L18_2 = L17_2.component
                      if L18_2 == L11_2 then
                        L18_2 = HasAttachment
                        L19_2 = L11_2
                        L20_2 = A1_2.slot
                        L20_2 = L5_2[L20_2]
                        L20_2 = L20_2.info
                        L20_2 = L20_2.attachments
                        L18_2, L19_2 = L18_2(L19_2, L20_2)
                        L20_2 = GetAttachmentItem
                        L21_2 = A1_2.name
                        L22_2 = L21_2
                        L21_2 = L21_2.upper
                        L21_2 = L21_2(L22_2)
                        L22_2 = L11_2
                        L20_2 = L20_2(L21_2, L22_2)
                        L21_2 = tostring
                        L22_2 = L20_2
                        L21_2 = L21_2(L22_2)
                        L22_2 = L21_2
                        L21_2 = L21_2.lower
                        L21_2 = L21_2(L22_2)
                        L6_2 = L21_2
                        L21_2 = table
                        L21_2 = L21_2.remove
                        L22_2 = A1_2.slot
                        L22_2 = L5_2[L22_2]
                        L22_2 = L22_2.info
                        L22_2 = L22_2.attachments
                        L23_2 = L19_2
                        L21_2(L22_2, L23_2)
                        L21_2 = TriggerClientEvent
                        L22_2 = "inventory:client:ItemBox"
                        L23_2 = L3_2
                        L24_2 = QS
                        L24_2 = L24_2.Shared
                        L24_2 = L24_2.Items
                        L24_2 = L24_2[L20_2]
                        L25_2 = "add"
                        L21_2(L22_2, L23_2, L24_2, L25_2)
                      end
                    end
                  end
                  L11_2 = table
                  L11_2 = L11_2.insert
                  L12_2 = A1_2.slot
                  L12_2 = L5_2[L12_2]
                  L12_2 = L12_2.info
                  L12_2 = L12_2.attachments
                  L13_2 = {}
                  L14_2 = A2_2.component
                  L13_2.component = L14_2
                  L14_2 = A2_2.label
                  L13_2.label = L14_2
                  L13_2.urltint = L7_2
                  L11_2(L12_2, L13_2)
                  L11_2 = A1_2.slot
                  L11_2 = L5_2[L11_2]
                  L11_2 = L11_2.info
                  L11_2.tinturl = L7_2
                  L11_2 = TriggerClientEvent
                  L12_2 = "addAttachment"
                  L13_2 = L3_2
                  L14_2 = A2_2.component
                  L15_2 = L7_2
                  L11_2(L12_2, L13_2, L14_2, L15_2)
                  L11_2 = L4_2.SetInventory
                  L12_2 = L4_2.PlayerData
                  L12_2 = L12_2.items
                  L11_2(L12_2)
                  L11_2 = L4_2.removeItem
                  L12_2 = A0_2.name
                  L13_2 = 1
                  L11_2(L12_2, L13_2)
                  L11_2 = SetTimeout
                  L12_2 = 1000
                  function L13_2()
                    local L0_3, L1_3, L2_3, L3_3, L4_3
                    L0_3 = TriggerClientEvent
                    L1_3 = "inventory:client:ItemBox"
                    L2_3 = L3_2
                    L3_3 = A0_2
                    L4_3 = "remove"
                    L0_3(L1_3, L2_3, L3_3, L4_3)
                  end
                  L11_2(L12_2, L13_2)
                else
                  L11_2 = TriggerClientEvent
                  L12_2 = "qs-inventory:sendMessage"
                  L13_2 = source
                  L14_2 = Lang
                  L15_2 = "WEAPON_REPEAT_ATTACHMENT"
                  L14_2 = L14_2(L15_2)
                  L15_2 = A2_2.label
                  L16_2 = L15_2
                  L15_2 = L15_2.lower
                  L15_2 = L15_2(L16_2)
                  L14_2 = L14_2 .. L15_2
                  L15_2 = "error"
                  L11_2(L12_2, L13_2, L14_2, L15_2)
                end
            end
            else
              L9_2 = A1_2.slot
              L9_2 = L5_2[L9_2]
              L9_2 = L9_2.info
              L10_2 = {}
              L9_2.attachments = L10_2
              L9_2 = table
              L9_2 = L9_2.insert
              L10_2 = A1_2.slot
              L10_2 = L5_2[L10_2]
              L10_2 = L10_2.info
              L10_2 = L10_2.attachments
              L11_2 = {}
              L12_2 = A2_2.component
              L11_2.component = L12_2
              L12_2 = A2_2.label
              L11_2.label = L12_2
              L11_2.urltint = L7_2
              L9_2(L10_2, L11_2)
              L9_2 = A1_2.slot
              L9_2 = L5_2[L9_2]
              L9_2 = L9_2.info
              L9_2.tinturl = L7_2
              L9_2 = TriggerClientEvent
              L10_2 = "addAttachment"
              L11_2 = L3_2
              L12_2 = A2_2.component
              L13_2 = L7_2
              L9_2(L10_2, L11_2, L12_2, L13_2)
              L9_2 = L4_2.SetInventory
              L10_2 = L4_2.PlayerData
              L10_2 = L10_2.items
              L9_2(L10_2)
              L9_2 = L4_2.removeItem
              L10_2 = A0_2.name
              L11_2 = 1
              L9_2(L10_2, L11_2)
              L9_2 = SetTimeout
              L10_2 = 1000
              function L11_2()
                local L0_3, L1_3, L2_3, L3_3, L4_3
                L0_3 = TriggerClientEvent
                L1_3 = "inventory:client:ItemBox"
                L2_3 = L3_2
                L3_3 = A0_2
                L4_3 = "remove"
                L0_3(L1_3, L2_3, L3_3, L4_3)
              end
              L9_2(L10_2, L11_2)
            end
          end
          if nil ~= L6_2 then
            L9_2 = L4_2.addItem
            L10_2 = L6_2
            L11_2 = 1
            L12_2 = false
            L9_2(L10_2, L11_2, L12_2)
            L6_2 = nil
          end
        end
      end
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = source
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = L4_2.PlayerData
      L5_2 = L5_2.items
      L6_2 = nil
      L7_2 = "none"
      L8_2 = L4_2.Functions
      L8_2 = L8_2.GetItemBySlot
      L9_2 = A0_2.slot
      L8_2 = L8_2(L9_2)
      if L8_2 then
        L9_2 = L8_2.name
        L10_2 = A0_2.name
        if L9_2 == L10_2 then
          L9_2 = L8_2.amount
          if L9_2 > 0 then
            L9_2 = A0_2.info
            L9_2 = L9_2.urltint
            if nil ~= L9_2 then
              L9_2 = tostring
              L10_2 = A0_2.info
              L10_2 = L10_2.urltint
              L9_2 = L9_2(L10_2)
              L7_2 = L9_2
            end
            L9_2 = A1_2.slot
            L9_2 = L5_2[L9_2]
            if nil ~= L9_2 then
              L9_2 = A1_2.slot
              L9_2 = L5_2[L9_2]
              L9_2 = L9_2.info
              L9_2 = L9_2.attachments
              if nil ~= L9_2 then
                L9_2 = next
                L10_2 = A1_2.slot
                L10_2 = L5_2[L10_2]
                L10_2 = L10_2.info
                L10_2 = L10_2.attachments
                L9_2 = L9_2(L10_2)
                if nil ~= L9_2 then
                  L9_2 = HasAttachment
                  L10_2 = A2_2.component
                  L11_2 = A1_2.slot
                  L11_2 = L5_2[L11_2]
                  L11_2 = L11_2.info
                  L11_2 = L11_2.attachments
                  L9_2, L10_2 = L9_2(L10_2, L11_2)
                  if not L9_2 then
                    L11_2 = A1_2.name
                    if "weapon_compactrifle" == L11_2 then
                      L11_2 = "COMPONENT_COMPACTRIFLE_CLIP_03"
                      L12_2 = A2_2.component
                      if "COMPONENT_COMPACTRIFLE_CLIP_03" == L12_2 then
                        L11_2 = "COMPONENT_COMPACTRIFLE_CLIP_02"
                      end
                      L12_2 = pairs
                      L13_2 = A1_2.slot
                      L13_2 = L5_2[L13_2]
                      L13_2 = L13_2.info
                      L13_2 = L13_2.attachments
                      L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
                      for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
                        L18_2 = L17_2.component
                        if L18_2 == L11_2 then
                          L18_2 = HasAttachment
                          L19_2 = L11_2
                          L20_2 = A1_2.slot
                          L20_2 = L5_2[L20_2]
                          L20_2 = L20_2.info
                          L20_2 = L20_2.attachments
                          L18_2, L19_2 = L18_2(L19_2, L20_2)
                          L20_2 = GetAttachmentItem
                          L21_2 = A1_2.name
                          L22_2 = L21_2
                          L21_2 = L21_2.upper
                          L21_2 = L21_2(L22_2)
                          L22_2 = L11_2
                          L20_2 = L20_2(L21_2, L22_2)
                          L21_2 = tostring
                          L22_2 = L20_2
                          L21_2 = L21_2(L22_2)
                          L22_2 = L21_2
                          L21_2 = L21_2.lower
                          L21_2 = L21_2(L22_2)
                          L6_2 = L21_2
                          L21_2 = table
                          L21_2 = L21_2.remove
                          L22_2 = A1_2.slot
                          L22_2 = L5_2[L22_2]
                          L22_2 = L22_2.info
                          L22_2 = L22_2.attachments
                          L23_2 = L19_2
                          L21_2(L22_2, L23_2)
                          L21_2 = TriggerClientEvent
                          L22_2 = "inventory:client:ItemBox"
                          L23_2 = L3_2
                          L24_2 = QBCore
                          L24_2 = L24_2.Shared
                          L24_2 = L24_2.Items
                          L24_2 = L24_2[L20_2]
                          L25_2 = "add"
                          L21_2(L22_2, L23_2, L24_2, L25_2)
                        end
                      end
                    end
                    L11_2 = table
                    L11_2 = L11_2.insert
                    L12_2 = A1_2.slot
                    L12_2 = L5_2[L12_2]
                    L12_2 = L12_2.info
                    L12_2 = L12_2.attachments
                    L13_2 = {}
                    L14_2 = A2_2.component
                    L13_2.component = L14_2
                    L14_2 = A2_2.label
                    L13_2.label = L14_2
                    L13_2.urltint = L7_2
                    L11_2(L12_2, L13_2)
                    L11_2 = A1_2.slot
                    L11_2 = L5_2[L11_2]
                    L11_2 = L11_2.info
                    L11_2.tinturl = L7_2
                    L11_2 = TriggerClientEvent
                    L12_2 = "addAttachment"
                    L13_2 = L3_2
                    L14_2 = A2_2.component
                    L15_2 = L7_2
                    L11_2(L12_2, L13_2, L14_2, L15_2)
                    L11_2 = L4_2.Functions
                    L11_2 = L11_2.SetInventory
                    L12_2 = L4_2.PlayerData
                    L12_2 = L12_2.items
                    L11_2(L12_2)
                    L11_2 = L4_2.Functions
                    L11_2 = L11_2.RemoveItem
                    L12_2 = A0_2.name
                    L13_2 = 1
                    L11_2(L12_2, L13_2)
                    L11_2 = SetTimeout
                    L12_2 = 1000
                    function L13_2()
                      local L0_3, L1_3, L2_3, L3_3, L4_3
                      L0_3 = TriggerClientEvent
                      L1_3 = "inventory:client:ItemBox"
                      L2_3 = L3_2
                      L3_3 = A0_2
                      L4_3 = "remove"
                      L0_3(L1_3, L2_3, L3_3, L4_3)
                    end
                    L11_2(L12_2, L13_2)
                  else
                    L11_2 = TriggerClientEvent
                    L12_2 = "qs-inventory:sendMessage"
                    L13_2 = source
                    L14_2 = Lang
                    L15_2 = "WEAPON_REPEAT_ATTACHMENT"
                    L14_2 = L14_2(L15_2)
                    L15_2 = A2_2.label
                    L16_2 = L15_2
                    L15_2 = L15_2.lower
                    L15_2 = L15_2(L16_2)
                    L14_2 = L14_2 .. L15_2
                    L15_2 = "error"
                    L11_2(L12_2, L13_2, L14_2, L15_2)
                  end
              end
              else
                L9_2 = A1_2.slot
                L9_2 = L5_2[L9_2]
                L9_2 = L9_2.info
                L10_2 = {}
                L9_2.attachments = L10_2
                L9_2 = table
                L9_2 = L9_2.insert
                L10_2 = A1_2.slot
                L10_2 = L5_2[L10_2]
                L10_2 = L10_2.info
                L10_2 = L10_2.attachments
                L11_2 = {}
                L12_2 = A2_2.component
                L11_2.component = L12_2
                L12_2 = A2_2.label
                L11_2.label = L12_2
                L11_2.urltint = L7_2
                L9_2(L10_2, L11_2)
                L9_2 = A1_2.slot
                L9_2 = L5_2[L9_2]
                L9_2 = L9_2.info
                L9_2.tinturl = L7_2
                L9_2 = TriggerClientEvent
                L10_2 = "addAttachment"
                L11_2 = L3_2
                L12_2 = A2_2.component
                L13_2 = L7_2
                L9_2(L10_2, L11_2, L12_2, L13_2)
                L9_2 = L4_2.Functions
                L9_2 = L9_2.SetInventory
                L10_2 = L4_2.PlayerData
                L10_2 = L10_2.items
                L9_2(L10_2)
                L9_2 = L4_2.Functions
                L9_2 = L9_2.RemoveItem
                L10_2 = A0_2.name
                L11_2 = 1
                L9_2(L10_2, L11_2)
                L9_2 = SetTimeout
                L10_2 = 1000
                function L11_2()
                  local L0_3, L1_3, L2_3, L3_3, L4_3
                  L0_3 = TriggerClientEvent
                  L1_3 = "inventory:client:ItemBox"
                  L2_3 = L3_2
                  L3_3 = A0_2
                  L4_3 = "remove"
                  L0_3(L1_3, L2_3, L3_3, L4_3)
                end
                L9_2(L10_2, L11_2)
              end
            end
            if nil ~= L6_2 then
              L9_2 = L4_2.Functions
              L9_2 = L9_2.AddItem
              L10_2 = L6_2
              L11_2 = 1
              L12_2 = false
              L9_2(L10_2, L11_2, L12_2)
              L6_2 = nil
            end
          end
        end
      end
    end
  end
end
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = QS
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = pairs
    L5_2 = A1_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L3_2.GetItemByName
      L11_2 = L8_2
      L10_2 = L10_2(L11_2)
      if nil ~= L10_2 then
        L10_2 = L3_2.GetItemByName
        L11_2 = L8_2
        L10_2 = L10_2(L11_2)
        L10_2 = L10_2.amount
        L11_2 = L9_2 * A2_2
        if L10_2 < L11_2 then
          L10_2 = false
          return L10_2
        end
      else
        L10_2 = false
        return L10_2
      end
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L4_2 = pairs
      L5_2 = A1_2
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = L3_2.Functions
        L10_2 = L10_2.GetItemByName
        L11_2 = L8_2
        L10_2 = L10_2(L11_2)
        if nil ~= L10_2 then
          L10_2 = L3_2.Functions
          L10_2 = L10_2.GetItemByName
          L11_2 = L8_2
          L10_2 = L10_2(L11_2)
          L10_2 = L10_2.amount
          L11_2 = L9_2 * A2_2
          if L10_2 < L11_2 then
            L10_2 = false
            return L10_2
          end
        else
          L10_2 = false
          return L10_2
        end
      end
    end
  end
  L3_2 = true
  return L3_2
end
hasCraftItems = L2_1
L2_1 = Config
L2_1 = L2_1.Framework
if "ESX" == L2_1 then
  L2_1 = ESX
  L2_1 = L2_1.RegisterServerCallback
  L3_1 = "weapons:server:RemoveAttachment"
  function L4_1(A0_2, A1_2, A2_2, A3_2)
    local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
    L4_2 = A0_2
    L5_2 = QS
    L5_2 = L5_2.GetPlayerFromId
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L6_2 = L5_2.PlayerData
    L6_2 = L6_2.items
    L7_2 = Config
    L7_2 = L7_2.WeaponAttachments
    L8_2 = A3_2.name
    L9_2 = L8_2
    L8_2 = L8_2.upper
    L8_2 = L8_2(L9_2)
    L7_2 = L7_2[L8_2]
    L8_2 = A2_2.attachment
    L7_2 = L7_2[L8_2]
    L8_2 = A3_2.slot
    L8_2 = L6_2[L8_2]
    if nil ~= L8_2 then
      L8_2 = A3_2.slot
      L8_2 = L6_2[L8_2]
      L8_2 = L8_2.info
      L8_2 = L8_2.attachments
      if nil ~= L8_2 then
        L8_2 = next
        L9_2 = A3_2.slot
        L9_2 = L6_2[L9_2]
        L9_2 = L9_2.info
        L9_2 = L9_2.attachments
        L8_2 = L8_2(L9_2)
        if nil ~= L8_2 then
          L8_2 = HasAttachment
          L9_2 = L7_2.component
          L10_2 = A3_2.slot
          L10_2 = L6_2[L10_2]
          L10_2 = L10_2.info
          L10_2 = L10_2.attachments
          L8_2, L9_2 = L8_2(L9_2, L10_2)
          if L8_2 then
            L10_2 = L7_2.component
            if "weapontinturlattach" == L10_2 then
              L10_2 = table
              L10_2 = L10_2.remove
              L11_2 = A3_2.slot
              L11_2 = L6_2[L11_2]
              L11_2 = L11_2.info
              L11_2 = L11_2.attachments
              L12_2 = L9_2
              L10_2(L11_2, L12_2)
              L10_2 = L5_2.SetInventory
              L11_2 = L5_2.PlayerData
              L11_2 = L11_2.items
              L10_2(L11_2)
              L10_2 = {}
              L11_2 = tostring
              L12_2 = A3_2.slot
              L12_2 = L6_2[L12_2]
              L12_2 = L12_2.info
              L12_2 = L12_2.tinturl
              L11_2 = L11_2(L12_2)
              L10_2.urltint = L11_2
              L11_2 = L5_2.addItem
              L12_2 = "weapontinturl"
              L13_2 = 1
              L14_2 = false
              L15_2 = L10_2
              L11_2(L12_2, L13_2, L14_2, L15_2)
            else
              L10_2 = table
              L10_2 = L10_2.remove
              L11_2 = A3_2.slot
              L11_2 = L6_2[L11_2]
              L11_2 = L11_2.info
              L11_2 = L11_2.attachments
              L12_2 = L9_2
              L10_2(L11_2, L12_2)
              L10_2 = L5_2.SetInventory
              L11_2 = L5_2.PlayerData
              L11_2 = L11_2.items
              L10_2(L11_2)
              L10_2 = L5_2.addItem
              L11_2 = L7_2.item
              L12_2 = 1
              L10_2(L11_2, L12_2)
            end
            L10_2 = TriggerClientEvent
            L11_2 = "inventory:client:ItemBox"
            L12_2 = L4_2
            L13_2 = QS
            L13_2 = L13_2.Shared
            L13_2 = L13_2.Items
            L14_2 = L7_2.item
            L13_2 = L13_2[L14_2]
            L14_2 = "add"
            L10_2(L11_2, L12_2, L13_2, L14_2)
            L10_2 = TriggerClientEvent
            L11_2 = "qs-inventory:sendMessage"
            L12_2 = L4_2
            L13_2 = Lang
            L14_2 = "WEAPON_REMOVE_ATTACHMENT"
            L13_2 = L13_2(L14_2)
            L14_2 = A2_2.label
            L15_2 = L14_2
            L14_2 = L14_2.lower
            L14_2 = L14_2(L15_2)
            L13_2 = L13_2 .. L14_2
            L14_2 = "success"
            L10_2(L11_2, L12_2, L13_2, L14_2)
            L10_2 = A1_2
            L11_2 = A3_2.slot
            L11_2 = L6_2[L11_2]
            L11_2 = L11_2.info
            L11_2 = L11_2.attachments
            L10_2(L11_2)
          else
            L10_2 = A1_2
            L11_2 = false
            L10_2(L11_2)
          end
      end
      else
        L8_2 = A1_2
        L9_2 = false
        L8_2(L9_2)
      end
    else
      L8_2 = A1_2
      L9_2 = false
      L8_2(L9_2)
    end
  end
  L2_1(L3_1, L4_1)
else
  L2_1 = Config
  L2_1 = L2_1.Framework
  if "QBCore" == L2_1 then
    L2_1 = QBCore
    L2_1 = L2_1.Functions
    L2_1 = L2_1.CreateCallback
    L3_1 = "weapons:server:RemoveAttachment"
    function L4_1(A0_2, A1_2, A2_2, A3_2)
      local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
      L4_2 = A0_2
      L5_2 = QBCore
      L5_2 = L5_2.Functions
      L5_2 = L5_2.GetPlayer
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L6_2 = L5_2.PlayerData
      L6_2 = L6_2.items
      L7_2 = Config
      L7_2 = L7_2.WeaponAttachments
      L8_2 = A3_2.name
      L9_2 = L8_2
      L8_2 = L8_2.upper
      L8_2 = L8_2(L9_2)
      L7_2 = L7_2[L8_2]
      L8_2 = A2_2.attachment
      L7_2 = L7_2[L8_2]
      L8_2 = A3_2.slot
      L8_2 = L6_2[L8_2]
      if nil ~= L8_2 then
        L8_2 = A3_2.slot
        L8_2 = L6_2[L8_2]
        L8_2 = L8_2.info
        L8_2 = L8_2.attachments
        if nil ~= L8_2 then
          L8_2 = next
          L9_2 = A3_2.slot
          L9_2 = L6_2[L9_2]
          L9_2 = L9_2.info
          L9_2 = L9_2.attachments
          L8_2 = L8_2(L9_2)
          if nil ~= L8_2 then
            L8_2 = HasAttachment
            L9_2 = L7_2.component
            L10_2 = A3_2.slot
            L10_2 = L6_2[L10_2]
            L10_2 = L10_2.info
            L10_2 = L10_2.attachments
            L8_2, L9_2 = L8_2(L9_2, L10_2)
            if L8_2 then
              L10_2 = table
              L10_2 = L10_2.remove
              L11_2 = A3_2.slot
              L11_2 = L6_2[L11_2]
              L11_2 = L11_2.info
              L11_2 = L11_2.attachments
              L12_2 = L9_2
              L10_2(L11_2, L12_2)
              L10_2 = L5_2.Functions
              L10_2 = L10_2.SetInventory
              L11_2 = L5_2.PlayerData
              L11_2 = L11_2.items
              L10_2(L11_2)
              L10_2 = L5_2.Functions
              L10_2 = L10_2.AddItem
              L11_2 = L7_2.item
              L12_2 = 1
              L10_2(L11_2, L12_2)
              L10_2 = TriggerClientEvent
              L11_2 = "inventory:client:ItemBox"
              L12_2 = L4_2
              L13_2 = QBCore
              L13_2 = L13_2.Shared
              L13_2 = L13_2.Items
              L14_2 = L7_2.item
              L13_2 = L13_2[L14_2]
              L14_2 = "add"
              L10_2(L11_2, L12_2, L13_2, L14_2)
              L10_2 = TriggerClientEvent
              L11_2 = "qs-inventory:sendMessage"
              L12_2 = A0_2
              L13_2 = Lang
              L14_2 = "WEAPON_REMOVE_ATTACHMENT"
              L13_2 = L13_2(L14_2)
              L14_2 = A2_2.label
              L15_2 = L14_2
              L14_2 = L14_2.lower
              L14_2 = L14_2(L15_2)
              L13_2 = L13_2 .. L14_2
              L14_2 = "success"
              L10_2(L11_2, L12_2, L13_2, L14_2)
              L10_2 = A1_2
              L11_2 = A3_2.slot
              L11_2 = L6_2[L11_2]
              L11_2 = L11_2.info
              L11_2 = L11_2.attachments
              L10_2(L11_2)
            else
              L10_2 = A1_2
              L11_2 = false
              L10_2(L11_2)
            end
        end
        else
          L8_2 = A1_2
          L9_2 = false
          L8_2(L9_2)
        end
      else
        L8_2 = A1_2
        L9_2 = false
        L8_2(L9_2)
      end
    end
    L2_1(L3_1, L4_1)
  end
end
L2_1 = RegisterServerEvent
L3_1 = "weapons:server:AddUrlTint"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "weapons:server:AddUrlTint"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = source
    L3_2 = QS
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = {}
    L5_2 = tostring
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    L4_2.urltint = L5_2
    L5_2 = L3_2.removeItem
    L6_2 = A0_2.name
    L7_2 = 1
    L8_2 = A0_2.slot
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = L3_2.addItem
    L6_2 = "weapontinturl"
    L7_2 = 1
    L8_2 = false
    L9_2 = L4_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = source
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayer
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = {}
      L5_2 = tostring
      L6_2 = A1_2
      L5_2 = L5_2(L6_2)
      L4_2.urltint = L5_2
      L5_2 = L3_2.Functions
      L5_2 = L5_2.RemoveItem
      L6_2 = A0_2.name
      L7_2 = 1
      L8_2 = A0_2.slot
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = L3_2.Functions
      L5_2 = L5_2.AddItem
      L6_2 = "weapontinturl"
      L7_2 = 1
      L8_2 = false
      L9_2 = L4_2
      L5_2(L6_2, L7_2, L8_2, L9_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = Config
L2_1 = L2_1.Framework
if "ESX" == L2_1 then
  L2_1 = RegisterNetEvent
  L3_1 = "inventory:checkDurabilityForItems"
  function L4_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
    L0_2 = source
    L1_2 = QS
    L1_2 = L1_2.GetPlayerFromId
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L2_2 = L1_2.PlayerData
      L2_2 = L2_2.items
      function L3_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
        L1_3 = pairs
        L2_3 = QS
        L2_3 = L2_3.Config
        L2_3 = L2_3.DurabilityTimes
        L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
        for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
          if L5_3 == A0_3 then
            return L6_3
          end
        end
        L1_3 = false
        return L1_3
      end
      L4_2 = pairs
      L5_2 = L2_2
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = L3_2
        L11_2 = L9_2.name
        L10_2 = L10_2(L11_2)
        if L10_2 then
          L11_2 = L2_2[L8_2]
          L11_2 = L11_2.info
          if L11_2 then
            L11_2 = L2_2[L8_2]
            L11_2 = L11_2.info
            L11_2 = L11_2.quality
            if L11_2 then
              goto lbl_30
            end
          end
          do return end
          ::lbl_30::
          L11_2 = 100
          L11_2 = L11_2 / L10_2
          L11_2 = L11_2 * 10
          L11_2 = L11_2 * 1.1
          L12_2 = L2_2[L8_2]
          L12_2 = L12_2.info
          L13_2 = L2_2[L8_2]
          L13_2 = L13_2.info
          L13_2 = L13_2.quality
          L13_2 = L13_2 - L11_2
          L12_2.quality = L13_2
          L12_2 = L2_2[L8_2]
          L12_2 = L12_2.info
          L12_2 = L12_2.quality
          if L12_2 < 0 then
            L12_2 = L2_2[L8_2]
            L12_2 = L12_2.info
            L12_2.quality = 0
          end
        end
      end
      L4_2 = L1_2.SetInventoryWithoutUpdatePlayerData
      L5_2 = L2_2
      L4_2(L5_2)
    end
  end
  L2_1(L3_1, L4_1)
end
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = Config
  L1_2 = L1_2.Languages
  L2_2 = Config
  L2_2 = L2_2.Language
  L1_2 = L1_2[L2_2]
  if L1_2 then
    L2_2 = L1_2[A0_2]
    if L2_2 then
      L2_2 = L1_2[A0_2]
      return L2_2
    end
  end
  return A0_2
end
Lang = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = GetPlayerIdentifiers
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = stringsplit
    L10_2 = L8_2
    L11_2 = ":"
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = L9_2[1]
    L11_2 = L10_2
    L10_2 = L10_2.lower
    L10_2 = L10_2(L11_2)
    L11_2 = string
    L11_2 = L11_2.lower
    L12_2 = A0_2
    L11_2 = L11_2(L12_2)
    if L10_2 == L11_2 then
      L10_2 = L9_2[2]
      L11_2 = L10_2
      L10_2 = L10_2.lower
      return L10_2(L11_2)
    end
  end
  L3_2 = nil
  return L3_2
end
GetIDFromSource = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if nil == A1_2 then
    A1_2 = "%s"
  end
  L2_2 = {}
  i = 1
  L3_2 = string
  L3_2 = L3_2.gmatch
  L4_2 = A0_2
  L5_2 = "([^"
  L6_2 = A1_2
  L7_2 = "]+)"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2)
  for L7_2 in L3_2, L4_2, L5_2, L6_2 do
    L8_2 = i
    L2_2[L8_2] = L7_2
    L8_2 = i
    L8_2 = L8_2 + 1
    i = L8_2
  end
  return L2_2
end
stringsplit = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = {}
  L4_2 = {}
  L4_2.color = A2_2
  L5_2 = "**"
  L6_2 = A0_2
  L7_2 = "**"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L4_2.title = L5_2
  L4_2.description = A1_2
  L5_2 = {}
  L5_2.text = "Quasar Inventory Logs"
  L4_2.footer = L5_2
  L3_2[1] = L4_2
  L4_2 = PerformHttpRequest
  L5_2 = Config
  L5_2 = L5_2.Webhooks
  L5_2 = L5_2.drop
  function L6_2(A0_3, A1_3, A2_3)
  end
  L7_2 = "POST"
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L9_2.username = "System"
  L9_2.embeds = L3_2
  L9_2.avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L9_2["Content-Type"] = "application/json"
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
sendToDiscordDrop = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = {}
  L4_2 = {}
  L4_2.color = A2_2
  L5_2 = "**"
  L6_2 = A0_2
  L7_2 = "**"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L4_2.title = L5_2
  L4_2.description = A1_2
  L5_2 = {}
  L5_2.text = "Quasar Inventory Logs"
  L4_2.footer = L5_2
  L3_2[1] = L4_2
  L4_2 = PerformHttpRequest
  L5_2 = Config
  L5_2 = L5_2.Webhooks
  L5_2 = L5_2.shops
  function L6_2(A0_3, A1_3, A2_3)
  end
  L7_2 = "POST"
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L9_2.username = "System"
  L9_2.embeds = L3_2
  L9_2.avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L9_2["Content-Type"] = "application/json"
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
sendToDiscordShops = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = {}
  L4_2 = {}
  L4_2.color = A2_2
  L5_2 = "**"
  L6_2 = A0_2
  L7_2 = "**"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L4_2.title = L5_2
  L4_2.description = A1_2
  L5_2 = {}
  L5_2.text = "Quasar Inventory Logs"
  L4_2.footer = L5_2
  L3_2[1] = L4_2
  L4_2 = PerformHttpRequest
  L5_2 = Config
  L5_2 = L5_2.Webhooks
  L5_2 = L5_2.vehicles
  function L6_2(A0_3, A1_3, A2_3)
  end
  L7_2 = "POST"
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L9_2.username = "System"
  L9_2.embeds = L3_2
  L9_2.avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L9_2["Content-Type"] = "application/json"
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
sendToDiscordVehicles = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = {}
  L4_2 = {}
  L4_2.color = A2_2
  L5_2 = "**"
  L6_2 = A0_2
  L7_2 = "**"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L4_2.title = L5_2
  L4_2.description = A1_2
  L5_2 = {}
  L5_2.text = "Quasar Inventory Logs"
  L4_2.footer = L5_2
  L3_2[1] = L4_2
  L4_2 = PerformHttpRequest
  L5_2 = Config
  L5_2 = L5_2.Webhooks
  L5_2 = L5_2.stash
  function L6_2(A0_3, A1_3, A2_3)
  end
  L7_2 = "POST"
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L9_2.username = "System"
  L9_2.embeds = L3_2
  L9_2.avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L9_2["Content-Type"] = "application/json"
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
sendToDiscordStash = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = {}
  L4_2 = {}
  L4_2.color = A2_2
  L5_2 = "**"
  L6_2 = A0_2
  L7_2 = "**"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L4_2.title = L5_2
  L4_2.description = A1_2
  L5_2 = {}
  L5_2.text = "Quasar Inventory Logs"
  L4_2.footer = L5_2
  L3_2[1] = L4_2
  L4_2 = PerformHttpRequest
  L5_2 = Config
  L5_2 = L5_2.Webhooks
  L5_2 = L5_2.steal
  function L6_2(A0_3, A1_3, A2_3)
  end
  L7_2 = "POST"
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L9_2.username = "System"
  L9_2.embeds = L3_2
  L9_2.avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L9_2["Content-Type"] = "application/json"
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
sendToDiscordSteal = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = {}
  L4_2 = {}
  L4_2.color = A2_2
  L5_2 = "**"
  L6_2 = A0_2
  L7_2 = "**"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L4_2.title = L5_2
  L4_2.description = A1_2
  L5_2 = {}
  L5_2.text = "Quasar Inventory Logs"
  L4_2.footer = L5_2
  L3_2[1] = L4_2
  L4_2 = PerformHttpRequest
  L5_2 = Config
  L5_2 = L5_2.Webhooks
  L5_2 = L5_2.garbage
  function L6_2(A0_3, A1_3, A2_3)
  end
  L7_2 = "POST"
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L9_2.username = "System"
  L9_2.embeds = L3_2
  L9_2.avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L9_2["Content-Type"] = "application/json"
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
sendToDiscordGarbage = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = {}
  L4_2 = {}
  L4_2.color = A2_2
  L5_2 = "**"
  L6_2 = A0_2
  L7_2 = "**"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L4_2.title = L5_2
  L4_2.description = A1_2
  L5_2 = {}
  L5_2.text = "Quasar Inventory Logs"
  L4_2.footer = L5_2
  L3_2[1] = L4_2
  L4_2 = PerformHttpRequest
  L5_2 = Config
  L5_2 = L5_2.Webhooks
  L5_2 = L5_2.giveitem
  function L6_2(A0_3, A1_3, A2_3)
  end
  L7_2 = "POST"
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L9_2.username = "System"
  L9_2.embeds = L3_2
  L9_2.avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L9_2["Content-Type"] = "application/json"
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
sendToDiscordGiveItem = L2_1
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A2_2
  L7_2 = GetPlayerName
  L8_2 = L4_2
  L7_2 = L7_2(L8_2)
  L8_2 = GetPlayerName
  L9_2 = L5_2
  L8_2 = L8_2(L9_2)
  if 1 == A3_2 then
    L9_2 = {}
    L10_2 = {}
    L10_2.color = 7393279
    L11_2 = "**"
    L12_2 = Config
    L12_2 = L12_2.WebhookTranslates
    L12_2 = L12_2.distance_check
    L12_2 = L12_2.title
    L13_2 = "**"
    L11_2 = L11_2 .. L12_2 .. L13_2
    L10_2.title = L11_2
    L11_2 = "User "
    L12_2 = L7_2
    L13_2 = " ("
    L14_2 = L4_2
    L15_2 = ") "
    L16_2 = "try to steal items from player "
    L17_2 = L8_2
    L18_2 = " ("
    L19_2 = L5_2
    L20_2 = ") - Distance: "
    L21_2 = L6_2
    L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2
    L10_2.description = L11_2
    L11_2 = {}
    L11_2.text = "Quasar Inventory Logs"
    L10_2.footer = L11_2
    L9_2[1] = L10_2
    L10_2 = PerformHttpRequest
    L11_2 = Config
    L11_2 = L11_2.Webhooks
    L11_2 = L11_2.distance_check
    function L12_2(A0_3, A1_3, A2_3)
    end
    L13_2 = "POST"
    L14_2 = json
    L14_2 = L14_2.encode
    L15_2 = {}
    L15_2.username = "System"
    L15_2.embeds = L9_2
    L15_2.avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
    L14_2 = L14_2(L15_2)
    L15_2 = {}
    L15_2["Content-Type"] = "application/json"
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  elseif 2 == A3_2 then
    L9_2 = {}
    L10_2 = {}
    L10_2.color = 7393279
    L11_2 = "**"
    L12_2 = Config
    L12_2 = L12_2.WebhookTranslates
    L12_2 = L12_2.distance_check
    L12_2 = L12_2.title
    L13_2 = "**"
    L11_2 = L11_2 .. L12_2 .. L13_2
    L10_2.title = L11_2
    L11_2 = "User "
    L12_2 = L7_2
    L13_2 = " ("
    L14_2 = L4_2
    L15_2 = ") "
    L16_2 = "try to steal money from player "
    L17_2 = L8_2
    L18_2 = " ("
    L19_2 = L5_2
    L20_2 = ") - Distance: "
    L21_2 = L6_2
    L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2
    L10_2.description = L11_2
    L11_2 = {}
    L11_2.text = "Quasar Inventory Logs"
    L10_2.footer = L11_2
    L9_2[1] = L10_2
    L10_2 = PerformHttpRequest
    L11_2 = Config
    L11_2 = L11_2.Webhooks
    L11_2 = L11_2.distance_check
    function L12_2(A0_3, A1_3, A2_3)
    end
    L13_2 = "POST"
    L14_2 = json
    L14_2 = L14_2.encode
    L15_2 = {}
    L15_2.username = "System"
    L15_2.embeds = L9_2
    L15_2.avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
    L14_2 = L14_2(L15_2)
    L15_2 = {}
    L15_2["Content-Type"] = "application/json"
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  end
end
sendToDiscordStealLog = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 then
    L1_2 = print
    L2_2 = "^4[Quasar Inventory] "
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
  end
end
ShowConsoleError = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = 0
  if A0_2 and A1_2 then
    if "stash" == A1_2 then
      L3_2 = Stashes
      L3_2 = L3_2[A0_2]
      if L3_2 then
        L3_2 = pairs
        L4_2 = Stashes
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.items
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = L8_2.weight
          L10_2 = L8_2.amount
          L9_2 = L9_2 * L10_2
          L2_2 = L2_2 + L9_2
        end
      end
    elseif "trunk" == A1_2 then
      L3_2 = Trunks
      L3_2 = L3_2[A0_2]
      if L3_2 then
        L3_2 = pairs
        L4_2 = Trunks
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.items
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = L8_2.weight
          L10_2 = L8_2.amount
          L9_2 = L9_2 * L10_2
          L2_2 = L2_2 + L9_2
        end
      end
    elseif "glovebox" == A1_2 then
      L3_2 = Gloveboxes
      L3_2 = L3_2[A0_2]
      if L3_2 then
        L3_2 = pairs
        L4_2 = Gloveboxes
        L4_2 = L4_2[A0_2]
        L4_2 = L4_2.items
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = L8_2.weight
          L10_2 = L8_2.amount
          L9_2 = L9_2 * L10_2
          L2_2 = L2_2 + L9_2
        end
      end
    end
  end
  L3_2 = tonumber
  L4_2 = L2_2
  return L3_2(L4_2)
end
GetInventoryTotalWeight = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2
  L2_2 = TriggerClientEvent
  L3_2 = "inventory:client:UpdatePlayerInventory"
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
end
UpdateInventory = L2_1
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = Wait
  L1_2 = 5000
  L0_2(L1_2)
  while true do
    L0_2 = Wait
    L1_2 = 600000
    L0_2(L1_2)
    L0_2 = print
    L1_2 = "[qs-inventory] Saving open trunks, gloveboxs and stashes"
    L0_2(L1_2)
    L0_2 = pairs
    L1_2 = Trunks
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = L5_2.isOpen
      if L6_2 then
        L6_2 = TriggerEvent
        L7_2 = "inventory:server:SaveInventory:All"
        L8_2 = "trunk"
        L9_2 = L4_2
        L6_2(L7_2, L8_2, L9_2)
      end
    end
    L0_2 = pairs
    L1_2 = Gloveboxes
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = L5_2.isOpen
      if L6_2 then
        L6_2 = TriggerEvent
        L7_2 = "inventory:server:SaveInventory:All"
        L8_2 = "glovebox"
        L9_2 = L4_2
        L6_2(L7_2, L8_2, L9_2)
      end
    end
    L0_2 = pairs
    L1_2 = Stashes
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = L5_2.isOpen
      if L6_2 then
        L6_2 = TriggerEvent
        L7_2 = "inventory:server:SaveInventory:All"
        L8_2 = "stash"
        L9_2 = L4_2
        L6_2(L7_2, L8_2, L9_2)
      end
    end
  end
end
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "inventory:server:SaveInventory:All"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if "trunk" == A0_2 then
    L2_2 = SaveOwnedVehicleItemsAll
    L3_2 = A1_2
    L4_2 = Trunks
    L4_2 = L4_2[A1_2]
    L4_2 = L4_2.items
    L2_2(L3_2, L4_2)
  elseif "glovebox" == A0_2 then
    L2_2 = SaveOwnedGloveboxItemsAll
    L3_2 = A1_2
    L4_2 = Gloveboxes
    L4_2 = L4_2[A1_2]
    L4_2 = L4_2.items
    L2_2(L3_2, L4_2)
  elseif "stash" == A0_2 then
    L2_2 = SaveStashItemsAll
    L3_2 = A1_2
    L4_2 = Stashes
    L4_2 = L4_2[A1_2]
    L4_2 = L4_2.items
    L2_2(L3_2, L4_2)
  end
end
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Trunks
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.label
  if "Trunk-None" ~= L2_2 and nil ~= A1_2 then
    L2_2 = pairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L7_2.description = nil
    end
    L2_2 = MySQL
    L2_2 = L2_2.Async
    L2_2 = L2_2.fetchAll
    L3_2 = "SELECT * FROM `qs_trunk` WHERE `plate` = '"
    L4_2 = A0_2
    L5_2 = "'"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = {}
    function L5_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      if A0_3 then
        L1_3 = A0_3[1]
        if nil ~= L1_3 then
          L1_3 = MySQL
          L1_3 = L1_3.Async
          L1_3 = L1_3.execute
          L2_3 = "UPDATE `qs_trunk` SET `items` = '"
          L3_3 = EscapeSqli
          L4_3 = json
          L4_3 = L4_3.encode
          L5_3 = A1_2
          L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
          L4_3 = "' WHERE `plate` = '"
          L5_3 = A0_2
          L6_3 = "'"
          L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
          L3_3 = {}
          function L4_3(A0_4)
            local L1_4
          end
          L1_3(L2_3, L3_3, L4_3)
      end
      else
        L1_3 = MySQL
        L1_3 = L1_3.Async
        L1_3 = L1_3.insert
        L2_3 = "INSERT INTO `qs_trunk` (`plate`, `items`) VALUES ('"
        L3_3 = A0_2
        L4_3 = "', '"
        L5_3 = EscapeSqli
        L6_3 = json
        L6_3 = L6_3.encode
        L7_3 = A1_2
        L6_3, L7_3 = L6_3(L7_3)
        L5_3 = L5_3(L6_3, L7_3)
        L6_3 = "')"
        L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
        L3_3 = {}
        function L4_3(A0_4)
          local L1_4
        end
        L1_3(L2_3, L3_3, L4_3)
      end
    end
    L2_2(L3_2, L4_2, L5_2)
  end
end
SaveOwnedVehicleItemsAll = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Gloveboxes
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.label
  if "Stash-None" ~= L2_2 and nil ~= A1_2 then
    L2_2 = pairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L7_2.description = nil
    end
    L2_2 = MySQL
    L2_2 = L2_2.Async
    L2_2 = L2_2.fetchAll
    L3_2 = "SELECT * FROM `qs_glovebox` WHERE `plate` = '"
    L4_2 = A0_2
    L5_2 = "'"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = {}
    function L5_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      if A0_3 then
        L1_3 = A0_3[1]
        if nil ~= L1_3 then
          L1_3 = MySQL
          L1_3 = L1_3.Async
          L1_3 = L1_3.execute
          L2_3 = "UPDATE `qs_glovebox` SET `items` = '"
          L3_3 = EscapeSqli
          L4_3 = json
          L4_3 = L4_3.encode
          L5_3 = A1_2
          L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
          L4_3 = "' WHERE `plate` = '"
          L5_3 = A0_2
          L6_3 = "'"
          L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
          L3_3 = {}
          function L4_3(A0_4)
            local L1_4
          end
          L1_3(L2_3, L3_3, L4_3)
      end
      else
        L1_3 = MySQL
        L1_3 = L1_3.Async
        L1_3 = L1_3.insert
        L2_3 = "INSERT INTO `qs_glovebox` (`plate`, `items`) VALUES ('"
        L3_3 = A0_2
        L4_3 = "', '"
        L5_3 = EscapeSqli
        L6_3 = json
        L6_3 = L6_3.encode
        L7_3 = A1_2
        L6_3, L7_3 = L6_3(L7_3)
        L5_3 = L5_3(L6_3, L7_3)
        L6_3 = "')"
        L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
        L3_3 = {}
        function L4_3(A0_4)
          local L1_4
        end
        L1_3(L2_3, L3_3, L4_3)
      end
    end
    L2_2(L3_2, L4_2, L5_2)
  end
end
SaveOwnedGloveboxItemsAll = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Stashes
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.label
  if "Stash-None" ~= L2_2 and nil ~= A1_2 then
    L2_2 = pairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L7_2.description = nil
    end
    L2_2 = MySQL
    L2_2 = L2_2.Async
    L2_2 = L2_2.fetchAll
    L3_2 = "SELECT * FROM `qs_stash` WHERE `stash` = '"
    L4_2 = A0_2
    L5_2 = "'"
    L3_2 = L3_2 .. L4_2 .. L5_2
    L4_2 = {}
    function L5_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      if A0_3 then
        L1_3 = A0_3[1]
        if nil ~= L1_3 then
          L1_3 = MySQL
          L1_3 = L1_3.Async
          L1_3 = L1_3.execute
          L2_3 = "UPDATE `qs_stash` SET `items` = '"
          L3_3 = EscapeSqli
          L4_3 = json
          L4_3 = L4_3.encode
          L5_3 = A1_2
          L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
          L4_3 = "' WHERE `stash` = '"
          L5_3 = A0_2
          L6_3 = "'"
          L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
          L3_3 = {}
          function L4_3(A0_4)
            local L1_4
          end
          L1_3(L2_3, L3_3, L4_3)
      end
      else
        L1_3 = MySQL
        L1_3 = L1_3.Async
        L1_3 = L1_3.insert
        L2_3 = "INSERT INTO `qs_stash` (`stash`, `items`) VALUES ('"
        L3_3 = A0_2
        L4_3 = "', '"
        L5_3 = EscapeSqli
        L6_3 = json
        L6_3 = L6_3.encode
        L7_3 = A1_2
        L6_3, L7_3 = L6_3(L7_3)
        L5_3 = L5_3(L6_3, L7_3)
        L6_3 = "')"
        L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3
        L3_3 = {}
        function L4_3(A0_4)
          local L1_4
        end
        L1_3(L2_3, L3_3, L4_3)
      end
    end
    L2_2(L3_2, L4_2, L5_2)
  end
end
SaveStashItemsAll = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = {}
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    if nil == A1_2 then
      goto lbl_164
    end
    L3_2 = next
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if nil == L3_2 then
      goto lbl_164
    end
    L3_2 = pairs
    L4_2 = A1_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = QS
      L9_2 = L9_2.Shared
      L9_2 = L9_2.Items
      L10_2 = L8_2.name
      L11_2 = L10_2
      L10_2 = L10_2.lower
      L10_2 = L10_2(L11_2)
      L9_2 = L9_2[L10_2]
      L10_2 = L8_2.slot
      L11_2 = {}
      L12_2 = L9_2.name
      L11_2.name = L12_2
      L12_2 = tonumber
      L13_2 = L8_2.amount
      L12_2 = L12_2(L13_2)
      L11_2.amount = L12_2
      L12_2 = L8_2.info
      if nil ~= L12_2 then
        L12_2 = L8_2.info
        if L12_2 then
          goto lbl_41
        end
      end
      L12_2 = ""
      ::lbl_41::
      L11_2.info = L12_2
      L12_2 = L9_2.label
      L11_2.label = L12_2
      L12_2 = L9_2.description
      if nil ~= L12_2 then
        L12_2 = L9_2.description
        if L12_2 then
          goto lbl_51
        end
      end
      L12_2 = ""
      ::lbl_51::
      L11_2.description = L12_2
      L12_2 = L9_2.weight
      L11_2.weight = L12_2
      L12_2 = L9_2.type
      L11_2.type = L12_2
      L12_2 = L9_2.unique
      L11_2.unique = L12_2
      L12_2 = L9_2.useable
      L11_2.useable = L12_2
      L12_2 = L8_2.price
      L11_2.price = L12_2
      L12_2 = L8_2.info
      if L12_2 then
        L12_2 = L8_2.info
        L12_2 = L12_2.image
        if L12_2 then
          L12_2 = L8_2.info
          L12_2 = L12_2.image
          L13_2 = ".png"
          L12_2 = L12_2 .. L13_2
          if L12_2 then
            goto lbl_76
          end
        end
      end
      L12_2 = L9_2.image
      ::lbl_76::
      L11_2.image = L12_2
      L12_2 = L8_2.slot
      L11_2.slot = L12_2
      L2_2[L10_2] = L11_2
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 and nil ~= A1_2 then
      L3_2 = next
      L4_2 = A1_2
      L3_2 = L3_2(L4_2)
      if nil ~= L3_2 then
        L3_2 = pairs
        L4_2 = A1_2
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = QBCore
          L9_2 = L9_2.Shared
          L9_2 = L9_2.Items
          L10_2 = L8_2.name
          L11_2 = L10_2
          L10_2 = L10_2.lower
          L10_2 = L10_2(L11_2)
          L9_2 = L9_2[L10_2]
          L10_2 = L8_2.slot
          L11_2 = {}
          L12_2 = L9_2.name
          L11_2.name = L12_2
          L12_2 = tonumber
          L13_2 = L8_2.amount
          L12_2 = L12_2(L13_2)
          L11_2.amount = L12_2
          L12_2 = L8_2.info
          if nil ~= L12_2 then
            L12_2 = L8_2.info
            if L12_2 then
              goto lbl_122
            end
          end
          L12_2 = ""
          ::lbl_122::
          L11_2.info = L12_2
          L12_2 = L9_2.label
          L11_2.label = L12_2
          L12_2 = L9_2.description
          if nil ~= L12_2 then
            L12_2 = L9_2.description
            if L12_2 then
              goto lbl_132
            end
          end
          L12_2 = ""
          ::lbl_132::
          L11_2.description = L12_2
          L12_2 = L9_2.weight
          L11_2.weight = L12_2
          L12_2 = L9_2.type
          L11_2.type = L12_2
          L12_2 = L9_2.unique
          L11_2.unique = L12_2
          L12_2 = L9_2.useable
          L11_2.useable = L12_2
          L12_2 = L8_2.price
          L11_2.price = L12_2
          L12_2 = L8_2.info
          if L12_2 then
            L12_2 = L8_2.info
            L12_2 = L12_2.image
            if L12_2 then
              L12_2 = L8_2.info
              L12_2 = L12_2.image
              L13_2 = ".png"
              L12_2 = L12_2 .. L13_2
              if L12_2 then
                goto lbl_157
              end
            end
          end
          L12_2 = L9_2.image
          ::lbl_157::
          L11_2.image = L12_2
          L12_2 = L8_2.slot
          L11_2.slot = L12_2
          L2_2[L10_2] = L11_2
        end
      end
    end
  end
  ::lbl_164::
  return L2_2
end
SetupSellingItems = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L1_2 = {}
    L1_2["\""] = "\\\""
    L1_2["'"] = "\\'"
    L3_2 = A0_2
    L2_2 = A0_2.gsub
    L4_2 = "['\"]"
    L5_2 = L1_2
    return L2_2(L3_2, L4_2, L5_2)
  else
    return A0_2
  end
end
EscapeSqli = L2_1
L2_1 = {}
L3_1 = {}
for i = 48, 57 do L3_1[#L3_1+1] = string.char(i) end
for i = 65, 90 do L2_1[#L2_1+1] = string.char(i) end
for i = 97, 122 do L2_1[#L2_1+1] = string.char(i) end
L4_1 = Config
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 > 0 then
    L1_2 = Config
    L1_2 = L1_2.RandomStr
    L2_2 = A0_2 - 1
    L1_2 = L1_2(L2_2)
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 1
    L4_2 = L2_1
    L4_2 = #L4_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = L2_1
    L2_2 = L3_2[L2_2]
    L1_2 = L1_2 .. L2_2
    return L1_2
  else
    L1_2 = ""
    return L1_2
  end
end
L4_1.RandomStr = L5_1
L4_1 = Config
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 > 0 then
    L1_2 = Config
    L1_2 = L1_2.RandomInt
    L2_2 = A0_2 - 1
    L1_2 = L1_2(L2_2)
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 1
    L4_2 = L3_1
    L4_2 = #L4_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = L3_1
    L2_2 = L3_2[L2_2]
    L1_2 = L1_2 .. L2_2
    return L1_2
  else
    L1_2 = ""
    return L1_2
  end
end
L4_1.RandomInt = L5_1
L4_1 = AddEventHandler
L5_1 = "onResourceStarting"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetResourceState
  L2_2 = "qb-core"
  L1_2 = L1_2(L2_2)
  if "started" ~= L1_2 then
    L1_2 = GetResourceState
    L2_2 = "qb-core"
    L1_2 = L1_2(L2_2)
  end
  if "starting" == L1_2 and "qs-core" == A0_2 then
    L1_2 = print
    L2_2 = "Quasar Scripts: If you are using qbus framework qs-core its not neccesary anymore."
    L1_2(L2_2)
    L1_2 = CancelEvent
    L1_2()
  end
end
L4_1(L5_1, L6_1)
L4_1 = AddEventHandler
L5_1 = "onResourceStart"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetResourceState
  L2_2 = "qb-core"
  L1_2 = L1_2(L2_2)
  if "started" ~= L1_2 then
    L1_2 = GetResourceState
    L2_2 = "qb-core"
    L1_2 = L1_2(L2_2)
    if "starting" ~= L1_2 then
      goto lbl_27
    end
  end
  L1_2 = GetResourceState
  L2_2 = "qs-core"
  L1_2 = L1_2(L2_2)
  if "started" ~= L1_2 then
    L1_2 = GetResourceState
    L2_2 = "qs-core"
    L1_2 = L1_2(L2_2)
    if "starting" ~= L1_2 then
      goto lbl_27
    end
  end
  L1_2 = print
  L2_2 = "Quasar Scripts: If you are using qbus framework qs-core its not neccesary anymore."
  L1_2(L2_2)
  L1_2 = StopResource
  L2_2 = "qs-core"
  L1_2(L2_2)
  ::lbl_27::
end
L4_1(L5_1, L6_1)
L4_1 = AddEventHandler
L5_1 = "onResourceStarting"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetResourceState
  L2_2 = "qb-core"
  L1_2 = L1_2(L2_2)
  if "started" ~= L1_2 then
    L1_2 = GetResourceState
    L2_2 = "qb-core"
    L1_2 = L1_2(L2_2)
  end
  if "starting" == L1_2 and "qb-weapons" == A0_2 then
    L1_2 = print
    L2_2 = "Quasar Scripts: If you are using qbus framework qb-weapons its not neccesary anymore."
    L1_2(L2_2)
    L1_2 = CancelEvent
    L1_2()
  end
end
L4_1(L5_1, L6_1)
L4_1 = AddEventHandler
L5_1 = "onResourceStart"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetResourceState
  L2_2 = "qb-core"
  L1_2 = L1_2(L2_2)
  if "started" ~= L1_2 then
    L1_2 = GetResourceState
    L2_2 = "qb-core"
    L1_2 = L1_2(L2_2)
    if "starting" ~= L1_2 then
      goto lbl_27
    end
  end
  L1_2 = GetResourceState
  L2_2 = "qb-weapons"
  L1_2 = L1_2(L2_2)
  if "started" ~= L1_2 then
    L1_2 = GetResourceState
    L2_2 = "qb-weapons"
    L1_2 = L1_2(L2_2)
    if "starting" ~= L1_2 then
      goto lbl_27
    end
  end
  L1_2 = print
  L2_2 = "Quasar Scripts: If you are using qbus framework qs-core its not neccesary anymore."
  L1_2(L2_2)
  L1_2 = StopResource
  L2_2 = "qb-weapons"
  L1_2(L2_2)
  ::lbl_27::
end
L4_1(L5_1, L6_1)
L4_1 = Config
L4_1 = L4_1.Framework
if "QBCore" == L4_1 then
  L4_1 = QBCore
  L4_1 = L4_1.Functions
  L4_1 = L4_1.CreateCallback
  L5_1 = "QBCore:CheckIfTargetItsDead"
  function L6_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2
    L3_2 = A2_2
    if L3_2 then
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayer
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L5_2 = L4_2.PlayerData
        L5_2 = L5_2.metadata
        L5_2 = L5_2.isdead
        if not L5_2 then
          L5_2 = L4_2.PlayerData
          L5_2 = L5_2.metadata
          L5_2 = L5_2.inlaststand
          if not L5_2 then
            goto lbl_25
          end
        end
        L5_2 = A1_2
        L6_2 = true
        L5_2(L6_2)
        goto lbl_36
        ::lbl_25::
        L5_2 = A1_2
        L6_2 = false
        L5_2(L6_2)
      else
        L5_2 = A1_2
        L6_2 = false
        L5_2(L6_2)
      end
    else
      L4_2 = A1_2
      L5_2 = false
      L4_2(L5_2)
    end
    ::lbl_36::
  end
  L4_1(L5_1, L6_1)
end
L4_1 = AddEventHandler
L5_1 = "qs-inventory:GiveStarterItems"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = ESX
  L1_2 = L1_2.GetPlayerFromId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = pairs
    L3_2 = Config
    L3_2 = L3_2.StarterItems
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L1_2.addInventoryItem
      L9_2 = L6_2
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
    end
  end
end
L4_1(L5_1, L6_1)
