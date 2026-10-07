

namespace FProjectileTimelineUtils
{
struct FProjectileTimelineActionContext
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    UProjectileTimelineAsset Asset = nullptr;
    UPROPERTY()
    FProjectileTimelineConfigData Config;
    UPROPERTY()
    FProjectileTimelineActionDataWithTime ActionDataWithTime;
    UPROPERTY()
    int TimelineIndexInArray;
    UPROPERTY()
    int TimelineConfigIndex;
    UPROPERTY()
    int ActionIndex;
    UPROPERTY()
    FVector ContextPosition;
    UPROPERTY()
    FQuat4f ContextRotation;
    UPROPERTY()
    FECSEntity ContextEntity;
    UPROPERTY()
    FFPTime WorldTime;


}

void ReplaceComponentAssign(const FECSEntity &inout Entity, const UScriptStruct ComponentType, const FSyncStructRef &inout Data, const FFPTime &inout WorldTime)
{
    FConfigSelectUtils::AddConfigSelection(Entity, ComponentType, Data);
    FProjectileTimelineUtils::TryInitMovementComponent(Entity, ComponentType, WorldTime);
    return;
}
void ReplaceComponentRemove(const FECSEntity &inout Entity, const UScriptStruct ComponentType)
{
    FConfigSelectUtils::RemoveConfigSelection(Entity, ComponentType, false);
    FProjectileTimelineUtils::TryClearMovementComponent(Entity, ComponentType);
    return;
}
void TryInitMovementComponent(const FECSEntity &inout Entity, const UScriptStruct ComponentType, const FFPTime &inout Time)
{
    int local_38 = 0;
    int local_44 = 0;
    if (((FC_SimpleProjectileMovementConfig == ComponentType) || (FC_GroundMovementConfig == ComponentType) || (FC_TrackMovementConfig == ComponentType) || (FC_CurveMovementConfig == ComponentType) || (FC_ThrowMovementConfig == ComponentType) || (FC_CurveRotationConfig == ComponentType) || (FC_RotationByTime == ComponentType)))
    {
        local_38.SetMoveBeginTime(Time);
        local_38.SetInitRotation(local_44.GetRotation());
    }
    return;
}
void TryClearMovementComponent(const FECSEntity &inout Entity, const UScriptStruct ComponentType)
{
    bool local_1 = false;
    if ((FC_SimpleProjectileMovementConfig == ComponentType))
    {
        Remove local_6;
        local_6.opCall();
        local_1 = true;
    }
    else
    {
        if ((FC_ThrowMovementConfig == ComponentType))
        {
            Remove local_10;
            local_10.opCall();
            local_1 = true;
        }
        else
        {
            if ((FC_GroundMovementConfig == ComponentType))
            {
                Remove local_14;
                local_14.opCall();
                local_1 = true;
            }
            else
            {
                if ((FC_TrackMovementConfig == ComponentType))
                {
                    Remove local_18;
                    local_18.opCall();
                    Remove local_22;
                    local_22.opCall();
                    local_1 = true;
                }
                else
                {
                    if ((FC_CurveMovementConfig == ComponentType))
                    {
                        Remove local_26;
                        local_26.opCall();
                        local_1 = true;
                    }
                    else
                    {
                        if ((FC_CurveRotationConfig == ComponentType))
                        {
                            Remove local_30;
                            local_30.opCall();
                            local_1 = true;
                        }
                        else
                        {
                            if ((FC_RotationByTime == ComponentType))
                            {
                                Remove local_34;
                                local_34.opCall();
                                local_1 = true;
                            }
                        }
                    }
                }
            }
        }
    }
    if (local_1)
    {
        Remove local_38;
        local_38.opCall();
        Remove local_42;
        local_42.opCall();
        Remove local_46;
        local_46.opCall();
        Remove local_50;
        local_50.opCall();
        Has local_54;
        if (!(local_54.opCall()))
        {
            Remove local_58;
            local_58.opCall();
        }
    }
    return;
}
FQuat4f GetRotationByConfig(const FECSEntity &inout Entity, const EProjectileTimelineRotationBaseType RotationBaseType, const EProjectileTimelineTransformOffsetType RotationOffsetType, const FQuat4f &inout ContextRotation, const FQuat4f &inout RotationOffset)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FQuat4f __r; return __r;
}
bool GetPositionByConfig(const FECSEntity &inout Entity, const EProjectileTimelinePositionBaseType PositionBaseType, const EProjectileTimelineTransformOffsetType PositionOffsetType, const FVector &inout ContextPosition, const FVector &inout PositionOffset, const FQuat4f &inout Rotation, const float32 GroundHeightCheck, FVector &inout OutPosition)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
FECSEntity FindAbilityOwner(const FECSEntity &inout Entity)
{
    FECSEntity local_4 = Entity;
    Has local_8;
    while (!(local_8.opCall()))
    {
        Get local_14;
        const FC_Owner& local_16 = local_14.opCall();
        if (local_16)
        {
            local_4 = local_16.GetOwnerEntity();
        }
        else
        {
            break;
        }
    }
    return local_4;
}
void BeginAction_ReplaceComponent(const FProjectileTimelineUtils::FProjectileTimelineActionContext &inout Ctx, FC_ProjectileTimelineController &inout Controller, const UScriptStruct ActionType, const FInstancedStruct &inout ActionData)
{
    int local_30 = 0;
    int local_68 = 0;
    FAttackBaseDamageValue local_76;
    FAttackRecoverEnergyValue local_84;
    int local_132 = 0;
    int local_142 = 0;
    int local_148 = 0;
    if (int(ECS::GetECSComponentType(ActionType)) == 5)
    {
        FSyncStructRef local_18 = FSyncStructRef(Ctx.Asset, Ctx.ActionDataWithTime.Data.GetName());
        if ((FC_ProjectileHitConfig == ActionType))
        {
            FECSEntity::Remove<FC_ProjectileHitTestDisableTag> local_24;
            local_24.opCall();
            if (!(local_30.GetbAttackDataOverride()))
            {
                Get local_34;
                local_30.GetModify_AttackInfo().AttackData = local_34.opCall().AttackDataConfig;
                if (local_30.GetAttackInfo().AttackData)
                {
                    FECSEntity local_42;
                    TDataObjectPtr<FAttackData> local_66 = TDataObjectPtr<FAttackData>(local_30.GetAttackInfo().AttackData);
                    local_30.SetDamage(FDamageUtils::CalcAttackBaseDamageValue(local_42, local_68, Ctx.WorldTime, false, FCapabilityInstanceId()));
                    local_76 = FDamageUtils::CalcAttackBaseDamageValue(local_42, local_68, Ctx.WorldTime, true, FCapabilityInstanceId());
                    local_30.SetDamageToAvatar(local_76);
                    local_84 = FDamageUtils::CalcAttackRecoverEnergyValue(local_42, local_68, Ctx.WorldTime, FCapabilityInstanceId());
                    local_30.SetAttackRecoverEnergyData(local_84);
                }
            }
            local_30.GetModify_AttackInfo().HitType = (2 != 0);
        }
        else
        {
            if ((FC_ProjectilePenetrationConfig == ActionType))
            {
                Get local_90;
                const FC_ProjectilePenetrationConfig& local_92 = local_90.opCall();
                if (local_92)
                {
                    FDataObjectPtr local_116 = FDataObjectPtr(local_92.AttackDataAfterPenetration);
                    if (local_116)
                    {
                        local_30.GetModify_AttackInfoAfterPenetration().AttackData = local_116;
                        local_30.SetDamageAfterPenetration(local_76);
                        local_30.SetDamageToAvatarAfterPenetration(local_76);
                        local_30.SetAttackRecoverEnergyDataAfterPenetration(local_84);
                    }
                }
            }
            else
            {
                if ((FC_ProjectileHealthConfig == ActionType))
                {
                    FC_ProjectileHealthConfig local_122;
                    if ((int(local_122.CanBeHitCount) > 0 || (local_122.DamageCanTake > 0.0f)))
                    {
                        local_132.SetbCanDestroyByHit(local_122.bCanDestroyByHit);
                        local_132.SetDamageTaken(0.0f);
                        if ((int(local_122.CanBeHitCount)) > 0)
                        {
                            local_132.SetRemainCanBeHitCount(int(local_122.CanBeHitCount));
                        }
                        if (local_122.DamageCanTake > 0.0f)
                        {
                            local_132.SetRemainDamageCanTake(local_122.DamageCanTake);
                        }
                    }
                    else
                    {
                        Remove local_136;
                        local_136.opCall();
                    }
                }
                else
                {
                    if ((FC_GameplayTagsConfig == ActionType))
                    {
                        local_148.InitFromContainer(local_142.InitGameplayTags);
                    }
                }
            }
        }
        return;
    }
    Get local_154;
    ECSInternal::Assign(Ctx.GetWorld(), Ctx.GetId(), ActionType, FECSComponentPtr(local_154.opCall()));
    return;
}
void BeginAction_PlayFX(const FProjectileTimelineUtils::FProjectileTimelineActionContext &inout Ctx, FC_ProjectileTimelineController &inout Controller, const FProjectileTimelineActionData_PlayFX &inout PlayFXData)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void BeginAction_HitTest(const FProjectileTimelineUtils::FProjectileTimelineActionContext &inout Ctx, const FProjectileTimelineActionData_HitTest &inout HitTestData)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void BeginAction_CreateArealEffect(const FProjectileTimelineUtils::FProjectileTimelineActionContext &inout Ctx, FC_ProjectileTimelineController &inout Controller, const FProjectileTimelineActionData_CreateArealEffectEntity &inout CreateArealEffectData)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void BeginAction_AbilitySignal(const FECSEntity &inout Entity, const FProjectileTimelineActionData_AbilitySignal &inout AbilitySignalData)
{
    if (AbilitySignalData.AbilityClass.IsValid())
    {
        FECSEntity local_10 = FProjectileTimelineUtils::FindAbilityOwner(Entity);
        Has local_14;
        bool local_1 = local_14.opCall();
        if (local_1)
        {
            int local_15 = FAbilityUtils::GetAbilityIndexByClass(local_10, AbilitySignalData.AbilityClass);
            if (local_15 >= 0)
            {
                bool local_17;
                local_17 = false;
                FC_EASAbilityInstance& local_20 = FAbilityUtils::GetAbilityInstance(local_10, local_15, local_17);
                if (!(!(local_17)) && local_20)
                {
                    FAbilityUtils::InvokeSignal(local_20, local_10, AbilitySignalData.SignalName, FFPTime(-1), true);
                }
            }
        }
    }
    return;
}
void BeginAction_AbilityEffectEvent(const FECSEntity &inout Entity, const FProjectileTimelineActionData_AbilityEffectEvent &inout AbilityEffectEventData)
{
    Has local_4;
    int local_50 = 0;
    if (!(local_4.opCall()))
    {
        FC_AbilityEffectEventTrigger local_44 = FC_AbilityEffectEventTrigger();
        Assign local_18;
        local_18.opCall(local_44).SetAbilityOwner(FProjectileTimelineUtils::FindAbilityOwner(Entity));
    }
    for (auto& local_64 : AbilityEffectEventData.ProjectileSpawn)
    {
        local_50.RegisterEvent(EAbilityEffectEvent(1), local_64.AbilityClass, local_64.EventName);
    }
    for (auto& local_64 : AbilityEffectEventData.ProjectileHit)
    {
        local_50.RegisterEvent(EAbilityEffectEvent(2), local_64.AbilityClass, local_64.EventName);
    }
    for (auto& local_64 : AbilityEffectEventData.ProjectileHitScene)
    {
        local_50.RegisterEvent(EAbilityEffectEvent(3), local_64.AbilityClass, local_64.EventName);
    }
    for (auto& local_64 : AbilityEffectEventData.ProjectileDestroy)
    {
        local_50.RegisterEvent(EAbilityEffectEvent(4), local_64.AbilityClass, local_64.EventName);
    }
    return;
}
void BeginAction_ChangeMaterialParam(const FECSEntity &inout Entity, const FProjectileTimelineActionData_ChangeMaterialParam &inout ChangeMaterialParamData)
{
    if (!(ChangeMaterialParamData.MaterialParams.IsEmpty()))
    {
        FMaterialUtils::SyncRequestChangeMaterialParam(Entity, ChangeMaterialParamData.RequestName, ChangeMaterialParamData.MaterialParams);
    }
    return;
}
void BeginAction_InstantSFX(const FProjectileTimelineUtils::FProjectileTimelineActionContext &inout Ctx, const FProjectileTimelineActionData_InstantSFX &inout SFXData)
{
    SendEvent local_4;
    FCE_ProjectileInstantSFX& local_6 = local_4.opCall(Ctx.WorldTime);
    if (local_6)
    {
        local_6.Event = SFXData.Event;
        local_6.bFollow = SFXData.bFollow;
        local_6.bSelfOnly = SFXData.bSelfOnly;
    }
    return;
}
void BeginAction_DurationalSFX(const FProjectileTimelineUtils::FProjectileTimelineActionContext &inout Ctx, const FProjectileTimelineActionData_DurationalSFX &inout SFXData)
{
    int local_6 = 0;
    FProjectileDurationalSFXEntry local_32;
    local_32.SetTimelineIndex(int(Ctx.TimelineIndexInArray));
    local_32.SetActionIndex(int(Ctx.ActionIndex));
    local_32.SetEnterEvent(SFXData.EnterEvent);
    local_32.SetExitEvent(SFXData.ExitEvent);
    local_32.SetbFollow(SFXData.bFollow);
    local_32.SetbSelfOnly(SFXData.bSelfOnly);
    local_6.GetModify_ActiveEntries().Add(local_32);
    return;
}
void BeginAction_KeepSwitchValue(const FProjectileTimelineUtils::FProjectileTimelineActionContext &inout Ctx, const FProjectileTimelineActionData_KeepSwitchValue &inout Data)
{
    int local_6 = 0;
    FProjectileAudioKeepSwitchEntry local_30;
    local_30.SetTimelineIndex(int(Ctx.TimelineIndexInArray));
    local_30.SetActionIndex(int(Ctx.ActionIndex));
    local_30.SetKeepSwitchValue(Data.KeepSwitchValue);
    local_30.SetResetSwitchValue(Data.ResetSwitchValue);
    local_6.GetModify_ActiveEntries().Add(local_30);
    return;
}
void BeginAction_KeepRtpcValue(const FProjectileTimelineUtils::FProjectileTimelineActionContext &inout Ctx, const FProjectileTimelineActionData_KeepRtpcValue &inout Data)
{
    int local_6 = 0;
    FProjectileAudioKeepRtpcEntry local_24;
    local_24.SetTimelineIndex(int(Ctx.TimelineIndexInArray));
    local_24.SetActionIndex(int(Ctx.ActionIndex));
    local_24.SetRtpc(Data.Rtpc);
    local_24.SetValue(Data.Value);
    local_24.SetResetValue(Data.ResetValue);
    local_24.SetInterpolateTime(Data.InterpolateTime);
    local_6.GetModify_ActiveEntries().Add(local_24);
    return;
}
void EndAction_ReplaceComponent(const FECSEntity &inout Entity, const UScriptStruct ActionType)
{
    if ((int(ECS::GetECSComponentType(ActionType))) == 5)
    {
        FProjectileTimelineUtils::ReplaceComponentRemove(Entity, ActionType);
        if ((FC_ProjectileHitConfig == ActionType))
        {
            Assign local_8;
            local_8.opCall(FC_ProjectileHitTestDisableTag());
        }
        else
        {
            if ((FC_ProjectileHealthConfig == ActionType))
            {
                Remove local_14;
                local_14.opCall();
            }
        }
        return;
    }
    ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), ActionType);
    return;
}
void EndAction_PlayFX(FC_ProjectileTimelineController &inout Controller, const int TimelineIndex, const int ActionIndex, const FProjectileTimelineActionData_PlayFX &inout PlayFXData)
{
    FProjectileTimelineActionRelativeData local_4;
    if (Controller.GetTimelineInfos()[TimelineIndex].GetRelativeDatas().Find(ActionIndex, local_4))
    {
        ECSFX::StopFX(local_4.GetRelativeEntity(), (int(PlayFXData.StopMethodOnActionEnd) == 1), false, 0.0f);
    }
    return;
}
void EndAction_CreateArealEffect(FC_ProjectileTimelineController &inout Controller, const int TimelineIndex, const int ActionIndex, const FProjectileTimelineActionData_CreateArealEffectEntity &inout CreateArealEffectData)
{
    FProjectileTimelineActionRelativeData local_4;
    if (Controller.GetTimelineInfos()[TimelineIndex].GetRelativeDatas().Find(ActionIndex, local_4))
    {
        if (CreateArealEffectData.bLifeTimeWithAction)
        {
            local_4.GetRelativeEntity().DestroyDeferred();
        }
    }
    return;
}
void EndAction_AbilityEffectEvent(const FECSEntity &inout Entity, const FProjectileTimelineActionData_AbilityEffectEvent &inout AbilityEffectEventData)
{
    int local_6 = 0;
    for (auto& local_22 : AbilityEffectEventData.ProjectileSpawn)
    {
        local_6.UnregisterEvent(EAbilityEffectEvent(1), local_22.AbilityClass, local_22.EventName);
    }
    for (auto& local_22 : AbilityEffectEventData.ProjectileHit)
    {
        local_6.UnregisterEvent(EAbilityEffectEvent(2), local_22.AbilityClass, local_22.EventName);
    }
    for (auto& local_22 : AbilityEffectEventData.ProjectileHitScene)
    {
        local_6.UnregisterEvent(EAbilityEffectEvent(3), local_22.AbilityClass, local_22.EventName);
    }
    for (auto& local_22 : AbilityEffectEventData.ProjectileDestroy)
    {
        local_6.UnregisterEvent(EAbilityEffectEvent(4), local_22.AbilityClass, local_22.EventName);
    }
    return;
}
void EndAction_ChangeMaterialParam(const FECSEntity &inout Entity, const FProjectileTimelineActionData_ChangeMaterialParamSpan &inout ChangeMaterialParamData)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void EndAction_DurationalSFX(const FECSEntity &inout Entity, const int TimelineIndex, const int ActionIndex)
{
    Modify local_4;
    FC_ProjectileDurationalSFXList& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_11 = local_6.GetActiveEntries().Num() - 1;
        for (; local_11 >= 0; --local_11)
        {
            if (local_6.GetActiveEntries()[local_11].GetTimelineIndex() == TimelineIndex && (local_6.GetActiveEntries()[local_11].GetActionIndex() == ActionIndex))
            {
                local_6.GetModify_ActiveEntries().RemoveAt(local_11);
                break;
            }
        }
    }
    return;
}
void EndAction_KeepSwitchValue(const FECSEntity &inout Entity, const int TimelineIndex, const int ActionIndex)
{
    Modify local_4;
    FC_ProjectileAudioKeepSwitchList& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_11 = local_6.GetActiveEntries().Num() - 1;
        for (; local_11 >= 0; --local_11)
        {
            if (local_6.GetActiveEntries()[local_11].GetTimelineIndex() == TimelineIndex && (local_6.GetActiveEntries()[local_11].GetActionIndex() == ActionIndex))
            {
                local_6.GetModify_ActiveEntries().RemoveAt(local_11);
                break;
            }
        }
    }
    return;
}
void EndAction_KeepRtpcValue(const FECSEntity &inout Entity, const int TimelineIndex, const int ActionIndex)
{
    Modify local_4;
    FC_ProjectileAudioKeepRtpcList& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_11 = local_6.GetActiveEntries().Num() - 1;
        for (; local_11 >= 0; --local_11)
        {
            if (local_6.GetActiveEntries()[local_11].GetTimelineIndex() == TimelineIndex && (local_6.GetActiveEntries()[local_11].GetActionIndex() == ActionIndex))
            {
                local_6.GetModify_ActiveEntries().RemoveAt(local_11);
                break;
            }
        }
    }
    return;
}
void BeginTimelineAction(const FProjectileTimelineUtils::FProjectileTimelineActionContext &inout Ctx, FC_ProjectileTimelineController &inout Controller)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void EndTimelineAction(const FECSEntity &inout Entity, FC_ProjectileTimelineController &inout Controller, const FInstancedStruct &inout ActionData, const int TimelineIndex, const int ActionIndex)
{
    if (!(ActionData.IsValid()))
    {
        return;
    }
    UScriptStruct local_6 = ActionData.GetScriptStruct();
    if (local_6.IsChildOf(FECSComponent))
    {
        FProjectileTimelineUtils::EndAction_ReplaceComponent(Entity, local_6);
        return;
    }
    if (local_6.IsChildOf(FProjectileTimelineActionData_PlayFX))
    {
        Get local_12;
        FProjectileTimelineUtils::EndAction_PlayFX(Controller, TimelineIndex, ActionIndex, local_12.opCall());
        return;
    }
    if (local_6.IsChildOf(FProjectileTimelineActionData_CreateArealEffectEntity))
    {
        Get local_16;
        FProjectileTimelineUtils::EndAction_CreateArealEffect(Controller, TimelineIndex, ActionIndex, local_16.opCall());
        return;
    }
    if (local_6.IsChildOf(FProjectileTimelineActionData_AbilityEffectEvent))
    {
        Get local_20;
        FProjectileTimelineUtils::EndAction_AbilityEffectEvent(Entity, local_20.opCall());
        return;
    }
    if (local_6.IsChildOf(FProjectileTimelineActionData_DurationalSFX))
    {
        FProjectileTimelineUtils::EndAction_DurationalSFX(Entity, TimelineIndex, ActionIndex);
        return;
    }
    if (local_6.IsChildOf(FProjectileTimelineActionData_KeepSwitchValue))
    {
        FProjectileTimelineUtils::EndAction_KeepSwitchValue(Entity, TimelineIndex, ActionIndex);
        return;
    }
    if (local_6.IsChildOf(FProjectileTimelineActionData_KeepRtpcValue))
    {
        FProjectileTimelineUtils::EndAction_KeepRtpcValue(Entity, TimelineIndex, ActionIndex);
        return;
    }
    if (local_6.IsChildOf(FProjectileTimelineActionData_ChangeMaterialParamSpan))
    {
        Get local_24;
        FProjectileTimelineUtils::EndAction_ChangeMaterialParam(Entity, local_24.opCall());
    }
    return;
}
void AdvanceTimeline(const FECSEntity &inout Entity, const UProjectileTimelineAsset Asset, FC_ProjectileTimelineController &inout TimelineController, const FProjectileTimelineConfigData &inout Config, const FFPTime &inout DeltaTime)
{
    const FProjectileTimelineActionDataWithTime& local_24;
    int local_104;
    FFPTime local_6 = FFPTime(-1);
    int local_8 = 0;
    for (; local_8 < TimelineController.GetTimelineInfos().Num(); ++local_8)
    {
        FProjectileTimelineRuntimeInfo& local_12 = TimelineController.GetModify_TimelineInfos()[local_8];
        if (local_12.GetbIsActive())
        {
            int local_21;
            int local_19;
            local_12.SetNextActionBeginTime(FFPTime(-1));
            local_12.SetNextActionEndTime(FFPTime(-1));
            FFPTime local_4 = (local_12.GetCurLocalTime() + DeltaTime);
            local_12.SetCurLocalTime(local_4);
            const FProjectileTimelineData& local_14 = Config.TimelineDatas[local_12.GetIndexInConfig()];
            TArray<int> local_18;
            local_19 = local_12.GetNextEndActionIndexInEndOrderList();
            for (; local_19 < local_14.ActionEndOrderList.Num(); ++local_19)
            {
                local_24 = local_14.ActionDatas[local_14.ActionEndOrderList[local_19]];
                if (FFPTime(local_24.EndTime).opCmp(local_12.GetCurLocalTime()) <= 0)
                {
                    local_18.Add(local_19);
                    local_12.SetNextEndActionIndexInEndOrderList((local_19 + 1));
                    continue;
                }
                local_12.SetNextActionEndTime(local_24.EndTime);
                break;
            }
            TArray<int> local_28;
            local_21 = local_12.GetNextBeginActionIndex();
            for (; local_21 < local_14.ActionDatas.Num(); ++local_21)
            {
                local_24 = local_14.ActionDatas[local_12.GetNextBeginActionIndex()];
                if (FFPTime(local_24.BeginTime).opCmp(local_12.GetCurLocalTime()) <= 0)
                {
                    local_28.Add(local_21);
                    local_12.SetNextBeginActionIndex((local_21 + 1));
                    continue;
                }
                local_12.SetNextActionBeginTime(local_24.BeginTime);
                break;
            }
            FProjectileTimelineUtils::FProjectileTimelineActionContext local_100;
            local_100.Entity = Entity;
            local_100.Config = Config;
            local_100.TimelineIndexInArray = local_8;
            local_100.TimelineConfigIndex = local_12.GetIndexInConfig();
            local_100.ContextPosition = local_12.GetContextPosition();
            local_100.ContextRotation = local_12.GetContextRotation();
            local_100.ContextEntity = local_12.GetContextEntity();
            local_100.WorldTime = ((FFPTime(TimelineController.GetWorldTimeOffset()) + local_12.GetTimeOffset()) + local_12.GetCurLocalTime());
            local_19 = 0;
            local_21 = 0;
            while (local_19 < local_18.Num() || (local_21 < local_28.Num()))
            {
                if (local_19 >= local_18.Num())
                {
                    local_100.ActionDataWithTime = local_14.ActionDatas[local_28[local_21]];
                    local_100.ActionIndex = local_28[local_21];
                    FProjectileTimelineUtils::BeginTimelineAction(local_100, TimelineController);
                    ++local_21;
                }
                else
                {
                    if (local_21 >= local_28.Num())
                    {
                        local_104 = local_14.ActionEndOrderList[local_18[local_19]];
                        FProjectileTimelineUtils::EndTimelineAction(Entity, TimelineController, Asset.GetActionData(local_14.ActionDatas[local_104].Data), local_8, local_104);
                        ++local_19;
                    }
                    else
                    {
                        local_104 = local_14.ActionEndOrderList[local_18[local_19]];
                        local_24 = local_14.ActionDatas[local_104];
                        const FProjectileTimelineActionDataWithTime& local_106 = local_14.ActionDatas[local_28[local_21]];
                        if (FFPTime(local_24.EndTime).opCmp(local_106.BeginTime) <= 0 && (local_18[local_19] != local_28[local_21]))
                        {
                            FProjectileTimelineUtils::EndTimelineAction(Entity, TimelineController, Asset.GetActionData(local_24.Data), local_8, local_104);
                            ++local_19;
                        }
                        else
                        {
                            local_100.ActionDataWithTime = local_106;
                            local_100.ActionIndex = local_28[local_21];
                            FProjectileTimelineUtils::BeginTimelineAction(local_100, TimelineController);
                            ++local_21;
                        }
                    }
                }
            }
        }
        FFPTime local_4_2 = FFPTime(-1);
        if (FFPTime(local_12.GetNextActionBeginTime()).opCmp(0.0) >= 0)
        {
            local_4_2 = (FFPTime(local_12.GetNextActionBeginTime()) + local_12.GetTimeOffset());
        }
        if (FFPTime(local_12.GetNextActionEndTime()).opCmp(0.0) >= 0 && (local_4_2.opCmp(0.0) < 0 || ((((FFPTime(local_12.GetNextActionEndTime()) + local_12.GetTimeOffset())).opCmp(local_4_2) < 0))))
        {
            local_4_2 = (FFPTime(local_12.GetNextActionEndTime()) + local_12.GetTimeOffset());
        }
        if (local_4_2.opCmp(0.0) >= 0 && (local_4_2.opCmp(local_6) < 0 || (local_6.opCmp(0.0) < 0)))
        {
            local_6 = local_4_2;
        }
    }
    TimelineController.SetLastTickTime(TimelineController.GetNextTickTime());
    if (local_6.opCmp(0.0) >= 0)
    {
        TimelineController.SetNextTickTime(local_6);
    }
    return;
}
void ActivateEventTimeline(const FECSEntity &inout Entity, const FProjectileTimelineConfigData &inout Config, const FName &inout TimelineName, const FVector &inout ContextPosition, const FQuat4f &inout ContextRotation, const FECSEntity &inout ContextEntity, const FFPTime &inout WorldTime)
{
    int local_1;
    int local_30 = 0;
    if (Config.NameToTimelineDataIndex.Find(TimelineName, local_1))
    {
        FProjectileTimelineEventContext local_24;
        local_24.SetTimelineConfigIndex(local_1);
        local_24.SetContextPosition(ContextPosition);
        local_24.SetContextRotation(ContextRotation);
        local_24.SetContextEntity(ContextEntity);
        local_24.SetWorldTime(WorldTime);
        local_30.GetModify_PendingActivateTimelineContext().Add(local_24);
    }
    return;
}
void TurnToState(const FECSEntity &inout Entity, const FProjectileTimelineConfigData &inout Config, const FName &inout StateName, const FFPTime &inout WorldTime)
{
    int local_10 = 0;
    int local_1 = -1;
    if (Config.NameToTimelineDataIndex.Find(StateName, local_1))
    {
        local_10.SetNextStateTimelineIndex(local_1);
        local_10.SetNextStateStartWorldTime(WorldTime);
    }
    return;
}
void HandleReactionTrigger(const FProjectileEventTriggerConfig &inout ReactionTrigger, const FECSEntity &inout Entity, const FProjectileTimelineConfigData &inout Config, const FVector &inout ContextPosition, const FQuat4f &inout ContextRotation, const FECSEntity &inout ContextEntity, const FFPTime &inout WorldTime)
{
    for (auto& local_16 : ReactionTrigger)
    {
        if (!(local_16.EventName.IsNone()))
        {
            FProjectileTimelineUtils::ActivateEventTimeline(Entity, Config, local_16.EventName, ContextPosition, ContextRotation, ContextEntity, WorldTime);
        }
    }
    if (!(ReactionTrigger.TurnToState.StateName.IsNone()))
    {
        FProjectileTimelineUtils::TurnToState(Entity, Config, ReactionTrigger.TurnToState.StateName, WorldTime);
    }
    return;
}
void TriggerSpawnEventReaction(const TArray<FProjectileEventTriggerReaction> &inout TriggerReactions, const FECSEntity &inout Entity, const FProjectileTimelineConfigData &inout Config, const FVector &inout ContextPosition, const FQuat4f &inout ContextRotation, const FFPTime &inout WorldTime)
{
    for (auto& local_16 : TriggerReactions)
    {
        if (local_16.bListenSpawnEvent)
        {
            FProjectileTimelineUtils::HandleReactionTrigger(local_16.ReactionTrigger, Entity, Config, ContextPosition, ContextRotation, Entity, WorldTime);
        }
    }
    return;
}
void TriggerHitEventReaction(const TArray<FProjectileEventTriggerReaction> &inout TriggerReactions, const FECSEntity &inout Entity, const FProjectileTimelineConfigData &inout Config, const EFactionRelationSplitSelf HitRelation, const FHitTestResult &inout HitResult, const FC_Transform &inout EntityTransform, const FFPTime &inout WorldTime)
{
    bool local_23;
    for (auto& local_16 : TriggerReactions)
    {
        local_23 = local_16.bListenHitEvent;
        if (!(local_23))
        {
            local_23 = false;
        }
        else
        {
            int local_17 = int(HitRelation);
            int local_21 = local_17 & int(local_16.HitableRelation);
            local_23 = (local_21 != 0);
        }
        if (local_23)
        {
            FProjectileTimelineUtils::HandleReactionTrigger(local_16.ReactionTrigger, Entity, Config, HitResult.HitPoint, FQuat4f(EntityTransform.GetRotation()), HitResult.HitEntity, WorldTime);
        }
    }
    return;
}
void TriggerHitSceneEventReaction(const TArray<FProjectileEventTriggerReaction> &inout TriggerReactions, const FECSEntity &inout Entity, const FProjectileTimelineConfigData &inout Config, const FHitTestResult &inout HitResult, const FC_Transform &inout EntityTransform, const FFPTime &inout WorldTime)
{
    for (auto& local_16 : TriggerReactions)
    {
        if (local_16.bListenHitSceneEvent)
        {
            FProjectileTimelineUtils::HandleReactionTrigger(local_16.ReactionTrigger, Entity, Config, HitResult.HitPoint, FQuat4f(EntityTransform.GetRotation()), Entity, WorldTime);
        }
    }
    return;
}
void TriggerTrackReachEventReaction(const TArray<FProjectileEventTriggerReaction> &inout TriggerReactions, const FECSEntity &inout Entity, const FProjectileTimelineConfigData &inout Config, const FVector &inout ContextPosition, const FQuat4f &inout ContextRotation, const FECSEntity &inout ContextEntity, const FFPTime &inout WorldTime)
{
    for (auto& local_16 : TriggerReactions)
    {
        if (local_16.bListenTrackReachEvent)
        {
            FProjectileTimelineUtils::HandleReactionTrigger(local_16.ReactionTrigger, Entity, Config, ContextPosition, ContextRotation, ContextEntity, WorldTime);
        }
    }
    return;
}
void TriggerMoveBlockedDestroyEventReaction(const TArray<FProjectileEventTriggerReaction> &inout TriggerReactions, const FECSEntity &inout Entity, const FProjectileTimelineConfigData &inout Config, const FVector &inout ContextPosition, const FQuat4f &inout ContextRotation, const FECSEntity &inout ContextEntity, const FFPTime &inout WorldTime)
{
    for (auto& local_16 : TriggerReactions)
    {
        if (local_16.bListenMoveBlockedDestroy)
        {
            FProjectileTimelineUtils::HandleReactionTrigger(local_16.ReactionTrigger, Entity, Config, ContextPosition, ContextRotation, ContextEntity, WorldTime);
        }
    }
    return;
}
}
