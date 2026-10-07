
namespace __INTENRAL_FC_CameraAffector_NS
{
    const TECSComponentDerivedPtr<FC_CameraAffector> DerivedPtr = TECSComponentDerivedPtr<FC_CameraAffector>();
    const FC_CameraAffector DefaultValue = FC_CameraAffector();
}
namespace __INTENRAL_FC_CameraAffected_NS
{
    const TECSComponentDerivedPtr<FC_CameraAffected> DerivedPtr = TECSComponentDerivedPtr<FC_CameraAffected>();
    const FC_CameraAffected DefaultValue = FC_CameraAffected();

}
struct FCameraAffectorItem
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_AffectorLevelCount;
    UPROPERTY()
    float32 m_Radius0;
    UPROPERTY()
    FDataObjectPtr m_Config0;
    UPROPERTY()
    float32 m_Radius1;
    UPROPERTY()
    FDataObjectPtr m_Config1;
    UPROPERTY()
    float32 m_Radius2;
    UPROPERTY()
    FDataObjectPtr m_Config2;

    FCameraAffectorItem()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCameraAffectorItem(const FCameraAffectorItem &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCameraAffectorItem opAssign(const FCameraAffectorItem &inout Other)
    {
        FCameraAffectorItem __r;
        this.SetAffectorLevelCount(Other.GetAffectorLevelCount());
        this.SetRadius0(Other.GetRadius0());
        this.SetConfig0(Other.GetConfig0());
        this.SetRadius1(Other.GetRadius1());
        this.SetConfig1(Other.GetConfig1());
        this.SetRadius2(Other.GetRadius2());
        this.SetConfig2(Other.GetConfig2());
        return __r;
    }
    bool ValidSorted() const
    {
        if (this.GetAffectorLevelCount() > 2)
        {
            return this.GetRadius0() < this.GetRadius1() && (this.GetRadius1() < this.GetRadius2());
        }
        if (this.GetAffectorLevelCount() > 1)
        {
            return (this.GetRadius0() < this.GetRadius1());
        }
        return true;
    }
    bool ValidDataRow() const
    {
        int local_1 = 0;
        for (; local_1 < this.GetAffectorLevelCount(); ++local_1)
        {
            if (this.GetConfig(local_1).GetDataName().IsNone())
            {
                return false;
            }
        }
        return true;
    }
    float32 GetRadius(const int Level) const
    {
        if (Level < 0)
        {
        }
        else
        {
            int local_1 = this.GetAffectorLevelCount();
        }
        if (Level >= 2)
        {
            return this.GetRadius2();
        }
        return Level >= 1 ? this.GetRadius1() : this.GetRadius0();
    }
    FDataObjectPtr GetConfig(const int Level) const
    {
        FDataObjectPtr __r;
        if (Level < 0)
        {
        }
        else
        {
            int local_1 = this.GetAffectorLevelCount();
        }
        if (Level >= 2)
        {
            return this.GetConfig2();
        }
        if (Level >= 1)
        {
        }
        else
        {
        }
        return __r;
    }
    const FDataObjectPtr& GetConfigByDistanceSQ(const float32 DistanceSQ) const
    {
        this.ValidSorted();
        int local_2 = 0;
        for (; local_2 < (this.GetAffectorLevelCount() - 1); ++local_2)
        {
            if (DistanceSQ <= FMath::Square(this.GetRadius(local_2)))
            {
                return this.GetConfig(local_2);
            }
        }
        float32 local_7 = this.GetRadius(this.GetAffectorLevelCount() - 1);
        float32 local_6 = this.GetMaxRadius();
        return this.GetConfig(this.GetAffectorLevelCount() - 1);
    }
    float32 GetMaxRadius() const property
    {
        return FMath::Max(FMath::Max(this.GetRadius0(), this.GetRadius1()), this.GetRadius2());
    }
    int GetAffectorLevelCount() const property
    {
        return this.m_AffectorLevelCount;
    }
    void SetAffectorLevelCount(const int __Value) property
    {
        if (this.m_AffectorLevelCount == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AffectorLevelCount = __Value;
        return;
    }
    float32 GetRadius0() const property
    {
        return this.m_Radius0;
    }
    void SetRadius0(const float32 __Value) property
    {
        if (this.m_Radius0 == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Radius0 = __Value;
        return;
    }
    const FDataObjectPtr GetConfig0() const property
    {
        const FDataObjectPtr __r;
        return __r;
    }
    FDataObjectPtr GetModify_Config0() property
    {
        FDataObjectPtr __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetConfig0(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Config0 = __Value;
        return;
    }
    float32 GetRadius1() const property
    {
        return this.m_Radius1;
    }
    void SetRadius1(const float32 __Value) property
    {
        if (this.m_Radius1 == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Radius1 = __Value;
        return;
    }
    const FDataObjectPtr GetConfig1() const property
    {
        const FDataObjectPtr __r;
        return __r;
    }
    FDataObjectPtr GetModify_Config1() property
    {
        FDataObjectPtr __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetConfig1(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Config1 = __Value;
        return;
    }
    float32 GetRadius2() const property
    {
        return this.m_Radius2;
    }
    void SetRadius2(const float32 __Value) property
    {
        if (this.m_Radius2 == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_Radius2 = __Value;
        return;
    }
    const FDataObjectPtr GetConfig2() const property
    {
        const FDataObjectPtr __r;
        return __r;
    }
    FDataObjectPtr GetModify_Config2() property
    {
        FDataObjectPtr __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetConfig2(const FDataObjectPtr &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_Config2 = __Value;
        return;
    }
}

struct FCameraAffecorOverride
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FName m_Identifier;
    UPROPERTY()
    FCameraAffectorItem m_OverrideItem;

    FCameraAffecorOverride()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCameraAffecorOverride(const FCameraAffecorOverride &inout Other)
    {
        this.m_Identifier = Other.m_Identifier;
        this.m_OverrideItem = Other.m_OverrideItem;
        return;
    }
    FCameraAffecorOverride opAssign(const FCameraAffecorOverride &inout Other)
    {
        FCameraAffecorOverride __r;
        this.SetIdentifier(Other.GetIdentifier());
        this.SetOverrideItem(Other.GetOverrideItem());
        return __r;
    }
    FName GetIdentifier() const property
    {
        return this.m_Identifier;
    }
    void SetIdentifier(const FName &inout __Value) property
    {
        if ((this.m_Identifier == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Identifier = __Value;
        return;
    }
    const FCameraAffectorItem GetOverrideItem() const property
    {
        const FCameraAffectorItem __r;
        return __r;
    }
    FCameraAffectorItem GetOverrideItem() property
    {
        FCameraAffectorItem __r;
        return __r;
    }
    void SetOverrideItem(const FCameraAffectorItem &inout __Value) property
    {
        this.m_OverrideItem = __Value;
        return;
    }
}

struct FC_CameraAffector : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bActive;
    UPROPERTY()
    FCameraAffectorItem m_Config;
    UPROPERTY()
    bool m_bIsRuntimeCreated;
    UPROPERTY()
    TArray<FCameraAffecorOverride> m_StackedOverride;

    FC_CameraAffector()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CameraAffector(const FC_CameraAffector &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CameraAffector opAssign(const FC_CameraAffector &inout Other)
    {
        FC_CameraAffector __r;
        this.SetbActive(Other.GetbActive());
        this.SetConfig(Other.GetConfig());
        this.SetbIsRuntimeCreated(Other.GetbIsRuntimeCreated());
        this.SetStackedOverride(Other.GetStackedOverride());
        return __r;
    }
    float32 GetMaxRadius() const property
    {
        if (this.GetStackedOverride().Num() > 0)
        {
            return this.GetStackedOverride().Last(0).GetOverrideItem().GetMaxRadius();
        }
        return this.GetConfig().GetMaxRadius();
    }
    const FCameraAffectorItem& GetAffectorItem() const property
    {
        if (this.GetStackedOverride().Num() > 0)
        {
            return this.GetStackedOverride().Last(0).GetOverrideItem();
        }
        return this.GetConfig();
    }
    void PushOverride(const FCameraAffectorItem &inout Item, const FName &inout Identifier)
    {
        FCameraAffecorOverride local_84;
        local_84.SetIdentifier(Identifier);
        local_84.SetOverrideItem(Item);
        if (Item.GetAffectorLevelCount() > 0 && (Item.GetRadius((Item.GetAffectorLevelCount() - 1)) < 0.0f))
        {
            FCameraAffectorItem local_170 = FCameraAffectorItem(local_84.GetOverrideItem());
            if (local_170.GetAffectorLevelCount() > 2)
            {
                local_170.SetRadius2(this.GetMaxRadius());
            }
            else
            {
                if (local_170.GetAffectorLevelCount() > 1)
                {
                    local_170.SetRadius1(this.GetMaxRadius());
                }
                else
                {
                    if (local_170.GetAffectorLevelCount() > 0)
                    {
                        local_170.SetRadius0(this.GetMaxRadius());
                    }
                }
            }
            local_84.SetOverrideItem(local_170);
        }
        local_84.GetOverrideItem().ValidSorted();
        this.GetModify_StackedOverride().Add(local_84);
        return;
    }
    bool PopOverride(const FName &inout Identifier)
    {
        int local_1 = 0;
        for (; local_1 < this.GetStackedOverride().Num(); ++local_1)
        {
            if ((this.GetStackedOverride()[local_1].GetIdentifier() == Identifier))
            {
                this.GetModify_StackedOverride().RemoveAt(local_1);
                return true;
            }
        }
        return false;
    }
    bool GetbActive() const property
    {
        return this.m_bActive;
    }
    void SetbActive(const bool __Value) property
    {
        if (!(this.m_bActive) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bActive = __Value;
        return;
    }
    FCameraAffectorItem GetConfig() const property
    {
        FCameraAffectorItem __r;
        return __r;
    }
    FCameraAffectorItem GetConfig() property
    {
        FCameraAffectorItem __r;
        return __r;
    }
    void SetConfig(const FCameraAffectorItem &inout __Value) property
    {
        this.m_Config = __Value;
        return;
    }
    bool GetbIsRuntimeCreated() const property
    {
        return this.m_bIsRuntimeCreated;
    }
    void SetbIsRuntimeCreated(const bool __Value) property
    {
        if (!(this.m_bIsRuntimeCreated) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bIsRuntimeCreated = __Value;
        return;
    }
    const TArray<FCameraAffecorOverride> GetStackedOverride() const property
    {
        const TArray<FCameraAffecorOverride> __r;
        return __r;
    }
    TArray<FCameraAffecorOverride> GetModify_StackedOverride() property
    {
        TArray<FCameraAffecorOverride> __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetStackedOverride(const TArray<FCameraAffecorOverride> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_StackedOverride = __Value;
        return;
    }
}

struct FC_CameraAffected : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_LastUpdateTime;
    UPROPERTY()
    float32 m_EnterDuration;
    UPROPERTY()
    float32 m_SwitchDuration;
    UPROPERTY()
    TArray<FDataObjectPtr> m_Modifiers;
    UPROPERTY()
    TArray<FECSEntityId> m_ModifiersFromSource;
    UPROPERTY()
    TArray<FFPTime> m_ModifiersUpdateTime;

    FC_CameraAffected()
    {
        this.m_LastUpdateTime = 0;
        this.m_EnterDuration = 0.0f;
        this.m_SwitchDuration = 0.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_CameraAffected(const FC_CameraAffected &inout Other)
    {
        this.m_LastUpdateTime = 0;
        this.m_EnterDuration = 0.0f;
        this.m_SwitchDuration = 0.0f;
        this.__InitDirtyFlags();
        this.m_LastUpdateTime = Other.m_LastUpdateTime;
        this.m_EnterDuration = Other.m_EnterDuration;
        this.m_SwitchDuration = Other.m_SwitchDuration;
        this.m_Modifiers = Other.m_Modifiers;
        this.m_ModifiersFromSource = Other.m_ModifiersFromSource;
        this.m_ModifiersUpdateTime = Other.m_ModifiersUpdateTime;
        return;
    }
    FC_CameraAffected opAssign(const FC_CameraAffected &inout Other)
    {
        FC_CameraAffected __r;
        this.SetLastUpdateTime(Other.GetLastUpdateTime());
        this.SetEnterDuration(Other.GetEnterDuration());
        this.SetSwitchDuration(Other.GetSwitchDuration());
        this.SetModifiers(Other.GetModifiers());
        this.SetModifiersFromSource(Other.GetModifiersFromSource());
        this.SetModifiersUpdateTime(Other.GetModifiersUpdateTime());
        return __r;
    }
    const FFPTime GetLastUpdateTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastUpdateTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLastUpdateTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LastUpdateTime = __Value;
        return;
    }
    float32 GetEnterDuration() const property
    {
        return this.m_EnterDuration;
    }
    void SetEnterDuration(const float32 __Value) property
    {
        if (this.m_EnterDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EnterDuration = __Value;
        return;
    }
    float32 GetSwitchDuration() const property
    {
        return this.m_SwitchDuration;
    }
    void SetSwitchDuration(const float32 __Value) property
    {
        if (this.m_SwitchDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SwitchDuration = __Value;
        return;
    }
    const TArray<FDataObjectPtr> GetModifiers() const property
    {
        const TArray<FDataObjectPtr> __r;
        return __r;
    }
    TArray<FDataObjectPtr> GetModify_Modifiers() property
    {
        TArray<FDataObjectPtr> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetModifiers(const TArray<FDataObjectPtr> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Modifiers = __Value;
        return;
    }
    const TArray<FECSEntityId> GetModifiersFromSource() const property
    {
        const TArray<FECSEntityId> __r;
        return __r;
    }
    TArray<FECSEntityId> GetModify_ModifiersFromSource() property
    {
        TArray<FECSEntityId> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetModifiersFromSource(const TArray<FECSEntityId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ModifiersFromSource = __Value;
        return;
    }
    const TArray<FFPTime> GetModifiersUpdateTime() const property
    {
        const TArray<FFPTime> __r;
        return __r;
    }
    TArray<FFPTime> GetModify_ModifiersUpdateTime() property
    {
        TArray<FFPTime> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetModifiersUpdateTime(const TArray<FFPTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_ModifiersUpdateTime = __Value;
        return;
    }
}

namespace ECSFunc_FC_CameraAffector
{
UFUNCTION()
bool HasCameraAffector(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraAffector);
}
FC_CameraAffector& AssignCameraAffector(const FECSEntity &inout Entity, const FC_CameraAffector &inout DefaultValue = FC_CameraAffector())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraAffector, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraAffector_BP(const FECSEntity &inout Entity, const FC_CameraAffector &inout DefaultValue = FC_CameraAffector())
{
    ECSFunc_FC_CameraAffector::AssignCameraAffector(Entity, DefaultValue);
    return;
}
FC_CameraAffector& ModifyCameraAffector(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraAffector));
    return local_12.GetComp();
}
FC_CameraAffector& ModifyOrAddCameraAffector(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraAffector));
    return local_12.GetComp();
}
const FC_CameraAffector& GetCameraAffector(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraAffector));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraAffector GetCameraAffector_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CameraAffector& local_4 = ECSFunc_FC_CameraAffector::GetCameraAffector(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CameraAffector();
}
const FC_CameraAffector GetDefaultedCameraAffector(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraAffector __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraAffector);
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
FC_CameraAffector GetDefaultedCameraAffector_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CameraAffector::GetDefaultedCameraAffector(Entity);
}
UFUNCTION()
bool RemoveCameraAffector(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraAffector);
}
}
FECSMonitorRuntimeView __GetMonitorCameraAffectorOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraAffector, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAffectorOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraAffector, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAffectorOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraAffector, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAffectorOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraAffector, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAffectorOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraAffector, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraAffectorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraAffector, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraAffectorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraAffector, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraAffectorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraAffector, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CameraAffected
{
UFUNCTION()
bool HasCameraAffected(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraAffected);
}
FC_CameraAffected& AssignCameraAffected(const FECSEntity &inout Entity, const FC_CameraAffected &inout DefaultValue = FC_CameraAffected())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraAffected, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraAffected_BP(const FECSEntity &inout Entity, const FC_CameraAffected &inout DefaultValue = FC_CameraAffected())
{
    ECSFunc_FC_CameraAffected::AssignCameraAffected(Entity, DefaultValue);
    return;
}
FC_CameraAffected& ModifyCameraAffected(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraAffected));
    return local_12.GetComp();
}
FC_CameraAffected& ModifyOrAddCameraAffected(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraAffected));
    return local_12.GetComp();
}
const FC_CameraAffected& GetCameraAffected(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraAffected));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraAffected GetCameraAffected_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CameraAffected& local_4 = ECSFunc_FC_CameraAffected::GetCameraAffected(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CameraAffected();
}
const FC_CameraAffected GetDefaultedCameraAffected(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraAffected __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraAffected);
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
FC_CameraAffected GetDefaultedCameraAffected_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CameraAffected::GetDefaultedCameraAffected(Entity);
}
UFUNCTION()
bool RemoveCameraAffected(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraAffected);
}
}
FECSMonitorRuntimeView __GetMonitorCameraAffectedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraAffected, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAffectedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraAffected, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAffectedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraAffected, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAffectedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraAffected, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraAffectedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraAffected, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraAffectedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraAffected, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraAffectedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraAffected, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraAffectedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraAffected, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCameraAffectorItem &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCameraAffectorItem &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCameraAffectorItem
{
int __IndexOf_AffectorLevelCount()
{
    return 0;
}
int __IndexOf_Radius0()
{
    return 1;
}
int __IndexOf_Config0()
{
    return 2;
}
int __IndexOf_Radius1()
{
    return 3;
}
int __IndexOf_Config1()
{
    return 4;
}
int __IndexOf_Radius2()
{
    return 5;
}
int __IndexOf_Config2()
{
    return 6;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FCameraAffecorOverride &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FCameraAffecorOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCameraAffecorOverride
{
int __IndexOf_Identifier()
{
    return 0;
}
int __IndexOf_OverrideItem()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_CameraAffector &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_CameraAffector &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CameraAffector &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CameraAffector
{
int __IndexOf_bActive()
{
    return 0;
}
int __IndexOf_Config()
{
    return 1;
}
int __IndexOf_bIsRuntimeCreated()
{
    return 8;
}
int __IndexOf_StackedOverride()
{
    return 9;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CameraAffected &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CameraAffected &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CameraAffected &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CameraAffected
{
int __IndexOf_LastUpdateTime()
{
    return 0;
}
int __IndexOf_EnterDuration()
{
    return 1;
}
int __IndexOf_SwitchDuration()
{
    return 2;
}
int __IndexOf_Modifiers()
{
    return 3;
}
int __IndexOf_ModifiersFromSource()
{
    return 4;
}
int __IndexOf_ModifiersUpdateTime()
{
    return 5;
}
}
