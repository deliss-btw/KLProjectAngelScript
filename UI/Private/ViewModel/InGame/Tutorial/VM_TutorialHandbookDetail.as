
namespace FVM_TutorialHandbookDetail
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectByIndex = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectByItem = FEUIModelCallbackSignature();

}
struct FVM_TutorialHandbookDetail : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_TabIndex;
    UPROPERTY()
    FText m_TabTitle;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TutorialHandbookListItem>> m_ListItems;
    UPROPERTY()
    TEUIModelRef<FVM_GuideGroupDetail> m_SelectedDetail;
    UPROPERTY()
    int m_SelectedIndex;
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHandbookListItem> m_SelectedItem;
    UPROPERTY()
    bool m_bHasContent;

    FVM_TutorialHandbookDetail()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_TutorialHandbookDetail(const FVM_TutorialHandbookDetail &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_TutorialHandbookDetail(const int InTabIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_TutorialHandbookDetail opAssign(const FVM_TutorialHandbookDetail &inout Other)
    {
        FVM_TutorialHandbookDetail __r;
        this.m_TabIndex = int(Other.m_TabIndex);
        this.m_TabTitle = Other.m_TabTitle;
        this.m_ListItems = Other.m_ListItems;
        this.m_SelectedDetail = Other.m_SelectedDetail;
        this.m_SelectedIndex = int(Other.m_SelectedIndex);
        this.m_SelectedItem = Other.m_SelectedItem;
        this.m_bHasContent = Other.m_bHasContent;
        return __r;
    }
    void PostConstruct()
    {
        int local_3 = this.GetTabIndex();
        for (auto& local_24 : ::GuideManualSettings::Get().TabSettings)
        {
            int local_2 = int(local_24.Tab);
            if (local_2 == local_3)
            {
                this.SetTabTitle(local_24.TabName);
                break;
            }
        }
        this.RebuildList(EGuideManualTab(local_3));
        this.SetbHasContent((this.GetListItems().Num() > 0));
        if (this.GetbHasContent())
        {
            this.SelectByIndex(0);
        }
        return;
    }
    void SelectByIndex(const int Index)
    {
        if (Index < 0 || (Index >= this.GetListItems().Num()))
        {
            return;
        }
        if (Index == this.GetSelectedIndex())
        {
            return;
        }
        this.SetSelectedIndex(Index);
        this.SetSelectedItem(this.GetListItems()[Index]);
        TDataObjectPtr<FGuideGroupConfig> local_28 = GetGuideConfig();
        this.SetSelectedDetail(TEUIModelRef<FVM_GuideGroupDetail>(::FVM_GuideGroupDetail::Create(this.GetManager(), local_28)));
        return;
    }
    void SelectByItem(const FEUIModelContainer &inout Item)
    {
        FVM_TutorialHandbookListItem& local_6 = FEUIModelContainer::GetModel(Item).opCall();
        if (local_6)
        {
            this.SelectByIndex(local_6.GetItemIndex());
        }
        return;
    }
    void SelectByGuideDataId(const uint GuideDataId)
    {
        int local_1 = 0;
        for (; local_1 < this.GetListItems().Num(); ++local_1)
        {
            if (0 == GuideDataId)
            {
                this.SelectByIndex(local_1);
                break;
            }
        }
        return;
    }
    void RebuildList(const EGuideManualTab Tab)
    {
        int local_99 = 0;
        FMS_GuideManual& local_4 = ::FMS_GuideManual::Get(this.GetManager());
        TArray<TDataObjectPtr<FGuideGroupConfig>> local_8;
        TDataObjectIterator<FGuideGroupConfig> local_24;
        for (; local_24; )
        {
            TDataObjectPtr<FGuideGroupConfig> local_66 = local_24.GetDataPtr();
            if (0 != int(Tab))
            {
            }
            else
            {
                if (!(local_4.IsVisibleInManual(local_66)))
                {
                }
                else
                {
                    local_8.Add(local_66);
                }
            }
            local_24.Next();
        }
        int local_95 = 0;
        for (; local_95 < local_8.Num(); )
        {
            FVM_TutorialHandbookListItem& local_98 = ::FVM_TutorialHandbookListItem::Create(this.GetManager(), local_95);
            local_98.SetGuideConfig(local_8[local_95]);
            local_98.SetbShowRedDot(!(local_4.IsGuideFinished(local_99)));
            this.GetModify_ListItems().Add(TEUIModelRef<FVM_TutorialHandbookListItem>(local_98));
            ++local_95;
        }
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
    const FText GetTabTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_TabTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTabTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TabTitle = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TutorialHandbookListItem>> GetListItems() const property
    {
        const TArray<TEUIModelRef<FVM_TutorialHandbookListItem>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TutorialHandbookListItem>> GetModify_ListItems() property
    {
        TArray<TEUIModelRef<FVM_TutorialHandbookListItem>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetListItems(const TArray<TEUIModelRef<FVM_TutorialHandbookListItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ListItems = __Value;
        return;
    }
    TEUIModelRef<FVM_GuideGroupDetail> GetSelectedDetail() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SelectedDetail;
    }
    void SetSelectedDetail(const TEUIModelRef<FVM_GuideGroupDetail> &inout __Value) property
    {
        TEUIModelRef<FVM_GuideGroupDetail> local_2;
        local_2 = this.m_SelectedDetail;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectedDetail = __Value;
        return;
    }
    int GetSelectedIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedIndex;
    }
    void SetSelectedIndex(const int __Value) property
    {
        if (this.m_SelectedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_TutorialHandbookListItem> GetSelectedItem() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SelectedItem;
    }
    void SetSelectedItem(const TEUIModelRef<FVM_TutorialHandbookListItem> &inout __Value) property
    {
        TEUIModelRef<FVM_TutorialHandbookListItem> local_2;
        local_2 = this.m_SelectedItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SelectedItem = __Value;
        return;
    }
    bool GetbHasContent() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bHasContent;
    }
    void SetbHasContent(const bool __Value) property
    {
        if (!(this.m_bHasContent) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bHasContent = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_InGame_Tutorial_VM_TutorialHandbookDetail_106
{
    __Lambda_UI_Private_ViewModel_InGame_Tutorial_VM_TutorialHandbookDetail_106()
    {
        return;
    }
    bool opCall(const TDataObjectPtr<FGuideGroupConfig> &inout A, const TDataObjectPtr<FGuideGroupConfig> &inout B)
    {
        return (0 > 0);
    }
}

struct __GeneratedProperties_FVM_TutorialHandbookDetail
{
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHandbookDetail> Self;

    __GeneratedProperties_FVM_TutorialHandbookDetail()
    {
        return;
    }
}

namespace FVM_TutorialHandbookDetail
{
FVM_TutorialHandbookDetail& Create(const UObject ContextObject, const int TabIndex)
{
    return FVM_TutorialHandbookDetail::CreateByManager(EUIInternal::GetContextManager(ContextObject), TabIndex);
}
FVM_TutorialHandbookDetail CreateByManager(const UEUIManagerSubsystem Manager, const int TabIndex)
{
    FVM_TutorialHandbookDetail __r;
    TEUIModelRef<FVM_TutorialHandbookDetail> local_6 = TEUIModelRef<FVM_TutorialHandbookDetail>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TutorialHandbookDetail::ModelId, 0, TabIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TabTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ListItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TutorialHandbookListItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedDetail";
    local_14.TypeName = "TEUIModelRef<FVM_GuideGroupDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedItem";
    local_14.TypeName = "TEUIModelRef<FVM_TutorialHandbookListItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasContent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TutorialHandbookDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TutorialHandbookDetail;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TutorialHandbookDetail;
}
FText __UIGetter_TabTitle(const FVM_TutorialHandbookDetail &inout Model)
{
    return Model.GetTabTitle();
}
TArray<TEUIModelRef<FVM_TutorialHandbookListItem>> __UIGetter_ListItems(const FVM_TutorialHandbookDetail &inout Model)
{
    return Model.GetListItems();
}
TEUIModelRef<FVM_GuideGroupDetail> __UIGetter_SelectedDetail(const FVM_TutorialHandbookDetail &inout Model)
{
    return Model.GetSelectedDetail();
}
int __UIGetter_SelectedIndex(const FVM_TutorialHandbookDetail &inout Model)
{
    return Model.GetSelectedIndex();
}
TEUIModelRef<FVM_TutorialHandbookListItem> __UIGetter_SelectedItem(const FVM_TutorialHandbookDetail &inout Model)
{
    return Model.GetSelectedItem();
}
bool __UIGetter_bHasContent(const FVM_TutorialHandbookDetail &inout Model)
{
    return Model.GetbHasContent();
}
TEUIModelRef<FVM_TutorialHandbookDetail> __UIGetter_Self(const FVM_TutorialHandbookDetail &inout Model)
{
    return TEUIModelRef<FVM_TutorialHandbookDetail>(Model);
}
int __IndexOf_TabIndex()
{
    return 0;
}
int __IndexOf_TabTitle()
{
    return 1;
}
int __IndexOf_ListItems()
{
    return 2;
}
int __IndexOf_SelectedDetail()
{
    return 3;
}
int __IndexOf_SelectedIndex()
{
    return 4;
}
int __IndexOf_SelectedItem()
{
    return 5;
}
int __IndexOf_bHasContent()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_TutorialHandbookDetail
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
