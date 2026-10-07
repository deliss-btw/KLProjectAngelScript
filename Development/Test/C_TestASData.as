
namespace __INTENRAL_FC_TestASData_NS
{
    const TECSComponentDerivedPtr<FC_TestASData> DerivedPtr = TECSComponentDerivedPtr<FC_TestASData>();
    const FC_TestASData DefaultValue = FC_TestASData();
}
namespace __INTENRAL_FC_TestASData2_NS
{
    const TECSComponentDerivedPtr<FC_TestASData2> DerivedPtr = TECSComponentDerivedPtr<FC_TestASData2>();
    const FC_TestASData2 DefaultValue = FC_TestASData2();
}
namespace __INTENRAL_FC_TestASData3_NS
{
    const TECSComponentDerivedPtr<FC_TestASData3> DerivedPtr = TECSComponentDerivedPtr<FC_TestASData3>();
    const FC_TestASData3 DefaultValue = FC_TestASData3();
}
namespace __INTENRAL_FC_TestASTimerOnly_NS
{
    const TECSComponentDerivedPtr<FC_TestASTimerOnly> DerivedPtr = TECSComponentDerivedPtr<FC_TestASTimerOnly>();
    const FC_TestASTimerOnly DefaultValue = FC_TestASTimerOnly();
}
namespace __INTENRAL_FCS_TestASSingleton_NS
{
    const TECSComponentDerivedPtr<FCS_TestASSingleton> DerivedPtr = TECSComponentDerivedPtr<FCS_TestASSingleton>();
    const FCS_TestASSingleton DefaultValue = FCS_TestASSingleton();
}
namespace __INTENRAL_FCE_TestASEvent_NS
{
    const TECSEventDerivedPtr<FCE_TestASEvent> DerivedPtr = TECSEventDerivedPtr<FCE_TestASEvent>();

}
struct FC_TestASData : FECSComponent
{
    UPROPERTY()
    int TestData0 = 0;


}

struct FC_TestASData2 : FECSComponent
{
    UPROPERTY()
    int Value = 0;


}

struct FC_TestASData3 : FECSComponent
{
    UPROPERTY()
    int Value = 0;


}

struct FC_TestASTimerOnly : FECSComponent
{
    UPROPERTY()
    float32 TargetTime = 0.0f;


}

struct FCS_TestASSingleton : FECSSingleton
{
    UPROPERTY()
    int Value = 0;


}

struct FCE_TestASEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int TestData0 = 1;
    UPROPERTY()
    FVector TestVectorData;


}

namespace ECSFunc_FC_TestASData
{
UFUNCTION()
bool HasTestASData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TestASData);
}
FC_TestASData& AssignTestASData(const FECSEntity &inout Entity, const FC_TestASData &inout DefaultValue = FC_TestASData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TestASData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTestASData_BP(const FECSEntity &inout Entity, const FC_TestASData &inout DefaultValue = FC_TestASData())
{
    ECSFunc_FC_TestASData::AssignTestASData(Entity, DefaultValue);
    return;
}
FC_TestASData& ModifyTestASData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TestASData));
    return local_12.GetComp();
}
FC_TestASData& ModifyOrAddTestASData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TestASData));
    return local_12.GetComp();
}
const FC_TestASData& GetTestASData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TestASData));
    return local_12.GetComp();
}
UFUNCTION()
FC_TestASData GetTestASData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TestASData& local_4 = ECSFunc_FC_TestASData::GetTestASData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TestASData();
}
const FC_TestASData GetDefaultedTestASData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TestASData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TestASData);
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
FC_TestASData GetDefaultedTestASData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TestASData::GetDefaultedTestASData(Entity);
}
UFUNCTION()
bool RemoveTestASData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TestASData);
}
}
FECSMonitorRuntimeView __GetMonitorTestASDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TestASData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TestASData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TestASData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TestASData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TestASData, bFixedFrame, bMustHandleAll);
}
void __MonitorTestASDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TestASData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TestASData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TestASData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TestASData2
{
UFUNCTION()
bool HasTestASData2(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TestASData2);
}
FC_TestASData2& AssignTestASData2(const FECSEntity &inout Entity, const FC_TestASData2 &inout DefaultValue = FC_TestASData2())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TestASData2, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTestASData2_BP(const FECSEntity &inout Entity, const FC_TestASData2 &inout DefaultValue = FC_TestASData2())
{
    ECSFunc_FC_TestASData2::AssignTestASData2(Entity, DefaultValue);
    return;
}
FC_TestASData2& ModifyTestASData2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TestASData2));
    return local_12.GetComp();
}
FC_TestASData2& ModifyOrAddTestASData2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TestASData2));
    return local_12.GetComp();
}
const FC_TestASData2& GetTestASData2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TestASData2));
    return local_12.GetComp();
}
UFUNCTION()
FC_TestASData2 GetTestASData2_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TestASData2& local_4 = ECSFunc_FC_TestASData2::GetTestASData2(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TestASData2();
}
const FC_TestASData2 GetDefaultedTestASData2(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TestASData2 __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TestASData2);
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
FC_TestASData2 GetDefaultedTestASData2_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TestASData2::GetDefaultedTestASData2(Entity);
}
UFUNCTION()
bool RemoveTestASData2(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TestASData2);
}
}
FECSMonitorRuntimeView __GetMonitorTestASData2OnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TestASData2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASData2OnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TestASData2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASData2OnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TestASData2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASData2OnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TestASData2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASData2OnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TestASData2, bFixedFrame, bMustHandleAll);
}
void __MonitorTestASData2Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TestASData2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASData2Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TestASData2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASData2Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TestASData2, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TestASData3
{
UFUNCTION()
bool HasTestASData3(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TestASData3);
}
FC_TestASData3& AssignTestASData3(const FECSEntity &inout Entity, const FC_TestASData3 &inout DefaultValue = FC_TestASData3())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TestASData3, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTestASData3_BP(const FECSEntity &inout Entity, const FC_TestASData3 &inout DefaultValue = FC_TestASData3())
{
    ECSFunc_FC_TestASData3::AssignTestASData3(Entity, DefaultValue);
    return;
}
FC_TestASData3& ModifyTestASData3(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TestASData3));
    return local_12.GetComp();
}
FC_TestASData3& ModifyOrAddTestASData3(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TestASData3));
    return local_12.GetComp();
}
const FC_TestASData3& GetTestASData3(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TestASData3));
    return local_12.GetComp();
}
UFUNCTION()
FC_TestASData3 GetTestASData3_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TestASData3& local_4 = ECSFunc_FC_TestASData3::GetTestASData3(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TestASData3();
}
const FC_TestASData3 GetDefaultedTestASData3(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TestASData3 __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TestASData3);
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
FC_TestASData3 GetDefaultedTestASData3_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TestASData3::GetDefaultedTestASData3(Entity);
}
UFUNCTION()
bool RemoveTestASData3(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TestASData3);
}
}
FECSMonitorRuntimeView __GetMonitorTestASData3OnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TestASData3, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASData3OnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TestASData3, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASData3OnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TestASData3, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASData3OnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TestASData3, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASData3OnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TestASData3, bFixedFrame, bMustHandleAll);
}
void __MonitorTestASData3Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TestASData3, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASData3Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TestASData3, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASData3Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TestASData3, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TestASTimerOnly
{
UFUNCTION()
bool HasTestASTimerOnly(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TestASTimerOnly);
}
FC_TestASTimerOnly& AssignTestASTimerOnly(const FECSEntity &inout Entity, const FC_TestASTimerOnly &inout DefaultValue = FC_TestASTimerOnly())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TestASTimerOnly, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTestASTimerOnly_BP(const FECSEntity &inout Entity, const FC_TestASTimerOnly &inout DefaultValue = FC_TestASTimerOnly())
{
    ECSFunc_FC_TestASTimerOnly::AssignTestASTimerOnly(Entity, DefaultValue);
    return;
}
FC_TestASTimerOnly& ModifyTestASTimerOnly(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TestASTimerOnly));
    return local_12.GetComp();
}
FC_TestASTimerOnly& ModifyOrAddTestASTimerOnly(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TestASTimerOnly));
    return local_12.GetComp();
}
const FC_TestASTimerOnly& GetTestASTimerOnly(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TestASTimerOnly));
    return local_12.GetComp();
}
UFUNCTION()
FC_TestASTimerOnly GetTestASTimerOnly_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TestASTimerOnly& local_4 = ECSFunc_FC_TestASTimerOnly::GetTestASTimerOnly(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TestASTimerOnly();
}
const FC_TestASTimerOnly GetDefaultedTestASTimerOnly(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TestASTimerOnly __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TestASTimerOnly);
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
FC_TestASTimerOnly GetDefaultedTestASTimerOnly_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TestASTimerOnly::GetDefaultedTestASTimerOnly(Entity);
}
UFUNCTION()
bool RemoveTestASTimerOnly(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TestASTimerOnly);
}
}
FECSMonitorRuntimeView __GetMonitorTestASTimerOnlyOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TestASTimerOnly, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASTimerOnlyOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TestASTimerOnly, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASTimerOnlyOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TestASTimerOnly, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASTimerOnlyOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TestASTimerOnly, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestASTimerOnlyOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TestASTimerOnly, bFixedFrame, bMustHandleAll);
}
void __MonitorTestASTimerOnlyLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TestASTimerOnly, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASTimerOnlyActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TestASTimerOnly, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASTimerOnlyModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TestASTimerOnly, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TestASSingleton
{
UFUNCTION()
bool HasTestASSingleton(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TestASSingleton);
}
FCS_TestASSingleton& AssignTestASSingleton(const FECSWorldPtr &inout World, const FCS_TestASSingleton &inout DefaultValue = FCS_TestASSingleton())
{
    UScriptStruct local_6 = FCS_TestASSingleton;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTestASSingleton_BP(const FECSWorldPtr &inout World, const FCS_TestASSingleton &inout DefaultValue = FCS_TestASSingleton())
{
    ECSFunc_FCS_TestASSingleton::AssignTestASSingleton(World, DefaultValue);
    return;
}
FCS_TestASSingleton& ModifyTestASSingleton(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestASSingleton;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TestASSingleton& ModifyOrAddTestASSingleton(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestASSingleton;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TestASSingleton& GetTestASSingleton(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestASSingleton;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TestASSingleton GetTestASSingleton_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_TestASSingleton& local_4 = ECSFunc_FCS_TestASSingleton::GetTestASSingleton(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_TestASSingleton();
}
const FCS_TestASSingleton GetDefaultedTestASSingleton(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TestASSingleton __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TestASSingleton);
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
FCS_TestASSingleton GetDefaultedTestASSingleton_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_TestASSingleton::GetDefaultedTestASSingleton(World);
}
UFUNCTION()
bool RemoveTestASSingleton(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TestASSingleton);
}
}
void __MonitorTestASSingletonLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TestASSingleton, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASSingletonActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TestASSingleton, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestASSingletonModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TestASSingleton, bFixedFrame, Details);
    return;
}
