

class UHTNTask_SwitchAreaResourceFilter : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Bool bContainerCurrent;
    UPROPERTY()
    FAISmart_Name ResourceListKey;
    UPROPERTY()
    FBlackboardKeySelector ResourceId_Key;

    UHTNTask_SwitchAreaResourceFilter()
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
        int local_10 = 0;
        bool local_22 = false;
        int local_30 = 0;
        int local_36 = 0;
        FName local_8 = this.ResourceListKey.GetValue(Context.opImplConv());
        FECSEntity local_4 = Context.GetControllerEntity();
        if (!(FInstancedStruct::GetMutablePtr_Const(local_10).opCall()) || (0 == 0))
        {
            local_22 = true;
            this.FinishExecuteWithContext(Context, local_22);
            return;
        }
        FAISmartValueContext local_6 = Context.opImplConv();
        FECSEntity local_4_2 = FECSEntity(local_30.LeaderEntity);
        if (!(local_4_2.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        TArray<FEntitySearchResult> local_42;
        local_42.Shuffle();
        int local_43 = 0;
        for (; local_43 < local_42.Num(); ++local_43)
        {
            FECSEntityId local_44 = FECSEntityId(local_42[local_43].EntityId);
            if ((local_22 || !((local_30.ActivityTarget.MainTargetResource == local_44))))
            {
                if (!(local_36.ChangeAreaData.bNeedPathConnectedCheckBeforeChangeArea) == !(true))
                {
                    if (!(::FEcologyBehaviorUtils::ResourcePathConnectedCheck(local_4_2, local_30.ActivityTarget.MainTargetResource, local_44)))
                    {
                        continue;
                    }
                }
                HTNNode::SetWorldStateValueAsEntityId(Context, this.ResourceId_Key, local_44);
                this.FinishExecuteWithContext(Context, true);
                return;
            }
        }
        this.FinishExecuteWithContext(Context, false);
        return;
    }
}

