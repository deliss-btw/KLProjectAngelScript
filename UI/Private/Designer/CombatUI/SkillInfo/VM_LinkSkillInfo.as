
namespace FVMS_LinkSkillInfo
{
    const int ModelId = 0;

}
struct FVMS_LinkSkillInfo : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FEUIModelRef m_VM_LinkSkillButton;

    FVMS_LinkSkillInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_LinkSkillInfo(const FVMS_LinkSkillInfo &inout Other)
    {
        this.m_VM_LinkSkillButton = Other.m_VM_LinkSkillButton;
        return;
    }
    FVMS_LinkSkillInfo& opAssign(const FVMS_LinkSkillInfo &inout Other)
    {
        return Other.m_VM_LinkSkillButton;
    }
    void PostConstruct()
    {
        this.SetVM_LinkSkillButton(FEUIModelRef());
        Get local_6;
        local_6.opCall().SetSkillButtonType(ESkillButtonType(5));
        local_6.opCall().SetSkillProgressType(ESkillProgressType(0));
        this.RefreshLinkSkillConfig();
        return;
    }
    void OnQuickSlotChanged(const FC_DivineSkill &inout DivineSkill)
    {
        this.RefreshLinkSkillConfig();
        return;
    }
    void RefreshLinkSkillConfig()
    {
        TEUIModelRef<FM_DivineSkill> local_2 = ::FMS_DivineSkillData::Get(this.GetContext().Manager).GetLocalPlayerDivineSkill();
        if (local_2)
        {
            TDataObjectPtr<FDivineSkillConfig> local_30 = local_2.opArrow().GetConfig();
            if (local_30)
            {
                Get local_58;
                local_58.opCall().SetSkillConfig(local_30.opArrow().SkillConfig);
            }
        }
        return;
    }
    const FEUIModelRef GetVM_LinkSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_VM_LinkSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetVM_LinkSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_VM_LinkSkillButton = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_LinkSkillInfo
{
    UPROPERTY()
    TEUIModelRef<FVMS_LinkSkillInfo> Self;

    __GeneratedProperties_FVMS_LinkSkillInfo()
    {
        return;
    }
}

namespace FVMS_LinkSkillInfo
{
FVMS_LinkSkillInfo& Get(const UObject ContextObject)
{
    return FVMS_LinkSkillInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_LinkSkillInfo GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_LinkSkillInfo __r;
    TEUIModelRef<FVMS_LinkSkillInfo> local_6 = TEUIModelRef<FVMS_LinkSkillInfo>(EUIInternal::MakeModelWithManager(Manager, FVMS_LinkSkillInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "VM_LinkSkillButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_LinkSkillInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_LinkSkillInfo;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnQuickSlotChanged";
    local_26.ComponentType = FC_DivineSkill;
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_LinkSkillInfo;
}
void __OnQuickSlotChanged(FVMS_LinkSkillInfo &inout Model, const FECSEntity &inout Entity, const FC_DivineSkill &inout Component)
{
    Model.OnQuickSlotChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
FEUIModelRef __UIGetter_VM_LinkSkillButton(const FVMS_LinkSkillInfo &inout Model)
{
    return Model.GetVM_LinkSkillButton();
}
TEUIModelRef<FVMS_LinkSkillInfo> __UIGetter_Self(const FVMS_LinkSkillInfo &inout Model)
{
    return TEUIModelRef<FVMS_LinkSkillInfo>(Model);
}
int __IndexOf_VM_LinkSkillButton()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_LinkSkillInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
