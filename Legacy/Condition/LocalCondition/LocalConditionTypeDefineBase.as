

UCLASS(Abstract)
class ULocalConditionTypeDefineBase : UObject
{
    ULocalConditionTypeDefineBase()
    {
        return;
    }
    void GetSubscriptionKeys(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FName> &inout OutKeys) const
    {
        return;
    }
    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        TArray<FName> local_4;
        this.GetSubscriptionKeys(ConditionInstance.GetConditionConfig(), local_4);
        if (local_4.IsEmpty())
        {
            local_4.Add(NAME_None);
        }
        FECSWorldPtr local_32 = ECS::GetECSWorld();
        ModifyOrAdd local_36;
        FCS_LocalConditionSubscriptionManager& local_38 = local_36.opCall();
        if (local_38)
        {
            for (auto& local_52 : local_4)
            {
                local_38.Subscribe(this, local_52, ConditionInstance.GetHandle());
            }
        }
        return;
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_LocalConditionSubscriptionManager& local_8 = local_6.opCall();
        if (local_8)
        {
            TArray<FName> local_14;
            this.GetSubscriptionKeys(ConditionInstance.GetConditionConfig(), local_14);
            if (local_14.IsEmpty())
            {
                local_14.Add(NAME_None);
            }
            for (auto& local_54 : local_14)
            {
                local_8.Unsubscribe(this, local_54, ConditionInstance.GetHandle());
            }
            if (local_8.IsEmpty())
            {
                FECSWorldPtr local_82 = ECS::GetECSWorld();
                Remove local_86;
                local_86.opCall();
            }
        }
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        return;
    }
}

struct FLocalConditionTypeDefineConfigBase
{
    UPROPERTY()
    TSubclassOf<ULocalConditionTypeDefineBase> ConditionType;

    FLocalConditionTypeDefineConfigBase()
    {
        return;
    }
}

