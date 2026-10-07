
namespace FVM_LockHover
{
    const int ModelId = 0;

}
struct FVM_LockHover : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_TipText;

    FVM_LockHover()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_LockHover' by default constructor.");
        return;
    }
    FVM_LockHover(const FVM_LockHover &inout Other)
    {
        this.m_TipText = Other.m_TipText;
        return;
    }
    FVM_LockHover(const FText &inout InTipText)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTipText(InTipText);
        return;
    }
    FVM_LockHover& opAssign(const FVM_LockHover &inout Other)
    {
        return Other.m_TipText;
    }
    const FText GetTipText() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_TipText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTipText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TipText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_LockHover
{
    UPROPERTY()
    TEUIModelRef<FVM_LockHover> Self;

    __GeneratedProperties_FVM_LockHover()
    {
        return;
    }
}

namespace FVM_LockHover
{
FVM_LockHover& Create(const UObject ContextObject, const FText &inout TipText)
{
    return FVM_LockHover::CreateByManager(EUIInternal::GetContextManager(ContextObject), TipText);
}
FVM_LockHover CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout TipText)
{
    FVM_LockHover __r;
    TEUIModelRef<FVM_LockHover> local_6 = TEUIModelRef<FVM_LockHover>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_LockHover::ModelId, 0, TipText));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TipText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_LockHover>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_LockHover;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_LockHover;
}
FText __UIGetter_TipText(const FVM_LockHover &inout Model)
{
    return Model.GetTipText();
}
TEUIModelRef<FVM_LockHover> __UIGetter_Self(const FVM_LockHover &inout Model)
{
    return TEUIModelRef<FVM_LockHover>(Model);
}
int __IndexOf_TipText()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_LockHover
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
