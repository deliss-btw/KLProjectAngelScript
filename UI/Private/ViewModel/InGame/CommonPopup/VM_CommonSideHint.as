
enum ECommonSideHintListType
{
    SmallHint,
    LargeHint,
}

namespace FVM_CommonSideHintList
{
    const int ModelId = 0;
}
namespace FVM_CommonSideHint_Large
{
    const int ModelId = 0;
}
namespace FVM_CommonSideHint_Small
{
    const int ModelId = 0;

}
struct FVM_CommonSideHintList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    ECommonSideHintListType m_SideHintListType;
    UPROPERTY()
    int m_MaxDisplayNum;
    UPROPERTY()
    TEUIModelRef<FM_CommonSideHintManager> m_SideHintManager;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> m_SideHints;

    FVM_CommonSideHintList()
    {
        this.m_SideHintListType = ECommonSideHintListType(0);
        this.m_MaxDisplayNum = 3;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonSideHintList(const FVM_CommonSideHintList &inout Other)
    {
        this.m_SideHintListType = ECommonSideHintListType(0);
        this.m_MaxDisplayNum = 3;
        this.m_SideHintListType = Other.m_SideHintListType;
        this.m_MaxDisplayNum = int(Other.m_MaxDisplayNum);
        this.m_SideHintManager = Other.m_SideHintManager;
        this.m_SideHints = Other.m_SideHints;
        return;
    }
    FVM_CommonSideHintList& opAssign(const FVM_CommonSideHintList &inout Other)
    {
        this.m_SideHintListType = Other.m_SideHintListType;
        this.m_MaxDisplayNum = int(Other.m_MaxDisplayNum);
        this.m_SideHintManager = Other.m_SideHintManager;
        return Other.m_SideHints;
    }
    void LoadConfig(const FConfigVM_CommonSideHintList &inout InConfig)
    {
        this.SetMaxDisplayNum(int(InConfig.MaxDisplayNum));
        this.SetSideHintListType(InConfig.SideHintListType);
        return;
    }
    void PostLoad()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnAddSideHint(const FMsg_DisplayCommonSideHint &inout Msg)
    {
        int local_2 = FMath::Max((this.GetMaxDisplayNum() - 1), 0);
        if (this.GetSideHints().Num() > local_2)
        {
            this.GetModify_SideHints().RemoveAt(0, this.GetSideHints().Num() - local_2);
        }
        this.GetModify_SideHints().Add(Msg.SideHintInfo);
        return;
    }
    void Tick()
    {
        int local_1 = 0;
        for (; local_1 < this.GetSideHints().Num(); ++local_1)
        {
            const FEUIDynamicWidgetData& local_6 = this.GetSideHints()[local_1];
            FVM_InputActionList& local_12 = FEUIModelContainer::GetModel(local_6.ModelContainer).opCall();
            if (local_12)
            {
                if (local_12.HasAnyActionExecuted())
                {
                    this.GetModify_SideHints().RemoveAt(local_1);
                    break;
                }
            }
            FVM_Lifetime& local_18 = FEUIModelContainer::GetModel(local_6.ModelContainer).opCall();
            if (local_18)
            {
                if (local_18.IsExpired())
                {
                    this.GetModify_SideHints().RemoveAt(local_1);
                    break;
                }
            }
        }
        return;
    }
    void RegisterSideHintManager(const TEUIModelRef<FM_CommonSideHintManager> &inout InSideHintManager)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    ECommonSideHintListType GetSideHintListType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SideHintListType;
    }
    void SetSideHintListType(const ECommonSideHintListType __Value) property
    {
        if (int(this.m_SideHintListType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SideHintListType = __Value;
        return;
    }
    int GetMaxDisplayNum() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MaxDisplayNum;
    }
    void SetMaxDisplayNum(const int __Value) property
    {
        if (this.m_MaxDisplayNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MaxDisplayNum = __Value;
        return;
    }
    TEUIModelRef<FM_CommonSideHintManager> GetSideHintManager() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SideHintManager;
    }
    void SetSideHintManager(const TEUIModelRef<FM_CommonSideHintManager> &inout __Value) property
    {
        TEUIModelRef<FM_CommonSideHintManager> local_2;
        local_2 = this.m_SideHintManager;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SideHintManager = __Value;
        return;
    }
    const TArray<FEUIDynamicWidgetData> GetSideHints() const property
    {
        const TArray<FEUIDynamicWidgetData> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FEUIDynamicWidgetData> GetModify_SideHints() property
    {
        TArray<FEUIDynamicWidgetData> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSideHints(const TArray<FEUIDynamicWidgetData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SideHints = __Value;
        return;
    }
}

struct FVM_CommonSideHint_Large : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSoftBrush m_Icon;
    UPROPERTY()
    FSoftBrush m_SpecialBgImage;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_Content;

    FVM_CommonSideHint_Large()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonSideHint_Large' by default constructor.");
        return;
    }
    FVM_CommonSideHint_Large(const FVM_CommonSideHint_Large &inout Other)
    {
        this.m_Icon = Other.m_Icon;
        this.m_SpecialBgImage = Other.m_SpecialBgImage;
        this.m_Title = Other.m_Title;
        this.m_Content = Other.m_Content;
        return;
    }
    FVM_CommonSideHint_Large(const FSoftBrush &inout InIcon, const FSoftBrush &inout InSpecialBgImage, const FText &inout InTitle, const FText &inout InContent)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIcon(InIcon);
        this.SetSpecialBgImage(InSpecialBgImage);
        this.SetTitle(InTitle);
        this.SetContent(InContent);
        return;
    }
    FVM_CommonSideHint_Large& opAssign(const FVM_CommonSideHint_Large &inout Other)
    {
        this.m_Icon = Other.m_Icon;
        this.m_SpecialBgImage = Other.m_SpecialBgImage;
        this.m_Title = Other.m_Title;
        return Other.m_Content;
    }
    FSoftBrush GetIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSoftBrush GetModify_Icon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Icon = __Value;
        return;
    }
    const FSoftBrush GetSpecialBgImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_SpecialBgImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSpecialBgImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpecialBgImage = __Value;
        return;
    }
    FText GetTitle() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_Title() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Title = __Value;
        return;
    }
    FText GetContent() const property
    {
        FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_Content() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Content = __Value;
        return;
    }
}

struct FVM_CommonSideHint_Small : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSoftBrush m_Icon;
    UPROPERTY()
    FSoftBrush m_SpecialBgImage;
    UPROPERTY()
    FText m_Content;

    FVM_CommonSideHint_Small()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonSideHint_Small' by default constructor.");
        return;
    }
    FVM_CommonSideHint_Small(const FVM_CommonSideHint_Small &inout Other)
    {
        this.m_Icon = Other.m_Icon;
        this.m_SpecialBgImage = Other.m_SpecialBgImage;
        this.m_Content = Other.m_Content;
        return;
    }
    FVM_CommonSideHint_Small(const FSoftBrush &inout InIcon, const FSoftBrush &inout InSpecialBgImage, const FText &inout InContent)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIcon(InIcon);
        this.SetSpecialBgImage(InSpecialBgImage);
        this.SetContent(InContent);
        return;
    }
    FVM_CommonSideHint_Small& opAssign(const FVM_CommonSideHint_Small &inout Other)
    {
        this.m_Icon = Other.m_Icon;
        this.m_SpecialBgImage = Other.m_SpecialBgImage;
        return Other.m_Content;
    }
    FSoftBrush GetIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSoftBrush GetModify_Icon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Icon = __Value;
        return;
    }
    const FSoftBrush GetSpecialBgImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_SpecialBgImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSpecialBgImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpecialBgImage = __Value;
        return;
    }
    FText GetContent() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_Content() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Content = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonSideHintList
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonSideHintList> Self;

    __GeneratedProperties_FVM_CommonSideHintList()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_CommonSideHint_Large
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonSideHint_Large> Self;

    __GeneratedProperties_FVM_CommonSideHint_Large()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_CommonSideHint_Small
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonSideHint_Small> Self;

    __GeneratedProperties_FVM_CommonSideHint_Small()
    {
        return;
    }
}

namespace FVM_CommonSideHintList
{
FVM_CommonSideHintList& Create(const UObject ContextObject)
{
    return FVM_CommonSideHintList::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonSideHintList CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonSideHintList __r;
    TEUIModelRef<FVM_CommonSideHintList> local_6 = TEUIModelRef<FVM_CommonSideHintList>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonSideHintList::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonSideHintList;
}
void __OnAddSideHint(FVM_CommonSideHintList &inout Model, const FMsg_DisplayCommonSideHint &inout Message)
{
    Model.OnAddSideHint(Message);
    return;
}
void __Tick(FVM_CommonSideHintList &inout Model)
{
    Model.Tick();
    return;
}
TArray<FEUIDynamicWidgetData> __UIGetter_SideHints(const FVM_CommonSideHintList &inout Model)
{
    return Model.GetSideHints();
}
TEUIModelRef<FVM_CommonSideHintList> __UIGetter_Self(const FVM_CommonSideHintList &inout Model)
{
    return TEUIModelRef<FVM_CommonSideHintList>(Model);
}
int __IndexOf_SideHintListType()
{
    return 0;
}
int __IndexOf_MaxDisplayNum()
{
    return 1;
}
int __IndexOf_SideHintManager()
{
    return 2;
}
int __IndexOf_SideHints()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_CommonSideHintList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonSideHint_Large
{
FVM_CommonSideHint_Large& Create(const UObject ContextObject, const FSoftBrush &inout Icon, const FSoftBrush &inout SpecialBgImage, const FText &inout Title, const FText &inout Content)
{
    return FVM_CommonSideHint_Large::CreateByManager(EUIInternal::GetContextManager(ContextObject), Icon, SpecialBgImage, Title, Content);
}
FVM_CommonSideHint_Large CreateByManager(const UEUIManagerSubsystem Manager, const FSoftBrush &inout Icon, const FSoftBrush &inout SpecialBgImage, const FText &inout Title, const FText &inout Content)
{
    FVM_CommonSideHint_Large __r;
    TEUIModelRef<FVM_CommonSideHint_Large> local_6 = TEUIModelRef<FVM_CommonSideHint_Large>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonSideHint_Large::ModelId, 0, Icon, SpecialBgImage, Title, Content));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpecialBgImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Content";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonSideHint_Large>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonSideHint_Large;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonSideHint_Large;
}
FSoftBrush __UIGetter_Icon(const FVM_CommonSideHint_Large &inout Model)
{
    return Model.GetIcon();
}
FSoftBrush __UIGetter_SpecialBgImage(const FVM_CommonSideHint_Large &inout Model)
{
    return Model.GetSpecialBgImage();
}
FText __UIGetter_Title(const FVM_CommonSideHint_Large &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Content(const FVM_CommonSideHint_Large &inout Model)
{
    return Model.GetContent();
}
TEUIModelRef<FVM_CommonSideHint_Large> __UIGetter_Self(const FVM_CommonSideHint_Large &inout Model)
{
    return TEUIModelRef<FVM_CommonSideHint_Large>(Model);
}
int __IndexOf_Icon()
{
    return 0;
}
int __IndexOf_SpecialBgImage()
{
    return 1;
}
int __IndexOf_Title()
{
    return 2;
}
int __IndexOf_Content()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_CommonSideHint_Large
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonSideHint_Small
{
FVM_CommonSideHint_Small& Create(const UObject ContextObject, const FSoftBrush &inout Icon, const FSoftBrush &inout SpecialBgImage, const FText &inout Content)
{
    return FVM_CommonSideHint_Small::CreateByManager(EUIInternal::GetContextManager(ContextObject), Icon, SpecialBgImage, Content);
}
FVM_CommonSideHint_Small CreateByManager(const UEUIManagerSubsystem Manager, const FSoftBrush &inout Icon, const FSoftBrush &inout SpecialBgImage, const FText &inout Content)
{
    FVM_CommonSideHint_Small __r;
    TEUIModelRef<FVM_CommonSideHint_Small> local_6 = TEUIModelRef<FVM_CommonSideHint_Small>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonSideHint_Small::ModelId, 0, Icon, SpecialBgImage, Content));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpecialBgImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Content";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonSideHint_Small>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonSideHint_Small;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonSideHint_Small;
}
FSoftBrush __UIGetter_Icon(const FVM_CommonSideHint_Small &inout Model)
{
    return Model.GetIcon();
}
FSoftBrush __UIGetter_SpecialBgImage(const FVM_CommonSideHint_Small &inout Model)
{
    return Model.GetSpecialBgImage();
}
FText __UIGetter_Content(const FVM_CommonSideHint_Small &inout Model)
{
    return Model.GetContent();
}
TEUIModelRef<FVM_CommonSideHint_Small> __UIGetter_Self(const FVM_CommonSideHint_Small &inout Model)
{
    return TEUIModelRef<FVM_CommonSideHint_Small>(Model);
}
int __IndexOf_Icon()
{
    return 0;
}
int __IndexOf_SpecialBgImage()
{
    return 1;
}
int __IndexOf_Content()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommonSideHint_Small
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
