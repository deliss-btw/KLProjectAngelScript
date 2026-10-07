
enum EConditionUsage
{
    None,
    Mission,
    MaxCount,
}

namespace __INTENRAL_FCE_ConditionCurrentValueUpdate_NS
{
    const TECSEventDerivedPtr<FCE_ConditionCurrentValueUpdate> DerivedPtr = TECSEventDerivedPtr<FCE_ConditionCurrentValueUpdate>();
}
namespace __INTENRAL_FCE_ConditionReachStateUpdate_NS
{
    const TECSEventDerivedPtr<FCE_ConditionReachStateUpdate> DerivedPtr = TECSEventDerivedPtr<FCE_ConditionReachStateUpdate>();
}
namespace __INTENRAL_FCE_AnyConditionReachStateUpdate_NS
{
    const TECSEventDerivedPtr<FCE_AnyConditionReachStateUpdate> DerivedPtr = TECSEventDerivedPtr<FCE_AnyConditionReachStateUpdate>();
}
namespace __INTENRAL_FCE_LocalConditionRegisterStateUpdate_NS
{
    const TECSEventDerivedPtr<FCE_LocalConditionRegisterStateUpdate> DerivedPtr = TECSEventDerivedPtr<FCE_LocalConditionRegisterStateUpdate>();
}
namespace __INTENRAL_FCE_GSConditionCurrentValueUpdate_NS
{
    const TECSEventDerivedPtr<FCE_GSConditionCurrentValueUpdate> DerivedPtr = TECSEventDerivedPtr<FCE_GSConditionCurrentValueUpdate>();

}
struct FConditionIdentifier
{
    UPROPERTY()
    uint64 ConditionId;
    UPROPERTY()
    uint UniqueIdForUsage;
    UPROPERTY()
    EConditionUsage ConditionUsage;

    FConditionIdentifier(const uint64 InConditionId, const uint InUniqueIdForUsage, const EConditionUsage InConditionUsage)
    {
        this.ConditionId = InConditionId;
        this.UniqueIdForUsage = InUniqueIdForUsage;
        this.ConditionUsage = InConditionUsage;
        return;
    }
    int opCmp(const FConditionIdentifier &inout Other) const
    {
        if (int(this.ConditionUsage) != int(Other.ConditionUsage))
        {
            return (int(this.ConditionUsage) - int(Other.ConditionUsage));
        }
        if (this.UniqueIdForUsage != int(Other.UniqueIdForUsage))
        {
            return this.UniqueIdForUsage - int(Other.UniqueIdForUsage);
        }
        if (this.ConditionId < Other.ConditionId)
        {
            return -1;
        }
        if (this.ConditionId > Other.ConditionId)
        {
            return 1;
        }
        return 0;
    }
    uint Hash() const
    {
        int local_1 = 0;
        int local_4 = this.ConditionId & 4294967295;
        int local_2 = local_4;
        local_1 = HashCombine(local_1, local_2);
        int local_7 = 32;
        int local_2_2 = ((this.ConditionId >> local_7) & 4294967295);
        local_1 = HashCombine(local_1, local_2_2);
        local_1 = HashCombine(local_1, this.UniqueIdForUsage);
        local_1 = HashCombine(local_1, int(this.ConditionUsage));
        return local_1;
    }
}

struct FCE_ConditionCurrentValueUpdate : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FConditionInstanceHandle ConditionInstance;

    FCE_ConditionCurrentValueUpdate()
    {
        return;
    }
}

struct FCE_ConditionReachStateUpdate : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FConditionInstanceHandle ConditionInstance;

    FCE_ConditionReachStateUpdate()
    {
        return;
    }
}

struct FCE_AnyConditionReachStateUpdate : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_AnyConditionReachStateUpdate()
    {
        return;
    }
}

struct FCE_LocalConditionRegisterStateUpdate : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_LocalConditionRegisterStateUpdate()
    {
        return;
    }
}

struct FCE_GSConditionCurrentValueUpdate : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TMap<uint, uint> GSConditionValueMap;
    UPROPERTY()
    TMap<FConditionIdentifier, int> GSEventValueMap;

    FCE_GSConditionCurrentValueUpdate()
    {
        return;
    }
}

