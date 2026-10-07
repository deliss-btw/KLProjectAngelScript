
namespace UWidget_CommonMenuList
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonMenuList : UEUIUserWidget
{
    UPROPERTY()
    UVerticalBox VerticalBox;
    UPROPERTY()
    TSubclassOf<UWidget_CommonMenuListEntry> EntryWidgetClass;
    UPROPERTY()
    TArray<FText> EntryTitles;
    UPROPERTY()
    TArray<FRedDotNodeData> RedDotNodes;
    UPROPERTY()
    int SelectedIndex;
    UPROPERTY()
    FOnCommonMenuListEntrySelected OnEntrySelected;
    TArray<FEUIWidgetRef> Entries;

    UWidget_CommonMenuList()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void PreConstruct_Implementation(const bool bIsDesignTime)
    {
        UWidget_CommonMenuListEntry local_12;
        this.VerticalBox.ClearChildren();
        if (bIsDesignTime)
        {
            int local_1 = 0;
            for (; local_1 < this.EntryTitles.Num(); ++local_1)
            {
                local_12 = Cast<UWidget_CommonMenuListEntry>(this.ConstructWidget(this.EntryWidgetClass, NAME_None));
                if (local_12 != nullptr)
                {
                    this.Setup(local_12, local_1, true);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        UWidget_CommonMenuListEntry local_24;
        int local_1 = 0;
        for (; local_1 < this.EntryTitles.Num(); )
        {
            FEUIWidgetRef local_16 = this.CreateChildWidget(TSoftClassPtr<UEUIUserWidget>(this.EntryWidgetClass));
            local_24 = Cast<UWidget_CommonMenuListEntry>(local_16.RequireWidget());
            if (local_24 != nullptr)
            {
                this.Setup(local_24, local_1, false);
            }
            this.Entries.Add(local_16);
            ++local_1;
        }
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        int local_4 = this.Entries.Num() - 1;
        for (; local_4 >= 0; )
        {
            this.Entries[local_4].RemoveFromParent();
            --local_4;
        }
        this.Entries.Reset(0);
        this.VerticalBox.ClearChildren();
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (!(this.EntryTitles.IsEmpty()))
        {
            this.SetSelectedIndex(0);
        }
        return;
    }
    UFUNCTION()
    void SetSelectedIndex(const int Index)
    {
        UWidget_CommonMenuListEntry local_8;
        if (this.SelectedIndex == Index)
        {
            return;
        }
        if (this.EntryTitles.IsValidIndex(this.SelectedIndex))
        {
            local_8 = (Cast<UWidget_CommonMenuListEntry>(this.VerticalBox.GetChildAt(this.SelectedIndex)));
            if (local_8 != nullptr)
            {
                local_8.bSelected = false;
            }
        }
        if (this.EntryTitles.IsValidIndex(Index))
        {
            local_8 = (Cast<UWidget_CommonMenuListEntry>(this.VerticalBox.GetChildAt(Index)));
            if (local_8 != nullptr)
            {
                local_8.bSelected = true;
            }
        }
        this.SelectedIndex = Index;
        if (this.OnEntrySelected.IsBound())
        {
            this.OnEntrySelected.Broadcast(Index);
        }
        return;
    }
    UFUNCTION()
    int GetSelectedIndex() const
    {
        return this.SelectedIndex;
    }
    UFUNCTION()
    FText GetSelectedTitle() const
    {
        if (this.EntryTitles.IsValidIndex(this.SelectedIndex))
        {
            return this.EntryTitles[this.SelectedIndex];
        }
        return FText();
    }
    void Setup(const UWidget_CommonMenuListEntry Entry, const int Index, const bool bIsDesignTime)
    {
        Entry.Index = Index;
        Entry.UpdateTitleText(this.EntryTitles[Index]);
        Entry.ParentList = this;
        UVerticalBoxSlot local_4 = this.VerticalBox.AddChildToVerticalBox(Entry);
        local_4.SetHorizontalAlignment(EHorizontalAlignment(0));
        local_4.SetVerticalAlignment(EVerticalAlignment(0));
        FSlateChildSize local_8;
        local_4.SetSize(local_8);
        if (!(bIsDesignTime))
        {
            if (this.RedDotNodes.IsValidIndex(Index))
            {
                FEUIModelRef local_16;
                Entry.RedDot.GetView().SetViewModel(local_16, n"RedDotVM");
            }
            else
            {
                Entry.RedDot.SetVisibility(ESlateVisibility(1));
            }
        }
        return;
    }
}

event void FOnCommonMenuListEntrySelected(const int32 Index);

namespace UWidget_CommonMenuList
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
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
