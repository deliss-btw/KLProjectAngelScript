
enum ESkillBtnProgressType
{
    None,
    CoolDown,
    Attribute,
    Times,
}

namespace FVM_SingleSkillBtn
{
    const int ModelId = 0;
}
namespace FVM_SkillBtnSpecialCountItem
{
    const int ModelId = 0;
}
namespace FVM_SkillBtnSpecialCounts
{
    const int ModelId = 0;
}
namespace FVM_NormalSkillBtn
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenSKillBtnGoTo = FEUIModelCallbackSignature();
}
namespace FVM_SpecialSkillBtn
{
    const int ModelId = 0;
}
namespace FVM_CommonSkillBtn
{
    const int ModelId = 0;
}
namespace FVM_TSkillBtn
{
    const int ModelId = 0;

}
struct FVM_SingleSkillBtn : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FNormalSkillBtnConfig m_SkillBtnConfig;

    FVM_SingleSkillBtn()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SingleSkillBtn(const FVM_SingleSkillBtn &inout Other)
    {
        return;
    }
    FVM_SingleSkillBtn opAssign(const FVM_SingleSkillBtn &inout Other)
    {
        FVM_SingleSkillBtn __r;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    const FNormalSkillBtnConfig GetSkillBtnConfig() const property
    {
        const FNormalSkillBtnConfig __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FNormalSkillBtnConfig GetModify_SkillBtnConfig() property
    {
        FNormalSkillBtnConfig __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSkillBtnConfig(const FNormalSkillBtnConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
}

struct FVM_SkillBtnSpecialCountItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bCharging;

    FVM_SkillBtnSpecialCountItem()
    {
        this.m_bCharging = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SkillBtnSpecialCountItem(const FVM_SkillBtnSpecialCountItem &inout Other)
    {
        this.m_bCharging = false;
        this.m_bCharging = Other.m_bCharging;
        return;
    }
    FVM_SkillBtnSpecialCountItem opAssign(const FVM_SkillBtnSpecialCountItem &inout Other)
    {
        FVM_SkillBtnSpecialCountItem __r;
        this.m_bCharging = Other.m_bCharging;
        return __r;
    }
    int GetUsingSwitch() const
    {
        return this.GetbCharging() ? 1 : 0;
    }
    bool GetbCharging() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bCharging;
    }
    void SetbCharging(const bool __Value) property
    {
        if (!(this.m_bCharging) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bCharging = __Value;
        return;
    }
}

struct FVM_SkillBtnSpecialCounts : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_CharingCount;
    UPROPERTY()
    int m_MaxCount;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>> m_DisplaySpecialCounts;

    FVM_SkillBtnSpecialCounts()
    {
        this.m_CharingCount = 0;
        this.m_MaxCount = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SkillBtnSpecialCounts(const FVM_SkillBtnSpecialCounts &inout Other)
    {
        this.m_CharingCount = 0;
        this.m_MaxCount = 0;
        this.m_CharingCount = int(Other.m_CharingCount);
        this.m_MaxCount = int(Other.m_MaxCount);
        this.m_DisplaySpecialCounts = Other.m_DisplaySpecialCounts;
        return;
    }
    FVM_SkillBtnSpecialCounts& opAssign(const FVM_SkillBtnSpecialCounts &inout Other)
    {
        this.m_CharingCount = int(Other.m_CharingCount);
        this.m_MaxCount = int(Other.m_MaxCount);
        return Other.m_DisplaySpecialCounts;
    }
    void SyncDisplaySpecialCountItems()
    {
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        if (!(::UICommonUtil::IsValidPawnContext(this.GetContext().GetLocalPlayerPawn())))
        {
            return;
        }
        if (this.GetDisplaySpecialCounts().Num() != this.GetMaxCount())
        {
            this.SetDisplaySpecialCounts(TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>>());
            int local_13 = 0;
            for (; local_13 < this.GetMaxCount(); )
            {
                this.GetModify_DisplaySpecialCounts().Add(TEUIModelRef<FVM_SkillBtnSpecialCountItem>(::FVM_SkillBtnSpecialCountItem::Create(this.GetContext().Manager)));
                ++local_13;
            }
        }
        return;
    }
    void RefreshDisplaySpecialCountStates()
    {
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        if (!(::UICommonUtil::IsValidPawnContext(this.GetContext().GetLocalPlayerPawn())))
        {
            return;
        }
        int local_6 = 0;
        for (; local_6 < this.GetDisplaySpecialCounts().Num(); )
        {
            bool local_5 = (local_6 < this.GetCharingCount());
            local_5.SetbCharging();
            ++local_6;
        }
        return;
    }
    int GetCharingCount() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CharingCount;
    }
    void SetCharingCount(const int __Value) property
    {
        if (this.m_CharingCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CharingCount = __Value;
        return;
    }
    int GetMaxCount() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MaxCount;
    }
    void SetMaxCount(const int __Value) property
    {
        if (this.m_MaxCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MaxCount = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>> GetDisplaySpecialCounts() const property
    {
        const TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>> GetModify_DisplaySpecialCounts() property
    {
        TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplaySpecialCounts(const TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplaySpecialCounts = __Value;
        return;
    }
}

struct FVM_NormalSkillBtn : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_BattleBuildEntry> m_ConfigEntry;
    UPROPERTY()
    const USkillConfig m_SkillConfig;
    UPROPERTY()
    FNormalSkillBtnConfig m_SkillBtnConfig;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> m_ConsumableItem;
    UPROPERTY()
    TDataObjectPtr<FDivineSkillConfig> m_DivineSkillConfig;
    UPROPERTY()
    bool m_bOverrideIcon;
    UPROPERTY()
    FSoftBrush m_OverrideIcon;
    UPROPERTY()
    bool m_CachedVisibility;
    UPROPERTY()
    FString m_SkillButtonName;
    UPROPERTY()
    float32 m_SkillCDRatio;
    UPROPERTY()
    float32 m_SkillCDRemainTime;
    UPROPERTY()
    float32 m_EnergyRatio;
    UPROPERTY()
    float32 m_EneryCost;
    UPROPERTY()
    bool m_bShowEnergyCost;
    UPROPERTY()
    bool m_bConsumeItemEnough;
    UPROPERTY()
    bool m_bSkillUsable;
    UPROPERTY()
    bool m_bDivineBurst;
    UPROPERTY()
    bool m_bDivineChaos;
    UPROPERTY()
    int m_WizardEnergyCost;
    UPROPERTY()
    bool m_bShowItemUsableCount;
    UPROPERTY()
    int m_ItemUsableCount;
    UPROPERTY()
    bool m_bDisable;
    UPROPERTY()
    bool m_bRelease;
    UPROPERTY()
    bool m_bReleaseFree;
    UPROPERTY()
    bool m_bReleasePersistent;
    UPROPERTY()
    bool m_bOverrideProgressType;
    UPROPERTY()
    int m_RemnantSlotChangedCounter;
    UPROPERTY()
    ESkillBtnProgressType m_ProgressType;
    UPROPERTY()
    ESkillActiveState m_SkillState;
    UPROPERTY()
    ESkillButtonState m_SkillButtonState;
    UPROPERTY()
    bool m_bOverrideInputAction;
    UPROPERTY()
    bool m_bToggleMode;
    UPROPERTY()
    bool m_bEnableTouchTriggerSkill;
    UPROPERTY()
    bool m_bOverrideInputActionVisibility;
    UPROPERTY()
    ESlateVisibility m_OverrideInputActionVisibility;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ConsumeItemRow;
    UPROPERTY()
    int m_ConsumeItemNumber;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ConsumeSumItem;
    UPROPERTY()
    FEUIInputAction m_InputAction;
    UPROPERTY()
    bool m_bShowEntityBB;
    UPROPERTY()
    int m_ShowEntityBBValue;
    UPROPERTY()
    float32 m_DurationEffectRatioValue;
    UPROPERTY()
    TEUIModelRef<FVM_SkillBtnSpecialCounts> m_SpecialCounts;
    UPROPERTY()
    bool m_bShowSpecialCount;
    UPROPERTY()
    int m_CurSpecialCount;
    UPROPERTY()
    int m_MaxSpecialCount;
    UPROPERTY()
    bool m_bShowRecharging;
    UPROPERTY()
    float32 m_CurRecharging;
    UPROPERTY()
    float32 m_MaxRecharging;
    UPROPERTY()
    FMW_SkillCooldown m_SkillCooldown;
    UPROPERTY()
    FMW_SkillRuntimeState m_SkillRuntime;
    UPROPERTY()
    FMW_EBBInt m_PresentationEntityBB;
    UPROPERTY()
    FMW_EBBInt m_SpecialChargingCount;
    UPROPERTY()
    FMW_AttributeValue m_RechargingValue;
    UPROPERTY()
    FMW_AttributeValue m_RechargingMaxValue;
    UPROPERTY()
    FMW_GameplayTagHas m_DivineChaosTag;
    UPROPERTY()
    FMW_GameplayTagHas m_DivineBurstTag;
    UPROPERTY()
    FMW_TimeProgress m_DurationEffectProgress;

    FVM_NormalSkillBtn()
    {
        this.m_SkillConfig = nullptr;
        this.m_SkillCDRemainTime = 0.0f;
        this.m_bRelease = false;
        this.m_bReleaseFree = false;
        this.m_bReleasePersistent = false;
        this.m_RemnantSlotChangedCounter = 0;
        this.m_bOverrideInputAction = false;
        this.m_bToggleMode = false;
        this.m_bEnableTouchTriggerSkill = false;
        this.m_bShowEntityBB = false;
        this.m_ShowEntityBBValue = 0;
        this.m_bOverrideIcon = false;
        this.m_CachedVisibility = true;
        this.m_SkillCDRatio = 1.0f;
        this.m_EnergyRatio = 1.0f;
        this.m_EneryCost = 0.0f;
        this.m_bShowEnergyCost = false;
        this.m_bConsumeItemEnough = true;
        this.m_bSkillUsable = true;
        this.m_bDivineBurst = false;
        this.m_bDivineChaos = false;
        this.m_WizardEnergyCost = 0;
        this.m_bShowItemUsableCount = true;
        this.m_ItemUsableCount = 1;
        this.m_bDisable = false;
        this.m_bOverrideProgressType = false;
        this.m_ProgressType = ESkillBtnProgressType(0);
        this.m_SkillState = ESkillActiveState(0);
        this.m_SkillButtonState = ESkillButtonState(0);
        this.m_bOverrideInputActionVisibility = false;
        this.m_OverrideInputActionVisibility = ESlateVisibility(0);
        this.m_ConsumeItemNumber = 0;
        this.m_DurationEffectRatioValue = 0.0f;
        this.m_bShowSpecialCount = false;
        this.m_CurSpecialCount = 0;
        this.m_MaxSpecialCount = 5;
        this.m_bShowRecharging = false;
        this.m_CurRecharging = 0.0f;
        this.m_MaxRecharging = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_NormalSkillBtn(const FVM_NormalSkillBtn &inout Other)
    {
        this.m_SkillConfig = nullptr;
        this.m_SkillCDRemainTime = 0.0f;
        this.m_bRelease = false;
        this.m_bReleaseFree = false;
        this.m_bReleasePersistent = false;
        this.m_RemnantSlotChangedCounter = 0;
        this.m_bOverrideInputAction = false;
        this.m_bToggleMode = false;
        this.m_bEnableTouchTriggerSkill = false;
        this.m_bShowEntityBB = false;
        this.m_ShowEntityBBValue = 0;
        this.m_bOverrideIcon = false;
        this.m_CachedVisibility = true;
        this.m_SkillCDRatio = 1.0f;
        this.m_EnergyRatio = 1.0f;
        this.m_EneryCost = 0.0f;
        this.m_bShowEnergyCost = false;
        this.m_bConsumeItemEnough = true;
        this.m_bSkillUsable = true;
        this.m_bDivineBurst = false;
        this.m_bDivineChaos = false;
        this.m_WizardEnergyCost = 0;
        this.m_bShowItemUsableCount = true;
        this.m_ItemUsableCount = 1;
        this.m_bDisable = false;
        this.m_bOverrideProgressType = false;
        this.m_ProgressType = ESkillBtnProgressType(0);
        this.m_SkillState = ESkillActiveState(0);
        this.m_SkillButtonState = ESkillButtonState(0);
        this.m_bOverrideInputActionVisibility = false;
        this.m_OverrideInputActionVisibility = ESlateVisibility(0);
        this.m_ConsumeItemNumber = 0;
        this.m_DurationEffectRatioValue = 0.0f;
        this.m_bShowSpecialCount = false;
        this.m_CurSpecialCount = 0;
        this.m_MaxSpecialCount = 5;
        this.m_bShowRecharging = false;
        this.m_CurRecharging = 0.0f;
        this.m_MaxRecharging = 0.0f;
        this.m_ConfigEntry = Other.m_ConfigEntry;
        this.m_SkillConfig = Other.m_SkillConfig;
        this.m_ConsumableItem = Other.m_ConsumableItem;
        this.m_DivineSkillConfig = Other.m_DivineSkillConfig;
        this.m_bOverrideIcon = Other.m_bOverrideIcon;
        this.m_OverrideIcon = Other.m_OverrideIcon;
        this.m_CachedVisibility = Other.m_CachedVisibility;
        this.m_SkillButtonName = Other.m_SkillButtonName;
        this.m_SkillCDRatio = Other.m_SkillCDRatio;
        this.m_SkillCDRemainTime = Other.m_SkillCDRemainTime;
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_EneryCost = Other.m_EneryCost;
        this.m_bShowEnergyCost = Other.m_bShowEnergyCost;
        this.m_bConsumeItemEnough = Other.m_bConsumeItemEnough;
        this.m_bSkillUsable = Other.m_bSkillUsable;
        this.m_bDivineBurst = Other.m_bDivineBurst;
        this.m_bDivineChaos = Other.m_bDivineChaos;
        this.m_WizardEnergyCost = int(Other.m_WizardEnergyCost);
        this.m_bShowItemUsableCount = Other.m_bShowItemUsableCount;
        this.m_ItemUsableCount = int(Other.m_ItemUsableCount);
        this.m_bDisable = Other.m_bDisable;
        this.m_bRelease = Other.m_bRelease;
        this.m_bReleaseFree = Other.m_bReleaseFree;
        this.m_bReleasePersistent = Other.m_bReleasePersistent;
        this.m_bOverrideProgressType = Other.m_bOverrideProgressType;
        this.m_RemnantSlotChangedCounter = int(Other.m_RemnantSlotChangedCounter);
        this.m_ProgressType = Other.m_ProgressType;
        this.m_SkillState = Other.m_SkillState;
        this.m_SkillButtonState = Other.m_SkillButtonState;
        this.m_bOverrideInputAction = Other.m_bOverrideInputAction;
        this.m_bToggleMode = Other.m_bToggleMode;
        this.m_bEnableTouchTriggerSkill = Other.m_bEnableTouchTriggerSkill;
        this.m_bOverrideInputActionVisibility = Other.m_bOverrideInputActionVisibility;
        this.m_OverrideInputActionVisibility = Other.m_OverrideInputActionVisibility;
        this.m_ConsumeItemRow = Other.m_ConsumeItemRow;
        this.m_ConsumeItemNumber = int(Other.m_ConsumeItemNumber);
        this.m_ConsumeSumItem = Other.m_ConsumeSumItem;
        this.m_InputAction = Other.m_InputAction;
        this.m_bShowEntityBB = Other.m_bShowEntityBB;
        this.m_ShowEntityBBValue = int(Other.m_ShowEntityBBValue);
        this.m_DurationEffectRatioValue = Other.m_DurationEffectRatioValue;
        this.m_SpecialCounts = Other.m_SpecialCounts;
        this.m_bShowSpecialCount = Other.m_bShowSpecialCount;
        this.m_CurSpecialCount = int(Other.m_CurSpecialCount);
        this.m_MaxSpecialCount = int(Other.m_MaxSpecialCount);
        this.m_bShowRecharging = Other.m_bShowRecharging;
        this.m_CurRecharging = Other.m_CurRecharging;
        this.m_MaxRecharging = Other.m_MaxRecharging;
        this.m_SkillCooldown = Other.m_SkillCooldown;
        this.m_SkillRuntime = Other.m_SkillRuntime;
        this.m_PresentationEntityBB = Other.m_PresentationEntityBB;
        this.m_SpecialChargingCount = Other.m_SpecialChargingCount;
        this.m_RechargingValue = Other.m_RechargingValue;
        this.m_RechargingMaxValue = Other.m_RechargingMaxValue;
        this.m_DivineChaosTag = Other.m_DivineChaosTag;
        this.m_DivineBurstTag = Other.m_DivineBurstTag;
        this.m_DurationEffectProgress = Other.m_DurationEffectProgress;
        return;
    }
    FVM_NormalSkillBtn& opAssign(const FVM_NormalSkillBtn &inout Other)
    {
        this.m_ConfigEntry = Other.m_ConfigEntry;
        this.m_SkillConfig = Other.m_SkillConfig;
        this.m_ConsumableItem = Other.m_ConsumableItem;
        this.m_DivineSkillConfig = Other.m_DivineSkillConfig;
        this.m_bOverrideIcon = Other.m_bOverrideIcon;
        this.m_OverrideIcon = Other.m_OverrideIcon;
        this.m_CachedVisibility = Other.m_CachedVisibility;
        this.m_SkillButtonName = Other.m_SkillButtonName;
        this.m_SkillCDRatio = Other.m_SkillCDRatio;
        this.m_SkillCDRemainTime = Other.m_SkillCDRemainTime;
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_EneryCost = Other.m_EneryCost;
        this.m_bShowEnergyCost = Other.m_bShowEnergyCost;
        this.m_bConsumeItemEnough = Other.m_bConsumeItemEnough;
        this.m_bSkillUsable = Other.m_bSkillUsable;
        this.m_bDivineBurst = Other.m_bDivineBurst;
        this.m_bDivineChaos = Other.m_bDivineChaos;
        this.m_WizardEnergyCost = int(Other.m_WizardEnergyCost);
        this.m_bShowItemUsableCount = Other.m_bShowItemUsableCount;
        this.m_ItemUsableCount = int(Other.m_ItemUsableCount);
        this.m_bDisable = Other.m_bDisable;
        this.m_bRelease = Other.m_bRelease;
        this.m_bReleaseFree = Other.m_bReleaseFree;
        this.m_bReleasePersistent = Other.m_bReleasePersistent;
        this.m_bOverrideProgressType = Other.m_bOverrideProgressType;
        this.m_RemnantSlotChangedCounter = int(Other.m_RemnantSlotChangedCounter);
        this.m_ProgressType = Other.m_ProgressType;
        this.m_SkillState = Other.m_SkillState;
        this.m_SkillButtonState = Other.m_SkillButtonState;
        this.m_bOverrideInputAction = Other.m_bOverrideInputAction;
        this.m_bToggleMode = Other.m_bToggleMode;
        this.m_bEnableTouchTriggerSkill = Other.m_bEnableTouchTriggerSkill;
        this.m_bOverrideInputActionVisibility = Other.m_bOverrideInputActionVisibility;
        this.m_OverrideInputActionVisibility = Other.m_OverrideInputActionVisibility;
        this.m_ConsumeItemRow = Other.m_ConsumeItemRow;
        this.m_ConsumeItemNumber = int(Other.m_ConsumeItemNumber);
        this.m_ConsumeSumItem = Other.m_ConsumeSumItem;
        this.m_InputAction = Other.m_InputAction;
        this.m_bShowEntityBB = Other.m_bShowEntityBB;
        this.m_ShowEntityBBValue = int(Other.m_ShowEntityBBValue);
        this.m_DurationEffectRatioValue = Other.m_DurationEffectRatioValue;
        this.m_SpecialCounts = Other.m_SpecialCounts;
        this.m_bShowSpecialCount = Other.m_bShowSpecialCount;
        this.m_CurSpecialCount = int(Other.m_CurSpecialCount);
        this.m_MaxSpecialCount = int(Other.m_MaxSpecialCount);
        this.m_bShowRecharging = Other.m_bShowRecharging;
        this.m_CurRecharging = Other.m_CurRecharging;
        this.m_MaxRecharging = Other.m_MaxRecharging;
        this.m_SkillCooldown = Other.m_SkillCooldown;
        this.m_SkillRuntime = Other.m_SkillRuntime;
        this.m_PresentationEntityBB = Other.m_PresentationEntityBB;
        this.m_SpecialChargingCount = Other.m_SpecialChargingCount;
        this.m_RechargingValue = Other.m_RechargingValue;
        this.m_RechargingMaxValue = Other.m_RechargingMaxValue;
        this.m_DivineChaosTag = Other.m_DivineChaosTag;
        this.m_DivineBurstTag = Other.m_DivineBurstTag;
        return Other.m_DurationEffectProgress;
    }
    ESlateVisibility GetInputActionVisibility() const
    {
        int local_2;
        if (this.GetbOverrideInputActionVisibility())
        {
            local_2 = int(this.GetOverrideInputActionVisibility());
            return ESlateVisibility(local_2);
        }
        if (this.GetSkillBtnConfig().GetShowInputActionVisibility())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    FText GetConsumableItemName() const
    {
        bool local_4;
        FText __return;
        if (int(this.GetSkillBtnConfig().SkillButtonType) != 3)
        {
            local_4 = false;
        }
        else
        {
            TDataObjectPtr<FCombatItemConfig> local_28;
            local_28 = this.GetConsumableItem();
            local_4 = !((local_28 == nullptr));
        }
        if (local_4)
        {
        }
        else
        {
            bool local_53 = this.GetConfigEntry().IsValid();
            if (!(local_53))
            {
                local_53 = false;
            }
            else
            {
                TEUIModelRef<FVM_BattleBuildEntry> local_56 = this.GetConfigEntry();
                local_53 = GetQuickSlot();
            }
            if (local_53)
            {
                TEUIModelRef<FVM_BattleBuildEntry> local_56_2 = this.GetConfigEntry();
            }
            else
            {
                __return = FText();
            }
        }
        return __return;
    }
    bool IsConsumableItem() const
    {
        if (int(this.GetSkillBtnConfig().SkillButtonType) == 3)
        {
            return true;
        }
        return false;
    }
    bool IsNotComsumeableTime() const
    {
        return !(this.IsConsumableItem());
    }
    ESlateVisibility GetSkillUsableVisibility() const
    {
        int local_2;
        if (this.GetbSkillUsable())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetSkillBanVisibility() const
    {
        int local_2;
        if (this.GetbSkillUsable())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 0;
        }
        return ESlateVisibility(local_2);
    }
    FLinearColor GetCommonDamageColor() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FLinearColor __r; return __r;
    }
    FLinearColor GetIconColor() const
    {
        if (!(this.GetbSkillUsable()))
        {
            return FLinearColor(1.0f, 1.0f, 1.0f, 0.5f);
        }
        return FLinearColor(1.0f, 1.0f, 1.0f, 1.0f);
    }
    float32 GetIconAlpha() const
    {
        if (!(this.GetbSkillUsable()))
        {
            return 0.5f;
        }
        return 1.0f;
    }
    FSoftBrush GetIconImage() const
    {
        bool local_1;
        FSoftBrush __return;
        if (this.GetbOverrideIcon())
        {
            return this.GetOverrideIcon();
        }
        if (int(this.GetSkillBtnConfig().SkillButtonType) != 3)
        {
            local_1 = false;
        }
        else
        {
            TDataObjectPtr<FCombatItemConfig> local_28;
            local_28 = this.GetConsumableItem();
            local_1 = !((local_28 == nullptr));
        }
        if (local_1)
        {
        }
        else
        {
            if (this.GetSkillConfig() != nullptr)
            {
                FSkillConfigPresentationData local_172 = FSkillUtils::GetSkillPresentationData(this.GetContext().GetLocalPlayerPawn(), this.GetSkillConfig());
                if (local_172.DefaultIcon.IsSet())
                {
                    return local_172.DefaultIcon;
                }
                __return = this.GetSkillConfig().PresentationData.DefaultIcon;
            }
            else
            {
                __return = FSoftBrush();
            }
        }
        return __return;
    }
    FSoftBrush GetLiteraryImage() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_24;
        local_24 = this.GetDivineSkillConfig();
        if ((!((local_24 == nullptr))))
        {
            TDataObjectPtr<FDivineLiteraryTypeConfig> local_74 = this.GetDivineSkillConfig().opArrow().GetLiteraryTypeConfig();
            if (local_74)
            {
                return local_74.opArrow().LiteraryImage;
            }
        }
        return FSoftBrush();
    }
    FEUIInputAction GetEInputAction() const
    {
        return this.GetInputAction();
    }
    ESlateVisibility GetSkillDisable() const
    {
        int local_2;
        if (this.GetbDisable())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility CDVisibility() const
    {
        if ((int(this.GetProgressType())) == 1)
        {
            if ((this.GetSkillCDRemainTime()) > 0.0f)
            {
                return ESlateVisibility(3);
            }
        }
        return ESlateVisibility(1);
    }
    float32 GetCD() const
    {
        return 1.0f - this.GetSkillCDRatio();
    }
    int GetCDRemainTimer() const
    {
        return FMath::RoundToInt(this.GetSkillCDRemainTime());
    }
    FWidgetTransform GetCDTransform() const
    {
        float32 local_16 = this.GetCD() * 360.0f;
        return FWidgetTransform();
    }
    ESlateVisibility EnergyVisibility() const
    {
        if ((int(this.GetProgressType())) == 2)
        {
            if (this.GetbSkillUsable())
            {
                return ESlateVisibility(1);
            }
            return ESlateVisibility(3);
        }
        return ESlateVisibility(1);
    }
    float32 GetEnergtRatio() const
    {
        return this.GetEnergyRatio();
    }
    ESlateVisibility EnergyCostVisibility() const
    {
        if (this.GetbShowEnergyCost() && (this.GetEneryCost() > 0.0f) && (int(this.GetProgressType()) == 2))
        {
            return ESlateVisibility(3);
        }
        return ESlateVisibility(1);
    }
    FText GetEnergyCostText() const
    {
        FText local_12;
        if (this.GetbShowEnergyCost() && (this.GetEneryCost() > 0.0f) && (int(this.GetProgressType()) == 2))
        {
            local_12 = FText::AsCultureInvariant("{0}");
            return FText::Format(local_12, this.GetEneryCost());
        }
        return local_12;
    }
    bool GetSkillUsable() const
    {
        return this.GetbSkillUsable();
    }
    bool GetDivineBurst() const
    {
        return this.GetbDivineBurst();
    }
    bool GetDivineChaos() const
    {
        return this.GetbDivineChaos();
    }
    int GetEnergyCost() const
    {
        return this.GetWizardEnergyCost();
    }
    int GetItemUsableNum() const
    {
        return this.GetItemUsableCount();
    }
    FText GetRemnantItemUsableNumText() const
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        const FC_RemnantInfo& local_10 = local_8.opCall();
        FText local_16;
        if (local_10)
        {
            local_16 = FText::AsCultureInvariant("Г—{0}");
            return FText::Format(local_16, local_10.GetRemainUsableCount());
        }
        return local_16;
    }
    FText GetItemUsableNumText() const
    {
        FText local_8;
        if (this.GetbShowItemUsableCount() && (this.GetItemUsableCount() >= 0))
        {
            local_8 = FText::AsCultureInvariant("Г—{0}");
            return FText::Format(local_8, this.GetItemUsableCount());
        }
        return local_8;
    }
    int GetItemEmptySwitcher() const
    {
        if (!(this.GetbShowItemUsableCount()) && (this.GetItemUsableCount() == -1))
        {
            return 0;
        }
        return 1;
    }
    int GetItemNumTextSwitcher() const
    {
        if (this.GetbShowItemUsableCount())
        {
            return this.GetItemUsableCount() == 0 ? 0 : 1;
        }
        return 1;
    }
    float32 GetItemActivateState() const
    {
        if (this.GetbShowItemUsableCount())
        {
            return this.GetItemUsableCount() == 0 ? 0.5f : 1.0f;
        }
        return 1.0f;
    }
    ESkillActiveState GetSkillActiveState() const
    {
        return this.GetSkillState();
    }
    ESkillButtonState GetSkillBtnState() const
    {
        return this.GetSkillButtonState();
    }
    ESlateVisibility BtnVisibility() const
    {
        int local_2;
        if (this.GetCachedVisibility())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetShowEntityBBVisibility() const
    {
        int local_2;
        if (this.GetbShowEntityBB())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    int GetShowEntityBBVar() const
    {
        return this.GetbShowEntityBB() ? this.GetShowEntityBBValue() : 0;
    }
    ESlateVisibility GetShowDurationEffect() const
    {
        int local_13;
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        Get local_8;
        const FC_SkillBtnDurationEffect& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.Contains(this.GetSkillBtnConfig().SkillSlot))
            {
                local_13 = 0;
            }
            else
            {
                local_13 = 1;
            }
            return ESlateVisibility(local_13);
        }
        return ESlateVisibility(1);
    }
    float32 GetDurationEffectRatio() const
    {
        return this.GetDurationEffectRatioValue();
    }
    ESlateVisibility GetShowSpecialCountVM() const
    {
        int local_2;
        if (this.GetbShowSpecialCount())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 2;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetShowRechargingVM() const
    {
        int local_2;
        if (this.GetbShowRecharging())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 2;
        }
        return ESlateVisibility(local_2);
    }
    float32 GetRechargingPercent() const
    {
        if (this.GetbShowRecharging() && ((this.GetMaxRecharging() != 0.0f)))
        {
            return (this.GetCurRecharging() / this.GetMaxRecharging());
        }
        return 0.0f;
    }
    FLinearColor GetRechargingColorTemp() const
    {
        if (this.GetCurRecharging() < this.GetMaxRecharging())
        {
            return FLinearColor(0.8f, 0.8f, 0.2f, 1.0f);
        }
        return FLinearColor(1.0f, 0.6f, 0.1f, 1.0f);
    }
    void PostConstruct()
    {
        this.SetSpecialCounts(TEUIModelRef<FVM_SkillBtnSpecialCounts>(::FVM_SkillBtnSpecialCounts::Create(this.GetContext().Manager)));
        return;
    }
    void SyncSkillWatchSources()
    {
        FECSEntity local_8 = this.GetContext().GetLocalPlayerPawn();
        if (!(this.GetCachedVisibility()) || (local_8 == ENTITY_NULL))
        {
            this.ClearSkillWatchSources();
            return;
        }
        if (int(this.GetSkillBtnConfig().SkillButtonType) == 3 && (this.GetSkillConfig() != nullptr))
        {
            this.GetModify_SkillCooldown().SetSkillByConfig(local_8, this.GetSkillConfig());
            this.GetModify_SkillRuntime().SetSkillByConfig(local_8, this.GetSkillConfig());
        }
        else
        {
            this.GetModify_SkillCooldown().SetSkillBySlot(local_8, ESkillSlot(this.GetSkillBtnConfig().SkillSlot));
            this.GetModify_SkillRuntime().SetSkillBySlot(local_8, ESkillSlot(this.GetSkillBtnConfig().SkillSlot));
        }
        this.GetModify_DivineChaosTag().SetTag(local_8, GameplayTags::CombatState_DivineChaos);
        this.GetModify_DivineBurstTag().SetTag(local_8, GameplayTags::CombatState_DivineBurst);
        return;
    }
    void SyncRuntimeSkillConfig()
    {
        const USkillConfig local_8;
        if (int(this.GetSkillBtnConfig().SkillButtonType) == 3)
        {
            return;
        }
        local_8 = this.GetSkillRuntime().GetSkillConfig();
        if (local_8 == nullptr)
        {
            return;
        }
        if (this.GetSkillConfig() == nullptr || !((this.GetSkillConfig().GetName() == local_8.GetName())))
        {
            this.SetSkillConfig(local_8);
        }
        return;
    }
    void SyncDivineSkillConfig()
    {
        if (!(this.GetCachedVisibility()) || (int(this.GetSkillBtnConfig().SkillButtonType) != 5))
        {
            return;
        }
        if ((this.GetContext().GetLocalPlayer() == ENTITY_NULL))
        {
            return;
        }
        Get local_18;
        const FC_DivineSkill& local_20 = local_18.opCall();
        if (local_20)
        {
            TDataObjectPtr<FDivineSkillConfig> local_44 = local_20.GetDivineSkillData().GetSkillConfig();
            TDataObjectPtr<FDivineSkillConfig> local_68;
            local_68 = this.GetDivineSkillConfig();
            if (!((local_68 == local_44.opImplConv())))
            {
                this.SetDivineSkillConfig(local_44);
            }
        }
        return;
    }
    void RefreshInputAction()
    {
        FECSEntity local_8 = this.GetContext().GetLocalPlayerPawn();
        if (!(this.GetCachedVisibility()) || (local_8 == ENTITY_NULL))
        {
            return;
        }
        if (this.GetbOverrideInputAction() || (int(this.GetSkillBtnConfig().SkillButtonType) == 3))
        {
            return;
        }
        this.SetInputAction(FEUIInputAction(FSkillUtils::GetSkillInputAction(local_8, ESkillSlot(this.GetSkillBtnConfig().SkillSlot))));
        if (int(this.GetSkillBtnConfig().SkillSlot) != 9)
        {
            return;
        }
        if (this.GetSkillRuntime().GetSkillConfig() == nullptr)
        {
            return;
        }
        int local_12 = FSkillUtils::GetSkillIndex(local_8, ESkillSlot(this.GetSkillBtnConfig().SkillSlot));
        if (local_12 == -1)
        {
            return;
        }
        this.SetInputAction(FEUIInputAction(FSkillUtils::GetSkillInputAction(local_8, local_12)));
        return;
    }
    void SyncPresentationWatchSources()
    {
        const USkillConfig local_14;
        FECSEntity local_8 = this.GetContext().GetLocalPlayerPawn();
        if (!(this.GetCachedVisibility()) || (local_8 == ENTITY_NULL))
        {
            this.ClearPresentationWatchSources();
            return;
        }
        local_14 = this.GetSkillRuntime().GetSkillConfig();
        if (local_14 == nullptr)
        {
            this.ClearPresentationWatchSources();
            return;
        }
        FSkillConfigPresentationData local_128 = FSkillUtils::GetSkillPresentationData(local_8, local_14);
        if (!(local_128.SkillEntityBBShow.Name.IsNone()))
        {
            this.GetModify_PresentationEntityBB().SetEBB(local_8, local_128.SkillEntityBBShow.Name);
        }
        else
        {
            this.GetModify_PresentationEntityBB().Reset();
        }
        if (local_128.bShowSpecialCount && !(local_128.SpecialCountBB.Name.IsNone()))
        {
            this.GetModify_SpecialChargingCount().SetEBB(local_8, local_128.SpecialCountBB.Name);
        }
        else
        {
            this.GetModify_SpecialChargingCount().Reset();
        }
        if (local_128.bShowRecharging)
        {
            this.GetModify_RechargingValue().SetAttribute(local_8, local_128.RechargingAttribute);
            if (local_128.CustomRechargingAttributeMax != 0.0f)
            {
                this.GetModify_RechargingMaxValue().Reset();
            }
            else
            {
                this.GetModify_RechargingMaxValue().SetAttribute(local_8, local_128.RechargingAttributeMax);
            }
        }
        else
        {
            this.GetModify_RechargingValue().Reset();
            this.GetModify_RechargingMaxValue().Reset();
        }
        return;
    }
    void SyncDurationEffectSource()
    {
        // body not fully recovered вЂ” stub [unresolved-operand]
    }
    void ClearSkillWatchSources()
    {
        this.GetModify_SkillCooldown().ResetSkill();
        this.GetModify_SkillRuntime().ResetSkill();
        this.GetModify_DivineChaosTag().Reset();
        this.GetModify_DivineBurstTag().Reset();
        this.ClearPresentationWatchSources();
        return;
    }
    void ClearPresentationWatchSources()
    {
        this.GetModify_PresentationEntityBB().Reset();
        this.GetModify_SpecialChargingCount().Reset();
        this.GetModify_RechargingValue().Reset();
        this.GetModify_RechargingMaxValue().Reset();
        return;
    }
    void RefreshSkillRuntimeDisplay()
    {
        if (!(this.GetCachedVisibility()) || (this.GetContext().GetLocalPlayerPawn() == ENTITY_NULL))
        {
            return;
        }
        if (this.GetSkillRuntime().GetSkillConfig() == nullptr)
        {
            return;
        }
        this.SetSkillState(this.GetSkillRuntime().GetActiveState());
        this.SetbDisable(this.GetSkillRuntime().IsDisabled());
        return;
    }
    void RefreshDivineStateDisplay()
    {
        bool local_10 = false;
        bool local_9 = !(this.GetCachedVisibility()) || (this.GetContext().GetLocalPlayerPawn() == ENTITY_NULL);
        if (local_9)
        {
            return;
        }
        if (int(this.GetSkillBtnConfig().SkillButtonType) != 5)
        {
            return;
        }
        this.SetbDivineChaos(local_9);
        this.SetbDivineBurst(local_10);
        return;
    }
    void RefreshProgressDisplay()
    {
        if (!(this.GetCachedVisibility()) || (this.GetContext().GetLocalPlayerPawn() == ENTITY_NULL))
        {
            return;
        }
        this.SetProgressType(ESkillBtnProgressType(0));
        this.SetSkillCDRemainTime(0.0f);
        this.SetEneryCost(0.0f);
        this.SetEnergyRatio(1.0f);
        if (this.GetSkillRuntime().GetSkillConfig() == nullptr)
        {
            return;
        }
        if (this.GetSkillCooldown().GetCooldownDurationSeconds() != 0.0f)
        {
            if (!(this.GetbOverrideProgressType()))
            {
                this.SetProgressType(ESkillBtnProgressType(1));
            }
            this.SetSkillCDRemainTime(this.GetSkillCooldown().GetCooldownRemainSeconds());
            this.SetSkillCDRatio(this.GetSkillCooldown().GetReadyRatio());
            return;
        }
        float32 local_17 = this.GetSkillRuntime().GetEneryCost();
        if (local_17 <= 0.0f)
        {
            return;
        }
        if (!(this.GetbOverrideProgressType()))
        {
            this.SetProgressType(ESkillBtnProgressType(2));
        }
        this.SetEneryCost(local_17);
        this.SetEnergyRatio(this.GetSkillRuntime().GetEnergyRatio());
        return;
    }
    void RefreshPresentationDisplay()
    {
        const USkillConfig local_14;
        int local_241 = 0;
        int local_244 = 0;
        float32 local_247 = 0.0f;
        float32 local_248 = 0.0f;
        float32 local_249;
        FECSEntity local_8 = this.GetContext().GetLocalPlayerPawn();
        if (!(this.GetCachedVisibility()) || (local_8 == ENTITY_NULL))
        {
            return;
        }
        this.SetbShowEntityBB(false);
        local_14 = this.GetSkillRuntime().GetSkillConfig();
        if (local_14 == nullptr)
        {
            return;
        }
        FSkillConfigPresentationData local_128 = FSkillUtils::GetSkillPresentationData(local_8, local_14);
        this.SetbShowEnergyCost(local_128.bShowEneryCost);
        if (!(local_128.SkillEntityBBShow.Name.IsNone()))
        {
            this.SetbShowEntityBB(true);
            this.SetShowEntityBBValue(local_241);
        }
        local_241 = int(local_128.ExtraPresentationState);
        local_241 = local_241 & 1;
        this.SetbReleaseFree((local_241 != 0));
        this.SetbReleasePersistent(((int(local_128.ExtraPresentationState) & 2) != 0));
        this.SetbShowSpecialCount(local_128.bShowSpecialCount);
        if (this.GetbShowSpecialCount() && this.GetSpecialCounts().IsValid())
        {
            TEUIModelRef<FVM_SkillBtnSpecialCounts> local_246 = this.GetSpecialCounts();
            local_244.SetCharingCount();
            int local_242 = int(local_128.MaxSpecialCount);
            TEUIModelRef<FVM_SkillBtnSpecialCounts> local_246_2 = this.GetSpecialCounts();
            local_242.SetMaxCount();
        }
        this.SetbShowRecharging(local_128.bShowRecharging);
        if (this.GetbShowRecharging())
        {
            this.SetCurRecharging(local_247);
            local_247 = local_128.CustomRechargingAttributeMax;
            if (local_247 != 0.0f)
            {
                local_249 = local_128.CustomRechargingAttributeMax;
            }
            else
            {
                local_249 = local_248;
            }
            this.SetMaxRecharging(local_249);
        }
        return;
    }
    void RefreshDurationEffectDisplay()
    {
        this.SetDurationEffectRatioValue(this.GetDurationEffectProgress().GetRemainingRatio());
        return;
    }
    void SyncConsumeRequirement()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(this.GetCachedVisibility()) || (local_4 == ENTITY_NULL) || (this.GetSkillConfig() == nullptr))
        {
            TEUIModelRef<FM_ItemData> local_42;
            this.SetConsumeItemRow(TDataObjectPtr<FItemConfig>(nullptr));
            this.SetConsumeItemNumber(0);
            this.SetConsumeSumItem(local_42);
            this.SetbConsumeItemEnough(true);
            return;
        }
        bool local_43 = false;
        const FC_SkillInstance& local_46 = FSkillUtils::GetSkillInstanceByConfig(local_4, this.GetSkillConfig(), local_43);
        if (!(local_43) || !(local_46.GetConsumeConfig().ConsumeItemRow.IsValid()))
        {
            TEUIModelRef<FM_ItemData> local_42;
            this.SetConsumeItemRow(TDataObjectPtr<FItemConfig>(nullptr));
            this.SetConsumeItemNumber(0);
            this.SetConsumeSumItem(local_42);
            this.SetbConsumeItemEnough(true);
            return;
        }
        this.SetConsumeItemRow(TDataObjectPtr<FItemConfig>(local_46.GetConsumeConfig().ConsumeItemRow));
        this.SetConsumeItemNumber(int(local_46.GetConsumeConfig().ConsumeItemNumber));
        this.SetConsumeSumItem(::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(this.GetConsumeItemRow()));
        return;
    }
    void RefreshConsumeItemEnough()
    {
        int local_54;
        TDataObjectPtr<FItemConfig> local_24;
        local_24 = this.GetConsumeItemRow();
        if ((local_24 == nullptr))
        {
            this.SetbConsumeItemEnough(true);
            return;
        }
        if (this.GetConsumeSumItem().IsValid())
        {
            TEUIModelRef<FM_ItemData> local_52 = this.GetConsumeSumItem();
            local_54 = GetNum();
        }
        else
        {
            local_54 = 0;
        }
        this.SetbConsumeItemEnough((local_54 >= this.GetConsumeItemNumber()));
        return;
    }
    void RefreshSkillUsable()
    {
        bool local_6 = false;
        if (!(this.GetCachedVisibility()))
        {
            return;
        }
        if (this.GetSkillRuntime().GetSkillConfig() == nullptr || (this.GetSkillConfig() == nullptr))
        {
            return;
        }
        bool local_5 = this.GetSkillRuntime().IsUsable() && !(this.GetSkillRuntime().IsDisabled()) && this.GetbConsumeItemEnough();
        if (int(this.GetSkillBtnConfig().SkillButtonType) == 5 && local_6)
        {
            local_5 = false;
        }
        this.SetbSkillUsable(local_5);
        return;
    }
    bool OpenSKillBtnGoTo(const FEUIModelRef &inout NormalSkillBtn)
    {
        int local_4 = 0;
        if (!(NormalSkillBtn.IsValid()))
        {
            return true;
        }
        if (this.GetConfigEntry().IsValid())
        {
            TEUIModelRef<FVM_BattleBuildEntry> local_10 = this.GetConfigEntry();
            OpenBattleBuild();
        }
        else
        {
            if (local_4.GetConfigEntry().IsValid())
            {
                TEUIModelRef<FVM_BattleBuildEntry> local_10_2 = local_4.GetConfigEntry();
                OpenBattleBuild();
            }
        }
        return true;
    }
    FEUIModelRef GetHoverTips()
    {
        FVM_EquipHoverTips& local_2 = ::FVM_EquipHoverTips::Create(this.GetContext().Manager);
        local_2.SetDisplayName(this.GetConsumableItemName());
        local_2.SetEquipLevel(0);
        local_2.SetbIsShowLevel(this.IsNotComsumeableTime());
        local_2.SetClickModelRef(FEUIModelRef(this));
        local_2.GetOnClickGoToCallback().Bind(this, FVM_NormalSkillBtn::OpenSKillBtnGoTo);
        return FEUIModelRef(local_2);
    }
    TEUIModelRef<FVM_BattleBuildEntry> GetConfigEntry() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ConfigEntry;
    }
    void SetConfigEntry(const TEUIModelRef<FVM_BattleBuildEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_BattleBuildEntry> local_2;
        local_2 = this.m_ConfigEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ConfigEntry = __Value;
        return;
    }
    USkillConfig GetSkillConfig() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SkillConfig;
    }
    void SetSkillConfig(const USkillConfig __Value) property
    {
        if (this.m_SkillConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const FNormalSkillBtnConfig GetSkillBtnConfig() const property
    {
        const FNormalSkillBtnConfig __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FNormalSkillBtnConfig GetModify_SkillBtnConfig() property
    {
        FNormalSkillBtnConfig __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSkillBtnConfig(const FNormalSkillBtnConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    const TDataObjectPtr<FCombatItemConfig> GetConsumableItem() const property
    {
        const TDataObjectPtr<FCombatItemConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FCombatItemConfig> GetModify_ConsumableItem() property
    {
        TDataObjectPtr<FCombatItemConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetConsumableItem(const TDataObjectPtr<FCombatItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ConsumableItem = __Value;
        return;
    }
    TDataObjectPtr<FDivineSkillConfig> GetDivineSkillConfig() const property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TDataObjectPtr<FDivineSkillConfig> GetModify_DivineSkillConfig() property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDivineSkillConfig(const TDataObjectPtr<FDivineSkillConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DivineSkillConfig = __Value;
        return;
    }
    bool GetbOverrideIcon() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bOverrideIcon;
    }
    void SetbOverrideIcon(const bool __Value) property
    {
        if (!(this.m_bOverrideIcon) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bOverrideIcon = __Value;
        return;
    }
    const FSoftBrush GetOverrideIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FSoftBrush GetModify_OverrideIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetOverrideIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_OverrideIcon = __Value;
        return;
    }
    bool GetCachedVisibility() const property
    {
        this.TrackPropertyRead(7);
        return this.m_CachedVisibility;
    }
    void SetCachedVisibility(const bool __Value) property
    {
        if (!(this.m_CachedVisibility) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CachedVisibility = __Value;
        return;
    }
    const FString GetSkillButtonName() const property
    {
        const FString __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FString GetModify_SkillButtonName() property
    {
        FString __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetSkillButtonName(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SkillButtonName = __Value;
        return;
    }
    const float32 GetSkillCDRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_SkillCDRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetSkillCDRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SkillCDRatio = __Value;
        return;
    }
    const float32 GetSkillCDRemainTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_SkillCDRemainTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetSkillCDRemainTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SkillCDRemainTime = __Value;
        return;
    }
    float32 GetEnergyRatio() const property
    {
        float32 __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    float32 GetModify_EnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_EnergyRatio = __Value;
        return;
    }
    float32 GetEneryCost() const property
    {
        float32 __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    float32 GetModify_EneryCost() property
    {
        float32 __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetEneryCost(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_EneryCost = __Value;
        return;
    }
    bool GetbShowEnergyCost() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bShowEnergyCost;
    }
    void SetbShowEnergyCost(const bool __Value) property
    {
        if (!(this.m_bShowEnergyCost) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bShowEnergyCost = __Value;
        return;
    }
    bool GetbConsumeItemEnough() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bConsumeItemEnough;
    }
    void SetbConsumeItemEnough(const bool __Value) property
    {
        if (!(this.m_bConsumeItemEnough) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bConsumeItemEnough = __Value;
        return;
    }
    bool GetbSkillUsable() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bSkillUsable;
    }
    void SetbSkillUsable(const bool __Value) property
    {
        if (!(this.m_bSkillUsable) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bSkillUsable = __Value;
        return;
    }
    bool GetbDivineBurst() const property
    {
        this.TrackPropertyRead(16);
        return this.m_bDivineBurst;
    }
    void SetbDivineBurst(const bool __Value) property
    {
        if (!(this.m_bDivineBurst) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_bDivineBurst = __Value;
        return;
    }
    bool GetbDivineChaos() const property
    {
        this.TrackPropertyRead(17);
        return this.m_bDivineChaos;
    }
    void SetbDivineChaos(const bool __Value) property
    {
        if (!(this.m_bDivineChaos) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_bDivineChaos = __Value;
        return;
    }
    int GetWizardEnergyCost() const property
    {
        this.TrackPropertyRead(18);
        return this.m_WizardEnergyCost;
    }
    void SetWizardEnergyCost(const int __Value) property
    {
        if (this.m_WizardEnergyCost == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_WizardEnergyCost = __Value;
        return;
    }
    bool GetbShowItemUsableCount() const property
    {
        this.TrackPropertyRead(19);
        return this.m_bShowItemUsableCount;
    }
    void SetbShowItemUsableCount(const bool __Value) property
    {
        if (!(this.m_bShowItemUsableCount) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_bShowItemUsableCount = __Value;
        return;
    }
    int GetItemUsableCount() const property
    {
        this.TrackPropertyRead(20);
        return this.m_ItemUsableCount;
    }
    void SetItemUsableCount(const int __Value) property
    {
        if (this.m_ItemUsableCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_ItemUsableCount = __Value;
        return;
    }
    bool GetbDisable() const property
    {
        this.TrackPropertyRead(21);
        return this.m_bDisable;
    }
    void SetbDisable(const bool __Value) property
    {
        if (!(this.m_bDisable) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_bDisable = __Value;
        return;
    }
    bool GetbRelease() const property
    {
        this.TrackPropertyRead(22);
        return this.m_bRelease;
    }
    void SetbRelease(const bool __Value) property
    {
        if (!(this.m_bRelease) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_bRelease = __Value;
        return;
    }
    bool GetbReleaseFree() const property
    {
        this.TrackPropertyRead(23);
        return this.m_bReleaseFree;
    }
    void SetbReleaseFree(const bool __Value) property
    {
        if (!(this.m_bReleaseFree) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_bReleaseFree = __Value;
        return;
    }
    bool GetbReleasePersistent() const property
    {
        this.TrackPropertyRead(24);
        return this.m_bReleasePersistent;
    }
    void SetbReleasePersistent(const bool __Value) property
    {
        if (!(this.m_bReleasePersistent) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_bReleasePersistent = __Value;
        return;
    }
    bool GetbOverrideProgressType() const property
    {
        this.TrackPropertyRead(25);
        return this.m_bOverrideProgressType;
    }
    void SetbOverrideProgressType(const bool __Value) property
    {
        if (!(this.m_bOverrideProgressType) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_bOverrideProgressType = __Value;
        return;
    }
    int GetRemnantSlotChangedCounter() const property
    {
        this.TrackPropertyRead(26);
        return this.m_RemnantSlotChangedCounter;
    }
    void SetRemnantSlotChangedCounter(const int __Value) property
    {
        if (this.m_RemnantSlotChangedCounter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_RemnantSlotChangedCounter = __Value;
        return;
    }
    ESkillBtnProgressType GetProgressType() const property
    {
        this.TrackPropertyRead(27);
        return this.m_ProgressType;
    }
    void SetProgressType(const ESkillBtnProgressType __Value) property
    {
        if (int(this.m_ProgressType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_ProgressType = __Value;
        return;
    }
    ESkillActiveState GetSkillState() const property
    {
        this.TrackPropertyRead(28);
        return this.m_SkillState;
    }
    void SetSkillState(const ESkillActiveState __Value) property
    {
        if (int(this.m_SkillState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_SkillState = __Value;
        return;
    }
    ESkillButtonState GetSkillButtonState() const property
    {
        this.TrackPropertyRead(29);
        return this.m_SkillButtonState;
    }
    void SetSkillButtonState(const ESkillButtonState __Value) property
    {
        if (int(this.m_SkillButtonState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_SkillButtonState = __Value;
        return;
    }
    bool GetbOverrideInputAction() const property
    {
        this.TrackPropertyRead(30);
        return this.m_bOverrideInputAction;
    }
    void SetbOverrideInputAction(const bool __Value) property
    {
        if (!(this.m_bOverrideInputAction) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_bOverrideInputAction = __Value;
        return;
    }
    bool GetbToggleMode() const property
    {
        this.TrackPropertyRead(31);
        return this.m_bToggleMode;
    }
    void SetbToggleMode(const bool __Value) property
    {
        if (!(this.m_bToggleMode) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(31);
        this.m_bToggleMode = __Value;
        return;
    }
    bool GetbEnableTouchTriggerSkill() const property
    {
        this.TrackPropertyRead(32);
        return this.m_bEnableTouchTriggerSkill;
    }
    void SetbEnableTouchTriggerSkill(const bool __Value) property
    {
        if (!(this.m_bEnableTouchTriggerSkill) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_bEnableTouchTriggerSkill = __Value;
        return;
    }
    bool GetbOverrideInputActionVisibility() const property
    {
        this.TrackPropertyRead(33);
        return this.m_bOverrideInputActionVisibility;
    }
    void SetbOverrideInputActionVisibility(const bool __Value) property
    {
        if (!(this.m_bOverrideInputActionVisibility) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(33);
        this.m_bOverrideInputActionVisibility = __Value;
        return;
    }
    ESlateVisibility GetOverrideInputActionVisibility() const property
    {
        this.TrackPropertyRead(34);
        return this.m_OverrideInputActionVisibility;
    }
    void SetOverrideInputActionVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_OverrideInputActionVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(34);
        this.m_OverrideInputActionVisibility = __Value;
        return;
    }
    const TDataObjectPtr<FItemConfig> GetConsumeItemRow() const property
    {
        const TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(35);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_ConsumeItemRow() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(35);
        return __r;
    }
    void SetConsumeItemRow(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(35);
        this.m_ConsumeItemRow = __Value;
        return;
    }
    int GetConsumeItemNumber() const property
    {
        this.TrackPropertyRead(36);
        return this.m_ConsumeItemNumber;
    }
    void SetConsumeItemNumber(const int __Value) property
    {
        if (this.m_ConsumeItemNumber == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(36);
        this.m_ConsumeItemNumber = __Value;
        return;
    }
    TEUIModelRef<FM_ItemData> GetConsumeSumItem() const property
    {
        this.TrackPropertyRead(37);
        return this.m_ConsumeSumItem;
    }
    void SetConsumeSumItem(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ConsumeSumItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(37);
        this.m_ConsumeSumItem = __Value;
        return;
    }
    FEUIInputAction GetInputAction() const property
    {
        FEUIInputAction __r;
        this.TrackPropertyRead(38);
        return __r;
    }
    FEUIInputAction GetModify_InputAction() property
    {
        FEUIInputAction __r;
        this.MarkPropertyDirty(38);
        return __r;
    }
    void SetInputAction(const FEUIInputAction &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(38);
        this.m_InputAction = __Value;
        return;
    }
    bool GetbShowEntityBB() const property
    {
        this.TrackPropertyRead(39);
        return this.m_bShowEntityBB;
    }
    void SetbShowEntityBB(const bool __Value) property
    {
        if (!(this.m_bShowEntityBB) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(39);
        this.m_bShowEntityBB = __Value;
        return;
    }
    int GetShowEntityBBValue() const property
    {
        this.TrackPropertyRead(40);
        return this.m_ShowEntityBBValue;
    }
    void SetShowEntityBBValue(const int __Value) property
    {
        if (this.m_ShowEntityBBValue == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(40);
        this.m_ShowEntityBBValue = __Value;
        return;
    }
    const float32 GetDurationEffectRatioValue() const property
    {
        const float32 __r;
        this.TrackPropertyRead(41);
        return __r;
    }
    float32 GetModify_DurationEffectRatioValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(41);
        return __r;
    }
    void SetDurationEffectRatioValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(41);
        this.m_DurationEffectRatioValue = __Value;
        return;
    }
    TEUIModelRef<FVM_SkillBtnSpecialCounts> GetSpecialCounts() const property
    {
        this.TrackPropertyRead(42);
        return this.m_SpecialCounts;
    }
    void SetSpecialCounts(const TEUIModelRef<FVM_SkillBtnSpecialCounts> &inout __Value) property
    {
        TEUIModelRef<FVM_SkillBtnSpecialCounts> local_2;
        local_2 = this.m_SpecialCounts;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(42);
        this.m_SpecialCounts = __Value;
        return;
    }
    bool GetbShowSpecialCount() const property
    {
        this.TrackPropertyRead(43);
        return this.m_bShowSpecialCount;
    }
    void SetbShowSpecialCount(const bool __Value) property
    {
        if (!(this.m_bShowSpecialCount) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(43);
        this.m_bShowSpecialCount = __Value;
        return;
    }
    int GetCurSpecialCount() const property
    {
        this.TrackPropertyRead(44);
        return this.m_CurSpecialCount;
    }
    void SetCurSpecialCount(const int __Value) property
    {
        if (this.m_CurSpecialCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(44);
        this.m_CurSpecialCount = __Value;
        return;
    }
    int GetMaxSpecialCount() const property
    {
        this.TrackPropertyRead(45);
        return this.m_MaxSpecialCount;
    }
    void SetMaxSpecialCount(const int __Value) property
    {
        if (this.m_MaxSpecialCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(45);
        this.m_MaxSpecialCount = __Value;
        return;
    }
    bool GetbShowRecharging() const property
    {
        this.TrackPropertyRead(46);
        return this.m_bShowRecharging;
    }
    void SetbShowRecharging(const bool __Value) property
    {
        if (!(this.m_bShowRecharging) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(46);
        this.m_bShowRecharging = __Value;
        return;
    }
    const float32 GetCurRecharging() const property
    {
        const float32 __r;
        this.TrackPropertyRead(47);
        return __r;
    }
    float32 GetModify_CurRecharging() property
    {
        float32 __r;
        this.MarkPropertyDirty(47);
        return __r;
    }
    void SetCurRecharging(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(47);
        this.m_CurRecharging = __Value;
        return;
    }
    const float32 GetMaxRecharging() const property
    {
        const float32 __r;
        this.TrackPropertyRead(48);
        return __r;
    }
    float32 GetModify_MaxRecharging() property
    {
        float32 __r;
        this.MarkPropertyDirty(48);
        return __r;
    }
    void SetMaxRecharging(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(48);
        this.m_MaxRecharging = __Value;
        return;
    }
    const FMW_SkillCooldown GetSkillCooldown() const property
    {
        const FMW_SkillCooldown __r;
        this.TrackPropertyRead(49);
        return __r;
    }
    FMW_SkillCooldown GetModify_SkillCooldown() property
    {
        FMW_SkillCooldown __r;
        this.MarkPropertyDirty(49);
        return __r;
    }
    void SetSkillCooldown(const FMW_SkillCooldown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(49);
        this.m_SkillCooldown = __Value;
        return;
    }
    const FMW_SkillRuntimeState GetSkillRuntime() const property
    {
        const FMW_SkillRuntimeState __r;
        this.TrackPropertyRead(50);
        return __r;
    }
    FMW_SkillRuntimeState GetModify_SkillRuntime() property
    {
        FMW_SkillRuntimeState __r;
        this.MarkPropertyDirty(50);
        return __r;
    }
    void SetSkillRuntime(const FMW_SkillRuntimeState &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(50);
        this.m_SkillRuntime = __Value;
        return;
    }
    const FMW_EBBInt GetPresentationEntityBB() const property
    {
        const FMW_EBBInt __r;
        this.TrackPropertyRead(51);
        return __r;
    }
    FMW_EBBInt GetModify_PresentationEntityBB() property
    {
        FMW_EBBInt __r;
        this.MarkPropertyDirty(51);
        return __r;
    }
    void SetPresentationEntityBB(const FMW_EBBInt &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(51);
        this.m_PresentationEntityBB = __Value;
        return;
    }
    const FMW_EBBInt GetSpecialChargingCount() const property
    {
        const FMW_EBBInt __r;
        this.TrackPropertyRead(52);
        return __r;
    }
    FMW_EBBInt GetModify_SpecialChargingCount() property
    {
        FMW_EBBInt __r;
        this.MarkPropertyDirty(52);
        return __r;
    }
    void SetSpecialChargingCount(const FMW_EBBInt &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(52);
        this.m_SpecialChargingCount = __Value;
        return;
    }
    const FMW_AttributeValue GetRechargingValue() const property
    {
        const FMW_AttributeValue __r;
        this.TrackPropertyRead(53);
        return __r;
    }
    FMW_AttributeValue GetModify_RechargingValue() property
    {
        FMW_AttributeValue __r;
        this.MarkPropertyDirty(53);
        return __r;
    }
    void SetRechargingValue(const FMW_AttributeValue &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(53);
        this.m_RechargingValue = __Value;
        return;
    }
    const FMW_AttributeValue GetRechargingMaxValue() const property
    {
        const FMW_AttributeValue __r;
        this.TrackPropertyRead(54);
        return __r;
    }
    FMW_AttributeValue GetModify_RechargingMaxValue() property
    {
        FMW_AttributeValue __r;
        this.MarkPropertyDirty(54);
        return __r;
    }
    void SetRechargingMaxValue(const FMW_AttributeValue &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(54);
        this.m_RechargingMaxValue = __Value;
        return;
    }
    const FMW_GameplayTagHas GetDivineChaosTag() const property
    {
        const FMW_GameplayTagHas __r;
        this.TrackPropertyRead(55);
        return __r;
    }
    FMW_GameplayTagHas GetModify_DivineChaosTag() property
    {
        FMW_GameplayTagHas __r;
        this.MarkPropertyDirty(55);
        return __r;
    }
    void SetDivineChaosTag(const FMW_GameplayTagHas &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(55);
        this.m_DivineChaosTag = __Value;
        return;
    }
    const FMW_GameplayTagHas GetDivineBurstTag() const property
    {
        const FMW_GameplayTagHas __r;
        this.TrackPropertyRead(56);
        return __r;
    }
    FMW_GameplayTagHas GetModify_DivineBurstTag() property
    {
        FMW_GameplayTagHas __r;
        this.MarkPropertyDirty(56);
        return __r;
    }
    void SetDivineBurstTag(const FMW_GameplayTagHas &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(56);
        this.m_DivineBurstTag = __Value;
        return;
    }
    const FMW_TimeProgress GetDurationEffectProgress() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(57);
        return __r;
    }
    FMW_TimeProgress GetModify_DurationEffectProgress() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(57);
        return __r;
    }
    void SetDurationEffectProgress(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(57);
        this.m_DurationEffectProgress = __Value;
        return;
    }
}

struct FVM_SpecialSkillBtn : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    const USkillConfig m_SkillConfig;
    UPROPERTY()
    FSpecialSkillBtnConfig m_SkillBtnConfig;

    FVM_SpecialSkillBtn()
    {
        this.m_SkillConfig = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SpecialSkillBtn(const FVM_SpecialSkillBtn &inout Other)
    {
        this.m_SkillConfig = nullptr;
        this.m_SkillConfig = Other.m_SkillConfig;
        return;
    }
    FVM_SpecialSkillBtn opAssign(const FVM_SpecialSkillBtn &inout Other)
    {
        FVM_SpecialSkillBtn __r;
        this.m_SkillConfig = Other.m_SkillConfig;
        return __r;
    }
    FSoftBrush GetBgImage() const
    {
        return this.GetSkillBtnConfig().Bg;
    }
    FSoftBrush GetIconImage() const
    {
        return this.GetSkillBtnConfig().Icon;
    }
    USkillConfig GetSkillConfig() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SkillConfig;
    }
    void SetSkillConfig(const USkillConfig __Value) property
    {
        if (this.m_SkillConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FSpecialSkillBtnConfig GetSkillBtnConfig() const property
    {
        const FSpecialSkillBtnConfig __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSpecialSkillBtnConfig GetModify_SkillBtnConfig() property
    {
        FSpecialSkillBtnConfig __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSkillBtnConfig(const FSpecialSkillBtnConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
}

struct FVM_CommonSkillBtn : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    const USkillConfig m_SkillConfig;
    UPROPERTY()
    FCommonSkillBtnConfig m_SkillBtnConfig;

    FVM_CommonSkillBtn()
    {
        this.m_SkillConfig = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonSkillBtn(const FVM_CommonSkillBtn &inout Other)
    {
        this.m_SkillConfig = nullptr;
        this.m_SkillConfig = Other.m_SkillConfig;
        return;
    }
    FVM_CommonSkillBtn opAssign(const FVM_CommonSkillBtn &inout Other)
    {
        FVM_CommonSkillBtn __r;
        this.m_SkillConfig = Other.m_SkillConfig;
        return __r;
    }
    FSoftBrush GetBgImage() const
    {
        return this.GetSkillBtnConfig().Bg;
    }
    FSoftBrush GetIconImage() const
    {
        return this.GetSkillBtnConfig().Icon;
    }
    USkillConfig GetSkillConfig() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SkillConfig;
    }
    void SetSkillConfig(const USkillConfig __Value) property
    {
        if (this.m_SkillConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FCommonSkillBtnConfig GetSkillBtnConfig() const property
    {
        const FCommonSkillBtnConfig __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FCommonSkillBtnConfig GetModify_SkillBtnConfig() property
    {
        FCommonSkillBtnConfig __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSkillBtnConfig(const FCommonSkillBtnConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
}

struct FVM_TSkillBtn : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    const USkillConfig m_SkillConfig;
    UPROPERTY()
    FTSkillBtnConfig m_SkillBtnConfig;

    FVM_TSkillBtn()
    {
        this.m_SkillConfig = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TSkillBtn(const FVM_TSkillBtn &inout Other)
    {
        this.m_SkillConfig = nullptr;
        this.m_SkillConfig = Other.m_SkillConfig;
        return;
    }
    FVM_TSkillBtn opAssign(const FVM_TSkillBtn &inout Other)
    {
        FVM_TSkillBtn __r;
        this.m_SkillConfig = Other.m_SkillConfig;
        return __r;
    }
    FSoftBrush GetBgImage() const
    {
        return this.GetSkillBtnConfig().Bg;
    }
    FSoftBrush GetIconImage() const
    {
        return this.GetSkillBtnConfig().Icon;
    }
    USkillConfig GetSkillConfig() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SkillConfig;
    }
    void SetSkillConfig(const USkillConfig __Value) property
    {
        if (this.m_SkillConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FTSkillBtnConfig GetSkillBtnConfig() const property
    {
        const FTSkillBtnConfig __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FTSkillBtnConfig GetModify_SkillBtnConfig() property
    {
        FTSkillBtnConfig __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSkillBtnConfig(const FTSkillBtnConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
}

struct __GeneratedProperties_FVM_SingleSkillBtn
{
    UPROPERTY()
    TEUIModelRef<FVM_SingleSkillBtn> Self;

    __GeneratedProperties_FVM_SingleSkillBtn()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_SkillBtnSpecialCountItem
{
    UPROPERTY()
    int UsingSwitch;
    UPROPERTY()
    TEUIModelRef<FVM_SkillBtnSpecialCountItem> Self;


}

struct __GeneratedProperties_FVM_SkillBtnSpecialCounts
{
    UPROPERTY()
    TEUIModelRef<FVM_SkillBtnSpecialCounts> Self;

    __GeneratedProperties_FVM_SkillBtnSpecialCounts()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_NormalSkillBtn
{
    UPROPERTY()
    ESlateVisibility InputActionVisibility;
    UPROPERTY()
    FText ConsumableItemName;
    UPROPERTY()
    bool IsConsumableItem;
    UPROPERTY()
    bool IsNotComsumeableTime;
    UPROPERTY()
    ESlateVisibility SkillUsableVisibility;
    UPROPERTY()
    ESlateVisibility SkillBanVisibility;
    UPROPERTY()
    FLinearColor CommonDamageColor;
    UPROPERTY()
    FLinearColor IconColor;
    UPROPERTY()
    float32 IconAlpha;
    UPROPERTY()
    FSoftBrush IconImage;
    UPROPERTY()
    FSoftBrush LiteraryImage;
    UPROPERTY()
    FEUIInputAction EInputAction;
    UPROPERTY()
    ESlateVisibility SkillDisable;
    UPROPERTY()
    ESlateVisibility CDVisibility;
    UPROPERTY()
    float32 CD;
    UPROPERTY()
    int CDRemainTimer;
    UPROPERTY()
    FWidgetTransform CDTransform;
    UPROPERTY()
    ESlateVisibility EnergyVisibility;
    UPROPERTY()
    float32 EnergtRatio;
    UPROPERTY()
    ESlateVisibility EnergyCostVisibility;
    UPROPERTY()
    FText EnergyCostText;
    UPROPERTY()
    bool SkillUsable;
    UPROPERTY()
    bool DivineBurst;
    UPROPERTY()
    bool DivineChaos;
    UPROPERTY()
    int EnergyCost;
    UPROPERTY()
    int ItemUsableNum;
    UPROPERTY()
    FText RemnantItemUsableNumText;
    UPROPERTY()
    FText ItemUsableNumText;
    UPROPERTY()
    int ItemEmptySwitcher;
    UPROPERTY()
    int ItemNumTextSwitcher;
    UPROPERTY()
    float32 ItemActivateState;
    UPROPERTY()
    ESkillActiveState SkillActiveState;
    UPROPERTY()
    ESkillButtonState SkillBtnState;
    UPROPERTY()
    ESlateVisibility BtnVisibility;
    UPROPERTY()
    ESlateVisibility ShowEntityBBVisibility;
    UPROPERTY()
    int ShowEntityBBVar;
    UPROPERTY()
    ESlateVisibility ShowDurationEffect;
    UPROPERTY()
    float32 DurationEffectRatio;
    UPROPERTY()
    ESlateVisibility ShowSpecialCountVM;
    UPROPERTY()
    ESlateVisibility ShowRechargingVM;
    UPROPERTY()
    float32 RechargingPercent;
    UPROPERTY()
    FLinearColor RechargingColorTemp;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> Self;


}

struct __GeneratedProperties_FVM_SpecialSkillBtn
{
    UPROPERTY()
    FSoftBrush BgImage;
    UPROPERTY()
    FSoftBrush IconImage;
    UPROPERTY()
    TEUIModelRef<FVM_SpecialSkillBtn> Self;

    __GeneratedProperties_FVM_SpecialSkillBtn()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_CommonSkillBtn
{
    UPROPERTY()
    FSoftBrush BgImage;
    UPROPERTY()
    FSoftBrush IconImage;
    UPROPERTY()
    TEUIModelRef<FVM_CommonSkillBtn> Self;

    __GeneratedProperties_FVM_CommonSkillBtn()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_TSkillBtn
{
    UPROPERTY()
    FSoftBrush BgImage;
    UPROPERTY()
    FSoftBrush IconImage;
    UPROPERTY()
    TEUIModelRef<FVM_TSkillBtn> Self;

    __GeneratedProperties_FVM_TSkillBtn()
    {
        return;
    }
}

namespace FVM_SingleSkillBtn
{
FVM_SingleSkillBtn& Create(const UObject ContextObject)
{
    return FVM_SingleSkillBtn::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SingleSkillBtn CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SingleSkillBtn __r;
    TEUIModelRef<FVM_SingleSkillBtn> local_6 = TEUIModelRef<FVM_SingleSkillBtn>(EUIInternal::MakeModelWithManager(Manager, FVM_SingleSkillBtn::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SingleSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SingleSkillBtn;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SingleSkillBtn;
}
TEUIModelRef<FVM_SingleSkillBtn> __UIGetter_Self(const FVM_SingleSkillBtn &inout Model)
{
    return TEUIModelRef<FVM_SingleSkillBtn>(Model);
}
int __IndexOf_SkillBtnConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_SingleSkillBtn
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_SkillBtnSpecialCountItem
{
FVM_SkillBtnSpecialCountItem& Create(const UObject ContextObject)
{
    return FVM_SkillBtnSpecialCountItem::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SkillBtnSpecialCountItem CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SkillBtnSpecialCountItem __r;
    TEUIModelRef<FVM_SkillBtnSpecialCountItem> local_6 = TEUIModelRef<FVM_SkillBtnSpecialCountItem>(EUIInternal::MakeModelWithManager(Manager, FVM_SkillBtnSpecialCountItem::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bCharging";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UsingSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SkillBtnSpecialCountItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SkillBtnSpecialCountItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SkillBtnSpecialCountItem;
}
bool __UIGetter_bCharging(const FVM_SkillBtnSpecialCountItem &inout Model)
{
    return Model.GetbCharging();
}
int __UIGetter_UsingSwitch(const FVM_SkillBtnSpecialCountItem &inout Model)
{
    return Model.GetUsingSwitch();
}
TEUIModelRef<FVM_SkillBtnSpecialCountItem> __UIGetter_Self(const FVM_SkillBtnSpecialCountItem &inout Model)
{
    return TEUIModelRef<FVM_SkillBtnSpecialCountItem>(Model);
}
int __IndexOf_bCharging()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_SkillBtnSpecialCountItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_SkillBtnSpecialCounts
{
FVM_SkillBtnSpecialCounts& Create(const UObject ContextObject)
{
    return FVM_SkillBtnSpecialCounts::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SkillBtnSpecialCounts CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SkillBtnSpecialCounts __r;
    TEUIModelRef<FVM_SkillBtnSpecialCounts> local_6 = TEUIModelRef<FVM_SkillBtnSpecialCounts>(EUIInternal::MakeModelWithManager(Manager, FVM_SkillBtnSpecialCounts::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplaySpecialCounts";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SkillBtnSpecialCounts>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SkillBtnSpecialCounts;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "SyncDisplaySpecialCountItems";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshDisplaySpecialCountStates";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SkillBtnSpecialCounts;
}
TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>> __UIGetter_DisplaySpecialCounts(const FVM_SkillBtnSpecialCounts &inout Model)
{
    return Model.GetDisplaySpecialCounts();
}
TEUIModelRef<FVM_SkillBtnSpecialCounts> __UIGetter_Self(const FVM_SkillBtnSpecialCounts &inout Model)
{
    return TEUIModelRef<FVM_SkillBtnSpecialCounts>(Model);
}
int __IndexOf_CharingCount()
{
    return 0;
}
int __IndexOf_MaxCount()
{
    return 1;
}
int __IndexOf_DisplaySpecialCounts()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_SkillBtnSpecialCounts
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_NormalSkillBtn
{
FVM_NormalSkillBtn& Create(const UObject ContextObject)
{
    return FVM_NormalSkillBtn::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_NormalSkillBtn CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_NormalSkillBtn __r;
    TEUIModelRef<FVM_NormalSkillBtn> local_6 = TEUIModelRef<FVM_NormalSkillBtn>(EUIInternal::MakeModelWithManager(Manager, FVM_NormalSkillBtn::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InputActionVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ConsumableItemName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsConsumableItem";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNotComsumeableTime";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillUsableVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillBanVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommonDamageColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconAlpha";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LiteraryImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EInputAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillDisable";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CDVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CD";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CDRemainTimer";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CDTransform";
    local_14.TypeName = "FWidgetTransform";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EnergyVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EnergtRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EnergyCostVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EnergyCostText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillUsable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DivineBurst";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DivineChaos";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EnergyCost";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemUsableNum";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemnantItemUsableNumText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemUsableNumText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemEmptySwitcher";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemNumTextSwitcher";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemActivateState";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillActiveState";
    local_14.TypeName = "ESkillActiveState";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillBtnState";
    local_14.TypeName = "ESkillButtonState";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowEntityBBVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowEntityBBVar";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowDurationEffect";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DurationEffectRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpecialCounts";
    local_14.TypeName = "TEUIModelRef<FVM_SkillBtnSpecialCounts>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowSpecialCountVM";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowRechargingVM";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RechargingPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RechargingColorTemp";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_NormalSkillBtn;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("SkillCooldown");
    int local_2_2 = FVM_NormalSkillBtn::__IndexOf_SkillCooldown();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("SkillRuntime");
    int local_2_3 = FVM_NormalSkillBtn::__IndexOf_SkillRuntime();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("PresentationEntityBB");
    int local_2_4 = FVM_NormalSkillBtn::__IndexOf_PresentationEntityBB();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("SpecialChargingCount");
    int local_2_5 = FVM_NormalSkillBtn::__IndexOf_SpecialChargingCount();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("RechargingValue");
    int local_2_6 = FVM_NormalSkillBtn::__IndexOf_RechargingValue();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("RechargingMaxValue");
    int local_2_7 = FVM_NormalSkillBtn::__IndexOf_RechargingMaxValue();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("DivineChaosTag");
    int local_2_8 = FVM_NormalSkillBtn::__IndexOf_DivineChaosTag();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("DivineBurstTag");
    int local_2_9 = FVM_NormalSkillBtn::__IndexOf_DivineBurstTag();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("DurationEffectProgress");
    int local_2_10 = FVM_NormalSkillBtn::__IndexOf_DurationEffectProgress();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "SyncSkillWatchSources";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "SyncRuntimeSkillConfig";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "SyncDivineSkillConfig";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshInputAction";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "SyncPresentationWatchSources";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "SyncDurationEffectSource";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshSkillRuntimeDisplay";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshDivineStateDisplay";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshProgressDisplay";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshPresentationDisplay";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshDurationEffectDisplay";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "SyncConsumeRequirement";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshConsumeItemEnough";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshSkillUsable";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_NormalSkillBtn;
}
ESlateVisibility __UIGetter_InputActionVisibility(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetInputActionVisibility();
}
FText __UIGetter_ConsumableItemName(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetConsumableItemName();
}
bool __UIGetter_IsConsumableItem(const FVM_NormalSkillBtn &inout Model)
{
    return Model.IsConsumableItem();
}
bool __UIGetter_IsNotComsumeableTime(const FVM_NormalSkillBtn &inout Model)
{
    return Model.IsNotComsumeableTime();
}
ESlateVisibility __UIGetter_SkillUsableVisibility(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetSkillUsableVisibility();
}
ESlateVisibility __UIGetter_SkillBanVisibility(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetSkillBanVisibility();
}
FLinearColor __UIGetter_CommonDamageColor(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetCommonDamageColor();
}
FLinearColor __UIGetter_IconColor(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetIconColor();
}
float32 __UIGetter_IconAlpha(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetIconAlpha();
}
FSoftBrush __UIGetter_IconImage(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetIconImage();
}
FSoftBrush __UIGetter_LiteraryImage(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetLiteraryImage();
}
FEUIInputAction __UIGetter_EInputAction(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetEInputAction();
}
ESlateVisibility __UIGetter_SkillDisable(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetSkillDisable();
}
ESlateVisibility __UIGetter_CDVisibility(const FVM_NormalSkillBtn &inout Model)
{
    return Model.CDVisibility();
}
float32 __UIGetter_CD(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetCD();
}
int __UIGetter_CDRemainTimer(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetCDRemainTimer();
}
FWidgetTransform __UIGetter_CDTransform(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetCDTransform();
}
ESlateVisibility __UIGetter_EnergyVisibility(const FVM_NormalSkillBtn &inout Model)
{
    return Model.EnergyVisibility();
}
float32 __UIGetter_EnergtRatio(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetEnergtRatio();
}
ESlateVisibility __UIGetter_EnergyCostVisibility(const FVM_NormalSkillBtn &inout Model)
{
    return Model.EnergyCostVisibility();
}
FText __UIGetter_EnergyCostText(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetEnergyCostText();
}
bool __UIGetter_SkillUsable(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetSkillUsable();
}
bool __UIGetter_DivineBurst(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetDivineBurst();
}
bool __UIGetter_DivineChaos(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetDivineChaos();
}
int __UIGetter_EnergyCost(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetEnergyCost();
}
int __UIGetter_ItemUsableNum(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetItemUsableNum();
}
FText __UIGetter_RemnantItemUsableNumText(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetRemnantItemUsableNumText();
}
FText __UIGetter_ItemUsableNumText(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetItemUsableNumText();
}
int __UIGetter_ItemEmptySwitcher(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetItemEmptySwitcher();
}
int __UIGetter_ItemNumTextSwitcher(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetItemNumTextSwitcher();
}
float32 __UIGetter_ItemActivateState(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetItemActivateState();
}
ESkillActiveState __UIGetter_SkillActiveState(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetSkillActiveState();
}
ESkillButtonState __UIGetter_SkillBtnState(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetSkillBtnState();
}
ESlateVisibility __UIGetter_BtnVisibility(const FVM_NormalSkillBtn &inout Model)
{
    return Model.BtnVisibility();
}
ESlateVisibility __UIGetter_ShowEntityBBVisibility(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetShowEntityBBVisibility();
}
int __UIGetter_ShowEntityBBVar(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetShowEntityBBVar();
}
ESlateVisibility __UIGetter_ShowDurationEffect(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetShowDurationEffect();
}
float32 __UIGetter_DurationEffectRatio(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetDurationEffectRatio();
}
TEUIModelRef<FVM_SkillBtnSpecialCounts> __UIGetter_SpecialCounts(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetSpecialCounts();
}
ESlateVisibility __UIGetter_ShowSpecialCountVM(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetShowSpecialCountVM();
}
ESlateVisibility __UIGetter_ShowRechargingVM(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetShowRechargingVM();
}
float32 __UIGetter_RechargingPercent(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetRechargingPercent();
}
FLinearColor __UIGetter_RechargingColorTemp(const FVM_NormalSkillBtn &inout Model)
{
    return Model.GetRechargingColorTemp();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_Self(const FVM_NormalSkillBtn &inout Model)
{
    return TEUIModelRef<FVM_NormalSkillBtn>(Model);
}
int __IndexOf_ConfigEntry()
{
    return 0;
}
int __IndexOf_SkillConfig()
{
    return 1;
}
int __IndexOf_SkillBtnConfig()
{
    return 2;
}
int __IndexOf_ConsumableItem()
{
    return 3;
}
int __IndexOf_DivineSkillConfig()
{
    return 4;
}
int __IndexOf_bOverrideIcon()
{
    return 5;
}
int __IndexOf_OverrideIcon()
{
    return 6;
}
int __IndexOf_CachedVisibility()
{
    return 7;
}
int __IndexOf_SkillButtonName()
{
    return 8;
}
int __IndexOf_SkillCDRatio()
{
    return 9;
}
int __IndexOf_SkillCDRemainTime()
{
    return 10;
}
int __IndexOf_EnergyRatio()
{
    return 11;
}
int __IndexOf_EneryCost()
{
    return 12;
}
int __IndexOf_bShowEnergyCost()
{
    return 13;
}
int __IndexOf_bConsumeItemEnough()
{
    return 14;
}
int __IndexOf_bSkillUsable()
{
    return 15;
}
int __IndexOf_bDivineBurst()
{
    return 16;
}
int __IndexOf_bDivineChaos()
{
    return 17;
}
int __IndexOf_WizardEnergyCost()
{
    return 18;
}
int __IndexOf_bShowItemUsableCount()
{
    return 19;
}
int __IndexOf_ItemUsableCount()
{
    return 20;
}
int __IndexOf_bDisable()
{
    return 21;
}
int __IndexOf_bRelease()
{
    return 22;
}
int __IndexOf_bReleaseFree()
{
    return 23;
}
int __IndexOf_bReleasePersistent()
{
    return 24;
}
int __IndexOf_bOverrideProgressType()
{
    return 25;
}
int __IndexOf_RemnantSlotChangedCounter()
{
    return 26;
}
int __IndexOf_ProgressType()
{
    return 27;
}
int __IndexOf_SkillState()
{
    return 28;
}
int __IndexOf_SkillButtonState()
{
    return 29;
}
int __IndexOf_bOverrideInputAction()
{
    return 30;
}
int __IndexOf_bToggleMode()
{
    return 31;
}
int __IndexOf_bEnableTouchTriggerSkill()
{
    return 32;
}
int __IndexOf_bOverrideInputActionVisibility()
{
    return 33;
}
int __IndexOf_OverrideInputActionVisibility()
{
    return 34;
}
int __IndexOf_ConsumeItemRow()
{
    return 35;
}
int __IndexOf_ConsumeItemNumber()
{
    return 36;
}
int __IndexOf_ConsumeSumItem()
{
    return 37;
}
int __IndexOf_InputAction()
{
    return 38;
}
int __IndexOf_bShowEntityBB()
{
    return 39;
}
int __IndexOf_ShowEntityBBValue()
{
    return 40;
}
int __IndexOf_DurationEffectRatioValue()
{
    return 41;
}
int __IndexOf_SpecialCounts()
{
    return 42;
}
int __IndexOf_bShowSpecialCount()
{
    return 43;
}
int __IndexOf_CurSpecialCount()
{
    return 44;
}
int __IndexOf_MaxSpecialCount()
{
    return 45;
}
int __IndexOf_bShowRecharging()
{
    return 46;
}
int __IndexOf_CurRecharging()
{
    return 47;
}
int __IndexOf_MaxRecharging()
{
    return 48;
}
int __IndexOf_SkillCooldown()
{
    return 49;
}
int __IndexOf_SkillRuntime()
{
    return 50;
}
int __IndexOf_PresentationEntityBB()
{
    return 51;
}
int __IndexOf_SpecialChargingCount()
{
    return 52;
}
int __IndexOf_RechargingValue()
{
    return 53;
}
int __IndexOf_RechargingMaxValue()
{
    return 54;
}
int __IndexOf_DivineChaosTag()
{
    return 55;
}
int __IndexOf_DivineBurstTag()
{
    return 56;
}
int __IndexOf_DurationEffectProgress()
{
    return 57;
}
}
namespace __GeneratedProperties_FVM_NormalSkillBtn
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_SpecialSkillBtn
{
FVM_SpecialSkillBtn& Create(const UObject ContextObject)
{
    return FVM_SpecialSkillBtn::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SpecialSkillBtn CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SpecialSkillBtn __r;
    TEUIModelRef<FVM_SpecialSkillBtn> local_6 = TEUIModelRef<FVM_SpecialSkillBtn>(EUIInternal::MakeModelWithManager(Manager, FVM_SpecialSkillBtn::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BgImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SpecialSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SpecialSkillBtn;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SpecialSkillBtn;
}
FSoftBrush __UIGetter_BgImage(const FVM_SpecialSkillBtn &inout Model)
{
    return Model.GetBgImage();
}
FSoftBrush __UIGetter_IconImage(const FVM_SpecialSkillBtn &inout Model)
{
    return Model.GetIconImage();
}
TEUIModelRef<FVM_SpecialSkillBtn> __UIGetter_Self(const FVM_SpecialSkillBtn &inout Model)
{
    return TEUIModelRef<FVM_SpecialSkillBtn>(Model);
}
int __IndexOf_SkillConfig()
{
    return 0;
}
int __IndexOf_SkillBtnConfig()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_SpecialSkillBtn
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonSkillBtn
{
FVM_CommonSkillBtn& Create(const UObject ContextObject)
{
    return FVM_CommonSkillBtn::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonSkillBtn CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonSkillBtn __r;
    TEUIModelRef<FVM_CommonSkillBtn> local_6 = TEUIModelRef<FVM_CommonSkillBtn>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonSkillBtn::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BgImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonSkillBtn;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonSkillBtn;
}
FSoftBrush __UIGetter_BgImage(const FVM_CommonSkillBtn &inout Model)
{
    return Model.GetBgImage();
}
FSoftBrush __UIGetter_IconImage(const FVM_CommonSkillBtn &inout Model)
{
    return Model.GetIconImage();
}
TEUIModelRef<FVM_CommonSkillBtn> __UIGetter_Self(const FVM_CommonSkillBtn &inout Model)
{
    return TEUIModelRef<FVM_CommonSkillBtn>(Model);
}
int __IndexOf_SkillConfig()
{
    return 0;
}
int __IndexOf_SkillBtnConfig()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CommonSkillBtn
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TSkillBtn
{
FVM_TSkillBtn& Create(const UObject ContextObject)
{
    return FVM_TSkillBtn::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TSkillBtn CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TSkillBtn __r;
    TEUIModelRef<FVM_TSkillBtn> local_6 = TEUIModelRef<FVM_TSkillBtn>(EUIInternal::MakeModelWithManager(Manager, FVM_TSkillBtn::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BgImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TSkillBtn;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TSkillBtn;
}
FSoftBrush __UIGetter_BgImage(const FVM_TSkillBtn &inout Model)
{
    return Model.GetBgImage();
}
FSoftBrush __UIGetter_IconImage(const FVM_TSkillBtn &inout Model)
{
    return Model.GetIconImage();
}
TEUIModelRef<FVM_TSkillBtn> __UIGetter_Self(const FVM_TSkillBtn &inout Model)
{
    return TEUIModelRef<FVM_TSkillBtn>(Model);
}
int __IndexOf_SkillConfig()
{
    return 0;
}
int __IndexOf_SkillBtnConfig()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TSkillBtn
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
