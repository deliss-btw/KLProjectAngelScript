
namespace UWidget_ForgeWeaponFormulaTree
{
    const int ViewID = 0;

}
class UWidget_ForgeWeaponFormulaTree : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ForgeWeaponFormulaTree> FormulaTree;
    UPROPERTY()
    TArray<FEUIWidgetHolder> ItemHolderList;
    UPROPERTY()
    TMap<uint, UWidget_ForgeWeaponItem> AutoLineNodeWidgetMap;
    UPROPERTY()
    UUniformGridPanel TreeGrid;
    UPROPERTY()
    UEUIAutoLineCanvas AutoLineCanvas;
    UPROPERTY()
    TSubclassOf<UWidget_ForgeWeaponItem> NodeItemWidgetClass;
    UPROPERTY()
    bool bUseAutoLineCanvas = true;
    UPROPERTY()
    float32 AutoLineSameBranchFromExtend = 0.0f;
    UPROPERTY()
    float32 AutoLineSameBranchToExtend = 0.0f;
    UPROPERTY()
    float32 AutoLineBranchFromExtend = 0.0f;
    UPROPERTY()
    float32 AutoLineBranchToExtend = 0.0f;
    UPROPERTY()
    TArray<FForgeWeaponAutoLineRouteOverride> AutoLineRouteOverrides;
    FEUIModelWeakRef __FormulaTree;
    UPROPERTY()
    FGetEUIModelRef FormulaTreeDelegate;


    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
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
    void UpdateNodeLineStyle(const TEUIModelWeakRef<FM_ForgeNode> &inout NodeM)
    {
        if (!(this.ShouldUseAutoLineCanvas()) || !(NodeM.IsValid()))
        {
            return;
        }
        if (!(this.AutoLineNodeWidgetMap.Contains(GetDataId())))
        {
            return;
        }
        this.AutoLineCanvas.UpdateNodeStyleState(::ForgeWeaponRuntimeAutoLineBuilder::MakeNodeId(), ::ForgeWeaponRuntimeAutoLineBuilder::ResolveNodeStyleState());
        return;
    }
    void RefreshAutoLineGraph()
    {
        if (!(this.ShouldUseAutoLineCanvas()) || !(this.FormulaTree.IsValid()))
        {
            return;
        }
        ::ForgeWeaponRuntimeAutoLineBuilder::BuildAndApplyGraph(this, this.AutoLineCanvas, GetNodeList(), this.AutoLineNodeWidgetMap, this.AutoLineBranchFromExtend, this.AutoLineBranchToExtend, this.AutoLineSameBranchFromExtend, this.AutoLineSameBranchToExtend, this.AutoLineRouteOverrides);
        return;
    }
    UFUNCTION()
    void HandleFormulaTreeNodeListChanged(const TArray<TEUIModelWeakRef<FM_ForgeNode>> &inout NodeList)
    {
        TEUIModelWeakRef<FM_ForgeNode> local_22;
        int local_24 = 0;
        bool local_29;
        UWidget_ForgeWeaponItem local_52;
        this.ItemHolderList.Empty(0);
        this.AutoLineNodeWidgetMap.Reset();
        this.TreeGrid.ClearChildren();
        if (this.AutoLineCanvas != nullptr)
        {
            this.AutoLineCanvas.ClearAutoLineGraph();
        }
        GetModify_ItemNodeMap().Reset();
        int local_6 = 2147483647;
        TEUIModelWeakRef<FVM_ForgeWeaponItem> local_8;
        int local_11 = NodeList.Num() - 1;
        for (; local_11 >= 0; --local_11)
        {
            const TEUIModelWeakRef<FM_ForgeNode>& local_14 = NodeList[local_11];
            if (local_14.IsValid() && CheckValid())
            {
                TEUIModelWeakRef<FVM_WeaponForge> local_26;
                int local_17 = ::ForgeCommonUtil::ConvertForgeNodeLevel2Row(GetConfig().ForgeLv);
                EForgeTreeBranchType local_19 = GetBranchType();
                int local_9 = ::ForgeCommonUtil::ConvertForgeTreeBranchType2Column(GetBranchType());
                local_26.GetWeaponForgeVM();
                if (local_26.IsValid())
                {
                    local_26.GetWeaponForgeVM();
                    local_22.GetCurrentSelectNode();
                    local_29 = (local_22 == local_14.opImplConv());
                }
                else
                {
                    local_29 = false;
                }
                local_24.SetbSelected(local_29);
                GetModify_ItemNodeMap().Add(local_22, TEUIModelWeakRef<FVM_ForgeWeaponItem>(local_24));
                FEUIWidgetRef local_50 = FEUIWidget::CreateWidget(this.GetOwningLocalPlayer(), TSoftClassPtr<UEUIUserWidget>(this.NodeItemWidgetClass), FEUIModelRef(local_24));
                FEUIWidgetHolder local_34 = local_50;
                local_52 = Cast<UWidget_ForgeWeaponItem>(local_34.RequireWidget());
                if (local_52 != nullptr)
                {
                    local_24.SetForgeWeaponItemWidget(local_52);
                    local_24.SetOwnerFormulaTreeWidget(this);
                    this.ItemHolderList.Add(local_34);
                    this.AutoLineNodeWidgetMap.Add(GetDataId(), local_52);
                    UUniformGridSlot local_60 = this.TreeGrid.AddChildToUniformGrid(local_52, local_17, local_9);
                    if (local_60 != nullptr)
                    {
                        local_60.SetHorizontalAlignment(EHorizontalAlignment(2));
                        local_60.SetVerticalAlignment(EVerticalAlignment(2));
                    }
                }
                if ((int(GetBranchType())) == 1 && (local_17 < local_6))
                {
                    local_6 = local_17;
                    local_8 = (TEUIModelWeakRef<FVM_ForgeWeaponItem>(local_24));
                }
            }
        }
        this.RefreshAutoLineGraph();
        FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
        FMsg_ForgeTreeUpdateFinish local_66;
        local_66.TreeIndex = GetIndex();
        TEUIModelWeakRef<FM_ForgeNode> local_74;
        if (local_8.IsValid())
        {
            TEUIModelWeakRef<FM_ForgeNode> local_72;
            local_72.GetNode();
            local_74 = local_72;
        }
        else
        {
            local_74 = local_22;
        }
        local_66.FirstItemNodeM = local_74;
        TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree> local_76;
        local_66.FormulaTreeVM = local_76;
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ForgeWeaponFormulaTree& local_6;
        TEUIModelRef<FVM_ForgeWeaponFormulaTree> local_2 = this.FormulaTree.AsRef();
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
                        local_6.TrackPropertyRead(::FVM_ForgeWeaponFormulaTree::__IndexOf_NodeList());
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
        this.FormulaTree.Initialize(this, FName("VM_ForgeWeaponFormulaTree"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UWidget_ForgeWeaponFormulaTree
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
