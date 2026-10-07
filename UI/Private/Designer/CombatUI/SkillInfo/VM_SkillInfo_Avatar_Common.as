
namespace FVMS_SkillInfo_Avatar_Common
{
    const int ModelId = 0;

}
struct FVMS_SkillInfo_Avatar_Common : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FEUIModelRef m_VM_SpecialAttackButton;
    UPROPERTY()
    FEUIModelRef m_VM_SimpleSkillButton;
    UPROPERTY()
    FEUIModelRef m_VM_UltraSkillButton;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;
    UPROPERTY()
    bool m_UltraOn;

    FVMS_SkillInfo_Avatar_Common()
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_UltraOn = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SkillInfo_Avatar_Common(const FVMS_SkillInfo_Avatar_Common &inout Other)
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_UltraOn = false;
        this.m_VM_SpecialAttackButton = Other.m_VM_SpecialAttackButton;
        this.m_VM_SimpleSkillButton = Other.m_VM_SimpleSkillButton;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_UltraOn = Other.m_UltraOn;
        return;
    }
    FVMS_SkillInfo_Avatar_Common opAssign(const FVMS_SkillInfo_Avatar_Common &inout Other)
    {
        FVMS_SkillInfo_Avatar_Common __r;
        this.m_VM_SpecialAttackButton = Other.m_VM_SpecialAttackButton;
        this.m_VM_SimpleSkillButton = Other.m_VM_SimpleSkillButton;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_UltraOn = Other.m_UltraOn;
        return __r;
    }
    void PostConstruct()
    {
        this.SetPlayerPawnEntity(::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn()));
        this.SetVM_SpecialAttackButton(FEUIModelRef());
        Get local_14;
        local_14.opCall().SetSkillButtonType(ESkillButtonType(4));
        local_14.opCall().SetSkillProgressType(ESkillProgressType(4));
        this.SetVM_SimpleSkillButton(FEUIModelRef());
        local_14.opCall().SetSkillProgressType(ESkillProgressType(2));
        this.SetVM_UltraSkillButton(FEUIModelRef());
        local_14.opCall().SetSkillProgressType(ESkillProgressType(2));
        local_14.opCall().SetSkillButtonType(ESkillButtonType(2));
        return;
    }
    void Tick()
    {
        int local_12 = 0;
        int local_18 = 0;
        if ((this.GetContext().GetLocalPlayerPawn() == ENTITY_NULL))
        {
            return;
        }
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        if (!(local_12))
        {
            return;
        }
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayerPawn();
        if (local_18 && local_18.HasAttribute(Attribute::CustomSkillEnergy))
        {
            float32 local_32 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_31 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            if (local_32 != 0.0f)
            {
                this.SetCustomSkillEnergyRatio(local_31 / local_32);
            }
        }
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
            local_14.SetSkillProgressAttribute(Attribute::SimpleSkillEnergy);
            local_14.SetSkillProgressAttributeMax(Attribute::SimpleSkillEnergyMax);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(4));
        const FC_SkillInstance& local_28 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24_2 = local_28.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetSkillProgressAttribute(Attribute::UltraSkillEnergy);
            local_14.SetSkillProgressAttributeMax(Attribute::UltraSkillEnergyMax);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(2));
        const FC_SkillInstance& local_30 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24_3 = local_30.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
        }
        return;
    }
    const FEUIModelRef GetVM_SpecialAttackButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_VM_SpecialAttackButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetVM_SpecialAttackButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_VM_SpecialAttackButton = __Value;
        return;
    }
    const FEUIModelRef GetVM_SimpleSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_VM_SimpleSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetVM_SimpleSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_VM_SimpleSkillButton = __Value;
        return;
    }
    const FEUIModelRef GetVM_UltraSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelRef GetModify_VM_UltraSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetVM_UltraSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_VM_UltraSkillButton = __Value;
        return;
    }
    const float32 GetCustomSkillEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_CustomSkillEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCustomSkillEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CustomSkillEnergyRatio = __Value;
        return;
    }
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FECSEntity GetModify_PlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PlayerPawnEntity = __Value;
        return;
    }
    bool GetUltraOn() const property
    {
        this.TrackPropertyRead(5);
        return this.m_UltraOn;
    }
    void SetUltraOn(const bool __Value) property
    {
        if (!(this.m_UltraOn) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_UltraOn = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SkillInfo_Avatar_Common
{
    UPROPERTY()
    TEUIModelRef<FVMS_SkillInfo_Avatar_Common> Self;

    __GeneratedProperties_FVMS_SkillInfo_Avatar_Common()
    {
        return;
    }
}

namespace FVMS_SkillInfo_Avatar_Common
{
FVMS_SkillInfo_Avatar_Common& Get(const UObject ContextObject)
{
    return FVMS_SkillInfo_Avatar_Common::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SkillInfo_Avatar_Common GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SkillInfo_Avatar_Common __r;
    TEUIModelRef<FVMS_SkillInfo_Avatar_Common> local_6 = TEUIModelRef<FVMS_SkillInfo_Avatar_Common>(EUIInternal::MakeModelWithManager(Manager, FVMS_SkillInfo_Avatar_Common::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "VM_SpecialAttackButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_SimpleSkillButton";
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
    local_14.PropertyName = "UltraOn";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SkillInfo_Avatar_Common>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SkillInfo_Avatar_Common;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnPlayerPawnEntityChanged";
    local_24.DirtyFlags.Set(FVMS_SkillInfo_Avatar_Common::__IndexOf_PlayerPawnEntity());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SkillInfo_Avatar_Common;
}
void __Tick(FVMS_SkillInfo_Avatar_Common &inout Model)
{
    Model.Tick();
    return;
}
void __OnPlayerPawnEntityChanged(FVMS_SkillInfo_Avatar_Common &inout Model)
{
    Model.OnPlayerPawnEntityChanged();
    return;
}
FEUIModelRef __UIGetter_VM_SpecialAttackButton(const FVMS_SkillInfo_Avatar_Common &inout Model)
{
    return Model.GetVM_SpecialAttackButton();
}
FEUIModelRef __UIGetter_VM_SimpleSkillButton(const FVMS_SkillInfo_Avatar_Common &inout Model)
{
    return Model.GetVM_SimpleSkillButton();
}
FEUIModelRef __UIGetter_VM_UltraSkillButton(const FVMS_SkillInfo_Avatar_Common &inout Model)
{
    return Model.GetVM_UltraSkillButton();
}
float32 __UIGetter_CustomSkillEnergyRatio(const FVMS_SkillInfo_Avatar_Common &inout Model)
{
    return Model.GetCustomSkillEnergyRatio();
}
bool __UIGetter_UltraOn(const FVMS_SkillInfo_Avatar_Common &inout Model)
{
    return Model.GetUltraOn();
}
TEUIModelRef<FVMS_SkillInfo_Avatar_Common> __UIGetter_Self(const FVMS_SkillInfo_Avatar_Common &inout Model)
{
    return TEUIModelRef<FVMS_SkillInfo_Avatar_Common>(Model);
}
int __IndexOf_VM_SpecialAttackButton()
{
    return 0;
}
int __IndexOf_VM_SimpleSkillButton()
{
    return 1;
}
int __IndexOf_VM_UltraSkillButton()
{
    return 2;
}
int __IndexOf_CustomSkillEnergyRatio()
{
    return 3;
}
int __IndexOf_PlayerPawnEntity()
{
    return 4;
}
int __IndexOf_UltraOn()
{
    return 5;
}
}
namespace __GeneratedProperties_FVMS_SkillInfo_Avatar_Common
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
