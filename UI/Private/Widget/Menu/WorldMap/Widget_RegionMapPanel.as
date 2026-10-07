
namespace UWidget_RegionMapPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_RegionMapPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RegionMap> RegionMap;
    UPROPERTY()
    UMinimap MinimapWidget;
    FEUIModelWeakRef __RegionMap;
    UPROPERTY()
    FGetEUIModelRef RegionMapDelegate;

    UWidget_RegionMapPanel()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (!(this.RegionMap))
        {
            TDataObjectPtr<FLevelInfoConfig> local_28 = ::FLevelUtils::GetCurrentLevelInfoConfig(this.GetWorld());
            FEUIModelRef local_30;
            this.RegionMap = local_30;
        }
        return;
    }
    UFUNCTION()
    void InitMapScale(const TDataObjectPtr<FMinimapDisplayConfig> &inout MinimapDisplayConfig)
    {
        if (!(MinimapDisplayConfig))
        {
            return;
        }
        this.MinimapWidget.SetMapScale(int(MinimapDisplayConfig.opArrow().WorldMapDefaultMapScale));
        return;
    }
    UFUNCTION()
    void OnSelectedSpotChanged(const FEUIModelContainer &inout SelectedSpot)
    {
        if (SelectedSpot.IsEmpty())
        {
            return;
        }
        TConstRawPtr<FPresentationSpotDisplayModelData> local_8 = FInstancedStruct::GetPtr(SelectedSpot.GetFactoryStruct()).opCall();
        if (local_8)
        {
            if (local_8.opArrow().Spot)
            {
                this.MinimapWidget.SetCenterWorldPosition(local_8.opArrow().Spot.opArrow().GetTransform().GetPosition2D());
            }
        }
        return;
    }
    UFUNCTION()
    void OnSelectedLevelInfoChanged()
    {
        this.NotifyFocusInvalidation();
        return;
    }
    UFUNCTION()
    void RegionMap_OnItemSelected(const FEUIDynamicWidgetData &inout Item) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Item);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void RegionMap_OnMinimapSelectionChanged(const FMinimapIconHandle &inout IconHandle) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(IconHandle);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void RegionMap_OnLevelSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_RegionMap& local_6;
        TEUIModelRef<FVM_RegionMap> local_2 = this.RegionMap.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.RegionMap.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_RegionMap::__IndexOf_MinimapDisplayConfig());
                }
                if (local_6)
                {
                    this.InitMapScale(local_6.GetMinimapDisplayConfig());
                }
                break;
            }
            case 1:
            {
                this.RegionMap.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_RegionMap::__IndexOf_SelectedSpot());
                }
                if (local_6)
                {
                    this.OnSelectedSpotChanged(local_6.GetSelectedSpot());
                }
                break;
            }
            case 2:
            {
                this.RegionMap.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_RegionMap::__IndexOf_SelectedLevelInfo());
                }
                if (local_6)
                {
                    this.OnSelectedLevelInfoChanged();
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
                XError(ELog(17), "Remaining observed model change: InitMapScale");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectedSpotChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectedLevelInfoChanged");
            }
            return;
        }
        this.__RegionMap = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.RegionMap.Initialize(this, FName("VM_RegionMap"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RegionMapDelegate.IsBound())
        {
            this.RegionMap.SetRef(this.RegionMapDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_RegionMapPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("InitMapScale"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedSpotChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedLevelInfoChanged"));
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
