
enum EDisplayItemSourceType
{
    None,
    Item,
    Fashion,
    Avatar,
    GenericConfig,
}

namespace FM_DisplayItemData
{
    const int ModelId = 0;

}
struct FM_DisplayItemData : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    EDisplayItemSourceType m_SourceType;
    UPROPERTY()
    uint m_SourceId;
    UPROPERTY()
    FText m_DisplayName;
    UPROPERTY()
    FText m_DisplayDesc;
    UPROPERTY()
    FSoftBrush m_ItemImage;
    UPROPERTY()
    FSoftBrush m_ItemImageHigh;
    UPROPERTY()
    FSoftBrush m_ItemImageTemp;
    UPROPERTY()
    FSoftBrush m_ItemImageBG;
    UPROPERTY()
    int m_CurDisplayState;
    UPROPERTY()
    FLinearColor m_RarityColor;
    UPROPERTY()
    int m_RarityValue;
    UPROPERTY()
    int m_SortPriority;

    FM_DisplayItemData()
    {
        this.m_SourceType = EDisplayItemSourceType(0);
        this.m_SourceId = 0;
        this.m_CurDisplayState = 0;
        this.m_RarityColor = FLinearColor::White;
        this.m_RarityValue = 0;
        this.m_SortPriority = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_DisplayItemData(const FM_DisplayItemData &inout Other)
    {
        this.m_SourceType = EDisplayItemSourceType(0);
        this.m_SourceId = 0;
        this.m_CurDisplayState = 0;
        this.m_RarityColor = FLinearColor::White;
        this.m_RarityValue = 0;
        this.m_SortPriority = 0;
        this.m_SourceType = Other.m_SourceType;
        this.m_SourceId = int(Other.m_SourceId);
        this.m_DisplayName = Other.m_DisplayName;
        this.m_DisplayDesc = Other.m_DisplayDesc;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_ItemImageHigh = Other.m_ItemImageHigh;
        this.m_ItemImageTemp = Other.m_ItemImageTemp;
        this.m_ItemImageBG = Other.m_ItemImageBG;
        this.m_CurDisplayState = int(Other.m_CurDisplayState);
        this.m_RarityColor = Other.m_RarityColor;
        this.m_RarityValue = int(Other.m_RarityValue);
        this.m_SortPriority = int(Other.m_SortPriority);
        return;
    }
    FM_DisplayItemData opAssign(const FM_DisplayItemData &inout Other)
    {
        FM_DisplayItemData __r;
        this.m_SourceType = Other.m_SourceType;
        this.m_SourceId = int(Other.m_SourceId);
        this.m_DisplayName = Other.m_DisplayName;
        this.m_DisplayDesc = Other.m_DisplayDesc;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_ItemImageHigh = Other.m_ItemImageHigh;
        this.m_ItemImageTemp = Other.m_ItemImageTemp;
        this.m_ItemImageBG = Other.m_ItemImageBG;
        this.m_CurDisplayState = int(Other.m_CurDisplayState);
        this.m_RarityColor = Other.m_RarityColor;
        this.m_RarityValue = int(Other.m_RarityValue);
        this.m_SortPriority = int(Other.m_SortPriority);
        return __r;
    }
    EDisplayItemSourceType GetSourceType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SourceType;
    }
    void SetSourceType(const EDisplayItemSourceType __Value) property
    {
        if (int(this.m_SourceType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SourceType = __Value;
        return;
    }
    uint GetSourceId() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SourceId;
    }
    void SetSourceId(const uint __Value) property
    {
        if (this.m_SourceId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SourceId = __Value;
        return;
    }
    FText GetDisplayName() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_DisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayName = __Value;
        return;
    }
    const FText GetDisplayDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_DisplayDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDisplayDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DisplayDesc = __Value;
        return;
    }
    const FSoftBrush GetItemImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSoftBrush GetModify_ItemImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetItemImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ItemImage = __Value;
        return;
    }
    const FSoftBrush GetItemImageHigh() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FSoftBrush GetModify_ItemImageHigh() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetItemImageHigh(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ItemImageHigh = __Value;
        return;
    }
    const FSoftBrush GetItemImageTemp() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FSoftBrush GetModify_ItemImageTemp() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetItemImageTemp(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ItemImageTemp = __Value;
        return;
    }
    const FSoftBrush GetItemImageBG() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FSoftBrush GetModify_ItemImageBG() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetItemImageBG(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ItemImageBG = __Value;
        return;
    }
    int GetCurDisplayState() const property
    {
        this.TrackPropertyRead(8);
        return this.m_CurDisplayState;
    }
    void SetCurDisplayState(const int __Value) property
    {
        if (this.m_CurDisplayState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CurDisplayState = __Value;
        return;
    }
    FLinearColor GetRarityColor() const property
    {
        FLinearColor __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FLinearColor GetModify_RarityColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetRarityColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_RarityColor = __Value;
        return;
    }
    int GetRarityValue() const property
    {
        this.TrackPropertyRead(10);
        return this.m_RarityValue;
    }
    void SetRarityValue(const int __Value) property
    {
        if (this.m_RarityValue == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_RarityValue = __Value;
        return;
    }
    int GetSortPriority() const property
    {
        this.TrackPropertyRead(11);
        return this.m_SortPriority;
    }
    void SetSortPriority(const int __Value) property
    {
        if (this.m_SortPriority == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SortPriority = __Value;
        return;
    }
}

namespace FM_DisplayItemData
{
FM_DisplayItemData& Create(const UObject ContextObject)
{
    return FM_DisplayItemData::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_DisplayItemData CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_DisplayItemData __r;
    TEUIModelRef<FM_DisplayItemData> local_6 = TEUIModelRef<FM_DisplayItemData>(EUIInternal::MakeModelWithManager(Manager, FM_DisplayItemData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_DisplayItemData;
}
int __IndexOf_SourceType()
{
    return 0;
}
int __IndexOf_SourceId()
{
    return 1;
}
int __IndexOf_DisplayName()
{
    return 2;
}
int __IndexOf_DisplayDesc()
{
    return 3;
}
int __IndexOf_ItemImage()
{
    return 4;
}
int __IndexOf_ItemImageHigh()
{
    return 5;
}
int __IndexOf_ItemImageTemp()
{
    return 6;
}
int __IndexOf_ItemImageBG()
{
    return 7;
}
int __IndexOf_CurDisplayState()
{
    return 8;
}
int __IndexOf_RarityColor()
{
    return 9;
}
int __IndexOf_RarityValue()
{
    return 10;
}
int __IndexOf_SortPriority()
{
    return 11;
}
}
