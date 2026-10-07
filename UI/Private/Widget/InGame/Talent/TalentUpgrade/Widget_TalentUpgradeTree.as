
namespace UWidget_TalentUpgradeTree
{
    const int ViewID = 0;

}
class UWidget_TalentUpgradeTree : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentUpgradeFormulaTree> FormulaTree;
    UPROPERTY()
    TArray<FEUIWidgetHolder> ItemHolderList;
    UPROPERTY()
    TMap<uint, UWidget_TalentSkillUpgradeNode> AutoLineNodeWidgetMap;
    FTimerHandle DeferredAutoLineRefreshHandle;
    UPROPERTY()
    UUniformGridPanel TreeGrid;
    UPROPERTY()
    UEUIAutoLineCanvas AutoLineCanvas;
    UPROPERTY()
    TSubclassOf<UWidget_TalentSkillUpgradeNode> NodeItemWidgetClass;
    UPROPERTY()
    bool bUseAutoLineCanvas = true;
    UPROPERTY()
    bool bUseTalentPortChoiceAutoLineGraph = true;
    UPROPERTY()
    bool bAttachTalentAutoLinesAtCenter = true;
    UPROPERTY()
    float32 AutoLineFromExtend = 0.0f;
    UPROPERTY()
    float32 AutoLineToExtend = 0.0f;
    UPROPERTY()
    TArray<FTalentUpgradeAutoLineRouteOverride> AutoLineRouteOverrides;
    FEUIModelWeakRef __FormulaTree;
    UPROPERTY()
    FGetEUIModelRef FormulaTreeDelegate;


    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.DeferredAutoLineRefreshHandle);
        this.ClearAutoLineCanvas();
        this.ItemHolderList.Empty(0);
        return;
    }
    bool ShouldUseAutoLineCanvas() const
    {
        return (this.bUseAutoLineCanvas && ((this.AutoLineCanvas != nullptr)));
    }
    void ClearAutoLineCanvas()
    {
        if (this.AutoLineCanvas != nullptr)
        {
            this.AutoLineCanvas.ClearAutoLineGraph();
        }
        this.AutoLineNodeWidgetMap.Reset();
        return;
    }
    void ApplyAutoLineOverlaySlotLayout(const UWidget Widget, const EHorizontalAlignment HAlign, const EVerticalAlignment VAlign, const FMargin &inout SlotPadding)
    {
        UPanelSlot local_6;
        UOverlaySlot local_10;
        if (Widget != nullptr)
        {
            local_6 = Widget.Slot;
            local_10 = (Cast<UOverlaySlot>(local_6));
        }
        else
        {
        }
        UOverlaySlot local_2 = local_10;
        if (local_2 == nullptr)
        {
            return;
        }
        local_2.SetHorizontalAlignment(EHorizontalAlignment(HAlign));
        local_2.SetVerticalAlignment(EVerticalAlignment(VAlign));
        local_2.SetPadding(SlotPadding);
        return;
    }
    void EnsureAutoLineLayerOrder()
    {
        UWidget local_28;
        int local_36;
        int local_37;
        int local_39;
        int local_40;
        if (this.AutoLineCanvas == nullptr || ((this.TreeGrid == nullptr)))
        {
            return;
        }
        UPanelWidget local_10 = this.AutoLineCanvas.GetParent();
        UOverlay local_14 = (Cast<UOverlay>(local_10));
        if (local_14 == nullptr || (this.TreeGrid.GetParent() != local_10))
        {
            return;
        }
        int local_17 = -1;
        int local_19 = -1;
        int local_20 = 0;
        for (; local_20 < local_10.GetChildrenCount(); ++local_20)
        {
            UWidget local_24 = local_10.GetChildAt(local_20);
            local_28 = this.AutoLineCanvas;
            if (local_24 == local_28)
            {
                local_17 = local_20;
                continue;
            }
            local_28 = this.TreeGrid;
            if (local_24 == local_28)
            {
                local_19 = local_20;
            }
        }
        if (local_17 >= 0 && (local_19 >= 0) && (local_17 < local_19))
        {
            return;
        }
        UPanelSlot local_32 = this.AutoLineCanvas.Slot;
        UOverlaySlot local_30 = (Cast<UOverlaySlot>(local_32));
        if (local_30 != nullptr)
        {
            local_37 = int(local_30.GetHorizontalAlignment());
        }
        else
        {
            local_36 = 0;
            local_37 = local_36;
        }
        if (local_30 != nullptr)
        {
            local_40 = int(local_30.GetVerticalAlignment());
        }
        else
        {
            local_39 = 0;
            local_40 = local_39;
        }
        FMargin local_57;
        if (local_30 != nullptr)
        {
            local_57 = local_30.GetPadding();
        }
        else
        {
            local_57 = FMargin(0.0f);
        }
        UPanelSlot local_62 = this.TreeGrid.Slot;
        UOverlaySlot local_60 = (Cast<UOverlaySlot>(local_62));
        if (local_60 != nullptr)
        {
            local_36 = int(local_60.GetHorizontalAlignment());
        }
        else
        {
            local_36 = 0;
        }
        if (local_60 != nullptr)
        {
            local_39 = int(local_60.GetVerticalAlignment());
        }
        else
        {
            local_39 = 0;
        }
        FMargin local_48;
        if (local_60 != nullptr)
        {
            local_48 = local_60.GetPadding();
        }
        else
        {
            local_48 = FMargin(0.0f);
        }
        if (!(local_10.RemoveChild(this.AutoLineCanvas)))
        {
            return;
        }
        if (!(local_10.RemoveChild(this.TreeGrid)))
        {
            local_10.AddChild(this.AutoLineCanvas);
            this.ApplyAutoLineOverlaySlotLayout(this.AutoLineCanvas, EHorizontalAlignment(local_37), EVerticalAlignment(local_40), local_57);
            return;
        }
        local_10.AddChild(this.AutoLineCanvas);
        this.ApplyAutoLineOverlaySlotLayout(this.AutoLineCanvas, EHorizontalAlignment(local_37), EVerticalAlignment(local_40), local_57);
        local_10.AddChild(this.TreeGrid);
        this.ApplyAutoLineOverlaySlotLayout(this.TreeGrid, EHorizontalAlignment(local_36), EVerticalAlignment(local_39), local_48);
        return;
    }
    void UpdateNodeLineStyle(const TEUIModelWeakRef<FM_TalentNode> &inout NodeM)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void RequestRefreshAutoLineGraph()
    {
        if (!(this.ShouldUseAutoLineCanvas()))
        {
            return;
        }
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.DeferredAutoLineRefreshHandle);
        this.DeferredAutoLineRefreshHandle = System::SetTimer(this, n"RefreshAutoLineGraph", 0.001f, false, false, 0.0f, 0.0f);
        return;
    }
    UFUNCTION()
    void RefreshAutoLineGraph()
    {
        System::ClearAndInvalidateTimerHandle(__GetWorldContext(), this.DeferredAutoLineRefreshHandle);
        if (!(this.ShouldUseAutoLineCanvas()) || !(this.FormulaTree.IsValid()))
        {
            return;
        }
        this.EnsureAutoLineLayerOrder();
        ::TalentUpgradeRuntimeAutoLineBuilder::BuildAndApplyGraph(this, this.AutoLineCanvas, GetNodeList(), this.AutoLineNodeWidgetMap, this.AutoLineFromExtend, this.AutoLineToExtend, this.AutoLineRouteOverrides, this.bUseTalentPortChoiceAutoLineGraph, this.bAttachTalentAutoLinesAtCenter);
        return;
    }
    UFUNCTION()
    void HandleFormulaTreeNodeListChanged(const TArray<TEUIModelWeakRef<FM_TalentNode>> &inout NodeList)
    {
        UWidget_TalentSkillUpgradeNode local_124;
        this.ItemHolderList.Empty(0);
        this.AutoLineNodeWidgetMap.Reset();
        this.TreeGrid.ClearChildren();
        if (this.AutoLineCanvas != nullptr)
        {
            this.AutoLineCanvas.ClearAutoLineGraph();
        }
        int local_6 = 2147483647;
        TEUIModelWeakRef<FVM_TalentUpgradeItem> local_8;
        int local_9 = 2147483647;
        auto local_16 = NodeList.Iterator();
        for (; local_16.CanProceed;)
        {
            const TEUIModelWeakRef<FM_TalentNode>& local_24 = local_16.Proceed();
            if (local_24.IsValid() && CheckValid())
            {
                local_9 = FMath::Min(local_9, GetConfig().Column);
            }
        }
        if (local_9 == 2147483647)
        {
            local_9 = 1;
        }
        if (this.NodeItemWidgetClass.IsValid())
        {
            int local_28 = NodeList.Num() - 1;
            for (; local_28 >= 0; --local_28)
            {
                const TEUIModelWeakRef<FM_TalentNode>& local_24_2 = NodeList[local_28];
                if (local_24_2.IsValid() && CheckValid())
                {
                    FTalentTreeNode local_54;
                    int local_82 = FMath::Clamp((local_54.Row - 1), 0, 2147483647);
                    int local_83 = FMath::Clamp(local_54.Column - local_9, 0, 2147483647);
                    TArray<TEUIModelRef<FVM_TalentUpgradeItem>> local_90;
                    if (HasChoice())
                    {
                        int local_91 = 0;
                        for (; local_91 < GetChoiceBaseIds().Num(); )
                        {
                            FVM_TalentUpgradeItem& local_94 = ::FVM_TalentUpgradeItem::Create(this, local_24_2, local_91);
                            local_94.SetOwnerFormulaTreeWidget(this);
                            local_90.Add(TEUIModelRef<FVM_TalentUpgradeItem>(local_94));
                            ++local_91;
                        }
                    }
                    else
                    {
                        FVM_TalentUpgradeItem& local_94_2 = ::FVM_TalentUpgradeItem::Create(this, local_24_2, 0);
                        local_94_2.SetOwnerFormulaTreeWidget(this);
                        local_90.Add(TEUIModelRef<FVM_TalentUpgradeItem>(local_94_2));
                    }
                    TEUIModelRef<FVM_TalentUpgradeNode> local_98 = TEUIModelRef<FVM_TalentUpgradeNode>(::FVM_TalentUpgradeNode::Create(this, local_90));
                    HasChoice().SetbIsChoice();
                    TEUIModelWeakRef<FM_TalentNode> local_104;
                    TEUIModelWeakRef<FVM_TalentUpgradeNode> local_102;
                    GetModify_ItemNodeMap().Add(local_104, local_102);
                    FEUIWidgetRef local_122 = FEUIWidget::CreateWidget(this.GetOwningLocalPlayer(), TSoftClassPtr<UEUIUserWidget>(this.NodeItemWidgetClass), FEUIModelRef());
                    FEUIWidgetHolder local_106 = local_122;
                    local_124 = Cast<UWidget_TalentSkillUpgradeNode>(local_106.RequireWidget());
                    if (local_124 != nullptr)
                    {
                        this.ItemHolderList.Add(local_106);
                        this.AutoLineNodeWidgetMap.Add(GetDataId(), local_124);
                        UUniformGridSlot local_132 = this.TreeGrid.AddChildToUniformGrid(local_124, local_82, local_83);
                        if (local_132 != nullptr)
                        {
                            local_132.SetHorizontalAlignment(EHorizontalAlignment(2));
                            local_132.SetVerticalAlignment(EVerticalAlignment(2));
                        }
                    }
                    if (local_82 < local_6)
                    {
                        local_6 = local_82;
                        TEUIModelWeakRef<FVM_TalentUpgradeItem> local_138;
                        local_8 = local_138;
                    }
                }
            }
        }
        this.RefreshAutoLineGraph();
        FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
        FMsg_TalentTreeUpdateFinish local_140;
        local_140.TreeIndex = GetIndex();
        local_140.FirstItemNodeM = local_8;
        TEUIModelWeakRef<FVM_TalentUpgradeFormulaTree> local_146;
        local_140.FormulaTreeVM = local_146;
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TalentUpgradeFormulaTree& local_6;
        TEUIModelRef<FVM_TalentUpgradeFormulaTree> local_2 = this.FormulaTree.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.FormulaTree.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TalentUpgradeFormulaTree::__IndexOf_NodeList());
                    }
                    if (local_6)
                    {
                        this.HandleFormulaTreeNodeListChanged(local_6.GetNodeList());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: HandleFormulaTreeNodeListChanged");
            }
            return;
        }
        this.__FormulaTree = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.FormulaTree.Initialize(this, FName("VM_TalentUpgradeFormulaTree"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.FormulaTreeDelegate.IsBound())
        {
            this.FormulaTree.SetRef(this.FormulaTreeDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentUpgradeTree
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleFormulaTreeNodeListChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
