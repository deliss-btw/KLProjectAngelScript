
namespace UWidget_PVX_LeaderboardListEntry
{
    const int ViewID = 0;

}
class UWidget_PVX_LeaderboardListEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_LeaderboardListEntry> Entry;
    UPROPERTY()
    FGetEUIModelRef EntryDelegate;

    UWidget_PVX_LeaderboardListEntry()
    {
        return;
    }
    UFUNCTION()
    FText Entry_PlayerDisplayName() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        FText local_12;
        if (local_2)
        {
            local_12 = local_2.GetPlayerDisplayName();
        }
        else
        {
            local_12 = FText();
        }
        return local_12;
    }
    UFUNCTION()
    FText Entry_PlayerIdText() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        FText local_12;
        if (local_2)
        {
            local_12 = local_2.GetPlayerIdText();
        }
        else
        {
            local_12 = FText();
        }
        return local_12;
    }
    UFUNCTION()
    int Entry_Kills() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        return local_2 ? local_2.GetKills() : 0;
    }
    UFUNCTION()
    int Entry_Deaths() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        return local_2 ? local_2.GetDeaths() : 0;
    }
    UFUNCTION()
    int Entry_Assists() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        return local_2 ? local_2.GetAssists() : 0;
    }
    UFUNCTION()
    FText Entry_KDAText() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        FText local_12 = local_2 ? local_2.GetKDAText() : FText();
        return local_12;
    }
    UFUNCTION()
    int Entry_TeamId() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = local_2.GetTeamId();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    UFUNCTION()
    int Entry_CurrencyAmount() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        return local_2 ? local_2.GetCurrencyAmount() : 0;
    }
    UFUNCTION()
    FSoftBrush Entry_AvatarIcon() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        FSoftBrush local_92;
        if (local_2)
        {
            local_92 = local_2.GetAvatarIcon();
        }
        else
        {
            local_92 = FSoftBrush();
        }
        return local_92;
    }
    UFUNCTION()
    bool Entry_bIsLocalPlayer() const
    {
        FVM_PVX_LeaderboardListEntry& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbIsLocalPlayer();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Entry.Initialize(this, FName("VM_PVX_LeaderboardListEntry"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EntryDelegate.IsBound())
        {
            this.Entry.SetRef(this.EntryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_LeaderboardListEntry
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
