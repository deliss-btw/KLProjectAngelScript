
namespace FVM_TutorialHandbookEntry
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClicked = FEUIModelCallbackSignature();

}
struct FVM_TutorialHandbookEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_TabIndex;
    UPROPERTY()
    FText m_TabName;
    UPROPERTY()
    FSoftBrush m_TabIcon;
    UPROPERTY()
    bool m_bHasUnfinished;
    UPROPERTY()
    EGuideManualTab m_Tab;

    FVM_TutorialHandbookEntry()
    {
        this.m_TabIndex = 0;
        this.m_Tab = EGuideManualTab(0);
        this.m_bHasUnfinished = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TutorialHandbookEntry' by default constructor.");
        return;
    }
    FVM_TutorialHandbookEntry(const FVM_TutorialHandbookEntry &inout Other)
    {
        this.m_TabIndex = 0;
        this.m_Tab = EGuideManualTab(0);
        this.m_bHasUnfinished = false;
        this.m_TabIndex = int(Other.m_TabIndex);
        this.m_TabName = Other.m_TabName;
        this.m_TabIcon = Other.m_TabIcon;
        this.m_bHasUnfinished = Other.m_bHasUnfinished;
        this.m_Tab = Other.m_Tab;
        return;
    }
    FVM_TutorialHandbookEntry(const int InTabIndex)
    {
        this.m_TabIndex = 0;
        this.m_Tab = EGuideManualTab(0);
        this.m_bHasUnfinished = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTabIndex(InTabIndex);
        return;
    }
    FVM_TutorialHandbookEntry opAssign(const FVM_TutorialHandbookEntry &inout Other)
    {
        FVM_TutorialHandbookEntry __r;
        this.m_TabIndex = int(Other.m_TabIndex);
        this.m_TabName = Other.m_TabName;
        this.m_TabIcon = Other.m_TabIcon;
        this.m_bHasUnfinished = Other.m_bHasUnfinished;
        this.m_Tab = Other.m_Tab;
        return __r;
    }
    void OnClicked()
    {
        EGuideManualTab local_1 = this.GetTab();
        UEUIManagerSubsystem local_4 = this.GetManager();
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Tutorial_HandbookDetail, FEUIModelRef());
        return;
    }
    int GetTabIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TabIndex;
    }
    void SetTabIndex(const int __Value) property
    {
        if (this.m_TabIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TabIndex = __Value;
        return;
    }
    FText GetTabName() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_TabName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTabName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TabName = __Value;
        return;
    }
    const FSoftBrush GetTabIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_TabIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTabIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TabIcon = __Value;
        return;
    }
    bool GetbHasUnfinished() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bHasUnfinished;
    }
    void SetbHasUnfinished(const bool __Value) property
    {
        if (!(this.m_bHasUnfinished) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bHasUnfinished = __Value;
        return;
    }
    EGuideManualTab GetTab() const property
    {
        this.TrackPropertyRead(4);
        return this.m_Tab;
    }
    void SetTab(const EGuideManualTab __Value) property
    {
        if (int(this.m_Tab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Tab = __Value;
        return;
    }
}

struct FMsg_TutorialHandbookEntryHovered : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FVM_TutorialHandbookEntry> HoveredEntry;
    UPROPERTY()
    bool bHovered = false;


}

struct __GeneratedProperties_FVM_TutorialHandbookEntry
{
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHandbookEntry> Self;

    __GeneratedProperties_FVM_TutorialHandbookEntry()
    {
        return;
    }
}

namespace FVM_TutorialHandbookEntry
{
FVM_TutorialHandbookEntry& Create(const UObject ContextObject, const int TabIndex)
{
    return FVM_TutorialHandbookEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), TabIndex);
}
FVM_TutorialHandbookEntry CreateByManager(const UEUIManagerSubsystem Manager, const int TabIndex)
{
    FVM_TutorialHandbookEntry __r;
    TEUIModelRef<FVM_TutorialHandbookEntry> local_6 = TEUIModelRef<FVM_TutorialHandbookEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TutorialHandbookEntry::ModelId, 0, TabIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TabName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TabIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasUnfinished";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TutorialHandbookEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TutorialHandbookEntry;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TutorialHandbookEntry;
}
FText __UIGetter_TabName(const FVM_TutorialHandbookEntry &inout Model)
{
    return Model.GetTabName();
}
FSoftBrush __UIGetter_TabIcon(const FVM_TutorialHandbookEntry &inout Model)
{
    return Model.GetTabIcon();
}
bool __UIGetter_bHasUnfinished(const FVM_TutorialHandbookEntry &inout Model)
{
    return Model.GetbHasUnfinished();
}
TEUIModelRef<FVM_TutorialHandbookEntry> __UIGetter_Self(const FVM_TutorialHandbookEntry &inout Model)
{
    return TEUIModelRef<FVM_TutorialHandbookEntry>(Model);
}
int __IndexOf_TabIndex()
{
    return 0;
}
int __IndexOf_TabName()
{
    return 1;
}
int __IndexOf_TabIcon()
{
    return 2;
}
int __IndexOf_bHasUnfinished()
{
    return 3;
}
int __IndexOf_Tab()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_TutorialHandbookEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
