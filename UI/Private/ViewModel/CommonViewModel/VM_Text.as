
namespace FVM_Text
{
    const int ModelId = 0;
}
namespace FVM_TitleAndDesc
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExecuteOnClickGoTo = FEUIModelCallbackSignature();
}
namespace FVM_TitleAndDescAndStatus
{
    const int ModelId = 0;

}
struct FVM_Text : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Text;

    FVM_Text()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Text' by default constructor.");
        return;
    }
    FVM_Text(const FVM_Text &inout Other)
    {
        this.m_Text = Other.m_Text;
        return;
    }
    FVM_Text(const FText &inout InText)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetText(InText);
        return;
    }
    FVM_Text& opAssign(const FVM_Text &inout Other)
    {
        return Other.m_Text;
    }
    FText GetText() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Text() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Text = __Value;
        return;
    }
}

struct FVM_TitleAndDesc : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_Desc;
    UPROPERTY()
    bool m_bShowClick;
    UPROPERTY()
    int m_SwitcherIndex;
    UPROPERTY()
    FEUIModelRef m_ClickModelRef;
    UPROPERTY()
    FClickedWithModelRef m_OnClickGoToCallback;

    FVM_TitleAndDesc()
    {
        this.m_bShowClick = false;
        this.m_SwitcherIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TitleAndDesc' by default constructor.");
        return;
    }
    FVM_TitleAndDesc(const FVM_TitleAndDesc &inout Other)
    {
        this.m_bShowClick = false;
        this.m_SwitcherIndex = 0;
        this.m_Title = Other.m_Title;
        this.m_Desc = Other.m_Desc;
        this.m_bShowClick = Other.m_bShowClick;
        this.m_SwitcherIndex = int(Other.m_SwitcherIndex);
        this.m_ClickModelRef = Other.m_ClickModelRef;
        return;
    }
    FVM_TitleAndDesc(const FText &inout InTitle, const FText &inout InDesc)
    {
        this.m_bShowClick = false;
        this.m_SwitcherIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTitle(InTitle);
        this.SetDesc(InDesc);
        return;
    }
    FVM_TitleAndDesc& opAssign(const FVM_TitleAndDesc &inout Other)
    {
        this.m_Title = Other.m_Title;
        this.m_Desc = Other.m_Desc;
        this.m_bShowClick = Other.m_bShowClick;
        this.m_SwitcherIndex = int(Other.m_SwitcherIndex);
        return Other.m_ClickModelRef;
    }
    void OnClickGoTo()
    {
        if (this.GetClickModelRef().IsValid() && this.GetOnClickGoToCallback().IsBound())
        {
            FEUIWidgetModelCallbackBuilder::MakeCallback(FEUIModelRef(this), FVM_TitleAndDesc::ExecuteOnClickGoTo).EnqueueCallback();
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
    FText GetDesc() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Desc() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Desc = __Value;
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

struct FVM_TitleAndDescAndStatus : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_Desc;
    UPROPERTY()
    bool m_bDone;

    FVM_TitleAndDescAndStatus()
    {
        this.m_bDone = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TitleAndDescAndStatus' by default constructor.");
        return;
    }
    FVM_TitleAndDescAndStatus(const FVM_TitleAndDescAndStatus &inout Other)
    {
        this.m_bDone = false;
        this.m_Title = Other.m_Title;
        this.m_Desc = Other.m_Desc;
        this.m_bDone = Other.m_bDone;
        return;
    }
    FVM_TitleAndDescAndStatus(const FText &inout InTitle, const FText &inout InDesc)
    {
        this.m_bDone = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTitle(InTitle);
        this.SetDesc(InDesc);
        return;
    }
    FVM_TitleAndDescAndStatus opAssign(const FVM_TitleAndDescAndStatus &inout Other)
    {
        FVM_TitleAndDescAndStatus __r;
        this.m_Title = Other.m_Title;
        this.m_Desc = Other.m_Desc;
        this.m_bDone = Other.m_bDone;
        return __r;
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
    FText GetDesc() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Desc() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Desc = __Value;
        return;
    }
    bool GetbDone() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bDone;
    }
    void SetbDone(const bool __Value) property
    {
        if (!(this.m_bDone) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bDone = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Text
{
    UPROPERTY()
    TEUIModelRef<FVM_Text> Self;

    __GeneratedProperties_FVM_Text()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_TitleAndDesc
{
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDesc> Self;

    __GeneratedProperties_FVM_TitleAndDesc()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_TitleAndDescAndStatus
{
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDescAndStatus> Self;

    __GeneratedProperties_FVM_TitleAndDescAndStatus()
    {
        return;
    }
}

namespace FVM_Text
{
FVM_Text& Create(const UObject ContextObject, const FText &inout Text)
{
    return FVM_Text::CreateByManager(EUIInternal::GetContextManager(ContextObject), Text);
}
FVM_Text CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Text)
{
    FVM_Text __r;
    TEUIModelRef<FVM_Text> local_6 = TEUIModelRef<FVM_Text>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Text::ModelId, 0, Text));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Text";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Text>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Text;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Text;
}
FText __UIGetter_Text(const FVM_Text &inout Model)
{
    return Model.GetText();
}
TEUIModelRef<FVM_Text> __UIGetter_Self(const FVM_Text &inout Model)
{
    return TEUIModelRef<FVM_Text>(Model);
}
int __IndexOf_Text()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_Text
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TitleAndDesc
{
FVM_TitleAndDesc& Create(const UObject ContextObject, const FText &inout Title, const FText &inout Desc)
{
    return FVM_TitleAndDesc::CreateByManager(EUIInternal::GetContextManager(ContextObject), Title, Desc);
}
FVM_TitleAndDesc CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Title, const FText &inout Desc)
{
    FVM_TitleAndDesc __r;
    TEUIModelRef<FVM_TitleAndDesc> local_6 = TEUIModelRef<FVM_TitleAndDesc>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TitleAndDesc::ModelId, 0, Title, Desc));
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
    local_14.PropertyName = "Desc";
    local_14.TypeName = "FText";
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
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDesc>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TitleAndDesc;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TitleAndDesc;
}
FText __UIGetter_Title(const FVM_TitleAndDesc &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Desc(const FVM_TitleAndDesc &inout Model)
{
    return Model.GetDesc();
}
bool __UIGetter_bShowClick(const FVM_TitleAndDesc &inout Model)
{
    return Model.GetbShowClick();
}
int __UIGetter_SwitcherIndex(const FVM_TitleAndDesc &inout Model)
{
    return Model.GetSwitcherIndex();
}
TEUIModelRef<FVM_TitleAndDesc> __UIGetter_Self(const FVM_TitleAndDesc &inout Model)
{
    return TEUIModelRef<FVM_TitleAndDesc>(Model);
}
int __IndexOf_Title()
{
    return 0;
}
int __IndexOf_Desc()
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
namespace __GeneratedProperties_FVM_TitleAndDesc
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TitleAndDescAndStatus
{
FVM_TitleAndDescAndStatus& Create(const UObject ContextObject, const FText &inout Title, const FText &inout Desc)
{
    return FVM_TitleAndDescAndStatus::CreateByManager(EUIInternal::GetContextManager(ContextObject), Title, Desc);
}
FVM_TitleAndDescAndStatus CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Title, const FText &inout Desc)
{
    FVM_TitleAndDescAndStatus __r;
    TEUIModelRef<FVM_TitleAndDescAndStatus> local_6 = TEUIModelRef<FVM_TitleAndDescAndStatus>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TitleAndDescAndStatus::ModelId, 0, Title, Desc));
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
    local_14.PropertyName = "Desc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bDone";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDescAndStatus>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TitleAndDescAndStatus;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TitleAndDescAndStatus;
}
FText __UIGetter_Title(const FVM_TitleAndDescAndStatus &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Desc(const FVM_TitleAndDescAndStatus &inout Model)
{
    return Model.GetDesc();
}
bool __UIGetter_bDone(const FVM_TitleAndDescAndStatus &inout Model)
{
    return Model.GetbDone();
}
TEUIModelRef<FVM_TitleAndDescAndStatus> __UIGetter_Self(const FVM_TitleAndDescAndStatus &inout Model)
{
    return TEUIModelRef<FVM_TitleAndDescAndStatus>(Model);
}
int __IndexOf_Title()
{
    return 0;
}
int __IndexOf_Desc()
{
    return 1;
}
int __IndexOf_bDone()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_TitleAndDescAndStatus
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
