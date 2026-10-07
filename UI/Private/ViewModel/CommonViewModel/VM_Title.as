
namespace FVM_Title
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelected = FEUIModelCallbackSignature();

}
struct FVM_Title : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_TitleText;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    FTitleItemSelected m_OnSelected;

    FVM_Title()
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Title' by default constructor.");
        return;
    }
    FVM_Title(const FVM_Title &inout Other)
    {
        this.m_Index = 0;
        this.m_TitleText = Other.m_TitleText;
        this.m_Index = int(Other.m_Index);
        return;
    }
    FVM_Title(const FText &inout InTitleText)
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTitleText(InTitleText);
        return;
    }
    FVM_Title opAssign(const FVM_Title &inout Other)
    {
        FVM_Title __r;
        this.m_TitleText = Other.m_TitleText;
        this.m_Index = int(Other.m_Index);
        return __r;
    }
    void OnSelected()
    {
        if (this.GetOnSelected().IsBound())
        {
            this.GetOnSelected().Execute(FEUIModelRef(this));
        }
        return;
    }
    FText GetTitleText() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_TitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TitleText = __Value;
        return;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Index = __Value;
        return;
    }
    const FTitleItemSelected GetOnSelected() const property
    {
        const FTitleItemSelected __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FTitleItemSelected GetModify_OnSelected() property
    {
        FTitleItemSelected __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOnSelected(const FTitleItemSelected &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
}

struct __GeneratedProperties_FVM_Title
{
    UPROPERTY()
    TEUIModelRef<FVM_Title> Self;

    __GeneratedProperties_FVM_Title()
    {
        return;
    }
}

namespace FVM_Title
{
FVM_Title& Create(const UObject ContextObject, const FText &inout TitleText)
{
    return FVM_Title::CreateByManager(EUIInternal::GetContextManager(ContextObject), TitleText);
}
FVM_Title CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout TitleText)
{
    FVM_Title __r;
    TEUIModelRef<FVM_Title> local_6 = TEUIModelRef<FVM_Title>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Title::ModelId, 0, TitleText));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Title>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Title;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Title;
}
FText __UIGetter_TitleText(const FVM_Title &inout Model)
{
    return Model.GetTitleText();
}
TEUIModelRef<FVM_Title> __UIGetter_Self(const FVM_Title &inout Model)
{
    return TEUIModelRef<FVM_Title>(Model);
}
int __IndexOf_TitleText()
{
    return 0;
}
int __IndexOf_Index()
{
    return 1;
}
int __IndexOf_OnSelected()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_Title
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
