
namespace FVMS_SkillInfo_Avatar_ShuiJing
{
    const int ModelId = 0;

}
struct FVMS_SkillInfo_Avatar_ShuiJing : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FEUIModelRef m_VM_SpecialAttackButton;
    UPROPERTY()
    FEUIModelRef m_VM_SimpleSkillButton;
    UPROPERTY()
    FEUIModelRef m_VM_ExtraSkillButton;
    UPROPERTY()
    FEUIModelRef m_VM_UltraSkillButton;
    UPROPERTY()
    float32 m_CustomSkillEnergyRatio;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;
    UPROPERTY()
    int m_ChargeState;
    UPROPERTY()
    FName m_IdentifyName_ShuiJing_PowerArrow;
    UPROPERTY()
    int m_Num_PowerArrow;
    UPROPERTY()
    bool m_ShowArrow;

    FVMS_SkillInfo_Avatar_ShuiJing()
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_ChargeState = 0;
        this.m_Num_PowerArrow = 0;
        this.m_ShowArrow = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SkillInfo_Avatar_ShuiJing(const FVMS_SkillInfo_Avatar_ShuiJing &inout Other)
    {
        this.m_CustomSkillEnergyRatio = 0.0f;
        this.m_ChargeState = 0;
        this.m_Num_PowerArrow = 0;
        this.m_ShowArrow = false;
        this.m_VM_SpecialAttackButton = Other.m_VM_SpecialAttackButton;
        this.m_VM_SimpleSkillButton = Other.m_VM_SimpleSkillButton;
        this.m_VM_ExtraSkillButton = Other.m_VM_ExtraSkillButton;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_ChargeState = int(Other.m_ChargeState);
        this.m_IdentifyName_ShuiJing_PowerArrow = Other.m_IdentifyName_ShuiJing_PowerArrow;
        this.m_Num_PowerArrow = int(Other.m_Num_PowerArrow);
        this.m_ShowArrow = Other.m_ShowArrow;
        return;
    }
    FVMS_SkillInfo_Avatar_ShuiJing opAssign(const FVMS_SkillInfo_Avatar_ShuiJing &inout Other)
    {
        FVMS_SkillInfo_Avatar_ShuiJing __r;
        this.m_VM_SpecialAttackButton = Other.m_VM_SpecialAttackButton;
        this.m_VM_SimpleSkillButton = Other.m_VM_SimpleSkillButton;
        this.m_VM_ExtraSkillButton = Other.m_VM_ExtraSkillButton;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_CustomSkillEnergyRatio = Other.m_CustomSkillEnergyRatio;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_ChargeState = int(Other.m_ChargeState);
        this.m_IdentifyName_ShuiJing_PowerArrow = Other.m_IdentifyName_ShuiJing_PowerArrow;
        this.m_Num_PowerArrow = int(Other.m_Num_PowerArrow);
        this.m_ShowArrow = Other.m_ShowArrow;
        return __r;
    }
    void PostConstruct()
    {
        this.SetPlayerPawnEntity(this.GetContext().GetLocalPlayerPawn());
        this.SetVM_SpecialAttackButton(FEUIModelRef());
        Get local_10;
        local_10.opCall().SetSkillButtonType(ESkillButtonType(4));
        local_10.opCall().SetSkillProgressType(ESkillProgressType(4));
        this.SetVM_SimpleSkillButton(FEUIModelRef());
        local_10.opCall().SetSkillProgressType(ESkillProgressType(2));
        this.SetVM_ExtraSkillButton(FEUIModelRef());
        local_10.opCall().SetSkillProgressType(ESkillProgressType(2));
        this.SetVM_UltraSkillButton(FEUIModelRef());
        local_10.opCall().SetSkillProgressType(ESkillProgressType(2));
        local_10.opCall().SetSkillButtonType(ESkillButtonType(2));
        UCombatGlobalSettings local_14 = ::UCombatGlobalSettings::Get();
        UClass local_16;
        this.SetIdentifyName_ShuiJing_PowerArrow(FName(local_16.GetPathName(nullptr)));
        return;
    }
    void Tick()
    {
        int local_12 = 0;
        int local_18 = 0;
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
            float32 local_32 = FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergyMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_31 = FGameAttributeUtils::GetAttributeValue(this.GetPlayerPawnEntity(), Attribute::CustomSkillEnergy, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            if (local_32 != 0.0f)
            {
                this.SetCustomSkillEnergyRatio(local_31 / local_32);
            }
        }
        FNameHandle_EntityBBVar local_38;
        local_38;
        bool local_1 = this.GetPlayerPawnEntity().HasEntityBB(local_38);
        if (local_1)
        {
            FNameHandle_EntityBBVarInt local_42;
            local_42;
            if (this.GetPlayerPawnEntity().GetBB_Int(local_42) > 0)
            {
                local_1 = true;
            }
            else
            {
                local_42;
                local_1 = (this.GetPlayerPawnEntity().GetBB_Int(local_42) > 2);
            }
            if (local_1)
            {
                this.SetChargeState(2);
            }
            else
            {
                local_42;
                if (this.GetPlayerPawnEntity().GetBB_Int(local_42) > 1)
                {
                    this.SetChargeState(1);
                }
                else
                {
                    this.SetChargeState(0);
                }
            }
        }
        Get local_48;
        const FC_NumLimitManager& local_50 = local_48.opCall();
        if (local_50)
        {
            this.SetNum_PowerArrow(0);
            for (auto& local_64 : local_50.GetManagerItems())
            {
                if ((local_64.GetIdentifier() == this.GetIdentifyName_ShuiJing_PowerArrow()))
                {
                    this.SetNum_PowerArrow(this.GetNum_PowerArrow() + 1);
                }
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
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(5));
        const FC_SkillInstance& local_28 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24_2 = local_28.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetSkillProgressAttribute(Attribute::ExtraSkillEnergy);
            local_14.SetSkillProgressAttributeMax(Attribute::ExtraSkillEnergyMax);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(4));
        const FC_SkillInstance& local_30 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24_3 = local_30.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
            local_14.SetSkillProgressAttribute(Attribute::UltraSkillEnergy);
            local_14.SetSkillProgressAttributeMax(Attribute::UltraSkillEnergyMax);
        }
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(2));
        const FC_SkillInstance& local_32 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24_4 = local_32.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
        }
        return;
    }
    void OnNumPowerArrowChanged()
    {
        if (this.GetNum_PowerArrow() > 0)
        {
            this.SetShowArrow(true);
            return;
        }
        this.SetShowArrow(false);
        return;
    }
    ESlateVisibility ShowArrowAsSlateVisibility() const
    {
        int local_2;
        if (this.ShowArrowAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool ShowArrowAsBool() const
    {
        return this.GetShowArrow() || false;
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
    const FEUIModelRef GetVM_ExtraSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelRef GetModify_VM_ExtraSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetVM_ExtraSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_VM_ExtraSkillButton = __Value;
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
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FECSEntity GetModify_PlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_PlayerPawnEntity = __Value;
        return;
    }
    int GetChargeState() const property
    {
        this.TrackPropertyRead(6);
        return this.m_ChargeState;
    }
    void SetChargeState(const int __Value) property
    {
        if (this.m_ChargeState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ChargeState = __Value;
        return;
    }
    const FName GetIdentifyName_ShuiJing_PowerArrow() const property
    {
        const FName __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FName GetModify_IdentifyName_ShuiJing_PowerArrow() property
    {
        FName __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetIdentifyName_ShuiJing_PowerArrow(const FName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_IdentifyName_ShuiJing_PowerArrow = __Value;
        return;
    }
    int GetNum_PowerArrow() const property
    {
        this.TrackPropertyRead(8);
        return this.m_Num_PowerArrow;
    }
    void SetNum_PowerArrow(const int __Value) property
    {
        if (this.m_Num_PowerArrow == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_Num_PowerArrow = __Value;
        return;
    }
    bool GetShowArrow() const property
    {
        this.TrackPropertyRead(9);
        return this.m_ShowArrow;
    }
    void SetShowArrow(const bool __Value) property
    {
        if (!(this.m_ShowArrow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ShowArrow = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SkillInfo_Avatar_ShuiJing
{
    UPROPERTY()
    TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing> Self;

    __GeneratedProperties_FVMS_SkillInfo_Avatar_ShuiJing()
    {
        return;
    }
}

namespace FVMS_SkillInfo_Avatar_ShuiJing
{
FVMS_SkillInfo_Avatar_ShuiJing& Get(const UObject ContextObject)
{
    return FVMS_SkillInfo_Avatar_ShuiJing::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SkillInfo_Avatar_ShuiJing GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SkillInfo_Avatar_ShuiJing __r;
    TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing> local_6 = TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing>(EUIInternal::MakeModelWithManager(Manager, FVMS_SkillInfo_Avatar_ShuiJing::ModelId));
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
    local_14.PropertyName = "VM_ExtraSkillButton";
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
    local_14.PropertyName = "ShowArrow";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SkillInfo_Avatar_ShuiJing;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnPlayerPawnEntityChanged";
    local_24.DirtyFlags.Set(FVMS_SkillInfo_Avatar_ShuiJing::__IndexOf_PlayerPawnEntity());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__OnNumPowerArrowChanged";
    local_24.DirtyFlags.Set(FVMS_SkillInfo_Avatar_ShuiJing::__IndexOf_Num_PowerArrow());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SkillInfo_Avatar_ShuiJing;
}
void __Tick(FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    Model.Tick();
    return;
}
void __OnPlayerPawnEntityChanged(FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    Model.OnPlayerPawnEntityChanged();
    return;
}
void __OnNumPowerArrowChanged(FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    Model.OnNumPowerArrowChanged();
    return;
}
FEUIModelRef __UIGetter_VM_SpecialAttackButton(const FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    return Model.GetVM_SpecialAttackButton();
}
FEUIModelRef __UIGetter_VM_SimpleSkillButton(const FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    return Model.GetVM_SimpleSkillButton();
}
FEUIModelRef __UIGetter_VM_ExtraSkillButton(const FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    return Model.GetVM_ExtraSkillButton();
}
FEUIModelRef __UIGetter_VM_UltraSkillButton(const FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    return Model.GetVM_UltraSkillButton();
}
float32 __UIGetter_CustomSkillEnergyRatio(const FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    return Model.GetCustomSkillEnergyRatio();
}
bool __UIGetter_ShowArrow(const FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    return Model.GetShowArrow();
}
TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing> __UIGetter_Self(const FVMS_SkillInfo_Avatar_ShuiJing &inout Model)
{
    return TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing>(Model);
}
int __IndexOf_VM_SpecialAttackButton()
{
    return 0;
}
int __IndexOf_VM_SimpleSkillButton()
{
    return 1;
}
int __IndexOf_VM_ExtraSkillButton()
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
int __IndexOf_PlayerPawnEntity()
{
    return 5;
}
int __IndexOf_ChargeState()
{
    return 6;
}
int __IndexOf_IdentifyName_ShuiJing_PowerArrow()
{
    return 7;
}
int __IndexOf_Num_PowerArrow()
{
    return 8;
}
int __IndexOf_ShowArrow()
{
    return 9;
}
}
namespace __GeneratedProperties_FVMS_SkillInfo_Avatar_ShuiJing
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
