
enum EItemBtnUIType
{
    Mount,
    Heal,
    Combat1,
    Combat2,
    CombatTmp,
}

enum ENormalSSkillBtnUIType
{
    Ultra,
    Special,
    Q,
    E,
    R,
    T,
    Attack,
    Aim,
    Jump,
    Dodge,
    LockTarget,
    SwitchAvatar,
    RB,
}

namespace __INTENRAL_FC_SkillBtnDurationEffect_NS
{
    const TECSComponentDerivedPtr<FC_SkillBtnDurationEffect> DerivedPtr = TECSComponentDerivedPtr<FC_SkillBtnDurationEffect>();
    const FC_SkillBtnDurationEffect DefaultValue = FC_SkillBtnDurationEffect();
}
namespace __INTENRAL_FC_TemporarySkillOwner_NS
{
    const TECSComponentDerivedPtr<FC_TemporarySkillOwner> DerivedPtr = TECSComponentDerivedPtr<FC_TemporarySkillOwner>();
    const FC_TemporarySkillOwner DefaultValue = FC_TemporarySkillOwner();
}
namespace __INTENRAL_FC_SkillEquipment_NS
{
    const TECSComponentDerivedPtr<FC_SkillEquipment> DerivedPtr = TECSComponentDerivedPtr<FC_SkillEquipment>();
    const FC_SkillEquipment DefaultValue = FC_SkillEquipment();
}
namespace __INTENRAL_FC_ChangeSkillPanel_NS
{
    const TECSComponentDerivedPtr<FC_ChangeSkillPanel> DerivedPtr = TECSComponentDerivedPtr<FC_ChangeSkillPanel>();
    const FC_ChangeSkillPanel DefaultValue = FC_ChangeSkillPanel();
}
namespace __INTENRAL_FC_ItemBtnVisibilityOverride_NS
{
    const TECSComponentDerivedPtr<FC_ItemBtnVisibilityOverride> DerivedPtr = TECSComponentDerivedPtr<FC_ItemBtnVisibilityOverride>();
    const FC_ItemBtnVisibilityOverride DefaultValue = FC_ItemBtnVisibilityOverride();
}
namespace __INTENRAL_FC_SkillBtnVisibilityOverride_NS
{
    const TECSComponentDerivedPtr<FC_SkillBtnVisibilityOverride> DerivedPtr = TECSComponentDerivedPtr<FC_SkillBtnVisibilityOverride>();
    const FC_SkillBtnVisibilityOverride DefaultValue = FC_SkillBtnVisibilityOverride();
}
namespace __INTENRAL_FC_SkillPresentationOverride_NS
{
    const TECSComponentDerivedPtr<FC_SkillPresentationOverride> DerivedPtr = TECSComponentDerivedPtr<FC_SkillPresentationOverride>();
    const FC_SkillPresentationOverride DefaultValue = FC_SkillPresentationOverride();

}
struct FSpecialSkillBtnConfig
{
    UPROPERTY()
    FSoftBrush Bg;
    UPROPERTY()
    FSoftBrush Icon;

    FSpecialSkillBtnConfig()
    {
        return;
    }
}

struct FCommonSkillBtnConfig
{
    UPROPERTY()
    FSoftBrush Bg;
    UPROPERTY()
    FSoftBrush Icon;

    FCommonSkillBtnConfig()
    {
        return;
    }
}

struct FTSkillBtnConfig
{
    UPROPERTY()
    FSoftBrush Bg;
    UPROPERTY()
    FSoftBrush Icon;

    FTSkillBtnConfig()
    {
        return;
    }
}

struct FSkillBtnDurationEffect
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ESkillSlot m_Slot;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    FFPTime m_EndTime;

    FSkillBtnDurationEffect()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSkillBtnDurationEffect(const FSkillBtnDurationEffect &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSkillBtnDurationEffect opAssign(const FSkillBtnDurationEffect &inout Other)
    {
        FSkillBtnDurationEffect __r;
        this.SetSlot(Other.GetSlot());
        this.SetStartTime(Other.GetStartTime());
        this.SetEndTime(Other.GetEndTime());
        return __r;
    }
    ESkillSlot GetSlot() const property
    {
        return this.m_Slot;
    }
    void SetSlot(const ESkillSlot __Value) property
    {
        if (int(this.m_Slot) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Slot = __Value;
        return;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_StartTime = __Value;
        return;
    }
    FFPTime GetEndTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_EndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_EndTime = __Value;
        return;
    }
}

struct FC_SkillBtnDurationEffect : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FSkillBtnDurationEffect> m_DurationEffect;

    FC_SkillBtnDurationEffect()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SkillBtnDurationEffect(const FC_SkillBtnDurationEffect &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DurationEffect = Other.m_DurationEffect;
        return;
    }
    FC_SkillBtnDurationEffect opAssign(const FC_SkillBtnDurationEffect &inout Other)
    {
        FC_SkillBtnDurationEffect __r;
        this.SetDurationEffect(Other.GetDurationEffect());
        return __r;
    }
    bool Contains(const ESkillSlot Slot) const
    {
        for (auto& local_16 : this.GetDurationEffect())
        {
            if ((int(local_16.GetSlot())) == (int(Slot)))
            {
                return true;
            }
        }
        return false;
    }
    bool Get(const ESkillSlot Slot, FSkillBtnDurationEffect &inout Out) const
    {
        for (auto& local_16 : this.GetDurationEffect())
        {
            if ((int(local_16.GetSlot())) == (int(Slot)))
            {
                Out = local_16;
                return true;
            }
        }
        return false;
    }
    const TArray<FSkillBtnDurationEffect> GetDurationEffect() const property
    {
        const TArray<FSkillBtnDurationEffect> __r;
        return __r;
    }
    TArray<FSkillBtnDurationEffect> GetModify_DurationEffect() property
    {
        TArray<FSkillBtnDurationEffect> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDurationEffect(const TArray<FSkillBtnDurationEffect> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DurationEffect = __Value;
        return;
    }
}

struct FC_TemporarySkillOwner : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_SkillEntity;
    UPROPERTY()
    int m_UsableTime;

    FC_TemporarySkillOwner()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TemporarySkillOwner(const FC_TemporarySkillOwner &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TemporarySkillOwner opAssign(const FC_TemporarySkillOwner &inout Other)
    {
        FC_TemporarySkillOwner __r;
        this.SetSkillEntity(Other.GetSkillEntity());
        this.SetUsableTime(Other.GetUsableTime());
        return __r;
    }
    const FECSEntity GetSkillEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_SkillEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSkillEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SkillEntity = __Value;
        return;
    }
    int GetUsableTime() const property
    {
        return this.m_UsableTime;
    }
    void SetUsableTime(const int __Value) property
    {
        if (this.m_UsableTime == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_UsableTime = __Value;
        return;
    }
}

struct FC_SkillEquipment : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<ESkillSlot, TDataObjectPtr<FSkillInitConfig>> m_EquippedSkillBySlot;

    FC_SkillEquipment()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SkillEquipment(const FC_SkillEquipment &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_EquippedSkillBySlot = Other.m_EquippedSkillBySlot;
        return;
    }
    FC_SkillEquipment opAssign(const FC_SkillEquipment &inout Other)
    {
        FC_SkillEquipment __r;
        this.SetEquippedSkillBySlot(Other.GetEquippedSkillBySlot());
        return __r;
    }
    const TMap<ESkillSlot, TDataObjectPtr<FSkillInitConfig>> GetEquippedSkillBySlot() const property
    {
        const TMap<ESkillSlot, TDataObjectPtr<FSkillInitConfig>> __r;
        return __r;
    }
    TMap<ESkillSlot, TDataObjectPtr<FSkillInitConfig>> GetModify_EquippedSkillBySlot() property
    {
        TMap<ESkillSlot, TDataObjectPtr<FSkillInitConfig>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEquippedSkillBySlot(const TMap<ESkillSlot, TDataObjectPtr<FSkillInitConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_EquippedSkillBySlot = __Value;
        return;
    }
}

struct FC_ChangeSkillPanel : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FSkillBtnConfig> m_SkillBtnConfig;
    UPROPERTY()
    int m_RefCount;

    FC_ChangeSkillPanel()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ChangeSkillPanel(const FC_ChangeSkillPanel &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ChangeSkillPanel opAssign(const FC_ChangeSkillPanel &inout Other)
    {
        FC_ChangeSkillPanel __r;
        this.SetSkillBtnConfig(Other.GetSkillBtnConfig());
        this.SetRefCount(Other.GetRefCount());
        return __r;
    }
    const TDataObjectPtr<FSkillBtnConfig> GetSkillBtnConfig() const property
    {
        const TDataObjectPtr<FSkillBtnConfig> __r;
        return __r;
    }
    TDataObjectPtr<FSkillBtnConfig> GetModify_SkillBtnConfig() property
    {
        TDataObjectPtr<FSkillBtnConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSkillBtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SkillBtnConfig = __Value;
        return;
    }
    int GetRefCount() const property
    {
        return this.m_RefCount;
    }
    void SetRefCount(const int __Value) property
    {
        if (this.m_RefCount == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RefCount = __Value;
        return;
    }
}

struct FC_ItemBtnVisibilityOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<EItemBtnUIType> m_HiddenBtnTypes;

    FC_ItemBtnVisibilityOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ItemBtnVisibilityOverride(const FC_ItemBtnVisibilityOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_HiddenBtnTypes = Other.m_HiddenBtnTypes;
        return;
    }
    FC_ItemBtnVisibilityOverride opAssign(const FC_ItemBtnVisibilityOverride &inout Other)
    {
        FC_ItemBtnVisibilityOverride __r;
        this.SetHiddenBtnTypes(Other.GetHiddenBtnTypes());
        return __r;
    }
    bool IsHidden(const EItemBtnUIType BtnType) const
    {
        return this.GetHiddenBtnTypes().Contains(BtnType);
    }
    bool IsEmpty() const
    {
        return (this.GetHiddenBtnTypes().Num() == 0);
    }
    const TArray<EItemBtnUIType> GetHiddenBtnTypes() const property
    {
        const TArray<EItemBtnUIType> __r;
        return __r;
    }
    TArray<EItemBtnUIType> GetModify_HiddenBtnTypes() property
    {
        TArray<EItemBtnUIType> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetHiddenBtnTypes(const TArray<EItemBtnUIType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HiddenBtnTypes = __Value;
        return;
    }
}

struct FC_SkillBtnVisibilityOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<ENormalSSkillBtnUIType> m_HiddenBtnTypes;

    FC_SkillBtnVisibilityOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SkillBtnVisibilityOverride(const FC_SkillBtnVisibilityOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_HiddenBtnTypes = Other.m_HiddenBtnTypes;
        return;
    }
    FC_SkillBtnVisibilityOverride opAssign(const FC_SkillBtnVisibilityOverride &inout Other)
    {
        FC_SkillBtnVisibilityOverride __r;
        this.SetHiddenBtnTypes(Other.GetHiddenBtnTypes());
        return __r;
    }
    bool IsHidden(const ENormalSSkillBtnUIType BtnType) const
    {
        return this.GetHiddenBtnTypes().Contains(BtnType);
    }
    bool IsEmpty() const
    {
        return (this.GetHiddenBtnTypes().Num() == 0);
    }
    const TArray<ENormalSSkillBtnUIType> GetHiddenBtnTypes() const property
    {
        const TArray<ENormalSSkillBtnUIType> __r;
        return __r;
    }
    TArray<ENormalSSkillBtnUIType> GetModify_HiddenBtnTypes() property
    {
        TArray<ENormalSSkillBtnUIType> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetHiddenBtnTypes(const TArray<ENormalSSkillBtnUIType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HiddenBtnTypes = __Value;
        return;
    }
}

struct FSkillPresentationOverrideActiveEntry
{
    UPROPERTY()
    TDataObjectPtr<FSkillPresentationOverrideConfig> Config;
    UPROPERTY()
    int Serial = 0;


}

struct FSkillReplaceRestore
{
    UPROPERTY()
    const USkillConfig AddedSkillConfig;
    UPROPERTY()
    const USkillConfig OriginalSkillConfig = nullptr;
    UPROPERTY()
    ESkillSlot Slot = ESkillSlot(0);
    UPROPERTY()
    bool bReplaceInSameSlot = true;


}

struct FC_SkillPresentationOverride : FECSComponent
{
    UPROPERTY()
    TArray<FSkillPresentationOverrideActiveEntry> ActiveEntries;
    UPROPERTY()
    int NextSerial = 0;
    UPROPERTY()
    uint AppliedDataId = 0;
    UPROPERTY()
    TArray<FSkillReplaceRestore> AppliedRestores;


}

namespace ECSFunc_FC_SkillBtnDurationEffect
{
UFUNCTION()
bool HasSkillBtnDurationEffect(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnDurationEffect);
}
FC_SkillBtnDurationEffect& AssignSkillBtnDurationEffect(const FECSEntity &inout Entity, const FC_SkillBtnDurationEffect &inout DefaultValue = FC_SkillBtnDurationEffect())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnDurationEffect, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillBtnDurationEffect_BP(const FECSEntity &inout Entity, const FC_SkillBtnDurationEffect &inout DefaultValue = FC_SkillBtnDurationEffect())
{
    ECSFunc_FC_SkillBtnDurationEffect::AssignSkillBtnDurationEffect(Entity, DefaultValue);
    return;
}
FC_SkillBtnDurationEffect& ModifySkillBtnDurationEffect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnDurationEffect));
    return local_12.GetComp();
}
FC_SkillBtnDurationEffect& ModifyOrAddSkillBtnDurationEffect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnDurationEffect));
    return local_12.GetComp();
}
const FC_SkillBtnDurationEffect& GetSkillBtnDurationEffect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnDurationEffect));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillBtnDurationEffect GetSkillBtnDurationEffect_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SkillBtnDurationEffect& local_4 = ECSFunc_FC_SkillBtnDurationEffect::GetSkillBtnDurationEffect(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SkillBtnDurationEffect();
}
const FC_SkillBtnDurationEffect GetDefaultedSkillBtnDurationEffect(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillBtnDurationEffect __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnDurationEffect);
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
FC_SkillBtnDurationEffect GetDefaultedSkillBtnDurationEffect_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SkillBtnDurationEffect::GetDefaultedSkillBtnDurationEffect(Entity);
}
UFUNCTION()
bool RemoveSkillBtnDurationEffect(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnDurationEffect);
}
}
FECSMonitorRuntimeView __GetMonitorSkillBtnDurationEffectOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillBtnDurationEffect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillBtnDurationEffectOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillBtnDurationEffect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillBtnDurationEffectOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillBtnDurationEffect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillBtnDurationEffectOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillBtnDurationEffect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillBtnDurationEffectOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillBtnDurationEffect, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillBtnDurationEffectLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillBtnDurationEffect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillBtnDurationEffectActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillBtnDurationEffect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillBtnDurationEffectModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillBtnDurationEffect, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TemporarySkillOwner
{
UFUNCTION()
bool HasTemporarySkillOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TemporarySkillOwner);
}
FC_TemporarySkillOwner& AssignTemporarySkillOwner(const FECSEntity &inout Entity, const FC_TemporarySkillOwner &inout DefaultValue = FC_TemporarySkillOwner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TemporarySkillOwner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTemporarySkillOwner_BP(const FECSEntity &inout Entity, const FC_TemporarySkillOwner &inout DefaultValue = FC_TemporarySkillOwner())
{
    ECSFunc_FC_TemporarySkillOwner::AssignTemporarySkillOwner(Entity, DefaultValue);
    return;
}
FC_TemporarySkillOwner& ModifyTemporarySkillOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TemporarySkillOwner));
    return local_12.GetComp();
}
FC_TemporarySkillOwner& ModifyOrAddTemporarySkillOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TemporarySkillOwner));
    return local_12.GetComp();
}
const FC_TemporarySkillOwner& GetTemporarySkillOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TemporarySkillOwner));
    return local_12.GetComp();
}
UFUNCTION()
FC_TemporarySkillOwner GetTemporarySkillOwner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TemporarySkillOwner& local_4 = ECSFunc_FC_TemporarySkillOwner::GetTemporarySkillOwner(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TemporarySkillOwner();
}
const FC_TemporarySkillOwner GetDefaultedTemporarySkillOwner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TemporarySkillOwner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TemporarySkillOwner);
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
FC_TemporarySkillOwner GetDefaultedTemporarySkillOwner_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TemporarySkillOwner::GetDefaultedTemporarySkillOwner(Entity);
}
UFUNCTION()
bool RemoveTemporarySkillOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TemporarySkillOwner);
}
}
FECSMonitorRuntimeView __GetMonitorTemporarySkillOwnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TemporarySkillOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTemporarySkillOwnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TemporarySkillOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTemporarySkillOwnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TemporarySkillOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTemporarySkillOwnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TemporarySkillOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTemporarySkillOwnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TemporarySkillOwner, bFixedFrame, bMustHandleAll);
}
void __MonitorTemporarySkillOwnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TemporarySkillOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTemporarySkillOwnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TemporarySkillOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTemporarySkillOwnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TemporarySkillOwner, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SkillEquipment
{
UFUNCTION()
bool HasSkillEquipment(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillEquipment);
}
FC_SkillEquipment& AssignSkillEquipment(const FECSEntity &inout Entity, const FC_SkillEquipment &inout DefaultValue = FC_SkillEquipment())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillEquipment, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillEquipment_BP(const FECSEntity &inout Entity, const FC_SkillEquipment &inout DefaultValue = FC_SkillEquipment())
{
    ECSFunc_FC_SkillEquipment::AssignSkillEquipment(Entity, DefaultValue);
    return;
}
FC_SkillEquipment& ModifySkillEquipment(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillEquipment));
    return local_12.GetComp();
}
FC_SkillEquipment& ModifyOrAddSkillEquipment(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillEquipment));
    return local_12.GetComp();
}
const FC_SkillEquipment& GetSkillEquipment(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillEquipment));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillEquipment GetSkillEquipment_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SkillEquipment& local_4 = ECSFunc_FC_SkillEquipment::GetSkillEquipment(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SkillEquipment();
}
const FC_SkillEquipment GetDefaultedSkillEquipment(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillEquipment __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillEquipment);
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
FC_SkillEquipment GetDefaultedSkillEquipment_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SkillEquipment::GetDefaultedSkillEquipment(Entity);
}
UFUNCTION()
bool RemoveSkillEquipment(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillEquipment);
}
}
FECSMonitorRuntimeView __GetMonitorSkillEquipmentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillEquipment, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillEquipmentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillEquipment, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillEquipmentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillEquipment, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillEquipmentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillEquipment, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillEquipmentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillEquipment, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillEquipmentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillEquipment, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillEquipmentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillEquipment, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillEquipmentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillEquipment, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ChangeSkillPanel
{
UFUNCTION()
bool HasChangeSkillPanel(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ChangeSkillPanel);
}
FC_ChangeSkillPanel& AssignChangeSkillPanel(const FECSEntity &inout Entity, const FC_ChangeSkillPanel &inout DefaultValue = FC_ChangeSkillPanel())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ChangeSkillPanel, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignChangeSkillPanel_BP(const FECSEntity &inout Entity, const FC_ChangeSkillPanel &inout DefaultValue = FC_ChangeSkillPanel())
{
    ECSFunc_FC_ChangeSkillPanel::AssignChangeSkillPanel(Entity, DefaultValue);
    return;
}
FC_ChangeSkillPanel& ModifyChangeSkillPanel(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ChangeSkillPanel));
    return local_12.GetComp();
}
FC_ChangeSkillPanel& ModifyOrAddChangeSkillPanel(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ChangeSkillPanel));
    return local_12.GetComp();
}
const FC_ChangeSkillPanel& GetChangeSkillPanel(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ChangeSkillPanel));
    return local_12.GetComp();
}
UFUNCTION()
FC_ChangeSkillPanel GetChangeSkillPanel_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ChangeSkillPanel& local_4 = ECSFunc_FC_ChangeSkillPanel::GetChangeSkillPanel(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ChangeSkillPanel();
}
const FC_ChangeSkillPanel GetDefaultedChangeSkillPanel(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ChangeSkillPanel __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ChangeSkillPanel);
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
FC_ChangeSkillPanel GetDefaultedChangeSkillPanel_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ChangeSkillPanel::GetDefaultedChangeSkillPanel(Entity);
}
UFUNCTION()
bool RemoveChangeSkillPanel(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ChangeSkillPanel);
}
}
FECSMonitorRuntimeView __GetMonitorChangeSkillPanelOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ChangeSkillPanel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChangeSkillPanelOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ChangeSkillPanel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChangeSkillPanelOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ChangeSkillPanel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChangeSkillPanelOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ChangeSkillPanel, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChangeSkillPanelOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ChangeSkillPanel, bFixedFrame, bMustHandleAll);
}
void __MonitorChangeSkillPanelLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ChangeSkillPanel, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChangeSkillPanelActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ChangeSkillPanel, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChangeSkillPanelModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ChangeSkillPanel, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ItemBtnVisibilityOverride
{
UFUNCTION()
bool HasItemBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ItemBtnVisibilityOverride);
}
FC_ItemBtnVisibilityOverride& AssignItemBtnVisibilityOverride(const FECSEntity &inout Entity, const FC_ItemBtnVisibilityOverride &inout DefaultValue = FC_ItemBtnVisibilityOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ItemBtnVisibilityOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignItemBtnVisibilityOverride_BP(const FECSEntity &inout Entity, const FC_ItemBtnVisibilityOverride &inout DefaultValue = FC_ItemBtnVisibilityOverride())
{
    ECSFunc_FC_ItemBtnVisibilityOverride::AssignItemBtnVisibilityOverride(Entity, DefaultValue);
    return;
}
FC_ItemBtnVisibilityOverride& ModifyItemBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ItemBtnVisibilityOverride));
    return local_12.GetComp();
}
FC_ItemBtnVisibilityOverride& ModifyOrAddItemBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ItemBtnVisibilityOverride));
    return local_12.GetComp();
}
const FC_ItemBtnVisibilityOverride& GetItemBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ItemBtnVisibilityOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_ItemBtnVisibilityOverride GetItemBtnVisibilityOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ItemBtnVisibilityOverride& local_4 = ECSFunc_FC_ItemBtnVisibilityOverride::GetItemBtnVisibilityOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ItemBtnVisibilityOverride();
}
const FC_ItemBtnVisibilityOverride GetDefaultedItemBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ItemBtnVisibilityOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ItemBtnVisibilityOverride);
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
FC_ItemBtnVisibilityOverride GetDefaultedItemBtnVisibilityOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ItemBtnVisibilityOverride::GetDefaultedItemBtnVisibilityOverride(Entity);
}
UFUNCTION()
bool RemoveItemBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ItemBtnVisibilityOverride);
}
}
FECSMonitorRuntimeView __GetMonitorItemBtnVisibilityOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ItemBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemBtnVisibilityOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ItemBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemBtnVisibilityOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ItemBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemBtnVisibilityOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ItemBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorItemBtnVisibilityOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ItemBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorItemBtnVisibilityOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ItemBtnVisibilityOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemBtnVisibilityOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ItemBtnVisibilityOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorItemBtnVisibilityOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ItemBtnVisibilityOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SkillBtnVisibilityOverride
{
UFUNCTION()
bool HasSkillBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnVisibilityOverride);
}
FC_SkillBtnVisibilityOverride& AssignSkillBtnVisibilityOverride(const FECSEntity &inout Entity, const FC_SkillBtnVisibilityOverride &inout DefaultValue = FC_SkillBtnVisibilityOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnVisibilityOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillBtnVisibilityOverride_BP(const FECSEntity &inout Entity, const FC_SkillBtnVisibilityOverride &inout DefaultValue = FC_SkillBtnVisibilityOverride())
{
    ECSFunc_FC_SkillBtnVisibilityOverride::AssignSkillBtnVisibilityOverride(Entity, DefaultValue);
    return;
}
FC_SkillBtnVisibilityOverride& ModifySkillBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnVisibilityOverride));
    return local_12.GetComp();
}
FC_SkillBtnVisibilityOverride& ModifyOrAddSkillBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnVisibilityOverride));
    return local_12.GetComp();
}
const FC_SkillBtnVisibilityOverride& GetSkillBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnVisibilityOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillBtnVisibilityOverride GetSkillBtnVisibilityOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SkillBtnVisibilityOverride& local_4 = ECSFunc_FC_SkillBtnVisibilityOverride::GetSkillBtnVisibilityOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SkillBtnVisibilityOverride();
}
const FC_SkillBtnVisibilityOverride GetDefaultedSkillBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillBtnVisibilityOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnVisibilityOverride);
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
FC_SkillBtnVisibilityOverride GetDefaultedSkillBtnVisibilityOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SkillBtnVisibilityOverride::GetDefaultedSkillBtnVisibilityOverride(Entity);
}
UFUNCTION()
bool RemoveSkillBtnVisibilityOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillBtnVisibilityOverride);
}
}
FECSMonitorRuntimeView __GetMonitorSkillBtnVisibilityOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillBtnVisibilityOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillBtnVisibilityOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillBtnVisibilityOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillBtnVisibilityOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillBtnVisibilityOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillBtnVisibilityOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillBtnVisibilityOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillBtnVisibilityOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillBtnVisibilityOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillBtnVisibilityOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillBtnVisibilityOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SkillPresentationOverride
{
UFUNCTION()
bool HasSkillPresentationOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillPresentationOverride);
}
FC_SkillPresentationOverride& AssignSkillPresentationOverride(const FECSEntity &inout Entity, const FC_SkillPresentationOverride &inout DefaultValue = FC_SkillPresentationOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillPresentationOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillPresentationOverride_BP(const FECSEntity &inout Entity, const FC_SkillPresentationOverride &inout DefaultValue = FC_SkillPresentationOverride())
{
    ECSFunc_FC_SkillPresentationOverride::AssignSkillPresentationOverride(Entity, DefaultValue);
    return;
}
FC_SkillPresentationOverride& ModifySkillPresentationOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillPresentationOverride));
    return local_12.GetComp();
}
FC_SkillPresentationOverride& ModifyOrAddSkillPresentationOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillPresentationOverride));
    return local_12.GetComp();
}
const FC_SkillPresentationOverride& GetSkillPresentationOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillPresentationOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillPresentationOverride GetSkillPresentationOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SkillPresentationOverride __r;
    bValid = false;
    bValid = ECSFunc_FC_SkillPresentationOverride::GetSkillPresentationOverride(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SkillPresentationOverride GetDefaultedSkillPresentationOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillPresentationOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillPresentationOverride);
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
FC_SkillPresentationOverride GetDefaultedSkillPresentationOverride_BP(const FECSEntity &inout Entity)
{
    FC_SkillPresentationOverride __r;
    return __r;
}
UFUNCTION()
bool RemoveSkillPresentationOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillPresentationOverride);
}
}
FECSMonitorRuntimeView __GetMonitorSkillPresentationOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillPresentationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillPresentationOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillPresentationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillPresentationOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillPresentationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillPresentationOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillPresentationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillPresentationOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillPresentationOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillPresentationOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillPresentationOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillPresentationOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillPresentationOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillPresentationOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillPresentationOverride, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FSkillBtnDurationEffect &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FSkillBtnDurationEffect &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSkillBtnDurationEffect
{
int __IndexOf_Slot()
{
    return 0;
}
int __IndexOf_StartTime()
{
    return 1;
}
int __IndexOf_EndTime()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SkillBtnDurationEffect &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SkillBtnDurationEffect &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SkillBtnDurationEffect &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SkillBtnDurationEffect
{
int __IndexOf_DurationEffect()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TemporarySkillOwner &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TemporarySkillOwner &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TemporarySkillOwner &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TemporarySkillOwner
{
int __IndexOf_SkillEntity()
{
    return 0;
}
int __IndexOf_UsableTime()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SkillEquipment &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SkillEquipment &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SkillEquipment &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SkillEquipment
{
int __IndexOf_EquippedSkillBySlot()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ChangeSkillPanel &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ChangeSkillPanel &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ChangeSkillPanel &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ChangeSkillPanel
{
int __IndexOf_SkillBtnConfig()
{
    return 0;
}
int __IndexOf_RefCount()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ItemBtnVisibilityOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ItemBtnVisibilityOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ItemBtnVisibilityOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ItemBtnVisibilityOverride
{
int __IndexOf_HiddenBtnTypes()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SkillBtnVisibilityOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SkillBtnVisibilityOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SkillBtnVisibilityOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SkillBtnVisibilityOverride
{
int __IndexOf_HiddenBtnTypes()
{
    return 0;
}
}
