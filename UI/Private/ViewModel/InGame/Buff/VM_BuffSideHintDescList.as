
namespace FVM_BuffSideHintDesc
{
    const int ModelId = 0;
}
namespace FVM_BuffSideHintDescList
{
    const int ModelId = 0;

}
struct FBuffHintDescParamItem
{
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    bool bAdditional;

    FBuffHintDescParamItem(const FSoftBrush &inout InIcon, const FText &inout InDesc, const bool bInAdditional = false)
    {
        this.Desc = InDesc;
        this.bAdditional = bInAdditional;
        return;
    }
}

struct FBuffHintDescParamItemList
{
    UPROPERTY()
    TArray<FBuffHintDescParamItem> BuffHintDescParamItem;

    FBuffHintDescParamItemList()
    {
        return;
    }
}

struct FBuffHintDescParamItemListParam : FCommonLargeSideHintData
{
    FCommonLargeSideHintData _base_FCommonLargeSideHintData;
    UPROPERTY()
    FBuffHintDescParamItemList DescList;

    FBuffHintDescParamItemListParam()
    {
        super();
        return;
    }
}

struct FVM_BuffSideHintDesc : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSoftBrush m_Icon;
    UPROPERTY()
    FText m_Desc;

    FVM_BuffSideHintDesc()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BuffSideHintDesc' by default constructor.");
        return;
    }
    FVM_BuffSideHintDesc(const FVM_BuffSideHintDesc &inout Other)
    {
        this.m_Icon = Other.m_Icon;
        this.m_Desc = Other.m_Desc;
        return;
    }
    FVM_BuffSideHintDesc(const FSoftBrush &inout InIcon, const FText &inout InDesc)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIcon(InIcon);
        this.SetDesc(InDesc);
        return;
    }
    FVM_BuffSideHintDesc& opAssign(const FVM_BuffSideHintDesc &inout Other)
    {
        this.m_Icon = Other.m_Icon;
        return Other.m_Desc;
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
}

struct FVM_BuffSideHintDescList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_BuffSideHintDesc>> m_DescItems;
    UPROPERTY()
    FSoftBrush m_AdditionBuffIcon;
    UPROPERTY()
    FText m_AdditionBuffDesc;
    UPROPERTY()
    bool m_bHasAdditionDesc;

    FVM_BuffSideHintDescList()
    {
        this.m_bHasAdditionDesc = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BuffSideHintDescList' by default constructor.");
        return;
    }
    FVM_BuffSideHintDescList(const FVM_BuffSideHintDescList &inout Other)
    {
        this.m_bHasAdditionDesc = false;
        this.m_DescItems = Other.m_DescItems;
        this.m_AdditionBuffIcon = Other.m_AdditionBuffIcon;
        this.m_AdditionBuffDesc = Other.m_AdditionBuffDesc;
        this.m_bHasAdditionDesc = Other.m_bHasAdditionDesc;
        return;
    }
    FVM_BuffSideHintDescList(const FBuffHintDescParamItemList &inout DescList)
    {
        this.m_bHasAdditionDesc = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetbHasAdditionDesc(false);
        for (auto& local_18 : DescList.BuffHintDescParamItem)
        {
            if (local_18.bAdditional)
            {
                this.SetAdditionBuffIcon(local_18.Icon);
                this.SetAdditionBuffDesc(local_18.Desc);
                this.SetbHasAdditionDesc(true);
                continue;
            }
            this.GetModify_DescItems().Add(TEUIModelRef<FVM_BuffSideHintDesc>(::FVM_BuffSideHintDesc::Create(this.GetContext().Manager, local_18.Icon, local_18.Desc)));
        }
        return;
    }
    FVM_BuffSideHintDescList opAssign(const FVM_BuffSideHintDescList &inout Other)
    {
        FVM_BuffSideHintDescList __r;
        this.m_DescItems = Other.m_DescItems;
        this.m_AdditionBuffIcon = Other.m_AdditionBuffIcon;
        this.m_AdditionBuffDesc = Other.m_AdditionBuffDesc;
        this.m_bHasAdditionDesc = Other.m_bHasAdditionDesc;
        return __r;
    }
    const TArray<TEUIModelRef<FVM_BuffSideHintDesc>> GetDescItems() const property
    {
        const TArray<TEUIModelRef<FVM_BuffSideHintDesc>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_BuffSideHintDesc>> GetModify_DescItems() property
    {
        TArray<TEUIModelRef<FVM_BuffSideHintDesc>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDescItems(const TArray<TEUIModelRef<FVM_BuffSideHintDesc>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DescItems = __Value;
        return;
    }
    const FSoftBrush GetAdditionBuffIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_AdditionBuffIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAdditionBuffIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AdditionBuffIcon = __Value;
        return;
    }
    const FText GetAdditionBuffDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_AdditionBuffDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAdditionBuffDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AdditionBuffDesc = __Value;
        return;
    }
    bool GetbHasAdditionDesc() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bHasAdditionDesc;
    }
    void SetbHasAdditionDesc(const bool __Value) property
    {
        if (!(this.m_bHasAdditionDesc) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bHasAdditionDesc = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BuffSideHintDesc
{
    UPROPERTY()
    TEUIModelRef<FVM_BuffSideHintDesc> Self;

    __GeneratedProperties_FVM_BuffSideHintDesc()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_BuffSideHintDescList
{
    UPROPERTY()
    TEUIModelRef<FVM_BuffSideHintDescList> Self;

    __GeneratedProperties_FVM_BuffSideHintDescList()
    {
        return;
    }
}

namespace FVM_BuffSideHintDesc
{
FVM_BuffSideHintDesc& Create(const UObject ContextObject, const FSoftBrush &inout Icon, const FText &inout Desc)
{
    return FVM_BuffSideHintDesc::CreateByManager(EUIInternal::GetContextManager(ContextObject), Icon, Desc);
}
FVM_BuffSideHintDesc CreateByManager(const UEUIManagerSubsystem Manager, const FSoftBrush &inout Icon, const FText &inout Desc)
{
    FVM_BuffSideHintDesc __r;
    TEUIModelRef<FVM_BuffSideHintDesc> local_6 = TEUIModelRef<FVM_BuffSideHintDesc>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BuffSideHintDesc::ModelId, 0, Icon, Desc));
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
    local_14.PropertyName = "Desc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BuffSideHintDesc>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BuffSideHintDesc;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BuffSideHintDesc;
}
FSoftBrush __UIGetter_Icon(const FVM_BuffSideHintDesc &inout Model)
{
    return Model.GetIcon();
}
FText __UIGetter_Desc(const FVM_BuffSideHintDesc &inout Model)
{
    return Model.GetDesc();
}
TEUIModelRef<FVM_BuffSideHintDesc> __UIGetter_Self(const FVM_BuffSideHintDesc &inout Model)
{
    return TEUIModelRef<FVM_BuffSideHintDesc>(Model);
}
int __IndexOf_Icon()
{
    return 0;
}
int __IndexOf_Desc()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_BuffSideHintDesc
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_BuffSideHintDescList
{
FVM_BuffSideHintDescList& Create(const UObject ContextObject, const FBuffHintDescParamItemList &inout DescList)
{
    return FVM_BuffSideHintDescList::CreateByManager(EUIInternal::GetContextManager(ContextObject), DescList);
}
FVM_BuffSideHintDescList CreateByManager(const UEUIManagerSubsystem Manager, const FBuffHintDescParamItemList &inout DescList)
{
    FVM_BuffSideHintDescList __r;
    TEUIModelRef<FVM_BuffSideHintDescList> local_6 = TEUIModelRef<FVM_BuffSideHintDescList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BuffSideHintDescList::ModelId, 0, DescList));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DescItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_BuffSideHintDesc>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AdditionBuffIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AdditionBuffDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasAdditionDesc";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BuffSideHintDescList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BuffSideHintDescList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BuffSideHintDescList;
}
TArray<TEUIModelRef<FVM_BuffSideHintDesc>> __UIGetter_DescItems(const FVM_BuffSideHintDescList &inout Model)
{
    return Model.GetDescItems();
}
FSoftBrush __UIGetter_AdditionBuffIcon(const FVM_BuffSideHintDescList &inout Model)
{
    return Model.GetAdditionBuffIcon();
}
FText __UIGetter_AdditionBuffDesc(const FVM_BuffSideHintDescList &inout Model)
{
    return Model.GetAdditionBuffDesc();
}
bool __UIGetter_bHasAdditionDesc(const FVM_BuffSideHintDescList &inout Model)
{
    return Model.GetbHasAdditionDesc();
}
TEUIModelRef<FVM_BuffSideHintDescList> __UIGetter_Self(const FVM_BuffSideHintDescList &inout Model)
{
    return TEUIModelRef<FVM_BuffSideHintDescList>(Model);
}
int __IndexOf_DescItems()
{
    return 0;
}
int __IndexOf_AdditionBuffIcon()
{
    return 1;
}
int __IndexOf_AdditionBuffDesc()
{
    return 2;
}
int __IndexOf_bHasAdditionDesc()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_BuffSideHintDescList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
