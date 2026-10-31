struct FCompareInteractionTargetParam
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    EInteractSelectType InteractSelectType;
    UPROPERTY()
    float32 Score = -1.0f;
    UPROPERTY()
    UInteractionBehaviorBase BehaviorConfig = nullptr;
    UPROPERTY()
    int ShowFailConditionIndex = -1;
    UPROPERTY()
    bool bShowFailFromSource = false;

}

struct FInteractSourceCheckBaseParam
{
    UPROPERTY()
    FECSEntity InteractSourceEntity;
    UPROPERTY()
    float32 InteractDistance = 0.0f;
    UPROPERTY()
    float32 InteractTipDistance = 0.0f;
    UPROPERTY()
    EInteractSourceType SourceType = EInteractSourceType(1);

}

struct FClientInteractSourceCheckParam : FInteractSourceCheckBaseParam
{
    FInteractSourceCheckBaseParam _base_FInteractSourceCheckBaseParam;
    UPROPERTY()
    FVector ViewPosition;
    UPROPERTY()
    FRotator ViewDir;
    UPROPERTY()
    FVector2D ViewportSize;

    FClientInteractSourceCheckParam()
    {
        return;
    }
    FClientInteractSourceCheckParam(const FInteractSourceCheckBaseParam &inout BaseParam)
    {
        this._base_FInteractSourceCheckBaseParam = BaseParam.InteractSourceEntity;
        this.InteractDistance = BaseParam.InteractDistance;
        this.InteractTipDistance = BaseParam.InteractTipDistance;
        this.SourceType = BaseParam.SourceType;
        return;
    }
}

struct FInteractionBehaviorToPointIndex
{
    UPROPERTY()
    TArray<FECSEntity> InteractEntities;
    UPROPERTY()
    TArray<int> IndexOfPoints;

    FInteractionBehaviorToPointIndex()
    {
        return;
    }
}

class US_InteractionSystem : UECSScriptSystem
{
    UPROPERTY()
    UDataTable InteractionPointTypeTable;
    UPROPERTY()
    float32 MaxInteractDistance = 1000.0f;
    UPROPERTY()
    float32 MaxInteractTipDistance = 1000.0f;

    bool CheckInteractTargetPointInScreen(const FVector &inout InteractPointLocation, const FClientInteractSourceCheckParam &inout InteractSourceCheckParam, FVector2D &inout InteractPointScreenRatio) const
    {
        int local_17;
        int local_1 = 1063675494;
        int local_3 = 1063675494;
        FECSWorldPtr local_8 = InteractSourceCheckParam._base_FInteractSourceCheckBaseParam.GetWorld();
        Get local_12;
        APlayerController local_6 = local_12.opCall().UEPlayerController;
        FVector2D local_16;
        local_6.ProjectWorldLocationToScreen(InteractPointLocation, local_16, false);
        InteractPointScreenRatio = (local_16 / InteractSourceCheckParam.ViewportSize);
        if (FMath::Abs(((InteractPointScreenRatio.X * 2.0) - 1.0)) > 0.8999999761581421)
        {
            local_17 = 0;
        }
        else
        {
            float local_26_2 = InteractPointScreenRatio.Y * 2.0;
            bool local_18 = (FMath::Abs((local_26_2 - 1.0)) <= 0.8999999761581421);
            local_17 = local_18;
        }
        return (local_17 != 0);
    }
    bool NeedExcludeInteractTargetEntity(const FECSEntity &inout SourceEntity, const FECSEntity &inout InteractTargetEntity, const EInteractMode InteractMode) const
    {
        int local_1 = int(InteractMode);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
                else
                {
                    return false;
                }
            }
            else
            {
                Get local_8;
                const FC_PawnRiddingMount& local_10 = local_8.opCall();
                if (local_10)
                {
                    if ((FECSEntity(local_10.GetMountEntity()) == InteractTargetEntity))
                    {
                        return true;
                    }
                }
                Get local_18;
                const FC_RuntimeHookMoveTarget& local_20 = local_18.opCall();
                if (local_20)
                {
                    if ((FECSEntity(local_20.GetTargetEntity()) == InteractTargetEntity))
                    {
                        return true;
                    }
                }
                return false;
            }
        }
        return true;
    }
    void GetAutoInteractTargetInfo(const FInteractionCandidateEntity &inout CandidateEntity, const EAutoInteractChannelType AutoInteractChannelType, const EInteractMode InteractMode, const FClientInteractSourceCheckParam &inout InteractSourceCheckParam, TArray<FInteractTargetInfo> &inout AutoInteractTargetInfo) const
    {
        // body not fully recovered — stub [argmismatch:argtype]
    }
    TArray<FECSEntity> GetAddingProgressPlayerList(const FECSEntity &inout TargetEntity, const FC_RuntimeInteractTargetStatus &inout RuntimeInteractTargetStatus, const FInteractionPointAndBehaviorIndex &inout PointAndBehaviorIndex) const
    {
        TArray<FECSEntity> local_4;
        if (RuntimeInteractTargetStatus)
        {
            int local_7 = RuntimeInteractTargetStatus.GetInteractionPointStatusIndex(PointAndBehaviorIndex);
            if (local_7 < 0)
            {
                return local_4;
            }
            const FRuntimeInteractionPointStatus& local_10 = RuntimeInteractTargetStatus.GetInteractionPointStatus()[local_7];
            for (auto& local_24 : local_10.GetInteractingSourceEntities())
            {
                Has local_28;
                bool local_5 = local_28.opCall();
                if (local_5)
                {
                    local_4.Add(local_24);
                }
            }
        }
        return local_4;
    }
    void BroadcastKLFlowInteractEvent(const FName &inout EventTag, const FECSEntity &inout Sender, const FECSEntity &inout TargetEntity, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex) const
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FKLFlowEvent_Interact local_7;
        int local_8 = InteractTargetPointAndBehaviorIndex.GetPointIndex();
        Get local_12;
        const FC_InteractionTargetConfig& local_14 = local_12.opCall();
        if (local_14)
        {
            if (InteractTargetPointAndBehaviorIndex.GetPointIndex() >= 0 && (InteractTargetPointAndBehaviorIndex.GetPointIndex() < local_14.InteractionPoints.Num()))
            {
                local_7.InteractName = local_14.InteractionPoints[InteractTargetPointAndBehaviorIndex.GetPointIndex()].IdentifierPointName;
            }
        }
        local_7.EntityId = FKLFlowECSEntityId(TargetEntity.GetId());
        local_7.InteracterEntityId = FKLFlowECSEntityId(Sender.GetId());
        Has local_22;
        local_7.bIsPlayer = (local_22.opCall() != 0);
        ::KLFlowLibrary::PostFlowEvent(EventTag, FInstancedStruct::Make(local_7));
        return;
    }
    void BeginInteract(const FECSEntity &inout InteractSourceEntity, const FECSEntity &inout InteractTargetEntity, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const EInteractMode InteractMode, const bool bIsSecondaryInteract) const
    {
        int local_18 = 0;
        int local_24 = 0;
        int local_26;
        int local_50 = 0;
        int local_134 = 0;
        int local_140 = 0;
        if (::FInteractUtils::CheckPassedInteractionCondition(InteractSourceEntity, InteractTargetEntity, InteractTargetPointAndBehaviorIndex, false))
        {
            ::FASCommonUtils::GetRiderEntity(InteractSourceEntity);
            int local_11 = int(InteractMode);
            if (local_11 <= 1)
            {
                if (local_11 != 0)
                {
                    if (local_11 != 1)
                    {
                    }
                }
                else
                {
                    if (bIsSecondaryInteract)
                    {
                        local_18.SetInteractType(local_24.GetInteractType());
                        local_26 = int(local_24.GetSubType());
                        local_18.SetSubType(EInteractionSubTypeForESM(local_26));
                        local_18.SetTargetEntity(local_24.GetTargetEntity());
                        local_18.SetTargetPointAndBehaviorIndex(local_24.GetTargetPointAndBehaviorIndex());
                    }
                    local_24.SetbIsAutoInteract(false);
                    UInteractionBehaviorBase local_34 = ::FInteractUtils::GetInteractionBehaviorFromEntity(InteractTargetEntity, InteractTargetPointAndBehaviorIndex);
                    local_24.SetInteractType(local_34.InteractType);
                    int local_12 = InteractTargetPointAndBehaviorIndex.GetPointIndex();
                    if local_34.bOverrideInteractPointSubType
                    {
                        local_26 = local_34.OverrideSubType;
                    }
                    else
                    {
                        FInteractionPoint local_40;
                        local_26 = local_40.SubType;
                    }
                    local_24.SetSubType(EInteractionSubTypeForESM(local_26));
                    local_24.SetbIsSecondaryInteractSource(local_34.bIsSecondaryInteractSource);
                    FECSWorldPtr local_44 = InteractSourceEntity.GetWorld();
                    FFPTime local_54 = FTransformUtils::GetPlayerRollbackTime(InteractSourceEntity, local_50);
                    FVector local_60;
                    FQuat local_68;
                    if (::FInteractUtils::GetInteractTargetLocationAndRotation(InteractTargetEntity, InteractTargetPointAndBehaviorIndex.GetPointIndex(), local_54, local_60, local_68, false))
                    {
                        local_24.SetInteractTargetLocation(local_60);
                        local_24.SetInteractTargetRotation(local_68.Rotator());
                        Get local_78;
                        const FC_Transform& local_80 = local_78.opCall();
                        if (local_80)
                        {
                            FVector local_104 = (FVector(local_24.GetInteractTargetLocation()) - FVector(local_80.GetPosition()));
                            FQuat local_120 = local_80.GetRotation();
                            local_104 = local_120.UnrotateVector(local_104.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
                            local_24.SetTargetPointYawToPlayer(float32(local_104.Rotation().Yaw));
                            local_24.SetTargetPointPitchToPlayer(float32(local_104.Rotation().Pitch));
                        }
                    }
                    local_24.SetTargetPointAndBehaviorIndex(InteractTargetPointAndBehaviorIndex);
                    local_24.SetTargetEntity(InteractTargetEntity);
                    local_24.SetExpireTime(local_50.Time);
                    if (int(ECS::GetRuntimeInfo().IsServer) != 0)
                    {
                        local_134.AddPending(InteractTargetPointAndBehaviorIndex.GetPointIndex(), InteractTargetPointAndBehaviorIndex.GetBehaviorIndex());
                        this.ReportSocialActionTrigger(InteractSourceEntity, InteractTargetEntity, EInteractionSubTypeForESM(local_24.GetSubType()));
                    }
                    local_140.TargetEntity = InteractTargetEntity;
                    local_140.InteractTargetPointAndBehaviorIndex = InteractTargetPointAndBehaviorIndex;
                }
            }
            return;
        }
        return;
    }
    void ReportSocialActionTrigger(const FECSEntity &inout InteractSourceEntity, const FECSEntity &inout InteractTargetEntity, const EInteractionSubTypeForESM SubType) const
    {
        if (int(SubType) == 0)
        {
            return;
        }
        ::FASCommonUtils::GetUniquePlayerEntity(InteractSourceEntity);
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FPbPlayerLogDsSocialActionTrigger local_26;
        local_26.SetActionType(int(SubType));
        ::FASCommonUtils::GetUniquePlayerEntity(InteractTargetEntity);
        Get local_34;
        const FC_PlayerController& local_36 = local_34.opCall();
        if (local_36)
        {
            local_26.SetTargetUid(local_36.GetPlayerId());
        }
        ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(InteractSourceEntity, 105003, local_26.ToWrapper());
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveIsBeingInteractedTag(const FECSEntity &inout Entity, const FC_IsBeingInteractedTag &inout IsBeingInteractedTag) const
    {
        Modify local_4;
        FC_RuntimeInteractTargetStatus& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_11 = local_6.GetInteractionBehaviorStatus().Num() - 1;
            for (; local_11 >= 0; --local_11)
            {
                if (!(local_6.GetInteractionBehaviorStatus()[local_11].GetBehavior().Get().InteractProgressConfig.bKeepProgressWhenInterrupt))
                {
                    local_6.GetModify_InteractionBehaviorStatus().RemoveAt(local_11);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleBeginInteractEvent(const FCE_BeginInteractEvent &inout Event) const
    {
        this.BeginInteract(Event.Sender, Event.TargetEntity, Event.InteractTargetPointAndBehaviorIndex, Event.InteractMode, Event.bIsSecondaryInteract);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleServerTriggerBeginInteractEvent(const FCE_ServerTriggerBeginInteractEvent &inout Event) const
    {
        this.BeginInteract(Event.Sender, Event.TargetEntity, Event.InteractTargetPointAndBehaviorIndex, EInteractMode(0), Event.bIsSecondaryInteract);
        return;
    }
    UFUNCTION()
    void Job_HandleEndInteractEvent(const FCE_EndInteractEvent &inout Event) const
    {
        this.BroadcastKLFlowInteractEvent(KLFlowEventTags::Interact_EndInteract, Event.Sender, Event.TargetEntity, Event.InteractTargetPointAndBehaviorIndex);
        ::FInteractUtils::ExecuteInteractEndAction(Event.Sender, Event.TargetEntity, Event.InteractTargetPointAndBehaviorIndex);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleServerTriggerEndInteractEvent(const FCE_ServerTriggerEndInteractEvent &inout Event) const
    {
        this.BroadcastKLFlowInteractEvent(KLFlowEventTags::Interact_EndInteract, Event.Sender, Event.TargetEntity, Event.InteractTargetPointAndBehaviorIndex);
        ::FInteractUtils::ExecuteInteractEndAction(Event.Sender, Event.TargetEntity, Event.InteractTargetPointAndBehaviorIndex);
        return;
    }
    UFUNCTION()
    void Job_TickCurrentInteractingCondition(const FECSEntity &inout Entity, const FC_InteractionInfoForESM &inout InteractionInfoForESM) const
    {
        bool local_3 = ::FInteractUtils::CheckPassedInteractionCondition(Entity, InteractionInfoForESM.GetTargetEntity(), InteractionInfoForESM.GetTargetPointAndBehaviorIndex(), true);
        if (!(local_3))
        {
            ::FInteractUtils::ExecuteInteractEndAction(Entity, InteractionInfoForESM.GetTargetEntity(), InteractionInfoForESM.GetTargetPointAndBehaviorIndex());
        }
        return;
    }
    UFUNCTION()
    void Job_TickInteractionInfoForESM(const FECSEntity &inout Entity, FC_InteractionInfoForESM &inout InteractionInfoForESM, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_4;
        if (!(local_4.opCall()) && (FFPTime(InteractionInfoForESM.GetExpireTime()).opCmp(FixedTime.Time) <= 0))
        {
            Remove local_14;
            local_14.opCall();
            Remove local_18;
            local_18.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_EndKeepInteractOnSourceEndPlay(const FECSEntity &inout SourceEntity, const FC_InteractionInfoForESM &inout InteractionInfoForESM) const
    {
        FECSEntity local_4 = FECSEntity(InteractionInfoForESM.GetTargetEntity());
        FInteractionPointAndBehaviorIndex local_6;
        local_6 = InteractionInfoForESM.GetTargetPointAndBehaviorIndex();
        Get local_12;
        const FC_SecondaryInteractSourceInfo& local_14 = local_12.opCall();
        if (local_14)
        {
            local_4 = local_14.GetTargetEntity();
            local_6 = local_14.GetTargetPointAndBehaviorIndex();
        }
        if (!(local_4.IsValid()))
        {
            return;
        }
        this.BroadcastKLFlowInteractEvent(KLFlowEventTags::Interact_EndInteract, SourceEntity, local_4, local_6);
        ::FInteractUtils::ExecuteInteractEndAction(SourceEntity, local_4, local_6);
        UInteractionBehaviorBase local_20 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_4, local_6);
        if (local_20 != nullptr)
        {
            local_20.EndKeepInteract(SourceEntity, local_4, local_6);
        }
        ::FInteractUtils::RemoveInteractingSourceEntityFromTarget(SourceEntity, local_4, -1, -1);
        return;
    }
    void CollectPossibleInteractTargets(const FECSEntity &inout SourceEntity, const FVector &inout QueryLocation, const bool bCollectBestF, const bool bCollectBestZ, const float32 SourceInteractDistance, const bool bCollectInteractTipTarget, const float32 SourceInteractTipDistance, const EInteractSourceType SourceType, const bool bIsSecondaryTarget, TArray<FInteractionCandidateEntity> &inout OutCandidateEntities) const
    {
        float32 local_6 = 0.0f;
        FC_InteractionTargetConfig local_44;
        bool local_47;
        int local_54 = 0;
        bool local_60;
        int local_70 = 0;
        if (!(bCollectBestF) && !(bCollectBestZ) && !(bCollectInteractTipTarget))
        {
            return;
        }
        float32 local_5 = FMath::Max(SourceInteractDistance, this.MaxInteractDistance);
        float32 local_3 = FMath::Max(SourceInteractTipDistance, this.MaxInteractTipDistance);
        if (bCollectBestF || bCollectBestZ)
        {
        }
        else
        {
        }
        float32 local_7 = local_6;
        bool local_2 = bCollectBestF || bCollectBestZ;
        if (local_2 && bCollectInteractTipTarget)
        {
            local_7 = FMath::Max(local_5, local_3);
        }
        TArray<uint> local_12;
        FSceneGridUtils::QueryCircle(ECS::GetECSWorld(), ESceneGridType(0), QueryLocation, local_7, local_12);
        if (local_12.Num() == 0)
        {
            return;
        }
        float32 local_4 = FMath::Square(SourceInteractDistance);
        local_6 = FMath::Square(SourceInteractTipDistance);
        for (auto local_33 : local_12)
        {
            if (local_33 == SourceEntity.GetIdValue())
            {
                continue;
            }
            FECSEntity local_38 = FECSEntity(local_33);
            if (!(local_38.IsActive()))
            {
                continue;
            }
            if (!(local_44))
            {
                continue;
            }
            bool local_1_2 = bCollectBestF && local_44.HasInteractPointWithMode(EInteractMode(0));
            local_2 = bCollectBestZ && local_44.HasInteractPointWithMode(EInteractMode(1));
            if (!(bCollectInteractTipTarget))
            {
                local_47 = false;
            }
            else
            {
                local_47 = local_44.bHasTip;
            }
            if (!(local_1_2) && !(local_2) && !(local_47))
            {
                continue;
            }
            if (!(local_54))
            {
                continue;
            }
            float32 local_19 = float32(QueryLocation.DistSquared(local_54.GetPosition()));
            bool local_45 = local_1_2 || local_2;
            local_60 = local_45 && (local_19 <= local_4 || (local_19 <= local_44.MaxInteractDistanceSQ));
            local_45 = local_47 && ((local_19 <= local_6) || (local_19 <= local_44.MaxInteractTipDistanceSQ));
            if (!(local_60) && !(local_45))
            {
                continue;
            }
            bool local_48 = local_1_2 && local_60;
            bool local_59 = local_48 && !(this.NeedExcludeInteractTargetEntity(SourceEntity, local_38, EInteractMode(0)));
            local_48 = local_2 && local_60;
            bool local_62 = !(local_59);
            if ((local_62 && !(local_48)) && !(local_45))
            {
                continue;
            }
            if (!(local_70) || local_70.GetbRuntimeDisabled())
            {
                continue;
            }
            if (!((local_44.InteractionPoints.Num() <= 32)))
            {
                continue;
            }
            FInteractionCandidateEntity local_76;
            local_76.Entity = local_38;
            local_76.bBestF = local_59;
            local_76.bBestZ = local_48;
            local_76.bTip = local_45;
            local_76.bIsSecondaryTarget = bIsSecondaryTarget;
            int local_77 = 0;
            for (; local_77 < local_44.InteractionPoints.Num(); ++local_77)
            {
                if (!(local_70.IsRuntimePointEnabled(local_77)))
                {
                    continue;
                }
                const FInteractionPoint& local_80 = local_44.InteractionPoints[local_77];
                int local_81 = int(local_80.AvailableSourceTypeMask) & int(SourceType);
                if (local_81 == 0 || !(local_80.PointType.IsValid()))
                {
                    continue;
                }
                local_76.PointIndices.SetBit(local_77, true);
            }
            if (!(local_76.PointIndices.IsEmpty()))
            {
                OutCandidateEntities.Add(local_76);
            }
        }
        return;
    }
    void BuildInteractionCandidates(const TArray<FInteractionCandidateEntity> &inout CandidateEntities, const FInteractSourceCheckBaseParam &inout InteractSourceCheckParam, FC_InteractionCandidates &inout InteractionCandidates) const
    {
        int local_24 = 0;
        bool local_25;
        bool local_26;
        bool local_27;
        FInteractionPointTypeConfig local_34;
        bool local_59;
        bool local_62;
        int local_117;
        bool local_119;
        bool local_120;
        for (auto& local_16 : CandidateEntities)
        {
            FECSEntity local_18 = local_16.Entity;
            if (!(local_24))
            {
                continue;
            }
            local_25 = local_16.bBestF;
            local_26 = local_16.bBestZ;
            if (!(local_25) && !(local_26) && !(local_16.bTip))
            {
                continue;
            }
            int local_28 = 0;
            for (; local_28 < local_24.InteractionPoints.Num(); ++local_28)
            {
                if (!(local_16.PointIndices.GetBit(local_28)))
                {
                    continue;
                }
                const FInteractionPoint& local_32 = local_24.InteractionPoints[local_28];
                TDataObjectPtr<FInteractionPointTypeConfig> local_58 = TDataObjectPtr<FInteractionPointTypeConfig>(local_32.PointType);
                bool local_13 = local_25 && (int(local_34.InteractMode) == 0);
                local_27 = local_26 && (int(local_34.InteractMode) == 1);
                if (!(local_13) && !(local_27) && !(local_16.bTip))
                {
                    continue;
                }
                FVector local_68;
                FQuat local_76;
                ::FInteractUtils::GetInteractTargetLocationAndRotationForClient(local_18, local_32, local_68, local_76, true, false);
                int local_77 = 0;
                for (; local_77 < local_34.Behaviors.Num(); ++local_77)
                {
                    TSubclassOf<UInteractionBehaviorBase> local_80 = TSubclassOf<UInteractionBehaviorBase>(local_34.Behaviors[local_77]);
                    if ((local_80 == nullptr))
                    {
                        continue;
                    }
                    UInteractionBehaviorBase local_84 = local_80.GetDefaultObject();
                    if (local_84 == nullptr)
                    {
                        continue;
                    }
                    if (!(::FInteractUtils::CheckWithinInteractSourceMaxNumber(local_18, local_84, local_28, local_77)))
                    {
                        continue;
                    }
                    FInteractionCandidateBehaviorInfo local_116;
                    local_116.TargetEntity = local_18;
                    local_116.PointAndBehaviorIndex.SetPointIndex(local_28);
                    local_116.PointAndBehaviorIndex.SetBehaviorIndex(local_77);
                    local_116.Location = local_68;
                    local_116.Rotation = local_76;
                    local_62 = local_16.bIsSecondaryTarget;
                    local_116.bIsSecondaryTarget = local_62;
                    EInteractionBehaviorEvaluateResult local_118 = EInteractionBehaviorEvaluateResult::NotChecked;
                    local_117 = local_118;
                    local_119 = false;
                    local_120 = false;
                    if (local_13 || local_27)
                    {
                        FCompareInteractionTargetParam local_130;
                        local_117 = ::FInteractUtils::EvaluateInteractionBehaviorWithTarget(InteractSourceCheckParam, local_18, local_32, local_84, local_68, local_76, false, local_130);
                        if (local_117 == 1)
                        {
                            bool local_133;
                            int local_132 = -1;
                            local_133 = false;
                            local_119 = true;
                            local_120 = (int(local_84.CheckCustomCondition(InteractSourceCheckParam.InteractSourceEntity, local_18, local_32, false, local_132, local_133)) != 1);
                            if (local_120)
                            {
                                local_62 = local_13 && (int(local_84.InteractType) != 0);
                                local_116.bBestF = local_62;
                                local_59 = local_27 && (int(local_84.InteractType) != 0);
                                local_116.bBestZ = local_59;
                                if (local_116.bBestF || local_116.bBestZ)
                                {
                                    local_116.Priority = ::FInteractCompareUtils::GetPriority(EInteractSelectType((int(::FInteractCompareUtils::GetInteractPointParam(local_32, local_84).SelectType))));
                                    local_116.NonCameraScore = local_130.Score;
                                    local_116.ShowFailConditionIndex = local_132;
                                    local_116.bShowFailFromSource = local_133;
                                }
                            }
                        }
                    }
                    local_62 = local_16.bTip;
                    if (local_62)
                    {
                        TDataObjectPtr<FInteractTipPreset> local_162 = ::FInteractUtils::GetInteractTipPreset(local_32, local_84);
                        local_62 = local_162.IsSet() && !(local_119 && !(local_120));
                        if (local_62 && (int(::FInteractUtils::EvaluateInteractionBehaviorWithTipTarget(InteractSourceCheckParam, local_18, local_32, local_84, local_162.Get().InteractTipParam, local_68, local_76, EInteractionBehaviorEvaluateResult(local_117))) == 1))
                        {
                            if (!(local_119))
                            {
                                bool local_187;
                                int local_132_2 = -1;
                                local_187 = false;
                                local_119 = true;
                                local_120 = (int(local_84.CheckCustomCondition(InteractSourceCheckParam.InteractSourceEntity, local_18, local_32, false, local_132_2, local_187)) != 1);
                            }
                            local_116.bTip = local_120;
                        }
                    }
                    local_59 = local_116.bBestF;
                    local_62 = local_59 || local_116.bBestZ;
                    if (local_62 || local_116.bTip)
                    {
                        InteractionCandidates.CandidateBehaviors.Add(local_116);
                    }
                }
            }
        }
        return;
    }
    void SortInteractionCandidatePriorities(FC_InteractionCandidates &inout InteractionCandidates) const
    {
        bool local_4;
        int local_8;
        InteractionCandidates.PrioritySortedIndices.Reset(0);
        int local_2 = 0;
        for (; local_2 < InteractionCandidates.CandidateBehaviors.Num(); ++local_2)
        {
            FInteractionCandidateBehaviorInfo& local_6 = InteractionCandidates.CandidateBehaviors[local_2];
            local_4 = local_6.bBestF;
            if (local_4)
            {
                local_4 = true;
            }
            else
            {
                local_4 = local_6.bBestZ;
            }
            if (local_4)
            {
                InteractionCandidates.PrioritySortedIndices.Add(local_2);
            }
        }
        int local_2_2 = 1;
        for (; local_2_2 < InteractionCandidates.PrioritySortedIndices.Num(); )
        {
            local_8 = InteractionCandidates.PrioritySortedIndices[local_2_2];
            int local_9 = local_2_2;
            if (local_9 <= 0)
            {
                local_4 = false;
            }
            else
            {
                local_4 = ((InteractionCandidates.CandidateBehaviors[InteractionCandidates.PrioritySortedIndices[(local_9 - 1)]].Priority) < InteractionCandidates.CandidateBehaviors[local_8].Priority);
            }
            if (local_4)
            {
                InteractionCandidates.PrioritySortedIndices[local_9] = InteractionCandidates.PrioritySortedIndices[local_9 - 1];
                --local_9;
            }
            InteractionCandidates.PrioritySortedIndices[local_9] = local_8;
            ++local_2_2;
        }
        return;
    }
    bool IsInteractionCandidateCameraValid(const FInteractionCandidateBehaviorInfo &inout Candidate, const FClientInteractSourceCheckParam &inout InteractSourceCheckParam, const bool bCheckViewDir, float32 &out OutScore) const
    {
        // body not fully recovered — stub [argmismatch:argtype]
        bool __r; return __r;
    }
    UFUNCTION()
    void ClientJob_CollectInteractionCandidateEntities(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_InteractSourceConfig &inout InteractSourceConfig) const
    {
        FC_InteractionCandidates local_20;
        bool local_27;
        Has local_26;
        Has local_32;
        if (!(!(local_26.opCall()) && !(local_32.opCall())))
        {
            local_27 = false;
        }
        else
        {
            local_27 = InteractSourceConfig.InteractSourceCondition.Evaluate(Entity);
        }
        Has local_38;
        bool local_21 = local_27 && !(local_38.opCall());
        Has local_44;
        bool local_34 = local_21 && !(local_44.opCall());
        FInteractSourceCheckBaseParam local_52 = ::FInteractUtils::BuildInteractSourceCheckBaseParam(Entity);
        if (local_27)
        {
            this.CollectPossibleInteractTargets(Entity, Transform.GetPosition(), local_34, local_21, local_52.InteractDistance, true, local_52.InteractTipDistance, local_52.SourceType, false, local_20.CandidateEntities);
        }
        GetDefaulted local_68;
        local_20.bSecondaryInteracting = local_27 && local_68.opCall().GetbIsSecondaryInteractSource();
        if (local_20.bSecondaryInteracting)
        {
            this.CollectPossibleSecondaryInteractTargets(Entity, Transform.GetPosition(), true, local_52.InteractDistance, true, local_52.InteractTipDistance, local_52.SourceType, true, local_20.CandidateEntities);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_BuildInteractionCandidates(const FECSEntity &inout Entity, FC_InteractionCandidates &inout InteractionCandidates) const
    {
        FInteractSourceCheckBaseParam local_8 = ::FInteractUtils::BuildInteractSourceCheckBaseParam(Entity);
        this.BuildInteractionCandidates(InteractionCandidates.CandidateEntities, local_8, InteractionCandidates);
        this.SortInteractionCandidatePriorities(InteractionCandidates);
        return;
    }
    UFUNCTION()
    void ClientJob_TickInteraction(const FECSEntity &inout Entity, const FC_TransformHistory &inout TransformHistory) const
    {
        FC_InteractionCandidates local_6;
        int local_70 = 0;
        int local_89;
        int local_94;
        int local_95;
        int local_116 = 0;
        int local_133;
        if (!(local_6))
        {
            Remove local_16;
            Remove local_12;
            local_12.opCall();
            local_16.opCall();
            Remove local_20;
            local_20.opCall();
            return;
        }
        FClientInteractSourceCheckParam local_44 = ::FInteractUtils::BuildClientInteractSourceCheckParam(Entity, TransformHistory);
        int local_69 = -1;
        int local_71 = -1;
        int local_72 = -1;
        float32 local_73 = -1.0f;
        float32 local_75 = -1.0f;
        float32 local_76 = -1.0f;
        auto local_82 = local_6.PrioritySortedIndices.Iterator();
        for (; local_82.CanProceed;)
        {
            local_70 = local_82.Proceed();
            local_89 = local_70;
            const FInteractionCandidateBehaviorInfo& local_92 = local_6.CandidateBehaviors[local_89];
            float32 local_93 = -1.0f;
            if (local_92.bBestF)
            {
                if (!(local_92.bIsSecondaryTarget))
                {
                    if (local_69 >= 0)
                    {
                        local_95 = local_6.CandidateBehaviors[local_69].Priority;
                    }
                    else
                    {
                        local_95 = -1;
                    }
                    if (int(local_92.Priority) >= local_95)
                    {
                        if (this.IsInteractionCandidateCameraValid(local_92, local_44, true, local_93) && (int(local_92.Priority) > local_95 || (local_93 > local_73)))
                        {
                            local_69 = local_89;
                            local_73 = local_93;
                        }
                    }
                }
                else
                {
                    if (local_92.bIsSecondaryTarget)
                    {
                        if (local_72 >= 0)
                        {
                            local_94 = local_6.CandidateBehaviors[local_72].Priority;
                        }
                        else
                        {
                            local_94 = -1;
                        }
                        if (int(local_92.Priority) >= local_94)
                        {
                            if ((this.IsInteractionCandidateCameraValid(local_92, local_44, true, local_93) && (int(local_92.Priority) > local_94 || (local_93 > local_76))))
                            {
                                local_72 = local_89;
                                local_76 = local_93;
                            }
                        }
                    }
                }
            }
            if (local_92.bBestZ)
            {
                if (local_71 >= 0)
                {
                    local_95 = local_6.CandidateBehaviors[local_71].Priority;
                }
                else
                {
                    local_95 = -1;
                }
                local_70 = int(local_92.Priority);
                if (local_70 >= local_95)
                {
                    if (this.IsInteractionCandidateCameraValid(local_92, local_44, true, local_93) && (int(local_92.Priority) > local_95 || (local_93 > local_75)))
                    {
                        local_71 = local_89;
                        local_75 = local_93;
                    }
                }
            }
        }
        if (local_6.bSecondaryInteracting)
        {
        }
        else
        {
        }
        local_95 = local_70;
        if (local_95 >= 0)
        {
            FC_BestInteractionTargetInfo local_104;
            const FInteractionCandidateBehaviorInfo& local_92_2 = local_6.CandidateBehaviors[local_95];
            local_104.TargetEntity = local_92_2.TargetEntity;
            local_104.InteractTargetPointAndBehaviorIndex = local_92_2.PointAndBehaviorIndex;
            local_104.bIsSecondaryTarget = local_92_2.bIsSecondaryTarget;
            local_104.ShowFailConditionIndex = int(local_92_2.ShowFailConditionIndex);
            local_104.bShowFailFromSource = local_92_2.bShowFailFromSource;
        }
        else
        {
            Remove local_12;
            local_12.opCall();
        }
        if (local_71 >= 0)
        {
            FC_BestInteractionTargetInfoModeZ local_110;
            const FInteractionCandidateBehaviorInfo& local_92_3 = local_6.CandidateBehaviors[local_71];
            local_110.TargetEntity = local_92_3.TargetEntity;
            local_110.InteractTargetPointAndBehaviorIndex = local_92_3.PointAndBehaviorIndex;
            local_110.ShowFailConditionIndex = int(local_92_3.ShowFailConditionIndex);
            local_110.bShowFailFromSource = local_92_3.bShowFailFromSource;
        }
        else
        {
            Remove local_16;
            local_16.opCall();
        }
        local_116.Targets.Reset(0);
        bool local_117 = false;
        int local_118 = 0;
        local_89 = -1;
        bool local_120 = false;
        auto local_126 = local_6.CandidateBehaviors.Iterator();
        for (; local_126.CanProceed;)
        {
            const FInteractionCandidateBehaviorInfo& local_92_4 = local_126.Proceed();
            if (!(local_92_4.bTip))
            {
                continue;
            }
            bool local_7 = !(local_92_4.bIsSecondaryTarget) != !(local_117) || (local_92_4.TargetEntity.GetIdValue() != local_118);
            if (local_7 || (local_92_4.PointAndBehaviorIndex.GetPointIndex() != local_89))
            {
                local_117 = local_92_4.bIsSecondaryTarget;
                local_118 = local_92_4.TargetEntity.GetIdValue();
                local_70 = local_92_4.PointAndBehaviorIndex.GetPointIndex();
                local_89 = local_70;
                local_120 = false;
            }
            if (local_120)
            {
                continue;
            }
            if (local_92_4.bIsSecondaryTarget)
            {
            }
            else
            {
            }
            local_133 = local_70;
            if (local_133 >= 0)
            {
                const FInteractionCandidateBehaviorInfo& local_136 = local_6.CandidateBehaviors[local_133];
                local_7 = (local_136.TargetEntity == local_92_4.TargetEntity);
                if (local_7 && (local_136.PointAndBehaviorIndex.GetPointIndex() == local_92_4.PointAndBehaviorIndex.GetPointIndex()))
                {
                    continue;
                }
            }
            float32 local_93_2 = -1.0f;
            if (!(this.IsInteractionCandidateCameraValid(local_92_4, local_44, false, local_93_2)))
            {
                continue;
            }
            FInteractTipTargetInfo local_144;
            local_144.EntityId = local_92_4.TargetEntity.GetId();
            local_144.InteractPointIndex = local_92_4.PointAndBehaviorIndex.GetPointIndex();
            local_144.BehaviorIndex = local_92_4.PointAndBehaviorIndex.GetBehaviorIndex();
            local_116.Targets.Add(local_144);
            local_120 = true;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_AutoInteractWithTargets(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_Transform &inout Transform, const FC_TransformHistory &inout TransformHistory, const FC_AutoInteractSourceConfig &inout AutoInteractSourceConfig, const FC_InteractionInfoForESM &inout InteractionInfoForESM) const
    {
        int local_96 = 0;
        if (!(FixedTime.bClientSingularTick))
        {
            return;
        }
        if (!(InteractionInfoForESM.GetbIsAutoInteract()))
        {
            return;
        }
        TArray<FInteractTargetInfo> local_6;
        UInteractionBehaviorBase local_10 = AutoInteractSourceConfig.AutoInteractBehavior.GetDefaultObject();
        if ((local_10 == nullptr || (int(local_10.AutoInteractChannelType) == 0)))
        {
            return;
        }
        FClientInteractSourceCheckParam local_38 = ::FInteractUtils::BuildClientInteractSourceCheckParam(Entity, TransformHistory);
        TArray<FInteractionCandidateEntity> local_66;
        this.CollectPossibleInteractTargets(Entity, Transform.GetPosition(), true, false, local_38.InteractDistance, false, 0.0f, local_38.SourceType, false, local_66);
        for (auto& local_86 : local_66)
        {
            this.GetAutoInteractTargetInfo(local_86, local_10.AutoInteractChannelType, EInteractMode(0), local_38, local_6);
        }
        if (local_6.Num() > 0)
        {
            FFPTime local_94 = FFPTime(-1);
            local_96.InteractTargets = local_6;
        }
        return;
    }
    void CollectPossibleSecondaryInteractTargets(const FECSEntity &inout SourceEntity, const FVector &inout QueryLocation, const bool bCollectBestF, const float32 SourceInteractDistance, const bool bCollectInteractTipTarget, const float32 SourceInteractTipDistance, const EInteractSourceType SourceType, const bool bIsSecondaryTarget, TArray<FInteractionCandidateEntity> &inout OutCandidateEntities) const
    {
        FC_InteractionTargetConfig local_48;
        bool local_49;
        bool local_51;
        int local_58 = 0;
        bool local_63;
        int local_72 = 0;
        if (!(bCollectBestF) && !(bCollectInteractTipTarget))
        {
            return;
        }
        float32 local_5 = FMath::Max(SourceInteractDistance, this.MaxInteractDistance);
        float32 local_4 = this.MaxInteractTipDistance;
        float32 local_3 = FMath::Max(SourceInteractTipDistance, local_4);
        if (bCollectBestF)
        {
        }
        else
        {
        }
        float32 local_7 = local_4;
        if (bCollectBestF && bCollectInteractTipTarget)
        {
            local_7 = FMath::Max(local_5, local_3);
        }
        TArray<uint> local_12;
        FSceneGridUtils::QueryCircle(ECS::GetECSWorld(), ESceneGridType(0), QueryLocation, local_7, local_12);
        if (local_12.Num() == 0)
        {
            return;
        }
        float32 local_6 = FMath::Square(SourceInteractDistance);
        float32 local_4_2 = FMath::Square(SourceInteractTipDistance);
        Has local_42;
        for (auto local_33 : local_12)
        {
            FECSEntity local_38 = FECSEntity(local_33);
            if ((local_38 == SourceEntity) || !(local_38.IsActive()))
            {
                continue;
            }
            if (!(local_42.opCall()))
            {
                continue;
            }
            if (!(local_48))
            {
                continue;
            }
            bool local_2 = bCollectBestF && local_48.HasInteractPointWithMode(EInteractMode(0));
            if (!(bCollectInteractTipTarget))
            {
                local_49 = false;
            }
            else
            {
                local_49 = local_48.bHasTip;
            }
            if (!(local_2) && !(local_49))
            {
                continue;
            }
            if (!(local_58))
            {
                continue;
            }
            float32 local_19 = float32(QueryLocation.DistSquared(local_58.GetPosition()));
            local_51 = local_2 && (local_19 <= local_6 || (local_19 <= local_48.MaxInteractDistanceSQ));
            local_63 = local_49 && (local_19 <= local_4_2 || (local_19 <= local_48.MaxInteractTipDistanceSQ));
            if (!(local_51) && !(local_63))
            {
                continue;
            }
            bool local_64 = local_2 && local_51 && !(this.NeedExcludeInteractTargetEntity(SourceEntity, local_38, EInteractMode(0)));
            if (!(local_64) && !(local_63))
            {
                continue;
            }
            if (!(local_72) || local_72.GetbRuntimeDisabled())
            {
                continue;
            }
            if (!((local_48.InteractionPoints.Num() <= 32)))
            {
                continue;
            }
            FInteractionCandidateEntity local_78;
            local_78.Entity = local_38;
            local_78.bBestF = local_64;
            local_78.bTip = local_63;
            local_78.bIsSecondaryTarget = bIsSecondaryTarget;
            int local_79 = 0;
            for (; local_79 < local_48.InteractionPoints.Num(); ++local_79)
            {
                if (!(local_72.IsRuntimePointEnabled(local_79)))
                {
                    continue;
                }
                const FInteractionPoint& local_82 = local_48.InteractionPoints[local_79];
                int local_83 = int(local_82.AvailableSourceTypeMask) & int(SourceType);
                if (local_83 == 0 || !(local_82.PointType.IsValid()))
                {
                    continue;
                }
                local_78.PointIndices.SetBit(local_79, true);
            }
            if (!(local_78.PointIndices.IsEmpty()))
            {
                OutCandidateEntities.Add(local_78);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleSetEntityInteractTargetEnabled(const FCE_SetEntityInteractTargetEnabled &inout Event) const
    {
        Has local_4;
        int local_12 = 0;
        int local_22 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (int(Event.PointIndex) == -1)
        {
            local_12.SetbRuntimeDisabled(!(Event.bEnabled));
            return;
        }
        if (int(Event.PointIndex) >= 0 && (int(Event.PointIndex) < local_12.GetRuntimePointsDisabled().Num()))
        {
            bool local_15 = !(Event.bEnabled);
            local_12.GetModify_RuntimePointsDisabled()[Event.PointIndex] = local_15;
            return;
        }
        FString local_20 = "Invalid";
        if (local_22)
        {
            Get local_26;
            const FC_PrefabLoaded& local_28 = local_26.opCall();
            if (local_28)
            {
                FString local_44;
                if (local_28.PrefabClass.IsValid())
                {
                    local_44 = local_28.PrefabClass.Get().Get().GetName();
                }
                else
                {
                    local_44 = FString("Invalid");
                }
                local_20 = local_44;
            }
        }
        XError(ELog(46), local_44.Append("Interaction Point Index [").Append(Event.PointIndex).Append("] is invalid on Prefab Type [").Append(local_20).Append("]."));
        return;
    }
    UFUNCTION()
    void Job_HandleInteractInputActionEvent(const FCE_InteractActionESMTriggerEvent &inout Event) const
    {
        FECSEntity local_4 = Event.RealInteractTriggerEntity;
        Has local_8;
        if (!(local_8.opCall()))
        {
            local_4 = ENTITY_NULL;
            Has local_14;
            bool local_9 = local_14.opCall();
            if (local_9)
            {
                FFPTime local_20 = FFPTime(-1);
                SendEvent local_18;
                FCE_InteractActionESMTriggerEventForLocalReg& local_24 = local_18.opCall(local_20);
                if (local_24)
                {
                    local_24.RealInteractTriggerEntity = Event.RealInteractTriggerEntity;
                    local_24.InteractActionESMBBForEvent = Event.InteractActionESMBBForEvent;
                }
            }
        }
        if ((!((local_4 == ENTITY_NULL))))
        {
            FInteractActionESMBBForEvent local_26 = Event.InteractActionESMBBForEvent;
            if ((!((local_26.GetESMBBTriggerName() == NAME_None))))
            {
                FESMTriggerUtils::ActivateESMTrigger(local_4, local_26.GetESMBBTriggerName(), Event.Time, FFPTime(local_26.GetTriggerValidateTime()), 0);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleInteractInputActionEventForClient(const FCE_InteractActionESMTriggerEventForLocalReg &inout Event) const
    {
        bool local_7;
        Get local_4;
        const FC_DefaultToLocal& local_6 = local_4.opCall();
        if (local_6)
        {
            if (!(FECSEntity(local_6.LocalEntityId).IsValid()))
            {
                local_7 = false;
            }
            else
            {
                Has local_20;
                local_7 = local_20.opCall();
            }
            if (local_7)
            {
                ModifyOrAdd local_26;
                FC_ActivateESMTriggerOnLocalReg& local_28 = local_26.opCall();
                if (local_28)
                {
                    FActivateESMTriggerOnLocalRegData local_36;
                    FNameHandle_ESMBBTrigger local_42;
                    local_42.Name = Event.InteractActionESMBBForEvent.GetESMBBTriggerName();
                    local_36.TriggerName = local_42;
                    local_36.ValidTime = Event.InteractActionESMBBForEvent.GetTriggerValidateTime();
                    local_28.TriggerDatas.Add(local_36);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleBeginAutoInteractEvent(const FCE_BeginAutoInteractEvent &inout Event) const
    {
        int local_20 = 0;
        int local_28 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (::FInteractUtils::EvaluateAutoInteractConditions(local_4))
        {
            FECSEntity local_10 = ::FASCommonUtils::GetRiderEntity(local_4);
            local_20.SetbIsAutoInteract(true);
            FECSWorldPtr local_22 = local_4.GetWorld();
            local_20.SetExpireTime(local_28.Time);
            ::FInteractUtils::ExecuteAutoInteractBeginAction(local_10);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleEndAutoInteractEvent(const FCE_EndAutoInteractEvent &inout Event) const
    {
        ::FInteractUtils::ExecuteAutoInteractEndAction(Event.Sender);
        return;
    }
    UFUNCTION()
    void Job_HandleAutoInteractTargetsEvent(const FCE_AutoInteractTargetsEvent &inout Event) const
    {
        int local_6 = 0;
        int local_40 = 0;
        if (!(local_6))
        {
            return;
        }
        UInteractionBehaviorBase local_12 = local_6.AutoInteractBehavior.GetDefaultObject();
        if ((local_12 == nullptr || (int(local_12.AutoInteractChannelType) == 0)))
        {
            return;
        }
        for (auto& local_30 : Event.InteractTargets)
        {
            if (!(::FInteractUtils::CheckPassedInteractionCondition(Event.Sender, local_30.GetTargetEntity(), local_30.GetInteractTargetPointAndBehaviorIndex(), false)))
            {
                continue;
            }
            switch (int(::FInteractUtils::GetInteractionBehaviorFromEntity(local_30.GetTargetEntity(), local_30.GetInteractTargetPointAndBehaviorIndex()).AutoInteractResponseType))
            {
            case 1:
            {
                bool local_16 = ECS::GetRuntimeInfo().IsServer;
                if (local_16)
                {
                    local_40.AddPending(local_30.GetInteractTargetPointAndBehaviorIndex().GetPointIndex(), local_30.GetInteractTargetPointAndBehaviorIndex().GetBehaviorIndex());
                }
                ::FInteractUtils::ExecuteInteractBeginAction(Event.Sender, local_30.GetTargetEntity(), local_30.GetInteractTargetPointAndBehaviorIndex());
                break;
            }
            case 3:
            {
                ::FInteractUtils::ExecuteInteractEndAction(Event.Sender, local_30.GetTargetEntity(), local_30.GetInteractTargetPointAndBehaviorIndex());
                break;
            }
            case 2:
            {
                ::FInteractUtils::ExecuteInteractSuccessAction(Event.Sender, local_30.GetTargetEntity(), local_30.GetInteractTargetPointAndBehaviorIndex());
                break;
            }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickRuntimeInteractTargetStatus(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_RuntimeInteractTargetStatus &inout RuntimeInteractTargetStatus) const
    {
        UInteractionBehaviorBase local_76;
        float32 local_114;
        TArray<FECSEntity> local_4;
        auto local_10 = RuntimeInteractTargetStatus.GetInteractionPointStatus().Iterator();
        for (; local_10.CanProceed;)
        {
            const FRuntimeInteractionPointStatus& local_20 = local_10.Proceed();
            for (auto local_34 : local_20.GetInteractingSourceEntities())
            {
                if (!(local_34.IsValid()) || !(local_34.IsActive()))
                {
                    local_4.Add(local_34);
                }
            }
        }
        for (auto local_34 : local_4)
        {
            ::FInteractUtils::RemoveInteractingSourceEntityFromTarget(local_34, Entity, -1, -1);
        }
        if (RuntimeInteractTargetStatus.GetbRuntimeDisabled())
        {
            return;
        }
        TMap<UInteractionBehaviorBase, FInteractionBehaviorToPointIndex> local_70;
        int local_71 = 0;
        TArray<FECSEntity> local_80;
        for (; local_71 < RuntimeInteractTargetStatus.GetInteractionPointStatus().Num(); ++local_71)
        {
            const FRuntimeInteractionPointStatus& local_20_2 = RuntimeInteractTargetStatus.GetInteractionPointStatus()[local_71];
            if (!(RuntimeInteractTargetStatus.IsRuntimePointEnabled(local_20_2.GetPointAndBehaviorIndex().GetPointIndex())))
            {
                continue;
            }
            local_76 = ::FInteractUtils::GetInteractionBehaviorFromEntity(Entity, local_20_2.GetPointAndBehaviorIndex());
            if ((!((local_76 != nullptr)) || !(local_76.bHasInteractProgress)))
            {
                continue;
            }
            local_80 = this.GetAddingProgressPlayerList(Entity, RuntimeInteractTargetStatus, local_20_2.GetPointAndBehaviorIndex());
            if (local_80.Num() > 0)
            {
                FInteractionBehaviorToPointIndex& local_88 = local_70.FindOrAdd(local_76);
                local_88.InteractEntities.Append(local_80);
                local_88.IndexOfPoints.Add(local_71);
            }
        }
        for (auto& local_106 : local_70)
        {
            local_76 = local_106.GetKey();
            int local_49 = local_106.GetValue().InteractEntities.Num();
            TArray<int> local_110;
            FInteractProgressConfig local_112 = local_110 = local_106.GetValue().IndexOfPoints;
            int local_36 = RuntimeInteractTargetStatus.GetInteractionBehaviorStatusIndex(local_76);
            float32 local_115 = RuntimeInteractTargetStatus.GetModify_InteractionBehaviorStatus()[local_36].GetProgressValue();
            local_114 = local_115;
            local_115 = local_112.GetMultiInteractorProgressScaler(local_106.GetValue().InteractEntities, FixedTime.Time);
            local_114 = local_114 + ((local_112.ProgressValuePerSecondPerPlayer * float32(FixedTime.DeltaTime.ToSeconds())) * local_115);
            RuntimeInteractTargetStatus.GetModify_InteractionBehaviorStatus()[local_36].SetProgressValue(local_114);
            if (local_114 >= local_112.MaxProgressValue)
            {
                for (auto local_133 : local_110)
                {
                    const FRuntimeInteractionPointStatus& local_20_3 = RuntimeInteractTargetStatus.GetInteractionPointStatus()[local_133];
                    if (::FInteractUtils::GetInteractionBehaviorFromEntity(Entity, local_20_3.GetPointAndBehaviorIndex()) == local_76)
                    {
                        local_80 = local_20_3.GetInteractingSourceEntities();
                        for (auto local_34 : local_80)
                        {
                            ::FInteractUtils::ExecuteInteractSuccessAction(local_34, Entity, local_20_3.GetPointAndBehaviorIndex());
                        }
                    }
                }
                local_114 = -1.0f;
                RuntimeInteractTargetStatus.GetModify_InteractionBehaviorStatus()[local_36].SetProgressValue(local_114);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickInteractProgress(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_InteractionInfoForESM &inout InteractionInfoForESM) const
    {
        FECSEntity local_4 = FECSEntity(InteractionInfoForESM.GetTargetEntity());
        if (local_4.IsValid())
        {
            Get local_10;
            const FC_RuntimeInteractTargetStatus& local_12 = local_10.opCall();
            if (local_12)
            {
                UInteractionBehaviorBase local_16 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_4, InteractionInfoForESM.GetTargetPointAndBehaviorIndex());
                if (local_16 != nullptr)
                {
                    if (local_16.bHasInteractProgress)
                    {
                        int local_18 = local_12.GetInteractionBehaviorStatusIndex(local_16);
                        if (local_18 >= 0)
                        {
                            FC_LocalInteractProgress local_24;
                            local_24.ProgressValue = local_12.GetInteractionBehaviorStatus()[local_18].GetProgressValue();
                            local_24.MaxProgressValue = local_16.InteractProgressConfig.MaxProgressValue;
                            int local_26 = 0;
                            float32 local_27 = 0.0f;
                            TArray<FInteractionPointAndBehaviorIndex> local_32 = ::FInteractUtils::GetAllSameBehaviorIndexByPointAndBehaviorIndex(local_4, InteractionInfoForESM.GetTargetPointAndBehaviorIndex());
                            for (auto& local_50 : local_32)
                            {
                                TArray<FECSEntity> local_54 = this.GetAddingProgressPlayerList(Entity, local_12, local_50);
                                local_26 = local_26 + local_54.Num();
                                local_27 = local_27 + local_16.InteractProgressConfig.GetMultiInteractorProgressScaler(local_54, FixedTime.Time);
                            }
                            local_24.InteractEntityNum = local_26;
                            local_24.CurProgressSpeed = (local_16.InteractProgressConfig.ProgressValuePerSecondPerPlayer * local_27);
                            return;
                        }
                    }
                }
            }
        }
        Remove local_62;
        local_62.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_TickInteractTeamNum(const FECSEntity &inout Entity, const FC_InteractionInfoForESM &inout InteractionInfoForESM) const
    {
        FECSEntity local_4 = FECSEntity(InteractionInfoForESM.GetTargetEntity());
        if (local_4.IsValid())
        {
            Get local_10;
            const FC_RuntimeInteractTargetStatus& local_12 = local_10.opCall();
            if (local_12)
            {
                UInteractionBehaviorBase local_16 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_4, InteractionInfoForESM.GetTargetPointAndBehaviorIndex());
                if (local_16 != nullptr)
                {
                    if (local_12.GetInteractionBehaviorStatusIndex(local_16) >= 0)
                    {
                        FC_LocalInteractWithTeam local_24;
                        int local_17 = ::FInteractUtils::GetInteractingEntitiesWithBehavior(local_4, InteractionInfoForESM.GetTargetPointAndBehaviorIndex().GetBehaviorIndex()).Num();
                        if (int(local_24.InteractEntityNum) != local_17)
                        {
                            local_24.InteractEntityNum = local_17;
                        }
                        return;
                    }
                }
            }
        }
        Remove local_34;
        local_34.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_TickLocalInteractProgress(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleUITriggerInteractTargetAbility(const FCE_UITriggerInteractTargetAbility &inout Event) const
    {
        FECSEntity local_4 = Event.AbilityOwner;
        if (local_4.IsValid() && Event.Sender.IsValid())
        {
            ::FInteractUtils::CreateInteractActionTargetAbilityEvent(Event.Sender, local_4, Event.SignalName, Event.InteractTargetPointAndBehaviorIndex);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleUITriggerInteractSourceAbility(const FCE_UITriggerInteractSourceAbility &inout Event) const
    {
        FECSEntity local_4 = Event.AbilityOwner;
        if (local_4.IsValid())
        {
            bool local_23;
            UClass local_20;
            local_20 = Cast<UClass>(Event.AbilityClass.ToSoftObjectPath().TryLoad());
            TSubclassOf<UEASAbility> local_8 = local_20;
            if ((local_8 == nullptr))
            {
                return;
            }
            int local_21 = FAbilityUtils::GetAbilityIndexByClass(local_4, local_8);
            if (local_21 == -1)
            {
                return;
            }
            local_23 = false;
            FC_EASAbilityInstance& local_26 = FAbilityUtils::GetAbilityInstance(local_4, local_21, local_23);
            if (local_26)
            {
                FAbilityUtils::InvokeSignal(local_26, local_4, Event.SignalName, FFPTime(-1), true);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveInteractTargetConfig(const FC_InteractionTargetConfig &inout InteractTargetConfig, const FECSEntity &inout Entity) const
    {
        if (Entity.IsValid())
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_HandleSetEntityInteractionBlocked(const FCE_SetEntityInteractionBlocked &inout Event) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        Modify local_10;
        FC_BlockInteractionRuntime& local_12 = local_10.opCall();
        if (local_12)
        {
            local_12.SetbBlocked(Event.bBlocked);
        }
        return;
    }
    void TriggerESMAccordingToBlockInteractionState(const FECSEntity &inout Entity, const FC_BlockInteractionConfig &inout BlockInteractionConfig, const FC_BlockInteractionRuntime &inout BlockInteractionRuntime) const
    {
        if (BlockInteractionRuntime.GetbBlocked())
        {
            ::FESMUtils::ActivateESMTrigger(Entity, BlockInteractionConfig.ESMBBTriggerWhenBlocked, BlockInteractionConfig.TriggerValidTimeWhenBlocked);
            return;
        }
        ::FESMUtils::ActivateESMTrigger(Entity, BlockInteractionConfig.ESMBBTriggerWhenUnblocked, BlockInteractionConfig.TriggerValidTimeWhenUnblocked);
        return;
    }
    UFUNCTION()
    void Monitor_ServerOnBlockInteractionStateChanged(const FC_BlockInteractionRuntime &inout BlockInteractionRuntime, const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        this.TriggerESMAccordingToBlockInteractionState(Entity, local_6, BlockInteractionRuntime);
        return;
    }
    UFUNCTION()
    void ServerJob_CleanupPendingInteractSourceCount(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveIsBeingInteractedTag() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorIsBeingInteractedTagOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveIsBeingInteractedTag(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleBeginInteractEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BeginInteractEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BeginInteractEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleBeginInteractEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleServerTriggerBeginInteractEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerTriggerBeginInteractEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerTriggerBeginInteractEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleServerTriggerBeginInteractEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEndInteractEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EndInteractEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EndInteractEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEndInteractEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleServerTriggerEndInteractEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerTriggerEndInteractEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerTriggerEndInteractEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleServerTriggerEndInteractEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCurrentInteractingCondition() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
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
                this.Job_TickCurrentInteractingCondition(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickCurrentInteractingCondition(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickInteractionInfoForESM() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
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
                this.Job_TickInteractionInfoForESM(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickInteractionInfoForESM(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_EndKeepInteractOnSourceEndPlay() const
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
                this.ServerJob_EndKeepInteractOnSourceEndPlay(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
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
            this.ServerJob_EndKeepInteractOnSourceEndPlay(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CollectInteractionCandidateEntities() const
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
                this.ClientJob_CollectInteractionCandidateEntities(local_36, local_38, local_44);
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
            this.ClientJob_CollectInteractionCandidateEntities(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_BuildInteractionCandidates() const
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
                this.ClientJob_BuildInteractionCandidates(local_36, local_38);
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
            this.ClientJob_BuildInteractionCandidates(local_170, local_38);
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
    void Run_ClientJob_TickInteraction() const
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
                this.ClientJob_TickInteraction(local_36, local_38);
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
            this.ClientJob_TickInteraction(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_AutoInteractWithTargets() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_52 = 0;
        int local_58 = 0;
        int local_64 = 0;
        int local_216 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.2))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.ClientJob_AutoInteractWithTargets(local_44, local_12, local_46, local_52, local_58, local_64);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_144 = 0;
        FECSRuntimeViewIterator local_178 = local_106.Iterator();
        for (; local_178.CanProceed;)
        {
            local_44 = local_178.Proceed();
            ++local_144;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            FECSEntity::Get<FC_TransformHistory> local_56 = FECSEntity::Get<FC_TransformHistory>(local_44);
            this.ClientJob_AutoInteractWithTargets(local_216, local_12, local_46, local_52, local_58, local_64);
        }
        local_4.UpdateCachedEntityCount(local_144);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleSetEntityInteractTargetEnabled() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SetEntityInteractTargetEnabled> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SetEntityInteractTargetEnabled& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleSetEntityInteractTargetEnabled(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleInteractInputActionEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_InteractActionESMTriggerEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_InteractActionESMTriggerEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleInteractInputActionEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleInteractInputActionEventForClient() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_InteractActionESMTriggerEventForLocalReg> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_InteractActionESMTriggerEventForLocalReg& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleInteractInputActionEventForClient(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleBeginAutoInteractEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BeginAutoInteractEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BeginAutoInteractEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleBeginAutoInteractEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEndAutoInteractEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EndAutoInteractEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EndAutoInteractEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEndAutoInteractEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAutoInteractTargetsEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AutoInteractTargetsEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AutoInteractTargetsEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAutoInteractTargetsEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickRuntimeInteractTargetStatus() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_178 = 0;
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
                this.ServerJob_TickRuntimeInteractTargetStatus(local_40, local_6, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_40 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_TickRuntimeInteractTargetStatus(local_178, local_6, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickInteractProgress() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_174 = 0;
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
                this.ClientJob_TickInteractProgress(local_40, local_6, local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_TickInteractProgress(local_174, local_6, local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickInteractTeamNum() const
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
                this.ClientJob_TickInteractTeamNum(local_36, local_38);
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
            this.ClientJob_TickInteractTeamNum(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickLocalInteractProgress() const
    {
        const FECSEntity& local_36;
        int local_164 = 0;
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
                this.ClientJob_TickLocalInteractProgress(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Include local_82;
        local_82.opCall();
        Exclude(local_74).opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_74.Iterator();
        for (; local_126.CanProceed;)
        {
            local_36 = local_126.Proceed();
            ++local_92;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickLocalInteractProgress(local_164);
        }
        local_2.UpdateCachedEntityCount(local_92);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleUITriggerInteractTargetAbility() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_UITriggerInteractTargetAbility> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_UITriggerInteractTargetAbility& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleUITriggerInteractTargetAbility(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleUITriggerInteractSourceAbility() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_UITriggerInteractSourceAbility> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_UITriggerInteractSourceAbility& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleUITriggerInteractSourceAbility(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveInteractTargetConfig() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorInteractionTargetConfigOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveInteractTargetConfig(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleSetEntityInteractionBlocked() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SetEntityInteractionBlocked> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SetEntityInteractionBlocked& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleSetEntityInteractionBlocked(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerOnBlockInteractionStateChanged() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorBlockInteractionRuntimeOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ServerOnBlockInteractionStateChanged(local_50, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorBlockInteractionRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_48_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_ServerOnBlockInteractionStateChanged(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CleanupPendingInteractSourceCount() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
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
                this.ServerJob_CleanupPendingInteractSourceCount(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_CleanupPendingInteractSourceCount(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

