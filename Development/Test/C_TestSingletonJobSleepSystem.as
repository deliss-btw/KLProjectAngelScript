
namespace __INTENRAL_FCS_TestSingletonSleep_NS
{
    const TECSComponentDerivedPtr<FCS_TestSingletonSleep> DerivedPtr = TECSComponentDerivedPtr<FCS_TestSingletonSleep>();
    const FCS_TestSingletonSleep DefaultValue = FCS_TestSingletonSleep();

}
struct FCS_TestSingletonSleep : FECSSingleton
{
    UPROPERTY()
    int Value;


}

namespace ECSFunc_FCS_TestSingletonSleep
{
UFUNCTION()
bool HasTestSingletonSleep(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TestSingletonSleep);
}
FCS_TestSingletonSleep& AssignTestSingletonSleep(const FECSWorldPtr &inout World, const FCS_TestSingletonSleep &inout DefaultValue = FCS_TestSingletonSleep())
{
    UScriptStruct local_6 = FCS_TestSingletonSleep;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTestSingletonSleep_BP(const FECSWorldPtr &inout World, const FCS_TestSingletonSleep &inout DefaultValue = FCS_TestSingletonSleep())
{
    ECSFunc_FCS_TestSingletonSleep::AssignTestSingletonSleep(World, DefaultValue);
    return;
}
FCS_TestSingletonSleep& ModifyTestSingletonSleep(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestSingletonSleep;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TestSingletonSleep& ModifyOrAddTestSingletonSleep(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestSingletonSleep;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TestSingletonSleep& GetTestSingletonSleep(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestSingletonSleep;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TestSingletonSleep GetTestSingletonSleep_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_TestSingletonSleep& local_4 = ECSFunc_FCS_TestSingletonSleep::GetTestSingletonSleep(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_TestSingletonSleep();
}
const FCS_TestSingletonSleep GetDefaultedTestSingletonSleep(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TestSingletonSleep __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TestSingletonSleep);
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
FCS_TestSingletonSleep GetDefaultedTestSingletonSleep_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_TestSingletonSleep::GetDefaultedTestSingletonSleep(World);
}
UFUNCTION()
bool RemoveTestSingletonSleep(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TestSingletonSleep);
}
}
void __MonitorTestSingletonSleepLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TestSingletonSleep, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestSingletonSleepActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TestSingletonSleep, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestSingletonSleepModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TestSingletonSleep, bFixedFrame, Details);
    return;
}
