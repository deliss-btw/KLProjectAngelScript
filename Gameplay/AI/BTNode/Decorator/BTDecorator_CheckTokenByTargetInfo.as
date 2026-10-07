

class UBTDecorator_CheckTokenByTarget : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    TDataObjectPtr<FAITokenByTargetConfig> TokenConfig;

    default SetNodeName("жЈЂжџҐTokenByTarget");

    UBTDecorator_CheckTokenByTarget()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_38 = 0;
        int local_83 = 0;
        FECSEntity local_12 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        FECSEntity local_16;
        if (!(local_12.IsValid()) || !(this.TokenConfig) || !(this.TokenConfig.IsSet()))
        {
            return false;
        }
        Get local_22;
        const FC_ControlledByPlayer& local_24 = local_22.opCall();
        if (local_24)
        {
            local_16 = local_24.GetPlayerEntity();
        }
        else
        {
            Get local_28;
            const FC_ControlledByAI& local_30 = local_28.opCall();
            if (local_30)
            {
                local_16 = FECSEntity(local_30.GetControllerEntity());
            }
            else
            {
                return true;
            }
        }
        FECSWorldPtr local_32 = ECS::GetECSWorld();
        FEcosimAIV2TokenByTargetKey local_44;
        local_44.RowName = this.TokenConfig.GetDataName();
        local_44.TargetEntity = local_16;
        FAITokenByTarget& local_48 = local_38.DataMap.FindOrAdd(local_44);
        if (!(local_48.Config) || !(local_48.Config.IsSet()))
        {
            local_48.Config = this.TokenConfig;
        }
        if (0.0f > 0.0f)
        {
            if ((ECS::GetContextTime() - local_48.LastConsumedTime).ToSeconds() < 0.0f)
            {
                return false;
            }
        }
        if (local_83 > 0)
        {
            if (int(local_48.CurrentConsumedTokenNum) >= local_83)
            {
                return false;
            }
        }
        return true;
    }
    UFUNCTION()
    void OnNodeActivation_Implementation(const FAIBehaviorTreeSearchContext &inout SearchContext) const
    {
        int local_38 = 0;
        FECSEntity local_12 = FECSEntity(this.TargetEntityID.GetValue(SearchContext.opImplConv()));
        FECSEntity local_16;
        Get local_20;
        const FC_ControlledByPlayer& local_22 = local_20.opCall();
        if (local_22)
        {
            local_16 = local_22.GetPlayerEntity();
        }
        else
        {
            Get local_28;
            const FC_ControlledByAI& local_30 = local_28.opCall();
            if (local_30)
            {
                local_16 = FECSEntity(local_30.GetControllerEntity());
            }
            else
            {
                return;
            }
        }
        FECSWorldPtr local_32 = ECS::GetECSWorld();
        FEcosimAIV2TokenByTargetKey local_44;
        local_44.RowName = this.TokenConfig.GetDataName();
        local_44.TargetEntity = local_16;
        FAITokenByTarget& local_48 = local_38.DataMap.FindOrAdd(local_44);
        local_48.CurrentConsumedTokenNum = (int(local_48.CurrentConsumedTokenNum) + 1);
        local_48.LastConsumedTime = ECS::GetContextTime();
        if (0 == 1)
        {
            local_48.ParallelRecoverTimers.Add(0);
        }
        return;
    }
}

