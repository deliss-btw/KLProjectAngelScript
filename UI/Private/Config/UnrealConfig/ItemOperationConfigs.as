

class UItemOperationConfig_GainWay : UItemOperationConfigBase
{
    UPROPERTY()
    TSoftClassPtr<UWidget_ItemGainWay> ExpandWidget;

    UItemOperationConfig_GainWay()
    {
        super();
        return;
    }
    bool ShowOperationForItem(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        return !(ItemData.opArrow().GetConfig().opArrow().GainWays.IsEmpty());
    }
    bool IsExpandable() const
    {
        return true;
    }
    FItemOperationExpandInfo ExpandOperation(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        FItemOperationExpandInfo local_24;
        FItemOperationExpandInfo __r;
        local_24.ContentWidget = this.ExpandWidget;
        FEUIModelContainer local_38;
        local_24.ContentModels = local_38;
        return __r;
    }
}

UCLASS(Abstract)
class UItemOperationConfig_NumOperationBase : UItemOperationConfigBase
{
    UPROPERTY()
    TSoftClassPtr<UWidget_ItemNumOperationPanel> ExpandWidget;
    UPROPERTY()
    FText ExpandTitle;
    UPROPERTY()
    FText ExpandButtonName;

    UItemOperationConfig_NumOperationBase()
    {
        super();
        return;
    }
    bool ShowOperationForItem(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        return ::FMS_PlayerInventory::Get(ItemData.opArrow().GetContext().Manager).IsInInventory(ItemData);
    }
    bool IsExpandable() const
    {
        return true;
    }
    FItemOperationExpandInfo ExpandOperation(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        FItemOperationExpandInfo local_24;
        FItemOperationExpandInfo __r;
        local_24.ContentWidget = this.ExpandWidget;
        TEUIModelRef<FVM_CommonRewardList> local_26 = this.GetResultPreview(ItemData);
        FEUIModelContainer local_40;
        local_24.ContentModels = local_40;
        return __r;
    }
    void ExecuteOperation(const TEUIModelRef<FM_ItemData> &inout ItemData, const int ItemNum) const
    {
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetResultPreview(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        FEUIModelRef local_2;
        return TEUIModelRef<FVM_CommonRewardList>(local_2);
    }
}

class UItemOperationConfig_Decompose : UItemOperationConfig_NumOperationBase
{
    UItemOperationConfig_Decompose()
    {
        super();
        return;
    }
    bool ShowOperationForItem(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        if (!(ItemData.IsValid()) || !(ItemData.opArrow().GetConfig()) || !(ItemData.opArrow().GetConfig().opArrow().GetDecomposeConfig()))
        {
            return false;
        }
        if (::ItemConfigUtils::IsDSItem(ItemData.opArrow().GetConfig()))
        {
            return false;
        }
        CastTo local_6;
        TDataObjectPtr<FEquipmentConfig> local_30 = local_6.opCall();
        if (local_30)
        {
            if (!(::FEquipmentUtils::CanDecompose(local_30)))
            {
                return false;
            }
        }
        return Super::ShowOperationForItem(ItemData);
    }
    void ExecuteOperation(const TEUIModelRef<FM_ItemData> &inout ItemData, const int ItemNum) const
    {
        FMS_PlayerInventory& local_2 = ::FMS_PlayerInventory::Get(ItemData.opArrow().GetContext().Manager);
        local_2.GS_RequestDecomposeItem(ItemData, ItemNum);
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetResultPreview(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        return TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(ItemData.opArrow().GetContext().Manager, ::FCommonRewardListBuilder::BuildFromDropConfig(ItemData.opArrow().GetConfig().opArrow().GetDecomposeConfig())));
    }
}

class UItemOperationConfig_Drop : UItemOperationConfig_NumOperationBase
{
    UItemOperationConfig_Drop()
    {
        super();
        return;
    }
    bool ShowOperationForItem(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        if (!(::ItemConfigUtils::IsDSItem(ItemData.opArrow().GetConfig())))
        {
            return false;
        }
        if (!(::ItemActionUtils::CanExecuteAction(ItemData.opArrow().GetConfig(), ::FItemActionSource::InvokeFromInventory(ItemData.opArrow().GetContext()), EItemActionType(1))))
        {
            return false;
        }
        return Super::ShowOperationForItem(ItemData);
    }
    void ExecuteOperation(const TEUIModelRef<FM_ItemData> &inout ItemData, const int ItemNum) const
    {
        int local_1 = 0;
        for (; local_1 < ItemNum; )
        {
            ::ItemActionUtils::ExecuteActionFromUI(ItemData.opArrow().GetConfig(), ::FItemActionSource::InvokeFromInventory(ItemData.opArrow().GetContext()), EItemActionType(1));
            ++local_1;
        }
        return;
    }
}

class UItemOperationConfig_Destroy : UItemOperationConfig_NumOperationBase
{
    UItemOperationConfig_Destroy()
    {
        super();
        return;
    }
    bool ShowOperationForItem(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        if (!(::ItemConfigUtils::IsDSItem(ItemData.opArrow().GetConfig())))
        {
            return false;
        }
        if (!(::ItemActionUtils::CanExecuteAction(ItemData.opArrow().GetConfig(), ::FItemActionSource::InvokeFromInventory(ItemData.opArrow().GetContext()), EItemActionType(2))))
        {
            return false;
        }
        return Super::ShowOperationForItem(ItemData);
    }
    void ExecuteOperation(const TEUIModelRef<FM_ItemData> &inout ItemData, const int ItemNum) const
    {
        int local_1 = 0;
        for (; local_1 < ItemNum; )
        {
            ::ItemActionUtils::ExecuteActionFromUI(ItemData.opArrow().GetConfig(), ::FItemActionSource::InvokeFromInventory(ItemData.opArrow().GetContext()), EItemActionType(2));
            ++local_1;
        }
        return;
    }
}

