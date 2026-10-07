

class UPVP_PlayerListItemData : UObject
{
    UPROPERTY()
    FString PlayerName;
    UPROPERTY()
    bool bReady = false;
    UPROPERTY()
    bool bIsLocal = false;
    UPROPERTY()
    bool bIsHost = false;
    UPROPERTY()
    bool bOccupied = false;
    UPROPERTY()
    bool bIsBot = false;


}

class UWidget_GameEntryPVP_PlayerState : UUserWidget
{
    UPROPERTY()
    UEUITextBlock PlayerNameText;
    UPROPERTY()
    UCheckBox ReadyCheckBox;

    UWidget_GameEntryPVP_PlayerState()
    {
        return;
    }
    void SetData(const UPVP_PlayerListItemData Data)
    {
        if ((Data == nullptr || !(Data.bOccupied)))
        {
            this.SetVisibility(ESlateVisibility(1));
            return;
        }
        this.SetVisibility(ESlateVisibility(0));
        FString local_8 = Data.PlayerName;
        if (Data.bIsBot)
        {
            local_8 = FString().Append("[BOT] ").Append(Data.PlayerName);
        }
        else
        {
            if (Data.bIsHost)
            {
                local_8 = FString().Append("[Host] ").Append(Data.PlayerName);
            }
        }
        this.PlayerNameText.SetText(FText::FromString(local_8));
        FLinearColor local_44;
        if (Data.bIsLocal)
        {
            local_44 = FLinearColor(1.0f, 0.75f, 0.0f, 1.0f);
        }
        else
        {
            FLinearColor local_40;
            if (Data.bIsBot)
            {
                local_40 = FLinearColor(0.5f, 0.8f, 1.0f, 1.0f);
            }
            else
            {
                local_40 = FLinearColor(1.0f, 1.0f, 1.0f, 1.0f);
            }
            local_44 = local_40;
        }
        this.PlayerNameText.SetColorAndOpacity(FSlateColor(local_44));
        this.ReadyCheckBox.SetIsChecked(Data.bReady);
        return;
    }
}

