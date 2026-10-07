
namespace __INTENRAL_FC_EnvBreakDamageReceiver_NS
{
    const TECSComponentDerivedPtr<FC_EnvBreakDamageReceiver> DerivedPtr = TECSComponentDerivedPtr<FC_EnvBreakDamageReceiver>();
    const FC_EnvBreakDamageReceiver DefaultValue = FC_EnvBreakDamageReceiver();

}
struct FEvnBreakDamageData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_Time;
    UPROPERTY()
    bool m_bHasResolved;
    UPROPERTY()
    float32 m_EnvBreakDamage;
    UPROPERTY()
    FECSEntity m_FinalDamageSource;

    FEvnBreakDamageData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEvnBreakDamageData(const FEvnBreakDamageData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEvnBreakDamageData opAssign(const FEvnBreakDamageData &inout Other)
    {
        FEvnBreakDamageData __r;
        this.SetTime(Other.GetTime());
        this.SetbHasResolved(Other.GetbHasResolved());
        this.SetEnvBreakDamage(Other.GetEnvBreakDamage());
        this.SetFinalDamageSource(Other.GetFinalDamageSource());
        return __r;
    }
    FFPTime GetTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_Time() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Time = __Value;
        return;
    }
    bool GetbHasResolved() const property
    {
        return this.m_bHasResolved;
    }
    void SetbHasResolved(const bool __Value) property
    {
        if (!(this.m_bHasResolved) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bHasResolved = __Value;
        return;
    }
    float32 GetEnvBreakDamage() const property
    {
        return this.m_EnvBreakDamage;
    }
    void SetEnvBreakDamage(const float32 __Value) property
    {
        if (this.m_EnvBreakDamage == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_EnvBreakDamage = __Value;
        return;
    }
    const FECSEntity GetFinalDamageSource() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_FinalDamageSource() property
    {
        FECSEntity __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetFinalDamageSource(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FinalDamageSource = __Value;
        return;
    }
}

struct FC_EnvBreakDamageReceiver : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FEvnBreakDamageData> m_EnvBreakDamageDatas;

    FC_EnvBreakDamageReceiver()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_EnvBreakDamageReceiver(const FC_EnvBreakDamageReceiver &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_EnvBreakDamageDatas = Other.m_EnvBreakDamageDatas;
        return;
    }
    FC_EnvBreakDamageReceiver opAssign(const FC_EnvBreakDamageReceiver &inout Other)
    {
        FC_EnvBreakDamageReceiver __r;
        this.SetEnvBreakDamageDatas(Other.GetEnvBreakDamageDatas());
        return __r;
    }
    FEvnBreakDamageData& AddNewDamage(const FFPTime &inout DamageTime)
    {
        FEvnBreakDamageData local_10;
        local_10.SetTime(DamageTime);
        int local_14 = this.GetEnvBreakDamageDatas().Num() - 1;
        for (; local_14 >= 0; --local_14)
        {
            const FEvnBreakDamageData& local_18 = this.GetEnvBreakDamageDatas()[local_14];
            if (local_18.GetbHasResolved() || (FFPTime(local_18.GetTime()).opCmp(DamageTime) <= 0))
            {
                this.GetModify_EnvBreakDamageDatas().Insert(local_10, local_14 + 1);
                return this.GetModify_EnvBreakDamageDatas()[(local_14 + 1)];
            }
        }
        this.GetModify_EnvBreakDamageDatas().Insert(local_10, 0);
        return this.GetModify_EnvBreakDamageDatas()[0];
    }
    const TArray<FEvnBreakDamageData> GetEnvBreakDamageDatas() const property
    {
        const TArray<FEvnBreakDamageData> __r;
        return __r;
    }
    TArray<FEvnBreakDamageData> GetModify_EnvBreakDamageDatas() property
    {
        TArray<FEvnBreakDamageData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEnvBreakDamageDatas(const TArray<FEvnBreakDamageData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_EnvBreakDamageDatas = __Value;
        return;
    }
}

namespace ECSFunc_FC_EnvBreakDamageReceiver
{
UFUNCTION()
bool HasEnvBreakDamageReceiver(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EnvBreakDamageReceiver);
}
FC_EnvBreakDamageReceiver& AssignEnvBreakDamageReceiver(const FECSEntity &inout Entity, const FC_EnvBreakDamageReceiver &inout DefaultValue = FC_EnvBreakDamageReceiver())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EnvBreakDamageReceiver, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEnvBreakDamageReceiver_BP(const FECSEntity &inout Entity, const FC_EnvBreakDamageReceiver &inout DefaultValue = FC_EnvBreakDamageReceiver())
{
    ECSFunc_FC_EnvBreakDamageReceiver::AssignEnvBreakDamageReceiver(Entity, DefaultValue);
    return;
}
FC_EnvBreakDamageReceiver& ModifyEnvBreakDamageReceiver(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EnvBreakDamageReceiver));
    return local_12.GetComp();
}
FC_EnvBreakDamageReceiver& ModifyOrAddEnvBreakDamageReceiver(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EnvBreakDamageReceiver));
    return local_12.GetComp();
}
const FC_EnvBreakDamageReceiver& GetEnvBreakDamageReceiver(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EnvBreakDamageReceiver));
    return local_12.GetComp();
}
UFUNCTION()
FC_EnvBreakDamageReceiver GetEnvBreakDamageReceiver_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EnvBreakDamageReceiver& local_4 = ECSFunc_FC_EnvBreakDamageReceiver::GetEnvBreakDamageReceiver(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EnvBreakDamageReceiver();
}
const FC_EnvBreakDamageReceiver GetDefaultedEnvBreakDamageReceiver(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EnvBreakDamageReceiver __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EnvBreakDamageReceiver);
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
FC_EnvBreakDamageReceiver GetDefaultedEnvBreakDamageReceiver_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EnvBreakDamageReceiver::GetDefaultedEnvBreakDamageReceiver(Entity);
}
UFUNCTION()
bool RemoveEnvBreakDamageReceiver(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EnvBreakDamageReceiver);
}
}
FECSMonitorRuntimeView __GetMonitorEnvBreakDamageReceiverOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EnvBreakDamageReceiver, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnvBreakDamageReceiverOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EnvBreakDamageReceiver, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnvBreakDamageReceiverOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EnvBreakDamageReceiver, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnvBreakDamageReceiverOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EnvBreakDamageReceiver, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnvBreakDamageReceiverOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EnvBreakDamageReceiver, bFixedFrame, bMustHandleAll);
}
void __MonitorEnvBreakDamageReceiverLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EnvBreakDamageReceiver, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEnvBreakDamageReceiverActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EnvBreakDamageReceiver, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEnvBreakDamageReceiverModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EnvBreakDamageReceiver, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FEvnBreakDamageData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FEvnBreakDamageData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FEvnBreakDamageData
{
int __IndexOf_Time()
{
    return 0;
}
int __IndexOf_bHasResolved()
{
    return 1;
}
int __IndexOf_EnvBreakDamage()
{
    return 2;
}
int __IndexOf_FinalDamageSource()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EnvBreakDamageReceiver &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EnvBreakDamageReceiver &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EnvBreakDamageReceiver &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EnvBreakDamageReceiver
{
int __IndexOf_EnvBreakDamageDatas()
{
    return 0;
}
}
