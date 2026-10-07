
namespace FVM_TauntHintPointer
{
    const int ModelId = 0;

}
struct FVM_TauntHintPointer : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_TargetEntity;

    FVM_TauntHintPointer()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TauntHintPointer' by default constructor.");
        return;
    }
    FVM_TauntHintPointer(const FVM_TauntHintPointer &inout Other)
    {
        this.m_TargetEntity = Other.m_TargetEntity;
        return;
    }
    FVM_TauntHintPointer(const FECSEntity &inout InTargetEntity)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTargetEntity(InTargetEntity);
        return;
    }
    FVM_TauntHintPointer& opAssign(const FVM_TauntHintPointer &inout Other)
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

struct __GeneratedProperties_FVM_TauntHintPointer
{
    UPROPERTY()
    TEUIModelRef<FVM_TauntHintPointer> Self;

    __GeneratedProperties_FVM_TauntHintPointer()
    {
        return;
    }
}

namespace FVM_TauntHintPointer
{
FVM_TauntHintPointer& Create(const UObject ContextObject, const FECSEntity &inout TargetEntity)
{
    return FVM_TauntHintPointer::CreateByManager(EUIInternal::GetContextManager(ContextObject), TargetEntity);
}
FVM_TauntHintPointer CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout TargetEntity)
{
    FVM_TauntHintPointer __r;
    TEUIModelRef<FVM_TauntHintPointer> local_6 = TEUIModelRef<FVM_TauntHintPointer>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TauntHintPointer::ModelId, 0, TargetEntity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TauntHintPointer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TauntHintPointer;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TauntHintPointer;
}
TEUIModelRef<FVM_TauntHintPointer> __UIGetter_Self(const FVM_TauntHintPointer &inout Model)
{
    return TEUIModelRef<FVM_TauntHintPointer>(Model);
}
int __IndexOf_TargetEntity()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TauntHintPointer
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
