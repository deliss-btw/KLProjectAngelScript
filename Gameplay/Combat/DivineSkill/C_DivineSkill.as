
namespace __INTENRAL_FC_DivineSkill_NS
{
    const TECSComponentDerivedPtr<FC_DivineSkill> DerivedPtr = TECSComponentDerivedPtr<FC_DivineSkill>();
    const FC_DivineSkill DefaultValue = FC_DivineSkill();
}
namespace __INTENRAL_FC_DivineSkillSuitableUpdateTag_NS
{
    const TECSComponentDerivedPtr<FC_DivineSkillSuitableUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FC_DivineSkillSuitableUpdateTag>();
    const FC_DivineSkillSuitableUpdateTag DefaultValue = FC_DivineSkillSuitableUpdateTag();
}
namespace __INTENRAL_FC_DivineSkillCommissionEnterResetPending_NS
{
    const TECSComponentDerivedPtr<FC_DivineSkillCommissionEnterResetPending> DerivedPtr = TECSComponentDerivedPtr<FC_DivineSkillCommissionEnterResetPending>();
    const FC_DivineSkillCommissionEnterResetPending DefaultValue = FC_DivineSkillCommissionEnterResetPending();
}
namespace __INTENRAL_FCS_RaceStartDivineSkillResetPendingTag_NS
{
    const TECSComponentDerivedPtr<FCS_RaceStartDivineSkillResetPendingTag> DerivedPtr = TECSComponentDerivedPtr<FCS_RaceStartDivineSkillResetPendingTag>();
    const FCS_RaceStartDivineSkillResetPendingTag DefaultValue = FCS_RaceStartDivineSkillResetPendingTag();
}
namespace __INTENRAL_FC_OverrideDivineLiteraryType_NS
{
    const TECSComponentDerivedPtr<FC_OverrideDivineLiteraryType> DerivedPtr = TECSComponentDerivedPtr<FC_OverrideDivineLiteraryType>();
    const FC_OverrideDivineLiteraryType DefaultValue = FC_OverrideDivineLiteraryType();
}
namespace __INTENRAL_FCE_OnChangeDivineSkillReq_NS
{
    const TECSEventDerivedPtr<FCE_OnChangeDivineSkillReq> DerivedPtr = TECSEventDerivedPtr<FCE_OnChangeDivineSkillReq>();
}
namespace __INTENRAL_FCE_ChangeDivineSkillWithOutGS_NS
{
    const TECSEventDerivedPtr<FCE_ChangeDivineSkillWithOutGS> DerivedPtr = TECSEventDerivedPtr<FCE_ChangeDivineSkillWithOutGS>();

}
struct FDivineSkillModifierIds
{
    UPROPERTY()
    TArray<int> m_ModifierIds;

    FDivineSkillModifierIds()
    {
        return;
    }
    const TArray<int> GetModifierIds() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModifierIds() property
    {
        TArray<int> __r;
        return __r;
    }
    void SetModifierIds(const TArray<int> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FDivineSkillCapabilityIds
{
    UPROPERTY()
    TArray<FCapabilityInstanceId> m_CapabilityIds;

    FDivineSkillCapabilityIds()
    {
        return;
    }
    const TArray<FCapabilityInstanceId> GetCapabilityIds() const property
    {
        const TArray<FCapabilityInstanceId> __r;
        return __r;
    }
    TArray<FCapabilityInstanceId> GetCapabilityIds() property
    {
        TArray<FCapabilityInstanceId> __r;
        return __r;
    }
    void SetCapabilityIds(const TArray<FCapabilityInstanceId> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FDivineSkillData
{
    UPROPERTY()
    TDataObjectPtr<FDivineSkillConfig> m_SkillConfig;

    FDivineSkillData()
    {
        return;
    }
    bool IsValid() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_24;
        local_24 = this.GetSkillConfig();
        return (!((local_24 == nullptr)));
    }
    bool opConv() const
    {
        return this.IsValid();
    }
    TDataObjectPtr<FDivineSkillConfig> GetSkillConfig() const property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        return __r;
    }
    TDataObjectPtr<FDivineSkillConfig> GetSkillConfig() property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        return __r;
    }
    void SetSkillConfig(const TDataObjectPtr<FDivineSkillConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FDivineSkillCDSnapshot
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_SnapshotTime;
    UPROPERTY()
    FFPTime m_CDEndTime;
    UPROPERTY()
    float32 m_CDDuration;

    FDivineSkillCDSnapshot()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDivineSkillCDSnapshot(const FDivineSkillCDSnapshot &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDivineSkillCDSnapshot opAssign(const FDivineSkillCDSnapshot &inout Other)
    {
        FDivineSkillCDSnapshot __r;
        this.SetSnapshotTime(Other.GetSnapshotTime());
        this.SetCDEndTime(Other.GetCDEndTime());
        this.SetCDDuration(Other.GetCDDuration());
        return __r;
    }
    bool IsActive(const FFPTime &inout Now) const
    {
        return this.GetCDEndTime().GetTicks() > 0 && (this.GetCDDuration() > 0.0f) && (FFPTime(this.GetCDEndTime()).opCmp(Now) > 0);
    }
    void Reset()
    {
        this.SetCDEndTime(FFPTime());
        this.SetCDDuration(0.0f);
        return;
    }
    const FFPTime GetSnapshotTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_SnapshotTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSnapshotTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SnapshotTime = __Value;
        return;
    }
    const FFPTime GetCDEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_CDEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCDEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CDEndTime = __Value;
        return;
    }
    float32 GetCDDuration() const property
    {
        return this.m_CDDuration;
    }
    void SetCDDuration(const float32 __Value) property
    {
        if (this.m_CDDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CDDuration = __Value;
        return;
    }
}

struct FC_DivineSkill : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bHasSuitableCharacter;
    UPROPERTY()
    FDivineSkillData m_DivineSkillData;
    UPROPERTY()
    TMap<FECSEntityId, FDivineSkillModifierIds> m_ModifierIdByPawnEntityId;
    UPROPERTY()
    TMap<FECSEntityId, FDivineSkillCapabilityIds> m_CapabilityIdByPawnEntityId;
    UPROPERTY()
    FDivineSkillCDSnapshot m_CDSnapshot;

    FC_DivineSkill()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DivineSkill(const FC_DivineSkill &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DivineSkill opAssign(const FC_DivineSkill &inout Other)
    {
        FC_DivineSkill __r;
        this.SetbHasSuitableCharacter(Other.GetbHasSuitableCharacter());
        this.SetDivineSkillData(Other.GetDivineSkillData());
        this.SetModifierIdByPawnEntityId(Other.GetModifierIdByPawnEntityId());
        this.SetCapabilityIdByPawnEntityId(Other.GetCapabilityIdByPawnEntityId());
        this.SetCDSnapshot(Other.GetCDSnapshot());
        return __r;
    }
    bool GetbHasSuitableCharacter() const property
    {
        return this.m_bHasSuitableCharacter;
    }
    void SetbHasSuitableCharacter(const bool __Value) property
    {
        if (!(this.m_bHasSuitableCharacter) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bHasSuitableCharacter = __Value;
        return;
    }
    const FDivineSkillData GetDivineSkillData() const property
    {
        const FDivineSkillData __r;
        return __r;
    }
    FDivineSkillData GetModify_DivineSkillData() property
    {
        FDivineSkillData __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDivineSkillData(const FDivineSkillData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        return;
    }
    const TMap<FECSEntityId, FDivineSkillModifierIds> GetModifierIdByPawnEntityId() const property
    {
        const TMap<FECSEntityId, FDivineSkillModifierIds> __r;
        return __r;
    }
    TMap<FECSEntityId, FDivineSkillModifierIds> GetModify_ModifierIdByPawnEntityId() property
    {
        TMap<FECSEntityId, FDivineSkillModifierIds> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetModifierIdByPawnEntityId(const TMap<FECSEntityId, FDivineSkillModifierIds> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ModifierIdByPawnEntityId = __Value;
        return;
    }
    const TMap<FECSEntityId, FDivineSkillCapabilityIds> GetCapabilityIdByPawnEntityId() const property
    {
        const TMap<FECSEntityId, FDivineSkillCapabilityIds> __r;
        return __r;
    }
    TMap<FECSEntityId, FDivineSkillCapabilityIds> GetModify_CapabilityIdByPawnEntityId() property
    {
        TMap<FECSEntityId, FDivineSkillCapabilityIds> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetCapabilityIdByPawnEntityId(const TMap<FECSEntityId, FDivineSkillCapabilityIds> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_CapabilityIdByPawnEntityId = __Value;
        return;
    }
    const FDivineSkillCDSnapshot GetCDSnapshot() const property
    {
        const FDivineSkillCDSnapshot __r;
        return __r;
    }
    FDivineSkillCDSnapshot GetCDSnapshot() property
    {
        FDivineSkillCDSnapshot __r;
        return __r;
    }
    void SetCDSnapshot(const FDivineSkillCDSnapshot &inout __Value) property
    {
        this.m_CDSnapshot = __Value;
        return;
    }
}

struct FC_DivineSkillSuitableUpdateTag : FECSComponent
{
    FC_DivineSkillSuitableUpdateTag()
    {
        return;
    }
}

struct FC_DivineSkillCommissionEnterResetPending : FECSComponent
{
    UPROPERTY()
    FFPTime StartTime;

    FC_DivineSkillCommissionEnterResetPending()
    {
        return;
    }
}

struct FCS_RaceStartDivineSkillResetPendingTag : FECSSingleton
{
    FCS_RaceStartDivineSkillResetPendingTag()
    {
        return;
    }
}

struct FCE_OnChangeDivineSkillReq : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FDivineSkillData DivineSkillData;
    UPROPERTY()
    bool bNeedReply;


}

struct FCE_ChangeDivineSkillWithOutGS : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FDivineSkillConfig> DivineSkillConfig;

    FCE_ChangeDivineSkillWithOutGS()
    {
        return;
    }
}

struct FC_OverrideDivineLiteraryType : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FDivineLiteraryTypeConfig> m_DivineLiteraryType;

    FC_OverrideDivineLiteraryType()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_OverrideDivineLiteraryType(const FC_OverrideDivineLiteraryType &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DivineLiteraryType = Other.m_DivineLiteraryType;
        return;
    }
    FC_OverrideDivineLiteraryType opAssign(const FC_OverrideDivineLiteraryType &inout Other)
    {
        FC_OverrideDivineLiteraryType __r;
        this.SetDivineLiteraryType(Other.GetDivineLiteraryType());
        return __r;
    }
    const TDataObjectPtr<FDivineLiteraryTypeConfig> GetDivineLiteraryType() const property
    {
        const TDataObjectPtr<FDivineLiteraryTypeConfig> __r;
        return __r;
    }
    TDataObjectPtr<FDivineLiteraryTypeConfig> GetModify_DivineLiteraryType() property
    {
        TDataObjectPtr<FDivineLiteraryTypeConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDivineLiteraryType(const TDataObjectPtr<FDivineLiteraryTypeConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DivineLiteraryType = __Value;
        return;
    }
}

namespace ECSFunc_FC_DivineSkill
{
UFUNCTION()
bool HasDivineSkill(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DivineSkill);
}
FC_DivineSkill& AssignDivineSkill(const FECSEntity &inout Entity, const FC_DivineSkill &inout DefaultValue = FC_DivineSkill())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DivineSkill, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDivineSkill_BP(const FECSEntity &inout Entity, const FC_DivineSkill &inout DefaultValue = FC_DivineSkill())
{
    ECSFunc_FC_DivineSkill::AssignDivineSkill(Entity, DefaultValue);
    return;
}
FC_DivineSkill& ModifyDivineSkill(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DivineSkill));
    return local_12.GetComp();
}
FC_DivineSkill& ModifyOrAddDivineSkill(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DivineSkill));
    return local_12.GetComp();
}
const FC_DivineSkill& GetDivineSkill(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DivineSkill));
    return local_12.GetComp();
}
UFUNCTION()
FC_DivineSkill GetDivineSkill_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DivineSkill& local_4 = ECSFunc_FC_DivineSkill::GetDivineSkill(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DivineSkill();
}
const FC_DivineSkill GetDefaultedDivineSkill(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DivineSkill __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DivineSkill);
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
FC_DivineSkill GetDefaultedDivineSkill_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DivineSkill::GetDefaultedDivineSkill(Entity);
}
UFUNCTION()
bool RemoveDivineSkill(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DivineSkill);
}
}
FECSMonitorRuntimeView __GetMonitorDivineSkillOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DivineSkill, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DivineSkill, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DivineSkill, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DivineSkill, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DivineSkill, bFixedFrame, bMustHandleAll);
}
void __MonitorDivineSkillLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DivineSkill, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDivineSkillActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DivineSkill, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDivineSkillModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DivineSkill, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DivineSkillSuitableUpdateTag
{
UFUNCTION()
bool HasDivineSkillSuitableUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillSuitableUpdateTag);
}
FC_DivineSkillSuitableUpdateTag& AssignDivineSkillSuitableUpdateTag(const FECSEntity &inout Entity, const FC_DivineSkillSuitableUpdateTag &inout DefaultValue = FC_DivineSkillSuitableUpdateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillSuitableUpdateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDivineSkillSuitableUpdateTag_BP(const FECSEntity &inout Entity, const FC_DivineSkillSuitableUpdateTag &inout DefaultValue = FC_DivineSkillSuitableUpdateTag())
{
    ECSFunc_FC_DivineSkillSuitableUpdateTag::AssignDivineSkillSuitableUpdateTag(Entity, DefaultValue);
    return;
}
FC_DivineSkillSuitableUpdateTag& ModifyDivineSkillSuitableUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillSuitableUpdateTag));
    return local_12.GetComp();
}
FC_DivineSkillSuitableUpdateTag& ModifyOrAddDivineSkillSuitableUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillSuitableUpdateTag));
    return local_12.GetComp();
}
const FC_DivineSkillSuitableUpdateTag& GetDivineSkillSuitableUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillSuitableUpdateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DivineSkillSuitableUpdateTag GetDivineSkillSuitableUpdateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DivineSkillSuitableUpdateTag& local_4 = ECSFunc_FC_DivineSkillSuitableUpdateTag::GetDivineSkillSuitableUpdateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DivineSkillSuitableUpdateTag();
}
const FC_DivineSkillSuitableUpdateTag GetDefaultedDivineSkillSuitableUpdateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DivineSkillSuitableUpdateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillSuitableUpdateTag);
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
FC_DivineSkillSuitableUpdateTag GetDefaultedDivineSkillSuitableUpdateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DivineSkillSuitableUpdateTag::GetDefaultedDivineSkillSuitableUpdateTag(Entity);
}
UFUNCTION()
bool RemoveDivineSkillSuitableUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillSuitableUpdateTag);
}
}
FECSMonitorRuntimeView __GetMonitorDivineSkillSuitableUpdateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DivineSkillSuitableUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillSuitableUpdateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DivineSkillSuitableUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillSuitableUpdateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DivineSkillSuitableUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillSuitableUpdateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DivineSkillSuitableUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillSuitableUpdateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DivineSkillSuitableUpdateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDivineSkillSuitableUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DivineSkillSuitableUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDivineSkillSuitableUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DivineSkillSuitableUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDivineSkillSuitableUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DivineSkillSuitableUpdateTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DivineSkillCommissionEnterResetPending
{
UFUNCTION()
bool HasDivineSkillCommissionEnterResetPending(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillCommissionEnterResetPending);
}
FC_DivineSkillCommissionEnterResetPending& AssignDivineSkillCommissionEnterResetPending(const FECSEntity &inout Entity, const FC_DivineSkillCommissionEnterResetPending &inout DefaultValue = FC_DivineSkillCommissionEnterResetPending())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillCommissionEnterResetPending, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDivineSkillCommissionEnterResetPending_BP(const FECSEntity &inout Entity, const FC_DivineSkillCommissionEnterResetPending &inout DefaultValue = FC_DivineSkillCommissionEnterResetPending())
{
    ECSFunc_FC_DivineSkillCommissionEnterResetPending::AssignDivineSkillCommissionEnterResetPending(Entity, DefaultValue);
    return;
}
FC_DivineSkillCommissionEnterResetPending& ModifyDivineSkillCommissionEnterResetPending(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillCommissionEnterResetPending));
    return local_12.GetComp();
}
FC_DivineSkillCommissionEnterResetPending& ModifyOrAddDivineSkillCommissionEnterResetPending(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillCommissionEnterResetPending));
    return local_12.GetComp();
}
const FC_DivineSkillCommissionEnterResetPending& GetDivineSkillCommissionEnterResetPending(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillCommissionEnterResetPending));
    return local_12.GetComp();
}
UFUNCTION()
FC_DivineSkillCommissionEnterResetPending GetDivineSkillCommissionEnterResetPending_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DivineSkillCommissionEnterResetPending __r;
    bValid = false;
    bValid = ECSFunc_FC_DivineSkillCommissionEnterResetPending::GetDivineSkillCommissionEnterResetPending(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DivineSkillCommissionEnterResetPending GetDefaultedDivineSkillCommissionEnterResetPending(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DivineSkillCommissionEnterResetPending __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillCommissionEnterResetPending);
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
FC_DivineSkillCommissionEnterResetPending GetDefaultedDivineSkillCommissionEnterResetPending_BP(const FECSEntity &inout Entity)
{
    FC_DivineSkillCommissionEnterResetPending __r;
    return __r;
}
UFUNCTION()
bool RemoveDivineSkillCommissionEnterResetPending(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DivineSkillCommissionEnterResetPending);
}
}
FECSMonitorRuntimeView __GetMonitorDivineSkillCommissionEnterResetPendingOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DivineSkillCommissionEnterResetPending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillCommissionEnterResetPendingOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DivineSkillCommissionEnterResetPending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillCommissionEnterResetPendingOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DivineSkillCommissionEnterResetPending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillCommissionEnterResetPendingOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DivineSkillCommissionEnterResetPending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDivineSkillCommissionEnterResetPendingOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DivineSkillCommissionEnterResetPending, bFixedFrame, bMustHandleAll);
}
void __MonitorDivineSkillCommissionEnterResetPendingLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DivineSkillCommissionEnterResetPending, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDivineSkillCommissionEnterResetPendingActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DivineSkillCommissionEnterResetPending, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDivineSkillCommissionEnterResetPendingModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DivineSkillCommissionEnterResetPending, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_RaceStartDivineSkillResetPendingTag
{
UFUNCTION()
bool HasRaceStartDivineSkillResetPendingTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_RaceStartDivineSkillResetPendingTag);
}
FCS_RaceStartDivineSkillResetPendingTag& AssignRaceStartDivineSkillResetPendingTag(const FECSWorldPtr &inout World, const FCS_RaceStartDivineSkillResetPendingTag &inout DefaultValue = FCS_RaceStartDivineSkillResetPendingTag())
{
    UScriptStruct local_6 = FCS_RaceStartDivineSkillResetPendingTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignRaceStartDivineSkillResetPendingTag_BP(const FECSWorldPtr &inout World, const FCS_RaceStartDivineSkillResetPendingTag &inout DefaultValue = FCS_RaceStartDivineSkillResetPendingTag())
{
    ECSFunc_FCS_RaceStartDivineSkillResetPendingTag::AssignRaceStartDivineSkillResetPendingTag(World, DefaultValue);
    return;
}
FCS_RaceStartDivineSkillResetPendingTag& ModifyRaceStartDivineSkillResetPendingTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_RaceStartDivineSkillResetPendingTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_RaceStartDivineSkillResetPendingTag& ModifyOrAddRaceStartDivineSkillResetPendingTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_RaceStartDivineSkillResetPendingTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_RaceStartDivineSkillResetPendingTag& GetRaceStartDivineSkillResetPendingTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_RaceStartDivineSkillResetPendingTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_RaceStartDivineSkillResetPendingTag GetRaceStartDivineSkillResetPendingTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_RaceStartDivineSkillResetPendingTag& local_4 = ECSFunc_FCS_RaceStartDivineSkillResetPendingTag::GetRaceStartDivineSkillResetPendingTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_RaceStartDivineSkillResetPendingTag();
}
const FCS_RaceStartDivineSkillResetPendingTag GetDefaultedRaceStartDivineSkillResetPendingTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_RaceStartDivineSkillResetPendingTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_RaceStartDivineSkillResetPendingTag);
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
FCS_RaceStartDivineSkillResetPendingTag GetDefaultedRaceStartDivineSkillResetPendingTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_RaceStartDivineSkillResetPendingTag::GetDefaultedRaceStartDivineSkillResetPendingTag(World);
}
UFUNCTION()
bool RemoveRaceStartDivineSkillResetPendingTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_RaceStartDivineSkillResetPendingTag);
}
}
void __MonitorRaceStartDivineSkillResetPendingTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_RaceStartDivineSkillResetPendingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRaceStartDivineSkillResetPendingTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_RaceStartDivineSkillResetPendingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRaceStartDivineSkillResetPendingTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_RaceStartDivineSkillResetPendingTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_OverrideDivineLiteraryType
{
UFUNCTION()
bool HasOverrideDivineLiteraryType(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OverrideDivineLiteraryType);
}
FC_OverrideDivineLiteraryType& AssignOverrideDivineLiteraryType(const FECSEntity &inout Entity, const FC_OverrideDivineLiteraryType &inout DefaultValue = FC_OverrideDivineLiteraryType())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OverrideDivineLiteraryType, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOverrideDivineLiteraryType_BP(const FECSEntity &inout Entity, const FC_OverrideDivineLiteraryType &inout DefaultValue = FC_OverrideDivineLiteraryType())
{
    ECSFunc_FC_OverrideDivineLiteraryType::AssignOverrideDivineLiteraryType(Entity, DefaultValue);
    return;
}
FC_OverrideDivineLiteraryType& ModifyOverrideDivineLiteraryType(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OverrideDivineLiteraryType));
    return local_12.GetComp();
}
FC_OverrideDivineLiteraryType& ModifyOrAddOverrideDivineLiteraryType(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OverrideDivineLiteraryType));
    return local_12.GetComp();
}
const FC_OverrideDivineLiteraryType& GetOverrideDivineLiteraryType(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OverrideDivineLiteraryType));
    return local_12.GetComp();
}
UFUNCTION()
FC_OverrideDivineLiteraryType GetOverrideDivineLiteraryType_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_OverrideDivineLiteraryType& local_4 = ECSFunc_FC_OverrideDivineLiteraryType::GetOverrideDivineLiteraryType(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_OverrideDivineLiteraryType();
}
const FC_OverrideDivineLiteraryType GetDefaultedOverrideDivineLiteraryType(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OverrideDivineLiteraryType __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OverrideDivineLiteraryType);
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
FC_OverrideDivineLiteraryType GetDefaultedOverrideDivineLiteraryType_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_OverrideDivineLiteraryType::GetDefaultedOverrideDivineLiteraryType(Entity);
}
UFUNCTION()
bool RemoveOverrideDivineLiteraryType(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OverrideDivineLiteraryType);
}
}
FECSMonitorRuntimeView __GetMonitorOverrideDivineLiteraryTypeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OverrideDivineLiteraryType, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideDivineLiteraryTypeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OverrideDivineLiteraryType, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideDivineLiteraryTypeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OverrideDivineLiteraryType, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideDivineLiteraryTypeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OverrideDivineLiteraryType, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOverrideDivineLiteraryTypeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OverrideDivineLiteraryType, bFixedFrame, bMustHandleAll);
}
void __MonitorOverrideDivineLiteraryTypeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OverrideDivineLiteraryType, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOverrideDivineLiteraryTypeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OverrideDivineLiteraryType, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOverrideDivineLiteraryTypeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OverrideDivineLiteraryType, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDivineSkillCDSnapshot &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDivineSkillCDSnapshot &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDivineSkillCDSnapshot
{
int __IndexOf_SnapshotTime()
{
    return 0;
}
int __IndexOf_CDEndTime()
{
    return 1;
}
int __IndexOf_CDDuration()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DivineSkill &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DivineSkill &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DivineSkill &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DivineSkill
{
int __IndexOf_bHasSuitableCharacter()
{
    return 0;
}
int __IndexOf_DivineSkillData()
{
    return 1;
}
int __IndexOf_ModifierIdByPawnEntityId()
{
    return 2;
}
int __IndexOf_CapabilityIdByPawnEntityId()
{
    return 3;
}
int __IndexOf_CDSnapshot()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_OverrideDivineLiteraryType &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_OverrideDivineLiteraryType &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_OverrideDivineLiteraryType &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_OverrideDivineLiteraryType
{
int __IndexOf_DivineLiteraryType()
{
    return 0;
}
}
