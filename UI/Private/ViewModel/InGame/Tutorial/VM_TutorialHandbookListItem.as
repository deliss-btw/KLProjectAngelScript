
namespace FVM_TutorialHandbookListItem
{
    const int ModelId = 0;

}
struct FVM_TutorialHandbookListItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_ItemIndex;
    UPROPERTY()
    FText m_Name;
    UPROPERTY()
    bool m_bShowRedDot;
    UPROPERTY()
    TDataObjectPtr<FGuideGroupConfig> m_GuideConfig;

    FVM_TutorialHandbookListItem()
    {
        this.m_ItemIndex = 0;
        this.m_bShowRedDot = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TutorialHandbookListItem' by default constructor.");
        return;
    }
    FVM_TutorialHandbookListItem(const FVM_TutorialHandbookListItem &inout Other)
    {
        this.m_ItemIndex = 0;
        this.m_bShowRedDot = false;
        this.m_ItemIndex = int(Other.m_ItemIndex);
        this.m_Name = Other.m_Name;
        this.m_bShowRedDot = Other.m_bShowRedDot;
        this.m_GuideConfig = Other.m_GuideConfig;
        return;
    }
    FVM_TutorialHandbookListItem(const int InItemIndex)
    {
        this.m_ItemIndex = 0;
        this.m_bShowRedDot = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemIndex(InItemIndex);
        return;
    }
    FVM_TutorialHandbookListItem& opAssign(const FVM_TutorialHandbookListItem &inout Other)
    {
        this.m_ItemIndex = int(Other.m_ItemIndex);
        this.m_Name = Other.m_Name;
        this.m_bShowRedDot = Other.m_bShowRedDot;
        return Other.m_GuideConfig;
    }
    int GetItemIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemIndex;
    }
    void SetItemIndex(const int __Value) property
    {
        if (this.m_ItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemIndex = __Value;
        return;
    }
    FText GetName() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Name() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Name = __Value;
        return;
    }
    bool GetbShowRedDot() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bShowRedDot;
    }
    void SetbShowRedDot(const bool __Value) property
    {
        if (!(this.m_bShowRedDot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bShowRedDot = __Value;
        return;
    }
    const TDataObjectPtr<FGuideGroupConfig> GetGuideConfig() const property
    {
        const TDataObjectPtr<FGuideGroupConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FGuideGroupConfig> GetModify_GuideConfig() property
    {
        TDataObjectPtr<FGuideGroupConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetGuideConfig(const TDataObjectPtr<FGuideGroupConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_GuideConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TutorialHandbookListItem
{
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHandbookListItem> Self;

    __GeneratedProperties_FVM_TutorialHandbookListItem()
    {
        return;
    }
}

namespace FVM_TutorialHandbookListItem
{
FVM_TutorialHandbookListItem& Create(const UObject ContextObject, const int ItemIndex)
{
    return FVM_TutorialHandbookListItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemIndex);
}
FVM_TutorialHandbookListItem CreateByManager(const UEUIManagerSubsystem Manager, const int ItemIndex)
{
    FVM_TutorialHandbookListItem __r;
    TEUIModelRef<FVM_TutorialHandbookListItem> local_6 = TEUIModelRef<FVM_TutorialHandbookListItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TutorialHandbookListItem::ModelId, 0, ItemIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Name";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowRedDot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TutorialHandbookListItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TutorialHandbookListItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TutorialHandbookListItem;
}
FText __UIGetter_Name(const FVM_TutorialHandbookListItem &inout Model)
{
    return Model.GetName();
}
bool __UIGetter_bShowRedDot(const FVM_TutorialHandbookListItem &inout Model)
{
    return Model.GetbShowRedDot();
}
TEUIModelRef<FVM_TutorialHandbookListItem> __UIGetter_Self(const FVM_TutorialHandbookListItem &inout Model)
{
    return TEUIModelRef<FVM_TutorialHandbookListItem>(Model);
}
int __IndexOf_ItemIndex()
{
    return 0;
}
int __IndexOf_Name()
{
    return 1;
}
int __IndexOf_bShowRedDot()
{
    return 2;
}
int __IndexOf_GuideConfig()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_TutorialHandbookListItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
