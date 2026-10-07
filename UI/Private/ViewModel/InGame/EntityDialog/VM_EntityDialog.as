
namespace FVM_EntityDialog
{
    const int ModelId = 0;

}
struct FVM_EntityDialog : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_Entity;

    FVM_EntityDialog()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_EntityDialog' by default constructor.");
        return;
    }
    FVM_EntityDialog(const FVM_EntityDialog &inout Other)
    {
        this.m_Entity = Other.m_Entity;
        return;
    }
    FVM_EntityDialog(const FECSEntity &inout InEntity)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEntity(InEntity);
        return;
    }
    FVM_EntityDialog& opAssign(const FVM_EntityDialog &inout Other)
    {
        return Other.m_Entity;
    }
    FText GetDialogText() const
    {
        Get local_4;
        const FC_EntityDialog& local_6 = local_4.opCall();
        if (local_6)
        {
            return FText::FromString(local_6.GetDialogText());
        }
        return FText();
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
}

struct __GeneratedProperties_FVM_EntityDialog
{
    UPROPERTY()
    FText DialogText;
    UPROPERTY()
    TEUIModelRef<FVM_EntityDialog> Self;

    __GeneratedProperties_FVM_EntityDialog()
    {
        return;
    }
}

namespace FVM_EntityDialog
{
FVM_EntityDialog& Create(const UObject ContextObject, const FECSEntity &inout Entity)
{
    return FVM_EntityDialog::CreateByManager(EUIInternal::GetContextManager(ContextObject), Entity);
}
FVM_EntityDialog CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout Entity)
{
    FVM_EntityDialog __r;
    TEUIModelRef<FVM_EntityDialog> local_6 = TEUIModelRef<FVM_EntityDialog>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_EntityDialog::ModelId, 0, Entity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DialogText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EntityDialog>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EntityDialog;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EntityDialog;
}
FText __UIGetter_DialogText(const FVM_EntityDialog &inout Model)
{
    return Model.GetDialogText();
}
TEUIModelRef<FVM_EntityDialog> __UIGetter_Self(const FVM_EntityDialog &inout Model)
{
    return TEUIModelRef<FVM_EntityDialog>(Model);
}
int __IndexOf_Entity()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_EntityDialog
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
