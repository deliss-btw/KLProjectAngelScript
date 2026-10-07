
namespace FVM_BuffHoverDialogAttrItem
{
    const int ModelId = 0;

}
struct FBuffAttrData
{
    UPROPERTY()
    FBuffHintDescParamItem AffectRow;

    FBuffAttrData()
    {
        return;
    }
}

struct FVM_BuffHoverDialogAttrItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FBuffHintDescParamItem m_AffectRow;

    FVM_BuffHoverDialogAttrItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BuffHoverDialogAttrItem' by default constructor.");
        return;
    }
    FVM_BuffHoverDialogAttrItem(const FVM_BuffHoverDialogAttrItem &inout Other)
    {
        return;
    }
    FVM_BuffHoverDialogAttrItem(const FBuffHintDescParamItem &inout InAffectRow)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAffectRow(InAffectRow);
        return;
    }
    FVM_BuffHoverDialogAttrItem opAssign(const FVM_BuffHoverDialogAttrItem &inout Other)
    {
        FVM_BuffHoverDialogAttrItem __r;
        return __r;
    }
    FText GetAttrEffectDesc() const
    {
        return this.GetAffectRow().Desc;
    }
    FSoftBrush GetBuffIcon() const
    {
        return this.GetAffectRow().Icon;
    }
    bool HasBuffIcon() const
    {
        return !(this.GetAffectRow().Icon.GetResourceObject().IsNull());
    }
    const FBuffHintDescParamItem GetAffectRow() const property
    {
        const FBuffHintDescParamItem __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FBuffHintDescParamItem GetModify_AffectRow() property
    {
        FBuffHintDescParamItem __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAffectRow(const FBuffHintDescParamItem &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
}

struct __GeneratedProperties_FVM_BuffHoverDialogAttrItem
{
    UPROPERTY()
    FText AttrEffectDesc;
    UPROPERTY()
    FSoftBrush BuffIcon;
    UPROPERTY()
    bool HasBuffIcon;
    UPROPERTY()
    TEUIModelRef<FVM_BuffHoverDialogAttrItem> Self;


}

namespace FVM_BuffHoverDialogAttrItem
{
FVM_BuffHoverDialogAttrItem& Create(const UObject ContextObject, const FBuffHintDescParamItem &inout AffectRow)
{
    return FVM_BuffHoverDialogAttrItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), AffectRow);
}
FVM_BuffHoverDialogAttrItem CreateByManager(const UEUIManagerSubsystem Manager, const FBuffHintDescParamItem &inout AffectRow)
{
    FVM_BuffHoverDialogAttrItem __r;
    TEUIModelRef<FVM_BuffHoverDialogAttrItem> local_6 = TEUIModelRef<FVM_BuffHoverDialogAttrItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BuffHoverDialogAttrItem::ModelId, 0, AffectRow));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AttrEffectDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasBuffIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BuffHoverDialogAttrItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BuffHoverDialogAttrItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BuffHoverDialogAttrItem;
}
FText __UIGetter_AttrEffectDesc(const FVM_BuffHoverDialogAttrItem &inout Model)
{
    return Model.GetAttrEffectDesc();
}
FSoftBrush __UIGetter_BuffIcon(const FVM_BuffHoverDialogAttrItem &inout Model)
{
    return Model.GetBuffIcon();
}
bool __UIGetter_HasBuffIcon(const FVM_BuffHoverDialogAttrItem &inout Model)
{
    return Model.HasBuffIcon();
}
TEUIModelRef<FVM_BuffHoverDialogAttrItem> __UIGetter_Self(const FVM_BuffHoverDialogAttrItem &inout Model)
{
    return TEUIModelRef<FVM_BuffHoverDialogAttrItem>(Model);
}
int __IndexOf_AffectRow()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_BuffHoverDialogAttrItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
