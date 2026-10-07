
namespace __INTENRAL_FCS_FrontendSystemInputContextCounter_NS
{
    const TECSComponentDerivedPtr<FCS_FrontendSystemInputContextCounter> DerivedPtr = TECSComponentDerivedPtr<FCS_FrontendSystemInputContextCounter>();
    const FCS_FrontendSystemInputContextCounter DefaultValue = FCS_FrontendSystemInputContextCounter();

}
struct FCS_FrontendSystemInputContextCounter : FECSSingleton
{
    UPROPERTY()
    TMap<TDataObjectPtr<FEnhancedInputContextConfig>, int> InputContextRefNums;
    UPROPERTY()
    TMap<FGameplayTag, int> TagDisableNums;

    FCS_FrontendSystemInputContextCounter()
    {
        return;
    }
}

namespace ECSFunc_FCS_FrontendSystemInputContextCounter
{
UFUNCTION()
bool HasFrontendSystemInputContextCounter(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_FrontendSystemInputContextCounter);
}
FCS_FrontendSystemInputContextCounter& AssignFrontendSystemInputContextCounter(const FECSWorldPtr &inout World, const FCS_FrontendSystemInputContextCounter &inout DefaultValue = FCS_FrontendSystemInputContextCounter())
{
    UScriptStruct local_6 = FCS_FrontendSystemInputContextCounter;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignFrontendSystemInputContextCounter_BP(const FECSWorldPtr &inout World, const FCS_FrontendSystemInputContextCounter &inout DefaultValue = FCS_FrontendSystemInputContextCounter())
{
    ECSFunc_FCS_FrontendSystemInputContextCounter::AssignFrontendSystemInputContextCounter(World, DefaultValue);
    return;
}
FCS_FrontendSystemInputContextCounter& ModifyFrontendSystemInputContextCounter(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_FrontendSystemInputContextCounter;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_FrontendSystemInputContextCounter& ModifyOrAddFrontendSystemInputContextCounter(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_FrontendSystemInputContextCounter;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_FrontendSystemInputContextCounter& GetFrontendSystemInputContextCounter(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_FrontendSystemInputContextCounter;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_FrontendSystemInputContextCounter GetFrontendSystemInputContextCounter_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_FrontendSystemInputContextCounter __r;
    bValid = false;
    bValid = ECSFunc_FCS_FrontendSystemInputContextCounter::GetFrontendSystemInputContextCounter(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_FrontendSystemInputContextCounter GetDefaultedFrontendSystemInputContextCounter(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_FrontendSystemInputContextCounter __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_FrontendSystemInputContextCounter);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_FrontendSystemInputContextCounter GetDefaultedFrontendSystemInputContextCounter_BP(const FECSWorldPtr &inout World)
{
    FCS_FrontendSystemInputContextCounter __r;
    return __r;
}
UFUNCTION()
bool RemoveFrontendSystemInputContextCounter(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_FrontendSystemInputContextCounter);
}
}
void __MonitorFrontendSystemInputContextCounterLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_FrontendSystemInputContextCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFrontendSystemInputContextCounterActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_FrontendSystemInputContextCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFrontendSystemInputContextCounterModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_FrontendSystemInputContextCounter, bFixedFrame, Details);
    return;
}
