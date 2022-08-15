local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "qs-vendings:client:openVending"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "qs-vendings:client:openVending"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2.category
  L2_2 = {}
  L3_2 = Config
  L3_2 = L3_2.VendingMachines
  L3_2 = L3_2[L1_2]
  L3_2 = L3_2.Label
  L2_2.label = L3_2
  L3_2 = Config
  L3_2 = L3_2.VendingMachines
  L3_2 = L3_2[L1_2]
  L3_2 = L3_2.Items
  L2_2.items = L3_2
  L3_2 = Config
  L3_2 = L3_2.VendingMachines
  L3_2 = L3_2[L1_2]
  L3_2 = L3_2.Items
  L3_2 = #L3_2
  L2_2.slots = L3_2
  L3_2 = TriggerServerEvent
  L4_2 = "inventory:server:OpenInventory"
  L5_2 = "shop"
  L6_2 = Config
  L6_2 = L6_2.VendingMachines
  L6_2 = L6_2[L1_2]
  L6_2 = L6_2.Label
  L7_2 = "_"
  L8_2 = math
  L8_2 = L8_2.random
  L9_2 = 1
  L10_2 = 99
  L8_2 = L8_2(L9_2, L10_2)
  L6_2 = L6_2 .. L7_2 .. L8_2
  L7_2 = L2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  while true do
    L0_2 = 1250
    L1_2 = GetEntityCoords
    L2_2 = PlayerPedId
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L2_2()
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
    L2_2 = pairs
    L3_2 = Config
    L3_2 = L3_2.Vendings
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = GetClosestObjectOfType
      L9_2 = L1_2
      L10_2 = 0.7
      L11_2 = GetHashKey
      L12_2 = L7_2.Model
      L13_2 = false
      L14_2 = false
      L15_2 = false
      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
      L9_2 = DoesEntityExist
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        L0_2 = 0
        L9_2 = GetEntityCoords
        L10_2 = L8_2
        L9_2 = L9_2(L10_2)
        L10_2 = L1_2 - L9_2
        L10_2 = #L10_2
        L11_2 = Config
        L11_2 = L11_2.VendingDistance
        if L10_2 < L11_2 then
          L11_2 = Config
          L11_2 = L11_2.Framework
          if "QBCore" == L11_2 then
            L11_2 = Config
            L11_2 = L11_2.NotificationType
            if "ShowHelpNotification" == L11_2 then
              L11_2 = QBCore
              L11_2 = L11_2.Functions
              L11_2 = L11_2.ShowHelpNotification
              L12_2 = Lang
              L13_2 = "VENDING_TEXT"
              L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L12_2(L13_2)
              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
            else
              L11_2 = Config
              L11_2 = L11_2.NotificationType
              if "DrawText3D" == L11_2 then
                L11_2 = QBCore
                L11_2 = L11_2.Functions
                L11_2 = L11_2.DrawText3D
                L12_2 = L9_2.x
                L13_2 = L9_2.y
                L14_2 = L9_2.z
                L14_2 = L14_2 + 0.5
                L15_2 = Lang
                L16_2 = "VENDING_TEXT"
                L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L15_2(L16_2)
                L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
              else
                L11_2 = Config
                L11_2 = L11_2.NotificationType
                if "CustomNotify" == L11_2 then
                  L11_2 = CustomNotify
                  L12_2 = L9_2.x
                  L13_2 = L9_2.y
                  L14_2 = L9_2.z
                  L15_2 = Lang
                  L16_2 = "VENDING_TEXT"
                  L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L15_2(L16_2)
                  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
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
            L11_2 = L11_2.Framework
            if "ESX" == L11_2 then
              L11_2 = Config
              L11_2 = L11_2.NotificationType
              if "ShowHelpNotification" == L11_2 then
                L11_2 = QS
                L11_2 = L11_2.ShowHelpNotification
                L12_2 = Lang
                L13_2 = "VENDING_TEXT"
                L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L12_2(L13_2)
                L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
              else
                L11_2 = Config
                L11_2 = L11_2.NotificationType
                if "DrawText3D" == L11_2 then
                  L11_2 = QS
                  L11_2 = L11_2.DrawText3D
                  L12_2 = L9_2.x
                  L13_2 = L9_2.y
                  L14_2 = L9_2.z
                  L14_2 = L14_2 + 0.5
                  L15_2 = Lang
                  L16_2 = "VENDING_TEXT"
                  L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L15_2(L16_2)
                  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
                else
                  L11_2 = Config
                  L11_2 = L11_2.NotificationType
                  if "CustomNotify" == L11_2 then
                    L11_2 = CustomNotify
                    L12_2 = L9_2.x
                    L13_2 = L9_2.y
                    L14_2 = L9_2.z
                    L15_2 = Lang
                    L16_2 = "VENDING_TEXT"
                    L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L15_2(L16_2)
                    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
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
          L11_2 = IsControlJustPressed
          L12_2 = 0
          L13_2 = 38
          L11_2 = L11_2(L12_2, L13_2)
          if L11_2 then
            L11_2 = Config
            L11_2 = L11_2.VendingAnimation
            if L11_2 then
              L11_2 = PlayerPedId
              L11_2 = L11_2()
              L12_2 = GetOffsetFromEntityInWorldCoords
              L13_2 = VendingObject
              L14_2 = 0.0
              L15_2 = -0.97
              L16_2 = 0.05
              L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
              L13_2 = TaskTurnPedToFaceEntity
              L14_2 = L11_2
              L15_2 = VendingObject
              L16_2 = -1
              L13_2(L14_2, L15_2, L16_2)
              L13_2 = ReqAnimDict
              L14_2 = Config
              L14_2 = L14_2.DispenseDict
              L14_2 = L14_2[1]
              L13_2(L14_2)
              L13_2 = RequestAmbientAudioBank
              L14_2 = "VENDING_MACHINE"
              L13_2(L14_2)
              L13_2 = HintAmbientAudioBank
              L14_2 = "VENDING_MACHINE"
              L15_2 = 0
              L16_2 = -1
              L13_2(L14_2, L15_2, L16_2)
              L13_2 = SetPedCurrentWeaponVisible
              L14_2 = L11_2
              L15_2 = false
              L16_2 = true
              L17_2 = 1
              L18_2 = 0
              L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
              L13_2 = ReqTheModel
              L14_2 = L7_2.Prop
              L13_2(L14_2)
              L13_2 = SetPedResetFlag
              L14_2 = L11_2
              L15_2 = 322
              L16_2 = true
              L13_2(L14_2, L15_2, L16_2)
              L13_2 = TaskTurnPedToFaceEntity
              L14_2 = L11_2
              L15_2 = VendingObject
              L16_2 = -1
              L13_2(L14_2, L15_2, L16_2)
              L13_2 = Citizen
              L13_2 = L13_2.Wait
              L14_2 = 1000
              L13_2(L14_2)
              L13_2 = TaskPlayAnim
              L14_2 = L11_2
              L15_2 = Config
              L15_2 = L15_2.DispenseDict
              L15_2 = L15_2[1]
              L16_2 = Config
              L16_2 = L16_2.DispenseDict
              L16_2 = L16_2[2]
              L17_2 = 8.0
              L18_2 = 5.0
              L19_2 = -1
              L20_2 = true
              L21_2 = 1
              L22_2 = 0
              L23_2 = 0
              L24_2 = 0
              L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
              L13_2 = Citizen
              L13_2 = L13_2.Wait
              L14_2 = 2500
              L13_2(L14_2)
              L13_2 = CreateObjectNoOffset
              L14_2 = L7_2.Prop
              L15_2 = L12_2
              L16_2 = true
              L17_2 = false
              L18_2 = false
              L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
              L14_2 = SetEntityAsMissionEntity
              L15_2 = L13_2
              L16_2 = true
              L17_2 = true
              L14_2(L15_2, L16_2, L17_2)
              L14_2 = SetEntityProofs
              L15_2 = L13_2
              L16_2 = false
              L17_2 = true
              L18_2 = false
              L19_2 = false
              L20_2 = false
              L21_2 = false
              L22_2 = 0
              L23_2 = false
              L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
              L14_2 = AttachEntityToEntity
              L15_2 = L13_2
              L16_2 = L11_2
              L17_2 = GetPedBoneIndex
              L18_2 = L11_2
              L19_2 = 28422
              L17_2 = L17_2(L18_2, L19_2)
              L18_2 = 0.0
              L19_2 = 0.0
              L20_2 = 0.0
              L21_2 = 0.0
              L22_2 = 0.0
              L23_2 = 0.0
              L24_2 = 1
              L25_2 = 1
              L26_2 = 0
              L27_2 = 0
              L28_2 = 2
              L29_2 = 1
              L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
              L14_2 = Citizen
              L14_2 = L14_2.Wait
              L15_2 = 1700
              L14_2(L15_2)
              L14_2 = ReqAnimDict
              L15_2 = Config
              L15_2 = L15_2.PocketAnims
              L15_2 = L15_2[1]
              L14_2(L15_2)
              L14_2 = TaskPlayAnim
              L15_2 = L11_2
              L16_2 = Config
              L16_2 = L16_2.PocketAnims
              L16_2 = L16_2[1]
              L17_2 = Config
              L17_2 = L17_2.PocketAnims
              L17_2 = L17_2[2]
              L18_2 = 8.0
              L19_2 = 5.0
              L20_2 = -1
              L21_2 = true
              L22_2 = 1
              L23_2 = 0
              L24_2 = 0
              L25_2 = 0
              L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
              L14_2 = Citizen
              L14_2 = L14_2.Wait
              L15_2 = 1000
              L14_2(L15_2)
              L14_2 = ClearPedTasks
              L15_2 = L11_2
              L14_2(L15_2)
              L14_2 = ReleaseAmbientAudioBank
              L14_2()
              L14_2 = RemoveAnimDict
              L15_2 = Config
              L15_2 = L15_2.DispenseDict
              L15_2 = L15_2[1]
              L14_2(L15_2)
              L14_2 = RemoveAnimDict
              L15_2 = Config
              L15_2 = L15_2.PocketAnims
              L15_2 = L15_2[1]
              L14_2(L15_2)
              L14_2 = DoesEntityExist
              L15_2 = L13_2
              L14_2 = L14_2(L15_2)
              if L14_2 then
                L14_2 = DetachEntity
                L15_2 = L13_2
                L16_2 = true
                L17_2 = true
                L14_2(L15_2, L16_2, L17_2)
                L14_2 = DeleteEntity
                L15_2 = L13_2
                L14_2(L15_2)
              end
            end
            L11_2 = TriggerEvent
            L12_2 = "qs-vendings:client:openVending"
            L13_2 = {}
            L14_2 = L7_2.Category
            L13_2.category = L14_2
            L11_2(L12_2, L13_2)
          end
        end
      end
    end
    L2_2 = Wait
    L3_2 = L0_2
    L2_2(L3_2)
  end
end
L0_1(L1_1)
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = RequestModel
  L2_2 = A0_2
  L1_2(L2_2)
  while true do
    L1_2 = HasModelLoaded
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 0
    L1_2(L2_2)
  end
end
ReqTheModel = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
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
    L2_2 = 0
    L1_2(L2_2)
  end
end
ReqAnimDict = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = SetTextScale
  L5_2 = 0.35
  L6_2 = 0.35
  L4_2(L5_2, L6_2)
  L4_2 = SetTextFont
  L5_2 = 4
  L4_2(L5_2)
  L4_2 = SetTextProportional
  L5_2 = 1
  L4_2(L5_2)
  L4_2 = SetTextColour
  L5_2 = 255
  L6_2 = 255
  L7_2 = 255
  L8_2 = 215
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = SetTextEntry
  L5_2 = "STRING"
  L4_2(L5_2)
  L4_2 = SetTextCentre
  L5_2 = true
  L4_2(L5_2)
  L4_2 = AddTextComponentString
  L5_2 = A3_2
  L4_2(L5_2)
  L4_2 = SetDrawOrigin
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = 0
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = DrawText
  L5_2 = 0.0
  L6_2 = 0.0
  L4_2(L5_2, L6_2)
  L4_2 = string
  L4_2 = L4_2.len
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 / 370
  L5_2 = DrawRect
  L6_2 = 0.0
  L7_2 = 0.0125
  L8_2 = 0.017 + L4_2
  L9_2 = 0.03
  L10_2 = 0
  L11_2 = 0
  L12_2 = 0
  L13_2 = 75
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2 = ClearDrawOrigin
  L5_2()
end
DrawText3Ds = L0_1
