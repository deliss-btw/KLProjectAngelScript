
namespace FVM_InteractTarget
{
    const int ModelId = 0;

}
struct FVM_InteractTarget : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_TargetEntity;

    FVM_InteractTarget()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InteractTarget' by default constructor.");
        return;
    }
    FVM_InteractTarget(const FVM_InteractTarget &inout Other)
    {
        this.m_TargetEntity = Other.m_TargetEntity;
        return;
    }
    FVM_InteractTarget(const FECSEntity &inout InTargetEntity)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTargetEntity(InTargetEntity);
        return;
    }
    FVM_InteractTarget& opAssign(const FVM_InteractTarget &inout Other)
    {
        return Other.m_TargetEntity;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TargetEntity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_InteractTarget
{
    UPROPERTY()
    TEUIModelRef<FVM_InteractTarget> Self;

    __GeneratedProperties_FVM_InteractTarget()
    {
        return;
    }
}

namespace FVM_InteractTarget
{
FVM_InteractTarget& Create(const UObject ContextObject, const FECSEntity &inout TargetEntity)
{
    return FVM_InteractTarget::CreateByManager(EUIInternal::GetContextManager(ContextObject), TargetEntity);
}
FVM_InteractTarget CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout TargetEntity)
{
    FVM_InteractTarget __r;
    TEUIModelRef<FVM_InteractTarget> local_6 = TEUIModelRef<FVM_InteractTarget>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InteractTarget::ModelId, 0, TargetEntity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TargetEntity";
    local_14.TypeName = "FECSEntity";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InteractTarget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InteractTarget;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InteractTarget;
}
FECSEntity __UIGetter_TargetEntity(const FVM_InteractTarget &inout Model)
{
    return Model.GetTargetEntity();
}
TEUIModelRef<FVM_InteractTarget> __UIGetter_Self(const FVM_InteractTarget &inout Model)
{
    return TEUIModelRef<FVM_InteractTarget>(Model);
}
int __IndexOf_TargetEntity()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_InteractTarget
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
