
namespace __INTENRAL_FC_HUDShowHideCrosshair_NS
{
    const TECSComponentDerivedPtr<FC_HUDShowHideCrosshair> DerivedPtr = TECSComponentDerivedPtr<FC_HUDShowHideCrosshair>();
    const FC_HUDShowHideCrosshair DefaultValue = FC_HUDShowHideCrosshair();
}
namespace __INTENRAL_FCE_HUDHint_NS
{
    const TECSEventDerivedPtr<FCE_HUDHint> DerivedPtr = TECSEventDerivedPtr<FCE_HUDHint>();
}
namespace __INTENRAL_FCE_LocalHUDHint_NS
{
    const TECSEventDerivedPtr<FCE_LocalHUDHint> DerivedPtr = TECSEventDerivedPtr<FCE_LocalHUDHint>();
}
namespace __INTENRAL_FCE_HUDShowCrosshair_NS
{
    const TECSEventDerivedPtr<FCE_HUDShowCrosshair> DerivedPtr = TECSEventDerivedPtr<FCE_HUDShowCrosshair>();
}
namespace __INTENRAL_FCE_HUDBuffAddHintEvent_NS
{
    const TECSEventDerivedPtr<FCE_HUDBuffAddHintEvent> DerivedPtr = TECSEventDerivedPtr<FCE_HUDBuffAddHintEvent>();

}
struct FSideHintData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    EHUDHintType m_HUDHintType;
    UPROPERTY()
    bool m_bIsShow;
    UPROPERTY()
    FString m_ShowContent;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> m_HintTextData;
    UPROPERTY()
    TDataObjectPtr<FSideHintConfig> m_SideHintConfig;
    UPROPERTY()
    float32 m_ShowHintTime;
    UPROPERTY()
    FECSEntity m_SpecifiedShowEntity;
    UPROPERTY()
    FECSEntity m_CustomEntity_1;
    UPROPERTY()
    FECSEntity m_CustomEntity_2;
    UPROPERTY()
    ETextArgType_DEPRECATED m_TextArgType;
    UPROPERTY()
    FDataObjectPtr m_TextArg0Ptr;
    UPROPERTY()
    FString m_CustomContent_1;

    FSideHintData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSideHintData(const FSideHintData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSideHintData opAssign(const FSideHintData &inout Other)
    {
        FSideHintData __r;
        this.SetHUDHintType(Other.GetHUDHintType());
        this.SetbIsShow(Other.GetbIsShow());
        this.SetShowContent(Other.GetShowContent());
        this.SetHintTextData(Other.GetHintTextData());
        this.SetSideHintConfig(Other.GetSideHintConfig());
        this.SetShowHintTime(Other.GetShowHintTime());
        this.SetSpecifiedShowEntity(Other.GetSpecifiedShowEntity());
        this.SetCustomEntity_1(Other.GetCustomEntity_1());
        this.SetCustomEntity_2(Other.GetCustomEntity_2());
        this.SetTextArgType(Other.GetTextArgType());
        this.SetTextArg0Ptr(Other.GetTextArg0Ptr());
        this.SetCustomContent_1(Other.GetCustomContent_1());
        return __r;
    }
    EHUDHintType GetHUDHintType() const property
    {
        return this.m_HUDHintType;
    }
    void SetHUDHintType(const EHUDHintType __Value) property
    {
        if (int(this.m_HUDHintType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HUDHintType = __Value;
        return;
    }
    bool GetbIsShow() const property
    {
        return this.m_bIsShow;
    }
    void SetbIsShow(const bool __Value) property
    {
        if (!(this.m_bIsShow) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bIsShow = __Value;
        return;
    }
    FString GetShowContent() const property
    {
        return this.m_ShowContent;
    }
    void SetShowContent(const FString &inout __Value) property
    {
        if ((this.m_ShowContent == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ShowContent = __Value;
        return;
    }
    const TDataObjectPtr<FKLTextData> GetHintTextData() const property
    {
        const TDataObjectPtr<FKLTextData> __r;
        return __r;
    }
    TDataObjectPtr<FKLTextData> GetModify_HintTextData() property
    {
        TDataObjectPtr<FKLTextData> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetHintTextData(const TDataObjectPtr<FKLTextData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_HintTextData = __Value;
        return;
    }
    const TDataObjectPtr<FSideHintConfig> GetSideHintConfig() const property
    {
        const TDataObjectPtr<FSideHintConfig> __r;
        return __r;
    }
    TDataObjectPtr<FSideHintConfig> GetModify_SideHintConfig() property
    {
        TDataObjectPtr<FSideHintConfig> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetSideHintConfig(const TDataObjectPtr<FSideHintConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SideHintConfig = __Value;
        return;
    }
    float32 GetShowHintTime() const property
    {
        return this.m_ShowHintTime;
    }
    void SetShowHintTime(const float32 __Value) property
    {
        if (this.m_ShowHintTime == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_ShowHintTime = __Value;
        return;
    }
    const FECSEntity GetSpecifiedShowEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_SpecifiedShowEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetSpecifiedShowEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_SpecifiedShowEntity = __Value;
        return;
    }
    const FECSEntity GetCustomEntity_1() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_CustomEntity_1() property
    {
        FECSEntity __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetCustomEntity_1(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_CustomEntity_1 = __Value;
        return;
    }
    const FECSEntity GetCustomEntity_2() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_CustomEntity_2() property
    {
        FECSEntity __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetCustomEntity_2(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_CustomEntity_2 = __Value;
        return;
    }
    ETextArgType_DEPRECATED GetTextArgType() const property
    {
        return this.m_TextArgType;
    }
    void SetTextArgType(const ETextArgType_DEPRECATED __Value) property
    {
        if (int(this.m_TextArgType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_TextArgType = __Value;
        return;
    }
    const FDataObjectPtr GetTextArg0Ptr() const property
    {
        const FDataObjectPtr __r;
        return __r;
    }
    FDataObjectPtr GetModify_TextArg0Ptr() property
    {
        FDataObjectPtr __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetTextArg0Ptr(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_TextArg0Ptr = __Value;
        return;
    }
    FString GetCustomContent_1() const property
    {
        return this.m_CustomContent_1;
    }
    void SetCustomContent_1(const FString &inout __Value) property
    {
        if ((this.m_CustomContent_1 == __Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_CustomContent_1 = __Value;
        return;
    }
}

struct FCE_HUDHint : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FSideHintData SideHintData;

    FCE_HUDHint()
    {
        return;
    }
}

struct FCE_LocalHUDHint : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FSideHintData SideHintData;

    FCE_LocalHUDHint()
    {
        return;
    }
}

struct FC_HUDShowHideCrosshair : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bIsShow;

    FC_HUDShowHideCrosshair()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_HUDShowHideCrosshair(const FC_HUDShowHideCrosshair &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_HUDShowHideCrosshair opAssign(const FC_HUDShowHideCrosshair &inout Other)
    {
        FC_HUDShowHideCrosshair __r;
        this.SetbIsShow(Other.GetbIsShow());
        return __r;
    }
    bool GetbIsShow() const property
    {
        return this.m_bIsShow;
    }
    void SetbIsShow(const bool __Value) property
    {
        if (!(this.m_bIsShow) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsShow = __Value;
        return;
    }
}

struct FCE_HUDShowCrosshair : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bIsShow = true;


}

struct FCE_HUDBuffAddHintEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int BuffStackNum;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    FECSEntity BuffFromEntity;
    UPROPERTY()
    FECSEntity BuffEntity;
    UPROPERTY()
    bool bMetaBuff = false;


}

namespace ECSFunc_FC_HUDShowHideCrosshair
{
UFUNCTION()
bool HasHUDShowHideCrosshair(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HUDShowHideCrosshair);
}
FC_HUDShowHideCrosshair& AssignHUDShowHideCrosshair(const FECSEntity &inout Entity, const FC_HUDShowHideCrosshair &inout DefaultValue = FC_HUDShowHideCrosshair())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HUDShowHideCrosshair, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHUDShowHideCrosshair_BP(const FECSEntity &inout Entity, const FC_HUDShowHideCrosshair &inout DefaultValue = FC_HUDShowHideCrosshair())
{
    ECSFunc_FC_HUDShowHideCrosshair::AssignHUDShowHideCrosshair(Entity, DefaultValue);
    return;
}
FC_HUDShowHideCrosshair& ModifyHUDShowHideCrosshair(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HUDShowHideCrosshair));
    return local_12.GetComp();
}
FC_HUDShowHideCrosshair& ModifyOrAddHUDShowHideCrosshair(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HUDShowHideCrosshair));
    return local_12.GetComp();
}
const FC_HUDShowHideCrosshair& GetHUDShowHideCrosshair(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HUDShowHideCrosshair));
    return local_12.GetComp();
}
UFUNCTION()
FC_HUDShowHideCrosshair GetHUDShowHideCrosshair_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HUDShowHideCrosshair& local_4 = ECSFunc_FC_HUDShowHideCrosshair::GetHUDShowHideCrosshair(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HUDShowHideCrosshair();
}
const FC_HUDShowHideCrosshair GetDefaultedHUDShowHideCrosshair(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HUDShowHideCrosshair __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HUDShowHideCrosshair);
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
FC_HUDShowHideCrosshair GetDefaultedHUDShowHideCrosshair_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HUDShowHideCrosshair::GetDefaultedHUDShowHideCrosshair(Entity);
}
UFUNCTION()
bool RemoveHUDShowHideCrosshair(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HUDShowHideCrosshair);
}
}
FECSMonitorRuntimeView __GetMonitorHUDShowHideCrosshairOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HUDShowHideCrosshair, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHUDShowHideCrosshairOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HUDShowHideCrosshair, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHUDShowHideCrosshairOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HUDShowHideCrosshair, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHUDShowHideCrosshairOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HUDShowHideCrosshair, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHUDShowHideCrosshairOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HUDShowHideCrosshair, bFixedFrame, bMustHandleAll);
}
void __MonitorHUDShowHideCrosshairLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HUDShowHideCrosshair, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHUDShowHideCrosshairActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HUDShowHideCrosshair, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHUDShowHideCrosshairModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HUDShowHideCrosshair, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FSideHintData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FSideHintData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSideHintData
{
int __IndexOf_HUDHintType()
{
    return 0;
}
int __IndexOf_bIsShow()
{
    return 1;
}
int __IndexOf_ShowContent()
{
    return 2;
}
int __IndexOf_HintTextData()
{
    return 3;
}
int __IndexOf_SideHintConfig()
{
    return 4;
}
int __IndexOf_ShowHintTime()
{
    return 5;
}
int __IndexOf_SpecifiedShowEntity()
{
    return 6;
}
int __IndexOf_CustomEntity_1()
{
    return 7;
}
int __IndexOf_CustomEntity_2()
{
    return 8;
}
int __IndexOf_TextArgType()
{
    return 9;
}
int __IndexOf_TextArg0Ptr()
{
    return 10;
}
int __IndexOf_CustomContent_1()
{
    return 11;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_HUDShowHideCrosshair &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_HUDShowHideCrosshair &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_HUDShowHideCrosshair &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_HUDShowHideCrosshair
{
int __IndexOf_bIsShow()
{
    return 0;
}
}
