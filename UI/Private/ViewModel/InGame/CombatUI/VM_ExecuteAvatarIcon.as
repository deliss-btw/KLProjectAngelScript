
namespace FVM_ExecuteAvatarIcon
{
    const int ModelId = 0;

}
struct FExecuteAvatarIconModelData
{
    UPROPERTY()
    FECSEntity Entity;

    FExecuteAvatarIconModelData()
    {
        return;
    }
}

struct FVM_ExecuteAvatarIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    int m_IconSwitchState;

    FVM_ExecuteAvatarIcon()
    {
        this.m_IconSwitchState = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ExecuteAvatarIcon' by default constructor.");
        return;
    }
    FVM_ExecuteAvatarIcon(const FVM_ExecuteAvatarIcon &inout Other)
    {
        this.m_IconSwitchState = 0;
        this.m_Entity = Other.m_Entity;
        this.m_IconSwitchState = int(Other.m_IconSwitchState);
        return;
    }
    FVM_ExecuteAvatarIcon(const FECSEntity &inout InEntity)
    {
        this.m_IconSwitchState = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEntity(InEntity);
        return;
    }
    FVM_ExecuteAvatarIcon opAssign(const FVM_ExecuteAvatarIcon &inout Other)
    {
        FVM_ExecuteAvatarIcon __r;
        this.m_Entity = Other.m_Entity;
        this.m_IconSwitchState = int(Other.m_IconSwitchState);
        return __r;
    }
    void PostConstruct()
    {
        if (this.GetEntity().IsValid())
        {
            this.SetIconSwitchState(1);
            return;
        }
        this.SetIconSwitchState(0);
        return;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Entity = __Value;
        return;
    }
    int GetIconSwitchState() const property
    {
        this.TrackPropertyRead(1);
        return this.m_IconSwitchState;
    }
    void SetIconSwitchState(const int __Value) property
    {
        if (this.m_IconSwitchState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_IconSwitchState = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ExecuteAvatarIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_ExecuteAvatarIcon> Self;

    __GeneratedProperties_FVM_ExecuteAvatarIcon()
    {
        return;
    }
}

namespace FVM_ExecuteAvatarIcon
{
FVM_ExecuteAvatarIcon& Create(const UObject ContextObject, const FECSEntity &inout Entity)
{
    return FVM_ExecuteAvatarIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Entity);
}
FVM_ExecuteAvatarIcon CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout Entity)
{
    FVM_ExecuteAvatarIcon __r;
    TEUIModelRef<FVM_ExecuteAvatarIcon> local_6 = TEUIModelRef<FVM_ExecuteAvatarIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ExecuteAvatarIcon::ModelId, 0, Entity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IconSwitchState";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ExecuteAvatarIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ExecuteAvatarIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ExecuteAvatarIcon;
}
int __UIGetter_IconSwitchState(const FVM_ExecuteAvatarIcon &inout Model)
{
    return Model.GetIconSwitchState();
}
TEUIModelRef<FVM_ExecuteAvatarIcon> __UIGetter_Self(const FVM_ExecuteAvatarIcon &inout Model)
{
    return TEUIModelRef<FVM_ExecuteAvatarIcon>(Model);
}
int __IndexOf_Entity()
{
    return 0;
}
int __IndexOf_IconSwitchState()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ExecuteAvatarIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
