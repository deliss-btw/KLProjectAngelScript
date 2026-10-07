
namespace FItemQuickSlotModel
{
    const int ModelId = 0;

}
struct FItemQuickSlotModel : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> m_QuickSlot;

    FItemQuickSlotModel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FItemQuickSlotModel' by default constructor.");
        return;
    }
    FItemQuickSlotModel(const FItemQuickSlotModel &inout Other)
    {
        this.m_QuickSlot = Other.m_QuickSlot;
        return;
    }
    FItemQuickSlotModel(const TDataObjectPtr<FItemQuickSlotConfig> &inout InQuickSlot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetQuickSlot(InQuickSlot);
        return;
    }
    FItemQuickSlotModel& opAssign(const FItemQuickSlotModel &inout Other)
    {
        return Other.m_QuickSlot;
    }
    bool IsEmpty() const
    {
        if (::InventoryUtils::GetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetQuickSlot()))
        {
            return false;
        }
        return true;
    }
    FSlateBrush GetItemIcon() const
    {
        TDataObjectPtr<FItemConfig> local_28 = ::InventoryUtils::GetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetQuickSlot());
        if (local_28)
        {
            return local_28.opArrow().ItemIcon.LoadBrush();
        }
        return ::UGlobalItemSettings::Get().EmptyItemIcon.LoadBrush();
    }
    int GetItemNum() const
    {
        TDataObjectPtr<FItemConfig> local_28 = ::InventoryUtils::GetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetQuickSlot());
        if (local_28)
        {
            if (::InventoryUtils::IsPresentationOnlyItem(local_28))
            {
                return ::FMS_RemnantItemModel::Get(this.GetContext().Manager).GetRemnantItemNum();
            }
            return ::InventoryUtils::GetInventoryItemNumber(this.GetContext().GetLocalPlayer(), local_28);
        }
        return 0;
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const
    {
        return ::InventoryUtils::GetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetQuickSlot());
    }
    const TDataObjectPtr<FItemQuickSlotConfig> GetQuickSlot() const property
    {
        const TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemQuickSlotConfig> GetModify_QuickSlot() property
    {
        TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetQuickSlot(const TDataObjectPtr<FItemQuickSlotConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_QuickSlot = __Value;
        return;
    }
}

namespace FItemQuickSlotModel
{
FItemQuickSlotModel& Create(const UObject ContextObject, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot)
{
    return FItemQuickSlotModel::CreateByManager(EUIInternal::GetContextManager(ContextObject), QuickSlot);
}
FItemQuickSlotModel CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot)
{
    FItemQuickSlotModel __r;
    TEUIModelRef<FItemQuickSlotModel> local_6 = TEUIModelRef<FItemQuickSlotModel>(EUIInternal::MakeModelWithManager_Generic(Manager, FItemQuickSlotModel::ModelId, 0, QuickSlot));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FItemQuickSlotModel;
}
int __IndexOf_QuickSlot()
{
    return 0;
}
}
