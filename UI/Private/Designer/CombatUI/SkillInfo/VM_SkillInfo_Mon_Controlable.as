
namespace FVMS_SkillInfo_Mon_Controlable
{
    const int ModelId = 0;

}
struct FVMS_SkillInfo_Mon_Controlable : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FEUIModelRef m_VM_SkillQButton;
    UPROPERTY()
    FEUIModelRef m_VM_SkillEButton;
    UPROPERTY()
    FEUIModelRef m_VM_UltraSkillButton;
    UPROPERTY()
    float32 m_ControlEnergyRatio;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;

    FVMS_SkillInfo_Mon_Controlable()
    {
        this.m_ControlEnergyRatio = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SkillInfo_Mon_Controlable(const FVMS_SkillInfo_Mon_Controlable &inout Other)
    {
        this.m_ControlEnergyRatio = 0.0f;
        this.m_VM_SkillQButton = Other.m_VM_SkillQButton;
        this.m_VM_SkillEButton = Other.m_VM_SkillEButton;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_ControlEnergyRatio = Other.m_ControlEnergyRatio;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        return;
    }
    FVMS_SkillInfo_Mon_Controlable& opAssign(const FVMS_SkillInfo_Mon_Controlable &inout Other)
    {
        this.m_VM_SkillQButton = Other.m_VM_SkillQButton;
        this.m_VM_SkillEButton = Other.m_VM_SkillEButton;
        this.m_VM_UltraSkillButton = Other.m_VM_UltraSkillButton;
        this.m_ControlEnergyRatio = Other.m_ControlEnergyRatio;
        return Other.m_PlayerPawnEntity;
    }
    void PostConstruct()
    {
        this.SetVM_SkillQButton(FEUIModelRef());
        Get local_6;
        local_6.opCall().SetSkillProgressType(ESkillProgressType(0));
        this.SetVM_SkillEButton(FEUIModelRef());
        local_6.opCall().SetSkillProgressType(ESkillProgressType(0));
        this.SetVM_UltraSkillButton(FEUIModelRef());
        local_6.opCall().SetSkillProgressType(ESkillProgressType(2));
        local_6.opCall().SetSkillButtonType(ESkillButtonType(2));
        return;
    }
    void Tick()
    {
        int local_16 = 0;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        this.SetPlayerPawnEntity(::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn()));
        if ((FECSEntity(this.GetPlayerPawnEntity()) == ENTITY_NULL))
        {
            return;
        }
        if (!(local_16))
        {
            return;
        }
        FNameHandle_EntityBBVar local_22;
        local_22;
        if (this.GetPlayerPawnEntity().HasEntityBB(local_22))
        {
            FNameHandle_EntityBBVarFloat local_28;
            local_28;
            float32 local_29 = this.GetPlayerPawnEntity().GetBB_Float(local_28);
            local_28;
            float32 local_23 = this.GetPlayerPawnEntity().GetBB_Float(local_28);
            if (local_29 != 0.0f)
            {
                this.SetControlEnergyRatio(local_23 / local_29);
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
        local_4 = FSkillUtils::GetSkillIndex(this.GetPlayerPawnEntity(), ESkillSlot(5));
        const FC_SkillInstance& local_30 = FSkillUtils::GetSkillInstance(this.GetPlayerPawnEntity(), local_4, local_5);
        if (local_5)
        {
            TSoftObjectPtr<USkillConfig> local_24_3 = local_30.GetSkillConfig();
            local_14.SetSkillConfig(local_26);
        }
        return;
    }
    const FEUIModelRef GetVM_SkillQButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_VM_SkillQButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetVM_SkillQButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_VM_SkillQButton = __Value;
        return;
    }
    const FEUIModelRef GetVM_SkillEButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_VM_SkillEButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetVM_SkillEButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_VM_SkillEButton = __Value;
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
    const float32 GetControlEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_ControlEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetControlEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ControlEnergyRatio = __Value;
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
}

struct __GeneratedProperties_FVMS_SkillInfo_Mon_Controlable
{
    UPROPERTY()
    TEUIModelRef<FVMS_SkillInfo_Mon_Controlable> Self;

    __GeneratedProperties_FVMS_SkillInfo_Mon_Controlable()
    {
        return;
    }
}

namespace FVMS_SkillInfo_Mon_Controlable
{
FVMS_SkillInfo_Mon_Controlable& Get(const UObject ContextObject)
{
    return FVMS_SkillInfo_Mon_Controlable::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SkillInfo_Mon_Controlable GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SkillInfo_Mon_Controlable __r;
    TEUIModelRef<FVMS_SkillInfo_Mon_Controlable> local_6 = TEUIModelRef<FVMS_SkillInfo_Mon_Controlable>(EUIInternal::MakeModelWithManager(Manager, FVMS_SkillInfo_Mon_Controlable::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "VM_SkillQButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_SkillEButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_UltraSkillButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ControlEnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SkillInfo_Mon_Controlable>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SkillInfo_Mon_Controlable;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnPlayerPawnEntityChanged";
    local_24.DirtyFlags.Set(FVMS_SkillInfo_Mon_Controlable::__IndexOf_PlayerPawnEntity());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SkillInfo_Mon_Controlable;
}
void __Tick(FVMS_SkillInfo_Mon_Controlable &inout Model)
{
    Model.Tick();
    return;
}
void __OnPlayerPawnEntityChanged(FVMS_SkillInfo_Mon_Controlable &inout Model)
{
    Model.OnPlayerPawnEntityChanged();
    return;
}
FEUIModelRef __UIGetter_VM_SkillQButton(const FVMS_SkillInfo_Mon_Controlable &inout Model)
{
    return Model.GetVM_SkillQButton();
}
FEUIModelRef __UIGetter_VM_SkillEButton(const FVMS_SkillInfo_Mon_Controlable &inout Model)
{
    return Model.GetVM_SkillEButton();
}
FEUIModelRef __UIGetter_VM_UltraSkillButton(const FVMS_SkillInfo_Mon_Controlable &inout Model)
{
    return Model.GetVM_UltraSkillButton();
}
float32 __UIGetter_ControlEnergyRatio(const FVMS_SkillInfo_Mon_Controlable &inout Model)
{
    return Model.GetControlEnergyRatio();
}
TEUIModelRef<FVMS_SkillInfo_Mon_Controlable> __UIGetter_Self(const FVMS_SkillInfo_Mon_Controlable &inout Model)
{
    return TEUIModelRef<FVMS_SkillInfo_Mon_Controlable>(Model);
}
int __IndexOf_VM_SkillQButton()
{
    return 0;
}
int __IndexOf_VM_SkillEButton()
{
    return 1;
}
int __IndexOf_VM_UltraSkillButton()
{
    return 2;
}
int __IndexOf_ControlEnergyRatio()
{
    return 3;
}
int __IndexOf_PlayerPawnEntity()
{
    return 4;
}
}
namespace __GeneratedProperties_FVMS_SkillInfo_Mon_Controlable
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
