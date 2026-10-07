
const FName DebugDrawKey_ViewportSelectTarget = n"ViewportSelectTarget";

namespace TargetSelectSystem
{
struct FTargetScoreData
{
    UPROPERTY()
    FECSEntityId EntityId;
    UPROPERTY()
    float32 Score;


    void InsertTo(TArray<TargetSelectSystem::FTargetScoreData> &inout Array)
    {
        int local_1 = 0;
        int local_2 = Array.Num();
        int local_4 = 0;
        while (local_1 < local_2)
        {
            local_4 = FMath::IntegerDivisionTrunc(local_1 + local_2, 2);
            if (Array[local_4].Score > this.Score)
            {
                local_2 = local_4;
            }
            else
            {
                if (local_4 == local_1)
                {
                    ++local_4;
                    break;
                }
                local_1 = local_4;
            }
        }
        Array.Insert(this, local_4);
        return;
    }
}

}
class US_TargetSelectSystem : UECSScriptSystem
{
    US_TargetSelectSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_ClearSelectTargetRequest(const FECSEntity &inout Entity, FC_SelectTargetRequestLogic &inout SelectTargetRequest) const
    {
        if (SelectTargetRequest.GetDataByRequestName().IsEmpty())
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnSelectTargetRequestLogicModified(const FECSEntity &inout Entity, const FC_SelectTargetRequestLogic &inout SelectTargetRequestLogic) const
    {
        int local_6 = 0;
        FC_SelectTargetRequestView& local_14;
        bool local_131;
        if (local_6)
        {
            Modify local_12;
            local_14 = local_12.opCall();
            if (local_14)
            {
                for (auto& local_32 : local_14.DataByRequestName)
                {
                    if (!(SelectTargetRequestLogic.GetDataByRequestName().Contains(local_32.GetKey())))
                    {
                        if (GetConfirmInputContextConfig())
                        {
                            ::EnhancedInputUtils::RemoveInputContext(local_6.GetPlayerEntity(), GetConfirmInputContextConfig());
                        }
                    }
                }
            }
        }
        if (local_6)
        {
            for (auto& local_54 : SelectTargetRequestLogic.GetDataByRequestName())
            {
                TRawPtr<FSelectTargetRuntimeData> local_56 = local_14.DataByRequestName.Find(local_54.GetKey());
                if (!(local_56))
                {
                    ::EnhancedInputUtils::AddInputContext(Entity, GetConfirmInputContextConfig());
                    continue;
                }
                if (!(local_56))
                {
                    local_131 = false;
                }
                else
                {
                    FDataObjectPtr local_130;
                    TDataObjectPtr<FEnhancedInputContextConfig> local_82;
                    local_82 = local_56.opArrow().GetConfirmInputContextConfig();
                    local_130;
                    local_131 = !((local_82 == local_130));
                }
                if (local_131)
                {
                    ::EnhancedInputUtils::RemoveInputContext(local_6.GetPlayerEntity(), local_56.opArrow().GetConfirmInputContextConfig());
                    ::EnhancedInputUtils::AddInputContext(local_6.GetPlayerEntity(), GetConfirmInputContextConfig());
                }
            }
        }
        local_14.DataByRequestName = SelectTargetRequestLogic.GetDataByRequestName();
        return;
    }
    UFUNCTION()
    void Monitor_OnSelectTargetRequestLogicRemove(const FECSEntity &inout Entity, const FC_SelectTargetRequestLogic &inout SelectTargetRequestLogic) const
    {
        int local_6 = 0;
        if (local_6)
        {
            Modify local_12;
            FC_SelectTargetRequestView& local_14 = local_12.opCall();
            if (local_14)
            {
                for (auto& local_32 : local_14.DataByRequestName)
                {
                    local_32;
                    if (GetConfirmInputContextConfig())
                    {
                        ::EnhancedInputUtils::RemoveInputContext(local_6.GetPlayerEntity(), GetConfirmInputContextConfig());
                    }
                }
            }
        }
        Remove local_36;
        local_36.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_OnSelectTargetRequestViewModified(const FECSEntity &inout Entity, const FC_SelectTargetRequestView &inout SelectTargetRequest) const
    {
        const FSelectTargetRuntimeData& local_34;
        FC_ViewportSelectTarget local_6 = FECSEntity::Modify<FC_ViewportSelectTarget>(Entity).opCall();
        if (local_6)
        {
            int local_11 = local_6.SelectDatas.Num() - 1;
            for (; local_11 >= 0; --local_11)
            {
                if (!(SelectTargetRequest.DataByRequestName.Contains(local_6.SelectDatas[local_11].Identifier.Name)))
                {
                    local_6.SelectDatas.RemoveAtSwap(local_11);
                    local_6.TargetDatas.RemoveAtSwap(local_11);
                }
            }
        }
        for (auto& local_32 : SelectTargetRequest.DataByRequestName)
        {
            if ((int(local_34.GetMethod())) == 0)
            {
                bool local_41;
                local_41 = false;
                int local_10 = local_6.SelectDatas.Num() - 1;
                for (; local_10 >= 0; --local_10)
                {
                    FViewportSelectTargetData& local_14 = local_6.SelectDatas[local_10];
                    if ((local_14.Identifier.Name == local_32.GetKey()))
                    {
                        if (local_34.GetbConfirmed())
                        {
                            local_6.SelectDatas.RemoveAtSwap(local_10);
                            local_6.TargetDatas.RemoveAtSwap(local_10);
                        }
                        else
                        {
                            local_14.Params = local_34.GetViewportSelectTargetParams();
                        }
                        local_41 = true;
                        break;
                    }
                }
                if (!(local_41) && !(local_34.GetbConfirmed()))
                {
                    FViewportSelectTargetData local_98;
                    local_98.Identifier.Name = local_32.GetKey();
                    local_98.Identifier.Type = ESelectTargetRequestType(0);
                    local_98.Params = local_34.GetViewportSelectTargetParams();
                    local_6.SelectDatas.Add(local_98);
                    FViewportSelectTargetEntityData local_106;
                    local_106.bTargetUpdated = false;
                    local_6.TargetDatas.Add(local_106);
                }
            }
        }
        Get local_110;
        FC_ViewportSelectTarget local_6_2 = local_110.opCall();
        if (local_6_2)
        {
            if (local_6_2.SelectDatas.IsEmpty())
            {
                Remove local_114;
                local_114.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnSelectTargetRequestViewRemove(const FECSEntity &inout Entity, const FC_SelectTargetRequestView &inout SelectTargetRequest) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_ViewportSelectTarget(const FECSEntity &inout Entity, FC_ViewportSelectTarget &inout ViewportSelectTarget) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ClientJob_UploadTargetEntitiesByViewport(const FECSEntity &inout Entity, const FC_ViewportSelectTarget &inout ViewportSelectTarget) const
    {
        if (ViewportSelectTarget.SelectDatas.Num() == 0)
        {
            return;
        }
        int local_4 = 0;
        while (local_4 < 0)
        {
            const FViewportSelectTargetData& local_6 = ViewportSelectTarget.SelectDatas[local_4];
            const FViewportSelectTargetEntityData& local_8 = ViewportSelectTarget.TargetDatas[local_4];
            if (local_8.bTargetUpdated)
            {
                FCE_SelectTargetEntityUpLoadEvent local_16;
                FFPTime local_14 = FFPTime(-1);
                local_16.RequestType = local_6.Identifier.Type;
                local_16.RequestName = local_6.Identifier.Name;
                local_16.TargetEntityIds = local_8.Entities;
            }
            ++local_4;
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateSelectTargetInput(const FECSEntity &inout Entity, const FC_SelectTargetRequestLogic &inout SelectTargetRequest, const FC_Input &inout Input, FC_ESMTrigger &inout ESMTrigger, const FCS_FixedTime &inout FixedTime) const
    {
        const FSelectTargetRuntimeData& local_22;
        Modify local_48;
        UESMInputTriggerAsset local_72;
        ESelectTargetQuickSelectType local_73 = ESelectTargetQuickSelectType(0);
        for (auto& local_20 : SelectTargetRequest.GetDataByRequestName())
        {
            if (local_22.GetViewportSelectTargetParams())
            {
                const FViewportSelectTargetParams& local_24;
                if (local_24.bNeedConfirm)
                {
                    FActiveTriggerResult local_40 = FESMInputTriggerItem::GetTriggerResult(local_24.ConfirmInput.CoreTriggerItem, Input.State, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
                    if (local_40.bActive && (FFPTime(local_40.TriggerTime).opCmp(FixedTime.Time) <= 0) && (local_40.GetTriggerExpireTime().opCmp(FixedTime.LastTime) >= 0))
                    {
                        local_48.opCall().GetModify_DataByRequestName()[local_20.GetKey()].SetbConfirmed(true);
                        if (!(local_24.ConfirmTriggerName.IsNone()))
                        {
                            FESMTriggerUtils::ActivateTrigger(Entity, ESMTrigger.Storage, local_24.ConfirmTriggerName, local_40.TriggerTime, FFPTime(local_24.ConfirmTriggerValidateTime), local_24.ConfirmInput.GetConsumeKey());
                        }
                    }
                }
                for (auto& local_70 : local_24.QuickSelectInputs)
                {
                    local_72 = local_70.GetKey();
                    if (!((local_72 != nullptr)))
                    {
                        continue;
                    }
                    FActiveTriggerResult local_32 = FESMInputTriggerItem::GetTriggerResult(local_70.GetKey().CoreTriggerItem, Input.State, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
                    if (local_32.bActive && (FFPTime(local_32.TriggerTime).opCmp(FixedTime.Time) <= 0) && (local_32.GetTriggerExpireTime().opCmp(FixedTime.LastTime) >= 0))
                    {
                        if (int(local_73) == 0)
                        {
                            TArray<FECSEntity> local_78;
                            local_78.Add(Entity);
                            local_48.opCall().GetModify_DataByRequestName()[local_20.GetKey()].SetbConfirmed(true);
                            ::FTargetSelectUtils::SetSelectTargetResultByRequestType(Entity, GetRequestType(), local_20.GetKey(), local_78);
                            if (!(local_24.ConfirmTriggerName.IsNone()))
                            {
                                FESMTriggerUtils::ActivateTrigger(Entity, ESMTrigger.Storage, local_24.ConfirmTriggerName, local_32.TriggerTime, FFPTime(local_24.ConfirmTriggerValidateTime), local_70.GetKey().GetConsumeKey());
                            }
                        }
                        else
                        {
                            if (int(local_73) >= 1 && (int(local_73) <= 4))
                            {
                                if ((int(local_73) - 1) < ::FTeamUtils::GetTeammates(Entity).Num())
                                {
                                    TArray<FECSEntity> local_88;
                                    FECSEntity local_92;
                                    Get local_96;
                                    const FC_PlayerController& local_98 = local_96.opCall();
                                    if (local_98)
                                    {
                                        local_92 = local_98.GetPlayerPawnEntity();
                                    }
                                    else
                                    {
                                        Get local_102;
                                        const FC_AIController& local_104 = local_102.opCall();
                                        if (local_104)
                                        {
                                            local_92 = FECSEntity(local_104.GetPawnEntity());
                                        }
                                    }
                                    if (!(local_92.IsValid()) || !(local_92.IsActive()))
                                    {
                                        continue;
                                    }
                                    if (local_24.QuickSelectMaxDistance > 0.0f)
                                    {
                                        GetDefaulted local_118;
                                        GetDefaulted local_114;
                                        if (local_114.opCall().GetPosition().Distance(local_118.opCall().GetPosition()) < local_24.QuickSelectMaxDistance)
                                        {
                                            local_88.Add(local_92);
                                        }
                                        else
                                        {
                                            if (local_24.GetQuickSelectOutOfRangeMessageHint())
                                            {
                                                ::MessageHintUtils::ShowMessageHint(Entity, local_24.GetQuickSelectOutOfRangeMessageHint(), TArray<FTextArgument>());
                                            }
                                        }
                                    }
                                    if (!(local_88.IsEmpty()))
                                    {
                                        local_48.opCall().GetModify_DataByRequestName()[local_20.GetKey()].SetbConfirmed(true);
                                        ::FTargetSelectUtils::SetSelectTargetResultByRequestType(Entity, GetRequestType(), local_20.GetKey(), local_88);
                                        if (!(local_24.ConfirmTriggerName.IsNone()))
                                        {
                                            FESMTriggerUtils::ActivateTrigger(Entity, ESMTrigger.Storage, local_24.ConfirmTriggerName, local_32.TriggerTime, FFPTime(local_24.ConfirmTriggerValidateTime), local_70.GetKey().GetConsumeKey());
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ReceiveSelectTargetResult(const FCE_SelectTargetEntityUpLoadEvent &inout Event) const
    {
        ::FTargetSelectUtils::SetSelectTargetResultByRequestType(Event.Sender, Event.RequestType, Event.RequestName, Event.TargetEntityIds);
        return;
    }
    UFUNCTION()
    void Job_ExpireSelectTargetResult(const FECSEntity &inout Entity, FC_SelectTargetResult &inout SelectTargetResult, const FCS_FixedTime &inout FixedTime) const
    {
        TArray<FName> local_4;
        for (auto& local_24 : SelectTargetResult.GetTargetEntitiesByRequestName())
        {
            if (FFPTime(GetExpireTime()).opCmp(FixedTime.Time) <= 0)
            {
                local_4.Add(local_24.GetKey());
            }
        }
        for (auto& local_42 : local_4)
        {
            local_42;
        }
        if (SelectTargetResult.GetTargetEntitiesByRequestName().Num() == 0)
        {
            Remove local_48;
            local_48.opCall();
        }
        else
        {
            SelectTargetResult.SetNextExpireTime(FFPTime(-1));
            for (auto& local_24_2 : SelectTargetResult.GetTargetEntitiesByRequestName())
            {
                if (FFPTime(SelectTargetResult.GetNextExpireTime()).opCmp(GetExpireTime()) > 0)
                {
                    SelectTargetResult.SetNextExpireTime(GetExpireTime());
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateSkilTargetPosition(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_SkillTargetPositionSelectRequest &inout SkillTargetPositionSelectRequest, FC_SkillTargetPosition &inout SkillTargetPosition, const FCS_FixedTime &inout FixedTime) const
    {
        FVector local_6 = FCharacterInputUtils::GetViewInput(Entity, FixedTime.LastTime);
        FSkillTargetPositionSelectParams local_14;
        float32 local_20 = local_14.MaxDistance;
        float32 local_19_2 = SkillTargetPosition.GetDistance() + (float32(local_6.Y) * local_14.DistanceSpeed);
        SkillTargetPosition.SetDistance(FMath::Clamp(local_19_2, local_14.MinDistance, local_20));
        if (SkillTargetPosition.GetDistance() < 0.0f)
        {
            local_20 = 0.0f;
        }
        else
        {
            local_20 = SkillTargetPosition.GetDistance();
        }
        SkillTargetPosition.SetDistance(local_20);
        float32 local_20_2 = float32(Transform.GetRotation().Rotator().Yaw);
        float32 local_21_2 = local_20_2 + local_14.MaxAngle;
        float32 local_23 = local_20_2 + local_14.MinAngle;
        float32 local_19_3 = SkillTargetPosition.GetAngle() + (float32(local_6.X) * local_14.AngleSpeed);
        SkillTargetPosition.SetAngle(FMath::Clamp(local_19_3, local_23, local_21_2));
        FVector local_12(FVector::ForwardVector);
        FVector local_44 = (FVector(Transform.GetPosition()) + (local_12 * SkillTargetPosition.GetDistance()).RotateAngleAxis(SkillTargetPosition.GetAngle(), FVector::UpVector));
        FVector local_52_2 = FVector(FVector::UpVector);
        FVector local_12_2 = (local_52_2 * local_14.PreTraceHeight);
        FVector local_38 = (local_44 + local_12_2);
        FVector local_64;
        FCollisionObjectQueryParams local_66;
        local_66.AddObjectTypesToQuery(ECollisionChannel(0));
        FCollisionQueryParams local_106;
        local_106.AddIgnoredEntityId(Entity.GetId());
        FHitResult local_174;
        bool local_177 = FPhysicsUtils::LineTraceSingle(Entity, false, EPhysicsTraceTag(29), local_174, Transform.GetPosition(), local_38, local_66, local_106);
        if (local_177)
        {
            local_64 = (FVector(local_174.ImpactPoint) + FVector::DownVector);
        }
        else
        {
            local_64 = local_38;
        }
        FVector local_52_3 = (FVector(FVector::DownVector) * local_14.TraceDownFloorDistance);
        FVector local_12_3 = (local_64 + local_52_3);
        local_106.bFindInitialOverlaps = false;
        if (FPhysicsUtils::LineTraceSingle(Entity, false, EPhysicsTraceTag(29), local_174, local_64, local_12_3, local_66, local_106))
        {
            local_12_3 = local_174.ImpactPoint;
        }
        SkillTargetPosition.SetDeterminedPosition(local_44);
        SkillTargetPosition.SetLastTargetPosition(SkillTargetPosition.GetTargetPosition());
        SkillTargetPosition.SetTargetPosition(local_12_3);
        return;
    }
    UFUNCTION()
    void ClentJob_UpdateCameraLookAtBySkillTargetPosition(const FECSEntity &inout Entity, const FC_SkillTargetPositionSelectRequest &inout SkillTargetPositionSelectRequest, const FC_SkillTargetPosition &inout SkillTargetPosition) const
    {
        return;
    }
    UFUNCTION()
    void ClentJob_UpdateSkillTargetPositionSelectRequestFX(const FECSEntity &inout Entity, const FC_SkillTargetPositionSelectRequest &inout SkillTargetPositionSelectRequest, const FC_SkillTargetPosition &inout SkillTargetPosition, const FC_InterpoTime &inout InterpoTime, const FCS_FixedTime &inout FixedTime) const
    {
        const FSkillTargetPositionSelectParams& local_2;
        FC_SkillTargetPositionView& local_10;
        int local_236 = 0;
        if (local_2.HintFxConfig.Asset.IsValid())
        {
            FDataObjectPtr local_82;
            TDataObjectPtr<FSkillTargetPositionSelectParams> local_34;
            local_34 = local_10.CurParams;
            local_82;
            if (!((local_34 == local_82)) && local_10.FXEntity.IsValid())
            {
                ECSFX::StopFX(local_10.FXEntity, false, false, 0.0f);
                local_10.FXEntity = ENTITY_NULL;
                local_10.CurParams = SkillTargetPositionSelectRequest.GetParams();
            }
            if ((local_10.FXEntity == ENTITY_NULL))
            {
                local_10.FXEntity = ECSFX::PlayFXDurational(Entity, local_2.HintFxConfig.ToFXConfig(), FFPTime(ECS::GetContextTime().ToSeconds()), 1.0f, false);
            }
            if (local_10.FXEntity.IsValid())
            {
                float local_218 = float32((FMath::Clamp(((FFPTime(InterpoTime.Time) - FixedTime.LastTime) / FixedTime.DeltaTime), 0.0, 1.0)));
                local_236.Location = (FMath::Lerp(SkillTargetPosition.GetLastTargetPosition(), SkillTargetPosition.GetTargetPosition(), local_218) + local_2.HintFxConfig.LocationOffset);
                local_236.Rotation = local_2.HintFxConfig.RotationOffset.Quaternion();
            }
            return;
        }
        Modify local_248;
        local_10 = local_248.opCall();
        if (local_10)
        {
            if (local_10.FXEntity.IsValid())
            {
                ECSFX::StopFX(local_10.FXEntity, false, false, 0.0f);
            }
            Remove local_252;
            local_252.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClentJob_RemoveSkillTargetPositionSelectRequestFX(const FECSEntity &inout Entity, FC_SkillTargetPositionView &inout SkillTargetPositionView) const
    {
        if (SkillTargetPositionView.FXEntity)
        {
            ECSFX::StopFX(SkillTargetPositionView.FXEntity, false, false, 0.0f);
        }
        Remove local_8;
        local_8.opCall();
        return;
    }
    UFUNCTION()
    void Run_Job_ClearSelectTargetRequest() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ClearSelectTargetRequest(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearSelectTargetRequest(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnSelectTargetRequestLogicModified() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSelectTargetRequestLogicOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnSelectTargetRequestLogicModified(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorSelectTargetRequestLogicOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnSelectTargetRequestLogicModified(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnSelectTargetRequestLogicRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSelectTargetRequestLogicOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnSelectTargetRequestLogicRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnSelectTargetRequestViewModified() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSelectTargetRequestViewOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnSelectTargetRequestViewModified(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorSelectTargetRequestViewOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnSelectTargetRequestViewModified(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnSelectTargetRequestViewRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSelectTargetRequestViewOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnSelectTargetRequestViewRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ViewportSelectTarget() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_ViewportSelectTarget(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_ViewportSelectTarget(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UploadTargetEntitiesByViewport() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_UploadTargetEntitiesByViewport(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UploadTargetEntitiesByViewport(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSelectTargetInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateSelectTargetInput(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateSelectTargetInput(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ReceiveSelectTargetResult() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SelectTargetEntityUpLoadEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SelectTargetEntityUpLoadEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_ReceiveSelectTargetResult(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_ExpireSelectTargetResult(const FC_SelectTargetResult &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextExpireTime());
        FName local_8 = FName("S_TargetSelectSystem::Job_ExpireSelectTargetResult");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_ExpireSelectTargetResult(const FC_SelectTargetResult &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextExpireTime());
        FName local_8 = FName("S_TargetSelectSystem::Job_ExpireSelectTargetResult");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_ExpireSelectTargetResult(const FC_SelectTargetResult &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextExpireTime());
        FName local_8 = FName("S_TargetSelectSystem::Job_ExpireSelectTargetResult");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_ExpireSelectTargetResult() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorSelectTargetResultOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_ExpireSelectTargetResult(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorSelectTargetResultOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_ExpireSelectTargetResult(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_ExpireSelectTargetResult() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorSelectTargetResultOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_ExpireSelectTargetResult(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorSelectTargetResultOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_ExpireSelectTargetResult(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_ExpireSelectTargetResult() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorSelectTargetResultOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_ExpireSelectTargetResult(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorSelectTargetResultOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_ExpireSelectTargetResult(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ExpireSelectTargetResult() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetNextExpireTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetNextExpireTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_ExpireSelectTargetResult(local_68, local_70, local_6);
            MarkModifiedIfDirty local_78;
            local_78.opCall(local_70);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSkilTargetPosition() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateSkilTargetPosition(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateSkilTargetPosition(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClentJob_UpdateCameraLookAtBySkillTargetPosition() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_176 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClentJob_UpdateCameraLookAtBySkillTargetPosition(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_36 = local_138.Proceed();
            ++local_104;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClentJob_UpdateCameraLookAtBySkillTargetPosition(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClentJob_UpdateSkillTargetPositionSelectRequestFX() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_190 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClentJob_UpdateSkillTargetPositionSelectRequestFX(local_40, local_42, local_48, local_54, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_118 = 0;
        FECSRuntimeViewIterator local_152 = local_96.Iterator();
        for (; local_152.CanProceed;)
        {
            local_40 = local_152.Proceed();
            ++local_118;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClentJob_UpdateSkillTargetPositionSelectRequestFX(local_190, local_42, local_48, local_54, local_6);
        }
        local_4.UpdateCachedEntityCount(local_118);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClentJob_RemoveSkillTargetPositionSelectRequestFX() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClentJob_RemoveSkillTargetPositionSelectRequestFX(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClentJob_RemoveSkillTargetPositionSelectRequestFX(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

