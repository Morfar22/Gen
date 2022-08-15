local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = {}
L0_1.ESC = 322
L0_1.F1 = 288
L0_1.F2 = 289
L0_1.F3 = 170
L0_1.F5 = 166
L0_1.F6 = 167
L0_1.F7 = 168
L0_1.F8 = 169
L0_1.F9 = 56
L0_1.F10 = 57
L0_1["~"] = 243
L0_1["1"] = 157
L0_1["2"] = 158
L0_1["3"] = 160
L0_1["4"] = 164
L0_1["5"] = 165
L0_1["6"] = 159
L0_1["7"] = 161
L0_1["8"] = 162
L0_1["9"] = 163
L0_1["-"] = 84
L0_1["="] = 83
L0_1.BACKSPACE = 177
L0_1.TAB = 37
L0_1.Q = 44
L0_1.W = 32
L0_1.E = 38
L0_1.R = 45
L0_1.T = 245
L0_1.Y = 246
L0_1.U = 303
L0_1.P = 199
L0_1["["] = 39
L0_1["]"] = 40
L0_1.ENTER = 18
L0_1.CAPS = 137
L0_1.A = 34
L0_1.S = 8
L0_1.D = 9
L0_1.F = 23
L0_1.G = 47
L0_1.H = 74
L0_1.K = 311
L0_1.L = 182
L0_1.LEFTSHIFT = 21
L0_1.Z = 20
L0_1.X = 73
L0_1.C = 26
L0_1.V = 0
L0_1.B = 29
L0_1.N = 249
L0_1.M = 244
L0_1[","] = 82
L0_1["."] = 81
L0_1.LEFTCTRL = 36
L0_1.LEFTALT = 19
L0_1.SPACE = 22
L0_1.RIGHTCTRL = 70
L0_1.HOME = 213
L0_1.PAGEUP = 10
L0_1.PAGEDOWN = 11
L0_1.DELETE = 178
L0_1.LEFT = 174
L0_1.RIGHT = 175
L0_1.TOP = 27
L0_1.DOWN = 173
Keys = L0_1
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
else
  L0_1 = Config
  L0_1 = L0_1.Framework
  if "QBCore" == L0_1 then
    L0_1 = exports
    L1_1 = Config
    L1_1 = L1_1.QBCoreGetCoreObject
    L0_1 = L0_1[L1_1]
    L1_1 = L0_1
    L0_1 = L0_1.GetCoreObject
    L0_1 = L0_1(L1_1)
    QBCore = L0_1
  end
end
inInventory = false
hotbarOpen = false
admin = false
L0_1 = {}
L1_1 = nil
L2_1 = {}
L3_1 = nil
L4_1 = {}
CurrentDrop = 0
L5_1 = {}
curVeh = nil
StealingPed = nil
CurrentVehicle = nil
CurrentGlovebox = nil
CurrentStash = nil
L6_1 = false
L7_1 = 1000
L8_1 = nil
L9_1 = false
L10_1 = false
L11_1 = true
L12_1 = true
L13_1 = {}
L14_1 = {}
L15_1 = {}
L16_1 = {}
L17_1 = {}
PlayerData = L17_1
L17_1 = CreateThread
function L18_1()
  local L0_2, L1_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = Config
    L1_2 = L1_2.DropRefreshTime
    L0_2(L1_2)
    L0_2 = {}
    L4_1 = L0_2
  end
end
L17_1(L18_1)
L2_1 = {}
L3_1 = {}
for i = 48, 57 do L3_1[#L3_1+1] = string.char(i) end
for i = 65, 90 do L2_1[#L2_1+1] = string.char(i) end
for i = 97, 122 do L2_1[#L2_1+1] = string.char(i) end
L17_1 = Config
function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 > 0 then
    L1_2 = Config
    L1_2 = L1_2.RandomStr
    L2_2 = A0_2 - 1
    L1_2 = L1_2(L2_2)
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 1
    L4_2 = L13_1
    L4_2 = #L4_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = L13_1
    L2_2 = L3_2[L2_2]
    L1_2 = L1_2 .. L2_2
    return L1_2
  else
    L1_2 = ""
    return L1_2
  end
end
L17_1.RandomStr = L18_1
L17_1 = Config
function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 > 0 then
    L1_2 = Config
    L1_2 = L1_2.RandomInt
    L2_2 = A0_2 - 1
    L1_2 = L1_2(L2_2)
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 1
    L4_2 = L14_1
    L4_2 = #L4_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = L14_1
    L2_2 = L3_2[L2_2]
    L1_2 = L1_2 .. L2_2
    return L1_2
  else
    L1_2 = ""
    return L1_2
  end
end
L17_1.RandomInt = L18_1
L17_1 = true
L18_1 = AddEventHandler
L19_1 = "canUseInventoryAndHotbar:toggle"
function L20_1(A0_2)
  local L1_2
  L17_1 = A0_2
end
L18_1(L19_1, L20_1)
L18_1 = CreateThread
function L19_1()
  local L0_2, L1_2
  while true do
    L0_2 = QS
    if nil ~= L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
  end
  L0_2 = QS
  L0_2 = L0_2.Config
  L0_2 = L0_2.DurabilityTimes
  if L0_2 then
    L0_2 = QS
    L0_2 = L0_2.Config
    L0_2 = L0_2.DurabilityTimes
    if L0_2 then
      while true do
        L0_2 = TriggerServerEvent
        L1_2 = "inventory:checkDurabilityForItems"
        L0_2(L1_2)
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 10000
        L0_2(L1_2)
      end
    end
  end
end
L18_1(L19_1)
L18_1 = Config
L18_1 = L18_1.Framework
if "ESX" == L18_1 then
  L18_1 = CreateThread
  function L19_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
    function L0_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
      L1_3 = {}
      L2_3 = pairs
      L3_3 = A0_3
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = #L1_3
        L8_3 = L8_3 + 1
        L9_3 = {}
        L10_3 = QS
        L10_3 = L10_3.Shared
        L10_3 = L10_3.Items
        L10_3 = L10_3[L7_3]
        L10_3 = L10_3.name
        L9_3.name = L10_3
        L10_3 = QS
        L10_3 = L10_3.Shared
        L10_3 = L10_3.Items
        L10_3 = L10_3[L7_3]
        L10_3 = L10_3.image
        L9_3.image = L10_3
        L1_3[L8_3] = L9_3
      end
      return L1_3
    end
    L1_2 = false
    while true do
      L2_2 = false
      L3_2 = QS
      if L3_2 then
        L3_2 = ESX
        if L3_2 then
          L3_2 = PlayerPedId
          L3_2 = L3_2()
          L4_2 = pairs
          L5_2 = Config
          L5_2 = L5_2.ReqItems
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
            L10_2 = L9_2.coords
            L11_2 = GetEntityCoords
            L12_2 = L3_2
            L11_2 = L11_2(L12_2)
            L10_2 = L10_2 - L11_2
            L10_2 = #L10_2
            L11_2 = L9_2.dist
            if L10_2 <= L11_2 then
              L2_2 = true
              if not L1_2 then
                L11_2 = L0_2
                L12_2 = L9_2.items
                L11_2 = L11_2(L12_2)
                L1_2 = L11_2
                L12_2 = TriggerEvent
                L13_2 = "inventory:client:requiredItems"
                L14_2 = L11_2
                L15_2 = true
                L12_2(L13_2, L14_2, L15_2)
              end
            end
          end
          if not L2_2 and L1_2 then
            L1_2 = false
            L4_2 = TriggerEvent
            L5_2 = "inventory:client:requiredItems"
            L6_2 = L1_2
            L7_2 = false
            L4_2(L5_2, L6_2, L7_2)
          end
        end
      end
      L3_2 = Wait
      L4_2 = 1250
      L3_2(L4_2)
    end
  end
  L18_1(L19_1)
else
  L18_1 = Config
  L18_1 = L18_1.Framework
  if "QBCore" == L18_1 then
  end
end
L18_1 = Config
L18_1 = L18_1.BlockHotBarPhone
if L18_1 then
  L18_1 = Citizen
  L18_1 = L18_1.CreateThread
  function L19_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 1
      L0_2(L1_2)
      L0_2 = L17_1
      if L0_2 then
        L0_2 = IsDisabledControlJustReleased
        L1_2 = 0
        L2_2 = Keys
        L2_2 = L2_2["1"]
        L0_2 = L0_2(L1_2, L2_2)
        if L0_2 then
          L0_2 = exports
          L0_2 = L0_2["qs-smartphone"]
          L1_2 = L0_2
          L0_2 = L0_2.InPhone
          L0_2 = L0_2(L1_2)
          if not L0_2 then
            L0_2 = TriggerServerEvent
            L1_2 = "inventory:server:UseItemSlot"
            L2_2 = 1
            L3_2 = true
            L4_2 = IsPedInAnyVehicle
            L5_2 = PlayerPedId
            L5_2 = L5_2()
            L6_2 = false
            L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
            L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
            L0_2 = Wait
            L1_2 = 300
            L0_2(L1_2)
        end
        else
          L0_2 = IsDisabledControlJustReleased
          L1_2 = 0
          L2_2 = Keys
          L2_2 = L2_2["2"]
          L0_2 = L0_2(L1_2, L2_2)
          if L0_2 then
            L0_2 = exports
            L0_2 = L0_2["qs-smartphone"]
            L1_2 = L0_2
            L0_2 = L0_2.InPhone
            L0_2 = L0_2(L1_2)
            if not L0_2 then
              L0_2 = TriggerServerEvent
              L1_2 = "inventory:server:UseItemSlot"
              L2_2 = 2
              L3_2 = true
              L4_2 = IsPedInAnyVehicle
              L5_2 = PlayerPedId
              L5_2 = L5_2()
              L6_2 = false
              L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
              L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
              L0_2 = Wait
              L1_2 = 300
              L0_2(L1_2)
          end
          else
            L0_2 = IsDisabledControlJustReleased
            L1_2 = 0
            L2_2 = Keys
            L2_2 = L2_2["3"]
            L0_2 = L0_2(L1_2, L2_2)
            if L0_2 then
              L0_2 = exports
              L0_2 = L0_2["qs-smartphone"]
              L1_2 = L0_2
              L0_2 = L0_2.InPhone
              L0_2 = L0_2(L1_2)
              if not L0_2 then
                L0_2 = TriggerServerEvent
                L1_2 = "inventory:server:UseItemSlot"
                L2_2 = 3
                L3_2 = true
                L4_2 = IsPedInAnyVehicle
                L5_2 = PlayerPedId
                L5_2 = L5_2()
                L6_2 = false
                L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
                L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
                L0_2 = Wait
                L1_2 = 300
                L0_2(L1_2)
            end
            else
              L0_2 = IsDisabledControlJustReleased
              L1_2 = 0
              L2_2 = Keys
              L2_2 = L2_2["4"]
              L0_2 = L0_2(L1_2, L2_2)
              if L0_2 then
                L0_2 = exports
                L0_2 = L0_2["qs-smartphone"]
                L1_2 = L0_2
                L0_2 = L0_2.InPhone
                L0_2 = L0_2(L1_2)
                if not L0_2 then
                  L0_2 = TriggerServerEvent
                  L1_2 = "inventory:server:UseItemSlot"
                  L2_2 = 4
                  L3_2 = true
                  L4_2 = IsPedInAnyVehicle
                  L5_2 = PlayerPedId
                  L5_2 = L5_2()
                  L6_2 = false
                  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
                  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
                  L0_2 = Wait
                  L1_2 = 300
                  L0_2(L1_2)
              end
              else
                L0_2 = IsDisabledControlJustReleased
                L1_2 = 0
                L2_2 = Keys
                L2_2 = L2_2["5"]
                L0_2 = L0_2(L1_2, L2_2)
                if L0_2 then
                  L0_2 = exports
                  L0_2 = L0_2["qs-smartphone"]
                  L1_2 = L0_2
                  L0_2 = L0_2.InPhone
                  L0_2 = L0_2(L1_2)
                  if not L0_2 then
                    L0_2 = TriggerServerEvent
                    L1_2 = "inventory:server:UseItemSlot"
                    L2_2 = 5
                    L3_2 = true
                    L4_2 = IsPedInAnyVehicle
                    L5_2 = PlayerPedId
                    L5_2 = L5_2()
                    L6_2 = false
                    L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
                    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
                    L0_2 = Wait
                    L1_2 = 300
                    L0_2(L1_2)
                  end
                end
              end
            end
          end
        end
      else
        L0_2 = Wait
        L1_2 = 100
        L0_2(L1_2)
      end
    end
  end
  L18_1(L19_1)
else
  L18_1 = Citizen
  L18_1 = L18_1.CreateThread
  function L19_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
    while true do
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 1
      L0_2(L1_2)
      L0_2 = L17_1
      if L0_2 then
        L0_2 = IsDisabledControlJustReleased
        L1_2 = 0
        L2_2 = Keys
        L2_2 = L2_2["1"]
        L0_2 = L0_2(L1_2, L2_2)
        if L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "inventory:server:UseItemSlot"
          L2_2 = 1
          L3_2 = true
          L4_2 = IsPedInAnyVehicle
          L5_2 = PlayerPedId
          L5_2 = L5_2()
          L6_2 = false
          L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
          L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
          L0_2 = Wait
          L1_2 = 300
          L0_2(L1_2)
        else
          L0_2 = IsDisabledControlJustReleased
          L1_2 = 0
          L2_2 = Keys
          L2_2 = L2_2["2"]
          L0_2 = L0_2(L1_2, L2_2)
          if L0_2 then
            L0_2 = TriggerServerEvent
            L1_2 = "inventory:server:UseItemSlot"
            L2_2 = 2
            L3_2 = true
            L4_2 = IsPedInAnyVehicle
            L5_2 = PlayerPedId
            L5_2 = L5_2()
            L6_2 = false
            L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
            L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
            L0_2 = Wait
            L1_2 = 300
            L0_2(L1_2)
          else
            L0_2 = IsDisabledControlJustReleased
            L1_2 = 0
            L2_2 = Keys
            L2_2 = L2_2["3"]
            L0_2 = L0_2(L1_2, L2_2)
            if L0_2 then
              L0_2 = TriggerServerEvent
              L1_2 = "inventory:server:UseItemSlot"
              L2_2 = 3
              L3_2 = true
              L4_2 = IsPedInAnyVehicle
              L5_2 = PlayerPedId
              L5_2 = L5_2()
              L6_2 = false
              L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
              L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
              L0_2 = Wait
              L1_2 = 300
              L0_2(L1_2)
            else
              L0_2 = IsDisabledControlJustReleased
              L1_2 = 0
              L2_2 = Keys
              L2_2 = L2_2["4"]
              L0_2 = L0_2(L1_2, L2_2)
              if L0_2 then
                L0_2 = TriggerServerEvent
                L1_2 = "inventory:server:UseItemSlot"
                L2_2 = 4
                L3_2 = true
                L4_2 = IsPedInAnyVehicle
                L5_2 = PlayerPedId
                L5_2 = L5_2()
                L6_2 = false
                L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
                L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
                L0_2 = Wait
                L1_2 = 300
                L0_2(L1_2)
              else
                L0_2 = IsDisabledControlJustReleased
                L1_2 = 0
                L2_2 = Keys
                L2_2 = L2_2["5"]
                L0_2 = L0_2(L1_2, L2_2)
                if L0_2 then
                  L0_2 = TriggerServerEvent
                  L1_2 = "inventory:server:UseItemSlot"
                  L2_2 = 5
                  L3_2 = true
                  L4_2 = IsPedInAnyVehicle
                  L5_2 = PlayerPedId
                  L5_2 = L5_2()
                  L6_2 = false
                  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
                  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
                  L0_2 = Wait
                  L1_2 = 300
                  L0_2(L1_2)
                end
              end
            end
          end
        end
      else
        L0_2 = Wait
        L1_2 = 100
        L0_2(L1_2)
      end
    end
  end
  L18_1(L19_1)
end
function L18_1(A0_2)
  local L1_2, L2_2
  while true do
    L1_2 = HasAnimDictLoaded
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = RequestAnimDict
    L2_2 = A0_2
    L1_2(L2_2)
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 5
    L1_2(L2_2)
  end
end
loadAnimDict = L18_1
L18_1 = Config
L18_1 = L18_1.Framework
if "ESX" == L18_1 then
  L18_1 = Citizen
  L18_1 = L18_1.CreateThread
  function L19_1()
    local L0_2, L1_2, L2_2
    while true do
      L0_2 = ESX
      if nil ~= L0_2 then
        break
      end
      L0_2 = TriggerEvent
      L1_2 = Config
      L1_2 = L1_2.getSharedObject
      function L2_2(A0_3)
        local L1_3
        ESX = A0_3
      end
      L0_2(L1_2, L2_2)
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 3
      L0_2(L1_2)
    end
    while true do
      L0_2 = QS
      if nil ~= L0_2 then
        break
      end
      L0_2 = TriggerEvent
      L1_2 = "qs-core:getSharedObject"
      function L2_2(A0_3)
        local L1_3
        QS = A0_3
      end
      L0_2(L1_2, L2_2)
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 200
      L0_2(L1_2)
    end
    while true do
      L0_2 = ESX
      L0_2 = L0_2.GetPlayerData
      L0_2 = L0_2()
      if nil ~= L0_2 then
        break
      end
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 100
      L0_2(L1_2)
    end
    L0_2 = ESX
    L0_2 = L0_2.GetPlayerData
    L0_2 = L0_2()
    PlayerData = L0_2
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 2000
    L0_2(L1_2)
  end
  L18_1(L19_1)
end
L18_1 = RegisterNetEvent
L19_1 = "inventory:client:CraftItems"
L18_1(L19_1)
L18_1 = AddEventHandler
L19_1 = "inventory:client:CraftItems"
function L20_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L5_2 = SendNUIMessage
  L6_2 = {}
  L6_2.action = "close"
  L5_2(L6_2)
  L5_2 = true
  L10_1 = L5_2
  L5_2 = Config
  L5_2 = L5_2.Framework
  if "ESX" == L5_2 then
    L5_2 = QS
    L5_2 = L5_2.Progressbar
    L6_2 = "repair_vehicle"
    L7_2 = Lang
    L8_2 = "CRAFTING_PROGBAR"
    L7_2 = L7_2(L8_2)
    L8_2 = math
    L8_2 = L8_2.random
    L9_2 = 2000
    L10_2 = 5000
    L8_2 = L8_2(L9_2, L10_2)
    L8_2 = L8_2 * A2_2
    L9_2 = false
    L10_2 = true
    L11_2 = {}
    L11_2.disableMovement = true
    L11_2.disableCarMovement = true
    L11_2.disableMouse = false
    L11_2.disableCombat = true
    L12_2 = {}
    L12_2.animDict = "mini@repair"
    L12_2.anim = "fixing_a_player"
    L12_2.flags = 16
    L13_2 = {}
    L14_2 = {}
    function L15_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
      L0_3 = StopAnimTask
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = "mini@repair"
      L3_3 = "fixing_a_player"
      L4_3 = 1.0
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = TriggerServerEvent
      L1_3 = "inventory:server:CraftItems"
      L2_3 = A0_2
      L3_3 = A1_2
      L4_3 = A2_2
      L5_3 = A3_2
      L6_3 = A4_2
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
      L0_3 = false
      L10_1 = L0_3
    end
    function L16_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = StopAnimTask
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = "mini@repair"
      L3_3 = "fixing_a_player"
      L4_3 = 1.0
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = false
      L10_1 = L0_3
    end
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  else
    L5_2 = Config
    L5_2 = L5_2.Framework
    if "QBCore" == L5_2 then
      L5_2 = QBCore
      L5_2 = L5_2.Functions
      L5_2 = L5_2.Progressbar
      L6_2 = "repair_vehicle"
      L7_2 = Lang
      L8_2 = "CRAFTING_PROGBAR"
      L7_2 = L7_2(L8_2)
      L8_2 = math
      L8_2 = L8_2.random
      L9_2 = 2000
      L10_2 = 5000
      L8_2 = L8_2(L9_2, L10_2)
      L8_2 = L8_2 * A2_2
      L9_2 = false
      L10_2 = true
      L11_2 = {}
      L11_2.disableMovement = true
      L11_2.disableCarMovement = true
      L11_2.disableMouse = false
      L11_2.disableCombat = true
      L12_2 = {}
      L12_2.animDict = "mini@repair"
      L12_2.anim = "fixing_a_player"
      L12_2.flags = 16
      L13_2 = {}
      L14_2 = {}
      function L15_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
        L0_3 = StopAnimTask
        L1_3 = PlayerPedId
        L1_3 = L1_3()
        L2_3 = "mini@repair"
        L3_3 = "fixing_a_player"
        L4_3 = 1.0
        L0_3(L1_3, L2_3, L3_3, L4_3)
        L0_3 = TriggerServerEvent
        L1_3 = "inventory:server:CraftItems"
        L2_3 = A0_2
        L3_3 = A1_2
        L4_3 = A2_2
        L5_3 = A3_2
        L6_3 = A4_2
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
        L0_3 = false
        L10_1 = L0_3
      end
      function L16_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3
        L0_3 = StopAnimTask
        L1_3 = PlayerPedId
        L1_3 = L1_3()
        L2_3 = "mini@repair"
        L3_3 = "fixing_a_player"
        L4_3 = 1.0
        L0_3(L1_3, L2_3, L3_3, L4_3)
        L0_3 = false
        L10_1 = L0_3
      end
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    end
  end
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNetEvent
L19_1 = "inventory:client:adminSearch"
L18_1(L19_1)
L18_1 = AddEventHandler
L19_1 = "inventory:client:adminSearch"
function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2
  L2_2 = TriggerServerEvent
  L3_2 = "inventory:server:OpenInventory"
  L4_2 = "otherplayer"
  L5_2 = L1_2
  L2_2(L3_2, L4_2, L5_2)
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNetEvent
L19_1 = Config
L19_1 = L19_1.playerLoaded
L18_1(L19_1)
L18_1 = AddEventHandler
L19_1 = Config
L19_1 = L19_1.playerLoaded
function L20_1(A0_2)
  local L1_2
  PlayerData = A0_2
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNetEvent
L19_1 = Config
L19_1 = L19_1.setJob
L18_1(L19_1)
L18_1 = AddEventHandler
L19_1 = Config
L19_1 = L19_1.setJob
function L20_1(A0_2)
  local L1_2
  L1_2 = PlayerData
  L1_2.job = A0_2
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNetEvent
L19_1 = "inventory:client:CheckOpenState"
L18_1(L19_1)
L18_1 = AddEventHandler
L19_1 = "inventory:client:CheckOpenState"
function L20_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = Config
  L3_2 = L3_2.Framework
  if "ESX" == L3_2 then
    L3_2 = QS
    L3_2 = L3_2.Shared
    L3_2 = L3_2.SplitStr
    L4_2 = A2_2
    L5_2 = "-"
    L3_2 = L3_2(L4_2, L5_2)
    L3_2 = L3_2[2]
    if "stash" == A0_2 then
      L4_2 = CurrentStash
      if L3_2 == L4_2 then
        L4_2 = CurrentStash
      end
      if nil == L4_2 then
        L4_2 = TriggerServerEvent
        L5_2 = "inventory:server:SetIsOpenState"
        L6_2 = false
        L7_2 = A0_2
        L8_2 = A1_2
        L4_2(L5_2, L6_2, L7_2, L8_2)
      end
    elseif "trunk" == A0_2 then
      L4_2 = CurrentVehicle
      if L3_2 == L4_2 then
        L4_2 = CurrentVehicle
      end
      if nil == L4_2 then
        L4_2 = TriggerServerEvent
        L5_2 = "inventory:server:SetIsOpenState"
        L6_2 = false
        L7_2 = A0_2
        L8_2 = A1_2
        L4_2(L5_2, L6_2, L7_2, L8_2)
      end
    elseif "glovebox" == A0_2 then
      L4_2 = CurrentGlovebox
      if L3_2 == L4_2 then
        L4_2 = CurrentGlovebox
      end
      if nil == L4_2 then
        L4_2 = TriggerServerEvent
        L5_2 = "inventory:server:SetIsOpenState"
        L6_2 = false
        L7_2 = A0_2
        L8_2 = A1_2
        L4_2(L5_2, L6_2, L7_2, L8_2)
      end
    elseif "drop" == A0_2 then
      L4_2 = tonumber
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = tonumber
      L6_2 = CurrentDrop
      L5_2 = L5_2(L6_2)
      if L4_2 == L5_2 then
        L4_2 = CurrentDrop
      end
      if nil == L4_2 then
        L4_2 = TriggerServerEvent
        L5_2 = "inventory:server:SetIsOpenState"
        L6_2 = false
        L7_2 = A0_2
        L8_2 = A1_2
        L4_2(L5_2, L6_2, L7_2, L8_2)
      end
    end
  else
    L3_2 = Config
    L3_2 = L3_2.Framework
    if "QBCore" == L3_2 then
      L3_2 = QBCore
      L3_2 = L3_2.Shared
      L3_2 = L3_2.SplitStr
      L4_2 = A2_2
      L5_2 = "-"
      L3_2 = L3_2(L4_2, L5_2)
      L3_2 = L3_2[2]
      if "stash" == A0_2 then
        L4_2 = CurrentStash
        if L3_2 == L4_2 then
          L4_2 = CurrentStash
        end
        if nil == L4_2 then
          L4_2 = TriggerServerEvent
          L5_2 = "inventory:server:SetIsOpenState"
          L6_2 = false
          L7_2 = A0_2
          L8_2 = A1_2
          L4_2(L5_2, L6_2, L7_2, L8_2)
        end
      elseif "trunk" == A0_2 then
        L4_2 = CurrentVehicle
        if L3_2 == L4_2 then
          L4_2 = CurrentVehicle
        end
        if nil == L4_2 then
          L4_2 = TriggerServerEvent
          L5_2 = "inventory:server:SetIsOpenState"
          L6_2 = false
          L7_2 = A0_2
          L8_2 = A1_2
          L4_2(L5_2, L6_2, L7_2, L8_2)
        end
      elseif "glovebox" == A0_2 then
        L4_2 = CurrentGlovebox
        if L3_2 == L4_2 then
          L4_2 = CurrentGlovebox
        end
        if nil == L4_2 then
          L4_2 = TriggerServerEvent
          L5_2 = "inventory:server:SetIsOpenState"
          L6_2 = false
          L7_2 = A0_2
          L8_2 = A1_2
          L4_2(L5_2, L6_2, L7_2, L8_2)
        end
      elseif "drop" == A0_2 then
        L4_2 = tonumber
        L5_2 = L3_2
        L4_2 = L4_2(L5_2)
        L5_2 = tonumber
        L6_2 = CurrentDrop
        L5_2 = L5_2(L6_2)
        if L4_2 == L5_2 then
          L4_2 = CurrentDrop
          if nil ~= L4_2 then
            goto lbl_152
          end
        end
        L4_2 = TriggerServerEvent
        L5_2 = "inventory:server:SetIsOpenState"
        L6_2 = false
        L7_2 = A0_2
        L8_2 = A1_2
        L4_2(L5_2, L6_2, L7_2, L8_2)
      end
    end
  end
  ::lbl_152::
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNetEvent
L19_1 = "weapons:client:SetCurrentWeapon"
L18_1(L19_1)
L18_1 = AddEventHandler
L19_1 = "weapons:client:SetCurrentWeapon"
function L20_1(A0_2, A1_2)
  local L2_2
  if false ~= A0_2 then
    L15_1 = A0_2
  else
    L2_2 = {}
    L15_1 = L2_2
  end
end
L18_1(L19_1, L20_1)
L18_1 = RegisterCommand
L19_1 = Config
L19_1 = L19_1.Commands
L19_1 = L19_1.fix
function L20_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNetEvent
L19_1 = "randPickupAnim"
L18_1(L19_1)
L18_1 = AddEventHandler
L19_1 = "randPickupAnim"
function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = loadAnimDict
  L1_2 = "pickup_object"
  L0_2(L1_2)
  L0_2 = TaskPlayAnim
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = "pickup_object"
  L3_2 = "putdown_low"
  L4_2 = 5.0
  L5_2 = 1.5
  L6_2 = 1.0
  L7_2 = 48
  L8_2 = 0.0
  L9_2 = 0
  L10_2 = 0
  L11_2 = 0
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L0_2 = Wait
  L1_2 = 1000
  L0_2(L1_2)
  L0_2 = ClearPedSecondaryTask
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L18_1(L19_1, L20_1)
function L18_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = -1
  L5_2 = -1
  L6_2 = nil
  if A2_2 then
    L7_2 = vector3
    L8_2 = A2_2.x
    L9_2 = A2_2.y
    L10_2 = A2_2.z
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    A2_2 = L7_2
  else
    L7_2 = PlayerPedId
    L7_2 = L7_2()
    L8_2 = GetEntityCoords
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    A2_2 = L8_2
  end
  if A3_2 then
    L7_2 = {}
    L6_2 = L7_2
    L7_2 = pairs
    L8_2 = A0_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = GetEntityModel
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      L13_2 = A3_2[L13_2]
      if L13_2 then
        L13_2 = table
        L13_2 = L13_2.insert
        L14_2 = L6_2
        L15_2 = L12_2
        L13_2(L14_2, L15_2)
      end
    end
  end
  L7_2 = pairs
  L8_2 = L6_2 or L8_2
  if not L6_2 then
    L8_2 = A0_2
  end
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = GetEntityCoords
    L14_2 = L12_2
    L13_2 = L13_2(L14_2)
    L13_2 = A2_2 - L13_2
    L13_2 = #L13_2
    if -1 == L5_2 or L5_2 > L13_2 then
      L14_2 = L11_2 or L14_2
      if not A1_2 or not L11_2 then
        L14_2 = L12_2
      end
      L5_2 = L13_2
      L4_2 = L14_2
    end
  end
  L7_2 = L4_2
  L8_2 = L5_2
  return L7_2, L8_2
end
function L19_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = {}
  L1_2 = EnumerateObjects
  L1_2, L2_2, L3_2, L4_2 = L1_2()
  for L5_2 in L1_2, L2_2, L3_2, L4_2 do
    L6_2 = table
    L6_2 = L6_2.insert
    L7_2 = L0_2
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
  return L0_2
end
function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L18_1
  L3_2 = L19_1
  L3_2 = L3_2()
  L4_2 = false
  L5_2 = A0_2
  L6_2 = A1_2
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end
GetClosestObject = L20_1
L20_1 = {}
function L21_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.destructor
  if L1_2 then
    L1_2 = A0_2.handle
    if L1_2 then
      L1_2 = A0_2.destructor
      L2_2 = A0_2.handle
      L1_2(L2_2)
    end
  end
  A0_2.destructor = nil
  A0_2.handle = nil
end
L20_1.__gc = L21_1
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = coroutine
  L3_2 = L3_2.wrap
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = A0_2
    L0_3, L1_3 = L0_3()
    if not L1_3 or 0 == L1_3 then
      L2_3 = A2_2
      L3_3 = L0_3
      L2_3(L3_3)
      return
    end
    L2_3 = {}
    L2_3.handle = L0_3
    L3_3 = A2_2
    L2_3.destructor = L3_3
    L3_3 = setmetatable
    L4_3 = L2_3
    L5_3 = L20_1
    L3_3(L4_3, L5_3)
    L3_3 = true
    repeat
      L4_3 = coroutine
      L4_3 = L4_3.yield
      L5_3 = L1_3
      L4_3(L5_3)
      L4_3 = A1_2
      L5_3 = L0_3
      L4_3, L5_3 = L4_3(L5_3)
      L1_3 = L5_3
      L3_3 = L4_3
    until not L3_3
    L4_3 = nil
    L2_3.handle = nil
    L2_3.destructor = L4_3
    L4_3 = A2_2
    L5_3 = L0_3
    L4_3(L5_3)
  end
  return L3_2(L4_2)
end
function L22_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L21_1
  L1_2 = FindFirstObject
  L2_2 = FindNextObject
  L3_2 = EndFindObject
  return L0_2(L1_2, L2_2, L3_2)
end
EnumerateObjects = L22_1
function L22_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L21_1
  L1_2 = FindFirstPed
  L2_2 = FindNextPed
  L3_2 = EndFindPed
  return L0_2(L1_2, L2_2, L3_2)
end
EnumeratePeds = L22_1
function L22_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L21_1
  L1_2 = FindFirstVehicle
  L2_2 = FindNextVehicle
  L3_2 = EndFindVehicle
  return L0_2(L1_2, L2_2, L3_2)
end
EnumerateVehicles = L22_1
function L22_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L21_1
  L1_2 = FindFirstPickup
  L2_2 = FindNextPickup
  L3_2 = EndFindPickup
  return L0_2(L1_2, L2_2, L3_2)
end
EnumeratePickups = L22_1
L22_1 = Citizen
L22_1 = L22_1.CreateThread
function L23_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1
    L0_2(L1_2)
    L0_2 = DisableControlAction
    L1_2 = 0
    L2_2 = 37
    L3_2 = true
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = 19
    L1_2 = 20
    L2_2 = 1
    for L3_2 = L0_2, L1_2, L2_2 do
      L4_2 = HideHudComponentThisFrame
      L5_2 = L3_2
      L4_2(L5_2)
    end
    L0_2 = DisableControlAction
    L1_2 = 0
    L2_2 = Keys
    L2_2 = L2_2["1"]
    L3_2 = true
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = DisableControlAction
    L1_2 = 0
    L2_2 = Keys
    L2_2 = L2_2["2"]
    L3_2 = true
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = DisableControlAction
    L1_2 = 0
    L2_2 = Keys
    L2_2 = L2_2["3"]
    L3_2 = true
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = DisableControlAction
    L1_2 = 0
    L2_2 = Keys
    L2_2 = L2_2["4"]
    L3_2 = true
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = DisableControlAction
    L1_2 = 0
    L2_2 = Keys
    L2_2 = L2_2["5"]
    L3_2 = true
    L0_2(L1_2, L2_2, L3_2)
  end
end
L22_1(L23_1)
L22_1 = RegisterNUICallback
L23_1 = "combineItem"
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Citizen
  L1_2 = L1_2.Wait
  L2_2 = 150
  L1_2(L2_2)
  L1_2 = TriggerServerEvent
  L2_2 = "inventory:server:combineItem"
  L3_2 = A0_2.reward
  L4_2 = A0_2.fromItem
  L5_2 = A0_2.toItem
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:combineItem:ItemBox"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:combineItem:ItemBox"
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Config
  L1_2 = L1_2.Framework
  if "ESX" == L1_2 then
    L1_2 = TriggerEvent
    L2_2 = "inventory:client:ItemBox"
    L3_2 = QS
    L3_2 = L3_2.Shared
    L3_2 = L3_2.Items
    L3_2 = L3_2[A0_2]
    L4_2 = "add"
    L1_2(L2_2, L3_2, L4_2)
  else
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = TriggerEvent
      L2_2 = "inventory:client:ItemBox"
      L3_2 = QBCore
      L3_2 = L3_2.Shared
      L3_2 = L3_2.Items
      L3_2 = L3_2[A0_2]
      L4_2 = "add"
      L1_2(L2_2, L3_2, L4_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "Notify"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendTextMessage
  L3_2 = A0_2.msg
  L4_2 = A0_2.type
  L2_2(L3_2, L4_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "combineItem"
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Citizen
  L1_2 = L1_2.Wait
  L2_2 = 150
  L1_2(L2_2)
  L1_2 = Config
  L1_2 = L1_2.Framework
  if "ESX" == L1_2 then
    L1_2 = TriggerServerEvent
    L2_2 = "inventory:server:combineItem"
    L3_2 = A0_2.reward
    L4_2 = A0_2.fromItem
    L5_2 = A0_2.toItem
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = TriggerEvent
    L2_2 = "inventory:client:ItemBox"
    L3_2 = QS
    L3_2 = L3_2.Shared
    L3_2 = L3_2.Items
    L4_2 = A0_2.reward
    L3_2 = L3_2[L4_2]
    L4_2 = "add"
    L1_2(L2_2, L3_2, L4_2)
  else
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = TriggerServerEvent
      L2_2 = "inventory:server:combineItem"
      L3_2 = A0_2.reward
      L4_2 = A0_2.fromItem
      L5_2 = A0_2.toItem
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = TriggerEvent
      L2_2 = "inventory:client:ItemBox"
      L3_2 = QBCore
      L3_2 = L3_2.Shared
      L3_2 = L3_2.Items
      L4_2 = A0_2.reward
      L3_2 = L3_2[L4_2]
      L4_2 = "add"
      L1_2(L2_2, L3_2, L4_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "combineWithAnim"
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = A0_2.combineData
  L2_2 = L1_2.anim
  L2_2 = L2_2.dict
  L3_2 = L1_2.anim
  L3_2 = L3_2.lib
  L4_2 = L1_2.anim
  L4_2 = L4_2.text
  L5_2 = L1_2.anim
  L5_2 = L5_2.timeOut
  L6_2 = Citizen
  L6_2 = L6_2.Wait
  L7_2 = 450
  L6_2(L7_2)
  L6_2 = Config
  L6_2.InventoryBusy = true
  L6_2 = Config
  L6_2 = L6_2.Framework
  if "ESX" == L6_2 then
    L6_2 = QS
    L6_2 = L6_2.Progressbar
    L7_2 = "combine_anim"
    L8_2 = L4_2
    L9_2 = L5_2
    L10_2 = false
    L11_2 = true
    L12_2 = {}
    L12_2.disableMovement = false
    L12_2.disableCarMovement = true
    L12_2.disableMouse = false
    L12_2.disableCombat = true
    L13_2 = {}
    L13_2.animDict = L2_2
    L13_2.anim = L3_2
    L13_2.flags = 16
    L14_2 = {}
    L15_2 = {}
    function L16_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = Config
      L0_3.InventoryBusy = false
      L0_3 = StopAnimTask
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = L2_2
      L3_3 = L3_2
      L4_3 = 1.0
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = TriggerServerEvent
      L1_3 = "inventory:server:combineItem"
      L2_3 = L1_2.reward
      L3_3 = A0_2.requiredItem
      L4_3 = A0_2.usedItem
      L0_3(L1_3, L2_3, L3_3, L4_3)
    end
    function L17_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = Config
      L0_3.InventoryBusy = false
      L0_3 = StopAnimTask
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = L2_2
      L3_3 = L3_2
      L4_3 = 1.0
      L0_3(L1_3, L2_3, L3_3, L4_3)
    end
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  else
    L6_2 = Config
    L6_2 = L6_2.Framework
    if "QBCore" == L6_2 then
      L6_2 = QBCore
      L6_2 = L6_2.Functions
      L6_2 = L6_2.Progressbar
      L7_2 = "combine_anim"
      L8_2 = L4_2
      L9_2 = L5_2
      L10_2 = false
      L11_2 = true
      L12_2 = {}
      L12_2.disableMovement = false
      L12_2.disableCarMovement = true
      L12_2.disableMouse = false
      L12_2.disableCombat = true
      L13_2 = {}
      L13_2.animDict = L2_2
      L13_2.anim = L3_2
      L13_2.flags = 16
      L14_2 = {}
      L15_2 = {}
      function L16_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3
        L0_3 = Config
        L0_3.InventoryBusy = false
        L0_3 = StopAnimTask
        L1_3 = PlayerPedId
        L1_3 = L1_3()
        L2_3 = L2_2
        L3_3 = L3_2
        L4_3 = 1.0
        L0_3(L1_3, L2_3, L3_3, L4_3)
        L0_3 = TriggerServerEvent
        L1_3 = "inventory:server:combineItem"
        L2_3 = L1_2.reward
        L3_3 = A0_2.requiredItem
        L4_3 = A0_2.usedItem
        L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      function L17_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3
        L0_3 = Config
        L0_3.InventoryBusy = false
        L0_3 = StopAnimTask
        L1_3 = PlayerPedId
        L1_3 = L1_3()
        L2_3 = L2_2
        L3_3 = L3_2
        L4_3 = 1.0
        L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:ItemBox"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:ItemBox"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "itemBox"
  L3_2.item = A0_2
  L3_2.type = A1_2
  L2_2(L3_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:requiredItems"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:requiredItems"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = {}
  if A1_2 then
    L3_2 = pairs
    L4_2 = A0_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = Config
      L9_2 = L9_2.Framework
      if "ESX" == L9_2 then
        L9_2 = table
        L9_2 = L9_2.insert
        L10_2 = L2_2
        L11_2 = {}
        L12_2 = A0_2[L7_2]
        L12_2 = L12_2.name
        L11_2.item = L12_2
        L12_2 = QS
        L12_2 = L12_2.Shared
        L12_2 = L12_2.Items
        L13_2 = A0_2[L7_2]
        L13_2 = L13_2.name
        L12_2 = L12_2[L13_2]
        L12_2 = L12_2.label
        L11_2.label = L12_2
        L12_2 = A0_2[L7_2]
        L12_2 = L12_2.image
        L11_2.image = L12_2
        L9_2(L10_2, L11_2)
      else
        L9_2 = Config
        L9_2 = L9_2.Framework
        if "QBCore" == L9_2 then
          L9_2 = table
          L9_2 = L9_2.insert
          L10_2 = L2_2
          L11_2 = {}
          L12_2 = A0_2[L7_2]
          L12_2 = L12_2.name
          L11_2.item = L12_2
          L12_2 = QBCore
          L12_2 = L12_2.Shared
          L12_2 = L12_2.Items
          L13_2 = A0_2[L7_2]
          L13_2 = L13_2.name
          L12_2 = L12_2[L13_2]
          L12_2 = L12_2.label
          L11_2.label = L12_2
          L12_2 = A0_2[L7_2]
          L12_2 = L12_2.image
          L11_2.image = L12_2
          L9_2(L10_2, L11_2)
        end
      end
    end
  end
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "requiredItem"
  L4_2.items = L2_2
  L4_2.toggle = A1_2
  L3_2(L4_2)
end
L22_1(L23_1, L24_1)
L22_1 = Citizen
L22_1 = L22_1.CreateThread
function L23_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L0_2 = Config
  L0_2 = L0_2.DropMarker
  while true do
    L1_2 = 500
    L7_1 = L1_2
    L1_2 = L5_1
    if nil ~= L1_2 then
      L1_2 = pairs
      L2_2 = L5_1
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L7_2 = L5_1
        L7_2 = L7_2[L5_2]
        if nil ~= L7_2 then
          L7_2 = 3
          L7_1 = L7_2
          L7_2 = Config
          L7_2 = L7_2.DropMarker
          L7_2 = L7_2.enabletext
          if not L7_2 then
            L7_2 = DrawMarker
            L8_2 = L0_2.type
            L9_2 = L6_2.coords
            L9_2 = L9_2.x
            L10_2 = L6_2.coords
            L10_2 = L10_2.y
            L11_2 = L6_2.coords
            L11_2 = L11_2.z
            L11_2 = L11_2 - 0.2
            L12_2 = 0.0
            L13_2 = 0.0
            L14_2 = 0.0
            L15_2 = 0.0
            L16_2 = 0.0
            L17_2 = 0.0
            L18_2 = L0_2.scale
            L18_2 = L18_2.x
            L19_2 = L0_2.scale
            L19_2 = L19_2.y
            L20_2 = L0_2.scale
            L20_2 = L20_2.z
            L21_2 = L0_2.colour
            L21_2 = L21_2.r
            L22_2 = L0_2.colour
            L22_2 = L22_2.g
            L23_2 = L0_2.colour
            L23_2 = L23_2.b
            L24_2 = L0_2.colour
            L24_2 = L24_2.a
            L25_2 = 0
            L26_2 = 0
            L27_2 = 0
            L28_2 = L0_2.movement
            L29_2 = 0
            L30_2 = 0
            L31_2 = 0
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
          else
            L7_2 = Config
            L7_2 = L7_2.Framework
            if "ESX" == L7_2 then
              L7_2 = QS
              L7_2 = L7_2.DrawText3D
              L8_2 = L6_2.coords
              L8_2 = L8_2.x
              L9_2 = L6_2.coords
              L9_2 = L9_2.y
              L10_2 = L6_2.coords
              L10_2 = L10_2.z
              L11_2 = Lang
              L12_2 = "DROP_TEXT"
              L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L11_2(L12_2)
              L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
            else
              L7_2 = Config
              L7_2 = L7_2.Framework
              if "QBCore" == L7_2 then
                L7_2 = QBCore
                L7_2 = L7_2.Functions
                L7_2 = L7_2.DrawText3D
                L8_2 = L6_2.coords
                L8_2 = L8_2.x
                L9_2 = L6_2.coords
                L9_2 = L9_2.y
                L10_2 = L6_2.coords
                L10_2 = L10_2.z
                L11_2 = Lang
                L12_2 = "DROP_TEXT"
                L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L11_2(L12_2)
                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
              end
            end
            L7_2 = DrawMarker
            L8_2 = L0_2.type
            L9_2 = L6_2.coords
            L9_2 = L9_2.x
            L10_2 = L6_2.coords
            L10_2 = L10_2.y
            L11_2 = L6_2.coords
            L11_2 = L11_2.z
            L11_2 = L11_2 - 0.2
            L12_2 = 0.0
            L13_2 = 0.0
            L14_2 = 0.0
            L15_2 = 0.0
            L16_2 = 0.0
            L17_2 = 0.0
            L18_2 = L0_2.scale
            L18_2 = L18_2.x
            L19_2 = L0_2.scale
            L19_2 = L19_2.y
            L20_2 = L0_2.scale
            L20_2 = L20_2.z
            L21_2 = L0_2.colour
            L21_2 = L21_2.r
            L22_2 = L0_2.colour
            L22_2 = L22_2.g
            L23_2 = L0_2.colour
            L23_2 = L23_2.b
            L24_2 = L0_2.colour
            L24_2 = L24_2.a
            L25_2 = 0
            L26_2 = 0
            L27_2 = 0
            L28_2 = L0_2.movement
            L29_2 = 0
            L30_2 = 0
            L31_2 = 0
            L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
          end
        end
      end
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L7_1
    L1_2(L2_2)
  end
end
L22_1(L23_1)
L22_1 = Citizen
L22_1 = L22_1.CreateThread
function L23_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = Config
  L0_2 = L0_2.DropMarker
  L1_2 = nil
  L2_2 = 10
  L3_2 = false
  while true do
    L4_2 = L4_1
    if nil ~= L4_2 then
      L4_2 = next
      L5_2 = L4_1
      L4_2 = L4_2(L5_2)
      if nil ~= L4_2 then
        L1_2 = nil
        L2_2 = 10
        L3_2 = false
        L4_2 = GetEntityCoords
        L5_2 = PlayerPedId
        L5_2 = L5_2()
        L6_2 = true
        L4_2 = L4_2(L5_2, L6_2)
        L5_2 = pairs
        L6_2 = L4_1
        L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
        for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
          L11_2 = L4_1
          L11_2 = L11_2[L9_2]
          if nil ~= L11_2 then
            L11_2 = GetDistanceBetweenCoords
            L12_2 = L4_2.x
            L13_2 = L4_2.y
            L14_2 = L4_2.z
            L15_2 = L10_2.coords
            L15_2 = L15_2.x
            L16_2 = L10_2.coords
            L16_2 = L16_2.y
            L17_2 = L10_2.coords
            L17_2 = L17_2.z
            L18_2 = true
            L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
            L12_2 = L0_2.distanceMarker
            if L11_2 < L12_2 then
              L12_2 = L5_1
              L12_2[L9_2] = L10_2
              L12_2 = L0_2.distanceText
              if L11_2 < L12_2 and L2_2 > L11_2 then
                L2_2 = L11_2
                L1_2 = L9_2
                L3_2 = true
              end
            else
              L12_2 = L5_1
              L12_2[L9_2] = nil
            end
          end
        end
        if L3_2 then
          CurrentDrop = L1_2
        else
          CurrentDrop = 0
        end
    end
    else
      L4_2 = {}
      L5_1 = L4_2
    end
    L4_2 = Citizen
    L4_2 = L4_2.Wait
    L5_2 = 500
    L4_2(L5_2)
  end
end
L22_1(L23_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:RobPlayer"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:RobPlayer"
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Config
  L1_2 = L1_2.WeaponNeededToSteal
  if L1_2 then
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = IsPedArmed
    L3_2 = L1_2
    L4_2 = 1
    L2_2 = L2_2(L3_2, L4_2)
    if not L2_2 then
      L2_2 = IsPedArmed
      L3_2 = L1_2
      L4_2 = 2
      L2_2 = L2_2(L3_2, L4_2)
      if not L2_2 then
        L2_2 = IsPedArmed
        L3_2 = L1_2
        L4_2 = 4
        L2_2 = L2_2(L3_2, L4_2)
        if not L2_2 then
          goto lbl_31
        end
      end
    end
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.action = "RobMoney"
    L3_2.TargetId = A0_2
    L2_2(L3_2)
    ::lbl_31::
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = SendNUIMessage
      L3_2 = {}
      L3_2.action = "RobCash"
      L3_2.TargetId = A0_2
      L2_2(L3_2)
    end
  else
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.action = "RobMoney"
    L2_2.TargetId = A0_2
    L1_2(L2_2)
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = SendNUIMessage
      L2_2 = {}
      L2_2.action = "RobCash"
      L2_2.TargetId = A0_2
      L1_2(L2_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "RobCash"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "inventory:server:RobCash"
  L4_2 = A0_2.TargetId
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "RobMoney"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerEvent
  L3_2 = "inventory:client:search"
  L4_2 = source
  L2_2(L3_2, L4_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:RobPlayer:Admin"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:RobPlayer:Admin"
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = TriggerServerEvent
  L2_2 = "inventory:server:OpenInventory"
  L3_2 = "otherplayer"
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:server:Trunk:Admin"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:server:Trunk:Admin"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = TriggerServerEvent
  L3_2 = "inventory:server:OpenInventory"
  L4_2 = "trunk"
  L5_2 = A0_2
  L6_2 = A1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:server:Glovebox:Admin"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:server:Glovebox:Admin"
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = TriggerServerEvent
  L2_2 = "inventory:server:OpenInventory"
  L3_2 = "glovebox"
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "GetInventoryData"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = ESX
    L2_2 = L2_2.TriggerServerCallback
    L3_2 = "qb-inventory:GetInventoryData"
    function L4_2(A0_3)
      local L1_3, L2_3, L3_3
      L1_3 = A1_2
      L2_3 = A0_3
      L3_3 = Config
      L3_3 = L3_3.MaxInventorySlots
      L1_3(L2_3, L3_3)
    end
    L2_2(L3_2, L4_2)
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = QBCore
      L2_2 = L2_2.Functions
      L2_2 = L2_2.TriggerCallback
      L3_2 = "qb-inventory:GetInventoryData"
      function L4_2(A0_3)
        local L1_3, L2_3, L3_3
        L1_3 = A1_2
        L2_3 = A0_3
        L3_3 = Config
        L3_3 = L3_3.MaxInventorySlots
        L1_3(L2_3, L3_3)
      end
      L2_2(L3_2, L4_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:search"
L22_1(L23_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:OpenInventory"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:OpenInventory"
function L24_1()
  local L0_2, L1_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "setColors"
  L0_2(L1_2)
end
L22_1(L23_1, L24_1)
L22_1 = AddEventHandler
L23_1 = Config
L23_1 = L23_1.status_onTick
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = TriggerEvent
  L2_2 = Config
  L2_2 = L2_2.status_getStatus
  L3_2 = "hunger"
  function L4_2(A0_3)
    local L1_3
    L1_3 = A0_3.val
    L1_3 = L1_3 / 10000
    hunger = L1_3
  end
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = TriggerEvent
  L2_2 = Config
  L2_2 = L2_2.status_getStatus
  L3_2 = "thirst"
  function L4_2(A0_3)
    local L1_3
    L1_3 = A0_3.val
    L1_3 = L1_3 / 10000
    thirst = L1_3
  end
  L1_2(L2_2, L3_2, L4_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:ShowTrunkPos"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:ShowTrunkPos"
function L24_1()
  local L0_2, L1_2
  L0_2 = true
  L6_1 = L0_2
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "GiveItem"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = tonumber
  L3_2 = A0_2.player
  L2_2 = L2_2(L3_2)
  L3_2 = GetPlayerFromServerId
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetPlayerPed
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L2_2 then
    L5_2 = DoesEntityExist
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = PlayerPedId
      L5_2 = L5_2()
      L6_2 = GetEntityCoords
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      L7_2 = GetEntityCoords
      L8_2 = L4_2
      L7_2 = L7_2(L8_2)
      L8_2 = GetDistanceBetweenCoords
      L9_2 = L6_2.x
      L10_2 = L6_2.y
      L11_2 = L6_2.z
      L12_2 = L7_2.x
      L13_2 = L7_2.y
      L14_2 = L7_2.z
      L15_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      if L8_2 < 3.0 then
        L9_2 = A0_2.amount
        if L9_2 >= 1 then
          L9_2 = RemoveAllPedWeapons
          L10_2 = PlayerPedId
          L10_2 = L10_2()
          L11_2 = true
          L9_2(L10_2, L11_2)
          L9_2 = TriggerServerEvent
          L10_2 = "inventory:server:GiveItem"
          L11_2 = L2_2
          L12_2 = A0_2.item
          L13_2 = A0_2.amount
          L9_2(L10_2, L11_2, L12_2, L13_2)
        else
          L9_2 = SendTextMessage
          L10_2 = Lang
          L11_2 = "INVENTORY_QUANTITY"
          L10_2 = L10_2(L11_2)
          L11_2 = "error"
          L9_2(L10_2, L11_2)
        end
      else
        L9_2 = SendTextMessage
        L10_2 = Lang
        L11_2 = "NO_PLAYERS"
        L10_2 = L10_2(L11_2)
        L11_2 = "error"
        L9_2(L10_2, L11_2)
      end
  end
  else
    L5_2 = SendTextMessage
    L6_2 = Lang
    L7_2 = "NO_PLAYERS"
    L6_2 = L6_2(L7_2)
    L7_2 = "error"
    L5_2(L6_2, L7_2)
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:UpdatePlayerInventory"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:UpdatePlayerInventory"
function L24_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.Framework
  if "ESX" == L1_2 then
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.action = "update"
    L3_2 = QS
    L3_2 = L3_2.GetPlayerData
    L3_2 = L3_2()
    L3_2 = L3_2.items
    L2_2.inventory = L3_2
    L3_2 = Config
    L3_2 = L3_2.MaxWeight
    L2_2.maxweight = L3_2
    L3_2 = Config
    L3_2 = L3_2.MaxInventorySlots
    L3_2 = L3_2 - 1
    L2_2.slots = L3_2
    L2_2.error = A0_2
    L1_2(L2_2)
  else
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = SendNUIMessage
      L2_2 = {}
      L2_2.action = "update"
      L3_2 = QBCore
      L3_2 = L3_2.Functions
      L3_2 = L3_2.GetPlayerData
      L3_2 = L3_2()
      L3_2 = L3_2.items
      L2_2.inventory = L3_2
      L3_2 = Config
      L3_2 = L3_2.MaxWeight
      L2_2.maxweight = L3_2
      L3_2 = Config
      L3_2 = L3_2.MaxInventorySlots
      L3_2 = L3_2 - 1
      L2_2.slots = L3_2
      L2_2.error = A0_2
      L1_2(L2_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "UpdatePlayerInventory"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Citizen
  L2_2 = L2_2.Wait
  L3_2 = 100
  L2_2(L3_2)
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.action = "update"
    L4_2 = QS
    L4_2 = L4_2.GetPlayerData
    L4_2 = L4_2()
    L4_2 = L4_2.items
    L3_2.inventory = L4_2
    L4_2 = Config
    L4_2 = L4_2.MaxWeight
    L3_2.maxweight = L4_2
    L4_2 = Config
    L4_2 = L4_2.MaxInventorySlots
    L4_2 = L4_2 - 1
    L3_2.slots = L4_2
    L2_2(L3_2)
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = SendNUIMessage
      L3_2 = {}
      L3_2.action = "update"
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.GetPlayerData
      L4_2 = L4_2()
      L4_2 = L4_2.items
      L3_2.inventory = L4_2
      L4_2 = Config
      L4_2 = L4_2.MaxWeight
      L3_2.maxweight = L4_2
      L4_2 = Config
      L4_2 = L4_2.MaxInventorySlots
      L4_2 = L4_2 - 1
      L3_2.slots = L4_2
      L2_2(L3_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:UpdateDebug"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:UpdateDebug"
function L24_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "UpdateInventory"
  L1_2(L2_2)
end
L22_1(L23_1, L24_1)
function L22_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.Bombs
  return L0_2
end
GetBombs = L22_1
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:UseWeapon"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:UseWeapon"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = tostring
  L3_2 = A0_2.name
  L2_2 = L2_2(L3_2)
  L3_2 = GetCurrentPedWeapon
  L4_2 = PlayerPedId
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L4_2()
  L3_2, L4_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L5_2 = L1_1
  if L5_2 == L2_2 then
    L5_2 = GetHashKey
    L6_2 = "WEAPON_UNARMED"
    L5_2 = L5_2(L6_2)
    if L4_2 ~= L5_2 then
      L5_2 = SetCurrentPedWeapon
      L6_2 = PlayerPedId
      L6_2 = L6_2()
      L7_2 = GetHashKey
      L8_2 = "WEAPON_UNARMED"
      L7_2 = L7_2(L8_2)
      L8_2 = true
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = RemoveAllPedWeapons
      L6_2 = PlayerPedId
      L6_2 = L6_2()
      L7_2 = true
      L5_2(L6_2, L7_2)
      L5_2 = TriggerEvent
      L6_2 = "weapons:client:SetCurrentWeapon"
      L7_2 = nil
      L8_2 = A1_2
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = nil
      L1_1 = L5_2
  end
  else
    L5_2 = Config
    L5_2 = L5_2.Bombs
    L6_2 = GetHashKey
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    L5_2 = L5_2[L6_2]
    if L5_2 then
      L5_2 = TriggerEvent
      L6_2 = "weapons:client:SetCurrentWeapon"
      L7_2 = A0_2
      L8_2 = A1_2
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = tonumber
      L6_2 = A0_2.info
      L6_2 = L6_2.ammo
      L5_2 = L5_2(L6_2)
      if 0 == L5_2 or nil == L5_2 then
        L6_2 = Config
        L6_2 = L6_2.BombsAmount
        L7_2 = GetHashKey
        L8_2 = L2_2
        L7_2 = L7_2(L8_2)
        L6_2 = L6_2[L7_2]
        L5_2 = L6_2 or L5_2
        if not L6_2 then
          L5_2 = 1
        else
        end
      end
      L6_2 = GiveWeaponToPed
      L7_2 = PlayerPedId
      L7_2 = L7_2()
      L8_2 = GetHashKey
      L9_2 = L2_2
      L8_2 = L8_2(L9_2)
      L9_2 = L5_2
      L10_2 = false
      L11_2 = false
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      L6_2 = SetPedAmmo
      L7_2 = PlayerPedId
      L7_2 = L7_2()
      L8_2 = GetHashKey
      L9_2 = L2_2
      L8_2 = L8_2(L9_2)
      L9_2 = L5_2
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = SetCurrentPedWeapon
      L7_2 = PlayerPedId
      L7_2 = L7_2()
      L8_2 = GetHashKey
      L9_2 = L2_2
      L8_2 = L8_2(L9_2)
      L9_2 = true
      L6_2(L7_2, L8_2, L9_2)
      L1_1 = L2_2
    else
      L5_2 = L2_2 == L2_2
      if "weapon_shoe" == L5_2 then
        L5_2 = GiveWeaponToPed
        L6_2 = ped
        L7_2 = GetHashKey
        L8_2 = L2_2
        L7_2 = L7_2(L8_2)
        L8_2 = 1
        L9_2 = false
        L10_2 = false
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
        L5_2 = SetPedAmmo
        L6_2 = ped
        L7_2 = GetHashKey
        L8_2 = L2_2
        L7_2 = L7_2(L8_2)
        L8_2 = 1
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = SetCurrentPedWeapon
        L6_2 = ped
        L7_2 = GetHashKey
        L8_2 = L2_2
        L7_2 = L7_2(L8_2)
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = TriggerEvent
        L6_2 = "weapons:client:SetCurrentWeapon"
        L7_2 = A0_2
        L8_2 = A1_2
        L5_2(L6_2, L7_2, L8_2)
        L1_1 = L2_2
      else
        L5_2 = TriggerEvent
        L6_2 = "weapons:client:SetCurrentWeapon"
        L7_2 = A0_2
        L8_2 = A1_2
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = tonumber
        L6_2 = A0_2.info
        L6_2 = L6_2.ammo
        L5_2 = L5_2(L6_2)
        if ("weapon_petrolcan" == L2_2 or "weapon_fireextinguisher" == L2_2) and (0 == L5_2 or nil == L5_2) then
          L5_2 = 4000
        end
        L6_2 = GiveWeaponToPed
        L7_2 = PlayerPedId
        L7_2 = L7_2()
        L8_2 = GetHashKey
        L9_2 = L2_2
        L8_2 = L8_2(L9_2)
        L9_2 = L5_2
        L10_2 = false
        L11_2 = false
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        L6_2 = SetPedAmmo
        L7_2 = PlayerPedId
        L7_2 = L7_2()
        L8_2 = GetHashKey
        L9_2 = L2_2
        L8_2 = L8_2(L9_2)
        L9_2 = L5_2
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = SetCurrentPedWeapon
        L7_2 = PlayerPedId
        L7_2 = L7_2()
        L8_2 = GetHashKey
        L9_2 = L2_2
        L8_2 = L8_2(L9_2)
        L9_2 = true
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = A0_2.info
        L6_2 = L6_2.attachments
        if nil ~= L6_2 then
          L6_2 = pairs
          L7_2 = A0_2.info
          L7_2 = L7_2.attachments
          L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
          for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
            L12_2 = L11_2.component
            if "weaponcolor1" ~= L12_2 then
              L12_2 = L11_2.component
              if "weaponcolor2" ~= L12_2 then
                L12_2 = L11_2.component
                if "weaponcolor3" ~= L12_2 then
                  L12_2 = L11_2.component
                  if "weaponcolor4" ~= L12_2 then
                    L12_2 = L11_2.component
                    if "weaponcolor5" ~= L12_2 then
                      L12_2 = L11_2.component
                      if "weaponcolor6" ~= L12_2 then
                        L12_2 = L11_2.component
                        if "weaponcolor7" ~= L12_2 then
                          L12_2 = L11_2.component
                          if "weaponcolor1" ~= L12_2 then
                            L12_2 = L11_2.component
                            if "weaponcolor2" ~= L12_2 then
                              L12_2 = L11_2.component
                              if "weaponcolor3" ~= L12_2 then
                                L12_2 = L11_2.component
                                if "weaponcolor4" ~= L12_2 then
                                  L12_2 = L11_2.component
                                  if "weaponcolor5" ~= L12_2 then
                                    L12_2 = L11_2.component
                                    if "weaponcolor6" ~= L12_2 then
                                      L12_2 = L11_2.component
                                      if "weaponcolor7" ~= L12_2 then
                                        L12_2 = L11_2.component
                                        if "weaponcolor8" ~= L12_2 then
                                          L12_2 = L11_2.component
                                          if "weaponcolor9" ~= L12_2 then
                                            L12_2 = L11_2.component
                                            if "weaponcolor10" ~= L12_2 then
                                              L12_2 = L11_2.component
                                              if "weaponcolor11" ~= L12_2 then
                                                L12_2 = L11_2.component
                                                if "weaponcolor12" ~= L12_2 then
                                                  L12_2 = L11_2.component
                                                  if "weaponcolor13" ~= L12_2 then
                                                    L12_2 = L11_2.component
                                                    if "weaponcolor14" ~= L12_2 then
                                                      L12_2 = L11_2.component
                                                      if "weaponcolor15" ~= L12_2 then
                                                        L12_2 = L11_2.component
                                                        if "weaponcolor16" ~= L12_2 then
                                                          L12_2 = L11_2.component
                                                          if "weaponcolor17" ~= L12_2 then
                                                            L12_2 = L11_2.component
                                                            if "weaponcolor18" ~= L12_2 then
                                                              L12_2 = L11_2.component
                                                              if "weaponcolor19" ~= L12_2 then
                                                                L12_2 = L11_2.component
                                                                if "weaponcolor20" ~= L12_2 then
                                                                  L12_2 = L11_2.component
                                                                  if "weaponcolor21" ~= L12_2 then
                                                                    L12_2 = L11_2.component
                                                                    if "weaponcolor22" ~= L12_2 then
                                                                      L12_2 = L11_2.component
                                                                      if "weaponcolor23" ~= L12_2 then
                                                                        L12_2 = L11_2.component
                                                                        if "weaponcolor24" ~= L12_2 then
                                                                          L12_2 = L11_2.component
                                                                          if "weaponcolor25" ~= L12_2 then
                                                                            L12_2 = L11_2.component
                                                                            if "weaponcolor26" ~= L12_2 then
                                                                              L12_2 = L11_2.component
                                                                              if "weaponcolor27" ~= L12_2 then
                                                                                L12_2 = L11_2.component
                                                                                if "weaponcolor28" ~= L12_2 then
                                                                                  L12_2 = L11_2.component
                                                                                  if "weaponcolor29" ~= L12_2 then
                                                                                    L12_2 = L11_2.component
                                                                                    if "weaponcolor30" ~= L12_2 then
                                                                                      L12_2 = L11_2.component
                                                                                      if "weaponcolor31" ~= L12_2 then
                                                                                        goto lbl_313
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
            L12_2 = GetAttachmentColorNoText
            L13_2 = L11_2.component
            L12_2 = L12_2(L13_2)
            L13_2 = SetPedWeaponTintIndex
            L14_2 = PlayerPedId
            L14_2 = L14_2()
            L15_2 = GetHashKey
            L16_2 = L2_2
            L15_2 = L15_2(L16_2)
            L16_2 = tonumber
            L17_2 = L12_2
            L16_2, L17_2, L18_2, L19_2, L20_2 = L16_2(L17_2)
            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            goto lbl_390
            ::lbl_313::
            L12_2 = L11_2.component
            if "weapontinturlattach" == L12_2 then
              L12_2 = Citizen
              L12_2 = L12_2.Wait
              L13_2 = 300
              L12_2(L13_2)
              L12_2 = 1
              L13_2 = Config
              L13_2 = L13_2.WeaponTints
              L13_2 = #L13_2
              L14_2 = 1
              for L15_2 = L12_2, L13_2, L14_2 do
                L16_2 = tostring
                L17_2 = GetHashKey
                L18_2 = L2_2
                L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2)
                L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
                L17_2 = Config
                L17_2 = L17_2.WeaponTints
                L17_2 = L17_2[L15_2]
                L17_2 = L17_2.hash
                if L16_2 == L17_2 then
                  L16_2 = CreateRuntimeTxd
                  L17_2 = Config
                  L17_2 = L17_2.WeaponTints
                  L17_2 = L17_2[L15_2]
                  L17_2 = L17_2.name
                  L16_2 = L16_2(L17_2)
                  txd = L16_2
                  L16_2 = CreateDui
                  L17_2 = tostring
                  L18_2 = L11_2.urltint
                  L17_2 = L17_2(L18_2)
                  L18_2 = 250
                  L19_2 = 250
                  L16_2 = L16_2(L17_2, L18_2, L19_2)
                  duiObj = L16_2
                  L16_2 = GetDuiHandle
                  L17_2 = duiObj
                  L16_2 = L16_2(L17_2)
                  dui = L16_2
                  L16_2 = CreateRuntimeTextureFromDuiHandle
                  L17_2 = txd
                  L18_2 = "skin"
                  L19_2 = dui
                  L16_2 = L16_2(L17_2, L18_2, L19_2)
                  tx = L16_2
                  L16_2 = AddReplaceTexture
                  L17_2 = Config
                  L17_2 = L17_2.WeaponTints
                  L17_2 = L17_2[L15_2]
                  L17_2 = L17_2.ytd
                  L18_2 = Config
                  L18_2 = L18_2.WeaponTints
                  L18_2 = L18_2[L15_2]
                  L18_2 = L18_2.texture
                  L19_2 = Config
                  L19_2 = L19_2.WeaponTints
                  L19_2 = L19_2[L15_2]
                  L19_2 = L19_2.name
                  L20_2 = "skin"
                  L16_2(L17_2, L18_2, L19_2, L20_2)
                  break
                end
              end
            else
              L12_2 = GiveWeaponComponentToPed
              L13_2 = PlayerPedId
              L13_2 = L13_2()
              L14_2 = GetHashKey
              L15_2 = L2_2
              L14_2 = L14_2(L15_2)
              L15_2 = GetHashKey
              L16_2 = L11_2.component
              L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L15_2(L16_2)
              L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            end
            ::lbl_390::
          end
        end
        L1_1 = L2_2
      end
    end
  end
end
L22_1(L23_1, L24_1)
function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = A0_2
  L3_2 = "weaponcolor"
  L4_2 = ""
  return L1_2(L2_2, L3_2, L4_2)
end
GetAttachmentColorNoText = L22_1
function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = {}
  L2_2 = A0_2.name
  L3_2 = L2_2
  L2_2 = L2_2.upper
  L2_2 = L2_2(L3_2)
  A0_2.name = L2_2
  L2_2 = A0_2.info
  L2_2 = L2_2.attachments
  if nil ~= L2_2 then
    L2_2 = next
    L3_2 = A0_2.info
    L3_2 = L3_2.attachments
    L2_2 = L2_2(L3_2)
    if nil ~= L2_2 then
      L2_2 = pairs
      L3_2 = A0_2.info
      L3_2 = L3_2.attachments
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = Config
        L8_2 = L8_2.WeaponAttachments
        L9_2 = A0_2.name
        L8_2 = L8_2[L9_2]
        if nil ~= L8_2 then
          L8_2 = pairs
          L9_2 = Config
          L9_2 = L9_2.WeaponAttachments
          L10_2 = A0_2.name
          L9_2 = L9_2[L10_2]
          L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
          for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
            L14_2 = L13_2.component
            L15_2 = L7_2.component
            if L14_2 == L15_2 then
              L14_2 = table
              L14_2 = L14_2.insert
              L15_2 = L1_2
              L16_2 = {}
              L16_2.attachment = L12_2
              L17_2 = L13_2.label
              L16_2.label = L17_2
              L14_2(L15_2, L16_2)
            end
          end
        end
      end
    end
  end
  return L1_2
end
FormatWeaponAttachments = L22_1
L22_1 = RegisterNUICallback
L23_1 = "UseItemShiftClick"
function L24_1(A0_2)
  local L1_2, L2_2
  L1_2 = Config
  L1_2 = L1_2.Framework
  if "ESX" == L1_2 then
    L1_2 = QS
    L1_2 = L1_2.GetPlayerData
    function L2_2(A0_3)
      local L1_3, L2_3, L3_3
      L1_3 = Config
      L1_3 = L1_3.BlockHotBarPhone
      if L1_3 then
        L1_3 = A0_3.metadata
        L1_3 = L1_3.isdead
        if not L1_3 then
          L1_3 = A0_3.metadata
          L1_3 = L1_3.inlaststand
          if not L1_3 then
            L1_3 = A0_3.metadata
            L1_3 = L1_3.ishandcuffed
            if not L1_3 then
              L1_3 = exports
              L1_3 = L1_3["qs-smartphone"]
              L2_3 = L1_3
              L1_3 = L1_3.InPhone
              L1_3 = L1_3(L2_3)
              if not L1_3 then
                L1_3 = SendNUIMessage
                L2_3 = {}
                L2_3.action = "close"
                L1_3(L2_3)
                L1_3 = SetNuiFocus
                L2_3 = false
                L3_3 = false
                L1_3(L2_3, L3_3)
                L1_3 = Config
                L1_3.HasInventoryOpen = false
                L1_3 = Citizen
                L1_3 = L1_3.Wait
                L2_3 = 250
                L1_3(L2_3)
                L1_3 = TriggerServerEvent
                L2_3 = "inventory:server:UseItemSlot"
                L3_3 = A0_2.slot
                L1_3(L2_3, L3_3)
              end
            end
          end
        end
      else
        L1_3 = A0_3.metadata
        L1_3 = L1_3.isdead
        if not L1_3 then
          L1_3 = A0_3.metadata
          L1_3 = L1_3.inlaststand
          if not L1_3 then
            L1_3 = A0_3.metadata
            L1_3 = L1_3.ishandcuffed
            if not L1_3 then
              L1_3 = SendNUIMessage
              L2_3 = {}
              L2_3.action = "close"
              L1_3(L2_3)
              L1_3 = SetNuiFocus
              L2_3 = false
              L3_3 = false
              L1_3(L2_3, L3_3)
              L1_3 = Config
              L1_3.HasInventoryOpen = false
              L1_3 = Citizen
              L1_3 = L1_3.Wait
              L2_3 = 250
              L1_3(L2_3)
              L1_3 = TriggerServerEvent
              L2_3 = "inventory:server:UseItemSlot"
              L3_3 = A0_2.slot
              L1_3(L2_3, L3_3)
            end
          end
        end
      end
    end
    L1_2(L2_2)
  else
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = QBCore
      L1_2 = L1_2.Functions
      L1_2 = L1_2.GetPlayerData
      function L2_2(A0_3)
        local L1_3, L2_3, L3_3
        L1_3 = A0_3.metadata
        L1_3 = L1_3.isdead
        if not L1_3 then
          L1_3 = A0_3.metadata
          L1_3 = L1_3.inlaststand
          if not L1_3 then
            L1_3 = A0_3.metadata
            L1_3 = L1_3.ishandcuffed
            if not L1_3 then
              L1_3 = SendNUIMessage
              L2_3 = {}
              L2_3.action = "close"
              L1_3(L2_3)
              L1_3 = SetNuiFocus
              L2_3 = false
              L3_3 = false
              L1_3(L2_3, L3_3)
              L1_3 = Config
              L1_3.HasInventoryOpen = false
              L1_3 = Citizen
              L1_3 = L1_3.Wait
              L2_3 = 250
              L1_3(L2_3)
              L1_3 = TriggerServerEvent
              L2_3 = "inventory:server:UseItemSlot"
              L3_3 = A0_2.slot
              L1_3(L2_3, L3_3)
            end
          end
        end
      end
      L1_2(L2_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "GetWeaponData"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = {}
    L3_2 = QS
    L3_2 = L3_2.Shared
    L3_2 = L3_2.Items
    L4_2 = A0_2.weapon
    L3_2 = L3_2[L4_2]
    L2_2.WeaponData = L3_2
    L3_2 = FormatWeaponAttachments
    L4_2 = A0_2.ItemData
    L3_2 = L3_2(L4_2)
    L2_2.AttachmentData = L3_2
    L3_2 = A1_2
    L4_2 = L2_2
    L3_2(L4_2)
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = {}
      L3_2 = QBCore
      L3_2 = L3_2.Shared
      L3_2 = L3_2.Items
      L4_2 = A0_2.weapon
      L3_2 = L3_2[L4_2]
      L2_2.WeaponData = L3_2
      L3_2 = FormatWeaponAttachments
      L4_2 = A0_2.ItemData
      L3_2 = L3_2(L4_2)
      L2_2.AttachmentData = L3_2
      L3_2 = A1_2
      L4_2 = L2_2
      L3_2(L4_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "RemoveAttachment"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = QS
    L2_2 = L2_2.Shared
    L2_2 = L2_2.Items
    L3_2 = A0_2.WeaponData
    L3_2 = L3_2.name
    L2_2 = L2_2[L3_2]
    L3_2 = Config
    L3_2 = L3_2.WeaponAttachments
    L4_2 = L2_2.name
    L5_2 = L4_2
    L4_2 = L4_2.upper
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    L4_2 = A0_2.AttachmentData
    L4_2 = L4_2.attachment
    L3_2 = L3_2[L4_2]
    L4_2 = ESX
    L4_2 = L4_2.TriggerServerCallback
    L5_2 = "weapons:server:RemoveAttachment"
    function L6_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3
      if false ~= A0_3 then
        L1_3 = {}
        L2_3 = "weaponcolor"
        L3_3 = tostring
        L4_3 = L3_2.component
        L3_3 = L3_3(L4_3)
        L4_3 = string
        L4_3 = L4_3.match
        L6_3 = L3_3
        L5_3 = L3_3.lower
        L5_3 = L5_3(L6_3)
        L7_3 = L2_3
        L6_3 = L2_3.lower
        L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L6_3(L7_3)
        L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
        if L4_3 then
          L4_3 = SetPedWeaponTintIndex
          L5_3 = PlayerPedId
          L5_3 = L5_3()
          L6_3 = GetHashKey
          L7_3 = A0_2.WeaponData
          L7_3 = L7_3.name
          L6_3 = L6_3(L7_3)
          L7_3 = 0
          L4_3(L5_3, L6_3, L7_3)
        else
          L4_3 = L3_2.component
          if "weapontinturlattach" == L4_3 then
            L4_3 = 1
            L5_3 = Config
            L5_3 = L5_3.WeaponTints
            L5_3 = #L5_3
            L6_3 = 1
            for L7_3 = L4_3, L5_3, L6_3 do
              L8_3 = tostring
              L9_3 = GetHashKey
              L10_3 = A0_2.WeaponData
              L10_3 = L10_3.name
              L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L9_3(L10_3)
              L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
              L9_3 = Config
              L9_3 = L9_3.WeaponTints
              L9_3 = L9_3[L7_3]
              L9_3 = L9_3.hash
              if L8_3 == L9_3 then
                L8_3 = AddReplaceTexture
                L9_3 = Config
                L9_3 = L9_3.WeaponTints
                L9_3 = L9_3[L7_3]
                L9_3 = L9_3.ytd
                L10_3 = Config
                L10_3 = L10_3.WeaponTints
                L10_3 = L10_3[L7_3]
                L10_3 = L10_3.texture
                L11_3 = Config
                L11_3 = L11_3.WeaponTints
                L11_3 = L11_3[L7_3]
                L11_3 = L11_3.ytd
                L12_3 = Config
                L12_3 = L12_3.WeaponTints
                L12_3 = L12_3[L7_3]
                L12_3 = L12_3.texture
                L8_3(L9_3, L10_3, L11_3, L12_3)
                break
              end
            end
          else
            L4_3 = RemoveWeaponComponentFromPed
            L5_3 = PlayerPedId
            L5_3 = L5_3()
            L6_3 = GetHashKey
            L7_3 = A0_2.WeaponData
            L7_3 = L7_3.name
            L6_3 = L6_3(L7_3)
            L7_3 = GetHashKey
            L8_3 = L3_2.component
            L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L7_3(L8_3)
            L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
          end
        end
        L4_3 = pairs
        L5_3 = A0_3
        L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
        for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
          L10_3 = pairs
          L11_3 = Config
          L11_3 = L11_3.WeaponAttachments
          L12_3 = L2_2.name
          L13_3 = L12_3
          L12_3 = L12_3.upper
          L12_3 = L12_3(L13_3)
          L11_3 = L11_3[L12_3]
          L10_3, L11_3, L12_3, L13_3 = L10_3(L11_3)
          for L14_3, L15_3 in L10_3, L11_3, L12_3, L13_3 do
            L16_3 = L9_3.component
            L17_3 = L15_3.component
            if L16_3 == L17_3 then
              L16_3 = table
              L16_3 = L16_3.insert
              L17_3 = L1_3
              L18_3 = {}
              L19_3 = L15_3.item
              L18_3.attachment = L19_3
              L19_3 = L15_3.label
              L18_3.label = L19_3
              L16_3(L17_3, L18_3)
            end
          end
        end
        L4_3 = {}
        L4_3.Attachments = L1_3
        L5_3 = L2_2
        L4_3.WeaponData = L5_3
        L5_3 = A1_2
        L6_3 = L4_3
        L5_3(L6_3)
      else
        L1_3 = "weaponcolor"
        L2_3 = tostring
        L3_3 = L3_2.component
        L2_3 = L2_3(L3_3)
        L3_3 = string
        L3_3 = L3_3.match
        L5_3 = L2_3
        L4_3 = L2_3.lower
        L4_3 = L4_3(L5_3)
        L6_3 = L1_3
        L5_3 = L1_3.lower
        L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L5_3(L6_3)
        L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
        if L3_3 then
          L3_3 = SetPedWeaponTintIndex
          L4_3 = PlayerPedId
          L4_3 = L4_3()
          L5_3 = GetHashKey
          L6_3 = A0_2.WeaponData
          L6_3 = L6_3.name
          L5_3 = L5_3(L6_3)
          L6_3 = 0
          L3_3(L4_3, L5_3, L6_3)
        else
          L3_3 = L3_2.component
          if "weapontinturlattach" == L3_3 then
            L3_3 = 1
            L4_3 = Config
            L4_3 = L4_3.WeaponTints
            L4_3 = #L4_3
            L5_3 = 1
            for L6_3 = L3_3, L4_3, L5_3 do
              L7_3 = tostring
              L8_3 = GetHashKey
              L9_3 = A0_2.WeaponData
              L9_3 = L9_3.name
              L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L8_3(L9_3)
              L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
              L8_3 = Config
              L8_3 = L8_3.WeaponTints
              L8_3 = L8_3[L6_3]
              L8_3 = L8_3.hash
              if L7_3 == L8_3 then
                L7_3 = AddReplaceTexture
                L8_3 = Config
                L8_3 = L8_3.WeaponTints
                L8_3 = L8_3[L6_3]
                L8_3 = L8_3.ytd
                L9_3 = Config
                L9_3 = L9_3.WeaponTints
                L9_3 = L9_3[L6_3]
                L9_3 = L9_3.texture
                L10_3 = Config
                L10_3 = L10_3.WeaponTints
                L10_3 = L10_3[L6_3]
                L10_3 = L10_3.ytd
                L11_3 = Config
                L11_3 = L11_3.WeaponTints
                L11_3 = L11_3[L6_3]
                L11_3 = L11_3.texture
                L7_3(L8_3, L9_3, L10_3, L11_3)
                break
              end
            end
          else
            L3_3 = RemoveWeaponComponentFromPed
            L4_3 = PlayerPedId
            L4_3 = L4_3()
            L5_3 = GetHashKey
            L6_3 = A0_2.WeaponData
            L6_3 = L6_3.name
            L5_3 = L5_3(L6_3)
            L6_3 = GetHashKey
            L7_3 = L3_2.component
            L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L6_3(L7_3)
            L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
          end
        end
        L3_3 = A1_2
        L4_3 = {}
        L3_3(L4_3)
      end
    end
    L7_2 = A0_2.AttachmentData
    L8_2 = A0_2.WeaponData
    L4_2(L5_2, L6_2, L7_2, L8_2)
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = QBCore
      L2_2 = L2_2.Shared
      L2_2 = L2_2.Items
      L3_2 = A0_2.WeaponData
      L3_2 = L3_2.name
      L2_2 = L2_2[L3_2]
      L3_2 = Config
      L3_2 = L3_2.WeaponAttachments
      L4_2 = L2_2.name
      L5_2 = L4_2
      L4_2 = L4_2.upper
      L4_2 = L4_2(L5_2)
      L3_2 = L3_2[L4_2]
      L4_2 = A0_2.AttachmentData
      L4_2 = L4_2.attachment
      L3_2 = L3_2[L4_2]
      L4_2 = QBCore
      L4_2 = L4_2.Functions
      L4_2 = L4_2.TriggerCallback
      L5_2 = "weapons:server:RemoveAttachment"
      function L6_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3
        if false ~= A0_3 then
          L1_3 = {}
          L2_3 = "weaponcolor"
          L3_3 = tostring
          L4_3 = L3_2.component
          L3_3 = L3_3(L4_3)
          L4_3 = string
          L4_3 = L4_3.match
          L6_3 = L3_3
          L5_3 = L3_3.lower
          L5_3 = L5_3(L6_3)
          L7_3 = L2_3
          L6_3 = L2_3.lower
          L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L6_3(L7_3)
          L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
          if L4_3 then
            L4_3 = SetPedWeaponTintIndex
            L5_3 = PlayerPedId
            L5_3 = L5_3()
            L6_3 = GetHashKey
            L7_3 = A0_2.WeaponData
            L7_3 = L7_3.name
            L6_3 = L6_3(L7_3)
            L7_3 = 0
            L4_3(L5_3, L6_3, L7_3)
          else
            L4_3 = L3_2.component
            if "weapontinturlattach" == L4_3 then
              L4_3 = 1
              L5_3 = Config
              L5_3 = L5_3.WeaponTints
              L5_3 = #L5_3
              L6_3 = 1
              for L7_3 = L4_3, L5_3, L6_3 do
                L8_3 = tostring
                L9_3 = GetHashKey
                L10_3 = A0_2.WeaponData
                L10_3 = L10_3.name
                L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L9_3(L10_3)
                L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
                L9_3 = Config
                L9_3 = L9_3.WeaponTints
                L9_3 = L9_3[L7_3]
                L9_3 = L9_3.hash
                if L8_3 == L9_3 then
                  L8_3 = AddReplaceTexture
                  L9_3 = Config
                  L9_3 = L9_3.WeaponTints
                  L9_3 = L9_3[L7_3]
                  L9_3 = L9_3.ytd
                  L10_3 = Config
                  L10_3 = L10_3.WeaponTints
                  L10_3 = L10_3[L7_3]
                  L10_3 = L10_3.texture
                  L11_3 = Config
                  L11_3 = L11_3.WeaponTints
                  L11_3 = L11_3[L7_3]
                  L11_3 = L11_3.ytd
                  L12_3 = Config
                  L12_3 = L12_3.WeaponTints
                  L12_3 = L12_3[L7_3]
                  L12_3 = L12_3.texture
                  L8_3(L9_3, L10_3, L11_3, L12_3)
                  break
                end
              end
            else
              L4_3 = RemoveWeaponComponentFromPed
              L5_3 = PlayerPedId
              L5_3 = L5_3()
              L6_3 = GetHashKey
              L7_3 = A0_2.WeaponData
              L7_3 = L7_3.name
              L6_3 = L6_3(L7_3)
              L7_3 = GetHashKey
              L8_3 = L3_2.component
              L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L7_3(L8_3)
              L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
            end
          end
          L4_3 = pairs
          L5_3 = A0_3
          L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
          for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
            L10_3 = pairs
            L11_3 = Config
            L11_3 = L11_3.WeaponAttachments
            L12_3 = L2_2.name
            L13_3 = L12_3
            L12_3 = L12_3.upper
            L12_3 = L12_3(L13_3)
            L11_3 = L11_3[L12_3]
            L10_3, L11_3, L12_3, L13_3 = L10_3(L11_3)
            for L14_3, L15_3 in L10_3, L11_3, L12_3, L13_3 do
              L16_3 = L9_3.component
              L17_3 = L15_3.component
              if L16_3 == L17_3 then
                L16_3 = table
                L16_3 = L16_3.insert
                L17_3 = L1_3
                L18_3 = {}
                L19_3 = L15_3.item
                L18_3.attachment = L19_3
                L19_3 = L15_3.label
                L18_3.label = L19_3
                L16_3(L17_3, L18_3)
              end
            end
          end
          L4_3 = {}
          L4_3.Attachments = L1_3
          L5_3 = L2_2
          L4_3.WeaponData = L5_3
          L5_3 = A1_2
          L6_3 = L4_3
          L5_3(L6_3)
        else
          L1_3 = "weaponcolor"
          L2_3 = tostring
          L3_3 = L3_2.component
          L2_3 = L2_3(L3_3)
          L3_3 = string
          L3_3 = L3_3.match
          L5_3 = L2_3
          L4_3 = L2_3.lower
          L4_3 = L4_3(L5_3)
          L6_3 = L1_3
          L5_3 = L1_3.lower
          L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L5_3(L6_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
          if L3_3 then
            L3_3 = SetPedWeaponTintIndex
            L4_3 = PlayerPedId
            L4_3 = L4_3()
            L5_3 = GetHashKey
            L6_3 = A0_2.WeaponData
            L6_3 = L6_3.name
            L5_3 = L5_3(L6_3)
            L6_3 = 0
            L3_3(L4_3, L5_3, L6_3)
          else
            L3_3 = L3_2.component
            if "weapontinturlattach" == L3_3 then
              L3_3 = 1
              L4_3 = Config
              L4_3 = L4_3.WeaponTints
              L4_3 = #L4_3
              L5_3 = 1
              for L6_3 = L3_3, L4_3, L5_3 do
                L7_3 = tostring
                L8_3 = GetHashKey
                L9_3 = A0_2.WeaponData
                L9_3 = L9_3.name
                L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L8_3(L9_3)
                L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
                L8_3 = Config
                L8_3 = L8_3.WeaponTints
                L8_3 = L8_3[L6_3]
                L8_3 = L8_3.hash
                if L7_3 == L8_3 then
                  L7_3 = AddReplaceTexture
                  L8_3 = Config
                  L8_3 = L8_3.WeaponTints
                  L8_3 = L8_3[L6_3]
                  L8_3 = L8_3.ytd
                  L9_3 = Config
                  L9_3 = L9_3.WeaponTints
                  L9_3 = L9_3[L6_3]
                  L9_3 = L9_3.texture
                  L10_3 = Config
                  L10_3 = L10_3.WeaponTints
                  L10_3 = L10_3[L6_3]
                  L10_3 = L10_3.ytd
                  L11_3 = Config
                  L11_3 = L11_3.WeaponTints
                  L11_3 = L11_3[L6_3]
                  L11_3 = L11_3.texture
                  L7_3(L8_3, L9_3, L10_3, L11_3)
                  break
                end
              end
            else
              L3_3 = RemoveWeaponComponentFromPed
              L4_3 = PlayerPedId
              L4_3 = L4_3()
              L5_3 = GetHashKey
              L6_3 = A0_2.WeaponData
              L6_3 = L6_3.name
              L5_3 = L5_3(L6_3)
              L6_3 = GetHashKey
              L7_3 = L3_2.component
              L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L6_3(L7_3)
              L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
            end
          end
          L3_3 = A1_2
          L4_3 = {}
          L3_3(L4_3)
        end
      end
      L7_2 = A0_2.AttachmentData
      L8_2 = A0_2.WeaponData
      L4_2(L5_2, L6_2, L7_2, L8_2)
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:CheckWeapon"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:CheckWeapon"
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L1_1
  if L1_2 == A0_2 then
    L1_2 = TriggerEvent
    L2_2 = "weapons:ResetHolster"
    L1_2(L2_2)
    L1_2 = SetCurrentPedWeapon
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = GetHashKey
    L4_2 = "WEAPON_UNARMED"
    L3_2 = L3_2(L4_2)
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = RemoveAllPedWeapons
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = nil
    L1_1 = L1_2
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:AddDropItem"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:AddDropItem"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = GetPlayerFromServerId
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if -1 ~= L2_2 then
    L2_2 = GetEntityCoords
    L3_2 = GetPlayerPed
    L4_2 = GetPlayerFromServerId
    L5_2 = A1_2
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L4_2(L5_2)
    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L3_2 = GetEntityForwardVector
    L4_2 = GetPlayerPed
    L5_2 = GetPlayerFromServerId
    L6_2 = A1_2
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2)
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L4_2 = table
    L4_2 = L4_2.unpack
    L5_2 = L3_2 * 0.5
    L5_2 = L2_2 + L5_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    L7_2 = L4_1
    L8_2 = {}
    L8_2.id = A0_2
    L9_2 = {}
    L9_2.x = L4_2
    L9_2.y = L5_2
    L10_2 = L6_2 - 0.3
    L9_2.z = L10_2
    L8_2.coords = L9_2
    L7_2[A0_2] = L8_2
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:RemoveDropItem"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:RemoveDropItem"
function L24_1(A0_2)
  local L1_2
  L1_2 = {}
  L5_1 = L1_2
  L1_2 = L4_1
  L1_2[A0_2] = nil
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:DropItemAnim"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:DropItemAnim"
function L24_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "close"
  L0_2(L1_2)
  L0_2 = RequestAnimDict
  L1_2 = "pickup_object"
  L0_2(L1_2)
  while true do
    L0_2 = HasAnimDictLoaded
    L1_2 = "pickup_object"
    L0_2 = L0_2(L1_2)
    if L0_2 then
      break
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 7
    L0_2(L1_2)
  end
  L0_2 = TaskPlayAnim
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = "pickup_object"
  L3_2 = "pickup_low"
  L4_2 = 8.0
  L5_2 = -8.0
  L6_2 = -1
  L7_2 = 1
  L8_2 = 0
  L9_2 = false
  L10_2 = false
  L11_2 = false
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L0_2 = Citizen
  L0_2 = L0_2.Wait
  L1_2 = 2000
  L0_2(L1_2)
  L0_2 = ClearPedTasks
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "inventory:client:SetCurrentStash"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "inventory:client:SetCurrentStash"
function L24_1(A0_2)
  local L1_2
  CurrentStash = A0_2
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNetEvent
L23_1 = "qs-inventory:closeInventory"
L22_1(L23_1)
L22_1 = AddEventHandler
L23_1 = "qs-inventory:closeInventory"
function L24_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "close"
  L1_2(L2_2)
  L1_2 = Wait
  L2_2 = 500
  L1_2(L2_2)
  L1_2 = ClearPedTasks
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L1_2(L2_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "CloseInventory"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  canOpenInventory = false
  L2_2 = L3_1
  if "none-inv" == L2_2 then
    CurrentDrop = 0
    CurrentVehicle = nil
    CurrentGlovebox = nil
    CurrentStash = nil
    L2_2 = SetNuiFocus
    L3_2 = false
    L4_2 = false
    L2_2(L3_2, L4_2)
    inInventory = false
    StealingPed = nil
    L2_2 = ClearPedTasks
    L3_2 = PlayerPedId
    L3_2, L4_2, L5_2 = L3_2()
    L2_2(L3_2, L4_2, L5_2)
    return
  end
  L2_2 = CurrentVehicle
  if nil ~= L2_2 then
    L2_2 = CloseTrunk
    L2_2()
    L2_2 = TriggerServerEvent
    L3_2 = "inventory:server:SaveInventory"
    L4_2 = "trunk"
    L5_2 = CurrentVehicle
    L2_2(L3_2, L4_2, L5_2)
    CurrentVehicle = nil
  else
    L2_2 = CurrentGlovebox
    if nil ~= L2_2 then
      L2_2 = TriggerServerEvent
      L3_2 = "inventory:server:SaveInventory"
      L4_2 = "glovebox"
      L5_2 = CurrentGlovebox
      L2_2(L3_2, L4_2, L5_2)
      CurrentGlovebox = nil
    else
      L2_2 = CurrentStash
      if nil ~= L2_2 then
        L2_2 = TriggerServerEvent
        L3_2 = "inventory:server:SaveInventory"
        L4_2 = "stash"
        L5_2 = CurrentStash
        L2_2(L3_2, L4_2, L5_2)
        CurrentStash = nil
      else
        L2_2 = CloseGarbage
        L2_2()
        L2_2 = TriggerServerEvent
        L3_2 = "inventory:server:SaveInventory"
        L4_2 = "drop"
        L5_2 = CurrentDrop
        L2_2(L3_2, L4_2, L5_2)
        CurrentDrop = 0
      end
    end
  end
  StealingPed = nil
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = TriggerServerEvent
  L3_2 = "inventory:ClosedInv"
  L2_2(L3_2)
  inInventory = false
  L2_2 = TriggerScreenblurFadeOut
  L3_2 = 1000
  L2_2(L3_2)
  L2_2 = Config
  L2_2 = L2_2.ToggleHud
  if L2_2 then
    L2_2 = ToggleHudTrue
    L3_2 = toggle
    L2_2(L3_2)
  end
  L2_2 = Config
  L2_2 = L2_2.HideMinimap
  if L2_2 then
    L2_2 = DisplayRadar
    L3_2 = true
    L2_2(L3_2)
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "UseItem"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = TriggerServerEvent
  L3_2 = "inventory:server:UseItem"
  L4_2 = A0_2.inventory
  L5_2 = A0_2.item
  L2_2(L3_2, L4_2, L5_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "SetInventoryData"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = TriggerServerEvent
  L3_2 = "inventory:server:SetInventoryData"
  L4_2 = A0_2.fromInventory
  L5_2 = A0_2.toInventory
  L6_2 = A0_2.fromSlot
  L7_2 = A0_2.toSlot
  L8_2 = A0_2.fromAmount
  L9_2 = A0_2.toAmount
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "PlayDropSound"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = PlaySound
  L3_2 = -1
  L4_2 = "CLICK_BACK"
  L5_2 = "WEB_NAVIGATION_SOUNDS_PHONE"
  L6_2 = 0
  L7_2 = 0
  L8_2 = 1
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "PlayDropFail"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = PlaySound
  L3_2 = -1
  L4_2 = "Place_Prop_Fail"
  L5_2 = "DLC_Dmod_Prop_Editor_Sounds"
  L6_2 = 0
  L7_2 = 0
  L8_2 = 1
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
end
L22_1(L23_1, L24_1)
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = Config
  L0_2 = L0_2.Framework
  if "ESX" == L0_2 then
    L0_2 = ESX
    L0_2 = L0_2.Game
    L0_2 = L0_2.GetClosestVehicle
    L0_2 = L0_2()
    while true do
      L1_2 = HasAnimDictLoaded
      L2_2 = "amb@prop_human_bum_bin@idle_b"
      L1_2 = L1_2(L2_2)
      if L1_2 then
        break
      end
      L1_2 = RequestAnimDict
      L2_2 = "amb@prop_human_bum_bin@idle_b"
      L1_2(L2_2)
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 100
      L1_2(L2_2)
    end
    L1_2 = TaskPlayAnim
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = "amb@prop_human_bum_bin@idle_b"
    L4_2 = "idle_d"
    L5_2 = 4.0
    L6_2 = 4.0
    L7_2 = -1
    L8_2 = 50
    L9_2 = 0
    L10_2 = false
    L11_2 = false
    L12_2 = false
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L1_2 = IsBackEngine
    L2_2 = GetEntityModel
    L3_2 = L0_2
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L2_2(L3_2)
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    if L1_2 then
      L1_2 = SetVehicleDoorOpen
      L2_2 = L0_2
      L3_2 = 4
      L4_2 = false
      L5_2 = false
      L1_2(L2_2, L3_2, L4_2, L5_2)
    else
      L1_2 = SetVehicleDoorOpen
      L2_2 = L0_2
      L3_2 = 5
      L4_2 = false
      L5_2 = false
      L1_2(L2_2, L3_2, L4_2, L5_2)
    end
  else
    L0_2 = Config
    L0_2 = L0_2.Framework
    if "QBCore" == L0_2 then
      L0_2 = QBCore
      L0_2 = L0_2.Functions
      L0_2 = L0_2.GetClosestVehicle
      L0_2 = L0_2()
      while true do
        L1_2 = HasAnimDictLoaded
        L2_2 = "amb@prop_human_bum_bin@idle_b"
        L1_2 = L1_2(L2_2)
        if L1_2 then
          break
        end
        L1_2 = RequestAnimDict
        L2_2 = "amb@prop_human_bum_bin@idle_b"
        L1_2(L2_2)
        L1_2 = Citizen
        L1_2 = L1_2.Wait
        L2_2 = 100
        L1_2(L2_2)
      end
      L1_2 = TaskPlayAnim
      L2_2 = PlayerPedId
      L2_2 = L2_2()
      L3_2 = "amb@prop_human_bum_bin@idle_b"
      L4_2 = "idle_d"
      L5_2 = 4.0
      L6_2 = 4.0
      L7_2 = -1
      L8_2 = 50
      L9_2 = 0
      L10_2 = false
      L11_2 = false
      L12_2 = false
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L1_2 = IsBackEngine
      L2_2 = GetEntityModel
      L3_2 = L0_2
      L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L2_2(L3_2)
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      if L1_2 then
        L1_2 = SetVehicleDoorOpen
        L2_2 = L0_2
        L3_2 = 4
        L4_2 = false
        L5_2 = false
        L1_2(L2_2, L3_2, L4_2, L5_2)
      else
        L1_2 = SetVehicleDoorOpen
        L2_2 = L0_2
        L3_2 = 5
        L4_2 = false
        L5_2 = false
        L1_2(L2_2, L3_2, L4_2, L5_2)
      end
    end
  end
end
OpenTrunk = L22_1
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  while true do
    L0_2 = HasAnimDictLoaded
    L1_2 = "amb@prop_human_bum_bin@idle_b"
    L0_2 = L0_2(L1_2)
    if L0_2 then
      break
    end
    L0_2 = RequestAnimDict
    L1_2 = "amb@prop_human_bum_bin@idle_b"
    L0_2(L1_2)
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 100
    L0_2(L1_2)
  end
  L0_2 = TaskPlayAnim
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = "amb@prop_human_bum_bin@idle_b"
  L3_2 = "idle_d"
  L4_2 = 4.0
  L5_2 = 4.0
  L6_2 = -1
  L7_2 = 50
  L8_2 = 0
  L9_2 = false
  L10_2 = false
  L11_2 = false
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
OpenGarbage = L22_1
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  while true do
    L0_2 = HasAnimDictLoaded
    L1_2 = "amb@prop_human_bum_bin@idle_b"
    L0_2 = L0_2(L1_2)
    if L0_2 then
      break
    end
    L0_2 = RequestAnimDict
    L1_2 = "amb@prop_human_bum_bin@idle_b"
    L0_2(L1_2)
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 100
    L0_2(L1_2)
  end
  L0_2 = TaskPlayAnim
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = "amb@prop_human_bum_bin@idle_b"
  L3_2 = "exit"
  L4_2 = 4.0
  L5_2 = 4.0
  L6_2 = -1
  L7_2 = 50
  L8_2 = 0
  L9_2 = false
  L10_2 = false
  L11_2 = false
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
CloseGarbage = L22_1
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = Config
  L0_2 = L0_2.Framework
  if "ESX" == L0_2 then
    L0_2 = ESX
    L0_2 = L0_2.Game
    L0_2 = L0_2.GetClosestVehicle
    L0_2 = L0_2()
    while true do
      L1_2 = HasAnimDictLoaded
      L2_2 = "amb@prop_human_bum_bin@idle_b"
      L1_2 = L1_2(L2_2)
      if L1_2 then
        break
      end
      L1_2 = RequestAnimDict
      L2_2 = "amb@prop_human_bum_bin@idle_b"
      L1_2(L2_2)
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 100
      L1_2(L2_2)
    end
    L1_2 = TaskPlayAnim
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = "amb@prop_human_bum_bin@idle_b"
    L4_2 = "exit"
    L5_2 = 4.0
    L6_2 = 4.0
    L7_2 = -1
    L8_2 = 50
    L9_2 = 0
    L10_2 = false
    L11_2 = false
    L12_2 = false
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L1_2 = IsBackEngine
    L2_2 = GetEntityModel
    L3_2 = L0_2
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L2_2(L3_2)
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    if L1_2 then
      L1_2 = SetVehicleDoorShut
      L2_2 = L0_2
      L3_2 = 4
      L4_2 = false
      L1_2(L2_2, L3_2, L4_2)
    else
      L1_2 = SetVehicleDoorShut
      L2_2 = L0_2
      L3_2 = 5
      L4_2 = false
      L1_2(L2_2, L3_2, L4_2)
    end
  else
    L0_2 = Config
    L0_2 = L0_2.Framework
    if "QBCore" == L0_2 then
      L0_2 = QBCore
      L0_2 = L0_2.Functions
      L0_2 = L0_2.GetClosestVehicle
      L0_2 = L0_2()
      while true do
        L1_2 = HasAnimDictLoaded
        L2_2 = "amb@prop_human_bum_bin@idle_b"
        L1_2 = L1_2(L2_2)
        if L1_2 then
          break
        end
        L1_2 = RequestAnimDict
        L2_2 = "amb@prop_human_bum_bin@idle_b"
        L1_2(L2_2)
        L1_2 = Citizen
        L1_2 = L1_2.Wait
        L2_2 = 100
        L1_2(L2_2)
      end
      L1_2 = TaskPlayAnim
      L2_2 = PlayerPedId
      L2_2 = L2_2()
      L3_2 = "amb@prop_human_bum_bin@idle_b"
      L4_2 = "exit"
      L5_2 = 4.0
      L6_2 = 4.0
      L7_2 = -1
      L8_2 = 50
      L9_2 = 0
      L10_2 = false
      L11_2 = false
      L12_2 = false
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L1_2 = IsBackEngine
      L2_2 = GetEntityModel
      L3_2 = L0_2
      L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L2_2(L3_2)
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      if L1_2 then
        L1_2 = SetVehicleDoorShut
        L2_2 = L0_2
        L3_2 = 4
        L4_2 = false
        L1_2(L2_2, L3_2, L4_2)
      else
        L1_2 = SetVehicleDoorShut
        L2_2 = L0_2
        L3_2 = 5
        L4_2 = false
        L1_2(L2_2, L3_2, L4_2)
      end
    end
  end
end
CloseTrunk = L22_1
function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.BackEngineVehicles
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = GetHashKey
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 == A0_2 then
      L7_2 = true
      return L7_2
    end
  end
  L1_2 = false
  return L1_2
end
IsBackEngine = L22_1
function L22_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.Framework
  if "ESX" == L1_2 then
    L1_2 = QS
    L1_2 = L1_2.GetPlayerData
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = QS
      L1_2 = L1_2.GetPlayerData
      L1_2 = L1_2()
      L1_2 = L1_2.items
      if L1_2 then
        L1_2 = {}
        L2_2 = QS
        L2_2 = L2_2.GetPlayerData
        L2_2 = L2_2()
        L2_2 = L2_2.items
        L2_2 = L2_2[1]
        L1_2[1] = L2_2
        L2_2 = QS
        L2_2 = L2_2.GetPlayerData
        L2_2 = L2_2()
        L2_2 = L2_2.items
        L2_2 = L2_2[2]
        L1_2[2] = L2_2
        L2_2 = QS
        L2_2 = L2_2.GetPlayerData
        L2_2 = L2_2()
        L2_2 = L2_2.items
        L2_2 = L2_2[3]
        L1_2[3] = L2_2
        L2_2 = QS
        L2_2 = L2_2.GetPlayerData
        L2_2 = L2_2()
        L2_2 = L2_2.items
        L2_2 = L2_2[4]
        L1_2[4] = L2_2
        L2_2 = QS
        L2_2 = L2_2.GetPlayerData
        L2_2 = L2_2()
        L2_2 = L2_2.items
        L2_2 = L2_2[5]
        L1_2[5] = L2_2
        if A0_2 then
          L2_2 = SendNUIMessage
          L3_2 = {}
          L3_2.action = "toggleHotbar"
          L3_2.open = true
          L3_2.items = L1_2
          L2_2(L3_2)
        else
          L2_2 = SendNUIMessage
          L3_2 = {}
          L3_2.action = "toggleHotbar"
          L3_2.open = false
          L2_2(L3_2)
        end
      end
    end
  else
    L1_2 = Config
    L1_2 = L1_2.Framework
    if "QBCore" == L1_2 then
      L1_2 = QBCore
      L1_2 = L1_2.Functions
      L1_2 = L1_2.GetPlayerData
      L1_2 = L1_2()
      if L1_2 then
        L1_2 = QBCore
        L1_2 = L1_2.Functions
        L1_2 = L1_2.GetPlayerData
        L1_2 = L1_2()
        L1_2 = L1_2.items
        if L1_2 then
          L1_2 = {}
          L2_2 = QBCore
          L2_2 = L2_2.Functions
          L2_2 = L2_2.GetPlayerData
          L2_2 = L2_2()
          L2_2 = L2_2.items
          L2_2 = L2_2[1]
          L1_2[1] = L2_2
          L2_2 = QBCore
          L2_2 = L2_2.Functions
          L2_2 = L2_2.GetPlayerData
          L2_2 = L2_2()
          L2_2 = L2_2.items
          L2_2 = L2_2[2]
          L1_2[2] = L2_2
          L2_2 = QBCore
          L2_2 = L2_2.Functions
          L2_2 = L2_2.GetPlayerData
          L2_2 = L2_2()
          L2_2 = L2_2.items
          L2_2 = L2_2[3]
          L1_2[3] = L2_2
          L2_2 = QBCore
          L2_2 = L2_2.Functions
          L2_2 = L2_2.GetPlayerData
          L2_2 = L2_2()
          L2_2 = L2_2.items
          L2_2 = L2_2[4]
          L1_2[4] = L2_2
          L2_2 = QBCore
          L2_2 = L2_2.Functions
          L2_2 = L2_2.GetPlayerData
          L2_2 = L2_2()
          L2_2 = L2_2.items
          L2_2 = L2_2[5]
          L1_2[5] = L2_2
          if A0_2 then
            L2_2 = SendNUIMessage
            L3_2 = {}
            L3_2.action = "toggleHotbar"
            L3_2.open = true
            L3_2.items = L1_2
            L2_2(L3_2)
          else
            L2_2 = SendNUIMessage
            L3_2 = {}
            L3_2.action = "toggleHotbar"
            L3_2.open = false
            L2_2(L3_2)
          end
        end
      end
    end
  end
end
ToggleHotbar = L22_1
function L22_1(A0_2)
  local L1_2, L2_2
  while true do
    L1_2 = HasAnimDictLoaded
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = RequestAnimDict
    L2_2 = A0_2
    L1_2(L2_2)
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 5
    L1_2(L2_2)
  end
end
LoadAnimDict = L22_1
L22_1 = RegisterNUICallback
L23_1 = "GetNearPlayers"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = false
  L4_2 = {}
  L5_2 = Config
  L5_2 = L5_2.Framework
  if "ESX" == L5_2 then
    L5_2 = ESX
    L5_2 = L5_2.Game
    L5_2 = L5_2.GetPlayersInArea
    L6_2 = GetEntityCoords
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    L7_2 = 3.0
    L5_2, L6_2 = L5_2(L6_2, L7_2)
    L7_2 = 1
    L8_2 = #L5_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L5_2[L10_2]
      L12_2 = PlayerId
      L12_2 = L12_2()
      if L11_2 ~= L12_2 then
        L3_2 = true
        L11_2 = Config
        L11_2 = L11_2.ShowNameNearPlayer
        if L11_2 then
          L11_2 = table
          L11_2 = L11_2.insert
          L12_2 = L4_2
          L13_2 = {}
          L14_2 = GetPlayerName
          L15_2 = L5_2[L10_2]
          L14_2 = L14_2(L15_2)
          L13_2.label = L14_2
          L14_2 = GetPlayerServerId
          L15_2 = L5_2[L10_2]
          L14_2 = L14_2(L15_2)
          L13_2.player = L14_2
          L11_2(L12_2, L13_2)
        else
          L11_2 = table
          L11_2 = L11_2.insert
          L12_2 = L4_2
          L13_2 = {}
          L13_2.label = ""
          L14_2 = GetPlayerServerId
          L15_2 = L5_2[L10_2]
          L14_2 = L14_2(L15_2)
          L13_2.player = L14_2
          L11_2(L12_2, L13_2)
        end
      end
    end
  else
    L5_2 = Config
    L5_2 = L5_2.Framework
    if "QBCore" == L5_2 then
      L5_2 = QBCore
      L5_2 = L5_2.Functions
      L5_2 = L5_2.GetPlayersFromCoords
      L6_2 = GetEntityCoords
      L7_2 = L2_2
      L6_2 = L6_2(L7_2)
      L7_2 = 3.0
      L5_2, L6_2 = L5_2(L6_2, L7_2)
      L7_2 = 1
      L8_2 = #L5_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = L5_2[L10_2]
        L12_2 = PlayerId
        L12_2 = L12_2()
        if L11_2 ~= L12_2 then
          L3_2 = true
          L11_2 = Config
          L11_2 = L11_2.ShowNameNearPlayer
          if L11_2 then
            L11_2 = table
            L11_2 = L11_2.insert
            L12_2 = L4_2
            L13_2 = {}
            L14_2 = GetPlayerName
            L15_2 = L5_2[L10_2]
            L14_2 = L14_2(L15_2)
            L13_2.label = L14_2
            L14_2 = GetPlayerServerId
            L15_2 = L5_2[L10_2]
            L14_2 = L14_2(L15_2)
            L13_2.player = L14_2
            L11_2(L12_2, L13_2)
          else
            L11_2 = table
            L11_2 = L11_2.insert
            L12_2 = L4_2
            L13_2 = {}
            L13_2.label = ""
            L14_2 = GetPlayerServerId
            L15_2 = L5_2[L10_2]
            L14_2 = L14_2(L15_2)
            L13_2.player = L14_2
            L11_2(L12_2, L13_2)
          end
        end
      end
    end
  end
  if not L3_2 then
    L5_2 = SendTextMessage
    L6_2 = Lang
    L7_2 = "NO_PLAYERS"
    L6_2 = L6_2(L7_2)
    L7_2 = "error"
    L5_2(L6_2, L7_2)
  else
    L5_2 = SendNUIMessage
    L6_2 = {}
    L6_2.action = "NearPlayers"
    L6_2.foundAny = L3_2
    L6_2.players = L4_2
    L7_2 = A0_2.item
    L6_2.item = L7_2
    L7_2 = A0_2.inventory
    L6_2.inventory = L7_2
    L5_2(L6_2)
  end
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "FakeGiveButton"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendTextMessage
  L3_2 = Lang
  L4_2 = "YOU_CANT_GIVE"
  L3_2 = L3_2(L4_2)
  L4_2 = "error"
  L2_2(L3_2, L4_2)
end
L22_1(L23_1, L24_1)
L22_1 = math
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2 or nil
  if not A1_2 then
    L2_2 = 0
  end
  L3_2 = 10
  L2_2 = L3_2 ^ L2_2
  L3_2 = math
  L3_2 = L3_2.floor
  L4_2 = A0_2 * L2_2
  L4_2 = L4_2 + 0.5
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 / L2_2
  return L3_2
end
L22_1.round = L23_1
L22_1 = RegisterNUICallback
L23_1 = "EnableBlur"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = TriggerScreenblurFadeIn
  L3_2 = 1000
  L2_2(L3_2)
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "DisableBlur"
function L24_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = TriggerScreenblurFadeOut
  L3_2 = 1000
  L2_2(L3_2)
end
L22_1(L23_1, L24_1)
function L22_1(A0_2)
  local L1_2, L2_2
  L1_2 = HasAnimDictLoaded
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = RequestAnimDict
    L2_2 = A0_2
    L1_2(L2_2)
    while true do
      L1_2 = HasAnimDictLoaded
      L2_2 = A0_2
      L1_2 = L1_2(L2_2)
      if L1_2 then
        break
      end
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 1
      L1_2(L2_2)
    end
  end
end
loadanimdict = L22_1
function L22_1(A0_2)
  local L1_2, L2_2
  L1_2 = HasAnimDictLoaded
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = RequestAnimDict
    L2_2 = A0_2
    L1_2(L2_2)
    while true do
      L1_2 = HasAnimDictLoaded
      L2_2 = A0_2
      L1_2 = L1_2(L2_2)
      if L1_2 then
        break
      end
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 1
      L1_2(L2_2)
    end
  end
end
loadanimdictx = L22_1
function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = table
  L1_2 = L1_2.unpack
  L2_2 = A0_2
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  L4_2 = math
  L4_2 = L4_2.floor
  L5_2 = math
  L5_2 = L5_2.round
  L6_2 = L1_2
  L7_2 = 0
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L1_2 = L4_2
  L4_2 = math
  L4_2 = L4_2.floor
  L5_2 = math
  L5_2 = L5_2.round
  L6_2 = L2_2
  L7_2 = 0
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L2_2 = L4_2
  L4_2 = "x"
  L5_2 = L1_2
  L6_2 = "y"
  L7_2 = L2_2
  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
  return L4_2
end
getOwnerFromCoordsForGarbage = L22_1
L22_1 = math
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2 or nil
  if not A1_2 then
    L2_2 = 0
  end
  L3_2 = 10
  L2_2 = L3_2 ^ L2_2
  L3_2 = math
  L3_2 = L3_2.floor
  L4_2 = A0_2 * L2_2
  L4_2 = L4_2 + 0.5
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 / L2_2
  return L3_2
end
L22_1.round = L23_1
L22_1 = _ENV
L23_1 = "pedClothing"
function L24_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = GetEntityHeading
    L1_3 = PlayerPedId
    L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3 = L1_3()
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
    heading = L0_3
    L0_3 = SetFrontendActive
    L1_3 = true
    L0_3(L1_3)
    L0_3 = ActivateFrontendMenu
    L1_3 = "FE_MENU_VERSION_PRE_LOBBY"
    L2_3 = true
    L3_3 = -1
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Citizen
    L0_3 = L0_3.Wait
    L1_3 = 100
    L0_3(L1_3)
    L0_3 = N_0x98215325a695e78a
    L1_3 = false
    L0_3(L1_3)
    L0_3 = ClonePed
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L2_3 = heading
    L3_3 = true
    L4_3 = false
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
    PlayerPedPreview = L0_3
    L0_3 = DisablePedPainAudio
    L1_3 = PlayerPedPreview
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = StopPedSpeaking
    L1_3 = PlayerPedPreview
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = table
    L0_3 = L0_3.unpack
    L1_3 = GetEntityCoords
    L2_3 = PlayerPedPreview
    L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3 = L1_3(L2_3)
    L0_3, L1_3, L2_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
    L3_3 = SetEntityCoords
    L4_3 = PlayerPedPreview
    L5_3 = L0_3
    L6_3 = L1_3
    L7_3 = L2_3 - 200
    L3_3(L4_3, L5_3, L6_3, L7_3)
    L3_3 = FreezeEntityPosition
    L4_3 = PlayerPedPreview
    L5_3 = true
    L3_3(L4_3, L5_3)
    L3_3 = SetEntityVisible
    L4_3 = PlayerPedPreview
    L5_3 = false
    L6_3 = false
    L3_3(L4_3, L5_3, L6_3)
    L3_3 = NetworkSetEntityInvisibleToNetwork
    L4_3 = PlayerPedPreview
    L5_3 = false
    L3_3(L4_3, L5_3)
    L3_3 = Wait
    L4_3 = 200
    L3_3(L4_3)
    L3_3 = SetPedAsNoLongerNeeded
    L4_3 = PlayerPedPreview
    L3_3(L4_3)
    L3_3 = GivePedToPauseMenu
    L4_3 = PlayerPedPreview
    L5_3 = 2
    L3_3(L4_3, L5_3)
    L3_3 = SetPauseMenuPedLighting
    L4_3 = true
    L3_3(L4_3)
    L3_3 = SetPauseMenuPedSleepState
    L4_3 = true
    L3_3(L4_3)
  end
  L0_2(L1_2)
end
L22_1[L23_1] = L24_1
L22_1 = _ENV
L23_1 = "DeletePedScreen"
function L24_1()
  local L0_2, L1_2
  L0_2 = DeleteEntity
  L1_2 = PlayerPedPreview
  L0_2(L1_2)
  L0_2 = SetFrontendActive
  L1_2 = false
  L0_2(L1_2)
end
L22_1[L23_1] = L24_1
L22_1 = _ENV
L23_1 = "RefreshPedScreen"
function L24_1()
  local L0_2, L1_2
  L0_2 = DoesEntityExist
  L1_2 = PlayerPedPreview
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = DeletePedScreen
    L0_2()
    L0_2 = Wait
    L1_2 = 500
    L0_2(L1_2)
    L0_2 = inInventory
    if not L0_2 then
      L0_2 = L9_1
      if not L0_2 then
        goto lbl_20
      end
    end
    L0_2 = pedClothing
    L1_2 = false
    L0_2(L1_2)
  end
  ::lbl_20::
end
L22_1[L23_1] = L24_1
L22_1 = RegisterNUICallback
L23_1 = "Clothing"
function L24_1(A0_2)
  local L1_2, L2_2
  L1_2 = ExecuteCommand
  L2_2 = A0_2.component
  L1_2(L2_2)
  L1_2 = Wait
  L2_2 = 1000
  L1_2(L2_2)
  L1_2 = RefreshPedScreen
  L1_2()
end
L22_1(L23_1, L24_1)
L22_1 = RegisterNUICallback
L23_1 = "ShowClothing"
function L24_1(A0_2)
  local L1_2, L2_2
  L1_2 = Config
  L1_2 = L1_2.RenderPlayerClothesMenu
  if L1_2 then
    L1_2 = A0_2.delete
    if L1_2 then
      L1_2 = SendNUIMessage
      L2_2 = {}
      L2_2.action = "cloth"
      L1_2(L2_2)
      L1_2 = pedClothing
      L2_2 = true
      L1_2(L2_2)
      L1_2 = true
      L9_1 = L1_2
    else
      L1_2 = DeletePedScreen
      L1_2()
      L1_2 = false
      L9_1 = L1_2
    end
  end
end
L22_1(L23_1, L24_1)
L22_1 = _ENV
L23_1 = "PlayerDataQS"
L24_1 = {}
L22_1[L23_1] = L24_1
L22_1 = _ENV
L23_1 = "Citizen"
L22_1 = L22_1[L23_1]
L23_1 = "CreateThread"
L22_1 = L22_1[L23_1]
function L23_1()
  local L0_2, L1_2, L2_2
  L0_2 = Wait
  L1_2 = 1000
  L0_2(L1_2)
  L0_2 = Config
  L0_2 = L0_2.Framework
  if "ESX" == L0_2 then
    L0_2 = QS
    L0_2 = L0_2.GetPlayerData
    L0_2 = L0_2()
    if nil ~= L0_2 then
      L0_2 = TriggerServerEvent
      L1_2 = "weapons:server:LoadWeaponAmmo"
      L0_2(L1_2)
      L0_2 = true
      L11_1 = L0_2
      L0_2 = QS
      L0_2 = L0_2.GetPlayerData
      L0_2 = L0_2()
      PlayerDataQS = L0_2
      L0_2 = ESX
      L0_2 = L0_2.TriggerServerCallback
      L1_2 = "weapons:server:GetConfig"
      function L2_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
        L1_3 = pairs
        L2_3 = A0_3
        L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
        for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
          L7_3 = Config
          L7_3 = L7_3.WeaponRepairPoints
          L7_3 = L7_3[L5_3]
          L8_3 = L6_3.IsRepairing
          L7_3.IsRepairing = L8_3
          L7_3 = Config
          L7_3 = L7_3.WeaponRepairPoints
          L7_3 = L7_3[L5_3]
          L8_3 = L6_3.RepairingData
          L7_3.RepairingData = L8_3
        end
      end
      L0_2(L1_2, L2_2)
    end
  else
    L0_2 = Config
    L0_2 = L0_2.Framework
    if "QBCore" == L0_2 then
      L0_2 = QBCore
      L0_2 = L0_2.Functions
      L0_2 = L0_2.GetPlayerData
      L0_2 = L0_2()
      if nil ~= L0_2 then
        L0_2 = TriggerServerEvent
        L1_2 = "weapons:server:LoadWeaponAmmo"
        L0_2(L1_2)
        L0_2 = true
        L11_1 = L0_2
        L0_2 = QBCore
        L0_2 = L0_2.Functions
        L0_2 = L0_2.GetPlayerData
        L0_2 = L0_2()
        PlayerDataQS = L0_2
        L0_2 = QBCore
        L0_2 = L0_2.Functions
        L0_2 = L0_2.TriggerCallback
        L1_2 = "weapons:server:GetConfig"
        function L2_2(A0_3)
          local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
          L1_3 = pairs
          L2_3 = A0_3
          L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
          for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
            L7_3 = Config
            L7_3 = L7_3.WeaponRepairPoints
            L7_3 = L7_3[L5_3]
            L8_3 = L6_3.IsRepairing
            L7_3.IsRepairing = L8_3
            L7_3 = Config
            L7_3 = L7_3.WeaponRepairPoints
            L7_3 = L7_3[L5_3]
            L8_3 = L6_3.RepairingData
            L7_3.RepairingData = L8_3
          end
        end
        L0_2(L1_2, L2_2)
      end
    end
  end
end
L22_1(L23_1)
L22_1 = 0
L23_1 = false
L24_1 = _ENV
L25_1 = "Citizen"
L24_1 = L24_1[L25_1]
L25_1 = "CreateThread"
L24_1 = L24_1[L25_1]
function L25_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  while true do
    L0_2 = L11_1
    if L0_2 then
      L0_2 = L15_1
      if nil ~= L0_2 then
        L0_2 = next
        L1_2 = L15_1
        L0_2 = L0_2(L1_2)
        if nil ~= L0_2 then
          L0_2 = GetSelectedPedWeapon
          L1_2 = PlayerPedId
          L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2()
          L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
          L1_2 = L12_1
          if L1_2 then
            L1_2 = false
            L23_1 = L1_2
            L1_2 = GetHashKey
            L2_2 = "weapon_unarmed"
            L1_2 = L1_2(L2_2)
            if L0_2 ~= L1_2 then
              L1_2 = IsPedShooting
              L2_2 = PlayerPedId
              L2_2, L3_2, L4_2, L5_2 = L2_2()
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if L1_2 then
                L1_2 = GetAmmoInPedWeapon
                L2_2 = PlayerPedId
                L2_2 = L2_2()
                L3_2 = L0_2
                L1_2 = L1_2(L2_2, L3_2)
                L2_2 = Config
                L2_2 = L2_2.Framework
                if "ESX" == L2_2 then
                  if L0_2 then
                    L2_2 = QS
                    L2_2 = L2_2.Shared
                    L2_2 = L2_2.Weapons
                    L2_2 = L2_2[L0_2]
                    if L2_2 then
                      L2_2 = QS
                      L2_2 = L2_2.Shared
                      L2_2 = L2_2.Weapons
                      L2_2 = L2_2[L0_2]
                      L2_2 = L2_2.name
                      if "weapon_snowball" == L2_2 then
                        L2_2 = TriggerServerEvent
                        L3_2 = "qs-core:removeItem"
                        L4_2 = "snowball"
                        L5_2 = 1
                        L2_2(L3_2, L4_2, L5_2)
                      else
                        L2_2 = QS
                        L2_2 = L2_2.Shared
                        L2_2 = L2_2.Weapons
                        L2_2 = L2_2[L0_2]
                        L2_2 = L2_2.name
                        if "weapon_shoe" == L2_2 then
                          L2_2 = TriggerServerEvent
                          L3_2 = "QBCore:Server:RemoveItem"
                          L4_2 = "weapon_shoe"
                          L5_2 = 1
                          L2_2(L3_2, L4_2, L5_2)
                        elseif L1_2 > 0 then
                          L2_2 = L22_1
                          L2_2 = L2_2 + 1
                          L22_1 = L2_2
                        end
                      end
                    end
                  end
                else
                  L2_2 = Config
                  L2_2 = L2_2.Framework
                  if "QBCore" == L2_2 and L0_2 then
                    L2_2 = QBCore
                    L2_2 = L2_2.Shared
                    L2_2 = L2_2.Weapons
                    L2_2 = L2_2[L0_2]
                    if L2_2 then
                      L2_2 = QBCore
                      L2_2 = L2_2.Shared
                      L2_2 = L2_2.Weapons
                      L2_2 = L2_2[L0_2]
                      L2_2 = L2_2.name
                      if "weapon_snowball" == L2_2 then
                        L2_2 = TriggerServerEvent
                        L3_2 = "qs-core:removeItem"
                        L4_2 = "snowball"
                        L5_2 = 1
                        L2_2(L3_2, L4_2, L5_2)
                      else
                        L2_2 = QBCore
                        L2_2 = L2_2.Shared
                        L2_2 = L2_2.Weapons
                        L2_2 = L2_2[L0_2]
                        L2_2 = L2_2.name
                        if "weapon_shoe" == L2_2 then
                          L2_2 = TriggerServerEvent
                          L3_2 = "QBCore:Server:RemoveItem"
                          L4_2 = "weapon_shoe"
                          L5_2 = 1
                          L2_2(L3_2, L4_2, L5_2)
                        elseif L1_2 > 0 then
                          L2_2 = L22_1
                          L2_2 = L2_2 + 1
                          L22_1 = L2_2
                        end
                      end
                    end
                  end
                end
              end
            end
          else
            L1_2 = GetHashKey
            L2_2 = "weapon_unarmed"
            L1_2 = L1_2(L2_2)
            if L0_2 ~= L1_2 then
              L1_2 = DisablePlayerFiring
              L2_2 = PlayerId
              L2_2 = L2_2()
              L3_2 = true
              L1_2(L2_2, L3_2)
              L1_2 = L23_1
              if not L1_2 then
                L1_2 = true
                L23_1 = L1_2
                L1_2 = SendTextMessage
                L2_2 = Lang
                L3_2 = "WEAPON_BROKEN"
                L2_2 = L2_2(L3_2)
                L3_2 = "inform"
                L1_2(L2_2, L3_2)
              end
            end
            L1_2 = 0
            L22_1 = L1_2
          end
        end
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 0
    L0_2(L1_2)
  end
end
L24_1(L25_1)
L24_1 = GetBombs
L24_1 = L24_1()
L25_1 = _ENV
L26_1 = "Citizen"
L25_1 = L25_1[L26_1]
L26_1 = "CreateThread"
L25_1 = L25_1[L26_1]
function L26_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  while true do
    L0_2 = 250
    L7_1 = L0_2
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetSelectedPedWeapon
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 and -1569615261 ~= L1_2 then
      L2_2 = 5
      L7_1 = L2_2
      L2_2 = GetAmmoInPedWeapon
      L3_2 = L0_2
      L4_2 = L1_2
      L2_2 = L2_2(L3_2, L4_2)
      L3_2 = L24_1
      L3_2 = L3_2[L1_2]
      if L3_2 and 0 == L2_2 then
        L3_2 = TriggerServerEvent
        L4_2 = "qs-core:removeItem"
        L5_2 = L24_1
        L5_2 = L5_2[L1_2]
        L6_2 = 1
        L3_2(L4_2, L5_2, L6_2)
        L3_2 = RemoveAllPedWeapons
        L4_2 = L0_2
        L5_2 = true
        L3_2(L4_2, L5_2)
        L3_2 = Wait
        L4_2 = 100
        L3_2(L4_2)
      else
        L3_2 = L15_1
        if L3_2 then
          L3_2 = L15_1.name
          if "weapon_petrolcan" ~= L3_2 then
            L3_2 = L15_1.name
          end
          if "weapon_fireextinguisher" == L3_2 and 0 == L2_2 then
            L3_2 = TriggerServerEvent
            L4_2 = "qs-core:removeItem"
            L5_2 = L15_1.name
            L6_2 = 1
            L3_2(L4_2, L5_2, L6_2)
            L3_2 = RemoveAllPedWeapons
            L4_2 = L0_2
            L5_2 = true
            L3_2(L4_2, L5_2)
            L3_2 = Wait
            L4_2 = 100
            L3_2(L4_2)
          end
        end
      end
    end
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = L7_1
    L2_2(L3_2)
  end
end
L25_1(L26_1)
L25_1 = _ENV
L26_1 = "CreateThread"
L25_1 = L25_1[L26_1]
function L26_1()
  local L0_2, L1_2
  L0_2 = SetWeaponsNoAutoswap
  L1_2 = true
  L0_2(L1_2)
end
L25_1(L26_1)
L25_1 = _ENV
L26_1 = "Citizen"
L25_1 = L25_1[L26_1]
L26_1 = "CreateThread"
L25_1 = L25_1[L26_1]
function L26_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L0_2 = 250
    L7_1 = L0_2
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetSelectedPedWeapon
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 and -1569615261 ~= L1_2 then
      L2_2 = 1
      L7_1 = L2_2
      L2_2 = IsPedShooting
      L3_2 = L0_2
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L2_2 = GetAmmoInPedWeapon
        L3_2 = L0_2
        L4_2 = L1_2
        L2_2 = L2_2(L3_2, L4_2)
        L3_2 = L15_1
        if L3_2 then
          L3_2 = GetHashKey
          L4_2 = L15_1.name
          L3_2 = L3_2(L4_2)
          if L3_2 == L1_2 then
            L3_2 = L15_1.name
            if "weapon_petrolcan" ~= L3_2 then
              L3_2 = L15_1.name
              if "weapon_fireextinguisher" ~= L3_2 then
                L3_2 = TriggerServerEvent
                L4_2 = "weapons:server:UpdateWeaponAmmo"
                L5_2 = L15_1
                L6_2 = tonumber
                L7_2 = L2_2
                L6_2, L7_2 = L6_2(L7_2)
                L3_2(L4_2, L5_2, L6_2, L7_2)
                L3_2 = Config
                L3_2 = L3_2.UpdateWeaponQuality
                if L3_2 then
                  L3_2 = L24_1
                  L3_2 = L3_2[L1_2]
                  if nil == L3_2 then
                    L3_2 = L22_1
                    if L3_2 >= 5 then
                      L3_2 = TriggerServerEvent
                      L4_2 = "weapons:server:UpdateWeaponQuality"
                      L5_2 = L15_1
                      L6_2 = L22_1
                      L3_2(L4_2, L5_2, L6_2)
                      L3_2 = 0
                      L22_1 = L3_2
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = L7_1
    L2_2(L3_2)
  end
end
L25_1(L26_1)
L25_1 = _ENV
L26_1 = "Citizen"
L25_1 = L25_1[L26_1]
L26_1 = "CreateThread"
L25_1 = L25_1[L26_1]
function L26_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L0_2 = 250
    L7_1 = L0_2
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetSelectedPedWeapon
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 and -1569615261 ~= L1_2 then
      L2_2 = L15_1
      if L2_2 then
        L2_2 = GetHashKey
        L3_2 = L15_1.name
        L2_2 = L2_2(L3_2)
        if L2_2 == L1_2 then
          L2_2 = L15_1.name
          if "weapon_petrolcan" ~= L2_2 then
            L2_2 = L15_1.name
            if "weapon_fireextinguisher" ~= L2_2 then
              goto lbl_47
            end
          end
          L2_2 = 1
          L7_1 = L2_2
          L2_2 = IsPedShooting
          L3_2 = L0_2
          L2_2 = L2_2(L3_2)
          if L2_2 then
            L2_2 = GetAmmoInPedWeapon
            L3_2 = L0_2
            L4_2 = L1_2
            L2_2 = L2_2(L3_2, L4_2)
            L3_2 = TriggerServerEvent
            L4_2 = "weapons:server:UpdateWeaponAmmo"
            L5_2 = L15_1
            L6_2 = tonumber
            L7_2 = L2_2
            L6_2, L7_2 = L6_2(L7_2)
            L3_2(L4_2, L5_2, L6_2, L7_2)
            L3_2 = Wait
            L4_2 = 750
            L3_2(L4_2)
          end
        end
      end
    end
    ::lbl_47::
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = L7_1
    L2_2(L3_2)
  end
end
L25_1(L26_1)
L25_1 = RegisterNetEvent
L26_1 = "weapon:client:AddAmmo"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "weapon:client:AddAmmo"
function L27_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = GetSelectedPedWeapon
  L5_2 = PlayerPedId
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2()
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L5_2 = Config
  L5_2 = L5_2.LimitAmmo
  if L5_2 then
    L5_2 = L15_1
    if nil ~= L5_2 then
      L5_2 = Config
      L5_2 = L5_2.Framework
      if "ESX" == L5_2 then
        L5_2 = QS
        L5_2 = L5_2.Shared
        L5_2 = L5_2.Weapons
        L5_2 = L5_2[L4_2]
        L5_2 = L5_2.name
        if "weapon_unarmed" ~= L5_2 then
          L5_2 = QS
          L5_2 = L5_2.Shared
          L5_2 = L5_2.Weapons
          L5_2 = L5_2[L4_2]
          L5_2 = L5_2.ammotype
          L7_2 = A0_2
          L6_2 = A0_2.upper
          L6_2 = L6_2(L7_2)
          if L5_2 == L6_2 then
            L5_2 = GetAmmoInPedWeapon
            L6_2 = PlayerPedId
            L6_2 = L6_2()
            L7_2 = L4_2
            L5_2 = L5_2(L6_2, L7_2)
            L6_2 = GetMaxAmmoInClip
            L7_2 = L3_2
            L8_2 = L4_2
            L9_2 = 1
            L6_2 = L6_2(L7_2, L8_2, L9_2)
            L7_2 = tonumber
            L8_2 = L6_2
            L7_2 = L7_2(L8_2)
            L6_2 = L7_2
            if L5_2 ~= L6_2 then
              L7_2 = QS
              L7_2 = L7_2.Shared
              L7_2 = L7_2.Weapons
              L7_2 = L7_2[L4_2]
              if nil ~= L7_2 then
                L7_2 = SetAmmoInClip
                L8_2 = L3_2
                L9_2 = L4_2
                L10_2 = 0
                L7_2(L8_2, L9_2, L10_2)
                L7_2 = AddAmmoToPed
                L8_2 = L3_2
                L9_2 = L4_2
                L10_2 = L6_2
                L7_2(L8_2, L9_2, L10_2)
                L7_2 = TriggerServerEvent
                L8_2 = "weapons:server:AddWeaponAmmo"
                L9_2 = L15_1
                L10_2 = L6_2
                L7_2(L8_2, L9_2, L10_2)
                L7_2 = TriggerServerEvent
                L8_2 = "qs-core:removeItem"
                L9_2 = A2_2.name
                L10_2 = 1
                L11_2 = A2_2.slot
                L7_2(L8_2, L9_2, L10_2, L11_2)
                L7_2 = TriggerEvent
                L8_2 = "inventory:client:ItemBox"
                L9_2 = QS
                L9_2 = L9_2.Shared
                L9_2 = L9_2.Items
                L10_2 = A2_2.name
                L9_2 = L9_2[L10_2]
                L10_2 = "remove"
                L7_2(L8_2, L9_2, L10_2)
              end
            else
              L7_2 = SendTextMessage
              L8_2 = Lang
              L9_2 = "FULL_CHARGER"
              L8_2 = L8_2(L9_2)
              L9_2 = "error"
              L7_2(L8_2, L9_2)
            end
        end
        else
          L5_2 = SendTextMessage
          L6_2 = Lang
          L7_2 = "WEAPON_INVALID"
          L6_2 = L6_2(L7_2)
          L7_2 = "error"
          L5_2(L6_2, L7_2)
        end
      else
        L5_2 = Config
        L5_2 = L5_2.Framework
        if "QBCore" == L5_2 then
          L5_2 = QBCore
          L5_2 = L5_2.Shared
          L5_2 = L5_2.Weapons
          L5_2 = L5_2[L4_2]
          L5_2 = L5_2.name
          if "weapon_unarmed" ~= L5_2 then
            L5_2 = QBCore
            L5_2 = L5_2.Shared
            L5_2 = L5_2.Weapons
            L5_2 = L5_2[L4_2]
            L5_2 = L5_2.ammotype
            L7_2 = A0_2
            L6_2 = A0_2.upper
            L6_2 = L6_2(L7_2)
            if L5_2 == L6_2 then
              L5_2 = GetAmmoInPedWeapon
              L6_2 = PlayerPedId
              L6_2 = L6_2()
              L7_2 = L4_2
              L5_2 = L5_2(L6_2, L7_2)
              L6_2 = GetMaxAmmoInClip
              L7_2 = L3_2
              L8_2 = L4_2
              L9_2 = 1
              L6_2 = L6_2(L7_2, L8_2, L9_2)
              L7_2 = tonumber
              L8_2 = L6_2
              L7_2 = L7_2(L8_2)
              L6_2 = L7_2
              if L5_2 ~= L6_2 then
                L7_2 = QBCore
                L7_2 = L7_2.Shared
                L7_2 = L7_2.Weapons
                L7_2 = L7_2[L4_2]
                if nil ~= L7_2 then
                  L7_2 = SetAmmoInClip
                  L8_2 = L3_2
                  L9_2 = L4_2
                  L10_2 = 0
                  L7_2(L8_2, L9_2, L10_2)
                  L7_2 = AddAmmoToPed
                  L8_2 = L3_2
                  L9_2 = L4_2
                  L10_2 = L6_2
                  L7_2(L8_2, L9_2, L10_2)
                  L7_2 = TriggerServerEvent
                  L8_2 = "weapons:server:AddWeaponAmmo"
                  L9_2 = L15_1
                  L10_2 = L6_2
                  L7_2(L8_2, L9_2, L10_2)
                  L7_2 = TriggerServerEvent
                  L8_2 = "qs-core:removeItem"
                  L9_2 = A2_2.name
                  L10_2 = 1
                  L11_2 = A2_2.slot
                  L7_2(L8_2, L9_2, L10_2, L11_2)
                  L7_2 = TriggerEvent
                  L8_2 = "inventory:client:ItemBox"
                  L9_2 = QBCore
                  L9_2 = L9_2.Shared
                  L9_2 = L9_2.Items
                  L10_2 = A2_2.name
                  L9_2 = L9_2[L10_2]
                  L10_2 = "remove"
                  L7_2(L8_2, L9_2, L10_2)
                end
              else
                L7_2 = SendTextMessage
                L8_2 = Lang
                L9_2 = "FULL_CHARGER"
                L8_2 = L8_2(L9_2)
                L9_2 = "error"
                L7_2(L8_2, L9_2)
              end
          end
          else
            L5_2 = SendTextMessage
            L6_2 = Lang
            L7_2 = "WEAPON_INVALID"
            L6_2 = L6_2(L7_2)
            L7_2 = "error"
            L5_2(L6_2, L7_2)
          end
        end
      end
    else
      L5_2 = SendTextMessage
      L6_2 = Lang
      L7_2 = "WEAPON_INVALID"
      L6_2 = L6_2(L7_2)
      L7_2 = "error"
      L5_2(L6_2, L7_2)
    end
  else
    L5_2 = Config
    L5_2 = L5_2.Framework
    if "ESX" == L5_2 then
      L5_2 = L15_1
      if nil ~= L5_2 then
        L5_2 = QS
        L5_2 = L5_2.Shared
        L5_2 = L5_2.Weapons
        L5_2 = L5_2[L4_2]
        L5_2 = L5_2.name
        if "weapon_unarmed" ~= L5_2 then
          L5_2 = QS
          L5_2 = L5_2.Shared
          L5_2 = L5_2.Weapons
          L5_2 = L5_2[L4_2]
          L5_2 = L5_2.ammotype
          L7_2 = A0_2
          L6_2 = A0_2.upper
          L6_2 = L6_2(L7_2)
          if L5_2 == L6_2 then
            L5_2 = GetAmmoInPedWeapon
            L6_2 = PlayerPedId
            L6_2 = L6_2()
            L7_2 = L4_2
            L5_2 = L5_2(L6_2, L7_2)
            L6_2 = GetMaxAmmoInClip
            L7_2 = L3_2
            L8_2 = L4_2
            L9_2 = 1
            L6_2 = L6_2(L7_2, L8_2, L9_2)
            L7_2 = GetAmmoInClip
            L8_2 = L3_2
            L9_2 = L4_2
            L7_2, L8_2 = L7_2(L8_2, L9_2)
            L9_2 = GetMaxAmmo
            L10_2 = L3_2
            L11_2 = L4_2
            L9_2, L10_2 = L9_2(L10_2, L11_2)
            L11_2 = tonumber
            L12_2 = L6_2
            L11_2 = L11_2(L12_2)
            L6_2 = L11_2
            L11_2 = QS
            L11_2 = L11_2.Shared
            L11_2 = L11_2.Weapons
            L11_2 = L11_2[L4_2]
            if nil ~= L11_2 then
              if L10_2 ~= L5_2 then
                L11_2 = ESX
                L11_2 = L11_2.TriggerServerCallback
                L12_2 = "weapon:server:GetWeaponAmmo"
                function L13_2(A0_3)
                  local L1_3, L2_3, L3_3, L4_3, L5_3
                  if A0_3 then
                    L1_3 = Config
                    L1_3 = L1_3.ReloadAnimation
                    if L1_3 then
                      L1_3 = SetAmmoInClip
                      L2_3 = L3_2
                      L3_3 = L4_2
                      L4_3 = 0
                      L1_3(L2_3, L3_3, L4_3)
                      L1_3 = AddAmmoToPed
                      L2_3 = L3_2
                      L3_3 = L4_2
                      L4_3 = L6_2
                      L5_3 = L8_2
                      L4_3 = L4_3 + L5_3
                      L1_3(L2_3, L3_3, L4_3)
                    else
                      L1_3 = AddAmmoToPed
                      L2_3 = L3_2
                      L3_3 = L4_2
                      L4_3 = L6_2
                      L1_3(L2_3, L3_3, L4_3)
                    end
                    L1_3 = TriggerServerEvent
                    L2_3 = "weapons:server:AddWeaponAmmo"
                    L3_3 = L15_1
                    L4_3 = L5_2
                    L5_3 = L6_2
                    L4_3 = L4_3 + L5_3
                    L1_3(L2_3, L3_3, L4_3)
                    L1_3 = TriggerServerEvent
                    L2_3 = "qs-core:removeItem"
                    L3_3 = A2_2.name
                    L4_3 = 1
                    L5_3 = A2_2.slot
                    L1_3(L2_3, L3_3, L4_3, L5_3)
                    L1_3 = TriggerEvent
                    L2_3 = "inventory:client:ItemBox"
                    L3_3 = QS
                    L3_3 = L3_3.Shared
                    L3_3 = L3_3.Items
                    L4_3 = A2_2.name
                    L3_3 = L3_3[L4_3]
                    L4_3 = "remove"
                    L1_3(L2_3, L3_3, L4_3)
                  end
                end
                L14_2 = L15_1
                L11_2(L12_2, L13_2, L14_2)
              else
                L11_2 = SendTextMessage
                L12_2 = Lang
                L13_2 = "FULL_CHARGER"
                L12_2 = L12_2(L13_2)
                L13_2 = "error"
                L11_2(L12_2, L13_2)
              end
            end
        end
        else
          L5_2 = SendTextMessage
          L6_2 = Lang
          L7_2 = "WEAPON_INVALID"
          L6_2 = L6_2(L7_2)
          L7_2 = "error"
          L5_2(L6_2, L7_2)
        end
      else
        L5_2 = SendTextMessage
        L6_2 = Lang
        L7_2 = "WEAPON_INVALID"
        L6_2 = L6_2(L7_2)
        L7_2 = "error"
        L5_2(L6_2, L7_2)
      end
    else
      L5_2 = Config
      L5_2 = L5_2.Framework
      if "QBCore" == L5_2 then
        L5_2 = L15_1
        if nil ~= L5_2 then
          L5_2 = QBCore
          L5_2 = L5_2.Shared
          L5_2 = L5_2.Weapons
          L5_2 = L5_2[L4_2]
          L5_2 = L5_2.name
          if "weapon_unarmed" ~= L5_2 then
            L5_2 = QBCore
            L5_2 = L5_2.Shared
            L5_2 = L5_2.Weapons
            L5_2 = L5_2[L4_2]
            L5_2 = L5_2.ammotype
            L7_2 = A0_2
            L6_2 = A0_2.upper
            L6_2 = L6_2(L7_2)
            if L5_2 == L6_2 then
              L5_2 = GetAmmoInPedWeapon
              L6_2 = PlayerPedId
              L6_2 = L6_2()
              L7_2 = L4_2
              L5_2 = L5_2(L6_2, L7_2)
              L6_2 = GetMaxAmmoInClip
              L7_2 = L3_2
              L8_2 = L4_2
              L9_2 = 1
              L6_2 = L6_2(L7_2, L8_2, L9_2)
              L7_2 = GetAmmoInClip
              L8_2 = L3_2
              L9_2 = L4_2
              L7_2, L8_2 = L7_2(L8_2, L9_2)
              L9_2 = GetMaxAmmo
              L10_2 = L3_2
              L11_2 = L4_2
              L9_2, L10_2 = L9_2(L10_2, L11_2)
              L11_2 = tonumber
              L12_2 = L6_2
              L11_2 = L11_2(L12_2)
              L6_2 = L11_2
              L11_2 = QBCore
              L11_2 = L11_2.Shared
              L11_2 = L11_2.Weapons
              L11_2 = L11_2[L4_2]
              if nil ~= L11_2 then
                if L10_2 ~= L5_2 then
                  L11_2 = QBCore
                  L11_2 = L11_2.Functions
                  L11_2 = L11_2.TriggerCallback
                  L12_2 = "weapon:server:GetWeaponAmmo"
                  function L13_2(A0_3)
                    local L1_3, L2_3, L3_3, L4_3, L5_3
                    if A0_3 then
                      L1_3 = Config
                      L1_3 = L1_3.ReloadAnimation
                      if L1_3 then
                        L1_3 = SetAmmoInClip
                        L2_3 = L3_2
                        L3_3 = L4_2
                        L4_3 = 0
                        L1_3(L2_3, L3_3, L4_3)
                        L1_3 = AddAmmoToPed
                        L2_3 = L3_2
                        L3_3 = L4_2
                        L4_3 = L6_2
                        L5_3 = L8_2
                        L4_3 = L4_3 + L5_3
                        L1_3(L2_3, L3_3, L4_3)
                      else
                        L1_3 = AddAmmoToPed
                        L2_3 = L3_2
                        L3_3 = L4_2
                        L4_3 = L6_2
                        L1_3(L2_3, L3_3, L4_3)
                      end
                      L1_3 = TriggerServerEvent
                      L2_3 = "weapons:server:AddWeaponAmmo"
                      L3_3 = L15_1
                      L4_3 = L5_2
                      L5_3 = L6_2
                      L4_3 = L4_3 + L5_3
                      L1_3(L2_3, L3_3, L4_3)
                      L1_3 = TriggerServerEvent
                      L2_3 = "qs-core:removeItem"
                      L3_3 = A2_2.name
                      L4_3 = 1
                      L5_3 = A2_2.slot
                      L1_3(L2_3, L3_3, L4_3, L5_3)
                      L1_3 = TriggerEvent
                      L2_3 = "inventory:client:ItemBox"
                      L3_3 = QBCore
                      L3_3 = L3_3.Shared
                      L3_3 = L3_3.Items
                      L4_3 = A2_2.name
                      L3_3 = L3_3[L4_3]
                      L4_3 = "remove"
                      L1_3(L2_3, L3_3, L4_3)
                    end
                  end
                  L14_2 = L15_1
                  L11_2(L12_2, L13_2, L14_2)
                else
                  L11_2 = SendTextMessage
                  L12_2 = Lang
                  L13_2 = "FULL_CHARGER"
                  L12_2 = L12_2(L13_2)
                  L13_2 = "error"
                  L11_2(L12_2, L13_2)
                end
              end
          end
          else
            L5_2 = SendTextMessage
            L6_2 = Lang
            L7_2 = "WEAPON_INVALID"
            L6_2 = L6_2(L7_2)
            L7_2 = "error"
            L5_2(L6_2, L7_2)
          end
        else
          L5_2 = SendTextMessage
          L6_2 = Lang
          L7_2 = "WEAPON_INVALID"
          L6_2 = L6_2(L7_2)
          L7_2 = "error"
          L5_2(L6_2, L7_2)
        end
      end
    end
  end
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = _ENV
L27_1 = "Config"
L26_1 = L26_1[L27_1]
L26_1 = L26_1.playerLoaded
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = _ENV
L27_1 = "Config"
L26_1 = L26_1[L27_1]
L26_1 = L26_1.playerLoaded
function L27_1()
  local L0_2, L1_2, L2_2
  L0_2 = TriggerServerEvent
  L1_2 = "weapons:server:LoadWeaponAmmo"
  L0_2(L1_2)
  L0_2 = true
  L11_1 = L0_2
  L0_2 = Config
  L0_2 = L0_2.Framework
  if "ESX" == L0_2 then
    L0_2 = QS
    L0_2 = L0_2.GetPlayerData
    L0_2 = L0_2()
    PlayerDataQS = L0_2
    L0_2 = ESX
    L0_2 = L0_2.TriggerServerCallback
    L1_2 = "weapons:server:GetConfig"
    function L2_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
      L1_3 = pairs
      L2_3 = A0_3
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        L7_3 = Config
        L7_3 = L7_3.WeaponRepairPoints
        L7_3 = L7_3[L5_3]
        L8_3 = L6_3.IsRepairing
        L7_3.IsRepairing = L8_3
        L7_3 = Config
        L7_3 = L7_3.WeaponRepairPoints
        L7_3 = L7_3[L5_3]
        L8_3 = L6_3.RepairingData
        L7_3.RepairingData = L8_3
      end
    end
    L0_2(L1_2, L2_2)
  else
    L0_2 = Config
    L0_2 = L0_2.Framework
    if "QBCore" == L0_2 then
      L0_2 = QBCore
      L0_2 = L0_2.Functions
      L0_2 = L0_2.GetPlayerData
      L0_2 = L0_2()
      PlayerDataQS = L0_2
      L0_2 = QBCore
      L0_2 = L0_2.Functions
      L0_2 = L0_2.TriggerCallback
      L1_2 = "weapons:server:GetConfig"
      function L2_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
        L1_3 = pairs
        L2_3 = A0_3
        L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
        for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
          L7_3 = Config
          L7_3 = L7_3.WeaponRepairPoints
          L7_3 = L7_3[L5_3]
          L8_3 = L6_3.IsRepairing
          L7_3.IsRepairing = L8_3
          L7_3 = Config
          L7_3 = L7_3.WeaponRepairPoints
          L7_3 = L7_3[L5_3]
          L8_3 = L6_3.RepairingData
          L7_3.RepairingData = L8_3
        end
      end
      L0_2(L1_2, L2_2)
    end
  end
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "weapons:client:SetCurrentWeapon"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "weapons:client:SetCurrentWeapon"
function L27_1(A0_2, A1_2)
  local L2_2
  if false ~= A0_2 then
    L15_1 = A0_2
  else
    L2_2 = {}
    L15_1 = L2_2
  end
  L12_1 = A1_2
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "qs-core:playerUnloaded"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "qs-core:playerUnloaded"
function L27_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = false
  L11_1 = L0_2
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.WeaponRepairPoints
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = Config
    L6_2 = L6_2.WeaponRepairPoints
    L6_2 = L6_2[L4_2]
    L6_2.IsRepairing = false
    L6_2 = Config
    L6_2 = L6_2.WeaponRepairPoints
    L6_2 = L6_2[L4_2]
    L7_2 = {}
    L6_2.RepairingData = L7_2
  end
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "weapons:client:SetWeaponQuality"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "weapons:client:SetWeaponQuality"
function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L15_1
  if nil ~= L1_2 then
    L1_2 = next
    L2_2 = L15_1
    L1_2 = L1_2(L2_2)
    if nil ~= L1_2 then
      L1_2 = TriggerServerEvent
      L2_2 = "weapons:server:SetWeaponQuality"
      L3_2 = L15_1
      L4_2 = A0_2
      L1_2(L2_2, L3_2, L4_2)
    end
  end
end
L25_1(L26_1, L27_1)
L25_1 = _ENV
L26_1 = "Citizen"
L25_1 = L25_1[L26_1]
L26_1 = "CreateThread"
L25_1 = L25_1[L26_1]
function L26_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2
  L0_2 = Config
  L0_2 = L0_2.RepairMarker
  while true do
    L1_2 = L11_1
    if L1_2 then
      L1_2 = false
      L2_2 = PlayerPedId
      L2_2 = L2_2()
      L3_2 = GetEntityCoords
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = pairs
      L5_2 = Config
      L5_2 = L5_2.WeaponRepairPoints
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = GetDistanceBetweenCoords
        L11_2 = L3_2
        L12_2 = L9_2.coords
        L12_2 = L12_2.x
        L13_2 = L9_2.coords
        L13_2 = L13_2.y
        L14_2 = L9_2.coords
        L14_2 = L14_2.z
        L15_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
        L11_2 = L0_2.distanceMarker
        if L10_2 < L11_2 then
          L11_2 = DrawMarker
          L12_2 = L0_2.type
          L13_2 = L9_2.coords
          L13_2 = L13_2.x
          L14_2 = L9_2.coords
          L14_2 = L14_2.y
          L15_2 = L9_2.coords
          L15_2 = L15_2.z
          L15_2 = L15_2 - 0.2
          L16_2 = 0.0
          L17_2 = 0.0
          L18_2 = 0.0
          L19_2 = 0.0
          L20_2 = 0.0
          L21_2 = 0.0
          L22_2 = L0_2.scale
          L22_2 = L22_2.x
          L23_2 = L0_2.scale
          L23_2 = L23_2.y
          L24_2 = L0_2.scale
          L24_2 = L24_2.z
          L25_2 = L0_2.colour
          L25_2 = L25_2.r
          L26_2 = L0_2.colour
          L26_2 = L26_2.g
          L27_2 = L0_2.colour
          L27_2 = L27_2.b
          L28_2 = L0_2.colour
          L28_2 = L28_2.a
          L29_2 = 0
          L30_2 = 0
          L31_2 = 0
          L32_2 = L0_2.movement
          L33_2 = 0
          L34_2 = 0
          L35_2 = 0
          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
          L1_2 = true
          L11_2 = L0_2.distanceText
          if L10_2 < L11_2 then
            L11_2 = Config
            L11_2 = L11_2.Framework
            if "ESX" == L11_2 then
              L11_2 = L9_2.IsRepairing
              if L11_2 then
                L11_2 = L9_2.RepairingData
                L11_2 = L11_2.CitizenId
                L12_2 = PlayerDataQS
                L12_2 = L12_2.citizenid
                if L11_2 ~= L12_2 then
                  L11_2 = Config
                  L11_2 = L11_2.NotificationType
                  if "ShowHelpNotification" == L11_2 then
                    L11_2 = QS
                    L11_2 = L11_2.ShowHelpNotification
                    L12_2 = Lang
                    L13_2 = "REPAIR_UNAVAILABLE"
                    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                  else
                    L11_2 = Config
                    L11_2 = L11_2.NotificationType
                    if "DrawText3D" == L11_2 then
                      L11_2 = QS
                      L11_2 = L11_2.DrawText3D
                      L12_2 = L9_2.coords
                      L12_2 = L12_2.x
                      L13_2 = L9_2.coords
                      L13_2 = L13_2.y
                      L14_2 = L9_2.coords
                      L14_2 = L14_2.z
                      L15_2 = Lang
                      L16_2 = "REPAIR_UNAVAILABLE"
                      L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                    else
                      L11_2 = Config
                      L11_2 = L11_2.NotificationType
                      if "CustomNotify" == L11_2 then
                        L11_2 = CustomNotify
                        L12_2 = L9_2.coords
                        L12_2 = L12_2.x
                        L13_2 = L9_2.coords
                        L13_2 = L13_2.y
                        L14_2 = L9_2.coords
                        L14_2 = L14_2.z
                        L15_2 = Lang
                        L16_2 = "REPAIR_UNAVAILABLE"
                        L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "disable" == L11_2 then
                        end
                      end
                    end
                  end
                else
                  L11_2 = L9_2.RepairingData
                  L11_2 = L11_2.Ready
                  if not L11_2 then
                    L11_2 = Config
                    L11_2 = L11_2.NotificationType
                    if "ShowHelpNotification" == L11_2 then
                      L11_2 = QS
                      L11_2 = L11_2.ShowHelpNotification
                      L12_2 = Lang
                      L13_2 = "RAPAIR_PROGRESS"
                      L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                    else
                      L11_2 = Config
                      L11_2 = L11_2.NotificationType
                      if "DrawText3D" == L11_2 then
                        L11_2 = QS
                        L11_2 = L11_2.DrawText3D
                        L12_2 = L9_2.coords
                        L12_2 = L12_2.x
                        L13_2 = L9_2.coords
                        L13_2 = L13_2.y
                        L14_2 = L9_2.coords
                        L14_2 = L14_2.z
                        L15_2 = Lang
                        L16_2 = "RAPAIR_PROGRESS"
                        L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "CustomNotify" == L11_2 then
                          L11_2 = CustomNotify
                          L12_2 = L9_2.coords
                          L12_2 = L12_2.x
                          L13_2 = L9_2.coords
                          L13_2 = L13_2.y
                          L14_2 = L9_2.coords
                          L14_2 = L14_2.z
                          L15_2 = Lang
                          L16_2 = "RAPAIR_PROGRESS"
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "disable" == L11_2 then
                          end
                        end
                      end
                    end
                  else
                    L11_2 = Config
                    L11_2 = L11_2.NotificationType
                    if "ShowHelpNotification" == L11_2 then
                      L11_2 = QS
                      L11_2 = L11_2.ShowHelpNotification
                      L12_2 = Lang
                      L13_2 = "REPAIR_TAKE_WEAPON"
                      L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                    else
                      L11_2 = Config
                      L11_2 = L11_2.NotificationType
                      if "DrawText3D" == L11_2 then
                        L11_2 = QS
                        L11_2 = L11_2.DrawText3D
                        L12_2 = L9_2.coords
                        L12_2 = L12_2.x
                        L13_2 = L9_2.coords
                        L13_2 = L13_2.y
                        L14_2 = L9_2.coords
                        L14_2 = L14_2.z
                        L15_2 = Lang
                        L16_2 = "REPAIR_TAKE_WEAPON"
                        L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "CustomNotify" == L11_2 then
                          L11_2 = CustomNotify
                          L12_2 = L9_2.coords
                          L12_2 = L12_2.x
                          L13_2 = L9_2.coords
                          L13_2 = L13_2.y
                          L14_2 = L9_2.coords
                          L14_2 = L14_2.z
                          L15_2 = Lang
                          L16_2 = "REPAIR_TAKE_WEAPON"
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "disable" == L11_2 then
                          end
                        end
                      end
                    end
                  end
                end
              else
                L11_2 = L15_1
                if nil ~= L11_2 then
                  L11_2 = next
                  L12_2 = L15_1
                  L11_2 = L11_2(L12_2)
                  if nil ~= L11_2 then
                    L11_2 = L9_2.RepairingData
                    L11_2 = L11_2.Ready
                    if not L11_2 then
                      L11_2 = QS
                      L11_2 = L11_2.Shared
                      L11_2 = L11_2.Weapons
                      L12_2 = GetHashKey
                      L13_2 = L15_1.name
                      L12_2 = L12_2(L13_2)
                      L11_2 = L11_2[L12_2]
                      L12_2 = QS
                      L12_2 = L12_2.Shared
                      L12_2 = L12_2.SplitStr
                      L13_2 = L11_2.ammotype
                      L14_2 = "_"
                      L12_2 = L12_2(L13_2, L14_2)
                      L12_2 = L12_2[2]
                      L13_2 = L12_2
                      L12_2 = L12_2.lower
                      L12_2 = L12_2(L13_2)
                      L13_2 = Config
                      L13_2 = L13_2.NotificationType
                      if "ShowHelpNotification" == L13_2 then
                        L13_2 = QS
                        L13_2 = L13_2.ShowHelpNotification
                        L14_2 = Lang
                        L15_2 = "REPAIR_PRICE"
                        L14_2 = L14_2(L15_2)
                        L15_2 = Config
                        L15_2 = L15_2.WeaponRepairCotsts
                        L15_2 = L15_2[L12_2]
                        L14_2 = L14_2 .. L15_2
                        L13_2(L14_2)
                      else
                        L13_2 = Config
                        L13_2 = L13_2.NotificationType
                        if "DrawText3D" == L13_2 then
                          L13_2 = QS
                          L13_2 = L13_2.DrawText3D
                          L14_2 = L9_2.coords
                          L14_2 = L14_2.x
                          L15_2 = L9_2.coords
                          L15_2 = L15_2.y
                          L16_2 = L9_2.coords
                          L16_2 = L16_2.z
                          L17_2 = Lang
                          L18_2 = "REPAIR_PRICE"
                          L17_2 = L17_2(L18_2)
                          L18_2 = Config
                          L18_2 = L18_2.WeaponRepairCotsts
                          L18_2 = L18_2[L12_2]
                          L17_2 = L17_2 .. L18_2
                          L13_2(L14_2, L15_2, L16_2, L17_2)
                        else
                          L13_2 = Config
                          L13_2 = L13_2.NotificationType
                          if "CustomNotify" == L13_2 then
                            L13_2 = CustomNotify
                            L14_2 = L9_2.coords
                            L14_2 = L14_2.x
                            L15_2 = L9_2.coords
                            L15_2 = L15_2.y
                            L16_2 = L9_2.coords
                            L16_2 = L16_2.z
                            L17_2 = Lang
                            L18_2 = "REPAIR_PRICE"
                            L17_2 = L17_2(L18_2)
                            L18_2 = Config
                            L18_2 = L18_2.WeaponRepairCotsts
                            L18_2 = L18_2[L12_2]
                            L17_2 = L17_2 .. L18_2
                            L13_2(L14_2, L15_2, L16_2, L17_2)
                          else
                            L13_2 = Config
                            L13_2 = L13_2.NotificationType
                            if "disable" == L13_2 then
                            end
                          end
                        end
                      end
                      L13_2 = IsControlJustPressed
                      L14_2 = 0
                      L15_2 = Keys
                      L16_2 = Config
                      L16_2 = L16_2.Keys
                      L16_2 = L16_2.RepairWeapon
                      L15_2 = L15_2[L16_2]
                      L13_2 = L13_2(L14_2, L15_2)
                      if L13_2 then
                        L13_2 = ESX
                        L13_2 = L13_2.TriggerServerCallback
                        L14_2 = "weapons:server:RepairWeapon"
                        function L15_2(A0_3)
                          local L1_3
                          if A0_3 then
                            L1_3 = {}
                            L15_1 = L1_3
                          end
                        end
                        L16_2 = L8_2
                        L17_2 = L15_1
                        L13_2(L14_2, L15_2, L16_2, L17_2)
                      end
                    else
                      L11_2 = L9_2.RepairingData
                      L11_2 = L11_2.CitizenId
                      L12_2 = PlayerDataQS
                      L12_2 = L12_2.citizenid
                      if L11_2 ~= L12_2 then
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "ShowHelpNotification" == L11_2 then
                          L11_2 = QS
                          L11_2 = L11_2.ShowHelpNotification
                          L12_2 = Lang
                          L13_2 = "REPAIR_UNAVAILABLE"
                          L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "DrawText3D" == L11_2 then
                            L11_2 = QS
                            L11_2 = L11_2.DrawText3D
                            L12_2 = L9_2.coords
                            L12_2 = L12_2.x
                            L13_2 = L9_2.coords
                            L13_2 = L13_2.y
                            L14_2 = L9_2.coords
                            L14_2 = L14_2.z
                            L15_2 = Lang
                            L16_2 = "REPAIR_UNAVAILABLE"
                            L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                          else
                            L11_2 = Config
                            L11_2 = L11_2.NotificationType
                            if "CustomNotify" == L11_2 then
                              L11_2 = CustomNotify
                              L12_2 = L9_2.coords
                              L12_2 = L12_2.x
                              L13_2 = L9_2.coords
                              L13_2 = L13_2.y
                              L14_2 = L9_2.coords
                              L14_2 = L14_2.z
                              L15_2 = Lang
                              L16_2 = "REPAIR_UNAVAILABLE"
                              L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                            else
                              L11_2 = Config
                              L11_2 = L11_2.NotificationType
                              if "disable" == L11_2 then
                              end
                            end
                          end
                        end
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "ShowHelpNotification" == L11_2 then
                          L11_2 = QS
                          L11_2 = L11_2.ShowHelpNotification
                          L12_2 = Lang
                          L13_2 = "REPAIR_SUCCESS"
                          L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "DrawText3D" == L11_2 then
                            L11_2 = QS
                            L11_2 = L11_2.DrawText3D
                            L12_2 = L9_2.coords
                            L12_2 = L12_2.x
                            L13_2 = L9_2.coords
                            L13_2 = L13_2.y
                            L14_2 = L9_2.coords
                            L14_2 = L14_2.z
                            L15_2 = Lang
                            L16_2 = "REPAIR_SUCCESS"
                            L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                          else
                            L11_2 = Config
                            L11_2 = L11_2.NotificationType
                            if "CustomNotify" == L11_2 then
                              L11_2 = CustomNotify
                              L12_2 = L9_2.coords
                              L12_2 = L12_2.x
                              L13_2 = L9_2.coords
                              L13_2 = L13_2.y
                              L14_2 = L9_2.coords
                              L14_2 = L14_2.z
                              L15_2 = Lang
                              L16_2 = "REPAIR_SUCCESS"
                              L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                            else
                              L11_2 = Config
                              L11_2 = L11_2.NotificationType
                              if "disable" == L11_2 then
                              end
                            end
                          end
                        end
                        L11_2 = IsControlJustPressed
                        L12_2 = 0
                        L13_2 = Keys
                        L14_2 = Config
                        L14_2 = L14_2.Keys
                        L14_2 = L14_2.RepairWeapon
                        L13_2 = L13_2[L14_2]
                        L11_2 = L11_2(L12_2, L13_2)
                        if L11_2 then
                          L11_2 = TriggerServerEvent
                          L12_2 = "weapons:server:TakeBackWeapon"
                          L13_2 = L8_2
                          L14_2 = L9_2
                          L11_2(L12_2, L13_2, L14_2)
                        end
                      end
                    end
                end
                else
                  L11_2 = L9_2.RepairingData
                  L11_2 = L11_2.CitizenId
                  if nil == L11_2 then
                    L11_2 = Config
                    L11_2 = L11_2.NotificationType
                    if "ShowHelpNotification" == L11_2 then
                      L11_2 = QS
                      L11_2 = L11_2.ShowHelpNotification
                      L12_2 = Lang
                      L13_2 = "REPAIR_TAKE"
                      L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                    else
                      L11_2 = Config
                      L11_2 = L11_2.NotificationType
                      if "DrawText3D" == L11_2 then
                        L11_2 = QS
                        L11_2 = L11_2.DrawText3D
                        L12_2 = L9_2.coords
                        L12_2 = L12_2.x
                        L13_2 = L9_2.coords
                        L13_2 = L13_2.y
                        L14_2 = L9_2.coords
                        L14_2 = L14_2.z
                        L15_2 = Lang
                        L16_2 = "REPAIR_TAKE"
                        L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "CustomNotify" == L11_2 then
                          L11_2 = CustomNotify
                          L12_2 = L9_2.coords
                          L12_2 = L12_2.x
                          L13_2 = L9_2.coords
                          L13_2 = L13_2.y
                          L14_2 = L9_2.coords
                          L14_2 = L14_2.z
                          L15_2 = Lang
                          L16_2 = "REPAIR_TAKE"
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "disable" == L11_2 then
                          end
                        end
                      end
                    end
                  else
                    L11_2 = L9_2.RepairingData
                    L11_2 = L11_2.CitizenId
                    L12_2 = PlayerDataQS
                    L12_2 = L12_2.citizenid
                    if L11_2 == L12_2 then
                      L11_2 = Config
                      L11_2 = L11_2.NotificationType
                      if "ShowHelpNotification" == L11_2 then
                        L11_2 = QS
                        L11_2 = L11_2.ShowHelpNotification
                        L12_2 = Lang
                        L13_2 = "REPAIR_TAKE_WEAPON"
                        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "DrawText3D" == L11_2 then
                          L11_2 = QS
                          L11_2 = L11_2.DrawText3D
                          L12_2 = L9_2.coords
                          L12_2 = L12_2.x
                          L13_2 = L9_2.coords
                          L13_2 = L13_2.y
                          L14_2 = L9_2.coords
                          L14_2 = L14_2.z
                          L15_2 = Lang
                          L16_2 = "REPAIR_TAKE_WEAPON"
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "CustomNotify" == L11_2 then
                            L11_2 = CustomNotify
                            L12_2 = L9_2.coords
                            L12_2 = L12_2.x
                            L13_2 = L9_2.coords
                            L13_2 = L13_2.y
                            L14_2 = L9_2.coords
                            L14_2 = L14_2.z
                            L15_2 = Lang
                            L16_2 = "REPAIR_TAKE_WEAPON"
                            L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                          else
                            L11_2 = Config
                            L11_2 = L11_2.NotificationType
                            if "disable" == L11_2 then
                            end
                          end
                        end
                      end
                      L11_2 = IsControlJustPressed
                      L12_2 = 0
                      L13_2 = Keys
                      L14_2 = Config
                      L14_2 = L14_2.Keys
                      L14_2 = L14_2.RepairWeapon
                      L13_2 = L13_2[L14_2]
                      L11_2 = L11_2(L12_2, L13_2)
                      if L11_2 then
                        L11_2 = TriggerServerEvent
                        L12_2 = "weapons:server:TakeBackWeapon"
                        L13_2 = L8_2
                        L14_2 = L9_2
                        L11_2(L12_2, L13_2, L14_2)
                      end
                    end
                  end
                end
              end
            else
              L11_2 = Config
              L11_2 = L11_2.Framework
              if "QBCore" == L11_2 then
                L11_2 = L9_2.IsRepairing
                if L11_2 then
                  L11_2 = L9_2.RepairingData
                  L11_2 = L11_2.Identifier
                  L12_2 = QBCore
                  L12_2 = L12_2.Functions
                  L12_2 = L12_2.GetPlayerData
                  L12_2 = L12_2()
                  L12_2 = L12_2.citizenid
                  if L11_2 ~= L12_2 then
                    L11_2 = Config
                    L11_2 = L11_2.NotificationType
                    if "ShowHelpNotification" == L11_2 then
                      L11_2 = QBCore
                      L11_2 = L11_2.Functions
                      L11_2 = L11_2.ShowHelpNotification
                      L12_2 = Lang
                      L13_2 = "REPAIR_UNAVAILABLE"
                      L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                    else
                      L11_2 = Config
                      L11_2 = L11_2.NotificationType
                      if "DrawText3D" == L11_2 then
                        L11_2 = QBCore
                        L11_2 = L11_2.Functions
                        L11_2 = L11_2.DrawText3D
                        L12_2 = L9_2.coords
                        L12_2 = L12_2.x
                        L13_2 = L9_2.coords
                        L13_2 = L13_2.y
                        L14_2 = L9_2.coords
                        L14_2 = L14_2.z
                        L15_2 = Lang
                        L16_2 = "REPAIR_UNAVAILABLE"
                        L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "CustomNotify" == L11_2 then
                          L11_2 = CustomNotify
                          L12_2 = L9_2.coords
                          L12_2 = L12_2.x
                          L13_2 = L9_2.coords
                          L13_2 = L13_2.y
                          L14_2 = L9_2.coords
                          L14_2 = L14_2.z
                          L15_2 = Lang
                          L16_2 = "REPAIR_UNAVAILABLE"
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "disable" == L11_2 then
                          end
                        end
                      end
                    end
                  else
                    L11_2 = L9_2.RepairingData
                    L11_2 = L11_2.Ready
                    if not L11_2 then
                      L11_2 = Config
                      L11_2 = L11_2.NotificationType
                      if "ShowHelpNotification" == L11_2 then
                        L11_2 = QBCore
                        L11_2 = L11_2.Functions
                        L11_2 = L11_2.ShowHelpNotification
                        L12_2 = Lang
                        L13_2 = "RAPAIR_PROGRESS"
                        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "DrawText3D" == L11_2 then
                          L11_2 = QBCore
                          L11_2 = L11_2.Functions
                          L11_2 = L11_2.DrawText3D
                          L12_2 = L9_2.coords
                          L12_2 = L12_2.x
                          L13_2 = L9_2.coords
                          L13_2 = L13_2.y
                          L14_2 = L9_2.coords
                          L14_2 = L14_2.z
                          L15_2 = Lang
                          L16_2 = "RAPAIR_PROGRESS"
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "CustomNotify" == L11_2 then
                            L11_2 = CustomNotify
                            L12_2 = L9_2.coords
                            L12_2 = L12_2.x
                            L13_2 = L9_2.coords
                            L13_2 = L13_2.y
                            L14_2 = L9_2.coords
                            L14_2 = L14_2.z
                            L15_2 = Lang
                            L16_2 = "RAPAIR_PROGRESS"
                            L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                          else
                            L11_2 = Config
                            L11_2 = L11_2.NotificationType
                            if "disable" == L11_2 then
                            end
                          end
                        end
                      end
                    else
                      L11_2 = Config
                      L11_2 = L11_2.NotificationType
                      if "ShowHelpNotification" == L11_2 then
                        L11_2 = QBCore
                        L11_2 = L11_2.Functions
                        L11_2 = L11_2.ShowHelpNotification
                        L12_2 = Lang
                        L13_2 = "REPAIR_TAKE_WEAPON"
                        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "DrawText3D" == L11_2 then
                          L11_2 = QBCore
                          L11_2 = L11_2.Functions
                          L11_2 = L11_2.DrawText3D
                          L12_2 = L9_2.coords
                          L12_2 = L12_2.x
                          L13_2 = L9_2.coords
                          L13_2 = L13_2.y
                          L14_2 = L9_2.coords
                          L14_2 = L14_2.z
                          L15_2 = Lang
                          L16_2 = "REPAIR_TAKE_WEAPON"
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "CustomNotify" == L11_2 then
                            L11_2 = CustomNotify
                            L12_2 = L9_2.coords
                            L12_2 = L12_2.x
                            L13_2 = L9_2.coords
                            L13_2 = L13_2.y
                            L14_2 = L9_2.coords
                            L14_2 = L14_2.z
                            L15_2 = Lang
                            L16_2 = "REPAIR_TAKE_WEAPON"
                            L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                          else
                            L11_2 = Config
                            L11_2 = L11_2.NotificationType
                            if "disable" == L11_2 then
                            end
                          end
                        end
                      end
                    end
                  end
                else
                  L11_2 = L15_1
                  if nil ~= L11_2 then
                    L11_2 = next
                    L12_2 = L15_1
                    L11_2 = L11_2(L12_2)
                    if nil ~= L11_2 then
                      L11_2 = L9_2.RepairingData
                      L11_2 = L11_2.Ready
                      if not L11_2 then
                        L11_2 = QBCore
                        L11_2 = L11_2.Shared
                        L11_2 = L11_2.Weapons
                        L12_2 = GetHashKey
                        L13_2 = L15_1.name
                        L12_2 = L12_2(L13_2)
                        L11_2 = L11_2[L12_2]
                        L12_2 = QBCore
                        L12_2 = L12_2.Shared
                        L12_2 = L12_2.SplitStr
                        L13_2 = L11_2.ammotype
                        L14_2 = "_"
                        L12_2 = L12_2(L13_2, L14_2)
                        L12_2 = L12_2[2]
                        L13_2 = L12_2
                        L12_2 = L12_2.lower
                        L12_2 = L12_2(L13_2)
                        L13_2 = Config
                        L13_2 = L13_2.NotificationType
                        if "ShowHelpNotification" == L13_2 then
                          L13_2 = QBCore
                          L13_2 = L13_2.Functions
                          L13_2 = L13_2.ShowHelpNotification
                          L14_2 = Lang
                          L15_2 = "REPAIR_PRICE"
                          L14_2 = L14_2(L15_2)
                          L15_2 = Config
                          L15_2 = L15_2.WeaponRepairCotsts
                          L15_2 = L15_2[L12_2]
                          L14_2 = L14_2 .. L15_2
                          L13_2(L14_2)
                        else
                          L13_2 = Config
                          L13_2 = L13_2.NotificationType
                          if "DrawText3D" == L13_2 then
                            L13_2 = QBCore
                            L13_2 = L13_2.Functions
                            L13_2 = L13_2.DrawText3D
                            L14_2 = L9_2.coords
                            L14_2 = L14_2.x
                            L15_2 = L9_2.coords
                            L15_2 = L15_2.y
                            L16_2 = L9_2.coords
                            L16_2 = L16_2.z
                            L17_2 = Lang
                            L18_2 = "REPAIR_PRICE"
                            L17_2 = L17_2(L18_2)
                            L18_2 = Config
                            L18_2 = L18_2.WeaponRepairCotsts
                            L18_2 = L18_2[L12_2]
                            L17_2 = L17_2 .. L18_2
                            L13_2(L14_2, L15_2, L16_2, L17_2)
                          else
                            L13_2 = Config
                            L13_2 = L13_2.NotificationType
                            if "CustomNotify" == L13_2 then
                              L13_2 = CustomNotify
                              L14_2 = L9_2.coords
                              L14_2 = L14_2.x
                              L15_2 = L9_2.coords
                              L15_2 = L15_2.y
                              L16_2 = L9_2.coords
                              L16_2 = L16_2.z
                              L17_2 = Lang
                              L18_2 = "REPAIR_PRICE"
                              L17_2 = L17_2(L18_2)
                              L18_2 = Config
                              L18_2 = L18_2.WeaponRepairCotsts
                              L18_2 = L18_2[L12_2]
                              L17_2 = L17_2 .. L18_2
                              L13_2(L14_2, L15_2, L16_2, L17_2)
                            else
                              L13_2 = Config
                              L13_2 = L13_2.NotificationType
                              if "disable" == L13_2 then
                              end
                            end
                          end
                        end
                        L13_2 = IsControlJustPressed
                        L14_2 = 0
                        L15_2 = Keys
                        L16_2 = Config
                        L16_2 = L16_2.Keys
                        L16_2 = L16_2.RepairWeapon
                        L15_2 = L15_2[L16_2]
                        L13_2 = L13_2(L14_2, L15_2)
                        if L13_2 then
                          L13_2 = QBCore
                          L13_2 = L13_2.Functions
                          L13_2 = L13_2.TriggerCallback
                          L14_2 = "weapons:server:RepairWeapon"
                          function L15_2(A0_3)
                            local L1_3
                            if A0_3 then
                              L1_3 = {}
                              L15_1 = L1_3
                            end
                          end
                          L16_2 = L8_2
                          L17_2 = L15_1
                          L13_2(L14_2, L15_2, L16_2, L17_2)
                        end
                      else
                        L11_2 = L9_2.RepairingData
                        L11_2 = L11_2.Identifier
                        L12_2 = QBCore
                        L12_2 = L12_2.Functions
                        L12_2 = L12_2.GetPlayerData
                        L12_2 = L12_2()
                        L12_2 = L12_2.citizenid
                        if L11_2 ~= L12_2 then
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "ShowHelpNotification" == L11_2 then
                            L11_2 = QBCore
                            L11_2 = L11_2.Functions
                            L11_2 = L11_2.ShowHelpNotification
                            L12_2 = Lang
                            L13_2 = "REPAIR_UNAVAILABLE"
                            L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                          else
                            L11_2 = Config
                            L11_2 = L11_2.NotificationType
                            if "DrawText3D" == L11_2 then
                              L11_2 = QBCore
                              L11_2 = L11_2.Functions
                              L11_2 = L11_2.DrawText3D
                              L12_2 = L9_2.coords
                              L12_2 = L12_2.x
                              L13_2 = L9_2.coords
                              L13_2 = L13_2.y
                              L14_2 = L9_2.coords
                              L14_2 = L14_2.z
                              L15_2 = Lang
                              L16_2 = "REPAIR_UNAVAILABLE"
                              L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                            else
                              L11_2 = Config
                              L11_2 = L11_2.NotificationType
                              if "CustomNotify" == L11_2 then
                                L11_2 = CustomNotify
                                L12_2 = L9_2.coords
                                L12_2 = L12_2.x
                                L13_2 = L9_2.coords
                                L13_2 = L13_2.y
                                L14_2 = L9_2.coords
                                L14_2 = L14_2.z
                                L15_2 = Lang
                                L16_2 = "REPAIR_UNAVAILABLE"
                                L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                                L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                              else
                                L11_2 = Config
                                L11_2 = L11_2.NotificationType
                                if "disable" == L11_2 then
                                end
                              end
                            end
                          end
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "ShowHelpNotification" == L11_2 then
                            L11_2 = QBCore
                            L11_2 = L11_2.Functions
                            L11_2 = L11_2.ShowHelpNotification
                            L12_2 = Lang
                            L13_2 = "REPAIR_SUCCESS"
                            L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                          else
                            L11_2 = Config
                            L11_2 = L11_2.NotificationType
                            if "DrawText3D" == L11_2 then
                              L11_2 = QBCore
                              L11_2 = L11_2.Functions
                              L11_2 = L11_2.DrawText3D
                              L12_2 = L9_2.coords
                              L12_2 = L12_2.x
                              L13_2 = L9_2.coords
                              L13_2 = L13_2.y
                              L14_2 = L9_2.coords
                              L14_2 = L14_2.z
                              L15_2 = Lang
                              L16_2 = "REPAIR_SUCCESS"
                              L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                            else
                              L11_2 = Config
                              L11_2 = L11_2.NotificationType
                              if "CustomNotify" == L11_2 then
                                L11_2 = CustomNotify
                                L12_2 = L9_2.coords
                                L12_2 = L12_2.x
                                L13_2 = L9_2.coords
                                L13_2 = L13_2.y
                                L14_2 = L9_2.coords
                                L14_2 = L14_2.z
                                L15_2 = Lang
                                L16_2 = "REPAIR_SUCCESS"
                                L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                                L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                              else
                                L11_2 = Config
                                L11_2 = L11_2.NotificationType
                                if "disable" == L11_2 then
                                end
                              end
                            end
                          end
                          L11_2 = IsControlJustPressed
                          L12_2 = 0
                          L13_2 = Keys
                          L14_2 = Config
                          L14_2 = L14_2.Keys
                          L14_2 = L14_2.RepairWeapon
                          L13_2 = L13_2[L14_2]
                          L11_2 = L11_2(L12_2, L13_2)
                          if L11_2 then
                            L11_2 = TriggerServerEvent
                            L12_2 = "weapons:server:TakeBackWeapon"
                            L13_2 = L8_2
                            L14_2 = L9_2
                            L11_2(L12_2, L13_2, L14_2)
                          end
                        end
                      end
                  end
                  else
                    L11_2 = L9_2.RepairingData
                    L11_2 = L11_2.Identifier
                    if nil == L11_2 then
                      L11_2 = Config
                      L11_2 = L11_2.NotificationType
                      if "ShowHelpNotification" == L11_2 then
                        L11_2 = QBCore
                        L11_2 = L11_2.Functions
                        L11_2 = L11_2.ShowHelpNotification
                        L12_2 = Lang
                        L13_2 = "REPAIR_TAKE"
                        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                      else
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "DrawText3D" == L11_2 then
                          L11_2 = QBCore
                          L11_2 = L11_2.Functions
                          L11_2 = L11_2.DrawText3D
                          L12_2 = L9_2.coords
                          L12_2 = L12_2.x
                          L13_2 = L9_2.coords
                          L13_2 = L13_2.y
                          L14_2 = L9_2.coords
                          L14_2 = L14_2.z
                          L15_2 = Lang
                          L16_2 = "REPAIR_TAKE"
                          L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "CustomNotify" == L11_2 then
                            L11_2 = CustomNotify
                            L12_2 = L9_2.coords
                            L12_2 = L12_2.x
                            L13_2 = L9_2.coords
                            L13_2 = L13_2.y
                            L14_2 = L9_2.coords
                            L14_2 = L14_2.z
                            L15_2 = Lang
                            L16_2 = "REPAIR_TAKE"
                            L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                          else
                            L11_2 = Config
                            L11_2 = L11_2.NotificationType
                            if "disable" == L11_2 then
                            end
                          end
                        end
                      end
                    else
                      L11_2 = L9_2.RepairingData
                      L11_2 = L11_2.Identifier
                      L12_2 = QBCore
                      L12_2 = L12_2.Functions
                      L12_2 = L12_2.GetPlayerData
                      L12_2 = L12_2()
                      L12_2 = L12_2.citizenid
                      if L11_2 == L12_2 then
                        L11_2 = Config
                        L11_2 = L11_2.NotificationType
                        if "ShowHelpNotification" == L11_2 then
                          L11_2 = QBCore
                          L11_2 = L11_2.Functions
                          L11_2 = L11_2.ShowHelpNotification
                          L12_2 = Lang
                          L13_2 = "REPAIR_TAKE_WEAPON"
                          L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L12_2(L13_2)
                          L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                        else
                          L11_2 = Config
                          L11_2 = L11_2.NotificationType
                          if "DrawText3D" == L11_2 then
                            L11_2 = QBCore
                            L11_2 = L11_2.Functions
                            L11_2 = L11_2.DrawText3D
                            L12_2 = L9_2.coords
                            L12_2 = L12_2.x
                            L13_2 = L9_2.coords
                            L13_2 = L13_2.y
                            L14_2 = L9_2.coords
                            L14_2 = L14_2.z
                            L15_2 = Lang
                            L16_2 = "REPAIR_TAKE_WEAPON"
                            L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                          else
                            L11_2 = Config
                            L11_2 = L11_2.NotificationType
                            if "CustomNotify" == L11_2 then
                              L11_2 = CustomNotify
                              L12_2 = L9_2.coords
                              L12_2 = L12_2.x
                              L13_2 = L9_2.coords
                              L13_2 = L13_2.y
                              L14_2 = L9_2.coords
                              L14_2 = L14_2.z
                              L15_2 = Lang
                              L16_2 = "REPAIR_TAKE_WEAPON"
                              L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L15_2(L16_2)
                              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                            else
                              L11_2 = Config
                              L11_2 = L11_2.NotificationType
                              if "disable" == L11_2 then
                              end
                            end
                          end
                        end
                        L11_2 = IsControlJustPressed
                        L12_2 = 0
                        L13_2 = Keys
                        L14_2 = Config
                        L14_2 = L14_2.Keys
                        L14_2 = L14_2.RepairWeapon
                        L13_2 = L13_2[L14_2]
                        L11_2 = L11_2(L12_2, L13_2)
                        if L11_2 then
                          L11_2 = TriggerServerEvent
                          L12_2 = "weapons:server:TakeBackWeapon"
                          L13_2 = L8_2
                          L14_2 = L9_2
                          L11_2(L12_2, L13_2, L14_2)
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
      if not L1_2 then
        L4_2 = Citizen
        L4_2 = L4_2.Wait
        L5_2 = 1000
        L4_2(L5_2)
      end
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 3
    L1_2(L2_2)
  end
end
L25_1(L26_1)
L25_1 = RegisterNetEvent
L26_1 = "weapons:client:SyncRepairShops"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "weapons:client:SyncRepairShops"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = Config
  L2_2 = L2_2.WeaponRepairPoints
  L2_2 = L2_2[A1_2]
  L3_2 = A0_2.IsRepairing
  L2_2.IsRepairing = L3_2
  L2_2 = Config
  L2_2 = L2_2.WeaponRepairPoints
  L2_2 = L2_2[A1_2]
  L3_2 = A0_2.RepairingData
  L2_2.RepairingData = L3_2
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "weapons:client:EquipAttachment"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "weapons:client:EquipAttachment"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = GetSelectedPedWeapon
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = QS
    L4_2 = L4_2.Shared
    L4_2 = L4_2.Weapons
    L4_2 = L4_2[L3_2]
    L5_2 = GetHashKey
    L6_2 = "WEAPON_UNARMED"
    L5_2 = L5_2(L6_2)
    if L3_2 ~= L5_2 then
      L5_2 = L4_2.name
      L6_2 = L5_2
      L5_2 = L5_2.upper
      L5_2 = L5_2(L6_2)
      L4_2.name = L5_2
      L5_2 = Config
      L5_2 = L5_2.WeaponAttachments
      L6_2 = L4_2.name
      L5_2 = L5_2[L6_2]
      if nil ~= L5_2 then
        L5_2 = Config
        L5_2 = L5_2.WeaponAttachments
        L6_2 = L4_2.name
        L5_2 = L5_2[L6_2]
        L5_2 = L5_2[A1_2]
        if nil ~= L5_2 then
          L5_2 = Config
          L5_2 = L5_2.WeaponAttachments
          L6_2 = L4_2.name
          L5_2 = L5_2[L6_2]
          L5_2 = L5_2[A1_2]
          L5_2 = L5_2.item
          L6_2 = A0_2.name
          if L5_2 == L6_2 then
            L5_2 = TriggerServerEvent
            L6_2 = "weapons:server:EquipAttachment"
            L7_2 = A0_2
            L8_2 = L15_1
            L9_2 = Config
            L9_2 = L9_2.WeaponAttachments
            L10_2 = L4_2.name
            L9_2 = L9_2[L10_2]
            L9_2 = L9_2[A1_2]
            L5_2(L6_2, L7_2, L8_2, L9_2)
        end
        else
          L5_2 = SendTextMessage
          L6_2 = Lang
          L7_2 = "WEAPON_INVALID_ATTACHMENT"
          L6_2 = L6_2(L7_2)
          L7_2 = "error"
          L5_2(L6_2, L7_2)
        end
      end
    else
      L5_2 = SendTextMessage
      L6_2 = Lang
      L7_2 = "WEAPON_INVALID"
      L6_2 = L6_2(L7_2)
      L7_2 = "error"
      L5_2(L6_2, L7_2)
    end
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = PlayerPedId
      L2_2 = L2_2()
      L3_2 = GetSelectedPedWeapon
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = QBCore
      L4_2 = L4_2.Shared
      L4_2 = L4_2.Weapons
      L4_2 = L4_2[L3_2]
      L5_2 = GetHashKey
      L6_2 = "WEAPON_UNARMED"
      L5_2 = L5_2(L6_2)
      if L3_2 ~= L5_2 then
        L5_2 = L4_2.name
        L6_2 = L5_2
        L5_2 = L5_2.upper
        L5_2 = L5_2(L6_2)
        L4_2.name = L5_2
        L5_2 = Config
        L5_2 = L5_2.WeaponAttachments
        L6_2 = L4_2.name
        L5_2 = L5_2[L6_2]
        if nil ~= L5_2 then
          L5_2 = Config
          L5_2 = L5_2.WeaponAttachments
          L6_2 = L4_2.name
          L5_2 = L5_2[L6_2]
          L5_2 = L5_2[A1_2]
          if nil ~= L5_2 then
            L5_2 = Config
            L5_2 = L5_2.WeaponAttachments
            L6_2 = L4_2.name
            L5_2 = L5_2[L6_2]
            L5_2 = L5_2[A1_2]
            L5_2 = L5_2.item
            L6_2 = A0_2.name
            if L5_2 == L6_2 then
              L5_2 = TriggerServerEvent
              L6_2 = "weapons:server:EquipAttachment"
              L7_2 = A0_2
              L8_2 = L15_1
              L9_2 = Config
              L9_2 = L9_2.WeaponAttachments
              L10_2 = L4_2.name
              L9_2 = L9_2[L10_2]
              L9_2 = L9_2[A1_2]
              L5_2(L6_2, L7_2, L8_2, L9_2)
          end
          else
            L5_2 = SendTextMessage
            L6_2 = Lang
            L7_2 = "WEAPON_INVALID_ATTACHMENT"
            L6_2 = L6_2(L7_2)
            L7_2 = "error"
            L5_2(L6_2, L7_2)
          end
        end
      else
        L5_2 = SendTextMessage
        L6_2 = Lang
        L7_2 = "WEAPON_INVALID"
        L6_2 = L6_2(L7_2)
        L7_2 = "error"
        L5_2(L6_2, L7_2)
      end
    end
  end
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "addAttachment"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "addAttachment"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = Config
  L2_2 = L2_2.Framework
  if "ESX" == L2_2 then
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = GetSelectedPedWeapon
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = QS
    L4_2 = L4_2.Shared
    L4_2 = L4_2.Weapons
    L4_2 = L4_2[L3_2]
    if "weaponcolor1" == A0_2 or "weaponcolor2" == A0_2 or "weaponcolor3" == A0_2 or "weaponcolor4" == A0_2 or "weaponcolor5" == A0_2 or "weaponcolor6" == A0_2 or "weaponcolor7" == A0_2 or "weaponcolor1" == A0_2 or "weaponcolor2" == A0_2 or "weaponcolor3" == A0_2 or "weaponcolor4" == A0_2 or "weaponcolor5" == A0_2 or "weaponcolor6" == A0_2 or "weaponcolor7" == A0_2 or "weaponcolor8" == A0_2 or "weaponcolor9" == A0_2 or "weaponcolor10" == A0_2 or "weaponcolor11" == A0_2 or "weaponcolor12" == A0_2 or "weaponcolor13" == A0_2 or "weaponcolor14" == A0_2 or "weaponcolor15" == A0_2 or "weaponcolor16" == A0_2 or "weaponcolor17" == A0_2 or "weaponcolor18" == A0_2 or "weaponcolor19" == A0_2 or "weaponcolor20" == A0_2 or "weaponcolor21" == A0_2 or "weaponcolor22" == A0_2 or "weaponcolor23" == A0_2 or "weaponcolor24" == A0_2 or "weaponcolor25" == A0_2 or "weaponcolor26" == A0_2 or "weaponcolor27" == A0_2 or "weaponcolor28" == A0_2 or "weaponcolor29" == A0_2 or "weaponcolor30" == A0_2 or "weaponcolor31" == A0_2 then
      L5_2 = GetAttachmentColorNoText
      L6_2 = A0_2
      L5_2 = L5_2(L6_2)
      L6_2 = SetPedWeaponTintIndex
      L7_2 = L2_2
      L8_2 = L3_2
      L9_2 = tonumber
      L10_2 = L5_2
      L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    elseif "weapontinturlattach" == A0_2 then
      L5_2 = 1
      L6_2 = Config
      L6_2 = L6_2.WeaponTints
      L6_2 = #L6_2
      L7_2 = 1
      for L8_2 = L5_2, L6_2, L7_2 do
        L9_2 = tostring
        L10_2 = L3_2
        L9_2 = L9_2(L10_2)
        L10_2 = Config
        L10_2 = L10_2.WeaponTints
        L10_2 = L10_2[L8_2]
        L10_2 = L10_2.hash
        if L9_2 == L10_2 then
          L9_2 = CreateRuntimeTxd
          L10_2 = Config
          L10_2 = L10_2.WeaponTints
          L10_2 = L10_2[L8_2]
          L10_2 = L10_2.name
          L9_2 = L9_2(L10_2)
          txd = L9_2
          L9_2 = CreateDui
          L10_2 = A1_2
          L11_2 = 250
          L12_2 = 250
          L9_2 = L9_2(L10_2, L11_2, L12_2)
          duiObj = L9_2
          L9_2 = GetDuiHandle
          L10_2 = duiObj
          L9_2 = L9_2(L10_2)
          dui = L9_2
          L9_2 = CreateRuntimeTextureFromDuiHandle
          L10_2 = txd
          L11_2 = "skin"
          L12_2 = dui
          L9_2 = L9_2(L10_2, L11_2, L12_2)
          tx = L9_2
          L9_2 = AddReplaceTexture
          L10_2 = Config
          L10_2 = L10_2.WeaponTints
          L10_2 = L10_2[L8_2]
          L10_2 = L10_2.ytd
          L11_2 = Config
          L11_2 = L11_2.WeaponTints
          L11_2 = L11_2[L8_2]
          L11_2 = L11_2.texture
          L12_2 = Config
          L12_2 = L12_2.WeaponTints
          L12_2 = L12_2[L8_2]
          L12_2 = L12_2.name
          L13_2 = "skin"
          L9_2(L10_2, L11_2, L12_2, L13_2)
          break
        end
      end
    else
      L5_2 = GiveWeaponComponentToPed
      L6_2 = L2_2
      L7_2 = GetHashKey
      L8_2 = L4_2.name
      L7_2 = L7_2(L8_2)
      L8_2 = GetHashKey
      L9_2 = A0_2
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    end
  else
    L2_2 = Config
    L2_2 = L2_2.Framework
    if "QBCore" == L2_2 then
      L2_2 = PlayerPedId
      L2_2 = L2_2()
      L3_2 = GetSelectedPedWeapon
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = QBCore
      L4_2 = L4_2.Shared
      L4_2 = L4_2.Weapons
      L4_2 = L4_2[L3_2]
      if "weaponcolor1" == A0_2 or "weaponcolor2" == A0_2 or "weaponcolor3" == A0_2 or "weaponcolor4" == A0_2 or "weaponcolor5" == A0_2 or "weaponcolor6" == A0_2 or "weaponcolor7" == A0_2 or "weaponcolor1" == A0_2 or "weaponcolor2" == A0_2 or "weaponcolor3" == A0_2 or "weaponcolor4" == A0_2 or "weaponcolor5" == A0_2 or "weaponcolor6" == A0_2 or "weaponcolor7" == A0_2 or "weaponcolor8" == A0_2 or "weaponcolor9" == A0_2 or "weaponcolor10" == A0_2 or "weaponcolor11" == A0_2 or "weaponcolor12" == A0_2 or "weaponcolor13" == A0_2 or "weaponcolor14" == A0_2 or "weaponcolor15" == A0_2 or "weaponcolor16" == A0_2 or "weaponcolor17" == A0_2 or "weaponcolor18" == A0_2 or "weaponcolor19" == A0_2 or "weaponcolor20" == A0_2 or "weaponcolor21" == A0_2 or "weaponcolor22" == A0_2 or "weaponcolor23" == A0_2 or "weaponcolor24" == A0_2 or "weaponcolor25" == A0_2 or "weaponcolor26" == A0_2 or "weaponcolor27" == A0_2 or "weaponcolor28" == A0_2 or "weaponcolor29" == A0_2 or "weaponcolor30" == A0_2 or "weaponcolor31" == A0_2 then
        L5_2 = GetAttachmentColorNoText
        L6_2 = A0_2
        L5_2 = L5_2(L6_2)
        L6_2 = SetPedWeaponTintIndex
        L7_2 = L2_2
        L8_2 = L3_2
        L9_2 = tonumber
        L10_2 = L5_2
        L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      elseif "weapontinturlattach" == A0_2 then
        L5_2 = 1
        L6_2 = Config
        L6_2 = L6_2.WeaponTints
        L6_2 = #L6_2
        L7_2 = 1
        for L8_2 = L5_2, L6_2, L7_2 do
          L9_2 = tostring
          L10_2 = L3_2
          L9_2 = L9_2(L10_2)
          L10_2 = Config
          L10_2 = L10_2.WeaponTints
          L10_2 = L10_2[L8_2]
          L10_2 = L10_2.hash
          if L9_2 == L10_2 then
            L9_2 = CreateRuntimeTxd
            L10_2 = Config
            L10_2 = L10_2.WeaponTints
            L10_2 = L10_2[L8_2]
            L10_2 = L10_2.name
            L9_2 = L9_2(L10_2)
            txd = L9_2
            L9_2 = CreateDui
            L10_2 = A1_2
            L11_2 = 250
            L12_2 = 250
            L9_2 = L9_2(L10_2, L11_2, L12_2)
            duiObj = L9_2
            L9_2 = GetDuiHandle
            L10_2 = duiObj
            L9_2 = L9_2(L10_2)
            dui = L9_2
            L9_2 = CreateRuntimeTextureFromDuiHandle
            L10_2 = txd
            L11_2 = "skin"
            L12_2 = dui
            L9_2 = L9_2(L10_2, L11_2, L12_2)
            tx = L9_2
            L9_2 = AddReplaceTexture
            L10_2 = Config
            L10_2 = L10_2.WeaponTints
            L10_2 = L10_2[L8_2]
            L10_2 = L10_2.ytd
            L11_2 = Config
            L11_2 = L11_2.WeaponTints
            L11_2 = L11_2[L8_2]
            L11_2 = L11_2.texture
            L12_2 = Config
            L12_2 = L12_2.WeaponTints
            L12_2 = L12_2[L8_2]
            L12_2 = L12_2.name
            L13_2 = "skin"
            L9_2(L10_2, L11_2, L12_2, L13_2)
            break
          end
        end
      else
        L5_2 = GiveWeaponComponentToPed
        L6_2 = L2_2
        L7_2 = GetHashKey
        L8_2 = L4_2.name
        L7_2 = L7_2(L8_2)
        L8_2 = GetHashKey
        L9_2 = A0_2
        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      end
    end
  end
end
L25_1(L26_1, L27_1)
L25_1 = _ENV
L26_1 = "GetAttachmentColorNoText"
function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = A0_2
  L3_2 = "weaponcolor"
  L4_2 = ""
  return L1_2(L2_2, L3_2, L4_2)
end
L25_1[L26_1] = L27_1
L25_1 = RegisterNetEvent
L26_1 = "weapons:client:ConfigureTint"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "weapons:client:ConfigureTint"
function L27_1(A0_2)
  local L1_2, L2_2, L3_2
  L16_1 = A0_2
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.message = "showtintmenu"
  L1_2(L2_2)
end
L25_1(L26_1, L27_1)
L25_1 = _ENV
L26_1 = "closeGui"
function L27_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.message = "hide"
  L0_2(L1_2)
end
L25_1[L26_1] = L27_1
L25_1 = RegisterNUICallback
L26_1 = "quit"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = closeGui
  L2_2()
  L2_2 = {}
  L16_1 = L2_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNUICallback
L26_1 = "addtinturl"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = closeGui
  L2_2()
  L2_2 = SendTextMessage
  L3_2 = Lang
  L4_2 = "WEAPON_TINT_URL"
  L3_2 = L3_2(L4_2)
  L4_2 = A0_2.urldatatint
  L5_2 = ""
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = "success"
  L2_2(L3_2, L4_2)
  L2_2 = tostring
  L3_2 = A0_2.urldatatint
  L2_2 = L2_2(L3_2)
  L3_2 = TriggerServerEvent
  L4_2 = "weapons:server:AddUrlTint"
  L5_2 = L16_1
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = Citizen
  L3_2 = L3_2.Wait
  L4_2 = 5
  L3_2(L4_2)
  L3_2 = {}
  L16_1 = L3_2
  L3_2 = A1_2
  L4_2 = "ok"
  L3_2(L4_2)
end
L25_1(L26_1, L27_1)
L25_1 = RegisterNetEvent
L26_1 = "qs-inventory:sendMessage"
L25_1(L26_1)
L25_1 = AddEventHandler
L26_1 = "qs-inventory:sendMessage"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendTextMessage
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L25_1(L26_1, L27_1)
L25_1 = _ENV
L26_1 = "Lang"
function L27_1(A0_2)
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
L25_1[L26_1] = L27_1
L25_1 = RegisterNUICallback
L26_1 = "GetLangData"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = {}
  L4_2 = Config
  L4_2 = L4_2.Languages
  L3_2.table = L4_2
  L4_2 = Config
  L4_2 = L4_2.Language
  L3_2.current = L4_2
  L2_2(L3_2)
end
L25_1(L26_1, L27_1)
L25_1 = _ENV
L26_1 = "Config"
L25_1 = L25_1[L26_1]
L26_1 = "FreezeGarbages"
L25_1 = L25_1[L26_1]
if L25_1 then
  L25_1 = _ENV
  L26_1 = "Citizen"
  L25_1 = L25_1[L26_1]
  L26_1 = "CreateThread"
  L25_1 = L25_1[L26_1]
  function L26_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
    while true do
      L0_2 = PlayerPedId
      L0_2 = L0_2()
      L1_2 = GetEntityCoords
      L2_2 = L0_2
      L1_2 = L1_2(L2_2)
      L2_2 = pairs
      L3_2 = Config
      L3_2 = L3_2.GarbageProps
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = GetClosestObjectOfType
        L9_2 = L1_2.x
        L10_2 = L1_2.y
        L11_2 = L1_2.z
        L12_2 = 50.0
        L13_2 = L6_2
        L14_2 = 0
        L15_2 = 0
        L16_2 = 0
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        L9_2 = DoesEntityExist
        L10_2 = L8_2
        L9_2 = L9_2(L10_2)
        if L9_2 then
          L9_2 = IsEntityPositionFrozen
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          if not L9_2 then
            L9_2 = FreezeEntityPosition
            L10_2 = L8_2
            L11_2 = true
            L9_2(L10_2, L11_2)
          end
        end
      end
      L2_2 = Citizen
      L2_2 = L2_2.Wait
      L3_2 = 750
      L2_2(L3_2)
    end
  end
  L25_1(L26_1)
end
L25_1 = _ENV
L26_1 = "Citizen"
L25_1 = L25_1[L26_1]
L26_1 = "CreateThread"
L25_1 = L25_1[L26_1]
function L26_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = Config
  L0_2 = L0_2.WeaponRepairPoints
  if L0_2 then
    L0_2 = pairs
    L1_2 = Config
    L1_2 = L1_2.WeaponRepairPoints
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = L5_2.blip
      if L6_2 then
        L6_2 = AddBlipForCoord
        L7_2 = L5_2.coords
        L7_2 = L7_2.x
        L8_2 = L5_2.coords
        L8_2 = L8_2.y
        L9_2 = L5_2.coords
        L9_2 = L9_2.z
        L6_2 = L6_2(L7_2, L8_2, L9_2)
        L7_2 = SetBlipSprite
        L8_2 = L6_2
        L9_2 = L5_2.blip
        L9_2 = L9_2.id
        if not L9_2 then
          L9_2 = 1
        end
        L7_2(L8_2, L9_2)
        L7_2 = SetBlipDisplay
        L8_2 = L6_2
        L9_2 = 4
        L7_2(L8_2, L9_2)
        L7_2 = SetBlipScale
        L8_2 = L6_2
        L9_2 = L5_2.blip
        L9_2 = L9_2.scale
        if not L9_2 then
          L9_2 = 0.5
        end
        L7_2(L8_2, L9_2)
        L7_2 = SetBlipColour
        L8_2 = L6_2
        L9_2 = L5_2.blip
        L9_2 = L9_2.color
        if not L9_2 then
          L9_2 = 1
        end
        L7_2(L8_2, L9_2)
        L7_2 = SetBlipAsShortRange
        L8_2 = L6_2
        L9_2 = true
        L7_2(L8_2, L9_2)
        L7_2 = BeginTextCommandSetBlipName
        L8_2 = "STRING"
        L7_2(L8_2)
        L7_2 = AddTextComponentString
        L8_2 = L5_2.blip
        L8_2 = L8_2.title
        if not L8_2 then
          L8_2 = "Store"
        end
        L7_2(L8_2)
        L7_2 = EndTextCommandSetBlipName
        L8_2 = L6_2
        L7_2(L8_2)
      end
    end
  end
end
L25_1(L26_1)
