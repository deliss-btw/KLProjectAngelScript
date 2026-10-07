
namespace __INTENRAL_FC_ProjectileDurationalSFXList_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileDurationalSFXList> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileDurationalSFXList>();
    const FC_ProjectileDurationalSFXList DefaultValue = FC_ProjectileDurationalSFXList();
}
namespace __INTENRAL_FC_ProjectileDurationalSFXView_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileDurationalSFXView> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileDurationalSFXView>();
    const FC_ProjectileDurationalSFXView DefaultValue = FC_ProjectileDurationalSFXView();
}
namespace __INTENRAL_FC_ProjectileAudioKeepSwitchList_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileAudioKeepSwitchList> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileAudioKeepSwitchList>();
    const FC_ProjectileAudioKeepSwitchList DefaultValue = FC_ProjectileAudioKeepSwitchList();
}
namespace __INTENRAL_FC_ProjectileAudioKeepSwitchView_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileAudioKeepSwitchView> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileAudioKeepSwitchView>();
    const FC_ProjectileAudioKeepSwitchView DefaultValue = FC_ProjectileAudioKeepSwitchView();
}
namespace __INTENRAL_FC_ProjectileAudioKeepRtpcList_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileAudioKeepRtpcList> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileAudioKeepRtpcList>();
    const FC_ProjectileAudioKeepRtpcList DefaultValue = FC_ProjectileAudioKeepRtpcList();
}
namespace __INTENRAL_FC_ProjectileAudioKeepRtpcView_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileAudioKeepRtpcView> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileAudioKeepRtpcView>();
    const FC_ProjectileAudioKeepRtpcView DefaultValue = FC_ProjectileAudioKeepRtpcView();
}
namespace __INTENRAL_FCE_ProjectileInstantSFX_NS
{
    const TECSEventDerivedPtr<FCE_ProjectileInstantSFX> DerivedPtr = TECSEventDerivedPtr<FCE_ProjectileInstantSFX>();

}
struct FCE_ProjectileInstantSFX : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> Event = nullptr;
    UPROPERTY()
    bool bFollow = true;
    UPROPERTY()
    bool bSelfOnly = false;


}

struct FProjectileDurationalSFXEntry
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_TimelineIndex;
    UPROPERTY()
    int m_ActionIndex;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> m_EnterEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> m_ExitEvent;
    UPROPERTY()
    bool m_bFollow;
    UPROPERTY()
    bool m_bSelfOnly;

    FProjectileDurationalSFXEntry()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileDurationalSFXEntry(const FProjectileDurationalSFXEntry &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileDurationalSFXEntry opAssign(const FProjectileDurationalSFXEntry &inout Other)
    {
        FProjectileDurationalSFXEntry __r;
        this.SetTimelineIndex(Other.GetTimelineIndex());
        this.SetActionIndex(Other.GetActionIndex());
        this.SetEnterEvent(Other.GetEnterEvent());
        this.SetExitEvent(Other.GetExitEvent());
        this.SetbFollow(Other.GetbFollow());
        this.SetbSelfOnly(Other.GetbSelfOnly());
        return __r;
    }
    int GetTimelineIndex() const property
    {
        return this.m_TimelineIndex;
    }
    void SetTimelineIndex(const int __Value) property
    {
        if (this.m_TimelineIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TimelineIndex = __Value;
        return;
    }
    int GetActionIndex() const property
    {
        return this.m_ActionIndex;
    }
    void SetActionIndex(const int __Value) property
    {
        if (this.m_ActionIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ActionIndex = __Value;
        return;
    }
    const TSoftObjectPtr<UAkAudioEvent> GetEnterEvent() const property
    {
        const TSoftObjectPtr<UAkAudioEvent> __r;
        return __r;
    }
    TSoftObjectPtr<UAkAudioEvent> GetModify_EnterEvent() property
    {
        TSoftObjectPtr<UAkAudioEvent> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetEnterEvent(const TSoftObjectPtr<UAkAudioEvent> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_EnterEvent = __Value;
        return;
    }
    const TSoftObjectPtr<UAkAudioEvent> GetExitEvent() const property
    {
        const TSoftObjectPtr<UAkAudioEvent> __r;
        return __r;
    }
    TSoftObjectPtr<UAkAudioEvent> GetModify_ExitEvent() property
    {
        TSoftObjectPtr<UAkAudioEvent> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetExitEvent(const TSoftObjectPtr<UAkAudioEvent> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ExitEvent = __Value;
        return;
    }
    bool GetbFollow() const property
    {
        return this.m_bFollow;
    }
    void SetbFollow(const bool __Value) property
    {
        if (!(this.m_bFollow) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bFollow = __Value;
        return;
    }
    bool GetbSelfOnly() const property
    {
        return this.m_bSelfOnly;
    }
    void SetbSelfOnly(const bool __Value) property
    {
        if (!(this.m_bSelfOnly) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bSelfOnly = __Value;
        return;
    }
}

struct FC_ProjectileDurationalSFXList : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FProjectileDurationalSFXEntry> m_ActiveEntries;

    FC_ProjectileDurationalSFXList()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ProjectileDurationalSFXList(const FC_ProjectileDurationalSFXList &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ActiveEntries = Other.m_ActiveEntries;
        return;
    }
    FC_ProjectileDurationalSFXList opAssign(const FC_ProjectileDurationalSFXList &inout Other)
    {
        FC_ProjectileDurationalSFXList __r;
        this.SetActiveEntries(Other.GetActiveEntries());
        return __r;
    }
    const TArray<FProjectileDurationalSFXEntry> GetActiveEntries() const property
    {
        const TArray<FProjectileDurationalSFXEntry> __r;
        return __r;
    }
    TArray<FProjectileDurationalSFXEntry> GetModify_ActiveEntries() property
    {
        TArray<FProjectileDurationalSFXEntry> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetActiveEntries(const TArray<FProjectileDurationalSFXEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActiveEntries = __Value;
        return;
    }
}

struct FProjectileDurationalSFXPlayingEntry
{
    UPROPERTY()
    int TimelineIndex = -1;
    UPROPERTY()
    int ActionIndex = -1;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> ExitEvent = nullptr;
    UPROPERTY()
    bool bFollow = true;
    UPROPERTY()
    bool bSelfOnly = false;


}

struct FC_ProjectileDurationalSFXView : FECSComponent
{
    UPROPERTY()
    TArray<FProjectileDurationalSFXPlayingEntry> PlayingEntries;

    FC_ProjectileDurationalSFXView()
    {
        return;
    }
}

struct FProjectileAudioKeepSwitchEntry
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_TimelineIndex;
    UPROPERTY()
    int m_ActionIndex;
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> m_KeepSwitchValue;
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> m_ResetSwitchValue;

    FProjectileAudioKeepSwitchEntry()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileAudioKeepSwitchEntry(const FProjectileAudioKeepSwitchEntry &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileAudioKeepSwitchEntry opAssign(const FProjectileAudioKeepSwitchEntry &inout Other)
    {
        FProjectileAudioKeepSwitchEntry __r;
        this.SetTimelineIndex(Other.GetTimelineIndex());
        this.SetActionIndex(Other.GetActionIndex());
        this.SetKeepSwitchValue(Other.GetKeepSwitchValue());
        this.SetResetSwitchValue(Other.GetResetSwitchValue());
        return __r;
    }
    int GetTimelineIndex() const property
    {
        return this.m_TimelineIndex;
    }
    void SetTimelineIndex(const int __Value) property
    {
        if (this.m_TimelineIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TimelineIndex = __Value;
        return;
    }
    int GetActionIndex() const property
    {
        return this.m_ActionIndex;
    }
    void SetActionIndex(const int __Value) property
    {
        if (this.m_ActionIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ActionIndex = __Value;
        return;
    }
    const TSoftObjectPtr<UAkSwitchValue> GetKeepSwitchValue() const property
    {
        const TSoftObjectPtr<UAkSwitchValue> __r;
        return __r;
    }
    TSoftObjectPtr<UAkSwitchValue> GetModify_KeepSwitchValue() property
    {
        TSoftObjectPtr<UAkSwitchValue> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetKeepSwitchValue(const TSoftObjectPtr<UAkSwitchValue> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_KeepSwitchValue = __Value;
        return;
    }
    const TSoftObjectPtr<UAkSwitchValue> GetResetSwitchValue() const property
    {
        const TSoftObjectPtr<UAkSwitchValue> __r;
        return __r;
    }
    TSoftObjectPtr<UAkSwitchValue> GetModify_ResetSwitchValue() property
    {
        TSoftObjectPtr<UAkSwitchValue> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetResetSwitchValue(const TSoftObjectPtr<UAkSwitchValue> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ResetSwitchValue = __Value;
        return;
    }
}

struct FProjectileAudioKeepSwitchPlayingEntry
{
    UPROPERTY()
    int TimelineIndex = -1;
    UPROPERTY()
    int ActionIndex = -1;
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> ResetSwitchValue = nullptr;


}

struct FC_ProjectileAudioKeepSwitchList : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FProjectileAudioKeepSwitchEntry> m_ActiveEntries;

    FC_ProjectileAudioKeepSwitchList()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ProjectileAudioKeepSwitchList(const FC_ProjectileAudioKeepSwitchList &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ActiveEntries = Other.m_ActiveEntries;
        return;
    }
    FC_ProjectileAudioKeepSwitchList opAssign(const FC_ProjectileAudioKeepSwitchList &inout Other)
    {
        FC_ProjectileAudioKeepSwitchList __r;
        this.SetActiveEntries(Other.GetActiveEntries());
        return __r;
    }
    const TArray<FProjectileAudioKeepSwitchEntry> GetActiveEntries() const property
    {
        const TArray<FProjectileAudioKeepSwitchEntry> __r;
        return __r;
    }
    TArray<FProjectileAudioKeepSwitchEntry> GetModify_ActiveEntries() property
    {
        TArray<FProjectileAudioKeepSwitchEntry> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetActiveEntries(const TArray<FProjectileAudioKeepSwitchEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActiveEntries = __Value;
        return;
    }
}

struct FC_ProjectileAudioKeepSwitchView : FECSComponent
{
    UPROPERTY()
    TArray<FProjectileAudioKeepSwitchPlayingEntry> PlayingEntries;

    FC_ProjectileAudioKeepSwitchView()
    {
        return;
    }
}

struct FProjectileAudioKeepRtpcEntry
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_TimelineIndex;
    UPROPERTY()
    int m_ActionIndex;
    UPROPERTY()
    TSoftObjectPtr<UAkRtpc> m_Rtpc;
    UPROPERTY()
    float32 m_Value;
    UPROPERTY()
    float32 m_ResetValue;
    UPROPERTY()
    float32 m_InterpolateTime;

    FProjectileAudioKeepRtpcEntry()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileAudioKeepRtpcEntry(const FProjectileAudioKeepRtpcEntry &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileAudioKeepRtpcEntry opAssign(const FProjectileAudioKeepRtpcEntry &inout Other)
    {
        float32 local_2 = 0.0f;
        FProjectileAudioKeepRtpcEntry __r;
        this.SetTimelineIndex(Other.GetTimelineIndex());
        this.SetActionIndex(Other.GetActionIndex());
        this.SetRtpc(Other.GetRtpc());
        this.SetValue(local_2);
        this.SetResetValue(Other.GetResetValue());
        this.SetInterpolateTime(Other.GetInterpolateTime());
        return __r;
    }
    int GetTimelineIndex() const property
    {
        return this.m_TimelineIndex;
    }
    void SetTimelineIndex(const int __Value) property
    {
        if (this.m_TimelineIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TimelineIndex = __Value;
        return;
    }
    int GetActionIndex() const property
    {
        return this.m_ActionIndex;
    }
    void SetActionIndex(const int __Value) property
    {
        if (this.m_ActionIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ActionIndex = __Value;
        return;
    }
    const TSoftObjectPtr<UAkRtpc> GetRtpc() const property
    {
        const TSoftObjectPtr<UAkRtpc> __r;
        return __r;
    }
    TSoftObjectPtr<UAkRtpc> GetModify_Rtpc() property
    {
        TSoftObjectPtr<UAkRtpc> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetRtpc(const TSoftObjectPtr<UAkRtpc> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Rtpc = __Value;
        return;
    }
    float32 GetValue() const property
    {
        return this.m_Value;
    }
    void SetValue(const float32 __Value) property
    {
        if (this.m_Value == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Value = __Value;
        return;
    }
    float32 GetResetValue() const property
    {
        return this.m_ResetValue;
    }
    void SetResetValue(const float32 __Value) property
    {
        if (this.m_ResetValue == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ResetValue = __Value;
        return;
    }
    float32 GetInterpolateTime() const property
    {
        return this.m_InterpolateTime;
    }
    void SetInterpolateTime(const float32 __Value) property
    {
        if (this.m_InterpolateTime == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_InterpolateTime = __Value;
        return;
    }
}

struct FProjectileAudioKeepRtpcPlayingEntry
{
    UPROPERTY()
    int TimelineIndex = -1;
    UPROPERTY()
    int ActionIndex = -1;
    UPROPERTY()
    TSoftObjectPtr<UAkRtpc> Rtpc = nullptr;
    UPROPERTY()
    float32 ResetValue = 0.0f;
    UPROPERTY()
    float32 InterpolateTime = 0.1f;


}

struct FC_ProjectileAudioKeepRtpcList : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FProjectileAudioKeepRtpcEntry> m_ActiveEntries;

    FC_ProjectileAudioKeepRtpcList()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ProjectileAudioKeepRtpcList(const FC_ProjectileAudioKeepRtpcList &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ActiveEntries = Other.m_ActiveEntries;
        return;
    }
    FC_ProjectileAudioKeepRtpcList opAssign(const FC_ProjectileAudioKeepRtpcList &inout Other)
    {
        FC_ProjectileAudioKeepRtpcList __r;
        this.SetActiveEntries(Other.GetActiveEntries());
        return __r;
    }
    const TArray<FProjectileAudioKeepRtpcEntry> GetActiveEntries() const property
    {
        const TArray<FProjectileAudioKeepRtpcEntry> __r;
        return __r;
    }
    TArray<FProjectileAudioKeepRtpcEntry> GetModify_ActiveEntries() property
    {
        TArray<FProjectileAudioKeepRtpcEntry> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetActiveEntries(const TArray<FProjectileAudioKeepRtpcEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActiveEntries = __Value;
        return;
    }
}

struct FC_ProjectileAudioKeepRtpcView : FECSComponent
{
    UPROPERTY()
    TArray<FProjectileAudioKeepRtpcPlayingEntry> PlayingEntries;

    FC_ProjectileAudioKeepRtpcView()
    {
        return;
    }
}

namespace ECSFunc_FC_ProjectileDurationalSFXList
{
UFUNCTION()
bool HasProjectileDurationalSFXList(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXList);
}
FC_ProjectileDurationalSFXList& AssignProjectileDurationalSFXList(const FECSEntity &inout Entity, const FC_ProjectileDurationalSFXList &inout DefaultValue = FC_ProjectileDurationalSFXList())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXList, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileDurationalSFXList_BP(const FECSEntity &inout Entity, const FC_ProjectileDurationalSFXList &inout DefaultValue = FC_ProjectileDurationalSFXList())
{
    ECSFunc_FC_ProjectileDurationalSFXList::AssignProjectileDurationalSFXList(Entity, DefaultValue);
    return;
}
FC_ProjectileDurationalSFXList& ModifyProjectileDurationalSFXList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXList));
    return local_12.GetComp();
}
FC_ProjectileDurationalSFXList& ModifyOrAddProjectileDurationalSFXList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXList));
    return local_12.GetComp();
}
const FC_ProjectileDurationalSFXList& GetProjectileDurationalSFXList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXList));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileDurationalSFXList GetProjectileDurationalSFXList_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileDurationalSFXList& local_4 = ECSFunc_FC_ProjectileDurationalSFXList::GetProjectileDurationalSFXList(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileDurationalSFXList();
}
const FC_ProjectileDurationalSFXList GetDefaultedProjectileDurationalSFXList(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileDurationalSFXList __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXList);
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
FC_ProjectileDurationalSFXList GetDefaultedProjectileDurationalSFXList_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileDurationalSFXList::GetDefaultedProjectileDurationalSFXList(Entity);
}
UFUNCTION()
bool RemoveProjectileDurationalSFXList(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXList);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXListOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileDurationalSFXList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXListOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileDurationalSFXList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXListOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileDurationalSFXList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXListOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileDurationalSFXList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXListOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileDurationalSFXList, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileDurationalSFXListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileDurationalSFXList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileDurationalSFXListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileDurationalSFXList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileDurationalSFXListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileDurationalSFXList, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileDurationalSFXView
{
UFUNCTION()
bool HasProjectileDurationalSFXView(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXView);
}
FC_ProjectileDurationalSFXView& AssignProjectileDurationalSFXView(const FECSEntity &inout Entity, const FC_ProjectileDurationalSFXView &inout DefaultValue = FC_ProjectileDurationalSFXView())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXView, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileDurationalSFXView_BP(const FECSEntity &inout Entity, const FC_ProjectileDurationalSFXView &inout DefaultValue = FC_ProjectileDurationalSFXView())
{
    ECSFunc_FC_ProjectileDurationalSFXView::AssignProjectileDurationalSFXView(Entity, DefaultValue);
    return;
}
FC_ProjectileDurationalSFXView& ModifyProjectileDurationalSFXView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXView));
    return local_12.GetComp();
}
FC_ProjectileDurationalSFXView& ModifyOrAddProjectileDurationalSFXView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXView));
    return local_12.GetComp();
}
const FC_ProjectileDurationalSFXView& GetProjectileDurationalSFXView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXView));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileDurationalSFXView GetProjectileDurationalSFXView_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileDurationalSFXView __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileDurationalSFXView::GetProjectileDurationalSFXView(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileDurationalSFXView GetDefaultedProjectileDurationalSFXView(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileDurationalSFXView __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXView);
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
FC_ProjectileDurationalSFXView GetDefaultedProjectileDurationalSFXView_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileDurationalSFXView __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileDurationalSFXView(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileDurationalSFXView);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXViewOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileDurationalSFXView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXViewOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileDurationalSFXView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXViewOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileDurationalSFXView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXViewOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileDurationalSFXView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileDurationalSFXViewOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileDurationalSFXView, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileDurationalSFXViewLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileDurationalSFXView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileDurationalSFXViewActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileDurationalSFXView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileDurationalSFXViewModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileDurationalSFXView, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileAudioKeepSwitchList
{
UFUNCTION()
bool HasProjectileAudioKeepSwitchList(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchList);
}
FC_ProjectileAudioKeepSwitchList& AssignProjectileAudioKeepSwitchList(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepSwitchList &inout DefaultValue = FC_ProjectileAudioKeepSwitchList())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchList, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileAudioKeepSwitchList_BP(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepSwitchList &inout DefaultValue = FC_ProjectileAudioKeepSwitchList())
{
    ECSFunc_FC_ProjectileAudioKeepSwitchList::AssignProjectileAudioKeepSwitchList(Entity, DefaultValue);
    return;
}
FC_ProjectileAudioKeepSwitchList& ModifyProjectileAudioKeepSwitchList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchList));
    return local_12.GetComp();
}
FC_ProjectileAudioKeepSwitchList& ModifyOrAddProjectileAudioKeepSwitchList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchList));
    return local_12.GetComp();
}
const FC_ProjectileAudioKeepSwitchList& GetProjectileAudioKeepSwitchList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchList));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileAudioKeepSwitchList GetProjectileAudioKeepSwitchList_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileAudioKeepSwitchList& local_4 = ECSFunc_FC_ProjectileAudioKeepSwitchList::GetProjectileAudioKeepSwitchList(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileAudioKeepSwitchList();
}
const FC_ProjectileAudioKeepSwitchList GetDefaultedProjectileAudioKeepSwitchList(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileAudioKeepSwitchList __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchList);
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
FC_ProjectileAudioKeepSwitchList GetDefaultedProjectileAudioKeepSwitchList_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileAudioKeepSwitchList::GetDefaultedProjectileAudioKeepSwitchList(Entity);
}
UFUNCTION()
bool RemoveProjectileAudioKeepSwitchList(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchList);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchListOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileAudioKeepSwitchList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchListOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileAudioKeepSwitchList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchListOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileAudioKeepSwitchList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchListOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileAudioKeepSwitchList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchListOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileAudioKeepSwitchList, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileAudioKeepSwitchListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileAudioKeepSwitchList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileAudioKeepSwitchListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileAudioKeepSwitchList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileAudioKeepSwitchListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileAudioKeepSwitchList, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileAudioKeepSwitchView
{
UFUNCTION()
bool HasProjectileAudioKeepSwitchView(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchView);
}
FC_ProjectileAudioKeepSwitchView& AssignProjectileAudioKeepSwitchView(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepSwitchView &inout DefaultValue = FC_ProjectileAudioKeepSwitchView())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchView, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileAudioKeepSwitchView_BP(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepSwitchView &inout DefaultValue = FC_ProjectileAudioKeepSwitchView())
{
    ECSFunc_FC_ProjectileAudioKeepSwitchView::AssignProjectileAudioKeepSwitchView(Entity, DefaultValue);
    return;
}
FC_ProjectileAudioKeepSwitchView& ModifyProjectileAudioKeepSwitchView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchView));
    return local_12.GetComp();
}
FC_ProjectileAudioKeepSwitchView& ModifyOrAddProjectileAudioKeepSwitchView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchView));
    return local_12.GetComp();
}
const FC_ProjectileAudioKeepSwitchView& GetProjectileAudioKeepSwitchView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchView));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileAudioKeepSwitchView GetProjectileAudioKeepSwitchView_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileAudioKeepSwitchView __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileAudioKeepSwitchView::GetProjectileAudioKeepSwitchView(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileAudioKeepSwitchView GetDefaultedProjectileAudioKeepSwitchView(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileAudioKeepSwitchView __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchView);
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
FC_ProjectileAudioKeepSwitchView GetDefaultedProjectileAudioKeepSwitchView_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileAudioKeepSwitchView __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileAudioKeepSwitchView(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepSwitchView);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchViewOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileAudioKeepSwitchView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchViewOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileAudioKeepSwitchView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchViewOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileAudioKeepSwitchView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchViewOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileAudioKeepSwitchView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepSwitchViewOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileAudioKeepSwitchView, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileAudioKeepSwitchViewLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileAudioKeepSwitchView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileAudioKeepSwitchViewActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileAudioKeepSwitchView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileAudioKeepSwitchViewModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileAudioKeepSwitchView, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileAudioKeepRtpcList
{
UFUNCTION()
bool HasProjectileAudioKeepRtpcList(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcList);
}
FC_ProjectileAudioKeepRtpcList& AssignProjectileAudioKeepRtpcList(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepRtpcList &inout DefaultValue = FC_ProjectileAudioKeepRtpcList())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcList, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileAudioKeepRtpcList_BP(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepRtpcList &inout DefaultValue = FC_ProjectileAudioKeepRtpcList())
{
    ECSFunc_FC_ProjectileAudioKeepRtpcList::AssignProjectileAudioKeepRtpcList(Entity, DefaultValue);
    return;
}
FC_ProjectileAudioKeepRtpcList& ModifyProjectileAudioKeepRtpcList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcList));
    return local_12.GetComp();
}
FC_ProjectileAudioKeepRtpcList& ModifyOrAddProjectileAudioKeepRtpcList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcList));
    return local_12.GetComp();
}
const FC_ProjectileAudioKeepRtpcList& GetProjectileAudioKeepRtpcList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcList));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileAudioKeepRtpcList GetProjectileAudioKeepRtpcList_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileAudioKeepRtpcList& local_4 = ECSFunc_FC_ProjectileAudioKeepRtpcList::GetProjectileAudioKeepRtpcList(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileAudioKeepRtpcList();
}
const FC_ProjectileAudioKeepRtpcList GetDefaultedProjectileAudioKeepRtpcList(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileAudioKeepRtpcList __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcList);
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
FC_ProjectileAudioKeepRtpcList GetDefaultedProjectileAudioKeepRtpcList_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileAudioKeepRtpcList::GetDefaultedProjectileAudioKeepRtpcList(Entity);
}
UFUNCTION()
bool RemoveProjectileAudioKeepRtpcList(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcList);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcListOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileAudioKeepRtpcList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcListOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileAudioKeepRtpcList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcListOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileAudioKeepRtpcList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcListOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileAudioKeepRtpcList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcListOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileAudioKeepRtpcList, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileAudioKeepRtpcListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileAudioKeepRtpcList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileAudioKeepRtpcListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileAudioKeepRtpcList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileAudioKeepRtpcListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileAudioKeepRtpcList, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileAudioKeepRtpcView
{
UFUNCTION()
bool HasProjectileAudioKeepRtpcView(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcView);
}
FC_ProjectileAudioKeepRtpcView& AssignProjectileAudioKeepRtpcView(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepRtpcView &inout DefaultValue = FC_ProjectileAudioKeepRtpcView())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcView, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileAudioKeepRtpcView_BP(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepRtpcView &inout DefaultValue = FC_ProjectileAudioKeepRtpcView())
{
    ECSFunc_FC_ProjectileAudioKeepRtpcView::AssignProjectileAudioKeepRtpcView(Entity, DefaultValue);
    return;
}
FC_ProjectileAudioKeepRtpcView& ModifyProjectileAudioKeepRtpcView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcView));
    return local_12.GetComp();
}
FC_ProjectileAudioKeepRtpcView& ModifyOrAddProjectileAudioKeepRtpcView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcView));
    return local_12.GetComp();
}
const FC_ProjectileAudioKeepRtpcView& GetProjectileAudioKeepRtpcView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcView));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileAudioKeepRtpcView GetProjectileAudioKeepRtpcView_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileAudioKeepRtpcView __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileAudioKeepRtpcView::GetProjectileAudioKeepRtpcView(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileAudioKeepRtpcView GetDefaultedProjectileAudioKeepRtpcView(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileAudioKeepRtpcView __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcView);
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
FC_ProjectileAudioKeepRtpcView GetDefaultedProjectileAudioKeepRtpcView_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileAudioKeepRtpcView __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileAudioKeepRtpcView(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileAudioKeepRtpcView);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcViewOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileAudioKeepRtpcView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcViewOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileAudioKeepRtpcView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcViewOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileAudioKeepRtpcView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcViewOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileAudioKeepRtpcView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileAudioKeepRtpcViewOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileAudioKeepRtpcView, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileAudioKeepRtpcViewLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileAudioKeepRtpcView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileAudioKeepRtpcViewActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileAudioKeepRtpcView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileAudioKeepRtpcViewModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileAudioKeepRtpcView, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FProjectileDurationalSFXEntry &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FProjectileDurationalSFXEntry &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FProjectileDurationalSFXEntry
{
int __IndexOf_TimelineIndex()
{
    return 0;
}
int __IndexOf_ActionIndex()
{
    return 1;
}
int __IndexOf_EnterEvent()
{
    return 2;
}
int __IndexOf_ExitEvent()
{
    return 3;
}
int __IndexOf_bFollow()
{
    return 4;
}
int __IndexOf_bSelfOnly()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileDurationalSFXList &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileDurationalSFXList &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileDurationalSFXList &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileDurationalSFXList
{
int __IndexOf_ActiveEntries()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FProjectileAudioKeepSwitchEntry &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FProjectileAudioKeepSwitchEntry &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FProjectileAudioKeepSwitchEntry
{
int __IndexOf_TimelineIndex()
{
    return 0;
}
int __IndexOf_ActionIndex()
{
    return 1;
}
int __IndexOf_KeepSwitchValue()
{
    return 2;
}
int __IndexOf_ResetSwitchValue()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileAudioKeepSwitchList &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileAudioKeepSwitchList &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileAudioKeepSwitchList &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileAudioKeepSwitchList
{
int __IndexOf_ActiveEntries()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FProjectileAudioKeepRtpcEntry &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FProjectileAudioKeepRtpcEntry &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FProjectileAudioKeepRtpcEntry
{
int __IndexOf_TimelineIndex()
{
    return 0;
}
int __IndexOf_ActionIndex()
{
    return 1;
}
int __IndexOf_Rtpc()
{
    return 2;
}
int __IndexOf_Value()
{
    return 3;
}
int __IndexOf_ResetValue()
{
    return 4;
}
int __IndexOf_InterpolateTime()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileAudioKeepRtpcList &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileAudioKeepRtpcList &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileAudioKeepRtpcList &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileAudioKeepRtpcList
{
int __IndexOf_ActiveEntries()
{
    return 0;
}
}
