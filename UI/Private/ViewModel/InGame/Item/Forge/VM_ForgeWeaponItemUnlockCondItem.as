
namespace FVM_ForgeWeaponItemUnlockCondItem
{
    const int ModelId = 0;

}
struct FVM_ForgeWeaponItemUnlockCondItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_ConditionText;

    FVM_ForgeWeaponItemUnlockCondItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ForgeWeaponItemUnlockCondItem' by default constructor.");
        return;
    }
    FVM_ForgeWeaponItemUnlockCondItem(const FVM_ForgeWeaponItemUnlockCondItem &inout Other)
    {
        this.m_ConditionText = Other.m_ConditionText;
        return;
    }
    FVM_ForgeWeaponItemUnlockCondItem(const FText &inout InConditionText)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetConditionText(InConditionText);
        return;
    }
    FVM_ForgeWeaponItemUnlockCondItem& opAssign(const FVM_ForgeWeaponItemUnlockCondItem &inout Other)
    {
        return Other.m_ConditionText;
    }
    bool GetCanSkip() const
    {
        return false;
    }
    FText GetConditionText() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_ConditionText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetConditionText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ConditionText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ForgeWeaponItemUnlockCondItem
{
    UPROPERTY()
    bool CanSkip;
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem> Self;


}

namespace FVM_ForgeWeaponItemUnlockCondItem
{
FVM_ForgeWeaponItemUnlockCondItem& Create(const UObject ContextObject, const FText &inout ConditionText)
{
    return FVM_ForgeWeaponItemUnlockCondItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ConditionText);
}
FVM_ForgeWeaponItemUnlockCondItem CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout ConditionText)
{
    FVM_ForgeWeaponItemUnlockCondItem __r;
    TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem> local_6 = TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ForgeWeaponItemUnlockCondItem::ModelId, 0, ConditionText));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ConditionText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanSkip";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ForgeWeaponItemUnlockCondItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ForgeWeaponItemUnlockCondItem;
}
FText __UIGetter_ConditionText(const FVM_ForgeWeaponItemUnlockCondItem &inout Model)
{
    return Model.GetConditionText();
}
bool __UIGetter_CanSkip(const FVM_ForgeWeaponItemUnlockCondItem &inout Model)
{
    return Model.GetCanSkip();
}
TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem> __UIGetter_Self(const FVM_ForgeWeaponItemUnlockCondItem &inout Model)
{
    return TEUIModelRef<FVM_ForgeWeaponItemUnlockCondItem>(Model);
}
int __IndexOf_ConditionText()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_ForgeWeaponItemUnlockCondItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
