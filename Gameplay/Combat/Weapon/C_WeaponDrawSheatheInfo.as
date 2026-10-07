
namespace __INTENRAL_FC_WeaponDrawSheatheInfo_NS
{
    const TECSComponentDerivedPtr<FC_WeaponDrawSheatheInfo> DerivedPtr = TECSComponentDerivedPtr<FC_WeaponDrawSheatheInfo>();
    const FC_WeaponDrawSheatheInfo DefaultValue = FC_WeaponDrawSheatheInfo();

}
struct FWeaponDrawSheatheConfig
{
    UPROPERTY()
    bool bDrawWeaponOnAim;
    UPROPERTY()
    bool bDrawWeaponOnStrafe;
    UPROPERTY()
    FGameplayTagContainer ListenGameplayTags;
    UPROPERTY()
    float32 TagsExitProtectTime;
    UPROPERTY()
    float32 AimExitProtectTime;
    UPROPERTY()
    float32 StrafeExitProtectTime;


}

struct FC_WeaponDrawSheatheInfo : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bOldIsAiming;
    UPROPERTY()
    int m_OldKeepStrafeCounter;
    UPROPERTY()
    bool m_bOldMatchAnyGameplayTags;
    UPROPERTY()
    bool m_bWeaponShouldDrawn;
    UPROPERTY()
    bool m_bWeaponShouldSheathe;
    UPROPERTY()
    FFPTime m_AimingExpireTime;
    UPROPERTY()
    FFPTime m_StrafeExpireTime;
    UPROPERTY()
    FFPTime m_TagsExpireTime;

    FC_WeaponDrawSheatheInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_WeaponDrawSheatheInfo(const FC_WeaponDrawSheatheInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_WeaponDrawSheatheInfo opAssign(const FC_WeaponDrawSheatheInfo &inout Other)
    {
        FC_WeaponDrawSheatheInfo __r;
        this.SetbOldIsAiming(Other.GetbOldIsAiming());
        this.SetOldKeepStrafeCounter(Other.GetOldKeepStrafeCounter());
        this.SetbOldMatchAnyGameplayTags(Other.GetbOldMatchAnyGameplayTags());
        this.SetbWeaponShouldDrawn(Other.GetbWeaponShouldDrawn());
        this.SetbWeaponShouldSheathe(Other.GetbWeaponShouldSheathe());
        this.SetAimingExpireTime(Other.GetAimingExpireTime());
        this.SetStrafeExpireTime(Other.GetStrafeExpireTime());
        this.SetTagsExpireTime(Other.GetTagsExpireTime());
        return __r;
    }
    bool WeaponShouldDraw() const
    {
        return this.GetbWeaponShouldDrawn();
    }
    bool WeaponShouldSheathe() const
    {
        return this.GetbWeaponShouldSheathe();
    }
    bool GetbOldIsAiming() const property
    {
        return this.m_bOldIsAiming;
    }
    void SetbOldIsAiming(const bool __Value) property
    {
        if (!(this.m_bOldIsAiming) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bOldIsAiming = __Value;
        return;
    }
    int GetOldKeepStrafeCounter() const property
    {
        return this.m_OldKeepStrafeCounter;
    }
    void SetOldKeepStrafeCounter(const int __Value) property
    {
        if (this.m_OldKeepStrafeCounter == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_OldKeepStrafeCounter = __Value;
        return;
    }
    bool GetbOldMatchAnyGameplayTags() const property
    {
        return this.m_bOldMatchAnyGameplayTags;
    }
    void SetbOldMatchAnyGameplayTags(const bool __Value) property
    {
        if (!(this.m_bOldMatchAnyGameplayTags) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bOldMatchAnyGameplayTags = __Value;
        return;
    }
    bool GetbWeaponShouldDrawn() const property
    {
        return this.m_bWeaponShouldDrawn;
    }
    void SetbWeaponShouldDrawn(const bool __Value) property
    {
        if (!(this.m_bWeaponShouldDrawn) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bWeaponShouldDrawn = __Value;
        return;
    }
    bool GetbWeaponShouldSheathe() const property
    {
        return this.m_bWeaponShouldSheathe;
    }
    void SetbWeaponShouldSheathe(const bool __Value) property
    {
        if (!(this.m_bWeaponShouldSheathe) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bWeaponShouldSheathe = __Value;
        return;
    }
    const FFPTime GetAimingExpireTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_AimingExpireTime() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetAimingExpireTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_AimingExpireTime = __Value;
        return;
    }
    const FFPTime GetStrafeExpireTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StrafeExpireTime() property
    {
        FFPTime __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetStrafeExpireTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_StrafeExpireTime = __Value;
        return;
    }
    const FFPTime GetTagsExpireTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TagsExpireTime() property
    {
        FFPTime __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetTagsExpireTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_TagsExpireTime = __Value;
        return;
    }
}

namespace ECSFunc_FC_WeaponDrawSheatheInfo
{
UFUNCTION()
bool HasWeaponDrawSheatheInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WeaponDrawSheatheInfo);
}
FC_WeaponDrawSheatheInfo& AssignWeaponDrawSheatheInfo(const FECSEntity &inout Entity, const FC_WeaponDrawSheatheInfo &inout DefaultValue = FC_WeaponDrawSheatheInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WeaponDrawSheatheInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWeaponDrawSheatheInfo_BP(const FECSEntity &inout Entity, const FC_WeaponDrawSheatheInfo &inout DefaultValue = FC_WeaponDrawSheatheInfo())
{
    ECSFunc_FC_WeaponDrawSheatheInfo::AssignWeaponDrawSheatheInfo(Entity, DefaultValue);
    return;
}
FC_WeaponDrawSheatheInfo& ModifyWeaponDrawSheatheInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WeaponDrawSheatheInfo));
    return local_12.GetComp();
}
FC_WeaponDrawSheatheInfo& ModifyOrAddWeaponDrawSheatheInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WeaponDrawSheatheInfo));
    return local_12.GetComp();
}
const FC_WeaponDrawSheatheInfo& GetWeaponDrawSheatheInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WeaponDrawSheatheInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_WeaponDrawSheatheInfo GetWeaponDrawSheatheInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_WeaponDrawSheatheInfo& local_4 = ECSFunc_FC_WeaponDrawSheatheInfo::GetWeaponDrawSheatheInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_WeaponDrawSheatheInfo();
}
const FC_WeaponDrawSheatheInfo GetDefaultedWeaponDrawSheatheInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WeaponDrawSheatheInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WeaponDrawSheatheInfo);
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
FC_WeaponDrawSheatheInfo GetDefaultedWeaponDrawSheatheInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_WeaponDrawSheatheInfo::GetDefaultedWeaponDrawSheatheInfo(Entity);
}
UFUNCTION()
bool RemoveWeaponDrawSheatheInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WeaponDrawSheatheInfo);
}
}
FECSMonitorRuntimeView __GetMonitorWeaponDrawSheatheInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WeaponDrawSheatheInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponDrawSheatheInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WeaponDrawSheatheInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponDrawSheatheInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WeaponDrawSheatheInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponDrawSheatheInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WeaponDrawSheatheInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponDrawSheatheInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WeaponDrawSheatheInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorWeaponDrawSheatheInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WeaponDrawSheatheInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponDrawSheatheInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WeaponDrawSheatheInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponDrawSheatheInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WeaponDrawSheatheInfo, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_WeaponDrawSheatheInfo_WeaponShouldDraw(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().WeaponShouldDraw();
    return;
}
void GetEntityBBVar_WeaponDrawSheatheInfo_WeaponShouldSheathe(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().WeaponShouldSheathe();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_WeaponDrawSheatheInfo &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_WeaponDrawSheatheInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_WeaponDrawSheatheInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_WeaponDrawSheatheInfo
{
int __IndexOf_bOldIsAiming()
{
    return 0;
}
int __IndexOf_OldKeepStrafeCounter()
{
    return 1;
}
int __IndexOf_bOldMatchAnyGameplayTags()
{
    return 2;
}
int __IndexOf_bWeaponShouldDrawn()
{
    return 3;
}
int __IndexOf_bWeaponShouldSheathe()
{
    return 4;
}
int __IndexOf_AimingExpireTime()
{
    return 5;
}
int __IndexOf_StrafeExpireTime()
{
    return 6;
}
int __IndexOf_TagsExpireTime()
{
    return 7;
}
}
