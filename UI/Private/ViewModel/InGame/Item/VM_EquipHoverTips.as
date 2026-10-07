
namespace FVM_EquipHoverTips
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExecuteOnClickGoTo = FEUIModelCallbackSignature();

}
struct FVM_EquipHoverTips : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_DisplayName;
    UPROPERTY()
    int m_EquipLevel;
    UPROPERTY()
    bool m_bIsShowLevel;
    UPROPERTY()
    bool m_bIsShowContent;
    UPROPERTY()
    FText m_ContentText;
    UPROPERTY()
    int m_ContentIndex;
    UPROPERTY()
    bool m_bCanHoverGoTo;
    UPROPERTY()
    FEquipHoverTipsClicked m_OnClickGoToCallback;
    UPROPERTY()
    FEUIModelRef m_ClickModelRef;
    UPROPERTY()
    TDataObjectPtr<FEUIWidgetConfig> m_OverrideClickWidgetConfig;

    FVM_EquipHoverTips()
    {
        this.m_EquipLevel = 0;
        this.m_bIsShowLevel = false;
        this.m_bIsShowContent = false;
        this.m_ContentIndex = 0;
        this.m_bCanHoverGoTo = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_EquipHoverTips(const FVM_EquipHoverTips &inout Other)
    {
        this.m_EquipLevel = 0;
        this.m_bIsShowLevel = false;
        this.m_bIsShowContent = false;
        this.m_ContentIndex = 0;
        this.m_bCanHoverGoTo = true;
        this.m_DisplayName = Other.m_DisplayName;
        this.m_EquipLevel = int(Other.m_EquipLevel);
        this.m_bIsShowLevel = Other.m_bIsShowLevel;
        this.m_bIsShowContent = Other.m_bIsShowContent;
        this.m_ContentText = Other.m_ContentText;
        this.m_ContentIndex = int(Other.m_ContentIndex);
        this.m_bCanHoverGoTo = Other.m_bCanHoverGoTo;
        this.m_ClickModelRef = Other.m_ClickModelRef;
        this.m_OverrideClickWidgetConfig = Other.m_OverrideClickWidgetConfig;
        return;
    }
    FVM_EquipHoverTips& opAssign(const FVM_EquipHoverTips &inout Other)
    {
        this.m_DisplayName = Other.m_DisplayName;
        this.m_EquipLevel = int(Other.m_EquipLevel);
        this.m_bIsShowLevel = Other.m_bIsShowLevel;
        this.m_bIsShowContent = Other.m_bIsShowContent;
        this.m_ContentText = Other.m_ContentText;
        this.m_ContentIndex = int(Other.m_ContentIndex);
        this.m_bCanHoverGoTo = Other.m_bCanHoverGoTo;
        this.m_ClickModelRef = Other.m_ClickModelRef;
        return Other.m_OverrideClickWidgetConfig;
    }
    void OnClickGoTo()
    {
        if (this.GetOnClickGoToCallback().IsBound())
        {
            FEUIWidgetModelCallbackBuilder::MakeCallback(FEUIModelRef(this), FVM_EquipHoverTips::ExecuteOnClickGoTo).EnqueueCallback();
        }
        return;
    }
    void ExecuteOnClickGoTo()
    {
        if (this.GetOnClickGoToCallback().IsBound())
        {
            this.GetOnClickGoToCallback().Execute(this.GetClickModelRef());
        }
        return;
    }
    FText GetDisplayName() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_DisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DisplayName = __Value;
        return;
    }
    int GetEquipLevel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_EquipLevel;
    }
    void SetEquipLevel(const int __Value) property
    {
        if (this.m_EquipLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EquipLevel = __Value;
        return;
    }
    bool GetbIsShowLevel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsShowLevel;
    }
    void SetbIsShowLevel(const bool __Value) property
    {
        if (!(this.m_bIsShowLevel) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsShowLevel = __Value;
        return;
    }
    bool GetbIsShowContent() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsShowContent;
    }
    void SetbIsShowContent(const bool __Value) property
    {
        if (!(this.m_bIsShowContent) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsShowContent = __Value;
        return;
    }
    const FText GetContentText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_ContentText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetContentText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ContentText = __Value;
        return;
    }
    int GetContentIndex() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ContentIndex;
    }
    void SetContentIndex(const int __Value) property
    {
        if (this.m_ContentIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ContentIndex = __Value;
        return;
    }
    bool GetbCanHoverGoTo() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bCanHoverGoTo;
    }
    void SetbCanHoverGoTo(const bool __Value) property
    {
        if (!(this.m_bCanHoverGoTo) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bCanHoverGoTo = __Value;
        return;
    }
    const FEquipHoverTipsClicked GetOnClickGoToCallback() const property
    {
        const FEquipHoverTipsClicked __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEquipHoverTipsClicked GetModify_OnClickGoToCallback() property
    {
        FEquipHoverTipsClicked __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetOnClickGoToCallback(const FEquipHoverTipsClicked &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        return;
    }
    const FEUIModelRef GetClickModelRef() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FEUIModelRef GetModify_ClickModelRef() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetClickModelRef(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ClickModelRef = __Value;
        return;
    }
    const TDataObjectPtr<FEUIWidgetConfig> GetOverrideClickWidgetConfig() const property
    {
        const TDataObjectPtr<FEUIWidgetConfig> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TDataObjectPtr<FEUIWidgetConfig> GetModify_OverrideClickWidgetConfig() property
    {
        TDataObjectPtr<FEUIWidgetConfig> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetOverrideClickWidgetConfig(const TDataObjectPtr<FEUIWidgetConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_OverrideClickWidgetConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EquipHoverTips
{
    UPROPERTY()
    TEUIModelRef<FVM_EquipHoverTips> Self;

    __GeneratedProperties_FVM_EquipHoverTips()
    {
        return;
    }
}

namespace FVM_EquipHoverTips
{
FVM_EquipHoverTips& Create(const UObject ContextObject)
{
    return FVM_EquipHoverTips::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_EquipHoverTips CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_EquipHoverTips __r;
    TEUIModelRef<FVM_EquipHoverTips> local_6 = TEUIModelRef<FVM_EquipHoverTips>(EUIInternal::MakeModelWithManager(Manager, FVM_EquipHoverTips::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsShowLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsShowContent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContentText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContentIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanHoverGoTo";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EquipHoverTips>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EquipHoverTips;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EquipHoverTips;
}
FText __UIGetter_DisplayName(const FVM_EquipHoverTips &inout Model)
{
    return Model.GetDisplayName();
}
int __UIGetter_EquipLevel(const FVM_EquipHoverTips &inout Model)
{
    return Model.GetEquipLevel();
}
bool __UIGetter_bIsShowLevel(const FVM_EquipHoverTips &inout Model)
{
    return Model.GetbIsShowLevel();
}
bool __UIGetter_bIsShowContent(const FVM_EquipHoverTips &inout Model)
{
    return Model.GetbIsShowContent();
}
FText __UIGetter_ContentText(const FVM_EquipHoverTips &inout Model)
{
    return Model.GetContentText();
}
int __UIGetter_ContentIndex(const FVM_EquipHoverTips &inout Model)
{
    return Model.GetContentIndex();
}
bool __UIGetter_bCanHoverGoTo(const FVM_EquipHoverTips &inout Model)
{
    return Model.GetbCanHoverGoTo();
}
TEUIModelRef<FVM_EquipHoverTips> __UIGetter_Self(const FVM_EquipHoverTips &inout Model)
{
    return TEUIModelRef<FVM_EquipHoverTips>(Model);
}
int __IndexOf_DisplayName()
{
    return 0;
}
int __IndexOf_EquipLevel()
{
    return 1;
}
int __IndexOf_bIsShowLevel()
{
    return 2;
}
int __IndexOf_bIsShowContent()
{
    return 3;
}
int __IndexOf_ContentText()
{
    return 4;
}
int __IndexOf_ContentIndex()
{
    return 5;
}
int __IndexOf_bCanHoverGoTo()
{
    return 6;
}
int __IndexOf_OnClickGoToCallback()
{
    return 7;
}
int __IndexOf_ClickModelRef()
{
    return 8;
}
int __IndexOf_OverrideClickWidgetConfig()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_EquipHoverTips
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
