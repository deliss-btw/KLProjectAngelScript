

class UFrontendSystemBehavior_ApplyIMC : UFrontendSystemBehaviorBase
{
    UPROPERTY()
    FEnhancedInputContextRowRef InputContext;

    UFrontendSystemBehavior_ApplyIMC()
    {
        super();
        return;
    }
    void OnEnter(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        int local_16 = 0;
        if (!(this.InputContext.IsValid()))
        {
            XError(ELog(52), FString().Append("IMC is not valid in ").Append(this));
            return;
        }
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        int local_44 = local_16.InputContextRefNums.FindOrAdd(TDataObjectPtr<FEnhancedInputContextConfig>(), 0);
        ++local_44;
        if (int(local_44) == 1)
        {
            ::EnhancedInputUtils::AddInputContext(Context.PlayerEntity, TDataObjectPtr<FEnhancedInputContextConfig>());
        }
        return;
    }
    void OnExit(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        int local_10 = 0;
        if (!(this.InputContext.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        int local_38 = local_10.InputContextRefNums.FindOrAdd(TDataObjectPtr<FEnhancedInputContextConfig>(), 0);
        --local_38;
        if (int(local_38) <= 0)
        {
            ::EnhancedInputUtils::RemoveInputContext(Context.PlayerEntity, TDataObjectPtr<FEnhancedInputContextConfig>());
        }
        return;
    }
}

class UFrontendSystemBehavior_DisableInputContextTag : UFrontendSystemBehaviorBase
{
    UPROPERTY()
    FGameplayTag Tag;

    UFrontendSystemBehavior_DisableInputContextTag()
    {
        super();
        return;
    }
    void OnEnter(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        int local_10 = 0.TagDisableNums.FindOrAdd(this.Tag);
        ++local_10;
        if (int(local_10) == 1)
        {
            ::EnhancedInputUtils::DisableTag(Context.PlayerEntity, this.Tag);
        }
        return;
    }
    void OnExit(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        int local_10 = 0.TagDisableNums.FindOrAdd(this.Tag);
        --local_10;
        if (int(local_10) <= 0)
        {
            ::EnhancedInputUtils::EnableTag(Context.PlayerEntity, this.Tag);
        }
        return;
    }
}

