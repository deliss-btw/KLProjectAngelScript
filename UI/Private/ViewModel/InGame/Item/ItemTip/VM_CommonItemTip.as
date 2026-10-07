
namespace FVM_CommonItemTipOperationItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExecuteOrOpen = FEUIModelCallbackSignature();
}
namespace FVM_CommonItemTipOperationList
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ToggleShowList = FEUIModelCallbackSignature();
}
namespace FVM_CommonItemTip
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ToggleOperationList = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ExecuteMoreAction = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ExecuteUseAction = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ExecuteGSUseAction = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ExecuteDropAction = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ExecuteDestroyAction = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ExecuteEquipAction = FEUIModelCallbackSignature();
}
namespace FVM_CommonItemTipHost
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature PinAndOpenOperations = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature Unpin = FEUIModelCallbackSignature();

}
struct FItemTipActionRequest
{
    UPROPERTY()
    EItemTipActionId ActionId = EItemTipActionId(1);
    UPROPERTY()
    FSimpleModelEvent OnExecute;

    FItemTipActionRequest(const EItemTipActionId InActionId)
    {
        this.ActionId = InActionId;
        return;
    }
    FItemTipActionRequest(const EItemTipActionId InActionId, const FSimpleModelEvent &inout InOnExecute)
    {
        this.ActionId = InActionId;
        return;
    }
}

struct FItemTipData
{
    UPROPERTY()
    TEUIModelRef<FM_ItemData> ItemData;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ItemConfig;
    UPROPERTY()
    TEUIModelRef<FM_DisplayItemData> DisplayData;
    UPROPERTY()
    int DisplayNum = 1;
    UPROPERTY()
    bool bCollectOperations = false;
    UPROPERTY()
    TArray<FItemTipActionRequest> ActionRequests;


    bool IsValid() const
    {
        bool local_1;
        if (this.IsValid())
        {
            local_1 = true;
        }
        else
        {
            local_1 = this.ItemConfig;
        }
        local_1 = local_1 || this.DisplayData.IsValid();
        return local_1;
    }
}

struct FVM_CommonItemTipOperationItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    UItemOperationConfigBase m_OperationConfig;
    UPROPERTY()
    FItemTipData m_Data;
    UPROPERTY()
    FEUIModelWeakRef m_OwningList;
    UPROPERTY()
    FItemOperationExpandInfo m_ExpandInfo;
    UPROPERTY()
    bool m_bUseCustomEntry;
    UPROPERTY()
    FText m_CustomOperationName;
    UPROPERTY()
    FEUIInputAction m_CustomInputAction;
    UPROPERTY()
    FSimpleModelEvent m_CustomExecuteEvent;
    UPROPERTY()
    bool m_bUseGainWayEntry;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_GainWayItemConfig;
    UPROPERTY()
    int m_GainWayIndex;
    UPROPERTY()
    TWeakObjectPtr<UWidget> m_SharedHoverAnchor;

    FVM_CommonItemTipOperationItem()
    {
        this.m_OperationConfig = nullptr;
        this.m_bUseCustomEntry = false;
        this.m_bUseGainWayEntry = false;
        this.m_GainWayIndex = -1;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonItemTipOperationItem' by default constructor.");
        return;
    }
    FVM_CommonItemTipOperationItem(const FVM_CommonItemTipOperationItem &inout Other)
    {
        this.m_OperationConfig = nullptr;
        this.m_bUseCustomEntry = false;
        this.m_bUseGainWayEntry = false;
        this.m_GainWayIndex = -1;
        this.m_OperationConfig = Other.m_OperationConfig;
        this.m_OwningList = Other.m_OwningList;
        this.m_bUseCustomEntry = Other.m_bUseCustomEntry;
        this.m_CustomOperationName = Other.m_CustomOperationName;
        this.m_CustomInputAction = Other.m_CustomInputAction;
        this.m_bUseGainWayEntry = Other.m_bUseGainWayEntry;
        this.m_GainWayItemConfig = Other.m_GainWayItemConfig;
        this.m_GainWayIndex = int(Other.m_GainWayIndex);
        this.m_SharedHoverAnchor = Other.m_SharedHoverAnchor;
        return;
    }
    FVM_CommonItemTipOperationItem(const UItemOperationConfigBase InOperationConfig, const FItemTipData &inout InData, const FEUIModelWeakRef &inout InOwningList)
    {
        this.m_OperationConfig = nullptr;
        this.m_bUseCustomEntry = false;
        this.m_bUseGainWayEntry = false;
        this.m_GainWayIndex = -1;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOperationConfig(InOperationConfig);
        this.SetData(InData);
        this.SetOwningList(InOwningList);
        return;
    }
    FVM_CommonItemTipOperationItem& opAssign(const FVM_CommonItemTipOperationItem &inout Other)
    {
        this.m_OperationConfig = Other.m_OperationConfig;
        this.m_OwningList = Other.m_OwningList;
        this.m_bUseCustomEntry = Other.m_bUseCustomEntry;
        this.m_CustomOperationName = Other.m_CustomOperationName;
        this.m_CustomInputAction = Other.m_CustomInputAction;
        this.m_bUseGainWayEntry = Other.m_bUseGainWayEntry;
        this.m_GainWayItemConfig = Other.m_GainWayItemConfig;
        this.m_GainWayIndex = int(Other.m_GainWayIndex);
        return Other.m_SharedHoverAnchor;
    }
    void PostConstruct()
    {
        if (!((this.GetOperationConfig() != nullptr)) || !(this.GetData().ItemData.IsValid()) || !(this.GetOperationConfig().IsExpandable()))
        {
            return;
        }
        this.SetExpandInfo(this.GetOperationConfig().ExpandOperation(this.GetData().ItemData));
        return;
    }
    FEUIInputAction GetInputAction() const
    {
        if (this.GetbUseGainWayEntry())
        {
            TArray<FEUIInputAction> local_6 = ::UGlobalItemSettings::Get().ItemOperationSequencedInputActions;
            if (local_6.IsValidIndex(this.GetGainWayIndex()))
            {
                return local_6[this.GetGainWayIndex()];
            }
            return FEUIInputAction();
        }
        if (this.GetbUseCustomEntry())
        {
            return this.GetCustomInputAction();
        }
        FEUIInputAction local_24;
        if (this.GetOperationConfig() != nullptr)
        {
            local_24 = this.GetOperationConfig().InputAction;
        }
        else
        {
            local_24 = FEUIInputAction();
        }
        return local_24;
    }
    FText GetOperationName() const
    {
        if (this.GetbUseGainWayEntry())
        {
            if (this.GetGainWayItemConfig() && this.GetGainWayItemConfig().opArrow().GainWays.IsValidIndex(this.GetGainWayIndex()))
            {
                return this.GetGainWayItemConfig().opArrow().GainWays[this.GetGainWayIndex()].DisplayName;
            }
            return FText();
        }
        if (this.GetbUseCustomEntry())
        {
            return this.GetCustomOperationName();
        }
        FText local_16;
        if (this.GetOperationConfig() != nullptr)
        {
            local_16 = this.GetOperationConfig().OperationName;
        }
        else
        {
            local_16 = FText();
        }
        return local_16;
    }
    bool IsExpandable() const
    {
        if (this.GetbUseGainWayEntry())
        {
            return false;
        }
        if (this.GetbUseCustomEntry())
        {
            return false;
        }
        return this.GetOperationConfig() != nullptr && this.GetOperationConfig().IsExpandable();
    }
    ESlateVisibility GetExpandIconVisibility() const
    {
        int local_2;
        if (this.IsExpandable())
        {
            local_2 = 4;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool HasExpandHover() const
    {
        return this.IsExpandable() && !(this.GetExpandInfo().ContentWidget.IsNull()) && !(this.GetExpandInfo().ContentModels.IsEmpty());
    }
    bool ShouldShowExecuteButton() const
    {
        return !(this.HasExpandHover());
    }
    bool HasExecuteAction() const
    {
        return this.GetbUseGainWayEntry() || (this.GetbUseCustomEntry() && this.GetCustomExecuteEvent().IsBound());
    }
    TSoftClassPtr<UUserWidget> GetExpandHoverWidgetClass() const
    {
        return this.GetExpandInfo().ContentWidget;
    }
    FEUIModelContainer GetExpandHoverModels() const
    {
        return this.GetExpandInfo().ContentModels;
    }
    TEUIModelRef<FVM_CommonActionEntry> CreateActionEntry()
    {
        FSimpleModelEvent local_22;
        if (this.HasExecuteAction())
        {
            local_22.Add(this, FVM_CommonItemTipOperationItem::ExecuteOrOpen);
        }
        FVM_CommonActionEntry& local_26 = ::FVM_CommonActionEntry::Create(this.GetContext().Manager);
        local_26.Setup(this.GetOperationName());
        if (local_22.IsBound())
        {
            local_26.UseExecute(local_22, this.GetInputAction());
        }
        else
        {
            if (!(this.GetExpandHoverWidgetClass().IsNull()))
            {
                local_26.UseHover(this.GetExpandHoverWidgetClass(), this.GetExpandHoverModels(), this.GetInputAction());
            }
        }
        local_26.AllowArrow(true);
        local_26.SetSharedHoverAnchor(this.ResolveSharedHoverAnchorWidget());
        return TEUIModelRef<FVM_CommonActionEntry>(local_26);
    }
    void ExecuteOrOpen()
    {
        if (this.GetbUseGainWayEntry())
        {
            if (this.GetGainWayItemConfig() && this.GetGainWayItemConfig().opArrow().GainWays.IsValidIndex(this.GetGainWayIndex()))
            {
                TSoftClassPtr<UEUIUserWidget> local_6;
                int local_2 = this.GetGainWayIndex();
                if (!(local_6.IsNull()))
                {
                    ::CommonPopup::CloseAllHover();
                    FEUIWidget::AddWidgetByClass(this.GetContext().UELocalPlayer, local_6);
                }
            }
            return;
        }
        else
        {
            if (this.GetbUseCustomEntry())
            {
                if (this.GetCustomExecuteEvent().IsBound())
                {
                    this.GetCustomExecuteEvent().Broadcast();
                }
                return;
            }
            else
            {
                if (!((this.GetOperationConfig() != nullptr)) || !(this.GetData().ItemData.IsValid()))
                {
                    return;
                }
            }
        }
    }
    void SetupCustomLeaf(const FText &inout InOperationName, const FEUIInputAction &inout InInputAction, const FSimpleModelEvent &inout InExecuteEvent)
    {
        this.SetbUseCustomEntry(true);
        this.SetCustomOperationName(InOperationName);
        this.SetCustomInputAction(InInputAction);
        this.SetCustomExecuteEvent(InExecuteEvent);
        return;
    }
    void SetupGainWayLeaf(const TDataObjectPtr<FItemConfig> &inout InItemConfig, const int InGainWayIndex)
    {
        this.SetbUseGainWayEntry(true);
        this.SetGainWayItemConfig(InItemConfig);
        this.SetGainWayIndex(InGainWayIndex);
        return;
    }
    void SetSharedHoverAnchor(const UWidget InHoverAnchor)
    {
        this.SetSharedHoverAnchor(TWeakObjectPtr<UWidget>(InHoverAnchor));
        return;
    }
    UWidget ResolveSharedHoverAnchorWidget() const
    {
        TWeakObjectPtr<UWidget> local_2 = this.GetSharedHoverAnchor();
        UWidget local_4;
        return local_4;
    }
    UItemOperationConfigBase GetOperationConfig() const property
    {
        this.TrackPropertyRead(0);
        return this.m_OperationConfig;
    }
    void SetOperationConfig(const UItemOperationConfigBase __Value) property
    {
        if (this.m_OperationConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FItemTipData GetData() const property
    {
        const FItemTipData __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FItemTipData GetModify_Data() property
    {
        FItemTipData __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetData(const FItemTipData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const FEUIModelWeakRef GetOwningList() const property
    {
        const FEUIModelWeakRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelWeakRef GetModify_OwningList() property
    {
        FEUIModelWeakRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOwningList(const FEUIModelWeakRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OwningList = __Value;
        return;
    }
    const FItemOperationExpandInfo GetExpandInfo() const property
    {
        const FItemOperationExpandInfo __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FItemOperationExpandInfo GetModify_ExpandInfo() property
    {
        FItemOperationExpandInfo __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetExpandInfo(const FItemOperationExpandInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        return;
    }
    bool GetbUseCustomEntry() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bUseCustomEntry;
    }
    void SetbUseCustomEntry(const bool __Value) property
    {
        if (!(this.m_bUseCustomEntry) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bUseCustomEntry = __Value;
        return;
    }
    const FText GetCustomOperationName() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_CustomOperationName() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCustomOperationName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CustomOperationName = __Value;
        return;
    }
    const FEUIInputAction GetCustomInputAction() const property
    {
        const FEUIInputAction __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIInputAction GetModify_CustomInputAction() property
    {
        FEUIInputAction __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCustomInputAction(const FEUIInputAction &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CustomInputAction = __Value;
        return;
    }
    const FSimpleModelEvent GetCustomExecuteEvent() const property
    {
        const FSimpleModelEvent __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FSimpleModelEvent GetModify_CustomExecuteEvent() property
    {
        FSimpleModelEvent __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCustomExecuteEvent(const FSimpleModelEvent &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        return;
    }
    bool GetbUseGainWayEntry() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bUseGainWayEntry;
    }
    void SetbUseGainWayEntry(const bool __Value) property
    {
        if (!(this.m_bUseGainWayEntry) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bUseGainWayEntry = __Value;
        return;
    }
    const TDataObjectPtr<FItemConfig> GetGainWayItemConfig() const property
    {
        const TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_GainWayItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetGainWayItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_GainWayItemConfig = __Value;
        return;
    }
    int GetGainWayIndex() const property
    {
        this.TrackPropertyRead(10);
        return this.m_GainWayIndex;
    }
    void SetGainWayIndex(const int __Value) property
    {
        if (this.m_GainWayIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_GainWayIndex = __Value;
        return;
    }
    TWeakObjectPtr<UWidget> GetSharedHoverAnchor() const property
    {
        this.TrackPropertyRead(11);
        return this.m_SharedHoverAnchor;
    }
    void SetSharedHoverAnchor(const TWeakObjectPtr<UWidget> &inout __Value) property
    {
        if ((this.m_SharedHoverAnchor == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SharedHoverAnchor = __Value;
        return;
    }
}

struct FVM_CommonItemTipOperationList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FItemTipData m_Data;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonActionEntry>> m_OperationItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> m_OperationPayloads;
    UPROPERTY()
    bool m_bShowList;
    UPROPERTY()
    TWeakObjectPtr<UWidget> m_SharedHoverAnchor;

    FVM_CommonItemTipOperationList()
    {
        this.m_bShowList = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonItemTipOperationList' by default constructor.");
        return;
    }
    FVM_CommonItemTipOperationList(const FVM_CommonItemTipOperationList &inout Other)
    {
        this.m_bShowList = false;
        this.m_OperationItems = Other.m_OperationItems;
        this.m_OperationPayloads = Other.m_OperationPayloads;
        this.m_bShowList = Other.m_bShowList;
        this.m_SharedHoverAnchor = Other.m_SharedHoverAnchor;
        return;
    }
    FVM_CommonItemTipOperationList(const FItemTipData &inout InData)
    {
        this.m_bShowList = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetData(InData);
        return;
    }
    FVM_CommonItemTipOperationList& opAssign(const FVM_CommonItemTipOperationList &inout Other)
    {
        this.m_OperationItems = Other.m_OperationItems;
        this.m_OperationPayloads = Other.m_OperationPayloads;
        this.m_bShowList = Other.m_bShowList;
        return Other.m_SharedHoverAnchor;
    }
    void PostConstruct()
    {
        this.Rebuild(this.GetData(), false);
        return;
    }
    void Rebuild(const FItemTipData &inout InData, const bool bInShowList)
    {
        int local_26 = 0;
        this.SetData(InData);
        this.SetbShowList(bInShowList && this.GetData().ItemData.IsValid());
        this.GetModify_OperationItems().Empty(0);
        this.GetModify_OperationPayloads().Empty(0);
        if (!(this.GetData().bCollectOperations))
        {
            this.SetbShowList(false);
            return;
        }
        if (!(this.GetData().ItemData.IsValid()))
        {
            return;
        }
        for (auto& local_20 : ::UGlobalItemSettings::Get().ItemOperationConfigs)
        {
            if (local_20.ShowOperationForItem(this.GetData().ItemData))
            {
                FEUIModelWeakRef local_22 = FEUIModelWeakRef(FEUIModelRef(this));
                TWeakObjectPtr<UWidget> local_28 = this.GetSharedHoverAnchor();
                UWidget local_30;
                local_26.SetSharedHoverAnchor(local_30);
                this.GetModify_OperationPayloads().Add(TEUIModelRef<FVM_CommonItemTipOperationItem>(local_26));
                this.GetModify_OperationItems().Add(local_26.CreateActionEntry());
            }
        }
        this.SetbShowList(bInShowList && this.HasAnyOperation());
        return;
    }
    void SetSharedHoverAnchor(const UWidget InHoverAnchor)
    {
        this.SetSharedHoverAnchor(TWeakObjectPtr<UWidget>(InHoverAnchor));
        for (auto& local_18 : this.GetOperationItems())
        {
            if (local_18.IsValid())
            {
                InHoverAnchor.SetSharedHoverAnchor();
            }
        }
        for (auto& local_32 : this.GetOperationPayloads())
        {
            if (local_32.IsValid())
            {
                InHoverAnchor.SetSharedHoverAnchor();
            }
        }
        return;
    }
    void SetShowList(const bool bInShowList)
    {
        if (bInShowList && this.GetData().ItemData.IsValid() && this.GetOperationItems().IsEmpty())
        {
            this.Rebuild(this.GetData(), true);
            return;
        }
        this.SetbShowList(bInShowList && this.GetData().ItemData.IsValid() && this.HasAnyOperation());
        return;
    }
    void ToggleShowList()
    {
        this.SetShowList(!(this.GetbShowList()));
        return;
    }
    bool HasAnyOperation() const
    {
        return !(this.GetOperationItems().IsEmpty());
    }
    bool GetShowList() const
    {
        return this.GetbShowList() && this.HasAnyOperation();
    }
    TArray<FEUIDynamicWidgetData> GetOperationEntryDataList() const
    {
        TArray<FEUIDynamicWidgetData> local_4;
        for (auto& local_20 : this.GetOperationItems())
        {
            if (!(local_20.IsValid()))
            {
                continue;
            }
            FEUIDynamicWidgetData local_44;
            local_44.ModelContainer = FEUIModelContainer(local_20.opImplConv());
            local_4.Add(local_44);
        }
        return local_4;
    }
    const FItemTipData GetData() const property
    {
        const FItemTipData __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FItemTipData GetModify_Data() property
    {
        FItemTipData __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetData(const FItemTipData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonActionEntry>> GetOperationItems() const property
    {
        const TArray<TEUIModelRef<FVM_CommonActionEntry>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonActionEntry>> GetModify_OperationItems() property
    {
        TArray<TEUIModelRef<FVM_CommonActionEntry>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOperationItems(const TArray<TEUIModelRef<FVM_CommonActionEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_OperationItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> GetOperationPayloads() const property
    {
        const TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> GetModify_OperationPayloads() property
    {
        TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOperationPayloads(const TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OperationPayloads = __Value;
        return;
    }
    bool GetbShowList() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bShowList;
    }
    void SetbShowList(const bool __Value) property
    {
        if (!(this.m_bShowList) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bShowList = __Value;
        return;
    }
    TWeakObjectPtr<UWidget> GetSharedHoverAnchor() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SharedHoverAnchor;
    }
    void SetSharedHoverAnchor(const TWeakObjectPtr<UWidget> &inout __Value) property
    {
        if ((this.m_SharedHoverAnchor == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SharedHoverAnchor = __Value;
        return;
    }
}

struct FVM_CommonItemTip : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FItemTipData m_Data;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemData;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_Item;
    UPROPERTY()
    TEUIModelRef<FVM_DisplayItem> m_DisplayItem;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItem;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemTipDisplayAdapter> m_TipDisplay;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemTipOperationList> m_OperationList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InputAction>> m_TipActions;
    UPROPERTY()
    FSimpleModelEvent m_MoreActionPreExecute;
    UPROPERTY()
    bool m_bPinned;

    FVM_CommonItemTip()
    {
        this.m_bPinned = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonItemTip' by default constructor.");
        return;
    }
    FVM_CommonItemTip(const FVM_CommonItemTip &inout Other)
    {
        this.m_bPinned = false;
        this.m_ItemData = Other.m_ItemData;
        this.m_Item = Other.m_Item;
        this.m_DisplayItem = Other.m_DisplayItem;
        this.m_CommonItem = Other.m_CommonItem;
        this.m_TipDisplay = Other.m_TipDisplay;
        this.m_OperationList = Other.m_OperationList;
        this.m_TipActions = Other.m_TipActions;
        this.m_bPinned = Other.m_bPinned;
        return;
    }
    FVM_CommonItemTip(const FItemTipData &inout InData)
    {
        this.m_bPinned = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetData(InData);
        return;
    }
    FVM_CommonItemTip opAssign(const FVM_CommonItemTip &inout Other)
    {
        FVM_CommonItemTip __r;
        this.m_ItemData = Other.m_ItemData;
        this.m_Item = Other.m_Item;
        this.m_DisplayItem = Other.m_DisplayItem;
        this.m_CommonItem = Other.m_CommonItem;
        this.m_TipDisplay = Other.m_TipDisplay;
        this.m_OperationList = Other.m_OperationList;
        this.m_TipActions = Other.m_TipActions;
        this.m_bPinned = Other.m_bPinned;
        return __r;
    }
    void PostConstruct()
    {
        this.BuildItemData();
        if (!(this.GetItemData().IsValid()) && !(this.GetData().DisplayData.IsValid()))
        {
            return;
        }
        FItemTipData local_38;
        if (this.GetItemData().IsValid())
        {
            local_38.ItemData = this.GetItemData();
            local_38.ItemConfig = this.GetItemData().opArrow().GetConfig();
            local_38.DisplayNum = this.GetItemData().opArrow().GetNum();
            this.SetItem(TEUIModelRef<FVM_Item>(::FVM_Item::Create(this.GetContext().Manager, this.GetItemData())));
        }
        else
        {
            local_38.DisplayData = this.GetData().DisplayData;
            this.SetDisplayItem(TEUIModelRef<FVM_DisplayItem>(::FVM_DisplayItem::Create(this.GetContext().Manager, this.GetData().DisplayData, EItemDisplayScenario(0))));
            if (this.GetDisplayItem().IsValid())
            {
                TEUIModelRef<FVM_CommonItem> local_106;
                TEUIModelRef<FVM_DisplayItem> local_104 = this.GetDisplayItem();
                local_106.GetCommonItemVM();
                this.SetCommonItem(local_106);
            }
        }
        this.SetOperationList(TEUIModelRef<FVM_CommonItemTipOperationList>(::FVM_CommonItemTipOperationList::Create(this.GetContext().Manager, local_38)));
        this.BuildTipDisplay();
        this.RebuildTipActions();
        return;
    }
    void BuildTipDisplay()
    {
        FVM_CommonItemTipDisplayAdapter& local_2 = ::FVM_CommonItemTipDisplayAdapter::Create(this.GetContext().Manager);
        bool local_3 = false;
        if (this.GetItem().IsValid())
        {
            local_3 = local_2.TrySetupFromItem(this.GetItem());
        }
        else
        {
            if (this.GetDisplayItem().IsValid())
            {
                local_3 = local_2.TrySetupFromDisplayItem(this.GetDisplayItem());
            }
            else
            {
                if (this.GetData().DisplayData.IsValid())
                {
                    local_3 = local_2.TrySetupFromDisplayData(this.GetData().DisplayData);
                }
            }
        }
        if (local_3)
        {
            this.SetTipDisplay(TEUIModelRef<FVM_CommonItemTipDisplayAdapter>(local_2));
        }
        return;
    }
    void RefreshTipActionsForOperationList()
    {
        if (this.GetOperationList().IsValid())
        {
            TEUIModelRef<FVM_CommonItemTipOperationList> local_2 = this.GetOperationList();
            GetShowList();
        }
        this.RebuildTipActions();
        return;
    }
    void ToggleOperationList()
    {
        if (this.GetOperationList().IsValid())
        {
            TEUIModelRef<FVM_CommonItemTipOperationList> local_2 = this.GetOperationList();
            ToggleShowList();
        }
        return;
    }
    void ExecuteMoreAction()
    {
        if (this.GetMoreActionPreExecute().IsBound())
        {
            this.GetMoreActionPreExecute().Broadcast();
        }
        this.ToggleOperationList();
        return;
    }
    bool HasTipActions() const
    {
        return !(this.GetTipActions().IsEmpty());
    }
    void RebuildTipActions()
    {
        this.GetModify_TipActions().Empty(0);
        if (this.GetData().ActionRequests.IsEmpty())
        {
            return;
        }
        for (auto& local_16 : this.GetData().ActionRequests)
        {
            this.AddTipAction(local_16);
        }
        return;
    }
    void AddTipAction(const FItemTipActionRequest &inout Request)
    {
        int local_2 = int(Request.ActionId);
        if (local_2 <= 5)
        {
            if (local_2 != 1)
            {
                if (local_2 != 5)
                {
                }
            }
            else
            {
                this.AddAutoItemMainAction();
                return;
            }
        }
        this.AddCustomTipAction(Request);
        return;
    }
    void AddAutoItemMainAction()
    {
        EItemActionType local_7;
        if (!(this.GetItemData().IsValid()) || !(this.GetItemData().opArrow().GetConfig()))
        {
            return;
        }
        if (this.CanUseGSCommonItem())
        {
            this.AddGSUseItemAction();
            return;
        }
        TSubclassOf<UItemActionConfigBase> local_6;
        if (!(::ItemActionUtils::FindMainActionConfig(this.GetItemData().opArrow().GetConfig(), local_6, local_7)))
        {
            return;
        }
        this.AddItemAction(EItemActionType(local_7));
        return;
    }
    bool CanUseGSCommonItem() const
    {
        if (!(this.GetItemData().IsValid()) || !(this.GetItemData().opArrow().GetConfig()) || (this.GetItemData().opArrow().GetNum() <= 0))
        {
            return false;
        }
        TEUIModelRef<FM_ItemData> local_2 = this.GetItemData();
        CastTo local_34;
        TDataObjectPtr<FCommonItemConfig> local_58 = local_34.opCall();
        return local_58 && !(local_58.opArrow().GSUseEffects.IsEmpty());
    }
    void AddGSUseItemAction()
    {
        FSimpleModelEvent local_22;
        local_22.Add(this, FVM_CommonItemTip::ExecuteGSUseAction);
        return;
    }
    void AddItemAction(const EItemActionType ActionType)
    {
        TEUIModelRef<FM_ItemData> local_2 = this.GetItemData();
        if (!(::ItemActionUtils::CanExecuteAction(this.GetItemData().opArrow().GetConfig(), ::FItemActionSource::InvokeFromInventory(this.GetContext()))))
        {
            return;
        }
        FSimpleModelEvent local_60;
        if (int(ActionType) == 0)
        {
            local_60.Add(this, FVM_CommonItemTip::ExecuteUseAction);
        }
        else
        {
            if (int(ActionType) == 1)
            {
                local_60.Add(this, FVM_CommonItemTip::ExecuteDropAction);
            }
            else
            {
                if (int(ActionType) == 2)
                {
                    local_60.Add(this, FVM_CommonItemTip::ExecuteDestroyAction);
                }
                else
                {
                    if (int(ActionType) == 3)
                    {
                        local_60.Add(this, FVM_CommonItemTip::ExecuteEquipAction);
                    }
                    else
                    {
                        return;
                    }
                }
            }
        }
        return;
    }
    void AddItemActionInput(const EItemActionType ActionType, const FSimpleModelEvent &inout ExecuteEvent)
    {
        FEUIInputAction local_6;
        if (!(this.FindItemActionInput(EItemActionType(ActionType), local_6)))
        {
            return;
        }
        this.GetModify_TipActions().Add(TEUIModelRef<FVM_InputAction>(::FVM_InputAction::Create(this.GetContext().Manager, local_6, ExecuteEvent)));
        return;
    }
    void AddMoreAction(const FItemTipActionRequest &inout Request)
    {
        FSimpleModelEvent local_22;
        this.SetMoreActionPreExecute(local_22);
        bool local_25 = !(this.GetOperationList().IsValid());
        if (local_25)
        {
            local_25 = true;
        }
        else
        {
            TEUIModelRef<FVM_CommonItemTipOperationList> local_24 = this.GetOperationList();
            local_25 = !(HasAnyOperation());
        }
        if (local_25)
        {
            return;
        }
        FEUIInputAction local_32;
        if (!(this.FindItemTipActionInput(EItemTipActionId(5), local_32)))
        {
            return;
        }
        this.SetMoreActionPreExecute(Request.OnExecute);
        FSimpleModelEvent local_56;
        local_56.Add(this, FVM_CommonItemTip::ExecuteMoreAction);
        this.GetModify_TipActions().Add(TEUIModelRef<FVM_InputAction>(::FVM_InputAction::Create(this.GetContext().Manager, local_32, local_56)));
        return;
    }
    void AddCustomTipAction(const FItemTipActionRequest &inout Request)
    {
        if (!(Request.OnExecute.IsBound()))
        {
            return;
        }
        FEUIInputAction local_8;
        if (!(this.FindItemTipActionInput(Request.ActionId, local_8)))
        {
            return;
        }
        this.GetModify_TipActions().Add(TEUIModelRef<FVM_InputAction>(::FVM_InputAction::Create(this.GetContext().Manager, local_8, Request.OnExecute)));
        return;
    }
    bool FindItemTipActionInput(const EItemTipActionId ActionId, FEUIInputAction &out InputAction) const
    {
        FEUIInputAction local_6;
        InputAction = local_6;
        if (::UGlobalItemSettings::Get().ItemTipActionInputs.Find(ActionId, InputAction))
        {
            return !(InputAction.IsNull());
        }
        return false;
    }
    bool FindItemActionInput(const EItemActionType ActionType, FEUIInputAction &out InputAction) const
    {
        FEUIInputAction local_6;
        InputAction = local_6;
        if (::UGlobalItemSettings::Get().ItemActionInputActions.Find(ActionType, InputAction))
        {
            return !(InputAction.IsNull());
        }
        return false;
    }
    void ExecuteUseAction()
    {
        if (this.CanUseGSCommonItem())
        {
            this.ExecuteGSUseAction();
            return;
        }
        this.ExecuteItemAction(EItemActionType(0));
        return;
    }
    void ExecuteGSUseAction()
    {
        if (!(this.CanUseGSCommonItem()))
        {
            return;
        }
        ::FMS_PlayerInventory::Get(this.GetContext().Manager).GS_RequestUseItem(this.GetItemData(), 1);
        return;
    }
    void ExecuteDropAction()
    {
        this.ExecuteItemAction(EItemActionType(1));
        return;
    }
    void ExecuteDestroyAction()
    {
        this.ExecuteItemAction(EItemActionType(2));
        return;
    }
    void ExecuteEquipAction()
    {
        this.ExecuteItemAction(EItemActionType(3));
        return;
    }
    void ExecuteItemAction(const EItemActionType ActionType)
    {
        TEUIModelRef<FM_ItemData> local_2 = this.GetItemData();
        ::ItemActionUtils::ExecuteActionFromUI(this.GetItemData().opArrow().GetConfig(), ::FItemActionSource::InvokeFromInventory(this.GetContext()));
        return;
    }
    void BuildItemData()
    {
        int local_11;
        if (this.GetData().ItemData.IsValid())
        {
            this.SetItemData(this.GetData().ItemData);
            return;
        }
        if (!(this.GetData().ItemConfig))
        {
            this.SetItemData(TEUIModelRef<FM_ItemData>());
            return;
        }
        FM_ItemData& local_8 = ::FM_ItemData::Create(this.GetContext().Manager);
        local_8.SetConfig(this.GetData().ItemConfig);
        if (this.GetData().DisplayNum > 0)
        {
            local_11 = this.GetData().DisplayNum;
        }
        else
        {
            local_11 = 1;
        }
        local_8.SetNum(local_11);
        this.SetItemData(TEUIModelRef<FM_ItemData>(local_8));
        return;
    }
    const FItemTipData GetData() const property
    {
        const FItemTipData __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FItemTipData GetModify_Data() property
    {
        FItemTipData __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetData(const FItemTipData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    TEUIModelRef<FM_ItemData> GetItemData() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ItemData;
    }
    void SetItemData(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ItemData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemData = __Value;
        return;
    }
    TEUIModelRef<FVM_Item> GetItem() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Item;
    }
    void SetItem(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_Item;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Item = __Value;
        return;
    }
    TEUIModelRef<FVM_DisplayItem> GetDisplayItem() const property
    {
        this.TrackPropertyRead(3);
        return this.m_DisplayItem;
    }
    void SetDisplayItem(const TEUIModelRef<FVM_DisplayItem> &inout __Value) property
    {
        TEUIModelRef<FVM_DisplayItem> local_2;
        local_2 = this.m_DisplayItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DisplayItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItem> GetCommonItem() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CommonItem;
    }
    void SetCommonItem(const TEUIModelRef<FVM_CommonItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItem> local_2;
        local_2 = this.m_CommonItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CommonItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItemTipDisplayAdapter> GetTipDisplay() const property
    {
        this.TrackPropertyRead(5);
        return this.m_TipDisplay;
    }
    void SetTipDisplay(const TEUIModelRef<FVM_CommonItemTipDisplayAdapter> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItemTipDisplayAdapter> local_2;
        local_2 = this.m_TipDisplay;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TipDisplay = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItemTipOperationList> GetOperationList() const property
    {
        this.TrackPropertyRead(6);
        return this.m_OperationList;
    }
    void SetOperationList(const TEUIModelRef<FVM_CommonItemTipOperationList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItemTipOperationList> local_2;
        local_2 = this.m_OperationList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_OperationList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_InputAction>> GetTipActions() const property
    {
        const TArray<TEUIModelRef<FVM_InputAction>> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InputAction>> GetModify_TipActions() property
    {
        TArray<TEUIModelRef<FVM_InputAction>> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetTipActions(const TArray<TEUIModelRef<FVM_InputAction>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_TipActions = __Value;
        return;
    }
    const FSimpleModelEvent GetMoreActionPreExecute() const property
    {
        const FSimpleModelEvent __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FSimpleModelEvent GetModify_MoreActionPreExecute() property
    {
        FSimpleModelEvent __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetMoreActionPreExecute(const FSimpleModelEvent &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        return;
    }
    bool GetbPinned() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bPinned;
    }
    void SetbPinned(const bool __Value) property
    {
        if (!(this.m_bPinned) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bPinned = __Value;
        return;
    }
}

struct FVM_CommonItemTipHost : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FItemTipData m_HoveredData;
    UPROPERTY()
    FItemTipData m_PinnedData;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemTip> m_DisplayTip;
    UPROPERTY()
    bool m_bPinned;
    UPROPERTY()
    int m_DisplayTipActionFingerprint;

    FVM_CommonItemTipHost()
    {
        this.m_bPinned = false;
        this.m_DisplayTipActionFingerprint = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonItemTipHost(const FVM_CommonItemTipHost &inout Other)
    {
        this.m_bPinned = false;
        this.m_DisplayTipActionFingerprint = 0;
        this.m_DisplayTip = Other.m_DisplayTip;
        this.m_bPinned = Other.m_bPinned;
        this.m_DisplayTipActionFingerprint = int(Other.m_DisplayTipActionFingerprint);
        return;
    }
    FVM_CommonItemTipHost opAssign(const FVM_CommonItemTipHost &inout Other)
    {
        FVM_CommonItemTipHost __r;
        this.m_DisplayTip = Other.m_DisplayTip;
        this.m_bPinned = Other.m_bPinned;
        this.m_DisplayTipActionFingerprint = int(Other.m_DisplayTipActionFingerprint);
        return __r;
    }
    void RefreshDisplayTipActionFingerprint()
    {
        int local_1 = 0;
        if (this.GetDisplayTip().IsValid())
        {
            int local_8;
            TEUIModelRef<FVM_CommonItemTip> local_4 = this.GetDisplayTip();
            for (auto& local_22 : local_8)
            {
                if (local_22.IsValid() && !(GetInputAction().IsNull()))
                {
                    ++local_1;
                }
            }
        }
        this.SetDisplayTipActionFingerprint(local_1);
        return;
    }
    void ShowHover(const FItemTipData &inout Data)
    {
        if (!(Data.IsValid()) || this.GetbPinned())
        {
            return;
        }
        this.SetHoveredData(Data);
        if (this.GetDisplayTip().IsValid())
        {
            this.RebuildDisplayTip(Data, false);
        }
        return;
    }
    void EnsureDisplayTip()
    {
        if (this.GetDisplayTip().IsValid())
        {
            return;
        }
        FItemTipData local_38;
        if (this.GetbPinned())
        {
        }
        this.RebuildDisplayTip(local_38, this.GetbPinned());
        return;
    }
    void Pin(const FItemTipData &inout Data)
    {
        if (!(Data.IsValid()) || !(Data.bCollectOperations))
        {
            return;
        }
        this.SetPinnedData(Data);
        this.RebuildDisplayTip(Data, true);
        return;
    }
    void PinAndOpenOperations()
    {
        FItemTipData local_34;
        if (!(local_34.IsValid()))
        {
        }
        if (!(local_34.IsValid()))
        {
            return;
        }
        local_34.bCollectOperations = true;
        this.Pin(local_34);
        bool local_69 = this.GetDisplayTip().IsValid();
        if (!(local_69))
        {
            local_69 = false;
        }
        else
        {
            TEUIModelRef<FVM_CommonItemTipOperationList> local_74;
            TEUIModelRef<FVM_CommonItemTip> local_72 = this.GetDisplayTip();
            local_74.GetOperationList();
            local_69 = local_74.IsValid();
        }
        if (local_69)
        {
            TEUIModelRef<FVM_CommonItemTipOperationList> local_74;
            bool local_69_2 = true;
            TEUIModelRef<FVM_CommonItemTip> local_72_2 = this.GetDisplayTip();
            local_74.GetOperationList();
            local_69_2.SetShowList();
            TEUIModelRef<FVM_CommonItemTip> local_72_3 = this.GetDisplayTip();
            RefreshTipActionsForOperationList();
            this.RefreshDisplayTipActionFingerprint();
        }
        return;
    }
    void Unpin()
    {
        if (!(this.GetbPinned()))
        {
            return;
        }
        bool local_1 = this.GetDisplayTip().IsValid();
        FItemTipData local_38;
        this.SetPinnedData(local_38);
        this.SetbPinned(false);
        if (local_1)
        {
            this.RebuildDisplayTip(this.GetHoveredData(), false);
        }
        return;
    }
    void RebuildDisplayTip(const FItemTipData &inout Data, const bool bInPinned)
    {
        this.SetbPinned(bInPinned);
        if (!(Data.IsValid()))
        {
            this.SetDisplayTip(TEUIModelRef<FVM_CommonItemTip>());
            return;
        }
        FVM_CommonItemTip& local_8 = ::FVM_CommonItemTip::Create(this.GetContext().Manager, Data);
        local_8.SetbPinned(bInPinned);
        this.SetDisplayTip(TEUIModelRef<FVM_CommonItemTip>(local_8));
        return;
    }
    const FItemTipData GetHoveredData() const property
    {
        const FItemTipData __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FItemTipData GetModify_HoveredData() property
    {
        FItemTipData __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetHoveredData(const FItemTipData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FItemTipData GetPinnedData() const property
    {
        const FItemTipData __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FItemTipData GetModify_PinnedData() property
    {
        FItemTipData __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPinnedData(const FItemTipData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    TEUIModelRef<FVM_CommonItemTip> GetDisplayTip() const property
    {
        this.TrackPropertyRead(2);
        return this.m_DisplayTip;
    }
    void SetDisplayTip(const TEUIModelRef<FVM_CommonItemTip> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItemTip> local_2;
        local_2 = this.m_DisplayTip;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayTip = __Value;
        return;
    }
    bool GetbPinned() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bPinned;
    }
    void SetbPinned(const bool __Value) property
    {
        if (!(this.m_bPinned) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bPinned = __Value;
        return;
    }
    int GetDisplayTipActionFingerprint() const property
    {
        this.TrackPropertyRead(4);
        return this.m_DisplayTipActionFingerprint;
    }
    void SetDisplayTipActionFingerprint(const int __Value) property
    {
        if (this.m_DisplayTipActionFingerprint == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DisplayTipActionFingerprint = __Value;
        return;
    }
}

struct FItemTipHandle
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemTipHost> State;

    FItemTipHandle()
    {
        return;
    }
    FItemTipHandle(const UObject ContextObject, const FItemTipData &inout Data)
    {
        this.Build(ContextObject, Data);
        return;
    }
    void PrepareForDisplay() const
    {
        if (this.IsValid())
        {
            EnsureDisplayTip();
        }
        return;
    }
    void Build(const UObject ContextObject, const FItemTipData &inout Data)
    {
        if (!(Data.IsValid()))
        {
            return;
        }
        FVM_CommonItemTipHost& local_8 = ::FVM_CommonItemTipHost::Create(ContextObject);
        local_8.ShowHover(Data);
        TEUIModelRef<FVM_CommonItemTipHost> local_6 = TEUIModelRef<FVM_CommonItemTipHost>(local_8);
        return;
    }
    FEUIModelContainer GetModels() const
    {
        FEUIModelContainer local_14;
        if (!(this.IsValid()))
        {
            return local_14;
        }
        FEUIModelRef local_18;
        local_18;
        local_14.AddModel(local_18, this);
        if (this.opArrow().GetDisplayTip().IsValid())
        {
            local_14.AddModel(this.opArrow().GetDisplayTip().opImplConv(), false);
            if (this.opArrow().GetDisplayTip().opArrow().GetItem().IsValid())
            {
                local_14.AddModel(this.opArrow().GetDisplayTip().opArrow().GetItem().opImplConv(), false);
            }
            if (this.opArrow().GetDisplayTip().opArrow().GetDisplayItem().IsValid())
            {
                local_14.AddModel(this.opArrow().GetDisplayTip().opArrow().GetDisplayItem().opImplConv(), false);
            }
            if (this.opArrow().GetDisplayTip().opArrow().GetCommonItem().IsValid())
            {
                local_14.AddModel(this.opArrow().GetDisplayTip().opArrow().GetCommonItem().opImplConv(), false);
            }
            if (this.opArrow().GetDisplayTip().opArrow().GetTipDisplay().IsValid())
            {
                local_14.AddModel(this.opArrow().GetDisplayTip().opArrow().GetTipDisplay().opImplConv(), false);
            }
            if (this.opArrow().GetDisplayTip().opArrow().GetOperationList().IsValid())
            {
                local_14.AddModel(this.opArrow().GetDisplayTip().opArrow().GetOperationList().opImplConv(), false);
            }
        }
        return local_14;
    }
    void PinAndOpenOperations() const
    {
        if (this.IsValid())
        {
            PinAndOpenOperations();
        }
        return;
    }
    void Unpin() const
    {
        if (this.IsValid())
        {
            Unpin();
        }
        return;
    }
}

struct __GeneratedProperties_FVM_CommonItemTipOperationItem
{
    UPROPERTY()
    FEUIInputAction InputAction;
    UPROPERTY()
    FText OperationName;
    UPROPERTY()
    bool IsExpandable;
    UPROPERTY()
    ESlateVisibility ExpandIconVisibility;
    UPROPERTY()
    bool HasExpandHover;
    UPROPERTY()
    bool ShouldShowExecuteButton;
    UPROPERTY()
    bool HasExecuteAction;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> ExpandHoverWidgetClass;
    UPROPERTY()
    FEUIModelContainer ExpandHoverModels;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemTipOperationItem> Self;


}

struct __GeneratedProperties_FVM_CommonItemTipOperationList
{
    UPROPERTY()
    bool HasAnyOperation;
    UPROPERTY()
    bool ShowList;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> OperationEntryDataList;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemTipOperationList> Self;


}

struct __GeneratedProperties_FVM_CommonItemTip
{
    UPROPERTY()
    bool HasTipActions;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemTip> Self;


}

struct __GeneratedProperties_FVM_CommonItemTipHost
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemTipHost> Self;

    __GeneratedProperties_FVM_CommonItemTipHost()
    {
        return;
    }
}

namespace CommonItemTip
{
void AddAction(FItemTipData &inout Data, const EItemTipActionId ActionId)
{
    if (int(ActionId) == 5)
    {
        Data.bCollectOperations = true;
    }
    Data.ActionRequests.Add(FItemTipActionRequest(EItemTipActionId(ActionId)));
    return;
}
void AddAction(FItemTipData &inout Data, const EItemTipActionId ActionId, const FSimpleModelEvent &inout OnExecute)
{
    if (int(ActionId) == 1)
    {
        CommonItemTip::AddAction(Data, EItemTipActionId(ActionId));
        return;
    }
    if (int(ActionId) == 5)
    {
        Data.bCollectOperations = true;
    }
    Data.ActionRequests.Add(FItemTipActionRequest(EItemTipActionId(ActionId), OnExecute));
    return;
}
FItemTipHandle MakeHandle(const UObject ContextObject, const FItemTipData &inout Data)
{
    FItemTipHandle __r;
    FItemTipHandle local_2 = FItemTipHandle(ContextObject, Data);
    return __r;
}
FEUIModelContainer MakeModels(const UObject ContextObject, const FItemTipData &inout Data)
{
    FItemTipHandle local_4 = CommonItemTip::MakeHandle(ContextObject, Data);
    local_4.PrepareForDisplay();
    return local_4.GetModels();
}
FItemTipData MakeSimpleFromItemData(const TEUIModelRef<FM_ItemData> &inout ItemData)
{
    FItemTipData local_34;
    FItemTipData __r;
    local_34.ItemData = ItemData;
    if (ItemData.IsValid())
    {
        local_34.ItemConfig = ItemData.opArrow().GetConfig();
        local_34.DisplayNum = ItemData.opArrow().GetNum();
    }
    return __r;
}
FItemTipData MakeSimpleFromItemConfig(const TDataObjectPtr<FItemConfig> &inout ItemConfig, const int DisplayNum = 1)
{
    FItemTipData local_34;
    FItemTipData __r;
    local_34.ItemConfig = ItemConfig;
    local_34.DisplayNum = DisplayNum;
    return __r;
}
FItemTipData MakeSimpleFromDisplayData(const TEUIModelRef<FM_DisplayItemData> &inout DisplayData)
{
    FItemTipData local_34;
    FItemTipData __r;
    local_34.DisplayData = DisplayData;
    return __r;
}
}
namespace FVM_CommonItemTipOperationItem
{
FVM_CommonItemTipOperationItem& Create(const UObject ContextObject, const UItemOperationConfigBase OperationConfig, const FItemTipData &inout Data, const FEUIModelWeakRef &inout OwningList)
{
    return FVM_CommonItemTipOperationItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), OperationConfig, Data, OwningList);
}
FVM_CommonItemTipOperationItem CreateByManager(const UEUIManagerSubsystem Manager, const UItemOperationConfigBase OperationConfig, const FItemTipData &inout Data, const FEUIModelWeakRef &inout OwningList)
{
    FVM_CommonItemTipOperationItem __r;
    TEUIModelRef<FVM_CommonItemTipOperationItem> local_6 = TEUIModelRef<FVM_CommonItemTipOperationItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonItemTipOperationItem::ModelId, 0, OperationConfig, Data, OwningList));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InputAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OperationName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsExpandable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpandIconVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasExpandHover";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowExecuteButton";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasExecuteAction";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpandHoverWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpandHoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemTipOperationItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonItemTipOperationItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonItemTipOperationItem;
}
FEUIInputAction __UIGetter_InputAction(const FVM_CommonItemTipOperationItem &inout Model)
{
    return Model.GetInputAction();
}
FText __UIGetter_OperationName(const FVM_CommonItemTipOperationItem &inout Model)
{
    return Model.GetOperationName();
}
bool __UIGetter_IsExpandable(const FVM_CommonItemTipOperationItem &inout Model)
{
    return Model.IsExpandable();
}
ESlateVisibility __UIGetter_ExpandIconVisibility(const FVM_CommonItemTipOperationItem &inout Model)
{
    return Model.GetExpandIconVisibility();
}
bool __UIGetter_HasExpandHover(const FVM_CommonItemTipOperationItem &inout Model)
{
    return Model.HasExpandHover();
}
bool __UIGetter_ShouldShowExecuteButton(const FVM_CommonItemTipOperationItem &inout Model)
{
    return Model.ShouldShowExecuteButton();
}
bool __UIGetter_HasExecuteAction(const FVM_CommonItemTipOperationItem &inout Model)
{
    return Model.HasExecuteAction();
}
TSoftClassPtr<UUserWidget> __UIGetter_ExpandHoverWidgetClass(const FVM_CommonItemTipOperationItem &inout Model)
{
    return Model.GetExpandHoverWidgetClass();
}
FEUIModelContainer __UIGetter_ExpandHoverModels(const FVM_CommonItemTipOperationItem &inout Model)
{
    return Model.GetExpandHoverModels();
}
TEUIModelRef<FVM_CommonItemTipOperationItem> __UIGetter_Self(const FVM_CommonItemTipOperationItem &inout Model)
{
    return TEUIModelRef<FVM_CommonItemTipOperationItem>(Model);
}
int __IndexOf_OperationConfig()
{
    return 0;
}
int __IndexOf_Data()
{
    return 1;
}
int __IndexOf_OwningList()
{
    return 2;
}
int __IndexOf_ExpandInfo()
{
    return 3;
}
int __IndexOf_bUseCustomEntry()
{
    return 4;
}
int __IndexOf_CustomOperationName()
{
    return 5;
}
int __IndexOf_CustomInputAction()
{
    return 6;
}
int __IndexOf_CustomExecuteEvent()
{
    return 7;
}
int __IndexOf_bUseGainWayEntry()
{
    return 8;
}
int __IndexOf_GainWayItemConfig()
{
    return 9;
}
int __IndexOf_GainWayIndex()
{
    return 10;
}
int __IndexOf_SharedHoverAnchor()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_CommonItemTipOperationItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonItemTipOperationList
{
FVM_CommonItemTipOperationList& Create(const UObject ContextObject, const FItemTipData &inout Data)
{
    return FVM_CommonItemTipOperationList::CreateByManager(EUIInternal::GetContextManager(ContextObject), Data);
}
FVM_CommonItemTipOperationList CreateByManager(const UEUIManagerSubsystem Manager, const FItemTipData &inout Data)
{
    FVM_CommonItemTipOperationList __r;
    TEUIModelRef<FVM_CommonItemTipOperationList> local_6 = TEUIModelRef<FVM_CommonItemTipOperationList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonItemTipOperationList::ModelId, 0, Data));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "OperationItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonActionEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowList";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAnyOperation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowList";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OperationEntryDataList";
    local_14.TypeName = "TArray<FEUIDynamicWidgetData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemTipOperationList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonItemTipOperationList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonItemTipOperationList;
}
TArray<TEUIModelRef<FVM_CommonActionEntry>> __UIGetter_OperationItems(const FVM_CommonItemTipOperationList &inout Model)
{
    return Model.GetOperationItems();
}
bool __UIGetter_bShowList(const FVM_CommonItemTipOperationList &inout Model)
{
    return Model.GetbShowList();
}
bool __UIGetter_HasAnyOperation(const FVM_CommonItemTipOperationList &inout Model)
{
    return Model.HasAnyOperation();
}
bool __UIGetter_ShowList(const FVM_CommonItemTipOperationList &inout Model)
{
    return Model.GetShowList();
}
TArray<FEUIDynamicWidgetData> __UIGetter_OperationEntryDataList(const FVM_CommonItemTipOperationList &inout Model)
{
    return Model.GetOperationEntryDataList();
}
TEUIModelRef<FVM_CommonItemTipOperationList> __UIGetter_Self(const FVM_CommonItemTipOperationList &inout Model)
{
    return TEUIModelRef<FVM_CommonItemTipOperationList>(Model);
}
int __IndexOf_Data()
{
    return 0;
}
int __IndexOf_OperationItems()
{
    return 1;
}
int __IndexOf_OperationPayloads()
{
    return 2;
}
int __IndexOf_bShowList()
{
    return 3;
}
int __IndexOf_SharedHoverAnchor()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_CommonItemTipOperationList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonItemTip
{
FVM_CommonItemTip& Create(const UObject ContextObject, const FItemTipData &inout Data)
{
    return FVM_CommonItemTip::CreateByManager(EUIInternal::GetContextManager(ContextObject), Data);
}
FVM_CommonItemTip CreateByManager(const UEUIManagerSubsystem Manager, const FItemTipData &inout Data)
{
    FVM_CommonItemTip __r;
    TEUIModelRef<FVM_CommonItemTip> local_6 = TEUIModelRef<FVM_CommonItemTip>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonItemTip::ModelId, 0, Data));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemData";
    local_14.TypeName = "TEUIModelRef<FM_ItemData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Item";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayItem";
    local_14.TypeName = "TEUIModelRef<FVM_DisplayItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommonItem";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipDisplay";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemTipDisplayAdapter>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OperationList";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemTipOperationList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipActions";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_InputAction>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bPinned";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasTipActions";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemTip>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonItemTip;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshTipActionsForOperationList";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonItemTip;
}
TEUIModelRef<FM_ItemData> __UIGetter_ItemData(const FVM_CommonItemTip &inout Model)
{
    return Model.GetItemData();
}
TEUIModelRef<FVM_Item> __UIGetter_Item(const FVM_CommonItemTip &inout Model)
{
    return Model.GetItem();
}
TEUIModelRef<FVM_DisplayItem> __UIGetter_DisplayItem(const FVM_CommonItemTip &inout Model)
{
    return Model.GetDisplayItem();
}
TEUIModelRef<FVM_CommonItem> __UIGetter_CommonItem(const FVM_CommonItemTip &inout Model)
{
    return Model.GetCommonItem();
}
TEUIModelRef<FVM_CommonItemTipDisplayAdapter> __UIGetter_TipDisplay(const FVM_CommonItemTip &inout Model)
{
    return Model.GetTipDisplay();
}
TEUIModelRef<FVM_CommonItemTipOperationList> __UIGetter_OperationList(const FVM_CommonItemTip &inout Model)
{
    return Model.GetOperationList();
}
TArray<TEUIModelRef<FVM_InputAction>> __UIGetter_TipActions(const FVM_CommonItemTip &inout Model)
{
    return Model.GetTipActions();
}
bool __UIGetter_bPinned(const FVM_CommonItemTip &inout Model)
{
    return Model.GetbPinned();
}
bool __UIGetter_HasTipActions(const FVM_CommonItemTip &inout Model)
{
    return Model.HasTipActions();
}
TEUIModelRef<FVM_CommonItemTip> __UIGetter_Self(const FVM_CommonItemTip &inout Model)
{
    return TEUIModelRef<FVM_CommonItemTip>(Model);
}
int __IndexOf_Data()
{
    return 0;
}
int __IndexOf_ItemData()
{
    return 1;
}
int __IndexOf_Item()
{
    return 2;
}
int __IndexOf_DisplayItem()
{
    return 3;
}
int __IndexOf_CommonItem()
{
    return 4;
}
int __IndexOf_TipDisplay()
{
    return 5;
}
int __IndexOf_OperationList()
{
    return 6;
}
int __IndexOf_TipActions()
{
    return 7;
}
int __IndexOf_MoreActionPreExecute()
{
    return 8;
}
int __IndexOf_bPinned()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_CommonItemTip
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonItemTipHost
{
FVM_CommonItemTipHost& Create(const UObject ContextObject)
{
    return FVM_CommonItemTipHost::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonItemTipHost CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonItemTipHost __r;
    TEUIModelRef<FVM_CommonItemTipHost> local_6 = TEUIModelRef<FVM_CommonItemTipHost>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonItemTipHost::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayTip";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemTip>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bPinned";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayTipActionFingerprint";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemTipHost>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonItemTipHost;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshDisplayTipActionFingerprint";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonItemTipHost;
}
TEUIModelRef<FVM_CommonItemTip> __UIGetter_DisplayTip(const FVM_CommonItemTipHost &inout Model)
{
    return Model.GetDisplayTip();
}
bool __UIGetter_bPinned(const FVM_CommonItemTipHost &inout Model)
{
    return Model.GetbPinned();
}
int __UIGetter_DisplayTipActionFingerprint(const FVM_CommonItemTipHost &inout Model)
{
    return Model.GetDisplayTipActionFingerprint();
}
TEUIModelRef<FVM_CommonItemTipHost> __UIGetter_Self(const FVM_CommonItemTipHost &inout Model)
{
    return TEUIModelRef<FVM_CommonItemTipHost>(Model);
}
int __IndexOf_HoveredData()
{
    return 0;
}
int __IndexOf_PinnedData()
{
    return 1;
}
int __IndexOf_DisplayTip()
{
    return 2;
}
int __IndexOf_bPinned()
{
    return 3;
}
int __IndexOf_DisplayTipActionFingerprint()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_CommonItemTipHost
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
