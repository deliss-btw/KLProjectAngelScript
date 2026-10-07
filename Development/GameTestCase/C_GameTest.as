
namespace __INTENRAL_FC_GameTest_NS
{
    const TECSComponentDerivedPtr<FC_GameTest> DerivedPtr = TECSComponentDerivedPtr<FC_GameTest>();
    const FC_GameTest DefaultValue = FC_GameTest();
}
namespace __INTENRAL_FC_GameTestStartTimer_NS
{
    const TECSComponentDerivedPtr<FC_GameTestStartTimer> DerivedPtr = TECSComponentDerivedPtr<FC_GameTestStartTimer>();
    const FC_GameTestStartTimer DefaultValue = FC_GameTestStartTimer();
}
namespace __INTENRAL_FC_TestCaseStartTimer_NS
{
    const TECSComponentDerivedPtr<FC_TestCaseStartTimer> DerivedPtr = TECSComponentDerivedPtr<FC_TestCaseStartTimer>();
    const FC_TestCaseStartTimer DefaultValue = FC_TestCaseStartTimer();
}
namespace __INTENRAL_FC_GameTestInitPrefabTag_NS
{
    const TECSComponentDerivedPtr<FC_GameTestInitPrefabTag> DerivedPtr = TECSComponentDerivedPtr<FC_GameTestInitPrefabTag>();
    const FC_GameTestInitPrefabTag DefaultValue = FC_GameTestInitPrefabTag();
}
namespace __INTENRAL_FC_BeginGameTestTag_NS
{
    const TECSComponentDerivedPtr<FC_BeginGameTestTag> DerivedPtr = TECSComponentDerivedPtr<FC_BeginGameTestTag>();
    const FC_BeginGameTestTag DefaultValue = FC_BeginGameTestTag();
}
namespace __INTENRAL_FCE_GameTestRequestStart_NS
{
    const TECSEventDerivedPtr<FCE_GameTestRequestStart> DerivedPtr = TECSEventDerivedPtr<FCE_GameTestRequestStart>();
}
namespace __INTENRAL_FCE_GameTestRequestStop_NS
{
    const TECSEventDerivedPtr<FCE_GameTestRequestStop> DerivedPtr = TECSEventDerivedPtr<FCE_GameTestRequestStop>();
}
namespace __INTENRAL_FCE_GameTestFinished_NS
{
    const TECSEventDerivedPtr<FCE_GameTestFinished> DerivedPtr = TECSEventDerivedPtr<FCE_GameTestFinished>();

}
struct FC_GameTest : FECSComponent
{
    UPROPERTY()
    uint GameTestId;
    UPROPERTY()
    float32 StartDelay = 3.0f;
    UPROPERTY()
    FString OutputFolder;
    UPROPERTY()
    TArray<FGTCTestCaseConfig> TestCaseList;
    UPROPERTY()
    uint IssuerControllerEntityId = 0;
    UPROPERTY()
    TArray<uint> RuntimeEntityIds;


}

struct FT_GameTest : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_GameTest_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_GameTest, NAME_None);
    UPROPERTY()
    FC_GameTest Config_FC_GameTest;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_BeginGameTestTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_BeginGameTestTag, NAME_None);

    FT_GameTest()
    {
        return;
    }
}

struct FC_GameTestStartTimer : FECSComponent
{
    UPROPERTY()
    FFPTime StartAtTime;

    FC_GameTestStartTimer()
    {
        return;
    }
}

struct FC_TestCaseStartTimer : FECSComponent
{
    UPROPERTY()
    FFPTime StartAtTime;

    FC_TestCaseStartTimer()
    {
        return;
    }
}

struct FC_GameTestInitPrefabTag : FECSComponent
{
    FC_GameTestInitPrefabTag()
    {
        return;
    }
}

struct FC_BeginGameTestTag : FECSComponent
{
    FC_BeginGameTestTag()
    {
        return;
    }
}

struct FCE_GameTestRequestStart : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint GameTestId;
    UPROPERTY()
    FString OutputFolder;
    UPROPERTY()
    TArray<FGTCTestCaseConfig> TestCaseList;


}

struct FCE_GameTestRequestStop : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint GameTestEntityId;


}

struct FCE_GameTestFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint GameTestId;


}

struct FGTCGameTestJsonOutput
{
    UPROPERTY()
    FString TestEntityName;
    UPROPERTY()
    TArray<FString> Results;

    FGTCGameTestJsonOutput()
    {
        return;
    }
}

namespace ECSFunc_FC_GameTest
{
UFUNCTION()
bool HasGameTest(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameTest);
}
FC_GameTest& AssignGameTest(const FECSEntity &inout Entity, const FC_GameTest &inout DefaultValue = FC_GameTest())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameTest, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameTest_BP(const FECSEntity &inout Entity, const FC_GameTest &inout DefaultValue = FC_GameTest())
{
    ECSFunc_FC_GameTest::AssignGameTest(Entity, DefaultValue);
    return;
}
FC_GameTest& ModifyGameTest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameTest));
    return local_12.GetComp();
}
FC_GameTest& ModifyOrAddGameTest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameTest));
    return local_12.GetComp();
}
const FC_GameTest& GetGameTest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameTest));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameTest GetGameTest_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GameTest __r;
    bValid = false;
    bValid = ECSFunc_FC_GameTest::GetGameTest(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GameTest GetDefaultedGameTest(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameTest __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameTest);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GameTest GetDefaultedGameTest_BP(const FECSEntity &inout Entity)
{
    FC_GameTest __r;
    return __r;
}
UFUNCTION()
bool RemoveGameTest(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameTest);
}
}
FECSMonitorRuntimeView __GetMonitorGameTestOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameTest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameTest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameTest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameTest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameTest, bFixedFrame, bMustHandleAll);
}
void __MonitorGameTestLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameTest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameTestActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameTest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameTestModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameTest, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GameTestStartTimer
{
UFUNCTION()
bool HasGameTestStartTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameTestStartTimer);
}
FC_GameTestStartTimer& AssignGameTestStartTimer(const FECSEntity &inout Entity, const FC_GameTestStartTimer &inout DefaultValue = FC_GameTestStartTimer())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameTestStartTimer, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameTestStartTimer_BP(const FECSEntity &inout Entity, const FC_GameTestStartTimer &inout DefaultValue = FC_GameTestStartTimer())
{
    ECSFunc_FC_GameTestStartTimer::AssignGameTestStartTimer(Entity, DefaultValue);
    return;
}
FC_GameTestStartTimer& ModifyGameTestStartTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameTestStartTimer));
    return local_12.GetComp();
}
FC_GameTestStartTimer& ModifyOrAddGameTestStartTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameTestStartTimer));
    return local_12.GetComp();
}
const FC_GameTestStartTimer& GetGameTestStartTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameTestStartTimer));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameTestStartTimer GetGameTestStartTimer_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GameTestStartTimer __r;
    bValid = false;
    bValid = ECSFunc_FC_GameTestStartTimer::GetGameTestStartTimer(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GameTestStartTimer GetDefaultedGameTestStartTimer(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameTestStartTimer __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameTestStartTimer);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GameTestStartTimer GetDefaultedGameTestStartTimer_BP(const FECSEntity &inout Entity)
{
    FC_GameTestStartTimer __r;
    return __r;
}
UFUNCTION()
bool RemoveGameTestStartTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameTestStartTimer);
}
}
FECSMonitorRuntimeView __GetMonitorGameTestStartTimerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameTestStartTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestStartTimerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameTestStartTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestStartTimerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameTestStartTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestStartTimerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameTestStartTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestStartTimerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameTestStartTimer, bFixedFrame, bMustHandleAll);
}
void __MonitorGameTestStartTimerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameTestStartTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameTestStartTimerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameTestStartTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameTestStartTimerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameTestStartTimer, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TestCaseStartTimer
{
UFUNCTION()
bool HasTestCaseStartTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TestCaseStartTimer);
}
FC_TestCaseStartTimer& AssignTestCaseStartTimer(const FECSEntity &inout Entity, const FC_TestCaseStartTimer &inout DefaultValue = FC_TestCaseStartTimer())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TestCaseStartTimer, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTestCaseStartTimer_BP(const FECSEntity &inout Entity, const FC_TestCaseStartTimer &inout DefaultValue = FC_TestCaseStartTimer())
{
    ECSFunc_FC_TestCaseStartTimer::AssignTestCaseStartTimer(Entity, DefaultValue);
    return;
}
FC_TestCaseStartTimer& ModifyTestCaseStartTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TestCaseStartTimer));
    return local_12.GetComp();
}
FC_TestCaseStartTimer& ModifyOrAddTestCaseStartTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TestCaseStartTimer));
    return local_12.GetComp();
}
const FC_TestCaseStartTimer& GetTestCaseStartTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TestCaseStartTimer));
    return local_12.GetComp();
}
UFUNCTION()
FC_TestCaseStartTimer GetTestCaseStartTimer_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_TestCaseStartTimer __r;
    bValid = false;
    bValid = ECSFunc_FC_TestCaseStartTimer::GetTestCaseStartTimer(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_TestCaseStartTimer GetDefaultedTestCaseStartTimer(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TestCaseStartTimer __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TestCaseStartTimer);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_TestCaseStartTimer GetDefaultedTestCaseStartTimer_BP(const FECSEntity &inout Entity)
{
    FC_TestCaseStartTimer __r;
    return __r;
}
UFUNCTION()
bool RemoveTestCaseStartTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TestCaseStartTimer);
}
}
FECSMonitorRuntimeView __GetMonitorTestCaseStartTimerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TestCaseStartTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestCaseStartTimerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TestCaseStartTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestCaseStartTimerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TestCaseStartTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestCaseStartTimerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TestCaseStartTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestCaseStartTimerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TestCaseStartTimer, bFixedFrame, bMustHandleAll);
}
void __MonitorTestCaseStartTimerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TestCaseStartTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestCaseStartTimerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TestCaseStartTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestCaseStartTimerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TestCaseStartTimer, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GameTestInitPrefabTag
{
UFUNCTION()
bool HasGameTestInitPrefabTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameTestInitPrefabTag);
}
FC_GameTestInitPrefabTag& AssignGameTestInitPrefabTag(const FECSEntity &inout Entity, const FC_GameTestInitPrefabTag &inout DefaultValue = FC_GameTestInitPrefabTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameTestInitPrefabTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameTestInitPrefabTag_BP(const FECSEntity &inout Entity, const FC_GameTestInitPrefabTag &inout DefaultValue = FC_GameTestInitPrefabTag())
{
    ECSFunc_FC_GameTestInitPrefabTag::AssignGameTestInitPrefabTag(Entity, DefaultValue);
    return;
}
FC_GameTestInitPrefabTag& ModifyGameTestInitPrefabTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameTestInitPrefabTag));
    return local_12.GetComp();
}
FC_GameTestInitPrefabTag& ModifyOrAddGameTestInitPrefabTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameTestInitPrefabTag));
    return local_12.GetComp();
}
const FC_GameTestInitPrefabTag& GetGameTestInitPrefabTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameTestInitPrefabTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameTestInitPrefabTag GetGameTestInitPrefabTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GameTestInitPrefabTag& local_4 = ECSFunc_FC_GameTestInitPrefabTag::GetGameTestInitPrefabTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GameTestInitPrefabTag();
}
const FC_GameTestInitPrefabTag GetDefaultedGameTestInitPrefabTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameTestInitPrefabTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameTestInitPrefabTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GameTestInitPrefabTag GetDefaultedGameTestInitPrefabTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GameTestInitPrefabTag::GetDefaultedGameTestInitPrefabTag(Entity);
}
UFUNCTION()
bool RemoveGameTestInitPrefabTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameTestInitPrefabTag);
}
}
FECSMonitorRuntimeView __GetMonitorGameTestInitPrefabTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameTestInitPrefabTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestInitPrefabTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameTestInitPrefabTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestInitPrefabTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameTestInitPrefabTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestInitPrefabTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameTestInitPrefabTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameTestInitPrefabTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameTestInitPrefabTag, bFixedFrame, bMustHandleAll);
}
void __MonitorGameTestInitPrefabTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameTestInitPrefabTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameTestInitPrefabTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameTestInitPrefabTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameTestInitPrefabTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameTestInitPrefabTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BeginGameTestTag
{
UFUNCTION()
bool HasBeginGameTestTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeginGameTestTag);
}
FC_BeginGameTestTag& AssignBeginGameTestTag(const FECSEntity &inout Entity, const FC_BeginGameTestTag &inout DefaultValue = FC_BeginGameTestTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeginGameTestTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeginGameTestTag_BP(const FECSEntity &inout Entity, const FC_BeginGameTestTag &inout DefaultValue = FC_BeginGameTestTag())
{
    ECSFunc_FC_BeginGameTestTag::AssignBeginGameTestTag(Entity, DefaultValue);
    return;
}
FC_BeginGameTestTag& ModifyBeginGameTestTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeginGameTestTag));
    return local_12.GetComp();
}
FC_BeginGameTestTag& ModifyOrAddBeginGameTestTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeginGameTestTag));
    return local_12.GetComp();
}
const FC_BeginGameTestTag& GetBeginGameTestTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeginGameTestTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeginGameTestTag GetBeginGameTestTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BeginGameTestTag& local_4 = ECSFunc_FC_BeginGameTestTag::GetBeginGameTestTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BeginGameTestTag();
}
const FC_BeginGameTestTag GetDefaultedBeginGameTestTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeginGameTestTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeginGameTestTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_BeginGameTestTag GetDefaultedBeginGameTestTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BeginGameTestTag::GetDefaultedBeginGameTestTag(Entity);
}
UFUNCTION()
bool RemoveBeginGameTestTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeginGameTestTag);
}
}
FECSMonitorRuntimeView __GetMonitorBeginGameTestTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeginGameTestTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginGameTestTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeginGameTestTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginGameTestTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeginGameTestTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginGameTestTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeginGameTestTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginGameTestTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeginGameTestTag, bFixedFrame, bMustHandleAll);
}
void __MonitorBeginGameTestTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeginGameTestTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeginGameTestTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeginGameTestTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeginGameTestTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeginGameTestTag, bFixedFrame, Details);
    return;
}
