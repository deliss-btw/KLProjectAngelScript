
namespace UWidget_TeamInfo
{
    const int ViewID = 0;

}
class UWidget_TeamInfo : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeamInfo> TeamInfo;
    UPROPERTY()
    UTexture2D MiniMapIcon;
    UPROPERTY()
    UImage Image_Emoji;
    UPROPERTY()
    UTextBlock Text_PlayerName;
    UPROPERTY()
    float MessageShowTimer = -1.0;
    float DefaultDialogShowTime = 6.0;
    FEUIModelWeakRef __TeamInfo;
    UPROPERTY()
    FGetEUIModelRef TeamInfoDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        this.Image_Emoji.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if ((this.GetWorld().GetTimeSeconds() - this.MessageShowTimer) > this.DefaultDialogShowTime)
        {
            this.Image_Emoji.SetVisibility(ESlateVisibility(2));
            FVM_TeamInfo local_12;
            local_12.SetEmojiIcon(nullptr);
        }
        return;
    }
    UFUNCTION()
    void ShowEmoji(const UTexture2D EmojiIcon)
    {
        if (EmojiIcon == nullptr)
        {
            return;
        }
        this.Image_Emoji.SetBrushFromTexture(EmojiIcon, false);
        this.Image_Emoji.SetVisibility(ESlateVisibility(0));
        this.MessageShowTimer = this.GetWorld().GetTimeSeconds();
        return;
    }
    UFUNCTION()
    float32 TeamInfo_PlayerHPRatioTest() const
    {
        FVM_TeamInfo& local_2;
        return local_2 ? local_2.GetPlayerHPRatio() : 0.0f;
    }
    UFUNCTION()
    void HandleDeathStateChanged(const bool bNearDeath, const bool bDeath)
    {
        if (bNearDeath)
        {
            this.Text_PlayerName.SetColorAndOpacity(FSlateColor(FLinearColor(0.7f, 0.0f, 0.0f, 1.0f)));
            return;
        }
        if (bDeath)
        {
            this.Text_PlayerName.SetColorAndOpacity(FSlateColor(FLinearColor(0.2f, 0.0f, 0.0f, 1.0f)));
            return;
        }
        this.Text_PlayerName.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 1.0f, 1.0f, 1.0f)));
        return;
    }
    UFUNCTION()
    UTexture2D TeamInfo_PlayerIcon() const
    {
        FVM_TeamInfo& local_2;
        UTexture2D local_8;
        if (local_2)
        {
            local_8 = local_2.GetPlayerIcon();
        }
        else
        {
        }
        return local_8;
    }
    UFUNCTION()
    UTexture2D TeamInfo_NextPlayerIcon() const
    {
        FVM_TeamInfo& local_2;
        UTexture2D local_8;
        if (local_2)
        {
            local_8 = local_2.GetNextPlayerIcon();
        }
        else
        {
        }
        return local_8;
    }
    UFUNCTION()
    UTexture2D TeamInfo_LinkSkillIcon() const
    {
        FVM_TeamInfo& local_2;
        UTexture2D local_8;
        if (local_2)
        {
            local_8 = local_2.GetLinkSkillIcon();
        }
        else
        {
        }
        return local_8;
    }
    UFUNCTION()
    FText TeamInfo_PlayerName() const
    {
        FVM_TeamInfo& local_2;
        FText local_12;
        if (local_2)
        {
            local_12 = local_2.GetPlayerName();
        }
        else
        {
            local_12 = FText();
        }
        return local_12;
    }
    UFUNCTION()
    bool TeamInfo_bOffline() const
    {
        FVM_TeamInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbOffline();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool TeamInfo_bOtherMap() const
    {
        FVM_TeamInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbOtherMap();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool TeamInfo_bNearDeath() const
    {
        FVM_TeamInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbNearDeath();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool TeamInfo_bDeath() const
    {
        FVM_TeamInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbDeath();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    ESlateVisibility TeamInfo_SlateVisibilitybTaunting() const
    {
        FVM_TeamInfo& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.bTauntingAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    float32 TeamInfo_PlayerHPRatio() const
    {
        FVM_TeamInfo& local_2;
        return local_2 ? local_2.GetPlayerHPRatio() : 0.0f;
    }
    UFUNCTION()
    FEUIModelRef TeamInfo_VM_BuffInfo() const
    {
        FVM_TeamInfo& local_2;
        FEUIModelRef local_8;
        if (local_2)
        {
            local_8 = local_2.GetVM_BuffInfo();
        }
        else
        {
            local_8 = FEUIModelRef();
        }
        return local_8;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TeamInfo& local_6;
        TEUIModelRef<FVM_TeamInfo> local_2 = this.TeamInfo.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.TeamInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TeamInfo::__IndexOf_EmojiIcon());
                    }
                    if (local_6)
                    {
                        this.ShowEmoji(local_6.GetEmojiIcon());
                    }
                    this.TeamInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TeamInfo::__IndexOf_bNearDeath());
                        local_6.TrackPropertyRead(::FVM_TeamInfo::__IndexOf_bDeath());
                    }
                    if (local_6)
                    {
                        this.HandleDeathStateChanged(local_6.GetbNearDeath(), local_6.GetbDeath());
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
                XError(ELog(17), "Remaining observed model change: ShowEmoji");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleDeathStateChanged");
            }
            return;
        }
        this.__TeamInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TeamInfo.Initialize(this, FName("VM_TeamInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeamInfoDelegate.IsBound())
        {
            this.TeamInfo.SetRef(this.TeamInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeamInfo
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("ShowEmoji"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleDeathStateChanged"));
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
