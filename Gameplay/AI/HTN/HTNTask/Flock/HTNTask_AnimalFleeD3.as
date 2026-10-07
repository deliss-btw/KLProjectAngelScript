

class UHTNTask_D3FindScaredSource : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    bool FindSpecifiedCreature;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> SpecifiedCreature;
    UPROPERTY()
    FBlackboardKeySelector ReactionValidMark;
    UPROPERTY()
    FBlackboardKeySelector OutReactionName;
    UPROPERTY()
    FBlackboardKeySelector OutSourceEntityId;
    UPROPERTY()
    FBlackboardKeySelector OutSourcePosition;
    UPROPERTY()
    float32 SearchRadius = 5000.0f;

    default SetNodeName("D3Demo_FindScaredSource");


    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        int local_10 = 0;
        int local_38 = 0;
        int local_84 = 0;
        TMapIterator<FECSEntityId, FEcologyVoxelSceneUnitSummary> local_142;
        int local_162 = 0;
        int local_166 = 0;
        int local_172 = 0;
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        if (!(local_10))
        {
            return;
        }
        if (!(FECSEntity(local_10.LeaderEntity)))
        {
            return;
        }
        FVector local_26;
        float32 local_27 = this.SearchRadius;
        FName local_30(n"Scared");
        if (!(local_38))
        {
            return;
        }
        local_26 = local_38.GetPosition();
        FBox local_74 = FBox::BuildAABB(local_26, FVector(local_27));
        FVoxelRegionScope local_78 = FVoxelRegionScope(local_74);
        FECSWorldPtr local_86 = ECS::GetECSWorld();
        FVoxelRegionIterator local_100 = local_78.Iterator();
        for (; local_100.CanProceed;)
        {
            FEcologyVoxelSceneRegion& local_114 = local_84.VoxelScene.FindOrAddRegion(local_100.Proceed().Current);
            for (auto& local_134 : local_114.GetCellSlotDataRef(EEcologyVoxelUnitSlot(1)))
            {
                local_134;
                for (; local_142.CanProceed;)
                {
                    FECSEntity local_156 = FECSEntity(local_142.Proceed().GetKey());
                    if (!(local_156.IsValid()))
                    {
                        continue;
                    }
                    if (!(local_74.IsInside(local_162.GetPosition())))
                    {
                        continue;
                    }
                    if (::FEcologyBattleForAreaUtils::CheckTargetMonsterRank(local_156, EMonsterRank(2)))
                    {
                        if (!(local_166))
                        {
                            continue;
                        }
                        if (this.FindSpecifiedCreature)
                        {
                            FDataObjectPtr local_244;
                            TDataObjectPtr<FEcologyCreatureDefinitionRow> local_196;
                            local_196 = local_172.CreatureType;
                            local_244;
                            if ((!((local_196 == local_244))))
                            {
                                continue;
                            }
                        }
                        Context.SetWorldStateAsName(this.OutReactionName, local_30);
                        local_156.GetId();
                        Context.SetWorldStateAsVector(this.OutSourcePosition, local_166.GetPosition());
                        Context.SetWorldStateAsBool(this.ReactionValidMark, true);
                        this.SubmitPlanStep(100, "");
                        return;
                    }
                }
            }
        }
        return;
    }
}

class UHTNTask_D3MakeChangeAreaRequestByFlee : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Name ResultSaveKey;
    UPROPERTY()
    FResourceRequestFilterConfig ResourceRequest;

    default SetNodeName("D3Demo_MakeChangeAreaRequestByFlee");

    UHTNTask_D3MakeChangeAreaRequestByFlee()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        if (!(FECSEntity(local_6.LeaderEntity)))
        {
            return;
        }
        if (!(FECSEntity(local_6.GetMainTargetResource())))
        {
            return;
        }
        this.SubmitPlanStep(1, "");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        this.FinishExecuteWithContext(Context, this.RequestNewResource(Context));
        return;
    }
    bool RequestNewResource(const FHTNContext &inout Context)
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return false;
        }
        FECSEntity local_12 = FECSEntity(local_6.LeaderEntity);
        if (!(local_12))
        {
            return false;
        }
        if (!(FECSEntity(local_6.GetMainTargetResource())))
        {
            return false;
        }
        FResourceSearchRequest local_112;
        this.ResourceRequest.MakeRequest(local_12, local_112);
        TArray<FEntitySearchResult> local_116 = ::FEcologySceneInfoUtils::RequestResource(local_112);
        FAISmartValueContext local_132;
        FInstancedStruct::Make(local_132);
        FName local_136 = this.ResultSaveKey.GetValue(Context.opImplConv());
        FECSEntity local_22 = Context.GetControllerEntity();
        return (local_116.Num() > 0);
    }
}

class UHTNTask_D3FleeResourceFilter : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Bool bContainerCurrent;
    UPROPERTY()
    FAISmart_Name ResourceListKey;
    UPROPERTY()
    FBlackboardKeySelector ResourceId_Key;

    default SetNodeName("D3Demo_FleeResourceFilter");

    UHTNTask_D3FleeResourceFilter()
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
        this.FinishExecute(this.RealExecute(Context));
        return;
    }
    bool RealExecute(const FHTNContext &inout Context)
    {
        int local_10 = 0;
        bool local_22 = false;
        int local_30 = 0;
        FName local_8 = this.ResourceListKey.GetValue(Context.opImplConv());
        FECSEntity local_4 = Context.GetControllerEntity();
        if (!(FInstancedStruct::GetPtr(local_10).opCall()) || (0 == 0))
        {
            return false;
        }
        FAISmartValueContext local_6 = Context.opImplConv();
        FECSEntity local_4_2 = FECSEntity(local_30.LeaderEntity);
        if (!(local_4_2.IsValid()))
        {
            return false;
        }
        TArray<FEntitySearchResult> local_38;
        int local_39 = 0;
        for (; local_39 < local_38.Num(); ++local_39)
        {
            FECSEntityId local_40 = FECSEntityId(local_38[local_39].EntityId);
            if ((local_22 || !((local_30.ActivityTarget.MainTargetResource == local_40))))
            {
                if (!(::FEcologyBehaviorUtils::ResourcePathConnectedCheck(local_4_2, local_30.ActivityTarget.MainTargetResource, local_40)))
                {
                    continue;
                }
                Context.SetWorldStateAsEntityId(this.ResourceId_Key, local_40);
                return true;
            }
        }
        return false;
    }
}

