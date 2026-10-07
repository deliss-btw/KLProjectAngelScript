

class UHTNTask_RequestResourceWithContext : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    bool OnlyRemoveUsedRequest;
    UPROPERTY()
    FBlackboardKeySelector MinPriorityKey;
    UPROPERTY()
    FBlackboardKeySelector OutputPriorityKey;
    UPROPERTY()
    FBlackboardKeySelector IsSpecifiedTarget;
    UPROPERTY()
    FBlackboardKeySelector SpecifiedResourceId;
    UPROPERTY()
    FAISmart_Name ResultSaveKey;
    UPROPERTY()
    FBlackboardKeySelector ReasonTagOutput;
    UPROPERTY()
    FBlackboardKeySelector SourceTagOutput;
    UPROPERTY()
    FBlackboardKeySelector ForceUpdateTargetResource;

    default SetNodeName("RequestResourceForChangeArea");

    UHTNTask_RequestResourceWithContext()
    {
        this.OnlyRemoveUsedRequest = false;
        this.IsSpecifiedTarget.SelectedKeyName = n"bIsSpecifiedTarget";
        this.IsSpecifiedTarget.AddBoolFilter(this, n"bIsSpecifiedTarget");
        this.SpecifiedResourceId.SelectedKeyName = n"ResourceEntityId";
        this.SpecifiedResourceId.AddEntityIdFilter(this, n"ResourceEntityId");
        this.ReasonTagOutput.SelectedKeyName = n"ReasonTag";
        this.ReasonTagOutput.AddNameFilter(this, n"ReasonTag");
        this.SourceTagOutput.SelectedKeyName = n"SourceTag";
        this.SourceTagOutput.AddNameFilter(this, n"SourceTag");
        this.ForceUpdateTargetResource.SelectedKeyName = n"bForceUpdateTargetResource";
        this.ForceUpdateTargetResource.AddBoolFilter(this, n"bForceUpdateTargetResource");
        this.MinPriorityKey.AddIntFilter(this, n"MinPriority");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FC_EcologyFlockBehaviorComponent local_14;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_6 = Context.GetBlackboardComponent();
        if (!(local_14))
        {
            return;
        }
        if (local_14.ChangeAreaRequest.Num() > 0)
        {
            this.SubmitPlanStep(100, "");
        }
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        int local_8 = 0;
        bool local_2 = this.ProcessRequest(Context);
        ::FEcologyBehaviorUtils::ClearAllFlockChangeAreaRequest(Context.PawnEntity);
        if (!(local_2))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        if (local_8)
        {
            FGameplayTag local_14 = FGameplayTag::RequestGameplayTag(HTNNode::GetWorldStateValueAsName(Context, this.ReasonTagOutput), true);
            FGameplayTag local_10 = FGameplayTag::RequestGameplayTag(HTNNode::GetWorldStateValueAsName(Context, this.SourceTagOutput), true);
            bool local_1 = HTNNode::GetWorldStateValueAsBool(Context, this.ForceUpdateTargetResource);
            local_8.ChangeAreaData.LastReason = local_14;
            local_8.ChangeAreaData.LastSource = local_10;
            local_8.ChangeAreaData.bForceUpdateTargetResource = local_1;
        }
        this.FinishExecuteWithContext(Context, true);
        return;
    }
    void OutputRequestResult(const FHTNContext &inout Context, const UBlackboardComponent blackboard, const TArray<FEntitySearchResult> &inout FinalResult) const
    {
        FAISmartValueContext local_12;
        FInstancedStruct::Make(local_12);
        FName local_20 = this.ResultSaveKey.GetValue(Context.opImplConv());
        FECSEntity local_16 = Context.GetControllerEntity();
        Context.SetWorldStateAsBool(this.IsSpecifiedTarget, false);
        return;
    }
    void OutputSpecifiedResource(const FHTNContext &inout Context, const UBlackboardComponent blackboard, const FECSEntityId &inout ResourceId) const
    {
        ::SetEcologyBlob(Context.GetControllerEntity(), this.ResultSaveKey.GetValue(Context.opImplConv()), FInstancedStruct());
        Context.SetWorldStateAsEntityId(this.SpecifiedResourceId, ResourceId);
        Context.SetWorldStateAsBool(this.IsSpecifiedTarget, true);
        return;
    }
    void SetRequestResultInfo(const FECSEntity &inout FlockEntity, const FHTNContext &inout Context, const FGameplayTag &inout ReasonTag, const FGameplayTag &inout SourceTag, const bool bNeedForceUpdateTargetResource, const bool bNeedChangeAreaMessage, const FChangeAreaMessageInfo &inout MessageInfo, const int Priority) const
    {
        int local_8 = 0;
        ReasonTag.GetTagName();
        SourceTag.GetTagName();
        Context.SetWorldStateAsBool(this.ForceUpdateTargetResource, bNeedForceUpdateTargetResource);
        Context.SetWorldStateAsInt(this.OutputPriorityKey, Priority);
        local_8.ChangeAreaData.bNeedChangeAreaMessage = bNeedChangeAreaMessage;
        return;
    }
    bool TryHandleRequestSuccess(const FHTNContext &inout Context, const UBlackboardComponent blackboard, const FFlockChangeAreaRequest &inout RequestInst, const FECSEntity &inout FlockEntity, const TArray<FEntitySearchResult> &inout Result) const
    {
        if (Result.Num() <= 0)
        {
            return false;
        }
        this.OutputRequestResult(Context, blackboard, Result);
        FGameplayTag local_5 = RequestInst.ReasonTag;
        FGameplayTag local_9;
        if (RequestInst.SourceTag.IsValid())
        {
            local_9 = RequestInst.SourceTag;
        }
        else
        {
            local_9 = FEcologyGameplayTagDefine::Ecology_ChangeAreaSource_Common;
        }
        this.SetRequestResultInfo(FlockEntity, Context, local_5, local_9, RequestInst.bForceUpdateTargetResource, RequestInst.bNeedChangeAreaMessage, RequestInst.MessageInfo, int(RequestInst._base_FFlockBehaviorRequest));
        return true;
    }
    bool IsCombatRegionPolicyRequestValid(const FFlockChangeAreaRequest &inout RequestInst, const FResourceSearchRequest &inout Request, FString &inout OutInvalidReason) const
    {
        if (int(Request.SearchRadius) <= 0)
        {
            OutInvalidReason = "SearchRadius<=0";
            return false;
        }
        if ((RequestInst.CombatRegionPolicyRadiusLayer1 <= 0.0f || (RequestInst.CombatRegionPolicyRadiusLayer2 <= 0.0f)))
        {
            OutInvalidReason = "RadiusLayer1 == 0 or RadiusLayer2 == 0";
            return false;
        }
        if (RequestInst.CombatRegionPolicyRadiusLayer1 > RequestInst.CombatRegionPolicyRadiusLayer2)
        {
            OutInvalidReason = "RadiusLayer1 > RadiusLayer2";
            return false;
        }
        if ((RequestInst.CombatRegionPolicyRadiusLayer1 > int(Request.SearchRadius) || (RequestInst.CombatRegionPolicyRadiusLayer2 > int(Request.SearchRadius))))
        {
            XLog(ELog(30), FString().Append("Warning: RadiusLayerе¤§дєЋSearchRadius, еЇји‡ґ CombatRegionPolicy з”џж•€еј‚еёё"));
        }
        int local_12 = 0;
        for (auto& local_30 : Request.IncludeResourceTypes)
        {
            if (!(local_30))
            {
                ++local_12;
            }
        }
        if (local_12 > 0)
        {
            OutInvalidReason = FString().Append("IncludeResourceTypes has ").Append(local_12).Append(" invalid item(s)");
            return false;
        }
        return true;
    }
    void AppendVisitedCombatRegion(FC_EcologyFlockBehaviorComponent &inout FlockBehaviorComp, TArray<AECSRegionVolume> &inout OutRegions) const
    {
        AECSRegionVolume local_16;
        int local_1 = 0;
        while (local_1 < 0)
        {
            FECSEntityId& local_6 = FlockBehaviorComp.VisitedCombatRegion[local_1];
            if ((local_6 == ENTITY_ID_NULL))
            {
            }
            else
            {
                if (!(FECSEntity(local_6).IsValid()))
                {
                }
                else
                {
                    AActor local_22;
                    local_16 = Cast<AECSRegionVolume>(local_22);
                    if ((!((local_16 != nullptr)) || !(local_16.bAffectCombat)))
                    {
                    }
                    else
                    {
                        OutRegions.Add(local_16);
                    }
                }
            }
            ++local_1;
        }
        return;
    }
    void GatherCandidateCombatRegionByCenterAndRadius(FC_EcologyFlockBehaviorComponent &inout FlockBehaviorComp, const FVector &inout Center, const float32 RadiusQuery, const float32 RadiusLayer1, const float32 RadiusLayer2, TArray<AECSRegionVolume> &inout OutRegions) const
    {
        ::FEcologyBehaviorUtils::FindCombatRegionByRadiusAndAppendByLayer(FlockBehaviorComp, Center, RadiusQuery, RadiusLayer1, RadiusLayer2, OutRegions);
        this.AppendVisitedCombatRegion(FlockBehaviorComp, OutRegions);
        return;
    }
    FString FormatVisitedCombatRegionIds(const FC_EcologyFlockBehaviorComponent &inout FlockBehaviorComp) const
    {
        FString local_4;
        FString local_14;
        int local_5 = 0;
        while (local_5 < 0)
        {
            if (local_5 > 0)
            {
                local_4 += ", ";
            }
            local_4 += FString().Append(FlockBehaviorComp.VisitedCombatRegion[local_5].GetIdValue());
            ++local_5;
        }
        if (local_4.IsEmpty())
        {
            local_14 = "(None)";
        }
        else
        {
            local_14 = local_4;
        }
        return local_14;
    }
    bool ProcessRequest(const FHTNContext &inout Context)
    {
        FC_EcologyFlockBehaviorComponent local_18;
        AECSRegionVolume local_150;
        TArray<FEntitySearchResult> local_246;
        int local_2 = Context.GetWorldStateAsInt(this.MinPriorityKey);
        bool local_4 = (local_2 > 0);
        FECSEntity local_8 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_10 = Context.GetBlackboardComponent();
        if (!(local_18))
        {
            return false;
        }
        TArray<FFlockChangeAreaRequest> local_20 = local_18.ChangeAreaRequest;
        FGameplayTag local_22;
        int local_27 = local_20.Num() - 1;
        for (; local_27 >= 0; --local_27)
        {
            FFlockChangeAreaRequest& local_30 = local_20[local_27];
            if ((local_4 && (int(local_30._base_FFlockBehaviorRequest) < local_2)))
            {
                break;
            }
            if (int(local_30.GetSearchType()) == 0)
            {
                FResourceSearchRequest local_124;
                if (local_30.bUseNearestCombatRegionPolicy)
                {
                    FString local_128;
                    if (this.IsCombatRegionPolicyRequestValid(local_30, local_124, local_128))
                    {
                        TArray<AECSRegionVolume> local_140;
                        float32 local_136 = local_124.SearchRadius;
                        float32 local_137 = local_30.CombatRegionPolicyRadiusLayer2;
                        local_140.Reset(0);
                        this.GatherCandidateCombatRegionByCenterAndRadius(local_18, local_124.Center, local_136, local_30.CombatRegionPolicyRadiusLayer1, local_137, local_140);
                        if (local_140.Num() > 0)
                        {
                            SendEvent local_144;
                            local_144.opCall(FFPTime(-1));
                        }
                        int local_147 = 0;
                        for (; local_147 < local_140.Num(); ++local_147)
                        {
                            local_150 = local_140[local_147];
                            if (!((local_150 != nullptr)))
                            {
                                continue;
                            }
                            FResourceSearchRequest local_240;
                            local_240.IncludeOtherVolumes.Add(FVolumeProxy(local_150));
                            local_246 = ::FEcologySceneInfoUtils::RequestResource(local_240);
                            if (this.TryHandleRequestSuccess(Context, local_10, local_30, local_8, local_246))
                            {
                                return true;
                            }
                        }
                        FString local_258 = this.FormatVisitedCombatRegionIds(local_18);
                        FString local_254 = FString();
                        int local_263 = local_8.GetIdValue();
                        local_254 = (FString(local_254.Append("[ChangeAreaRequest] CombatRegionPolicy all-failed, fallback to base RequestResource. ")) + FString().Append("Flock=").Append(local_263).Append(" Requester=").Append(local_124.Requester.GetIdValue()).Append(" Priority=").Append(local_30._base_FFlockBehaviorRequest).Append(" "));
                        FString local_262 = (local_254 + FString().Append("ReasonTag=").Append(local_30.ReasonTag).Append(" SourceTag=").Append(local_30.SourceTag).Append(" "));
                        int local_25 = local_140.Num();
                        FString local_268 = (local_262 + FString().Append("Visited=[").Append(local_258).Append("] CandidateNum=").Append(local_25));
                        XLog(ELog(30), local_268);
                    }
                    else
                    {
                        FString local_262_2 = FString();
                        int local_263_2 = local_8.GetIdValue();
                        local_262_2 = (FString(local_262_2.Append("[ChangeAreaRequest] CombatRegionPolicy skipped due to invalid request. ")) + FString().Append("Flock=").Append(local_263_2).Append(" Requester=").Append(local_124.Requester.GetIdValue()).Append(" Priority=").Append(local_30._base_FFlockBehaviorRequest).Append(" "));
                        FString local_254_2 = (local_262_2 + FString().Append("ReasonTag=").Append(local_30.ReasonTag).Append(" SourceTag=").Append(local_30.SourceTag).Append(" "));
                        FString local_268_2 = (local_254_2 + FString().Append("InvalidReason=").Append(local_128));
                        XLog(ELog(30), local_268_2);
                    }
                    TArray<FEntitySearchResult> local_250 = ::FEcologySceneInfoUtils::RequestResource(local_124);
                    if (this.TryHandleRequestSuccess(Context, local_10, local_30, local_8, local_250))
                    {
                        return true;
                    }
                }
                else
                {
                    local_246 = ::FEcologySceneInfoUtils::RequestResource(local_124);
                    if (this.TryHandleRequestSuccess(Context, local_10, local_30, local_8, local_246))
                    {
                        return true;
                    }
                }
                continue;
            }
            if (int(local_30.GetSearchType()) == 1)
            {
                if (FECSEntity(local_30.SpecifiedResourceId).IsValid())
                {
                    this.OutputSpecifiedResource(Context, local_10, local_30.SpecifiedResourceId);
                    local_22 = local_30.ReasonTag;
                    FGameplayTag local_280;
                    if (local_30.SourceTag.IsValid())
                    {
                        local_280 = local_30.SourceTag;
                    }
                    else
                    {
                        local_280 = FEcologyGameplayTagDefine::Ecology_ChangeAreaSource_Common;
                    }
                    this.SetRequestResultInfo(local_8, Context, local_22, local_280, local_30.bForceUpdateTargetResource, local_30.bNeedChangeAreaMessage, local_30.MessageInfo, int(local_30._base_FFlockBehaviorRequest));
                    return true;
                }
            }
        }
        return false;
    }
}

class UHTNTask_ClearAllFlockChangeAreaRequest : UHTNTask_ECSScriptBase
{
    UHTNTask_ClearAllFlockChangeAreaRequest()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        this.SubmitPlanStep(100, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_RecordVisitedCombatRegion : UHTNTask_ECSScriptBase
{
    UHTNTask_RecordVisitedCombatRegion()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        this.SubmitPlanStep(100, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        int local_28 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FECSEntityId local_7 = ::FEcologyBehaviorUtils::FindMainTargetResource(local_4);
        if ((local_7 == ENTITY_ID_NULL))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FECSEntity local_16 = FECSEntity(local_7);
        if (!(local_16.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FECSEntity local_12 = ::FEcologySceneInfoUtils::FindCombatRegionByEntity(local_16);
        if (!(local_12.IsValid()) || (local_12.GetId() == ENTITY_ID_NULL))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        if (!(local_28))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        int local_29 = 0;
        for (; local_29 < local_28.VisitedCombatRegion.Num(); ++local_29)
        {
            if ((local_28.VisitedCombatRegion[local_29] == local_12.GetId()))
            {
                this.FinishExecuteWithContext(Context, true);
                return;
            }
        }
        local_28.VisitedCombatRegion.Add(local_12.GetId());
        while (local_28.VisitedCombatRegion.Num() > 2)
        {
            local_28.VisitedCombatRegion.RemoveAt(0);
        }
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_SearchResourceInCurrentCombatRegion : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    int SearchRadius = 10000;
    UPROPERTY()
    FBlackboardKeySelector ResourceId_Key;


    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        AECSRegionVolume local_76;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FECSEntity local_8;
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_32;
        Get local_36;
        const FC_EcologyFlockComponent& local_38 = local_36.opCall();
        if (local_38)
        {
            local_8 = FECSEntity(FECSEntityId(local_38.LeaderEntity));
            local_32 = local_38.FlockMainCreature;
        }
        if (!(local_8))
        {
            return;
        }
        FECSEntity local_44 = ::FEcologySceneInfoUtils::FindCombatRegionByEntity(local_8);
        if (!(local_44.IsValid()) || (local_44.GetId() == ENTITY_ID_NULL))
        {
            return;
        }
        if (local_44.IsValid())
        {
            Get local_80;
            if (local_80.opCall())
            {
                AActor local_84;
                local_76 = (Cast<AECSRegionVolume>(local_84));
            }
        }
        if (local_76 == nullptr)
        {
            return;
        }
        FResourceSearchRequest local_176;
        local_176.Requester = local_8.GetId();
        local_176.SearchRadius = this.SearchRadius;
        local_176.bFilterByCreatureType = true;
        local_176.CreatureRow = local_32;
        local_176.IncludeOtherVolumes.Add(FVolumeProxy(local_76));
        TArray<FEntitySearchResult> local_184 = ::FEcologySceneInfoUtils::RequestResource(local_176);
        if (local_184.Num() <= 0)
        {
            return;
        }
        HTNNode::SetWorldStateValueAsEntityId(Context, this.ResourceId_Key, local_184[0].EntityId);
        this.SubmitPlanStep(100, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

class UHTNTask_AddDefaultChangeAreaRequest : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    int SearchRadius = 50000;
    UPROPERTY()
    FGameplayTag ReasonTag;
    UPROPERTY()
    FGameplayTag SourceTag;


    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        this.SubmitPlanStep(100, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        ::FEcologyBehaviorUtils::AddDefaultChangeAreaRequest(local_4, this.SearchRadius, this.ReasonTag, this.SourceTag, false, FEcologyConst::EmptyChangeAreaMessageInfo, 25000.0f, 50000.0f, 0, false, false);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
}

