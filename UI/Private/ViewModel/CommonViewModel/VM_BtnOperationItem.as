
namespace FVM_BtnOperationItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExecuteOnClickGoTo = FEUIModelCallbackSignature();

}
struct FVM_BtnOperationItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FSoftBrush m_Image;
    UPROPERTY()
    bool m_bShowClick;
    UPROPERTY()
    int m_SwitcherIndex;
    UPROPERTY()
    FEUIModelRef m_ClickModelRef;
    UPROPERTY()
    FClickedWithModelRef m_OnClickGoToCallback;

    FVM_BtnOperationItem()
    {
        this.m_bShowClick = false;
        this.m_SwitcherIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BtnOperationItem' by default constructor.");
        return;
    }
    FVM_BtnOperationItem(const FVM_BtnOperationItem &inout Other)
    {
        this.m_bShowClick = false;
        this.m_SwitcherIndex = 0;
        this.m_Title = Other.m_Title;
        this.m_Image = Other.m_Image;
        this.m_bShowClick = Other.m_bShowClick;
        this.m_SwitcherIndex = int(Other.m_SwitcherIndex);
        this.m_ClickModelRef = Other.m_ClickModelRef;
        return;
    }
    FVM_BtnOperationItem(const FText &inout InTitle, const FSoftBrush &inout InImage)
    {
        this.m_bShowClick = false;
        this.m_SwitcherIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTitle(InTitle);
        this.SetImage(InImage);
        return;
    }
    FVM_BtnOperationItem& opAssign(const FVM_BtnOperationItem &inout Other)
    {
        this.m_Title = Other.m_Title;
        this.m_Image = Other.m_Image;
        this.m_bShowClick = Other.m_bShowClick;
        this.m_SwitcherIndex = int(Other.m_SwitcherIndex);
        return Other.m_ClickModelRef;
    }
    void OnClickGoTo()
    {
        if (this.GetClickModelRef().IsValid() && this.GetOnClickGoToCallback().IsBound())
        {
            FEUIWidgetModelCallbackBuilder::MakeCallback(FEUIModelRef(this), FVM_BtnOperationItem::ExecuteOnClickGoTo).EnqueueCallback();
        }
        return;
    }
    void ExecuteOnClickGoTo()
    {
        if (this.GetClickModelRef().IsValid() && this.GetOnClickGoToCallback().IsBound())
        {
            this.GetOnClickGoToCallback().Execute(this.GetClickModelRef());
        }
        return;
    }
    FText GetTitle() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Title() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Title = __Value;
        return;
    }
    const FSoftBrush GetImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_Image() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Image = __Value;
        return;
    }
    bool GetbShowClick() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bShowClick;
    }
    void SetbShowClick(const bool __Value) property
    {
        if (!(this.m_bShowClick) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bShowClick = __Value;
        return;
    }
    int GetSwitcherIndex() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SwitcherIndex;
    }
    void SetSwitcherIndex(const int __Value) property
    {
        if (this.m_SwitcherIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SwitcherIndex = __Value;
        return;
    }
    const FEUIModelRef GetClickModelRef() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelRef GetModify_ClickModelRef() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetClickModelRef(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ClickModelRef = __Value;
        return;
    }
    const FClickedWithModelRef GetOnClickGoToCallback() const property
    {
        const FClickedWithModelRef __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FClickedWithModelRef GetModify_OnClickGoToCallback() property
    {
        FClickedWithModelRef __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetOnClickGoToCallback(const FClickedWithModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
}

struct __GeneratedProperties_FVM_BtnOperationItem
{
    UPROPERTY()
    TEUIModelRef<FVM_BtnOperationItem> Self;

    __GeneratedProperties_FVM_BtnOperationItem()
    {
        return;
    }
}

namespace FVM_BtnOperationItem
{
FVM_BtnOperationItem& Create(const UObject ContextObject, const FText &inout Title, const FSoftBrush &inout Image)
{
    return FVM_BtnOperationItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Title, Image);
}
FVM_BtnOperationItem CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Title, const FSoftBrush &inout Image)
{
    FVM_BtnOperationItem __r;
    TEUIModelRef<FVM_BtnOperationItem> local_6 = TEUIModelRef<FVM_BtnOperationItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BtnOperationItem::ModelId, 0, Title, Image));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Image";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowClick";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BtnOperationItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BtnOperationItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BtnOperationItem;
}
FText __UIGetter_Title(const FVM_BtnOperationItem &inout Model)
{
    return Model.GetTitle();
}
FSoftBrush __UIGetter_Image(const FVM_BtnOperationItem &inout Model)
{
    return Model.GetImage();
}
bool __UIGetter_bShowClick(const FVM_BtnOperationItem &inout Model)
{
    return Model.GetbShowClick();
}
int __UIGetter_SwitcherIndex(const FVM_BtnOperationItem &inout Model)
{
    return Model.GetSwitcherIndex();
}
TEUIModelRef<FVM_BtnOperationItem> __UIGetter_Self(const FVM_BtnOperationItem &inout Model)
{
    return TEUIModelRef<FVM_BtnOperationItem>(Model);
}
int __IndexOf_Title()
{
    return 0;
}
int __IndexOf_Image()
{
    return 1;
}
int __IndexOf_bShowClick()
{
    return 2;
}
int __IndexOf_SwitcherIndex()
{
    return 3;
}
int __IndexOf_ClickModelRef()
{
    return 4;
}
int __IndexOf_OnClickGoToCallback()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_BtnOperationItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
