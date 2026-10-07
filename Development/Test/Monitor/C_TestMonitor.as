
namespace __INTENRAL_FCS_TestMonitor0_NS
{
    const TECSComponentDerivedPtr<FCS_TestMonitor0> DerivedPtr = TECSComponentDerivedPtr<FCS_TestMonitor0>();
    const FCS_TestMonitor0 DefaultValue = FCS_TestMonitor0();
}
namespace __INTENRAL_FCS_TestMonitor1Tag_NS
{
    const TECSComponentDerivedPtr<FCS_TestMonitor1Tag> DerivedPtr = TECSComponentDerivedPtr<FCS_TestMonitor1Tag>();
    const FCS_TestMonitor1Tag DefaultValue = FCS_TestMonitor1Tag();
}
namespace __INTENRAL_FCS_TestMonitor2NotSync_NS
{
    const TECSComponentDerivedPtr<FCS_TestMonitor2NotSync> DerivedPtr = TECSComponentDerivedPtr<FCS_TestMonitor2NotSync>();
    const FCS_TestMonitor2NotSync DefaultValue = FCS_TestMonitor2NotSync();
}
namespace __INTENRAL_FC_TestMonitorData0_NS
{
    const TECSComponentDerivedPtr<FC_TestMonitorData0> DerivedPtr = TECSComponentDerivedPtr<FC_TestMonitorData0>();
    const FC_TestMonitorData0 DefaultValue = FC_TestMonitorData0();

}
struct FCS_TestMonitor0 : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Value;

    FCS_TestMonitor0()
    {
        this.m_Value = 0;
        this.__InitDirtyFlags();
        return;
    }
    FCS_TestMonitor0(const FCS_TestMonitor0 &inout Other)
    {
        this.m_Value = 0;
        this.__InitDirtyFlags();
        this.m_Value = int(Other.m_Value);
        return;
    }
    FCS_TestMonitor0 opAssign(const FCS_TestMonitor0 &inout Other)
    {
        int local_1 = 0;
        FCS_TestMonitor0 __r;
        this.SetValue(local_1);
        return __r;
    }
    int GetValue() const property
    {
        return this.m_Value;
    }
    void SetValue(const int __Value) property
    {
        if (this.m_Value == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Value = __Value;
        return;
    }
}

struct FCS_TestMonitor1Tag : FECSSingleton
{
    FCS_TestMonitor1Tag()
    {
        return;
    }
}

struct FCS_TestMonitor2NotSync : FECSSingleton
{
    UPROPERTY()
    int Value;


}

struct FC_TestMonitorData0 : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Value;

    FC_TestMonitorData0()
    {
        this.m_Value = 0;
        this.__InitDirtyFlags();
        return;
    }
    FC_TestMonitorData0(const FC_TestMonitorData0 &inout Other)
    {
        this.m_Value = 0;
        this.__InitDirtyFlags();
        this.m_Value = int(Other.m_Value);
        return;
    }
    FC_TestMonitorData0 opAssign(const FC_TestMonitorData0 &inout Other)
    {
        int local_1 = 0;
        FC_TestMonitorData0 __r;
        this.SetValue(local_1);
        return __r;
    }
    int GetValue() const property
    {
        return this.m_Value;
    }
    void SetValue(const int __Value) property
    {
        if (this.m_Value == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Value = __Value;
        return;
    }
}

namespace ECSFunc_FCS_TestMonitor0
{
UFUNCTION()
bool HasTestMonitor0(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TestMonitor0);
}
FCS_TestMonitor0& AssignTestMonitor0(const FECSWorldPtr &inout World, const FCS_TestMonitor0 &inout DefaultValue = FCS_TestMonitor0())
{
    UScriptStruct local_6 = FCS_TestMonitor0;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTestMonitor0_BP(const FECSWorldPtr &inout World, const FCS_TestMonitor0 &inout DefaultValue = FCS_TestMonitor0())
{
    ECSFunc_FCS_TestMonitor0::AssignTestMonitor0(World, DefaultValue);
    return;
}
FCS_TestMonitor0& ModifyTestMonitor0(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor0;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TestMonitor0& ModifyOrAddTestMonitor0(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor0;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TestMonitor0& GetTestMonitor0(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor0;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TestMonitor0 GetTestMonitor0_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_TestMonitor0& local_4 = ECSFunc_FCS_TestMonitor0::GetTestMonitor0(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_TestMonitor0();
}
const FCS_TestMonitor0 GetDefaultedTestMonitor0(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TestMonitor0 __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TestMonitor0);
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
FCS_TestMonitor0 GetDefaultedTestMonitor0_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_TestMonitor0::GetDefaultedTestMonitor0(World);
}
UFUNCTION()
bool RemoveTestMonitor0(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TestMonitor0);
}
}
void __MonitorTestMonitor0Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TestMonitor0, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitor0Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TestMonitor0, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitor0Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TestMonitor0, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TestMonitor1Tag
{
UFUNCTION()
bool HasTestMonitor1Tag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TestMonitor1Tag);
}
FCS_TestMonitor1Tag& AssignTestMonitor1Tag(const FECSWorldPtr &inout World, const FCS_TestMonitor1Tag &inout DefaultValue = FCS_TestMonitor1Tag())
{
    UScriptStruct local_6 = FCS_TestMonitor1Tag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTestMonitor1Tag_BP(const FECSWorldPtr &inout World, const FCS_TestMonitor1Tag &inout DefaultValue = FCS_TestMonitor1Tag())
{
    ECSFunc_FCS_TestMonitor1Tag::AssignTestMonitor1Tag(World, DefaultValue);
    return;
}
FCS_TestMonitor1Tag& ModifyTestMonitor1Tag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor1Tag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TestMonitor1Tag& ModifyOrAddTestMonitor1Tag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor1Tag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TestMonitor1Tag& GetTestMonitor1Tag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor1Tag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TestMonitor1Tag GetTestMonitor1Tag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_TestMonitor1Tag& local_4 = ECSFunc_FCS_TestMonitor1Tag::GetTestMonitor1Tag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_TestMonitor1Tag();
}
const FCS_TestMonitor1Tag GetDefaultedTestMonitor1Tag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TestMonitor1Tag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TestMonitor1Tag);
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
FCS_TestMonitor1Tag GetDefaultedTestMonitor1Tag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_TestMonitor1Tag::GetDefaultedTestMonitor1Tag(World);
}
UFUNCTION()
bool RemoveTestMonitor1Tag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TestMonitor1Tag);
}
}
void __MonitorTestMonitor1TagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TestMonitor1Tag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitor1TagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TestMonitor1Tag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitor1TagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TestMonitor1Tag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TestMonitor2NotSync
{
UFUNCTION()
bool HasTestMonitor2NotSync(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TestMonitor2NotSync);
}
FCS_TestMonitor2NotSync& AssignTestMonitor2NotSync(const FECSWorldPtr &inout World, const FCS_TestMonitor2NotSync &inout DefaultValue = FCS_TestMonitor2NotSync())
{
    UScriptStruct local_6 = FCS_TestMonitor2NotSync;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTestMonitor2NotSync_BP(const FECSWorldPtr &inout World, const FCS_TestMonitor2NotSync &inout DefaultValue = FCS_TestMonitor2NotSync())
{
    ECSFunc_FCS_TestMonitor2NotSync::AssignTestMonitor2NotSync(World, DefaultValue);
    return;
}
FCS_TestMonitor2NotSync& ModifyTestMonitor2NotSync(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor2NotSync;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TestMonitor2NotSync& ModifyOrAddTestMonitor2NotSync(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor2NotSync;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TestMonitor2NotSync& GetTestMonitor2NotSync(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor2NotSync;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TestMonitor2NotSync GetTestMonitor2NotSync_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_TestMonitor2NotSync& local_4 = ECSFunc_FCS_TestMonitor2NotSync::GetTestMonitor2NotSync(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_TestMonitor2NotSync();
}
const FCS_TestMonitor2NotSync GetDefaultedTestMonitor2NotSync(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TestMonitor2NotSync __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TestMonitor2NotSync);
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
FCS_TestMonitor2NotSync GetDefaultedTestMonitor2NotSync_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_TestMonitor2NotSync::GetDefaultedTestMonitor2NotSync(World);
}
UFUNCTION()
bool RemoveTestMonitor2NotSync(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TestMonitor2NotSync);
}
}
void __MonitorTestMonitor2NotSyncLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TestMonitor2NotSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitor2NotSyncActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TestMonitor2NotSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitor2NotSyncModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TestMonitor2NotSync, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TestMonitorData0
{
UFUNCTION()
bool HasTestMonitorData0(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TestMonitorData0);
}
FC_TestMonitorData0& AssignTestMonitorData0(const FECSEntity &inout Entity, const FC_TestMonitorData0 &inout DefaultValue = FC_TestMonitorData0())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TestMonitorData0, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTestMonitorData0_BP(const FECSEntity &inout Entity, const FC_TestMonitorData0 &inout DefaultValue = FC_TestMonitorData0())
{
    ECSFunc_FC_TestMonitorData0::AssignTestMonitorData0(Entity, DefaultValue);
    return;
}
FC_TestMonitorData0& ModifyTestMonitorData0(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TestMonitorData0));
    return local_12.GetComp();
}
FC_TestMonitorData0& ModifyOrAddTestMonitorData0(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TestMonitorData0));
    return local_12.GetComp();
}
const FC_TestMonitorData0& GetTestMonitorData0(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TestMonitorData0));
    return local_12.GetComp();
}
UFUNCTION()
FC_TestMonitorData0 GetTestMonitorData0_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TestMonitorData0& local_4 = ECSFunc_FC_TestMonitorData0::GetTestMonitorData0(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TestMonitorData0();
}
const FC_TestMonitorData0 GetDefaultedTestMonitorData0(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TestMonitorData0 __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TestMonitorData0);
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
FC_TestMonitorData0 GetDefaultedTestMonitorData0_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TestMonitorData0::GetDefaultedTestMonitorData0(Entity);
}
UFUNCTION()
bool RemoveTestMonitorData0(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TestMonitorData0);
}
}
FECSMonitorRuntimeView __GetMonitorTestMonitorData0OnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TestMonitorData0, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestMonitorData0OnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TestMonitorData0, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestMonitorData0OnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TestMonitorData0, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestMonitorData0OnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TestMonitorData0, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTestMonitorData0OnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TestMonitorData0, bFixedFrame, bMustHandleAll);
}
void __MonitorTestMonitorData0Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TestMonitorData0, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitorData0Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TestMonitorData0, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitorData0Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TestMonitorData0, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_TestMonitor0 &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_TestMonitor0 &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_TestMonitor0 &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_TestMonitor0
{
int __IndexOf_Value()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TestMonitorData0 &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TestMonitorData0 &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TestMonitorData0 &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TestMonitorData0
{
int __IndexOf_Value()
{
    return 0;
}
}
