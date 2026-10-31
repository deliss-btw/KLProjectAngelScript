namespace UWidget_PVP_TDM_KDAListEntry
{
    const int ViewID = 0;

}
class UWidget_PVP_TDM_KDAListEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVP_TDM_KDAListEntry> Entry;
    UPROPERTY()
    FGetEUIModelRef EntryDelegate;

    UWidget_PVP_TDM_KDAListEntry()
    {
        return;
    }
    UFUNCTION()
    FString Entry_PlayerDisplayName() const
    {
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
        FString local_12;
        if (local_2)
        {
            local_12 = local_2.GetPlayerDisplayName();
        }
        else
        {
            local_12 = FString();
        }
        return local_12;
    }
    UFUNCTION()
    FString Entry_PlayerIdText() const
    {
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
        FString local_12;
        if (local_2)
        {
            local_12 = local_2.GetPlayerIdText();
        }
        else
        {
            local_12 = FString();
        }
        return local_12;
    }
    UFUNCTION()
    int Entry_Kills() const
    {
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
        return local_2 ? local_2.GetKills() : 0;
    }
    UFUNCTION()
    int Entry_Deaths() const
    {
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
        return local_2 ? local_2.GetDeaths() : 0;
    }
    UFUNCTION()
    int Entry_Assists() const
    {
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
        return local_2 ? local_2.GetAssists() : 0;
    }
    UFUNCTION()
    FText Entry_KDAText() const
    {
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
        FText local_12 = local_2 ? local_2.GetKDAText() : FText();
        return local_12;
    }
    UFUNCTION()
    int Entry_TeamId() const
    {
        int local_5;
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
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
    int Entry_DamageDealt() const
    {
        int local_5;
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
        if (local_2)
        {
            local_5 = local_2.GetDamageDealt();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    UFUNCTION()
    int Entry_DamageTaken() const
    {
        int local_5;
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
        if (local_2)
        {
            local_5 = local_2.GetDamageTaken();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    UFUNCTION()
    bool Entry_bIsLocalPlayer() const
    {
        bool local_5;
        FVM_PVP_TDM_KDAListEntry& local_2 = this.Entry.Get();
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
        this.Entry.Initialize(this, FName("VM_PVP_TDM_KDAListEntry"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UWidget_PVP_TDM_KDAListEntry
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_PVP_TDM_KDAListEntry;
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
