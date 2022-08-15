local L0_1, L1_1, L2_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = Citizen
  L1_2 = L1_2.CreateThread
  function L2_2()
    local L0_3, L1_3
    Cooldown = true
    L0_3 = Wait
    L1_3 = A0_2
    L0_3(L1_3)
    Cooldown = false
  end
  L1_2(L2_2)
end
IncurCooldown = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = {}
  L3_2 = pairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2 in L3_2, L4_2, L5_2, L6_2 do
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L2_2
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
  L3_2 = table
  L3_2 = L3_2.sort
  L4_2 = L2_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
  L3_2 = 0
  function L4_2()
    local L0_3, L1_3, L2_3
    L0_3 = L3_2
    L0_3 = L0_3 + 1
    L3_2 = L0_3
    L1_3 = L3_2
    L0_3 = L2_2
    L0_3 = L0_3[L1_3]
    if nil == L0_3 then
      L0_3 = nil
      return L0_3
    else
      L1_3 = L3_2
      L0_3 = L2_2
      L0_3 = L0_3[L1_3]
      L2_3 = L3_2
      L1_3 = L2_2
      L2_3 = L1_3[L2_3]
      L1_3 = A0_2
      L1_3 = L1_3[L2_3]
      return L0_3, L1_3
    end
  end
  return L4_2
end
PairsKeys = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2
  L1_2 = A0_2.gsub
  L3_2 = "^%l"
  L4_2 = string
  L4_2 = L4_2.upper
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  return L1_2
end
FirstUpper = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetHashKey
  L2_2 = "mp_m_freemode_01"
  L1_2 = L1_2(L2_2)
  L2_2 = GetHashKey
  L3_2 = "mp_f_freemode_01"
  L2_2 = L2_2(L3_2)
  L3_2 = GetEntityModel
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == L1_2 then
    L4_2 = "Male"
    return L4_2
  elseif L3_2 == L2_2 then
    L4_2 = "Female"
    return L4_2
  else
    L4_2 = false
    return L4_2
  end
end
IsMpPed = L0_1
L0_1 = RegisterNetEvent
L1_1 = "inventory:EquipLast"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "inventory:EquipLast"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = pairs
  L2_2 = LastEquipped
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if L6_2 then
      L7_2 = L6_2.Drawable
      if L7_2 then
        L7_2 = SetPedComponentVariation
        L8_2 = L0_2
        L9_2 = L6_2.ID
        L10_2 = L6_2.Drawable
        L11_2 = L6_2.Texture
        L12_2 = 0
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      else
        L7_2 = L6_2.Prop
        if L7_2 then
          L7_2 = ClearPedProp
          L8_2 = L0_2
          L9_2 = L6_2.ID
          L7_2(L8_2, L9_2)
          L7_2 = SetPedPropIndex
          L8_2 = L0_2
          L9_2 = L6_2.ID
          L10_2 = L6_2.Prop
          L11_2 = L6_2.Texture
          L12_2 = true
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
        end
      end
    end
  end
  L1_2 = {}
  LastEquipped = L1_2
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "inventory:Menu"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "inventory:Menu"
function L2_1(A0_2)
  local L1_2, L2_2
  MenuOpened = A0_2
  L1_2 = MenuOpened
  if L1_2 then
    L1_2 = SoundPlay
    L2_2 = "Open"
    L1_2(L2_2)
  else
    L1_2 = SoundPlay
    L2_2 = "Close"
    L1_2(L2_2)
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2
  L5_2 = Variations
  L5_2 = L5_2[A0_2]
  L5_2 = L5_2[A1_2]
  if not A4_2 then
    L5_2[A2_2] = A3_2
    L5_2[A3_2] = A2_2
  else
    L5_2[A2_2] = A3_2
  end
end
AddNewVariation = L0_1
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = Wait
  L1_2 = 2000
  L0_2(L1_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 9
  L4_2 = 10
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 18
  L4_2 = 67
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 82
  L4_2 = 67
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 44
  L4_2 = 45
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 50
  L4_2 = 68
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 51
  L4_2 = 69
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 52
  L4_2 = 70
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 53
  L4_2 = 71
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 62
  L4_2 = 72
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 65
  L4_2 = 66
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 73
  L4_2 = 74
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 76
  L4_2 = 77
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 79
  L4_2 = 78
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 80
  L4_2 = 81
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 91
  L4_2 = 92
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 104
  L4_2 = 105
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 109
  L4_2 = 110
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 116
  L4_2 = 117
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 118
  L4_2 = 119
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 123
  L4_2 = 124
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 125
  L4_2 = 126
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 127
  L4_2 = 128
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Male"
  L3_2 = 130
  L4_2 = 131
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 43
  L4_2 = 44
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 49
  L4_2 = 67
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 64
  L4_2 = 65
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 65
  L4_2 = 64
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 51
  L4_2 = 69
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 50
  L4_2 = 68
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 52
  L4_2 = 70
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 62
  L4_2 = 71
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 72
  L4_2 = 73
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 75
  L4_2 = 76
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 78
  L4_2 = 77
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 79
  L4_2 = 80
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 18
  L4_2 = 66
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 66
  L4_2 = 81
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 81
  L4_2 = 66
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 86
  L4_2 = 84
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 90
  L4_2 = 91
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 103
  L4_2 = 104
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 108
  L4_2 = 109
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 115
  L4_2 = 116
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 117
  L4_2 = 118
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 122
  L4_2 = 123
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 124
  L4_2 = 125
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 126
  L4_2 = 127
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Visor"
  L2_2 = "Female"
  L3_2 = 129
  L4_2 = 130
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Bags"
  L2_2 = "Male"
  L3_2 = 45
  L4_2 = 44
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Bags"
  L2_2 = "Male"
  L3_2 = 41
  L4_2 = 40
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Bags"
  L2_2 = "Female"
  L3_2 = 45
  L4_2 = 44
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Bags"
  L2_2 = "Female"
  L3_2 = 41
  L4_2 = 40
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 7
  L4_2 = 15
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 43
  L4_2 = 15
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 9
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 11
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 15
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 16
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 17
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 20
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 22
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 45
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 47
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 49
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 51
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 52
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 53
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 56
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Male"
  L3_2 = 58
  L4_2 = 43
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 1
  L4_2 = 49
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 2
  L4_2 = 49
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 7
  L4_2 = 49
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 9
  L4_2 = 49
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 10
  L4_2 = 49
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 11
  L4_2 = 48
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 14
  L4_2 = 53
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 15
  L4_2 = 42
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 21
  L4_2 = 42
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 23
  L4_2 = 42
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 31
  L4_2 = 53
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 39
  L4_2 = 49
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 40
  L4_2 = 49
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 42
  L4_2 = 53
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 45
  L4_2 = 49
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 48
  L4_2 = 49
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 49
  L4_2 = 48
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 52
  L4_2 = 53
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 53
  L4_2 = 42
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 54
  L4_2 = 55
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 59
  L4_2 = 42
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 59
  L4_2 = 54
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 68
  L4_2 = 53
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Hair"
  L2_2 = "Female"
  L3_2 = 76
  L4_2 = 48
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 29
  L4_2 = 30
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 31
  L4_2 = 32
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 42
  L4_2 = 43
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 68
  L4_2 = 69
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 74
  L4_2 = 75
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 87
  L4_2 = 88
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 99
  L4_2 = 100
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 101
  L4_2 = 102
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 103
  L4_2 = 104
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 126
  L4_2 = 127
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 129
  L4_2 = 130
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 184
  L4_2 = 185
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 188
  L4_2 = 189
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 194
  L4_2 = 195
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 196
  L4_2 = 197
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 198
  L4_2 = 199
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 200
  L4_2 = 203
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 202
  L4_2 = 205
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 206
  L4_2 = 207
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 210
  L4_2 = 211
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 217
  L4_2 = 218
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 229
  L4_2 = 230
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 232
  L4_2 = 233
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 251
  L4_2 = 253
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 256
  L4_2 = 261
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 262
  L4_2 = 263
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 265
  L4_2 = 266
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 267
  L4_2 = 268
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Male"
  L3_2 = 279
  L4_2 = 280
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 53
  L4_2 = 52
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 57
  L4_2 = 58
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 62
  L4_2 = 63
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 90
  L4_2 = 91
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 92
  L4_2 = 93
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 94
  L4_2 = 95
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 187
  L4_2 = 186
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 190
  L4_2 = 191
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 196
  L4_2 = 197
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 198
  L4_2 = 199
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 200
  L4_2 = 201
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 202
  L4_2 = 205
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 204
  L4_2 = 207
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 210
  L4_2 = 211
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 214
  L4_2 = 215
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 227
  L4_2 = 228
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 239
  L4_2 = 240
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 242
  L4_2 = 243
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 259
  L4_2 = 261
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 265
  L4_2 = 270
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 271
  L4_2 = 272
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 274
  L4_2 = 275
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 276
  L4_2 = 277
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = AddNewVariation
  L1_2 = "Jackets"
  L2_2 = "Female"
  L3_2 = 292
  L4_2 = 293
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
L0_1(L1_1)
L0_1 = {}
L1_1 = {}
L2_1 = {}
L1_1.Male = L2_1
L2_1 = {}
L1_1.Female = L2_1
L0_1.Jackets = L1_1
L1_1 = {}
L2_1 = {}
L1_1.Male = L2_1
L2_1 = {}
L1_1.Female = L2_1
L0_1.Hair = L1_1
L1_1 = {}
L2_1 = {}
L1_1.Male = L2_1
L2_1 = {}
L1_1.Female = L2_1
L0_1.Bags = L1_1
L1_1 = {}
L2_1 = {}
L1_1.Male = L2_1
L2_1 = {}
L1_1.Female = L2_1
L0_1.Visor = L1_1
L1_1 = {}
L2_1 = {}
L2_1[16] = 4
L2_1[17] = 4
L2_1[18] = 4
L2_1[19] = 0
L2_1[20] = 1
L2_1[21] = 2
L2_1[22] = 4
L2_1[23] = 5
L2_1[24] = 6
L2_1[25] = 8
L2_1[26] = 11
L2_1[27] = 12
L2_1[28] = 14
L2_1[29] = 15
L2_1[30] = 0
L2_1[31] = 1
L2_1[32] = 2
L2_1[33] = 4
L2_1[34] = 5
L2_1[35] = 6
L2_1[36] = 8
L2_1[37] = 11
L2_1[38] = 12
L2_1[39] = 14
L2_1[40] = 15
L2_1[41] = 0
L2_1[42] = 1
L2_1[43] = 2
L2_1[44] = 4
L2_1[45] = 5
L2_1[46] = 6
L2_1[47] = 8
L2_1[48] = 11
L2_1[49] = 12
L2_1[50] = 14
L2_1[51] = 15
L2_1[52] = 0
L2_1[53] = 1
L2_1[54] = 2
L2_1[55] = 4
L2_1[56] = 5
L2_1[57] = 6
L2_1[58] = 8
L2_1[59] = 11
L2_1[60] = 12
L2_1[61] = 14
L2_1[62] = 15
L2_1[63] = 0
L2_1[64] = 1
L2_1[65] = 2
L2_1[66] = 4
L2_1[67] = 5
L2_1[68] = 6
L2_1[69] = 8
L2_1[70] = 11
L2_1[71] = 12
L2_1[72] = 14
L2_1[73] = 15
L2_1[74] = 0
L2_1[75] = 1
L2_1[76] = 2
L2_1[77] = 4
L2_1[78] = 5
L2_1[79] = 6
L2_1[80] = 8
L2_1[81] = 11
L2_1[82] = 12
L2_1[83] = 14
L2_1[84] = 15
L2_1[85] = 0
L2_1[86] = 1
L2_1[87] = 2
L2_1[88] = 4
L2_1[89] = 5
L2_1[90] = 6
L2_1[91] = 8
L2_1[92] = 11
L2_1[93] = 12
L2_1[94] = 14
L2_1[95] = 15
L2_1[96] = 4
L2_1[97] = 4
L2_1[98] = 4
L2_1[99] = 0
L2_1[100] = 1
L2_1[101] = 2
L2_1[102] = 4
L2_1[103] = 5
L2_1[104] = 6
L2_1[105] = 8
L2_1[106] = 11
L2_1[107] = 12
L2_1[108] = 14
L2_1[109] = 15
L2_1[110] = 4
L2_1[111] = 4
L2_1[115] = 112
L2_1[116] = 112
L2_1[117] = 112
L2_1[118] = 112
L2_1[119] = 112
L2_1[120] = 112
L2_1[121] = 112
L2_1[122] = 113
L2_1[123] = 113
L2_1[124] = 113
L2_1[125] = 113
L2_1[126] = 113
L2_1[127] = 113
L2_1[128] = 113
L2_1[129] = 114
L2_1[130] = 114
L2_1[131] = 114
L2_1[132] = 114
L2_1[133] = 114
L2_1[134] = 114
L2_1[135] = 114
L2_1[136] = 15
L2_1[137] = 15
L2_1[138] = 0
L2_1[139] = 1
L2_1[140] = 2
L2_1[141] = 4
L2_1[142] = 5
L2_1[143] = 6
L2_1[144] = 8
L2_1[145] = 11
L2_1[146] = 12
L2_1[147] = 14
L2_1[148] = 112
L2_1[149] = 113
L2_1[150] = 114
L2_1[151] = 0
L2_1[152] = 1
L2_1[153] = 2
L2_1[154] = 4
L2_1[155] = 5
L2_1[156] = 6
L2_1[157] = 8
L2_1[158] = 11
L2_1[159] = 12
L2_1[160] = 14
L2_1[161] = 112
L2_1[162] = 113
L2_1[163] = 114
L2_1[165] = 4
L2_1[166] = 4
L2_1[167] = 4
L1_1.Male = L2_1
L2_1 = {}
L2_1[16] = 11
L2_1[17] = 3
L2_1[18] = 3
L2_1[19] = 3
L2_1[20] = 0
L2_1[21] = 1
L2_1[22] = 2
L2_1[23] = 3
L2_1[24] = 4
L2_1[25] = 5
L2_1[26] = 6
L2_1[27] = 7
L2_1[28] = 9
L2_1[29] = 11
L2_1[30] = 12
L2_1[31] = 14
L2_1[32] = 15
L2_1[33] = 0
L2_1[34] = 1
L2_1[35] = 2
L2_1[36] = 3
L2_1[37] = 4
L2_1[38] = 5
L2_1[39] = 6
L2_1[40] = 7
L2_1[41] = 9
L2_1[42] = 11
L2_1[43] = 12
L2_1[44] = 14
L2_1[45] = 15
L2_1[46] = 0
L2_1[47] = 1
L2_1[48] = 2
L2_1[49] = 3
L2_1[50] = 4
L2_1[51] = 5
L2_1[52] = 6
L2_1[53] = 7
L2_1[54] = 9
L2_1[55] = 11
L2_1[56] = 12
L2_1[57] = 14
L2_1[58] = 15
L2_1[59] = 0
L2_1[60] = 1
L2_1[61] = 2
L2_1[62] = 3
L2_1[63] = 4
L2_1[64] = 5
L2_1[65] = 6
L2_1[66] = 7
L2_1[67] = 9
L2_1[68] = 11
L2_1[69] = 12
L2_1[70] = 14
L2_1[71] = 15
L2_1[72] = 0
L2_1[73] = 1
L2_1[74] = 2
L2_1[75] = 3
L2_1[76] = 4
L2_1[77] = 5
L2_1[78] = 6
L2_1[79] = 7
L2_1[80] = 9
L2_1[81] = 11
L2_1[82] = 12
L2_1[83] = 14
L2_1[84] = 15
L2_1[85] = 0
L2_1[86] = 1
L2_1[87] = 2
L2_1[88] = 3
L2_1[89] = 4
L2_1[90] = 5
L2_1[91] = 6
L2_1[92] = 7
L2_1[93] = 9
L2_1[94] = 11
L2_1[95] = 12
L2_1[96] = 14
L2_1[97] = 15
L2_1[98] = 0
L2_1[99] = 1
L2_1[100] = 2
L2_1[101] = 3
L2_1[102] = 4
L2_1[103] = 5
L2_1[104] = 6
L2_1[105] = 7
L2_1[106] = 9
L2_1[107] = 11
L2_1[108] = 12
L2_1[109] = 14
L2_1[110] = 15
L2_1[111] = 3
L2_1[112] = 3
L2_1[113] = 3
L2_1[114] = 0
L2_1[115] = 1
L2_1[116] = 2
L2_1[117] = 3
L2_1[118] = 4
L2_1[119] = 5
L2_1[120] = 6
L2_1[121] = 7
L2_1[122] = 9
L2_1[123] = 11
L2_1[124] = 12
L2_1[125] = 14
L2_1[126] = 15
L2_1[127] = 3
L2_1[128] = 3
L2_1[132] = 129
L2_1[133] = 129
L2_1[134] = 129
L2_1[135] = 129
L2_1[136] = 129
L2_1[137] = 129
L2_1[138] = 129
L2_1[139] = 130
L2_1[140] = 130
L2_1[141] = 130
L2_1[142] = 130
L2_1[143] = 130
L2_1[144] = 130
L2_1[145] = 130
L2_1[146] = 131
L2_1[147] = 131
L2_1[148] = 131
L2_1[149] = 131
L2_1[150] = 131
L2_1[151] = 131
L2_1[152] = 131
L2_1[154] = 153
L2_1[155] = 153
L2_1[156] = 153
L2_1[157] = 153
L2_1[158] = 153
L2_1[159] = 153
L2_1[160] = 153
L2_1[162] = 161
L2_1[163] = 161
L2_1[164] = 161
L2_1[165] = 161
L2_1[166] = 161
L2_1[167] = 161
L2_1[168] = 161
L2_1[169] = 15
L2_1[170] = 15
L2_1[171] = 0
L2_1[172] = 1
L2_1[173] = 2
L2_1[174] = 3
L2_1[175] = 4
L2_1[176] = 5
L2_1[177] = 6
L2_1[178] = 7
L2_1[179] = 9
L2_1[180] = 11
L2_1[181] = 12
L2_1[182] = 14
L2_1[183] = 129
L2_1[184] = 130
L2_1[185] = 131
L2_1[186] = 153
L2_1[187] = 0
L2_1[188] = 1
L2_1[189] = 2
L2_1[190] = 3
L2_1[191] = 4
L2_1[192] = 5
L2_1[193] = 6
L2_1[194] = 7
L2_1[195] = 9
L2_1[196] = 11
L2_1[197] = 12
L2_1[198] = 14
L2_1[199] = 129
L2_1[200] = 130
L2_1[201] = 131
L2_1[202] = 153
L2_1[203] = 161
L2_1[204] = 161
L2_1[206] = 3
L2_1[207] = 3
L2_1[208] = 3
L1_1.Female = L2_1
L0_1.Gloves = L1_1
Variations = L0_1
L0_1 = {}
LastEquipped = L0_1
Cooldown = false
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  while true do
    L3_2 = HasAnimDictLoaded
    L4_2 = A0_2.Dict
    L3_2 = L3_2(L4_2)
    if L3_2 then
      break
    end
    L3_2 = RequestAnimDict
    L4_2 = A0_2.Dict
    L3_2(L4_2)
    L3_2 = Wait
    L4_2 = 100
    L3_2(L4_2)
  end
  L3_2 = IsPedInAnyVehicle
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    A0_2.Move = 51
  end
  L3_2 = TaskPlayAnim
  L4_2 = L2_2
  L5_2 = A0_2.Dict
  L6_2 = A0_2.Anim
  L7_2 = 3.0
  L8_2 = 3.0
  L9_2 = A0_2.Dur
  L10_2 = A0_2.Move
  L11_2 = 0
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L3_2 = A0_2.Dur
  L3_2 = L3_2 - 500
  L4_2 = 500
  if L3_2 < L4_2 then
    L3_2 = 500
  end
  L4_2 = IncurCooldown
  L5_2 = L3_2
  L4_2(L5_2)
  L4_2 = Wait
  L5_2 = L3_2
  L4_2(L5_2)
  L4_2 = A1_2
  L4_2()
end
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = Cooldown
  if L2_2 then
    return
  end
  L2_2 = Config
  L2_2 = L2_2.Drawables
  L2_2 = L2_2[A0_2]
  if A1_2 then
    L3_2 = Extras
    L2_2 = L3_2[A0_2]
  end
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = {}
  L5_2 = GetPedDrawableVariation
  L6_2 = L3_2
  L7_2 = L2_2.Drawable
  L5_2 = L5_2(L6_2, L7_2)
  L4_2.Drawable = L5_2
  L5_2 = L2_2.Drawable
  L4_2.Id = L5_2
  L4_2.Ped = L3_2
  L5_2 = GetPedTextureVariation
  L6_2 = L3_2
  L7_2 = L2_2.Drawable
  L5_2 = L5_2(L6_2, L7_2)
  L4_2.Texture = L5_2
  L5_2 = IsMpPed
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if "Mask" ~= A0_2 and not L5_2 then
    L6_2 = SendTextMessage
    L7_2 = Lang
    L8_2 = "NOW_ALLOWED_PED"
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L7_2(L8_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L6_2 = false
    return L6_2
  end
  L6_2 = L2_2.Table
  L6_2 = L6_2[L5_2]
  L7_2 = L2_2.Table
  L7_2 = L7_2.Standalone
  if not L7_2 then
    L7_2 = pairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = L2_2.Remember
      if not L13_2 then
        L13_2 = L4_2.Drawable
        if L11_2 == L13_2 then
          L13_2 = L0_1
          L14_2 = L2_2.Emote
          function L15_2()
            local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
            L0_3 = SetPedComponentVariation
            L1_3 = L3_2
            L2_3 = L2_2.Drawable
            L3_3 = L12_2
            L4_3 = L4_2.Texture
            L5_3 = 0
            L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
          end
          L13_2(L14_2, L15_2)
          L13_2 = true
          return L13_2
        end
      else
        L13_2 = LastEquipped
        L13_2 = L13_2[A0_2]
        if not L13_2 then
          L13_2 = L4_2.Drawable
          if L11_2 == L13_2 then
            L13_2 = L0_1
            L14_2 = L2_2.Emote
            function L15_2()
              local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
              L0_3 = LastEquipped
              L1_3 = A0_2
              L2_3 = L4_2
              L0_3[L1_3] = L2_3
              L0_3 = SetPedComponentVariation
              L1_3 = L3_2
              L2_3 = L2_2.Drawable
              L3_3 = L12_2
              L4_3 = L4_2.Texture
              L5_3 = 0
              L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
            end
            L13_2(L14_2, L15_2)
            L13_2 = true
            return L13_2
          end
        else
          L13_2 = LastEquipped
          L13_2 = L13_2[A0_2]
          L14_2 = L0_1
          L15_2 = L2_2.Emote
          function L16_2()
            local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
            L0_3 = SetPedComponentVariation
            L1_3 = L3_2
            L2_3 = L2_2.Drawable
            L3_3 = L13_2.Drawable
            L4_3 = L13_2.Texture
            L5_3 = 0
            L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
            L0_3 = LastEquipped
            L1_3 = A0_2
            L0_3[L1_3] = false
          end
          L14_2(L15_2, L16_2)
          L14_2 = true
          return L14_2
        end
      end
    end
    L7_2 = SendTextMessage
    L8_2 = Lang
    L9_2 = "NO_VARIANTS"
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L8_2(L9_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    return
  else
    L7_2 = LastEquipped
    L7_2 = L7_2[A0_2]
    if not L7_2 then
      L7_2 = L4_2.Drawable
      if L7_2 ~= L6_2 then
        L7_2 = L0_1
        L8_2 = L2_2.Emote
        function L9_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
          L0_3 = LastEquipped
          L1_3 = A0_2
          L2_3 = L4_2
          L0_3[L1_3] = L2_3
          L0_3 = SetPedComponentVariation
          L1_3 = L3_2
          L2_3 = L2_2.Drawable
          L3_3 = L6_2
          L4_3 = 0
          L5_3 = 0
          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
          L0_3 = L2_2.Table
          L0_3 = L0_3.Extra
          if L0_3 then
            L0_3 = L2_2.Table
            L0_3 = L0_3.Extra
            L1_3 = pairs
            L2_3 = L0_3
            L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
            for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
              L7_3 = {}
              L8_3 = GetPedDrawableVariation
              L9_3 = L3_2
              L10_3 = L6_3.Drawable
              L8_3 = L8_3(L9_3, L10_3)
              L7_3.Drawable = L8_3
              L8_3 = GetPedTextureVariation
              L9_3 = L3_2
              L10_3 = L6_3.Drawable
              L8_3 = L8_3(L9_3, L10_3)
              L7_3.Texture = L8_3
              L8_3 = L6_3.Drawable
              L7_3.Id = L8_3
              L8_3 = SetPedComponentVariation
              L9_3 = L3_2
              L10_3 = L6_3.Drawable
              L11_3 = L6_3.Id
              L12_3 = L6_3.Tex
              L13_3 = 0
              L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
              L8_3 = LastEquipped
              L9_3 = L6_3.Name
              L8_3[L9_3] = L7_3
            end
          end
        end
        L7_2(L8_2, L9_2)
        L7_2 = true
        return L7_2
      end
    else
      L7_2 = LastEquipped
      L7_2 = L7_2[A0_2]
      L8_2 = L0_1
      L9_2 = L2_2.Emote
      function L10_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
        L0_3 = SetPedComponentVariation
        L1_3 = L3_2
        L2_3 = L2_2.Drawable
        L3_3 = L7_2.Drawable
        L4_3 = L7_2.Texture
        L5_3 = 0
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
        L0_3 = LastEquipped
        L1_3 = A0_2
        L0_3[L1_3] = false
        L0_3 = L2_2.Table
        L0_3 = L0_3.Extra
        if L0_3 then
          L0_3 = L2_2.Table
          L0_3 = L0_3.Extra
          L1_3 = pairs
          L2_3 = L0_3
          L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
          for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
            L7_3 = LastEquipped
            L8_3 = L6_3.Name
            L7_3 = L7_3[L8_3]
            if L7_3 then
              L7_3 = LastEquipped
              L8_3 = L6_3.Name
              L7_3 = L7_3[L8_3]
              L8_3 = SetPedComponentVariation
              L9_3 = L3_2
              L10_3 = L7_3.Id
              L11_3 = L7_3.Drawable
              L12_3 = L7_3.Texture
              L13_3 = 0
              L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
              L8_3 = LastEquipped
              L9_3 = L6_3.Name
              L8_3[L9_3] = false
            end
          end
        end
      end
      L8_2(L9_2, L10_2)
      L8_2 = true
      return L8_2
    end
  end
  L7_2 = SendTextMessage
  L8_2 = Lang
  L9_2 = "ALREADY_WEARING"
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L8_2(L9_2)
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L7_2 = false
  return L7_2
end
ToggleClothing = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = Cooldown
  if L1_2 then
    return
  end
  L1_2 = Props
  L1_2 = L1_2[A0_2]
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = IsMpPed
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = {}
  L5_2 = L1_2.Prop
  L4_2.Id = L5_2
  L4_2.Ped = L2_2
  L5_2 = GetPedPropIndex
  L6_2 = L2_2
  L7_2 = L1_2.Prop
  L5_2 = L5_2(L6_2, L7_2)
  L4_2.Prop = L5_2
  L5_2 = GetPedPropTextureIndex
  L6_2 = L2_2
  L7_2 = L1_2.Prop
  L5_2 = L5_2(L6_2, L7_2)
  L4_2.Texture = L5_2
  L5_2 = L1_2.Variants
  if not L5_2 then
    L5_2 = L4_2.Prop
    if -1 ~= L5_2 then
      L5_2 = L0_1
      L6_2 = L1_2.Emote
      L6_2 = L6_2.Off
      function L7_2()
        local L0_3, L1_3, L2_3
        L0_3 = LastEquipped
        L1_3 = A0_2
        L2_3 = L4_2
        L0_3[L1_3] = L2_3
        L0_3 = ClearPedProp
        L1_3 = L2_2
        L2_3 = L1_2.Prop
        L0_3(L1_3, L2_3)
      end
      L5_2(L6_2, L7_2)
      L5_2 = true
      return L5_2
    else
      L5_2 = LastEquipped
      L5_2 = L5_2[A0_2]
      if L5_2 then
        L6_2 = L0_1
        L7_2 = L1_2.Emote
        L7_2 = L7_2.On
        function L8_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
          L0_3 = SetPedPropIndex
          L1_3 = L2_2
          L2_3 = L1_2.Prop
          L3_3 = L5_2.Prop
          L4_3 = L5_2.Texture
          L5_3 = true
          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
        end
        L6_2(L7_2, L8_2)
        L6_2 = LastEquipped
        L6_2[A0_2] = false
        L6_2 = true
        return L6_2
      end
    end
    L5_2 = SendTextMessage
    L6_2 = Lang
    L7_2 = "NOTHING_TO_REMOVE"
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L5_2 = false
    return L5_2
  else
    L5_2 = IsMpPed
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    if not L5_2 then
      L6_2 = SendTextMessage
      L7_2 = Lang
      L8_2 = "NOW_ALLOWED_PED"
      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L7_2(L8_2)
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      L6_2 = false
      return L6_2
    end
    L6_2 = L1_2.Variants
    L6_2 = L6_2[L5_2]
    L7_2 = pairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = L4_2.Prop
      if L13_2 == L11_2 then
        L13_2 = L0_1
        L14_2 = L1_2.Emote
        L14_2 = L14_2.On
        function L15_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
          L0_3 = SetPedPropIndex
          L1_3 = L2_2
          L2_3 = L1_2.Prop
          L3_3 = L12_2
          L4_3 = L4_2.Texture
          L5_3 = true
          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
        end
        L13_2(L14_2, L15_2)
        L13_2 = true
        return L13_2
      end
    end
    L7_2 = SendTextMessage
    L8_2 = Lang
    L9_2 = "NO_VARIANTS"
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L8_2(L9_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L7_2 = false
    return L7_2
  end
end
ToggleProps = L1_1
L1_1 = nil
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L1_1
  if not L1_2 then
    L1_2 = Citizen
    L1_2 = L1_2.CreateThread
    function L2_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
      L0_3 = true
      L1_1 = L0_3
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = Config
      L1_3 = L1_3.Drawables
      L2_3 = A0_2
      L1_3 = L1_3[L2_3]
      L2_3 = Props
      L3_3 = A0_2
      L2_3 = L2_3[L3_3]
      L3_3 = IsMpPed
      L4_3 = L0_3
      L3_3 = L3_3(L4_3)
      if L1_3 then
        L4_3 = L1_3.Table
        if L4_3 then
          L4_3 = type
          L5_3 = L1_3.Table
          L5_3 = L5_3[L3_3]
          L4_3 = L4_3(L5_3)
          if "table" == L4_3 then
            L4_3 = PairsKeys
            L5_3 = L1_3.Table
            L5_3 = L5_3[L3_3]
            L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
            for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
              L10_3 = SoundPlay
              L11_3 = "Open"
              L10_3(L11_3)
              L10_3 = SetPedComponentVariation
              L11_3 = L0_3
              L12_3 = L1_3.Drawable
              L13_3 = L8_3
              L14_3 = 0
              L15_3 = 0
              L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
              L10_3 = Wait
              L11_3 = 300
              L10_3(L11_3)
              L10_3 = SoundPlay
              L11_3 = "Close"
              L10_3(L11_3)
              L10_3 = SetPedComponentVariation
              L11_3 = L0_3
              L12_3 = L1_3.Drawable
              L13_3 = L9_3
              L14_3 = 0
              L15_3 = 0
              L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
              L10_3 = Wait
              L11_3 = 300
              L10_3(L11_3)
            end
          end
        end
      elseif L2_3 then
        L4_3 = L2_3.Variants
        if L4_3 then
          L4_3 = PairsKeys
          L5_3 = L2_3.Variants
          L5_3 = L5_3[L3_3]
          L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
          for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
            L10_3 = SoundPlay
            L11_3 = "Open"
            L10_3(L11_3)
            L10_3 = SetPedPropIndex
            L11_3 = L0_3
            L12_3 = L2_3.Prop
            L13_3 = L8_3
            L14_3 = 0
            L15_3 = true
            L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
            L10_3 = Wait
            L11_3 = 300
            L10_3(L11_3)
            L10_3 = SoundPlay
            L11_3 = "Close"
            L10_3(L11_3)
            L10_3 = SetPedPropIndex
            L11_3 = L0_3
            L12_3 = L2_3.Prop
            L13_3 = L9_3
            L14_3 = 0
            L15_3 = true
            L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
            L10_3 = Wait
            L11_3 = 300
            L10_3(L11_3)
            L10_3 = ClearPedProp
            L11_3 = L0_3
            L12_3 = L2_3.Prop
            L10_3(L11_3, L12_3)
            L10_3 = Wait
            L11_3 = 200
            L10_3(L11_3)
          end
        end
      end
      L4_3 = false
      L1_1 = L4_3
    end
    L1_2(L2_2)
  else
    L1_2 = SendTextMessage
    L2_2 = Lang
    L3_2 = "TESTING_VARIANTS"
    L2_2, L3_2 = L2_2(L3_2)
    L1_2(L2_2, L3_2)
  end
end
DevTestVariants = L2_1
