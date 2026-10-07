

UCLASS(Abstract)
class UWidget_CommonTab : UUserWidget
{
    UPROPERTY()
    UHorizontalBox TabContainer;
    UPROPERTY()
    TArray<FText> TabNames;
    UPROPERTY()
    TSubclassOf<UUserWidget> TabEntryClass;
    UPROPERTY()
    int SelectedTabIndex;
    UPROPERTY()
    FOnTabSelected OnTabSelected;

    UWidget_CommonTab()
    {
        return;
    }
    UFUNCTION()
    void PreConstruct_Implementation(const bool bIsDesignTime)
    {
        UWidget_CommonTabEntry local_12;
        this.TabContainer.ClearChildren();
        int local_1 = 0;
        for (; local_1 < this.TabNames.Num(); )
        {
            local_12 = Cast<UWidget_CommonTabEntry>(this.ConstructWidget(this.TabEntryClass, NAME_None));
            local_12.TabIndex = local_1;
            local_12.OwnerTab = this;
            local_12.TabName = this.TabNames[local_1];
            UHorizontalBoxSlot local_16 = this.TabContainer.AddChildToHorizontalBox(local_12);
            local_16.SetHorizontalAlignment(EHorizontalAlignment(0));
            local_16.SetVerticalAlignment(EVerticalAlignment(2));
            FSlateChildSize local_20;
            local_16.SetSize(local_20);
            local_12.SetIsSelectedInternal((local_1 == this.SelectedTabIndex));
            ++local_1;
        }
        this.OnTabSelected.Broadcast(this.SelectedTabIndex);
        return;
    }
    UFUNCTION()
    void SetSelectedTabIndexOffset(const int Offset)
    {
        this.SetSelectedTabIndex(FMath::WrapIndex((this.SelectedTabIndex + Offset), 0, this.TabNames.Num()));
        return;
    }
    void SetSelectedTabIndex(const int Index)
    {
        if (this.SelectedTabIndex == Index || !(this.TabNames.IsValidIndex(Index)))
        {
            return;
        }
        UWidget_CommonTabEntry local_10 = (Cast<UWidget_CommonTabEntry>(this.TabContainer.GetChildAt(this.SelectedTabIndex)));
        UWidget_CommonTabEntry local_12 = (Cast<UWidget_CommonTabEntry>(this.TabContainer.GetChildAt(Index)));
        local_10.SetIsSelectedInternal(false);
        local_12.SetIsSelectedInternal(true);
        this.SelectedTabIndex = Index;
        this.OnTabSelected.Broadcast(Index);
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonTabEntry : UUserWidget
{
    UPROPERTY()
    UEUIButton TabButton;
    UPROPERTY()
    UWidgetSwitcher TabContent;
    UPROPERTY()
    UWidget SelectBackground;
    UPROPERTY()
    FText TabName;
    UPROPERTY()
    int TabIndex;
    UPROPERTY()
    bool bIsSelected;
    UPROPERTY()
    UWidget_CommonTab OwnerTab;

    UWidget_CommonTabEntry()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.TabButton.OnClicked.AddUFunction(this, n"OnTabButtonClicked");
        return;
    }
    UFUNCTION()
    void SetIsSelectedInternal(const bool bInIsSelected)
    {
        int local_4;
        this.bIsSelected = bInIsSelected;
        bool local_1 = !(bInIsSelected);
        this.TabButton.SetIsEnabled(local_1);
        int local_2 = bInIsSelected ? 1 : 0;
        this.TabContent.SetActiveWidgetIndex(local_2);
        if (bInIsSelected)
        {
            int local_5;
            local_5 = 4;
            local_4 = local_5;
        }
        else
        {
            int local_5;
            local_5 = 1;
            local_4 = local_5;
        }
        this.SelectBackground.SetVisibility(ESlateVisibility(local_4));
        return;
    }
    UFUNCTION()
    void OnTabButtonClicked()
    {
        this.OwnerTab.SetSelectedTabIndex(this.TabIndex);
        return;
    }
}

event void FOnTabSelected(const int32 Index);

