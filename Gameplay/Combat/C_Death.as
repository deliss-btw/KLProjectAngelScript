
enum EDeathReason
{
    Combat,
    KillZone,
}

namespace __INTENRAL_FC_DeathInfo_NS
{
    const TECSComponentDerivedPtr<FC_DeathInfo> DerivedPtr = TECSComponentDerivedPtr<FC_DeathInfo>();
    const FC_DeathInfo DefaultValue = FC_DeathInfo();
}
namespace __INTENRAL_FC_DeferDeathTransition_NS
{
    const TECSComponentDerivedPtr<FC_DeferDeathTransition> DerivedPtr = TECSComponentDerivedPtr<FC_DeferDeathTransition>();
    const FC_DeferDeathTransition DefaultValue = FC_DeferDeathTransition();
}
namespace __INTENRAL_FC_DeathConfig_NS
{
    const TECSComponentDerivedPtr<FC_DeathConfig> DerivedPtr = TECSComponentDerivedPtr<FC_DeathConfig>();
    const FC_DeathConfig DefaultValue = FC_DeathConfig();
}
namespace __INTENRAL_FC_DeathKiller_NS
{
    const TECSComponentDerivedPtr<FC_DeathKiller> DerivedPtr = TECSComponentDerivedPtr<FC_DeathKiller>();
    const FC_DeathKiller DefaultValue = FC_DeathKiller();

}
struct FC_DeathInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bESMTransitToDeathState;
    UPROPERTY()
    bool m_bAutoEnterDestroy;
    UPROPERTY()
    bool m_bDestroyImmediately;
    UPROPERTY()
    bool m_bHasExtraDeathState;
    UPROPERTY()
    FName m_ExtraDeathStateName;
    UPROPERTY()
    FName m_FinalDeathStateName;
    UPROPERTY()
    EDeathReason m_Reason;

    FC_DeathInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DeathInfo(const FC_DeathInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DeathInfo opAssign(const FC_DeathInfo &inout Other)
    {
        FC_DeathInfo __r;
        this.SetbESMTransitToDeathState(Other.GetbESMTransitToDeathState());
        this.SetbAutoEnterDestroy(Other.GetbAutoEnterDestroy());
        this.SetbDestroyImmediately(Other.GetbDestroyImmediately());
        this.SetbHasExtraDeathState(Other.GetbHasExtraDeathState());
        this.SetExtraDeathStateName(Other.GetExtraDeathStateName());
        this.SetFinalDeathStateName(Other.GetFinalDeathStateName());
        this.SetReason(Other.GetReason());
        return __r;
    }
    bool GetbESMTransitToDeathState() const property
    {
        return this.m_bESMTransitToDeathState;
    }
    void SetbESMTransitToDeathState(const bool __Value) property
    {
        if (!(this.m_bESMTransitToDeathState) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bESMTransitToDeathState = __Value;
        return;
    }
    bool GetbAutoEnterDestroy() const property
    {
        return this.m_bAutoEnterDestroy;
    }
    void SetbAutoEnterDestroy(const bool __Value) property
    {
        if (!(this.m_bAutoEnterDestroy) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bAutoEnterDestroy = __Value;
        return;
    }
    bool GetbDestroyImmediately() const property
    {
        return this.m_bDestroyImmediately;
    }
    void SetbDestroyImmediately(const bool __Value) property
    {
        if (!(this.m_bDestroyImmediately) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bDestroyImmediately = __Value;
        return;
    }
    bool GetbHasExtraDeathState() const property
    {
        return this.m_bHasExtraDeathState;
    }
    void SetbHasExtraDeathState(const bool __Value) property
    {
        if (!(this.m_bHasExtraDeathState) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bHasExtraDeathState = __Value;
        return;
    }
    FName GetExtraDeathStateName() const property
    {
        return this.m_ExtraDeathStateName;
    }
    void SetExtraDeathStateName(const FName &inout __Value) property
    {
        if ((this.m_ExtraDeathStateName == __Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ExtraDeathStateName = __Value;
        return;
    }
    FName GetFinalDeathStateName() const property
    {
        return this.m_FinalDeathStateName;
    }
    void SetFinalDeathStateName(const FName &inout __Value) property
    {
        if ((this.m_FinalDeathStateName == __Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_FinalDeathStateName = __Value;
        return;
    }
    EDeathReason GetReason() const property
    {
        return this.m_Reason;
    }
    void SetReason(const EDeathReason __Value) property
    {
        if (int(this.m_Reason) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_Reason = __Value;
        return;
    }
}

struct FC_DeferDeathTransition : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bWaitLand;
    UPROPERTY()
    bool m_bDeferByAction;
    UPROPERTY()
    bool m_bDeferDeathPresentation;
    UPROPERTY()
    FFPTime m_DeferStartTime;

    FC_DeferDeathTransition()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DeferDeathTransition(const FC_DeferDeathTransition &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DeferDeathTransition opAssign(const FC_DeferDeathTransition &inout Other)
    {
        FC_DeferDeathTransition __r;
        this.SetbWaitLand(Other.GetbWaitLand());
        this.SetbDeferByAction(Other.GetbDeferByAction());
        this.SetbDeferDeathPresentation(Other.GetbDeferDeathPresentation());
        this.SetDeferStartTime(Other.GetDeferStartTime());
        return __r;
    }
    bool NeedDefer() const
    {
        return this.GetbWaitLand() || this.GetbDeferByAction();
    }
    bool GetbWaitLand() const property
    {
        return this.m_bWaitLand;
    }
    void SetbWaitLand(const bool __Value) property
    {
        if (!(this.m_bWaitLand) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bWaitLand = __Value;
        return;
    }
    bool GetbDeferByAction() const property
    {
        return this.m_bDeferByAction;
    }
    void SetbDeferByAction(const bool __Value) property
    {
        if (!(this.m_bDeferByAction) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bDeferByAction = __Value;
        return;
    }
    bool GetbDeferDeathPresentation() const property
    {
        return this.m_bDeferDeathPresentation;
    }
    void SetbDeferDeathPresentation(const bool __Value) property
    {
        if (!(this.m_bDeferDeathPresentation) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bDeferDeathPresentation = __Value;
        return;
    }
    const FFPTime GetDeferStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_DeferStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetDeferStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_DeferStartTime = __Value;
        return;
    }
}

struct FC_DeathConfig : FECSComponent
{
    UPROPERTY()
    bool bCanBeHitAfterDeath = false;
    UPROPERTY()
    bool bDisableMoveCollisionAfterDeath = false;
    UPROPERTY()
    bool bDisablePushColliderAfterDeath = true;


}

struct FC_DeathKiller : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntityId m_KillerEntityId;

    FC_DeathKiller()
    {
        this.m_KillerEntityId = ENTITY_ID_NULL;
        this.__InitDirtyFlags();
        return;
    }
    FC_DeathKiller(const FC_DeathKiller &inout Other)
    {
        this.m_KillerEntityId = ENTITY_ID_NULL;
        this.__InitDirtyFlags();
        this.m_KillerEntityId = Other.m_KillerEntityId;
        return;
    }
    FC_DeathKiller opAssign(const FC_DeathKiller &inout Other)
    {
        FC_DeathKiller __r;
        this.SetKillerEntityId(Other.GetKillerEntityId());
        return __r;
    }
    const FECSEntityId GetKillerEntityId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_KillerEntityId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetKillerEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_KillerEntityId = __Value;
        return;
    }
}

namespace ECSFunc_FC_DeathInfo
{
UFUNCTION()
bool HasDeathInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DeathInfo);
}
FC_DeathInfo& AssignDeathInfo(const FECSEntity &inout Entity, const FC_DeathInfo &inout DefaultValue = FC_DeathInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DeathInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDeathInfo_BP(const FECSEntity &inout Entity, const FC_DeathInfo &inout DefaultValue = FC_DeathInfo())
{
    ECSFunc_FC_DeathInfo::AssignDeathInfo(Entity, DefaultValue);
    return;
}
FC_DeathInfo& ModifyDeathInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DeathInfo));
    return local_12.GetComp();
}
FC_DeathInfo& ModifyOrAddDeathInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DeathInfo));
    return local_12.GetComp();
}
const FC_DeathInfo& GetDeathInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DeathInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_DeathInfo GetDeathInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DeathInfo& local_4 = ECSFunc_FC_DeathInfo::GetDeathInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DeathInfo();
}
const FC_DeathInfo GetDefaultedDeathInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DeathInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DeathInfo);
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
FC_DeathInfo GetDefaultedDeathInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DeathInfo::GetDefaultedDeathInfo(Entity);
}
UFUNCTION()
bool RemoveDeathInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DeathInfo);
}
}
FECSMonitorRuntimeView __GetMonitorDeathInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DeathInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DeathInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DeathInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DeathInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DeathInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorDeathInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DeathInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DeathInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DeathInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DeferDeathTransition
{
UFUNCTION()
bool HasDeferDeathTransition(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DeferDeathTransition);
}
FC_DeferDeathTransition& AssignDeferDeathTransition(const FECSEntity &inout Entity, const FC_DeferDeathTransition &inout DefaultValue = FC_DeferDeathTransition())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DeferDeathTransition, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDeferDeathTransition_BP(const FECSEntity &inout Entity, const FC_DeferDeathTransition &inout DefaultValue = FC_DeferDeathTransition())
{
    ECSFunc_FC_DeferDeathTransition::AssignDeferDeathTransition(Entity, DefaultValue);
    return;
}
FC_DeferDeathTransition& ModifyDeferDeathTransition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DeferDeathTransition));
    return local_12.GetComp();
}
FC_DeferDeathTransition& ModifyOrAddDeferDeathTransition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DeferDeathTransition));
    return local_12.GetComp();
}
const FC_DeferDeathTransition& GetDeferDeathTransition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DeferDeathTransition));
    return local_12.GetComp();
}
UFUNCTION()
FC_DeferDeathTransition GetDeferDeathTransition_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DeferDeathTransition& local_4 = ECSFunc_FC_DeferDeathTransition::GetDeferDeathTransition(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DeferDeathTransition();
}
const FC_DeferDeathTransition GetDefaultedDeferDeathTransition(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DeferDeathTransition __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DeferDeathTransition);
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
FC_DeferDeathTransition GetDefaultedDeferDeathTransition_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DeferDeathTransition::GetDefaultedDeferDeathTransition(Entity);
}
UFUNCTION()
bool RemoveDeferDeathTransition(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DeferDeathTransition);
}
}
FECSMonitorRuntimeView __GetMonitorDeferDeathTransitionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DeferDeathTransition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeferDeathTransitionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DeferDeathTransition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeferDeathTransitionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DeferDeathTransition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeferDeathTransitionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DeferDeathTransition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeferDeathTransitionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DeferDeathTransition, bFixedFrame, bMustHandleAll);
}
void __MonitorDeferDeathTransitionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DeferDeathTransition, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeferDeathTransitionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DeferDeathTransition, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeferDeathTransitionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DeferDeathTransition, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DeathConfig
{
UFUNCTION()
bool HasDeathConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DeathConfig);
}
FC_DeathConfig& AssignDeathConfig(const FECSEntity &inout Entity, const FC_DeathConfig &inout DefaultValue = FC_DeathConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DeathConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDeathConfig_BP(const FECSEntity &inout Entity, const FC_DeathConfig &inout DefaultValue = FC_DeathConfig())
{
    ECSFunc_FC_DeathConfig::AssignDeathConfig(Entity, DefaultValue);
    return;
}
FC_DeathConfig& ModifyDeathConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DeathConfig));
    return local_12.GetComp();
}
FC_DeathConfig& ModifyOrAddDeathConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DeathConfig));
    return local_12.GetComp();
}
const FC_DeathConfig& GetDeathConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DeathConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_DeathConfig GetDeathConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DeathConfig& local_4 = ECSFunc_FC_DeathConfig::GetDeathConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DeathConfig();
}
const FC_DeathConfig GetDefaultedDeathConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DeathConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DeathConfig);
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
FC_DeathConfig GetDefaultedDeathConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DeathConfig::GetDefaultedDeathConfig(Entity);
}
UFUNCTION()
bool RemoveDeathConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DeathConfig);
}
}
FECSMonitorRuntimeView __GetMonitorDeathConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DeathConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DeathConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DeathConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DeathConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DeathConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorDeathConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DeathConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DeathConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DeathConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DeathKiller
{
UFUNCTION()
bool HasDeathKiller(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DeathKiller);
}
FC_DeathKiller& AssignDeathKiller(const FECSEntity &inout Entity, const FC_DeathKiller &inout DefaultValue = FC_DeathKiller())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DeathKiller, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDeathKiller_BP(const FECSEntity &inout Entity, const FC_DeathKiller &inout DefaultValue = FC_DeathKiller())
{
    ECSFunc_FC_DeathKiller::AssignDeathKiller(Entity, DefaultValue);
    return;
}
FC_DeathKiller& ModifyDeathKiller(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DeathKiller));
    return local_12.GetComp();
}
FC_DeathKiller& ModifyOrAddDeathKiller(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DeathKiller));
    return local_12.GetComp();
}
const FC_DeathKiller& GetDeathKiller(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DeathKiller));
    return local_12.GetComp();
}
UFUNCTION()
FC_DeathKiller GetDeathKiller_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DeathKiller& local_4 = ECSFunc_FC_DeathKiller::GetDeathKiller(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DeathKiller();
}
const FC_DeathKiller GetDefaultedDeathKiller(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DeathKiller __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DeathKiller);
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
FC_DeathKiller GetDefaultedDeathKiller_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DeathKiller::GetDefaultedDeathKiller(Entity);
}
UFUNCTION()
bool RemoveDeathKiller(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DeathKiller);
}
}
FECSMonitorRuntimeView __GetMonitorDeathKillerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DeathKiller, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathKillerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DeathKiller, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathKillerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DeathKiller, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathKillerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DeathKiller, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathKillerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DeathKiller, bFixedFrame, bMustHandleAll);
}
void __MonitorDeathKillerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DeathKiller, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathKillerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DeathKiller, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathKillerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DeathKiller, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DeathInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DeathInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DeathInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DeathInfo
{
int __IndexOf_bESMTransitToDeathState()
{
    return 0;
}
int __IndexOf_bAutoEnterDestroy()
{
    return 1;
}
int __IndexOf_bDestroyImmediately()
{
    return 2;
}
int __IndexOf_bHasExtraDeathState()
{
    return 3;
}
int __IndexOf_ExtraDeathStateName()
{
    return 4;
}
int __IndexOf_FinalDeathStateName()
{
    return 5;
}
int __IndexOf_Reason()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DeferDeathTransition &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DeferDeathTransition &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DeferDeathTransition &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DeferDeathTransition
{
int __IndexOf_bWaitLand()
{
    return 0;
}
int __IndexOf_bDeferByAction()
{
    return 1;
}
int __IndexOf_bDeferDeathPresentation()
{
    return 2;
}
int __IndexOf_DeferStartTime()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DeathKiller &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DeathKiller &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DeathKiller &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DeathKiller
{
int __IndexOf_KillerEntityId()
{
    return 0;
}
}
