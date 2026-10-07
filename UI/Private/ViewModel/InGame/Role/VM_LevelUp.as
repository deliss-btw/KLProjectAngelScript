
enum ELevelUpDisplayAttributeType
{
    HP,
    Stamina,
}

namespace FVM_LevelUp
{
    const int ModelId = 0;

}
struct FVM_LevelUp : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_FromLevel;
    UPROPERTY()
    int m_ToLevel;

    FVM_LevelUp()
    {
        this.m_FromLevel = 0;
        this.m_ToLevel = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_LevelUp' by default constructor.");
        return;
    }
    FVM_LevelUp(const FVM_LevelUp &inout Other)
    {
        this.m_FromLevel = 0;
        this.m_ToLevel = 0;
        this.m_FromLevel = int(Other.m_FromLevel);
        this.m_ToLevel = int(Other.m_ToLevel);
        return;
    }
    FVM_LevelUp(const int InFromLevel, const int InToLevel)
    {
        this.m_FromLevel = 0;
        this.m_ToLevel = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetFromLevel(InFromLevel);
        this.SetToLevel(InToLevel);
        return;
    }
    FVM_LevelUp opAssign(const FVM_LevelUp &inout Other)
    {
        FVM_LevelUp __r;
        this.m_FromLevel = int(Other.m_FromLevel);
        this.m_ToLevel = int(Other.m_ToLevel);
        return __r;
    }
    float32 GetFromLevelHP() const
    {
        TDataObjectPtr<FGameAttribute_DefaultConfig> local_24 = this.GetPlayerDefaultAttribute();
        if (local_24)
        {
            return (local_24.opArrow().HPMax + this.GetTotalGrowFromTo(1, this.GetFromLevel(), ELevelUpDisplayAttributeType(0)));
        }
        return 0.0f;
    }
    FText GetFromLevelHPText() const
    {
        return this.GetNumberText(this.GetFromLevelHP());
    }
    float32 GetFromLevelStamina() const
    {
        TDataObjectPtr<FGameAttribute_DefaultConfig> local_24 = this.GetPlayerDefaultAttribute();
        if (local_24)
        {
            return (local_24.opArrow().StaminaMax + this.GetTotalGrowFromTo(1, this.GetFromLevel(), ELevelUpDisplayAttributeType(1)));
        }
        return 0.0f;
    }
    FText GetFromLevelStaminaText() const
    {
        return this.GetNumberText(this.GetFromLevelStamina());
    }
    float32 GetHPGrowth() const
    {
        return this.GetTotalGrowFromTo(this.GetFromLevel(), this.GetToLevel(), ELevelUpDisplayAttributeType(0));
    }
    FText GetHPGrowthText() const
    {
        float32 local_1 = this.GetHPGrowth();
        FText local_6;
        this.GetNumberText(local_6);
        return FText::Format(FText::AsCultureInvariant("+{0}"), local_6);
    }
    float32 GetStaminaGrowth() const
    {
        return this.GetTotalGrowFromTo(this.GetFromLevel(), this.GetToLevel(), ELevelUpDisplayAttributeType(1));
    }
    FText GetStaminaGrowthText() const
    {
        float32 local_1 = this.GetStaminaGrowth();
        FText local_6;
        this.GetNumberText(local_6);
        return FText::Format(FText::AsCultureInvariant("+{0}"), local_6);
    }
    float32 GetToLevelHP() const
    {
        return (this.GetFromLevelHP() + this.GetHPGrowth());
    }
    FText GetToLevelHPText() const
    {
        return this.GetNumberText(this.GetToLevelHP());
    }
    float32 GetToLevelStamina() const
    {
        return (this.GetFromLevelStamina() + this.GetStaminaGrowth());
    }
    FText GetToLevelStaminaText() const
    {
        return this.GetNumberText(this.GetToLevelStamina());
    }
    bool IsHPGrow() const
    {
        return (this.GetHPGrowth() > 0.0f);
    }
    bool IsStaminaGrow() const
    {
        return (this.GetStaminaGrowth() > 0.0f);
    }
    TDataObjectPtr<FGameAttribute_DefaultConfig> GetPlayerDefaultAttribute() const
    {
        TDataObjectPtr<FAvatarPrefabConfig> local_28 = ::GetAvatarConfig(this.GetContext().GetLocalPlayerPawn());
        if (local_28)
        {
            return TDataObjectPtr<FGameAttribute_DefaultConfig>(local_28.opArrow().InitValues);
        }
        return TDataObjectPtr<FGameAttribute_DefaultConfig>(nullptr);
    }
    float32 GetTotalGrowFromTo(const int InFromLevel, const int InToLevel, const ELevelUpDisplayAttributeType InAttributeType) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        float32 __r; return __r;
    }
    FText GetNumberText(const float32 InNumber) const
    {
        FNumberFormattingOptions local_6;
        local_6 = FNumberFormattingOptions::DefaultWithGrouping();
        local_6.SetMinimumFractionalDigits(0).SetMaximumFractionalDigits(1);
        return FText::AsNumber(InNumber, local_6);
    }
    int GetFromLevel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_FromLevel;
    }
    void SetFromLevel(const int __Value) property
    {
        if (this.m_FromLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FromLevel = __Value;
        return;
    }
    int GetToLevel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ToLevel;
    }
    void SetToLevel(const int __Value) property
    {
        if (this.m_ToLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ToLevel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_LevelUp
{
    UPROPERTY()
    float32 FromLevelHP;
    UPROPERTY()
    FText FromLevelHPText;
    UPROPERTY()
    float32 FromLevelStamina;
    UPROPERTY()
    FText FromLevelStaminaText;
    UPROPERTY()
    float32 HPGrowth;
    UPROPERTY()
    FText HPGrowthText;
    UPROPERTY()
    float32 StaminaGrowth;
    UPROPERTY()
    FText StaminaGrowthText;
    UPROPERTY()
    float32 ToLevelHP;
    UPROPERTY()
    FText ToLevelHPText;
    UPROPERTY()
    float32 ToLevelStamina;
    UPROPERTY()
    FText ToLevelStaminaText;
    UPROPERTY()
    bool IsHPGrow;
    UPROPERTY()
    bool IsStaminaGrow;
    UPROPERTY()
    TEUIModelRef<FVM_LevelUp> Self;


}

namespace FVM_LevelUp
{
FVM_LevelUp& Create(const UObject ContextObject, const int FromLevel, const int ToLevel)
{
    return FVM_LevelUp::CreateByManager(EUIInternal::GetContextManager(ContextObject), FromLevel, ToLevel);
}
FVM_LevelUp CreateByManager(const UEUIManagerSubsystem Manager, const int FromLevel, const int ToLevel)
{
    FVM_LevelUp __r;
    TEUIModelRef<FVM_LevelUp> local_6 = TEUIModelRef<FVM_LevelUp>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_LevelUp::ModelId, 0, FromLevel, ToLevel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "FromLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FromLevelHP";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FromLevelHPText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FromLevelStamina";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FromLevelStaminaText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HPGrowth";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HPGrowthText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StaminaGrowth";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StaminaGrowthText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToLevelHP";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToLevelHPText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToLevelStamina";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToLevelStaminaText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsHPGrow";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsStaminaGrow";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_LevelUp>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_LevelUp;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_LevelUp;
}
int __UIGetter_FromLevel(const FVM_LevelUp &inout Model)
{
    return Model.GetFromLevel();
}
int __UIGetter_ToLevel(const FVM_LevelUp &inout Model)
{
    return Model.GetToLevel();
}
float32 __UIGetter_FromLevelHP(const FVM_LevelUp &inout Model)
{
    return Model.GetFromLevelHP();
}
FText __UIGetter_FromLevelHPText(const FVM_LevelUp &inout Model)
{
    return Model.GetFromLevelHPText();
}
float32 __UIGetter_FromLevelStamina(const FVM_LevelUp &inout Model)
{
    return Model.GetFromLevelStamina();
}
FText __UIGetter_FromLevelStaminaText(const FVM_LevelUp &inout Model)
{
    return Model.GetFromLevelStaminaText();
}
float32 __UIGetter_HPGrowth(const FVM_LevelUp &inout Model)
{
    return Model.GetHPGrowth();
}
FText __UIGetter_HPGrowthText(const FVM_LevelUp &inout Model)
{
    return Model.GetHPGrowthText();
}
float32 __UIGetter_StaminaGrowth(const FVM_LevelUp &inout Model)
{
    return Model.GetStaminaGrowth();
}
FText __UIGetter_StaminaGrowthText(const FVM_LevelUp &inout Model)
{
    return Model.GetStaminaGrowthText();
}
float32 __UIGetter_ToLevelHP(const FVM_LevelUp &inout Model)
{
    return Model.GetToLevelHP();
}
FText __UIGetter_ToLevelHPText(const FVM_LevelUp &inout Model)
{
    return Model.GetToLevelHPText();
}
float32 __UIGetter_ToLevelStamina(const FVM_LevelUp &inout Model)
{
    return Model.GetToLevelStamina();
}
FText __UIGetter_ToLevelStaminaText(const FVM_LevelUp &inout Model)
{
    return Model.GetToLevelStaminaText();
}
bool __UIGetter_IsHPGrow(const FVM_LevelUp &inout Model)
{
    return Model.IsHPGrow();
}
bool __UIGetter_IsStaminaGrow(const FVM_LevelUp &inout Model)
{
    return Model.IsStaminaGrow();
}
TEUIModelRef<FVM_LevelUp> __UIGetter_Self(const FVM_LevelUp &inout Model)
{
    return TEUIModelRef<FVM_LevelUp>(Model);
}
int __IndexOf_FromLevel()
{
    return 0;
}
int __IndexOf_ToLevel()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_LevelUp
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
