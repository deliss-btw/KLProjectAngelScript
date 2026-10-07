
namespace FVM_StoryDialogOption
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectOption = FEUIModelCallbackSignature();

}
struct FVM_StoryDialogOption : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_OptionIndex;
    UPROPERTY()
    FText m_OptionContent;

    FVM_StoryDialogOption()
    {
        this.m_OptionIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_StoryDialogOption(const FVM_StoryDialogOption &inout Other)
    {
        this.m_OptionIndex = 0;
        this.m_OptionIndex = int(Other.m_OptionIndex);
        this.m_OptionContent = Other.m_OptionContent;
        return;
    }
    FVM_StoryDialogOption& opAssign(const FVM_StoryDialogOption &inout Other)
    {
        this.m_OptionIndex = int(Other.m_OptionIndex);
        return Other.m_OptionContent;
    }
    void SelectOption()
    {
        FFPTime local_10 = FFPTime(-1);
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        FCE_StoryDialogSelect local_14;
        local_14.SelectedIndex = this.GetOptionIndex();
        return;
    }
    int GetOptionIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_OptionIndex;
    }
    void SetOptionIndex(const int __Value) property
    {
        if (this.m_OptionIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OptionIndex = __Value;
        return;
    }
    const FText GetOptionContent() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_OptionContent() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOptionContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_OptionContent = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_StoryDialogOption
{
    UPROPERTY()
    TEUIModelRef<FVM_StoryDialogOption> Self;

    __GeneratedProperties_FVM_StoryDialogOption()
    {
        return;
    }
}

namespace FVM_StoryDialogOption
{
FVM_StoryDialogOption& Create(const UObject ContextObject)
{
    return FVM_StoryDialogOption::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_StoryDialogOption CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_StoryDialogOption __r;
    TEUIModelRef<FVM_StoryDialogOption> local_6 = TEUIModelRef<FVM_StoryDialogOption>(EUIInternal::MakeModelWithManager(Manager, FVM_StoryDialogOption::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "OptionContent";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_StoryDialogOption>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_StoryDialogOption;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_StoryDialogOption;
}
FText __UIGetter_OptionContent(const FVM_StoryDialogOption &inout Model)
{
    return Model.GetOptionContent();
}
TEUIModelRef<FVM_StoryDialogOption> __UIGetter_Self(const FVM_StoryDialogOption &inout Model)
{
    return TEUIModelRef<FVM_StoryDialogOption>(Model);
}
int __IndexOf_OptionIndex()
{
    return 0;
}
int __IndexOf_OptionContent()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_StoryDialogOption
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
