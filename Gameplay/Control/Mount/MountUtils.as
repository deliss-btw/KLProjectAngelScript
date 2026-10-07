
namespace FMountUtils
{
UClass GetEquipedMountPrefabClass(const FECSEntity &inout Entity)
{
    return FashionUtils::GetMountPrefabClass(Entity);
}
bool IsEquippedMountPrefabMismatch(const FECSEntity &inout PlayerControllerEntity)
{
    int local_6 = 0;
    int local_18 = 0;
    if (!(local_6) || !(local_6.GetMountEntity().IsValid()))
    {
        return false;
    }
    UClass local_10 = FMountUtils::GetEquipedMountPrefabClass(PlayerControllerEntity);
    if ((!((local_10 != nullptr))))
    {
        return false;
    }
    if (!(local_18))
    {
        return false;
    }
    return (!((local_18.PrefabClass.Get() == local_10)));
}
bool IsPrivateMountForRider(const FECSEntity &inout RiderEntity, const FECSEntity &inout MountEntity)
{
    Has local_4;
    if (!(local_4.opCall()) || !(MountEntity.IsValid()))
    {
        return false;
    }
    Get local_10;
    FECSEntity local_14 = local_10.opCall().GetPlayerEntity();
    GetDefaulted local_18;
    return (FECSEntity(local_18.opCall().GetMountEntity()) == MountEntity);
}
void SendOnBeginMount(const FECSEntity &inout RiderEntity, const FECSEntity &inout MountEntity, const FFPTime &inout Time, const bool bIsDriver)
{
    FCE_OnBeginMount local_6;
    local_6.MountEntity = MountEntity;
    local_6.bIsDriver = bIsDriver;
    local_6.bIsPrivateMount = FMountUtils::IsPrivateMountForRider(RiderEntity, MountEntity);
    local_6.SetbPredictable(local_6.bIsPrivateMount);
    return;
}
void SendOnEndMount(const FECSEntity &inout RiderEntity, const FECSEntity &inout MountEntity, const FFPTime &inout Time, const bool bIsDriver)
{
    FCE_OnEndMount local_6;
    local_6.MountEntity = MountEntity;
    local_6.bIsDriver = bIsDriver;
    local_6.bIsPrivateMount = FMountUtils::IsPrivateMountForRider(RiderEntity, MountEntity);
    local_6.SetbPredictable(local_6.bIsPrivateMount);
    return;
}
void NotifyServerEquipMount(const FECSEntity &inout PlayerControllerEntity)
{
    int local_12 = 0;
    int local_22 = 0;
    int local_34 = 0;
    int local_54 = 0;
    UClass local_4 = FMountUtils::GetEquipedMountPrefabClass(PlayerControllerEntity);
    if (local_4 != nullptr)
    {
        FECSEntity local_16 = FECSEntity(local_12.GetMountEntity());
        if (local_16.IsValid())
        {
            if (local_22 && (local_22.PrefabClass.Get() == local_4))
            {
                return;
            }
            FLifeCycleUtils::EntityDestroyDirectly(local_16, ECS::GetContextTime());
        }
        FVector local_40;
        FRotator local_46;
        if (local_34.GetPlayerPawnEntity())
        {
            local_40 = local_54.GetPosition();
            local_46 = local_54.GetRotation().Rotator();
        }
        FECSEntity local_66 = ECS::RequestEntityByPrefabDeferred(TSubclassOf<AECSPrefab>(local_4), local_40, local_46, EPrefabCollisionAlignment(2), EECSRegType(0), true);
        local_12.SetMountEntity(local_66);
        FECSEntity local_70 = FECSEntity(PlayerControllerEntity.GetId());
        ModifyOrAdd local_76;
        local_76.opCall().SetPlayerEntity(local_70);
        Assign local_80;
        local_80.opCall(FC_LocalTag());
        Assign local_86;
        local_86.opCall(FC_CharacterInBackgroundTag());
        ModifyOrAdd local_92;
        local_92.opCall().SetOwnerEntity(PlayerControllerEntity);
        ModifyOrAdd local_96;
        local_96.opCall().SetPoolSourceEntity(PlayerControllerEntity);
        FECSNetUtils::SetNetPredict(local_66, FNetPlayerMask::MakeForPlayerIndex(local_34.GetPlayerIndex()));
    }
    return;
}
FECSEntity TryGetMountEntity(const FECSEntity &inout RiderEntity, const bool bIsRidingPrivateMount)
{
    if (bIsRidingPrivateMount)
    {
        Has local_4;
        local_4.opCall();
        Get local_10;
        FECSEntity local_14 = local_10.opCall().GetPlayerEntity();
        GetDefaulted local_18;
        return local_18.opCall().GetMountEntity();
    }
    else
    {
        GetDefaulted local_22;
        return local_22.opCall().GetTargetEntity();
    }
}
void ClearMountResidualMoveState(const FECSEntity &inout MountEntity)
{
    if (!(MountEntity.IsValid()))
    {
        return;
    }
    ECS::GetContextTime();
    FAIInputUtils::SimulateMoveInputLocal(MountEntity, FVector::ZeroVector, EAIMoveSimulateType(0), true);
    Has local_10;
    bool local_1 = local_10.opCall();
    if (local_1)
    {
        Assign local_14;
        local_14.opCall(FC_AIMovePurposeUpdateTag());
        Remove local_20;
        local_20.opCall();
    }
    Remove local_24;
    local_24.opCall();
    Remove local_28;
    local_28.opCall();
    Remove local_32;
    local_32.opCall();
    Remove local_36;
    local_36.opCall();
    Remove local_40;
    local_40.opCall();
    Remove local_44;
    local_44.opCall();
    return;
}
void BeginMountAsDriver(const FECSEntity &inout RiderEntity, const FFPTime &inout Time, const bool bIsRidingPrivateMount)
{
    int local_26 = 0;
    int local_34 = 0;
    int local_60 = 0;
    int local_62 = 0;
    int local_150 = 0;
    int local_160 = 0;
    bool local_1 = !(bIsRidingPrivateMount);
    if (!(local_1))
    {
        local_1 = false;
    }
    else
    {
        local_1 = ECS::GetRuntimeInfo().IsClient;
    }
    if (local_1)
    {
        return;
    }
    Has local_8;
    bool local_2 = !(local_8.opCall());
    FECSEntity local_16 = FMountUtils::TryGetMountEntity(RiderEntity, bIsRidingPrivateMount);
    Has local_20;
    if (!(local_16.IsValid()) || !(local_20.opCall()))
    {
        return;
    }
    if (!(local_26) || (local_26.MountSeatInfos.Num() <= 0))
    {
        return;
    }
    if (!(bIsRidingPrivateMount) && !(local_2))
    {
        if (!(local_34))
        {
        }
        else
        {
            local_34.GetPlayerEntity().IsValid();
        }
        ModifyOrAdd local_38;
        local_38.opCall().SetPlayerEntity(local_34.GetPlayerEntity());
        ModifyOrAdd local_42;
        local_42.opCall().SetOwnerEntity(local_34.GetPlayerEntity());
        ModifyOrAdd local_46;
        local_46.opCall().SetPoolSourceEntity(local_34.GetPlayerEntity());
        Get local_50;
        FECSNetUtils::SetNetPredict(local_16, FNetPlayerMask::MakeForPlayerIndex(local_50.opCall().GetPlayerIndex()));
    }
    local_60.SetDriverEntity(RiderEntity);
    if (bIsRidingPrivateMount)
    {
        Has local_94;
        US_MountSystem local_72 = Cast<US_MountSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_MountSystem));
        bool local_1_2 = local_72 != nullptr && !((local_72.ActiveStateName == NAME_None));
        if (local_1_2)
        {
            FMountUtils::ExternalTransitToESMState(local_16, local_72.ActiveStateName);
        }
        local_16.SetActive(true, FFPTime(-1));
        Remove local_80;
        local_80.opCall();
        Remove local_84;
        local_84.opCall();
        Modify local_88;
        if (local_88.opCall())
        {
        }
        local_16.MoveTo(local_62.GetPosition(), local_62.GetRotation(), FFPTime(-1));
        if (!(local_94.opCall()))
        {
            local_1_2 = false;
        }
        else
        {
            local_1_2 = local_94.opCall();
        }
        if (local_1_2)
        {
            Get local_98;
            Modify local_102;
            local_102.opCall().SetDesiredRotation(local_98.opCall().GetDesiredRotation());
        }
        Modify local_106;
        FC_CharacterMovement& local_108 = local_106.opCall();
        if (local_108)
        {
            if (local_108.GetbAirborne())
            {
                XError(ELog(0), "BeginMount when Rider is in air, force set bAirborne to false!");
                local_108.SetbAirborne(false);
            }
        }
        Get local_114;
        const FC_Rigidbody& local_116 = local_114.opCall();
        if (local_116)
        {
            Modify local_120;
            FC_Rigidbody& local_122 = local_120.opCall();
            if (local_122)
            {
                local_122.SetVelocity(local_116.GetVelocity());
                local_122.SetAngularVelocity(local_116.GetAngularVelocity());
            }
        }
    }
    FMountSeatInfo local_148;
    local_150.SetMountEntity(local_16);
    local_150.SetSeatIndex(0);
    local_148 = local_26.MountSeatInfos[0];
    if (local_160.GetModify_ReservedByEntities().Num() > 0)
    {
        local_160.GetModify_ReservedByEntities()[0] = FECSEntity();
    }
    if (local_160.GetModify_RiddenByEntities().Num() > 0)
    {
        local_160.GetModify_RiddenByEntities()[0] = RiderEntity;
    }
    FAttachmentUtils::EntityAttachToParent(RiderEntity, local_16, Time, local_148.SocketName, false, local_148.AttachLocationOffset, local_148.AttachRotationOffset, 0.0f, 0.0f, 0, FVector::ZeroVector, 0.0f, false);
    if (!(local_2))
    {
        ModifyOrAdd local_168;
        local_168.opCall().SetEntity(local_16);
        Get local_32;
        FECSEntity(local_32.opCall().GetPlayerEntity()).IsValid();
        Modify local_176;
        local_176.opCall().SetCameraViewTargetEntity(local_16);
    }
    FMountUtils::SendOnBeginMount(RiderEntity, local_16, Time, true);
    return;
}
void EndMountAsDriver(const FECSEntity &inout RiderEntity, const FFPTime &inout Time)
{
    Get local_16;
    Has local_6;
    Has local_12;
    if (!(RiderEntity.IsValid()) || !(local_6.opCall()) || !(local_12.opCall()) || !(local_16.opCall().IsDriver()))
    {
        return;
    }
    FECSEntity local_20 = FECSEntity(local_16.opCall().GetMountEntity());
    bool local_21 = false;
    bool local_22 = false;
    Get local_26;
    const FC_ControlledByPlayer& local_28 = local_26.opCall();
    if (local_28)
    {
        local_22 = false;
        FECSEntity local_32 = local_28.GetPlayerEntity();
        GetDefaulted local_36;
        local_21 = local_20.IsValid() && (FECSEntity(local_36.opCall().GetMountEntity()) == local_20);
    }
    else
    {
        local_22 = true;
    }
    bool local_1 = !(local_21);
    if (!(local_1))
    {
        local_1 = false;
    }
    else
    {
        local_1 = ECS::GetRuntimeInfo().IsClient;
    }
    if (local_1)
    {
        return;
    }
    bool local_7 = !(local_22);
    if (local_7)
    {
        Remove local_44;
        local_44.opCall();
        FECSEntity(local_26.opCall().GetPlayerEntity()).IsValid();
        Modify local_48;
        local_48.opCall().SetCameraViewTargetEntity(ENTITY_NULL);
    }
    FVector local_54(FVector::ZeroVector);
    FRotator local_60 = FRotator(FRotator::ZeroRotator);
    if (!(local_20.IsValid()))
    {
        local_7 = false;
    }
    else
    {
        Has local_64;
        local_7 = local_64.opCall();
    }
    if (local_7)
    {
        Remove local_44;
        local_44.opCall();
        Get local_68;
        const FC_MountSeatsConfig& local_70 = local_68.opCall();
        if (local_70)
        {
            FMountSeatInfo local_98;
            local_98 = local_70.MountSeatInfos[0];
            local_54 = local_98.DetachLocationOffset;
            local_60 = local_98.DetachRotationOffset;
            Modify local_128;
            FC_RuntimeMountSeatInfo& local_130 = local_128.opCall();
            if (local_130)
            {
                if (local_130.GetModify_RiddenByEntities().Num() > 0)
                {
                    local_130.GetModify_RiddenByEntities()[0] = ENTITY_NULL;
                }
                if (!(local_21))
                {
                    local_7 = false;
                }
                else
                {
                    local_7 = ECS::GetRuntimeInfo().IsServer;
                }
                if (local_7)
                {
                    int local_132 = 1;
                    for (; local_132 < local_130.GetRiddenByEntities().Num(); ++local_132)
                    {
                        FECSEntity local_40 = FECSEntity(local_130.GetRiddenByEntities()[local_132]);
                        if (local_40.IsValid())
                        {
                            FESMTriggerUtils::ActivateESMTrigger(local_40, n"InteractRideOtheEndTrigger", Time, FFPTime(0.1), 0);
                        }
                    }
                }
            }
        }
        Remove local_142;
        local_142.opCall();
        FMountUtils::ClearMountResidualMoveState(local_20);
        Modify local_146;
        FC_Input& local_148 = local_146.opCall();
        if (local_148)
        {
            local_148.Packets.Empty(0);
            local_148.ResetState(ECS::GetRuntimeInfo().IsServer);
        }
        Remove local_152;
        if (local_152.opCall())
        {
            US_MountSystem local_158 = Cast<US_MountSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_MountSystem));
            if (local_158 != nullptr && (local_158.PrivateMountInactiveDelay > 0.0f))
            {
                ModifyOrAdd local_166;
                local_166.opCall().SetInactiveTime((Time + FFPTime(local_158.PrivateMountInactiveDelay)));
            }
            else
            {
                local_20.SetActive(false, FFPTime(-1));
                Assign local_170;
                local_170.opCall(FC_CharacterInBackgroundTag());
            }
            if (local_158 != nullptr && !((local_158.InactiveStateName == NAME_None)))
            {
                FMountUtils::ExternalTransitToESMState(local_20, local_158.InactiveStateName);
            }
        }
        else
        {
            if (ECS::GetRuntimeInfo().IsServer && !(local_22))
            {
                Remove local_178;
                local_178.opCall();
                Remove local_182;
                local_182.opCall();
                Remove local_186;
                local_186.opCall();
                FECSNetUtils::SetNetPredict(local_20, FNetPlayerMask());
            }
        }
    }
    bool local_189 = true;
    Get local_194;
    const FC_ManipulatedInfo& local_196 = local_194.opCall();
    if (local_196)
    {
        if (!(local_196.GetbOnlyStateTransition()) && !(local_196.GetbAttachMasterToSlave()))
        {
            local_189 = false;
        }
    }
    bool local_7_2 = !(local_189);
    if (!(local_7_2))
    {
        local_7_2 = false;
    }
    else
    {
        Has local_202;
        local_7_2 = local_202.opCall();
    }
    local_7_2 = local_7_2 && FAttachmentUtils::IsEntityAttachedToParent(RiderEntity, local_20);
    if (local_7_2)
    {
        FAttachmentUtils::EntityDetachWithoutOffset(RiderEntity, Time, false, uint8(0));
    }
    else
    {
        if (local_189)
        {
            FAttachmentUtils::EntityDetach(RiderEntity, Time, local_54, local_60, false, uint8(0), true);
        }
    }
    FMountUtils::SendOnEndMount(RiderEntity, local_20, Time, true);
    Remove local_208;
    local_208.opCall();
    return;
}
void BeginMountAsPassenger(const FECSEntity &inout RiderEntity, const FECSEntity &inout MountEntity, const int SeatIndex)
{
    Has local_4;
    bool local_5;
    int local_18 = 0;
    int local_24 = 0;
    int local_34 = 0;
    int local_44 = 0;
    if (!(local_4.opCall()))
    {
        local_5 = false;
    }
    else
    {
        Has local_10;
        local_5 = local_10.opCall();
    }
    if (local_5)
    {
        int local_25 = local_18.MountSeatInfos.Num();
        int local_26 = local_24.GetRiddenByEntities().Num();
        int local_27 = SeatIndex;
        if (local_27 < 1)
        {
            int local_28 = 1;
            for (; local_28 < local_18.MountSeatInfos.Num(); ++local_28)
            {
                if (!(local_24.GetRiddenByEntities()[local_28].IsValid()))
                {
                    local_27 = local_28;
                    break;
                }
            }
        }
        if (local_27 < 1 || (local_27 >= local_18.MountSeatInfos.Num()))
        {
            return;
        }
        if (!(local_24.GetRiddenByEntities()[local_27].IsValid()))
        {
            FECSEntity::Modify<FC_RuntimeMountSeatInfo> local_32 = FECSEntity::Modify<FC_RuntimeMountSeatInfo>(MountEntity);
            if (local_34.GetModify_ReservedByEntities().Num() > local_27)
            {
                local_34.GetModify_ReservedByEntities()[local_27] = FECSEntity();
            }
            local_34.GetModify_RiddenByEntities()[local_27] = RiderEntity;
            local_44.SetMountEntity(MountEntity);
            local_44.SetSeatIndex(local_27);
            FAttachmentUtils::EntityAttachToParent(RiderEntity, MountEntity, ECS::GetContextTime(), local_18.MountSeatInfos[local_27].SocketName, false, local_18.MountSeatInfos[local_27].AttachLocationOffset, local_18.MountSeatInfos[local_27].AttachRotationOffset, 0.0f, 0.0f, 0, FVector::ZeroVector, 0.0f, false);
            FMountUtils::SendOnBeginMount(RiderEntity, MountEntity, ECS::GetContextTime(), false);
        }
    }
    return;
}
void EndMountAsPassenger(const FECSEntity &inout RiderEntity, const FFPTime &inout Time)
{
    Has local_4;
    Get local_10;
    bool local_11;
    int local_14 = 0;
    int local_36 = 0;
    int local_42 = 0;
    if (!(local_4.opCall()) || local_10.opCall().IsDriver())
    {
        return;
    }
    FECSEntity local_18 = FECSEntity(local_14.GetMountEntity());
    FVector local_24(FVector::ZeroVector);
    FRotator local_30 = FRotator(FRotator::ZeroRotator);
    if (local_18.IsValid())
    {
        if (!(local_36))
        {
            local_11 = false;
        }
        else
        {
            local_11 = local_42;
        }
        local_11 = local_11 && (local_14.GetSeatIndex() < local_36.MountSeatInfos.Num());
        if (!(local_11))
        {
        }
        else
        {
            (FECSEntity(local_42.GetRiddenByEntities()[local_14.GetSeatIndex()]) == RiderEntity);
        }
        if (local_42.GetModify_ReservedByEntities().Num() > local_14.GetSeatIndex())
        {
            local_42.GetModify_ReservedByEntities()[local_14.GetSeatIndex()] = FECSEntity();
        }
        local_42.GetModify_RiddenByEntities()[local_14.GetSeatIndex()] = ENTITY_NULL;
        local_24 = local_36.MountSeatInfos[local_14.GetSeatIndex()].DetachLocationOffset;
        local_30 = local_36.MountSeatInfos[local_14.GetSeatIndex()].DetachRotationOffset;
    }
    FAttachmentUtils::EntityDetach(RiderEntity, Time, local_24, local_30, false, uint8(0), true);
    FMountUtils::SendOnEndMount(RiderEntity, local_18, Time, false);
    Remove local_54;
    local_54.opCall();
    return;
}
void ExternalTransitToESMState(const FECSEntity &inout MountEntity, const FName &inout StateName)
{
    int local_6 = 0;
    int local_13 = 0;
    for (; local_13 < 0.Player.GetSMRuntime().Num(); ++local_13)
    {
        UESMStateMachine local_20 = local_6.Asset.GetStateMachine(local_13);
        FName local_22 = local_20.GetDataName();
        FESMExternalTransitHandle local_32 = MountEntity.ESMExternalTransit(local_22, StateName, NAME_None);
        if (!(MountEntity.IsActive()))
        {
            local_32.RequireInactiveExternalTick(ECS::GetContextTime());
        }
    }
    return;
}
bool EntityRidePublicMount(const FECSEntity &inout Entity, const FECSEntity &inout MountEntity)
{
    int local_28 = 0;
    if (MountEntity.MatchGameplayTag(GameplayTags::EcosimAI_State_Scared))
    {
        return false;
    }
    ModifyOrAdd local_6;
    FC_InteractionInfoForESM& local_8 = local_6.opCall();
    if (local_8)
    {
        FCE_ServerTriggerBeginInteractEvent local_42;
        local_8.SetInteractType(EInteractType(10));
        GetDefaulted local_14;
        int local_15 = local_14.opCall().GetAvailableSeatIndex((1 != 0));
        if (local_15 < 0)
        {
            return false;
        }
        if (local_15 > 0)
        {
            local_8.SetInteractType(EInteractType(9));
        }
        FInteractionPointAndBehaviorIndex local_18;
        if (!(FInteractUtils::GetInteractionPointAndBehaviorIndexByType(MountEntity, local_8.GetInteractType(), local_18, (1 != 0))))
        {
            return false;
        }
        local_8.SetTargetPointAndBehaviorIndex(local_18);
        FECSWorldPtr local_22 = Entity.GetWorld();
        local_8.SetExpireTime((FFPTime(local_28.Time) + FFPTime(0.2)));
        local_8.SetTargetEntity(MountEntity);
        FFPTime local_34 = FFPTime(-1);
        local_42.bIsSecondaryInteract = false;
        local_42.TargetEntity = MountEntity;
        local_42.InteractTargetPointAndBehaviorIndex = local_18;
    }
    return false;
}
void EntityQuitPublicMount(const FECSEntity &inout Entity)
{
    FESMTriggerUtils::ActivateESMTrigger(Entity, n"EndMountTrigger", ECS::GetContextTime(), FFPTime(1), 0);
    return;
}
}
