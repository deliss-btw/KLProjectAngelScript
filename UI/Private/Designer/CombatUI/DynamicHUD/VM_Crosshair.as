
namespace FVMS_Crosshair
{
    const int ModelId = 0;

}
struct FVMS_Crosshair : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    bool m_IsPlayerAiming;
    UPROPERTY()
    float32 m_ChargeEnergyMax;
    UPROPERTY()
    float32 m_ChargeEnergy;
    UPROPERTY()
    bool m_IsCharging;
    UPROPERTY()
    bool m_bShowRemoveMarkHint;
    UPROPERTY()
    bool m_bShowAddMarkHint;
    UPROPERTY()
    FMW_AttributeRatio m_ChargeEnergySource;
    UPROPERTY()
    FMW_GameplayTagHas m_CrossbowTagSource;
    UPROPERTY()
    float32 m_RemoveMarkHintRefreshInterval;
    UPROPERTY()
    FEUITimerHandle m_RemoveMarkHintRefreshTimer;

    FVMS_Crosshair()
    {
        this.m_IsPlayerAiming = false;
        this.m_ChargeEnergyMax = 0.0f;
        this.m_ChargeEnergy = 0.0f;
        this.m_IsCharging = false;
        this.m_bShowRemoveMarkHint = false;
        this.m_bShowAddMarkHint = false;
        this.m_RemoveMarkHintRefreshInterval = 0.25f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_Crosshair(const FVMS_Crosshair &inout Other)
    {
        this.m_IsPlayerAiming = false;
        this.m_ChargeEnergyMax = 0.0f;
        this.m_ChargeEnergy = 0.0f;
        this.m_IsCharging = false;
        this.m_bShowRemoveMarkHint = false;
        this.m_bShowAddMarkHint = false;
        this.m_RemoveMarkHintRefreshInterval = 0.25f;
        this.m_IsPlayerAiming = Other.m_IsPlayerAiming;
        this.m_ChargeEnergyMax = Other.m_ChargeEnergyMax;
        this.m_ChargeEnergy = Other.m_ChargeEnergy;
        this.m_IsCharging = Other.m_IsCharging;
        this.m_bShowRemoveMarkHint = Other.m_bShowRemoveMarkHint;
        this.m_bShowAddMarkHint = Other.m_bShowAddMarkHint;
        this.m_ChargeEnergySource = Other.m_ChargeEnergySource;
        this.m_CrossbowTagSource = Other.m_CrossbowTagSource;
        this.m_RemoveMarkHintRefreshInterval = Other.m_RemoveMarkHintRefreshInterval;
        this.m_RemoveMarkHintRefreshTimer = Other.m_RemoveMarkHintRefreshTimer;
        return;
    }
    FVMS_Crosshair& opAssign(const FVMS_Crosshair &inout Other)
    {
        this.m_IsPlayerAiming = Other.m_IsPlayerAiming;
        this.m_ChargeEnergyMax = Other.m_ChargeEnergyMax;
        this.m_ChargeEnergy = Other.m_ChargeEnergy;
        this.m_IsCharging = Other.m_IsCharging;
        this.m_bShowRemoveMarkHint = Other.m_bShowRemoveMarkHint;
        this.m_bShowAddMarkHint = Other.m_bShowAddMarkHint;
        this.m_ChargeEnergySource = Other.m_ChargeEnergySource;
        this.m_CrossbowTagSource = Other.m_CrossbowTagSource;
        this.m_RemoveMarkHintRefreshInterval = Other.m_RemoveMarkHintRefreshInterval;
        return Other.m_RemoveMarkHintRefreshTimer;
    }
    void SyncCrosshairSources()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        this.GetModify_CrossbowTagSource().SetTag(local_4, GameplayTags::CombatState_Special_Crossbow);
        if (!(local_4.IsValid()))
        {
            this.GetModify_ChargeEnergySource().SetAttribute(ENTITY_NULL, Attribute::ChargeEnergy, Attribute::ChargeEnergyMax);
            return;
        }
        this.GetModify_ChargeEnergySource().SetAttribute(local_4, Attribute::ChargeEnergy, Attribute::ChargeEnergyMax);
        return;
    }
    void RefreshPlayerAimingState()
    {
        if (!(FECSEntity(this.GetContext().GetLocalPlayerPawn()).IsValid()))
        {
            this.SetIsPlayerAiming(false);
            return;
        }
        Get local_14;
        const FC_CharacterPoseState& local_16 = local_14.opCall();
        if (local_16)
        {
            this.SetIsPlayerAiming(local_16.GetbIsAiming());
        }
        else
        {
            this.SetIsPlayerAiming(false);
        }
        return;
    }
    void RefreshChargeEnergyState()
    {
        this.SetChargeEnergy(0.0f);
        this.SetChargeEnergyMax(this.GetChargeEnergySource().GetMaxValue());
        this.SetIsCharging((this.GetChargeEnergy() != 0.0f));
        return;
    }
    void RefreshMarkHintBaseState()
    {
        bool local_10 = false;
        if (!(FECSEntity(this.GetContext().GetLocalPlayerPawn()).IsValid()) || this.TrackConsoleBool(UICommonUtil::CVar_UI_DebugEnableNewSkillCastHint) || local_10)
        {
            this.SetbShowAddMarkHint(false);
            this.SetbShowRemoveMarkHint(false);
            this.ClearTimer(this.GetModify_RemoveMarkHintRefreshTimer());
            return;
        }
        this.SetbShowAddMarkHint(true);
        if (!(this.GetIsPlayerAiming()) || !(this.GetContext().GetLocalPlayer().IsValid()))
        {
            this.SetbShowRemoveMarkHint(false);
            this.ClearTimer(this.GetModify_RemoveMarkHintRefreshTimer());
            return;
        }
        this.ScheduleTick(this.GetModify_RemoveMarkHintRefreshTimer(), n"RefreshRemoveMarkHintByTrace", this.GetRemoveMarkHintRefreshInterval(), 0.0f);
        return;
    }
    void RefreshRemoveMarkHintByTrace()
    {
        if (!(this.CanRefreshRemoveMarkHint()))
        {
            this.SetbShowRemoveMarkHint(false);
            this.ClearTimer(this.GetModify_RemoveMarkHintRefreshTimer());
            return;
        }
        this.SetbShowRemoveMarkHint(::MarkUtil::IsAimingAtSelfMarkOrMarkedEntity(this.GetContext().GetLocalPlayer()));
        return;
    }
    bool CanRefreshRemoveMarkHint() const
    {
        bool local_6 = false;
        bool local_5 = this.GetContext().GetLocalPlayerPawn().IsValid() && !(UICommonUtil::CVar_UI_DebugEnableNewSkillCastHint.GetBool());
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            local_6 = !local_6;
            local_5 = local_6;
        }
        local_5 = local_5 && this.GetIsPlayerAiming();
        return local_5;
    }
    ESlateVisibility bShowRemoveMarkHintAsSlateVisibility() const
    {
        int local_2;
        if (this.bShowRemoveMarkHintAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool bShowRemoveMarkHintAsBool() const
    {
        return this.GetbShowRemoveMarkHint() || false;
    }
    ESlateVisibility bShowAddMarkHintAsSlateVisibility() const
    {
        int local_2;
        if (this.bShowAddMarkHintAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool bShowAddMarkHintAsBool() const
    {
        return this.GetbShowAddMarkHint() || false;
    }
    bool GetIsPlayerAiming() const property
    {
        this.TrackPropertyRead(0);
        return this.m_IsPlayerAiming;
    }
    void SetIsPlayerAiming(const bool __Value) property
    {
        if (!(this.m_IsPlayerAiming) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_IsPlayerAiming = __Value;
        return;
    }
    const float32 GetChargeEnergyMax() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_ChargeEnergyMax() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetChargeEnergyMax(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChargeEnergyMax = __Value;
        return;
    }
    const float32 GetChargeEnergy() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_ChargeEnergy() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetChargeEnergy(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ChargeEnergy = __Value;
        return;
    }
    bool GetIsCharging() const property
    {
        this.TrackPropertyRead(3);
        return this.m_IsCharging;
    }
    void SetIsCharging(const bool __Value) property
    {
        if (!(this.m_IsCharging) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_IsCharging = __Value;
        return;
    }
    bool GetbShowRemoveMarkHint() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bShowRemoveMarkHint;
    }
    void SetbShowRemoveMarkHint(const bool __Value) property
    {
        if (!(this.m_bShowRemoveMarkHint) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bShowRemoveMarkHint = __Value;
        return;
    }
    bool GetbShowAddMarkHint() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bShowAddMarkHint;
    }
    void SetbShowAddMarkHint(const bool __Value) property
    {
        if (!(this.m_bShowAddMarkHint) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bShowAddMarkHint = __Value;
        return;
    }
    const FMW_AttributeRatio GetChargeEnergySource() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FMW_AttributeRatio GetModify_ChargeEnergySource() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetChargeEnergySource(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ChargeEnergySource = __Value;
        return;
    }
    const FMW_GameplayTagHas GetCrossbowTagSource() const property
    {
        const FMW_GameplayTagHas __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FMW_GameplayTagHas GetModify_CrossbowTagSource() property
    {
        FMW_GameplayTagHas __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCrossbowTagSource(const FMW_GameplayTagHas &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CrossbowTagSource = __Value;
        return;
    }
    const float32 GetRemoveMarkHintRefreshInterval() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_RemoveMarkHintRefreshInterval() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetRemoveMarkHintRefreshInterval(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_RemoveMarkHintRefreshInterval = __Value;
        return;
    }
    const FEUITimerHandle GetRemoveMarkHintRefreshTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FEUITimerHandle GetModify_RemoveMarkHintRefreshTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetRemoveMarkHintRefreshTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_RemoveMarkHintRefreshTimer = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_Crosshair
{
    UPROPERTY()
    TEUIModelRef<FVMS_Crosshair> Self;

    __GeneratedProperties_FVMS_Crosshair()
    {
        return;
    }
}

namespace FVMS_Crosshair
{
FVMS_Crosshair& Get(const UObject ContextObject)
{
    return FVMS_Crosshair::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_Crosshair GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_Crosshair __r;
    TEUIModelRef<FVMS_Crosshair> local_6 = TEUIModelRef<FVMS_Crosshair>(EUIInternal::MakeModelWithManager(Manager, FVMS_Crosshair::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bShowRemoveMarkHint";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowAddMarkHint";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_Crosshair>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_Crosshair;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("ChargeEnergySource");
    int local_2_2 = FVMS_Crosshair::__IndexOf_ChargeEnergySource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("CrossbowTagSource");
    int local_2_3 = FVMS_Crosshair::__IndexOf_CrossbowTagSource();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "SyncCrosshairSources";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshPlayerAimingState";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshChargeEnergyState";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshMarkHintBaseState";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_Crosshair;
}
bool __UIGetter_bShowRemoveMarkHint(const FVMS_Crosshair &inout Model)
{
    return Model.GetbShowRemoveMarkHint();
}
bool __UIGetter_bShowAddMarkHint(const FVMS_Crosshair &inout Model)
{
    return Model.GetbShowAddMarkHint();
}
TEUIModelRef<FVMS_Crosshair> __UIGetter_Self(const FVMS_Crosshair &inout Model)
{
    return TEUIModelRef<FVMS_Crosshair>(Model);
}
int __IndexOf_IsPlayerAiming()
{
    return 0;
}
int __IndexOf_ChargeEnergyMax()
{
    return 1;
}
int __IndexOf_ChargeEnergy()
{
    return 2;
}
int __IndexOf_IsCharging()
{
    return 3;
}
int __IndexOf_bShowRemoveMarkHint()
{
    return 4;
}
int __IndexOf_bShowAddMarkHint()
{
    return 5;
}
int __IndexOf_ChargeEnergySource()
{
    return 6;
}
int __IndexOf_CrossbowTagSource()
{
    return 7;
}
int __IndexOf_RemoveMarkHintRefreshInterval()
{
    return 8;
}
int __IndexOf_RemoveMarkHintRefreshTimer()
{
    return 9;
}
}
namespace __GeneratedProperties_FVMS_Crosshair
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
