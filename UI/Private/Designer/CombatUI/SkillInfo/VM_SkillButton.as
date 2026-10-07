
enum ESkillProgressType
{
    SkillCoolDown,
    SkillEnergy,
    Attribute,
    Times,
    None,
}

enum ESkillButtonState
{
    Default,
    Active,
    CoolDown,
    Free,
}

namespace FVM_SkillButton
{
    const int ModelId = 0;

}
struct FVM_SkillButton : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    ESkillProgressType m_SkillProgressType;
    UPROPERTY()
    ESkillButtonType m_SkillButtonType;
    UPROPERTY()
    ESkillActiveState m_SkillState;
    UPROPERTY()
    int m_SkillStage;
    UPROPERTY()
    ESkillButtonState m_SkillButtonState;
    UPROPERTY()
    FGameAttributeRef m_SkillProgressAttribute;
    UPROPERTY()
    FGameAttributeRef m_SkillProgressAttributeMax;
    UPROPERTY()
    float32 m_SkillCDRatio;
    UPROPERTY()
    int m_SkillCDRemainTimer;
    UPROPERTY()
    const USkillConfig m_SkillConfig;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> m_ConsumableItem;
    UPROPERTY()
    int m_UsableTime;
    UPROPERTY()
    int m_EnergyCost;
    UPROPERTY()
    bool m_bSkillUsable;
    UPROPERTY()
    bool m_bDivineBurst;
    UPROPERTY()
    bool m_bDivineChaos;

    FVM_SkillButton()
    {
        this.m_SkillConfig = nullptr;
        this.m_EnergyCost = 0;
        this.m_SkillProgressType = ESkillProgressType(0);
        this.m_SkillButtonType = ESkillButtonType(1);
        this.m_SkillState = ESkillActiveState(0);
        this.m_SkillStage = 0;
        this.m_SkillButtonState = ESkillButtonState(0);
        this.m_SkillCDRatio = 1.0f;
        this.m_SkillCDRemainTimer = 0;
        this.m_UsableTime = 1;
        this.m_bSkillUsable = true;
        this.m_bDivineBurst = false;
        this.m_bDivineChaos = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SkillButton(const FVM_SkillButton &inout Other)
    {
        this.m_SkillConfig = nullptr;
        this.m_EnergyCost = 0;
        this.m_SkillProgressType = ESkillProgressType(0);
        this.m_SkillButtonType = ESkillButtonType(1);
        this.m_SkillState = ESkillActiveState(0);
        this.m_SkillStage = 0;
        this.m_SkillButtonState = ESkillButtonState(0);
        this.m_SkillCDRatio = 1.0f;
        this.m_SkillCDRemainTimer = 0;
        this.m_UsableTime = 1;
        this.m_bSkillUsable = true;
        this.m_bDivineBurst = false;
        this.m_bDivineChaos = false;
        this.m_SkillProgressType = Other.m_SkillProgressType;
        this.m_SkillButtonType = Other.m_SkillButtonType;
        this.m_SkillState = Other.m_SkillState;
        this.m_SkillStage = int(Other.m_SkillStage);
        this.m_SkillButtonState = Other.m_SkillButtonState;
        this.m_SkillProgressAttribute = Other.m_SkillProgressAttribute;
        this.m_SkillProgressAttributeMax = Other.m_SkillProgressAttributeMax;
        this.m_SkillCDRatio = Other.m_SkillCDRatio;
        this.m_SkillCDRemainTimer = int(Other.m_SkillCDRemainTimer);
        this.m_SkillConfig = Other.m_SkillConfig;
        this.m_ConsumableItem = Other.m_ConsumableItem;
        this.m_UsableTime = int(Other.m_UsableTime);
        this.m_EnergyCost = int(Other.m_EnergyCost);
        this.m_bSkillUsable = Other.m_bSkillUsable;
        this.m_bDivineBurst = Other.m_bDivineBurst;
        this.m_bDivineChaos = Other.m_bDivineChaos;
        return;
    }
    FVM_SkillButton opAssign(const FVM_SkillButton &inout Other)
    {
        FVM_SkillButton __r;
        this.m_SkillProgressType = Other.m_SkillProgressType;
        this.m_SkillButtonType = Other.m_SkillButtonType;
        this.m_SkillState = Other.m_SkillState;
        this.m_SkillStage = int(Other.m_SkillStage);
        this.m_SkillButtonState = Other.m_SkillButtonState;
        this.m_SkillProgressAttribute = Other.m_SkillProgressAttribute;
        this.m_SkillProgressAttributeMax = Other.m_SkillProgressAttributeMax;
        this.m_SkillCDRatio = Other.m_SkillCDRatio;
        this.m_SkillCDRemainTimer = int(Other.m_SkillCDRemainTimer);
        this.m_SkillConfig = Other.m_SkillConfig;
        this.m_ConsumableItem = Other.m_ConsumableItem;
        this.m_UsableTime = int(Other.m_UsableTime);
        this.m_EnergyCost = int(Other.m_EnergyCost);
        this.m_bSkillUsable = Other.m_bSkillUsable;
        this.m_bDivineBurst = Other.m_bDivineBurst;
        this.m_bDivineChaos = Other.m_bDivineChaos;
        return __r;
    }
    void Tick()
    {
        int local_20 = 0;
        int local_30 = 0;
        FNameHandle_EntityBBVar local_68;
        FNameHandle_EntityBBVarBool local_72;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        FECSEntity local_14 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_14.IsValid()))
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        FECSEntity local_10 = local_20.GetPlayerEntity();
        this.SetSkillCDRemainTimer(99);
        if (this.GetSkillConfig() != nullptr)
        {
            int local_31 = FSkillUtils::GetSkillIndex(local_14, this.GetSkillConfig());
            if (local_31 == -1)
            {
                return;
            }
            if (int(this.GetSkillProgressType()) == 0)
            {
                float32 local_43 = float32((FSkillUtils::GetSkillCDDuration(local_14, local_31).ToSeconds()));
                float32 local_38 = float32((FSkillUtils::GetSkillCDRemainTime(local_14, local_31).ToSeconds()));
                this.SetSkillCDRemainTimer((FMath::FloorToInt(local_38) + 1));
                if (local_43 == 0.0f)
                {
                    local_43 = 1.0f;
                }
                this.SetSkillCDRatio(1.0f - (local_38 / local_43));
            }
            else
            {
                if (int(this.GetSkillProgressType()) == 2)
                {
                    Get local_50;
                    if (local_50.opCall().HasAttribute(this.GetSkillProgressAttribute()) && this.GetSkillProgressAttribute().IsValid())
                    {
                        float32 local_45 = FGameAttributeUtils::GetAttributeValue(local_14, this.GetSkillProgressAttribute(), this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
                        float32 local_44 = FGameAttributeUtils::GetAttributeValue(local_14, this.GetSkillProgressAttributeMax(), this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
                        this.SetSkillCDRemainTimer((FMath::FloorToInt(local_45) + 1));
                        if (local_44 != 0.0f)
                        {
                            this.SetSkillCDRatio(local_45 / local_44);
                        }
                        else
                        {
                            this.SetSkillCDRatio(0.0f);
                        }
                    }
                }
            }
            if (local_30.GetSkillRuntimeInfos().IsValidIndex(local_31))
            {
                this.SetSkillState(local_30.GetSkillRuntimeInfos()[local_31].GetActiveState());
                this.SetSkillStage(local_30.GetSkillRuntimeInfos()[local_31].GetStage());
            }
            if (int(this.GetSkillProgressType()) != 4 && (int(this.GetSkillProgressType()) != 3))
            {
                if (this.GetSkillCDRatio() >= 1.0f)
                {
                    this.SetSkillButtonState(ESkillButtonState(0));
                    local_68;
                    bool local_1 = local_14.HasEntityBB(local_68);
                    if (!(local_1))
                    {
                        local_1 = false;
                    }
                    else
                    {
                        local_72;
                        local_1 = local_14.GetBB_Bool(local_72);
                    }
                    if (local_1)
                    {
                        this.SetSkillButtonState(ESkillButtonState(3));
                    }
                }
                else
                {
                    this.SetSkillButtonState(ESkillButtonState(2));
                }
            }
            if (::FSkillUIUtils::IsSkillConditionSatisfied(local_14, this.GetSkillConfig()))
            {
                this.SetbSkillUsable(true);
            }
            else
            {
                this.SetbSkillUsable(false);
            }
            if (int(this.GetSkillProgressType()) == 3 && !(::FSkillUIUtils::IsConsumeItemEnough(local_14, this.GetSkillConfig())))
            {
                this.SetbSkillUsable(false);
            }
            if (int(this.GetSkillButtonType()) == 5)
            {
                if (local_14.MatchGameplayTag(GameplayTags::CombatState_DivineChaos))
                {
                    this.SetbSkillUsable(false);
                    this.SetbDivineChaos(true);
                }
                else
                {
                    this.SetbDivineChaos(false);
                }
                if (local_14.MatchGameplayTag(GameplayTags::CombatState_DivineBurst))
                {
                    this.SetbDivineBurst(true);
                }
                else
                {
                    this.SetbDivineBurst(false);
                }
            }
            if (this.GetEnergyCost() != 0)
            {
                bool local_51;
                float32 local_74 = this.GetEnergyCost();
                this.SetSkillCDRatio(FGameAttributeUtils::GetAttributeValue(local_14, this.GetSkillProgressAttribute(), this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue()) / local_74);
                if (this.GetSkillCDRatio() >= 1.0f)
                {
                    this.SetSkillButtonState(ESkillButtonState(0));
                    this.SetSkillCDRatio(1.0f);
                }
                else
                {
                    this.SetSkillButtonState(ESkillButtonState(2));
                }
                local_68;
                local_51 = local_14.HasEntityBB(local_68);
                if (!(local_51))
                {
                    local_51 = false;
                }
                else
                {
                    local_72;
                    local_51 = local_14.GetBB_Bool(local_72);
                }
                if (local_51)
                {
                    this.SetSkillButtonState(ESkillButtonState(3));
                    this.SetSkillCDRatio(1.0f);
                }
            }
        }
        return;
    }
    ESkillProgressType GetSkillProgressType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SkillProgressType;
    }
    void SetSkillProgressType(const ESkillProgressType __Value) property
    {
        if (int(this.m_SkillProgressType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SkillProgressType = __Value;
        return;
    }
    ESkillButtonType GetSkillButtonType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SkillButtonType;
    }
    void SetSkillButtonType(const ESkillButtonType __Value) property
    {
        if (int(this.m_SkillButtonType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SkillButtonType = __Value;
        return;
    }
    ESkillActiveState GetSkillState() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SkillState;
    }
    void SetSkillState(const ESkillActiveState __Value) property
    {
        if (int(this.m_SkillState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SkillState = __Value;
        return;
    }
    int GetSkillStage() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SkillStage;
    }
    void SetSkillStage(const int __Value) property
    {
        if (this.m_SkillStage == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SkillStage = __Value;
        return;
    }
    ESkillButtonState GetSkillButtonState() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SkillButtonState;
    }
    void SetSkillButtonState(const ESkillButtonState __Value) property
    {
        if (int(this.m_SkillButtonState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SkillButtonState = __Value;
        return;
    }
    const FGameAttributeRef GetSkillProgressAttribute() const property
    {
        const FGameAttributeRef __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FGameAttributeRef GetModify_SkillProgressAttribute() property
    {
        FGameAttributeRef __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetSkillProgressAttribute(const FGameAttributeRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SkillProgressAttribute = __Value;
        return;
    }
    const FGameAttributeRef GetSkillProgressAttributeMax() const property
    {
        const FGameAttributeRef __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FGameAttributeRef GetModify_SkillProgressAttributeMax() property
    {
        FGameAttributeRef __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetSkillProgressAttributeMax(const FGameAttributeRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SkillProgressAttributeMax = __Value;
        return;
    }
    const float32 GetSkillCDRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_SkillCDRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetSkillCDRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SkillCDRatio = __Value;
        return;
    }
    int GetSkillCDRemainTimer() const property
    {
        this.TrackPropertyRead(8);
        return this.m_SkillCDRemainTimer;
    }
    void SetSkillCDRemainTimer(const int __Value) property
    {
        if (this.m_SkillCDRemainTimer == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SkillCDRemainTimer = __Value;
        return;
    }
    USkillConfig GetSkillConfig() const property
    {
        this.TrackPropertyRead(9);
        return this.m_SkillConfig;
    }
    void SetSkillConfig(const USkillConfig __Value) property
    {
        if (this.m_SkillConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        return;
    }
    const TDataObjectPtr<FCombatItemConfig> GetConsumableItem() const property
    {
        const TDataObjectPtr<FCombatItemConfig> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TDataObjectPtr<FCombatItemConfig> GetModify_ConsumableItem() property
    {
        TDataObjectPtr<FCombatItemConfig> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetConsumableItem(const TDataObjectPtr<FCombatItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_ConsumableItem = __Value;
        return;
    }
    int GetUsableTime() const property
    {
        this.TrackPropertyRead(11);
        return this.m_UsableTime;
    }
    void SetUsableTime(const int __Value) property
    {
        if (this.m_UsableTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_UsableTime = __Value;
        return;
    }
    int GetEnergyCost() const property
    {
        this.TrackPropertyRead(12);
        return this.m_EnergyCost;
    }
    void SetEnergyCost(const int __Value) property
    {
        if (this.m_EnergyCost == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_EnergyCost = __Value;
        return;
    }
    bool GetbSkillUsable() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bSkillUsable;
    }
    void SetbSkillUsable(const bool __Value) property
    {
        if (!(this.m_bSkillUsable) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bSkillUsable = __Value;
        return;
    }
    bool GetbDivineBurst() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bDivineBurst;
    }
    void SetbDivineBurst(const bool __Value) property
    {
        if (!(this.m_bDivineBurst) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bDivineBurst = __Value;
        return;
    }
    bool GetbDivineChaos() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bDivineChaos;
    }
    void SetbDivineChaos(const bool __Value) property
    {
        if (!(this.m_bDivineChaos) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bDivineChaos = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SkillButton
{
    UPROPERTY()
    TEUIModelRef<FVM_SkillButton> Self;

    __GeneratedProperties_FVM_SkillButton()
    {
        return;
    }
}

namespace FVM_SkillButton
{
FVM_SkillButton& Create(const UObject ContextObject)
{
    return FVM_SkillButton::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SkillButton CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SkillButton __r;
    TEUIModelRef<FVM_SkillButton> local_6 = TEUIModelRef<FVM_SkillButton>(EUIInternal::MakeModelWithManager(Manager, FVM_SkillButton::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SkillCDRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillCDRemainTimer";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UsableTime";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EnergyCost";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SkillButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SkillButton;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SkillButton;
}
void __Tick(FVM_SkillButton &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_SkillCDRatio(const FVM_SkillButton &inout Model)
{
    return Model.GetSkillCDRatio();
}
int __UIGetter_SkillCDRemainTimer(const FVM_SkillButton &inout Model)
{
    return Model.GetSkillCDRemainTimer();
}
int __UIGetter_UsableTime(const FVM_SkillButton &inout Model)
{
    return Model.GetUsableTime();
}
int __UIGetter_EnergyCost(const FVM_SkillButton &inout Model)
{
    return Model.GetEnergyCost();
}
TEUIModelRef<FVM_SkillButton> __UIGetter_Self(const FVM_SkillButton &inout Model)
{
    return TEUIModelRef<FVM_SkillButton>(Model);
}
int __IndexOf_SkillProgressType()
{
    return 0;
}
int __IndexOf_SkillButtonType()
{
    return 1;
}
int __IndexOf_SkillState()
{
    return 2;
}
int __IndexOf_SkillStage()
{
    return 3;
}
int __IndexOf_SkillButtonState()
{
    return 4;
}
int __IndexOf_SkillProgressAttribute()
{
    return 5;
}
int __IndexOf_SkillProgressAttributeMax()
{
    return 6;
}
int __IndexOf_SkillCDRatio()
{
    return 7;
}
int __IndexOf_SkillCDRemainTimer()
{
    return 8;
}
int __IndexOf_SkillConfig()
{
    return 9;
}
int __IndexOf_ConsumableItem()
{
    return 10;
}
int __IndexOf_UsableTime()
{
    return 11;
}
int __IndexOf_EnergyCost()
{
    return 12;
}
int __IndexOf_bSkillUsable()
{
    return 13;
}
int __IndexOf_bDivineBurst()
{
    return 14;
}
int __IndexOf_bDivineChaos()
{
    return 15;
}
}
namespace __GeneratedProperties_FVM_SkillButton
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
