
enum EShieldType
{
    InherentShield,
    PluginShield,
}

namespace __INTENRAL_FC_Shield_NS
{
    const TECSComponentDerivedPtr<FC_Shield> DerivedPtr = TECSComponentDerivedPtr<FC_Shield>();
    const FC_Shield DefaultValue = FC_Shield();
}
namespace __INTENRAL_FC_ShieldOwner_NS
{
    const TECSComponentDerivedPtr<FC_ShieldOwner> DerivedPtr = TECSComponentDerivedPtr<FC_ShieldOwner>();
    const FC_ShieldOwner DefaultValue = FC_ShieldOwner();
}
namespace __INTENRAL_FCE_ShieldActivateEvent_NS
{
    const TECSEventDerivedPtr<FCE_ShieldActivateEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ShieldActivateEvent>();
}
namespace __INTENRAL_FCE_ShieldDeactivateEvent_NS
{
    const TECSEventDerivedPtr<FCE_ShieldDeactivateEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ShieldDeactivateEvent>();
}
namespace __INTENRAL_FCE_ShieldBrokenEvent_NS
{
    const TECSEventDerivedPtr<FCE_ShieldBrokenEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ShieldBrokenEvent>();
}
namespace __INTENRAL_FCE_ShieldDestroyEvent_NS
{
    const TECSEventDerivedPtr<FCE_ShieldDestroyEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ShieldDestroyEvent>();

}
struct FShieldBaseData
{
    FSubDirtyFlags40 __DirtyFlags;
    UPROPERTY()
    FDamageTypeRatios m_AbsorbRatio;
    UPROPERTY()
    FDamageTypeRatios m_DamageRatio;
    UPROPERTY()
    bool m_bRecoverWhenActive;
    UPROPERTY()
    float32 m_RecoverDelay_Active;
    UPROPERTY()
    float32 m_RecoverValuePerSecond_Active;
    UPROPERTY()
    float32 m_RecoverPercentPerSecond_Active;
    UPROPERTY()
    float32 m_RecoverMaxValue_Active;
    UPROPERTY()
    float32 m_RecoverMaxPercent_Active;
    UPROPERTY()
    bool m_bRecoverWhenDeactive;
    UPROPERTY()
    float32 m_RecoverDelay_Deactive;
    UPROPERTY()
    float32 m_RecoverValuePerSecond_Deactive;
    UPROPERTY()
    float32 m_RecoverPercentPerSecond_Deactive;
    UPROPERTY()
    float32 m_RecoverMaxValue_Deactive;
    UPROPERTY()
    float32 m_RecoverMaxPercent_Deactive;
    UPROPERTY()
    bool m_bDestoryAfterBrokenNonRecoverable;
    UPROPERTY()
    bool m_bRecoverAfterBroken;
    UPROPERTY()
    bool m_bHasRecoverMaxCountAfterBroken;
    UPROPERTY()
    float32 m_RecoverDelay_Broken;
    UPROPERTY()
    float32 m_RecoverMaxValue_Broken;
    UPROPERTY()
    float32 m_RecoverMaxPercent_Broken;
    UPROPERTY()
    float32 m_RecoverCD_Broken;
    UPROPERTY()
    int m_RecoverMaxCount_Broken;

    FShieldBaseData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FShieldBaseData(const FShieldBaseData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FShieldBaseData opAssign(const FShieldBaseData &inout Other)
    {
        FShieldBaseData __r;
        this.SetAbsorbRatio(Other.GetAbsorbRatio());
        this.SetDamageRatio(Other.GetDamageRatio());
        this.SetbRecoverWhenActive(Other.GetbRecoverWhenActive());
        this.SetRecoverDelay_Active(Other.GetRecoverDelay_Active());
        this.SetRecoverValuePerSecond_Active(Other.GetRecoverValuePerSecond_Active());
        this.SetRecoverPercentPerSecond_Active(Other.GetRecoverPercentPerSecond_Active());
        this.SetRecoverMaxValue_Active(Other.GetRecoverMaxValue_Active());
        this.SetRecoverMaxPercent_Active(Other.GetRecoverMaxPercent_Active());
        this.SetbRecoverWhenDeactive(Other.GetbRecoverWhenDeactive());
        this.SetRecoverDelay_Deactive(Other.GetRecoverDelay_Deactive());
        this.SetRecoverValuePerSecond_Deactive(Other.GetRecoverValuePerSecond_Deactive());
        this.SetRecoverPercentPerSecond_Deactive(Other.GetRecoverPercentPerSecond_Deactive());
        this.SetRecoverMaxValue_Deactive(Other.GetRecoverMaxValue_Deactive());
        this.SetRecoverMaxPercent_Deactive(Other.GetRecoverMaxPercent_Deactive());
        this.SetbDestoryAfterBrokenNonRecoverable(Other.GetbDestoryAfterBrokenNonRecoverable());
        this.SetbRecoverAfterBroken(Other.GetbRecoverAfterBroken());
        this.SetbHasRecoverMaxCountAfterBroken(Other.GetbHasRecoverMaxCountAfterBroken());
        this.SetRecoverDelay_Broken(Other.GetRecoverDelay_Broken());
        this.SetRecoverMaxValue_Broken(Other.GetRecoverMaxValue_Broken());
        this.SetRecoverMaxPercent_Broken(Other.GetRecoverMaxPercent_Broken());
        this.SetRecoverCD_Broken(Other.GetRecoverCD_Broken());
        this.SetRecoverMaxCount_Broken(Other.GetRecoverMaxCount_Broken());
        return __r;
    }
    const FDamageTypeRatios GetAbsorbRatio() const property
    {
        const FDamageTypeRatios __r;
        return __r;
    }
    FDamageTypeRatios GetAbsorbRatio() property
    {
        FDamageTypeRatios __r;
        return __r;
    }
    void SetAbsorbRatio(const FDamageTypeRatios &inout __Value) property
    {
        this.m_AbsorbRatio = __Value;
        return;
    }
    FDamageTypeRatios GetDamageRatio() const property
    {
        FDamageTypeRatios __r;
        return __r;
    }
    FDamageTypeRatios GetDamageRatio() property
    {
        FDamageTypeRatios __r;
        return __r;
    }
    void SetDamageRatio(const FDamageTypeRatios &inout __Value) property
    {
        this.m_DamageRatio = __Value;
        return;
    }
    bool GetbRecoverWhenActive() const property
    {
        return this.m_bRecoverWhenActive;
    }
    void SetbRecoverWhenActive(const bool __Value) property
    {
        if (!(this.m_bRecoverWhenActive) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_bRecoverWhenActive = __Value;
        return;
    }
    float32 GetRecoverDelay_Active() const property
    {
        return this.m_RecoverDelay_Active;
    }
    void SetRecoverDelay_Active(const float32 __Value) property
    {
        if (this.m_RecoverDelay_Active == __Value)
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_RecoverDelay_Active = __Value;
        return;
    }
    float32 GetRecoverValuePerSecond_Active() const property
    {
        return this.m_RecoverValuePerSecond_Active;
    }
    void SetRecoverValuePerSecond_Active(const float32 __Value) property
    {
        if (this.m_RecoverValuePerSecond_Active == __Value)
        {
            return;
        }
        this.__MarkDirty(16);
        this.m_RecoverValuePerSecond_Active = __Value;
        return;
    }
    float32 GetRecoverPercentPerSecond_Active() const property
    {
        return this.m_RecoverPercentPerSecond_Active;
    }
    void SetRecoverPercentPerSecond_Active(const float32 __Value) property
    {
        if (this.m_RecoverPercentPerSecond_Active == __Value)
        {
            return;
        }
        this.__MarkDirty(17);
        this.m_RecoverPercentPerSecond_Active = __Value;
        return;
    }
    float32 GetRecoverMaxValue_Active() const property
    {
        return this.m_RecoverMaxValue_Active;
    }
    void SetRecoverMaxValue_Active(const float32 __Value) property
    {
        if (this.m_RecoverMaxValue_Active == __Value)
        {
            return;
        }
        this.__MarkDirty(18);
        this.m_RecoverMaxValue_Active = __Value;
        return;
    }
    float32 GetRecoverMaxPercent_Active() const property
    {
        return this.m_RecoverMaxPercent_Active;
    }
    void SetRecoverMaxPercent_Active(const float32 __Value) property
    {
        if (this.m_RecoverMaxPercent_Active == __Value)
        {
            return;
        }
        this.__MarkDirty(19);
        this.m_RecoverMaxPercent_Active = __Value;
        return;
    }
    bool GetbRecoverWhenDeactive() const property
    {
        return this.m_bRecoverWhenDeactive;
    }
    void SetbRecoverWhenDeactive(const bool __Value) property
    {
        if (!(this.m_bRecoverWhenDeactive) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(20);
        this.m_bRecoverWhenDeactive = __Value;
        return;
    }
    float32 GetRecoverDelay_Deactive() const property
    {
        return this.m_RecoverDelay_Deactive;
    }
    void SetRecoverDelay_Deactive(const float32 __Value) property
    {
        if (this.m_RecoverDelay_Deactive == __Value)
        {
            return;
        }
        this.__MarkDirty(21);
        this.m_RecoverDelay_Deactive = __Value;
        return;
    }
    float32 GetRecoverValuePerSecond_Deactive() const property
    {
        return this.m_RecoverValuePerSecond_Deactive;
    }
    void SetRecoverValuePerSecond_Deactive(const float32 __Value) property
    {
        if (this.m_RecoverValuePerSecond_Deactive == __Value)
        {
            return;
        }
        this.__MarkDirty(22);
        this.m_RecoverValuePerSecond_Deactive = __Value;
        return;
    }
    float32 GetRecoverPercentPerSecond_Deactive() const property
    {
        return this.m_RecoverPercentPerSecond_Deactive;
    }
    void SetRecoverPercentPerSecond_Deactive(const float32 __Value) property
    {
        if (this.m_RecoverPercentPerSecond_Deactive == __Value)
        {
            return;
        }
        this.__MarkDirty(23);
        this.m_RecoverPercentPerSecond_Deactive = __Value;
        return;
    }
    float32 GetRecoverMaxValue_Deactive() const property
    {
        return this.m_RecoverMaxValue_Deactive;
    }
    void SetRecoverMaxValue_Deactive(const float32 __Value) property
    {
        if (this.m_RecoverMaxValue_Deactive == __Value)
        {
            return;
        }
        this.__MarkDirty(24);
        this.m_RecoverMaxValue_Deactive = __Value;
        return;
    }
    float32 GetRecoverMaxPercent_Deactive() const property
    {
        return this.m_RecoverMaxPercent_Deactive;
    }
    void SetRecoverMaxPercent_Deactive(const float32 __Value) property
    {
        if (this.m_RecoverMaxPercent_Deactive == __Value)
        {
            return;
        }
        this.__MarkDirty(25);
        this.m_RecoverMaxPercent_Deactive = __Value;
        return;
    }
    bool GetbDestoryAfterBrokenNonRecoverable() const property
    {
        return this.m_bDestoryAfterBrokenNonRecoverable;
    }
    void SetbDestoryAfterBrokenNonRecoverable(const bool __Value) property
    {
        if (!(this.m_bDestoryAfterBrokenNonRecoverable) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(26);
        this.m_bDestoryAfterBrokenNonRecoverable = __Value;
        return;
    }
    bool GetbRecoverAfterBroken() const property
    {
        return this.m_bRecoverAfterBroken;
    }
    void SetbRecoverAfterBroken(const bool __Value) property
    {
        if (!(this.m_bRecoverAfterBroken) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(27);
        this.m_bRecoverAfterBroken = __Value;
        return;
    }
    bool GetbHasRecoverMaxCountAfterBroken() const property
    {
        return this.m_bHasRecoverMaxCountAfterBroken;
    }
    void SetbHasRecoverMaxCountAfterBroken(const bool __Value) property
    {
        if (!(this.m_bHasRecoverMaxCountAfterBroken) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(28);
        this.m_bHasRecoverMaxCountAfterBroken = __Value;
        return;
    }
    float32 GetRecoverDelay_Broken() const property
    {
        return this.m_RecoverDelay_Broken;
    }
    void SetRecoverDelay_Broken(const float32 __Value) property
    {
        if (this.m_RecoverDelay_Broken == __Value)
        {
            return;
        }
        this.__MarkDirty(29);
        this.m_RecoverDelay_Broken = __Value;
        return;
    }
    float32 GetRecoverMaxValue_Broken() const property
    {
        return this.m_RecoverMaxValue_Broken;
    }
    void SetRecoverMaxValue_Broken(const float32 __Value) property
    {
        if (this.m_RecoverMaxValue_Broken == __Value)
        {
            return;
        }
        this.__MarkDirty(30);
        this.m_RecoverMaxValue_Broken = __Value;
        return;
    }
    float32 GetRecoverMaxPercent_Broken() const property
    {
        return this.m_RecoverMaxPercent_Broken;
    }
    void SetRecoverMaxPercent_Broken(const float32 __Value) property
    {
        if (this.m_RecoverMaxPercent_Broken == __Value)
        {
            return;
        }
        this.__MarkDirty(31);
        this.m_RecoverMaxPercent_Broken = __Value;
        return;
    }
    float32 GetRecoverCD_Broken() const property
    {
        return this.m_RecoverCD_Broken;
    }
    void SetRecoverCD_Broken(const float32 __Value) property
    {
        if (this.m_RecoverCD_Broken == __Value)
        {
            return;
        }
        this.__MarkDirty(32);
        this.m_RecoverCD_Broken = __Value;
        return;
    }
    int GetRecoverMaxCount_Broken() const property
    {
        return this.m_RecoverMaxCount_Broken;
    }
    void SetRecoverMaxCount_Broken(const int __Value) property
    {
        if (this.m_RecoverMaxCount_Broken == __Value)
        {
            return;
        }
        this.__MarkDirty(33);
        this.m_RecoverMaxCount_Broken = __Value;
        return;
    }
}

struct FC_Shield : FECSComponent
{
    FRootDirtyFlags64 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_ShieldOwner;
    UPROPERTY()
    FName m_ShieldName;
    UPROPERTY()
    FShieldBaseData m_BaseData;
    UPROPERTY()
    EShieldType m_ShieldType;
    UPROPERTY()
    FESMCost m_ShieldMaxHP;
    UPROPERTY()
    FESMCost m_ShieldHP;
    UPROPERTY()
    bool m_bShieldActive;
    UPROPERTY()
    bool m_bBroken;
    UPROPERTY()
    FFPTime m_LastTakenDamageTime;
    UPROPERTY()
    FFPTime m_LastBreakRecoverTime;
    UPROPERTY()
    int m_BrokenRecorverCount;
    UPROPERTY()
    FFPTime m_DeactivateTime;
    UPROPERTY()
    FFPTime m_DestroyTime;
    UPROPERTY()
    FFPTime m_AssignTime;

    FC_Shield()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_Shield(const FC_Shield &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_Shield opAssign(const FC_Shield &inout Other)
    {
        FC_Shield __r;
        this.SetShieldOwner(Other.GetShieldOwner());
        this.SetShieldName(Other.GetShieldName());
        this.SetBaseData(Other.GetBaseData());
        this.SetShieldType(Other.GetShieldType());
        this.SetShieldMaxHP(Other.GetShieldMaxHP());
        this.SetShieldHP(Other.GetShieldHP());
        this.SetbShieldActive(Other.GetbShieldActive());
        this.SetbBroken(Other.GetbBroken());
        this.SetLastTakenDamageTime(Other.GetLastTakenDamageTime());
        this.SetLastBreakRecoverTime(Other.GetLastBreakRecoverTime());
        this.SetBrokenRecorverCount(Other.GetBrokenRecorverCount());
        this.SetDeactivateTime(Other.GetDeactivateTime());
        this.SetDestroyTime(Other.GetDestroyTime());
        this.SetAssignTime(Other.GetAssignTime());
        return __r;
    }
    const FECSEntity GetShieldOwner() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ShieldOwner() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetShieldOwner(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ShieldOwner = __Value;
        return;
    }
    FName GetShieldName() const property
    {
        return this.m_ShieldName;
    }
    void SetShieldName(const FName &inout __Value) property
    {
        if ((this.m_ShieldName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ShieldName = __Value;
        return;
    }
    const FShieldBaseData GetBaseData() const property
    {
        const FShieldBaseData __r;
        return __r;
    }
    FShieldBaseData GetBaseData() property
    {
        FShieldBaseData __r;
        return __r;
    }
    void SetBaseData(const FShieldBaseData &inout __Value) property
    {
        this.m_BaseData = __Value;
        return;
    }
    EShieldType GetShieldType() const property
    {
        return this.m_ShieldType;
    }
    void SetShieldType(const EShieldType __Value) property
    {
        if (int(this.m_ShieldType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(36);
        this.m_ShieldType = __Value;
        return;
    }
    const FESMCost GetShieldMaxHP() const property
    {
        const FESMCost __r;
        return __r;
    }
    FESMCost GetModify_ShieldMaxHP() property
    {
        FESMCost __r;
        this.__MarkDirty(37);
        return __r;
    }
    void SetShieldMaxHP(const FESMCost &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(37);
        this.m_ShieldMaxHP = __Value;
        return;
    }
    const FESMCost GetShieldHP() const property
    {
        const FESMCost __r;
        return __r;
    }
    FESMCost GetModify_ShieldHP() property
    {
        FESMCost __r;
        this.__MarkDirty(38);
        return __r;
    }
    void SetShieldHP(const FESMCost &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(38);
        this.m_ShieldHP = __Value;
        return;
    }
    bool GetbShieldActive() const property
    {
        return this.m_bShieldActive;
    }
    void SetbShieldActive(const bool __Value) property
    {
        if (!(this.m_bShieldActive) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(39);
        this.m_bShieldActive = __Value;
        return;
    }
    bool GetbBroken() const property
    {
        return this.m_bBroken;
    }
    void SetbBroken(const bool __Value) property
    {
        if (!(this.m_bBroken) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(40);
        this.m_bBroken = __Value;
        return;
    }
    const FFPTime GetLastTakenDamageTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastTakenDamageTime() property
    {
        FFPTime __r;
        this.__MarkDirty(41);
        return __r;
    }
    void SetLastTakenDamageTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(41);
        this.m_LastTakenDamageTime = __Value;
        return;
    }
    const FFPTime GetLastBreakRecoverTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastBreakRecoverTime() property
    {
        FFPTime __r;
        this.__MarkDirty(42);
        return __r;
    }
    void SetLastBreakRecoverTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(42);
        this.m_LastBreakRecoverTime = __Value;
        return;
    }
    int GetBrokenRecorverCount() const property
    {
        return this.m_BrokenRecorverCount;
    }
    void SetBrokenRecorverCount(const int __Value) property
    {
        if (this.m_BrokenRecorverCount == __Value)
        {
            return;
        }
        this.__MarkDirty(43);
        this.m_BrokenRecorverCount = __Value;
        return;
    }
    const FFPTime GetDeactivateTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_DeactivateTime() property
    {
        FFPTime __r;
        this.__MarkDirty(44);
        return __r;
    }
    void SetDeactivateTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(44);
        this.m_DeactivateTime = __Value;
        return;
    }
    const FFPTime GetDestroyTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_DestroyTime() property
    {
        FFPTime __r;
        this.__MarkDirty(45);
        return __r;
    }
    void SetDestroyTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(45);
        this.m_DestroyTime = __Value;
        return;
    }
    const FFPTime GetAssignTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_AssignTime() property
    {
        FFPTime __r;
        this.__MarkDirty(46);
        return __r;
    }
    void SetAssignTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(46);
        this.m_AssignTime = __Value;
        return;
    }
}

struct FC_ShieldOwner : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, FECSEntityId> m_NamedInherentShields;

    FC_ShieldOwner()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ShieldOwner(const FC_ShieldOwner &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_NamedInherentShields = Other.m_NamedInherentShields;
        return;
    }
    FC_ShieldOwner opAssign(const FC_ShieldOwner &inout Other)
    {
        FC_ShieldOwner __r;
        this.SetNamedInherentShields(Other.GetNamedInherentShields());
        return __r;
    }
    const TMap<FName, FECSEntityId> GetNamedInherentShields() const property
    {
        const TMap<FName, FECSEntityId> __r;
        return __r;
    }
    TMap<FName, FECSEntityId> GetModify_NamedInherentShields() property
    {
        TMap<FName, FECSEntityId> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetNamedInherentShields(const TMap<FName, FECSEntityId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NamedInherentShields = __Value;
        return;
    }
}

struct FCE_ShieldActivateEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName ShieldName;

    FCE_ShieldActivateEvent()
    {
        return;
    }
}

struct FCE_ShieldDeactivateEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName ShieldName;

    FCE_ShieldDeactivateEvent()
    {
        return;
    }
}

struct FCE_ShieldBrokenEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName ShieldName;
    UPROPERTY()
    FECSEntity Attacker;

    FCE_ShieldBrokenEvent()
    {
        return;
    }
}

struct FCE_ShieldDestroyEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName ShieldName;

    FCE_ShieldDestroyEvent()
    {
        return;
    }
}

namespace ECSFunc_FC_Shield
{
UFUNCTION()
bool HasShield(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_Shield);
}
FC_Shield& AssignShield(const FECSEntity &inout Entity, const FC_Shield &inout DefaultValue = FC_Shield())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_Shield, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignShield_BP(const FECSEntity &inout Entity, const FC_Shield &inout DefaultValue = FC_Shield())
{
    ECSFunc_FC_Shield::AssignShield(Entity, DefaultValue);
    return;
}
FC_Shield& ModifyShield(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_Shield));
    return local_12.GetComp();
}
FC_Shield& ModifyOrAddShield(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_Shield));
    return local_12.GetComp();
}
const FC_Shield& GetShield(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_Shield));
    return local_12.GetComp();
}
UFUNCTION()
FC_Shield GetShield_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_Shield& local_4 = ECSFunc_FC_Shield::GetShield(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_Shield();
}
const FC_Shield GetDefaultedShield(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_Shield __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_Shield);
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
FC_Shield GetDefaultedShield_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_Shield::GetDefaultedShield(Entity);
}
UFUNCTION()
bool RemoveShield(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_Shield);
}
}
FECSMonitorRuntimeView __GetMonitorShieldOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_Shield, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorShieldOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_Shield, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorShieldOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_Shield, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorShieldOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_Shield, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorShieldOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_Shield, bFixedFrame, bMustHandleAll);
}
void __MonitorShieldLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_Shield, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorShieldActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_Shield, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorShieldModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_Shield, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ShieldOwner
{
UFUNCTION()
bool HasShieldOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ShieldOwner);
}
FC_ShieldOwner& AssignShieldOwner(const FECSEntity &inout Entity, const FC_ShieldOwner &inout DefaultValue = FC_ShieldOwner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ShieldOwner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignShieldOwner_BP(const FECSEntity &inout Entity, const FC_ShieldOwner &inout DefaultValue = FC_ShieldOwner())
{
    ECSFunc_FC_ShieldOwner::AssignShieldOwner(Entity, DefaultValue);
    return;
}
FC_ShieldOwner& ModifyShieldOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ShieldOwner));
    return local_12.GetComp();
}
FC_ShieldOwner& ModifyOrAddShieldOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ShieldOwner));
    return local_12.GetComp();
}
const FC_ShieldOwner& GetShieldOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ShieldOwner));
    return local_12.GetComp();
}
UFUNCTION()
FC_ShieldOwner GetShieldOwner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ShieldOwner& local_4 = ECSFunc_FC_ShieldOwner::GetShieldOwner(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ShieldOwner();
}
const FC_ShieldOwner GetDefaultedShieldOwner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ShieldOwner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ShieldOwner);
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
FC_ShieldOwner GetDefaultedShieldOwner_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ShieldOwner::GetDefaultedShieldOwner(Entity);
}
UFUNCTION()
bool RemoveShieldOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ShieldOwner);
}
}
FECSMonitorRuntimeView __GetMonitorShieldOwnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ShieldOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorShieldOwnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ShieldOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorShieldOwnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ShieldOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorShieldOwnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ShieldOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorShieldOwnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ShieldOwner, bFixedFrame, bMustHandleAll);
}
void __MonitorShieldOwnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ShieldOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorShieldOwnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ShieldOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorShieldOwnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ShieldOwner, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags40 GetDirtyFlags(FShieldBaseData &inout Data)
{
    FSubDirtyFlags40 __r;
    return __r;
}
void ClearDirtyFlags(FShieldBaseData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FShieldBaseData
{
int __IndexOf_AbsorbRatio()
{
    return 0;
}
int __IndexOf_DamageRatio()
{
    return 7;
}
int __IndexOf_bRecoverWhenActive()
{
    return 14;
}
int __IndexOf_RecoverDelay_Active()
{
    return 15;
}
int __IndexOf_RecoverValuePerSecond_Active()
{
    return 16;
}
int __IndexOf_RecoverPercentPerSecond_Active()
{
    return 17;
}
int __IndexOf_RecoverMaxValue_Active()
{
    return 18;
}
int __IndexOf_RecoverMaxPercent_Active()
{
    return 19;
}
int __IndexOf_bRecoverWhenDeactive()
{
    return 20;
}
int __IndexOf_RecoverDelay_Deactive()
{
    return 21;
}
int __IndexOf_RecoverValuePerSecond_Deactive()
{
    return 22;
}
int __IndexOf_RecoverPercentPerSecond_Deactive()
{
    return 23;
}
int __IndexOf_RecoverMaxValue_Deactive()
{
    return 24;
}
int __IndexOf_RecoverMaxPercent_Deactive()
{
    return 25;
}
int __IndexOf_bDestoryAfterBrokenNonRecoverable()
{
    return 26;
}
int __IndexOf_bRecoverAfterBroken()
{
    return 27;
}
int __IndexOf_bHasRecoverMaxCountAfterBroken()
{
    return 28;
}
int __IndexOf_RecoverDelay_Broken()
{
    return 29;
}
int __IndexOf_RecoverMaxValue_Broken()
{
    return 30;
}
int __IndexOf_RecoverMaxPercent_Broken()
{
    return 31;
}
int __IndexOf_RecoverCD_Broken()
{
    return 32;
}
int __IndexOf_RecoverMaxCount_Broken()
{
    return 33;
}
}
namespace AutoDelta
{
FRootDirtyFlags64 GetDirtyFlags(FC_Shield &inout Data)
{
    FRootDirtyFlags64 __r;
    return __r;
}
void InitDirtyFlags(FC_Shield &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_Shield &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_Shield
{
int __IndexOf_ShieldOwner()
{
    return 0;
}
int __IndexOf_ShieldName()
{
    return 1;
}
int __IndexOf_BaseData()
{
    return 2;
}
int __IndexOf_ShieldType()
{
    return 36;
}
int __IndexOf_ShieldMaxHP()
{
    return 37;
}
int __IndexOf_ShieldHP()
{
    return 38;
}
int __IndexOf_bShieldActive()
{
    return 39;
}
int __IndexOf_bBroken()
{
    return 40;
}
int __IndexOf_LastTakenDamageTime()
{
    return 41;
}
int __IndexOf_LastBreakRecoverTime()
{
    return 42;
}
int __IndexOf_BrokenRecorverCount()
{
    return 43;
}
int __IndexOf_DeactivateTime()
{
    return 44;
}
int __IndexOf_DestroyTime()
{
    return 45;
}
int __IndexOf_AssignTime()
{
    return 46;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ShieldOwner &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ShieldOwner &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ShieldOwner &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ShieldOwner
{
int __IndexOf_NamedInherentShields()
{
    return 0;
}
}
