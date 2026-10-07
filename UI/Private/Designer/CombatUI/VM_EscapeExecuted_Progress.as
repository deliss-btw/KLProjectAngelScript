
namespace FVM_EscapeExecuted_Progress
{
    const int ModelId = 0;

}
struct FVM_EscapeExecuted_Progress : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_HintText;

    FVM_EscapeExecuted_Progress()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_EscapeExecuted_Progress(const FVM_EscapeExecuted_Progress &inout Other)
    {
        this.m_HintText = Other.m_HintText;
        return;
    }
    FVM_EscapeExecuted_Progress& opAssign(const FVM_EscapeExecuted_Progress &inout Other)
    {
        return Other.m_HintText;
    }
    void PostConstruct()
    {
        this.SetHintText(NSLOCTEXT("EscapeExecutedHint", "иїћз‚№жЊЈи„±жЋ§е€¶пјЃ"));
        return;
    }
    const FText GetHintText() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_HintText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetHintText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_HintText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EscapeExecuted_Progress
{
    UPROPERTY()
    TEUIModelRef<FVM_EscapeExecuted_Progress> Self;

    __GeneratedProperties_FVM_EscapeExecuted_Progress()
    {
        return;
    }
}

namespace FVM_EscapeExecuted_Progress
{
FVM_EscapeExecuted_Progress& Create(const UObject ContextObject)
{
    return FVM_EscapeExecuted_Progress::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_EscapeExecuted_Progress CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_EscapeExecuted_Progress __r;
    TEUIModelRef<FVM_EscapeExecuted_Progress> local_6 = TEUIModelRef<FVM_EscapeExecuted_Progress>(EUIInternal::MakeModelWithManager(Manager, FVM_EscapeExecuted_Progress::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HintText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EscapeExecuted_Progress>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EscapeExecuted_Progress;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EscapeExecuted_Progress;
}
FText __UIGetter_HintText(const FVM_EscapeExecuted_Progress &inout Model)
{
    return Model.GetHintText();
}
TEUIModelRef<FVM_EscapeExecuted_Progress> __UIGetter_Self(const FVM_EscapeExecuted_Progress &inout Model)
{
    return TEUIModelRef<FVM_EscapeExecuted_Progress>(Model);
}
int __IndexOf_HintText()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_EscapeExecuted_Progress
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
