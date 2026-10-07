
namespace FVM_NavSampleListItem
{
    const int ModelId = 0;
}
namespace FVM_NavSampleList
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature RebuildItems = FEUIModelCallbackSignature();

}
struct FVM_NavSampleListItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_Description;

    FVM_NavSampleListItem()
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_NavSampleListItem' by default constructor.");
        return;
    }
    FVM_NavSampleListItem(const FVM_NavSampleListItem &inout Other)
    {
        this.m_Index = 0;
        this.m_Index = int(Other.m_Index);
        this.m_Title = Other.m_Title;
        this.m_Description = Other.m_Description;
        return;
    }
    FVM_NavSampleListItem(const int InIndex, const FText &inout InTitle, const FText &inout InDescription)
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        this.SetTitle(InTitle);
        this.SetDescription(InDescription);
        return;
    }
    FVM_NavSampleListItem& opAssign(const FVM_NavSampleListItem &inout Other)
    {
        this.m_Index = int(Other.m_Index);
        this.m_Title = Other.m_Title;
        return Other.m_Description;
    }
    FText GetIndexText() const
    {
        return FText::FromString(FString().Append((this.GetIndex() + 1)));
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Index = __Value;
        return;
    }
    FText GetTitle() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Title() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Title = __Value;
        return;
    }
    FText GetDescription() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_Description() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDescription(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Description = __Value;
        return;
    }
}

struct FVM_NavSampleList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_ItemCount;
    UPROPERTY()
    int m_InitialSelectedIndex;
    UPROPERTY()
    TArray<FEUIModelRef> m_Items;

    FVM_NavSampleList()
    {
        this.m_ItemCount = 0;
        this.m_InitialSelectedIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_NavSampleList(const FVM_NavSampleList &inout Other)
    {
        this.m_ItemCount = 0;
        this.m_InitialSelectedIndex = 0;
        this.m_ItemCount = int(Other.m_ItemCount);
        this.m_InitialSelectedIndex = int(Other.m_InitialSelectedIndex);
        this.m_Items = Other.m_Items;
        return;
    }
    FVM_NavSampleList& opAssign(const FVM_NavSampleList &inout Other)
    {
        this.m_ItemCount = int(Other.m_ItemCount);
        this.m_InitialSelectedIndex = int(Other.m_InitialSelectedIndex);
        return Other.m_Items;
    }
    void LoadConfig(const FConfigVM_NavSampleList &inout InConfig)
    {
        this.SetInitialSelectedIndex(int(InConfig.InitialSelectedIndex));
        this.SetItemCount(int(InConfig.ItemCount));
        return;
    }
    void PostLoad()
    {
        this.RebuildItems();
        return;
    }
    void RebuildItems()
    {
        int local_1 = this.GetItemCount();
        if (local_1 < 1)
        {
            local_1 = 12;
        }
        if (local_1 > 32)
        {
            local_1 = 32;
        }
        this.GetModify_Items().Empty(0);
        int local_4 = 0;
        for (; local_4 < local_1; )
        {
            FText::FromString(FString().Append("List item ").Append((local_4 + 1)));
            FText::FromString(FString().Append("Generated FEUIModelRef item. Arrow keys move through the virtualized list entry ").Append((local_4 + 1)).Append("."));
            FEUIModelRef local_24;
            this.GetModify_Items().Add(local_24);
            ++local_4;
        }
        return;
    }
    int GetItemCount() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemCount;
    }
    void SetItemCount(const int __Value) property
    {
        if (this.m_ItemCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemCount = __Value;
        return;
    }
    int GetInitialSelectedIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_InitialSelectedIndex;
    }
    void SetInitialSelectedIndex(const int __Value) property
    {
        if (this.m_InitialSelectedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InitialSelectedIndex = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetItems() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_Items() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetItems(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Items = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_NavSampleListItem
{
    UPROPERTY()
    FText IndexText;
    UPROPERTY()
    TEUIModelRef<FVM_NavSampleListItem> Self;

    __GeneratedProperties_FVM_NavSampleListItem()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_NavSampleList
{
    UPROPERTY()
    TEUIModelRef<FVM_NavSampleList> Self;

    __GeneratedProperties_FVM_NavSampleList()
    {
        return;
    }
}

namespace FVM_NavSampleListItem
{
FVM_NavSampleListItem& Create(const UObject ContextObject, const int Index, const FText &inout Title, const FText &inout Description)
{
    return FVM_NavSampleListItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Index, Title, Description);
}
FVM_NavSampleListItem CreateByManager(const UEUIManagerSubsystem Manager, const int Index, const FText &inout Title, const FText &inout Description)
{
    FVM_NavSampleListItem __r;
    TEUIModelRef<FVM_NavSampleListItem> local_6 = TEUIModelRef<FVM_NavSampleListItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_NavSampleListItem::ModelId, 0, Index, Title, Description));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Index";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Description";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IndexText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_NavSampleListItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_NavSampleListItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_NavSampleListItem;
}
int __UIGetter_Index(const FVM_NavSampleListItem &inout Model)
{
    return Model.GetIndex();
}
FText __UIGetter_Title(const FVM_NavSampleListItem &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Description(const FVM_NavSampleListItem &inout Model)
{
    return Model.GetDescription();
}
FText __UIGetter_IndexText(const FVM_NavSampleListItem &inout Model)
{
    return Model.GetIndexText();
}
TEUIModelRef<FVM_NavSampleListItem> __UIGetter_Self(const FVM_NavSampleListItem &inout Model)
{
    return TEUIModelRef<FVM_NavSampleListItem>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_Title()
{
    return 1;
}
int __IndexOf_Description()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_NavSampleListItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_NavSampleList
{
FVM_NavSampleList& Create(const UObject ContextObject)
{
    return FVM_NavSampleList::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_NavSampleList CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_NavSampleList __r;
    TEUIModelRef<FVM_NavSampleList> local_6 = TEUIModelRef<FVM_NavSampleList>(EUIInternal::MakeModelWithManager(Manager, FVM_NavSampleList::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Items";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_NavSampleList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_NavSampleList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_NavSampleList;
}
TArray<FEUIModelRef> __UIGetter_Items(const FVM_NavSampleList &inout Model)
{
    return Model.GetItems();
}
TEUIModelRef<FVM_NavSampleList> __UIGetter_Self(const FVM_NavSampleList &inout Model)
{
    return TEUIModelRef<FVM_NavSampleList>(Model);
}
int __IndexOf_ItemCount()
{
    return 0;
}
int __IndexOf_InitialSelectedIndex()
{
    return 1;
}
int __IndexOf_Items()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_NavSampleList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
