
namespace FVMS_SkillInfo_Avatar_PlayerWizard
{
    const int ModelId = 0;

}
struct FVMS_SkillInfo_Avatar_PlayerWizard : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FEUIModelRef m_VM_SimpleSkillButton;
    UPROPERTY()
    FEUIModelRef m_VM_ExtraSkill1Button;
    UPROPERTY()
    FEUIModelRef m_VM_ExtraSkill2Button;
    UPROPERTY()
    FEUIModelRef m_VM_UltraSkillButton;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    float32 m_CastProgress;
    UPROPERTY()
    int m_ChargeLevel;
    UPROPERTY()
    int m_SuperSwitch;
    UPROPERTY()
    float32 m_CustomSkillEnergy;
    UPROPERTY()
    float32 m_CustomSkillEnergyMax;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;
    UPROPERTY()
    int m_MagicUseCount;

    FVMS_SkillInfo_Avatar_PlayerWizard()
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CastProgress = 0.0f;
        this.m_ChargeLevel = 0;
        this.m_SuperSwitch = 0;
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_MagicUseCount = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SkillInfo_Avatar_PlayerWizard(const FVMS_SkillInfo_Avatar_PlayerWizard &inout Other)
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_CastProgress = 0.0f;
        this.m_ChargeLevel = 0;
        this.m_SuperSwitch = 0;
        this.m_CustomSkillEnergy = 0.0f;
        this.m_CustomSkillEnergyMax = 0.0f;
        this.m_MagicUseCount = 0;
        this.m_VM_SimpleSkillButton = Other.m_VM_SimpleSkillButton;
        this.m_VM_ExtraSkill1Button = Other.m_VM_ExtraSkill1Button;
        this.m_VM_ExtraSkill2Button = Other.m_VM_ExtraSkill2Button;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CastProgress = Other.m_CastProgress;
        this.m_ChargeLevel = int(Other.m_ChargeLevel);
        this.m_SuperSwitch = int(Other.m_SuperSwitch);
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_MagicUseCount = int(Other.m_MagicUseCount);
        return;
    }
    FVMS_SkillInfo_Avatar_PlayerWizard opAssign(const FVMS_SkillInfo_Avatar_PlayerWizard &inout Other)
    {
        FVMS_SkillInfo_Avatar_PlayerWizard __r;
        this.m_VM_SimpleSkillButton = Other.m_VM_SimpleSkillButton;
        this.m_VM_ExtraSkill1Button = Other.m_VM_ExtraSkill1Button;
        this.m_VM_ExtraSkill2Button = Other.m_VM_ExtraSkill2Button;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_CastProgress = Other.m_CastProgress;
        this.m_ChargeLevel = int(Other.m_ChargeLevel);
        this.m_SuperSwitch = int(Other.m_SuperSwitch);
        this.m_CustomSkillEnergy = Other.m_CustomSkillEnergy;
        this.m_CustomSkillEnergyMax = Other.m_CustomSkillEnergyMax;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_MagicUseCount = int(Other.m_MagicUseCount);
        return __r;
    }
    void PostConstruct()
    {
        this.SetPlayerPawnEntity(this.GetContext().GetLocalPlayerPawn());
        this.SetVM_SimpleSkillButton(FEUIModelRef());
        this.SetVM_ExtraSkill1Button(FEUIModelRef());
        this.SetVM_ExtraSkill2Button(FEUIModelRef());
        Get local_10;
        local_10.opCall().SetSkillProgressType(ESkillProgressType(1));
        local_10.opCall().SetSkillProgressType(ESkillProgressType(1));
        local_10.opCall().SetSkillProgressType(ESkillProgressType(1));
        this.SetVM_UltraSkillButton(FEUIModelRef());
        local_10.opCall().SetSkillProgressType(ESkillProgressType(2));
        return;
    }
    void Tick()
    {
        int local_12 = 0;
        int local_18 = 0;
        FNameHandle_EntityBBVarInt local_42;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        if ((FECSEntity(this.GetPlayerPawnEntity()) == ENTITY_NULL))
        {
            this.SetPlayerPawnEntity(this.GetContext().GetLocalPlayerPawn());
        }
        if ((FECSEntity(this.GetPlayerPawnEntity()) == ENTITY_NULL))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        if (local_18 && local_18.HasAttribute(Attribute::CustomSkillEnergy))
        {
            FGameAttributeModificationValue local_30;
            this.SetCustomSkillEnergyMax(FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, local_30));
            this.SetCustomSkillEnergy(FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, local_30));
            if (this.GetCustomSkillEnergyMax() != 0.0f)
            {
                this.SetCustomSkillEnergyRatio((this.GetCustomSkillEnergy() / this.GetCustomSkillEnergyMax()));
            }
        }
        FNameHandle_EntityBBVar local_38;
        local_38;
        if (this.GetPlayerPawnEntity().HasEntityBB(local_38))
        {
            local_42;
            this.SetMagicUseCount(this.GetPlayerPawnEntity().GetBB_Int(local_42));
        }
        Get local_46;
        const FC_GameAttribute& local_48 = local_46.opCall();
        if (local_48)
        {
            FGameAttributeModificationValue local_30;
            if (local_48.HasAttribute(Attribute::ChargeEnergyMax))
            {
                this.SetCastProgress(FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::ChargeEnergy, this.GetContext().Time, false, 0.0f, false, local_30) / FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::ChargeEnergyMax, this.GetContext().Time, false, 0.0f, false, local_30));
            }
        }
        local_42;
        this.SetChargeLevel(this.GetPlayerPawnEntity().GetBB_Int(local_42));
        local_42;
        this.SetSuperSwitch(this.GetPlayerPawnEntity().GetBB_Int(local_42));
        return;
    }
    void OnPlayerPawnEntityChanged()
    {
        int local_14 = 0;
        const USkillConfig local_26;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        int local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(3));
        bool local_5 = false;
        const FC_SkillInstance& local_8 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24 = local_8.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetEnergyCost(45);
            local_14.SetSkillProgressAttribute(Attribute::CustomSkillEnergy);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(5));
        bool local_5_2 = false;
        const FC_SkillInstance& local_28 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5_2);
        if (local_5_2)
        {
            TSoftObjectPtr<USkillConfig> local_24_2 = local_28.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetEnergyCost(30);
            local_14.SetSkillProgressAttribute(Attribute::CustomSkillEnergy);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(6));
        bool local_5_3 = false;
        const FC_SkillInstance& local_30 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5_3);
        if (local_5_3)
        {
            TSoftObjectPtr<USkillConfig> local_24_3 = local_30.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetEnergyCost(30);
            local_14.SetSkillProgressAttribute(Attribute::CustomSkillEnergy);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(4));
        const FC_SkillInstance& local_32 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5_3);
        if (local_5_3)
        {
            TSoftObjectPtr<USkillConfig> local_24_4 = local_32.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetSkillProgressAttribute(Attribute::UltraSkillEnergy);
            local_14.SetSkillProgressAttributeMax(Attribute::UltraSkillEnergyMax);
        }
        return;
    }
    const FEUIModelRef GetVM_SimpleSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_VM_SimpleSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetVM_SimpleSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_VM_SimpleSkillButton = __Value;
        return;
    }
    const FEUIModelRef GetVM_ExtraSkill1Button() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_VM_ExtraSkill1Button() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetVM_ExtraSkill1Button(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_VM_ExtraSkill1Button = __Value;
        return;
    }
    const FEUIModelRef GetVM_ExtraSkill2Button() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelRef GetModify_VM_ExtraSkill2Button() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetVM_ExtraSkill2Button(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_VM_ExtraSkill2Button = __Value;
        return;
    }
    const FEUIModelRef GetVM_UltraSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelRef GetModify_VM_UltraSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetVM_UltraSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_VM_UltraSkillButton = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    const float32 GetCastProgress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_CastProgress() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCastProgress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CastProgress = __Value;
        return;
    }
    int GetChargeLevel() const property
    {
        this.TrackPropertyRead(6);
        return this.m_ChargeLevel;
    }
    void SetChargeLevel(const int __Value) property
    {
        if (this.m_ChargeLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ChargeLevel = __Value;
        return;
    }
    int GetSuperSwitch() const property
    {
        this.TrackPropertyRead(7);
        return this.m_SuperSwitch;
    }
    void SetSuperSwitch(const int __Value) property
    {
        if (this.m_SuperSwitch == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SuperSwitch = __Value;
        return;
    }
    const float32 GetCustomSkillEnergy() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_CustomSkillEnergy() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCustomSkillEnergy(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CustomSkillEnergy = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyMax() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyMax() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetCustomSkillEnergyMax(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CustomSkillEnergyMax = __Value;
        return;
    }
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FECSEntity GetModify_PlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_PlayerPawnEntity = __Value;
        return;
    }
    int GetMagicUseCount() const property
    {
        this.TrackPropertyRead(11);
        return this.m_MagicUseCount;
    }
    void SetMagicUseCount(const int __Value) property
    {
        if (this.m_MagicUseCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_MagicUseCount = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SkillInfo_Avatar_PlayerWizard
{
    UPROPERTY()
    TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard> Self;

    __GeneratedProperties_FVMS_SkillInfo_Avatar_PlayerWizard()
    {
        return;
    }
}

namespace FVMS_SkillInfo_Avatar_PlayerWizard
{
FVMS_SkillInfo_Avatar_PlayerWizard& Get(const UObject ContextObject)
{
    return FVMS_SkillInfo_Avatar_PlayerWizard::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SkillInfo_Avatar_PlayerWizard GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SkillInfo_Avatar_PlayerWizard __r;
    TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard> local_6 = TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard>(EUIInternal::MakeModelWithManager(Manager, FVMS_SkillInfo_Avatar_PlayerWizard::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "VM_SimpleSkillButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_ExtraSkill1Button";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_ExtraSkill2Button";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_UltraSkillButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CustomSkillEnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CastProgress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SkillInfo_Avatar_PlayerWizard;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnPlayerPawnEntityChanged";
    local_24.DirtyFlags.Set(FVMS_SkillInfo_Avatar_PlayerWizard::__IndexOf_PlayerPawnEntity());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SkillInfo_Avatar_PlayerWizard;
}
void __Tick(FVMS_SkillInfo_Avatar_PlayerWizard &inout Model)
{
    Model.Tick();
    return;
}
void __OnPlayerPawnEntityChanged(FVMS_SkillInfo_Avatar_PlayerWizard &inout Model)
{
    Model.OnPlayerPawnEntityChanged();
    return;
}
FEUIModelRef __UIGetter_VM_SimpleSkillButton(const FVMS_SkillInfo_Avatar_PlayerWizard &inout Model)
{
    return Model.GetVM_SimpleSkillButton();
}
FEUIModelRef __UIGetter_VM_ExtraSkill1Button(const FVMS_SkillInfo_Avatar_PlayerWizard &inout Model)
{
    return Model.GetVM_ExtraSkill1Button();
}
FEUIModelRef __UIGetter_VM_ExtraSkill2Button(const FVMS_SkillInfo_Avatar_PlayerWizard &inout Model)
{
    return Model.GetVM_ExtraSkill2Button();
}
FEUIModelRef __UIGetter_VM_UltraSkillButton(const FVMS_SkillInfo_Avatar_PlayerWizard &inout Model)
{
    return Model.GetVM_UltraSkillButton();
}
float32 __UIGetter_CustomSkillEnergyRatio(const FVMS_SkillInfo_Avatar_PlayerWizard &inout Model)
{
    return Model.GetCustomSkillEnergyRatio();
}
float32 __UIGetter_CastProgress(const FVMS_SkillInfo_Avatar_PlayerWizard &inout Model)
{
    return Model.GetCastProgress();
}
TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard> __UIGetter_Self(const FVMS_SkillInfo_Avatar_PlayerWizard &inout Model)
{
    return TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard>(Model);
}
int __IndexOf_VM_SimpleSkillButton()
{
    return 0;
}
int __IndexOf_VM_ExtraSkill1Button()
{
    return 1;
}
int __IndexOf_VM_ExtraSkill2Button()
{
    return 2;
}
int __IndexOf_VM_UltraSkillButton()
{
    return 3;
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 4;
}
int __IndexOf_CastProgress()
{
    return 5;
}
int __IndexOf_ChargeLevel()
{
    return 6;
}
int __IndexOf_SuperSwitch()
{
    return 7;
}
int __IndexOf_CustomSkillEnergy()
{
    return 8;
}
int __IndexOf_CustomSkillEnergyMax()
{
    return 9;
}
int __IndexOf_PlayerPawnEntity()
{
    return 10;
}
int __IndexOf_MagicUseCount()
{
    return 11;
}
}
namespace __GeneratedProperties_FVMS_SkillInfo_Avatar_PlayerWizard
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
