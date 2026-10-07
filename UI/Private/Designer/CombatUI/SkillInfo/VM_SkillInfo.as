
namespace FVMS_SkillInfo
{
    const int ModelId = 0;

}
struct FVMS_SkillInfo : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FEUIModelRef m_VM_BasePrefab_CustomSkillInfo;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;

    FVMS_SkillInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SkillInfo(const FVMS_SkillInfo &inout Other)
    {
        this.m_VM_BasePrefab_CustomSkillInfo = Other.m_VM_BasePrefab_CustomSkillInfo;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        return;
    }
    FVMS_SkillInfo& opAssign(const FVMS_SkillInfo &inout Other)
    {
        this.m_VM_BasePrefab_CustomSkillInfo = Other.m_VM_BasePrefab_CustomSkillInfo;
        return Other.m_PlayerPawnEntity;
    }
    void PostConstruct()
    {
        return;
    }
    void Tick()
    {
        int local_20 = 0;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        this.SetPlayerPawnEntity(::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn()));
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        if ((FECSEntity(this.GetPlayerPawnEntity()) == ENTITY_NULL))
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        return;
    }
    void OnPlayerPawnEntityChanged()
    {
        return;
    }
    const FEUIModelRef GetVM_BasePrefab_CustomSkillInfo() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_VM_BasePrefab_CustomSkillInfo() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetVM_BasePrefab_CustomSkillInfo(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_VM_BasePrefab_CustomSkillInfo = __Value;
        return;
    }
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_PlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerPawnEntity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SkillInfo
{
    UPROPERTY()
    TEUIModelRef<FVMS_SkillInfo> Self;

    __GeneratedProperties_FVMS_SkillInfo()
    {
        return;
    }
}

namespace FVMS_SkillInfo
{
FVMS_SkillInfo& Get(const UObject ContextObject)
{
    return FVMS_SkillInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SkillInfo GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SkillInfo __r;
    TEUIModelRef<FVMS_SkillInfo> local_6 = TEUIModelRef<FVMS_SkillInfo>(EUIInternal::MakeModelWithManager(Manager, FVMS_SkillInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "VM_BasePrefab_CustomSkillInfo";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SkillInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SkillInfo;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnPlayerPawnEntityChanged";
    local_24.DirtyFlags.Set(FVMS_SkillInfo::__IndexOf_PlayerPawnEntity());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SkillInfo;
}
void __Tick(FVMS_SkillInfo &inout Model)
{
    Model.Tick();
    return;
}
void __OnPlayerPawnEntityChanged(FVMS_SkillInfo &inout Model)
{
    Model.OnPlayerPawnEntityChanged();
    return;
}
FEUIModelRef __UIGetter_VM_BasePrefab_CustomSkillInfo(const FVMS_SkillInfo &inout Model)
{
    return Model.GetVM_BasePrefab_CustomSkillInfo();
}
TEUIModelRef<FVMS_SkillInfo> __UIGetter_Self(const FVMS_SkillInfo &inout Model)
{
    return TEUIModelRef<FVMS_SkillInfo>(Model);
}
int __IndexOf_VM_BasePrefab_CustomSkillInfo()
{
    return 0;
}
int __IndexOf_PlayerPawnEntity()
{
    return 1;
}
}
namespace __GeneratedProperties_FVMS_SkillInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
