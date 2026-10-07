
enum EDialogueVoiceType
{
    Voice2D,
    Voice3D,
}


struct FDialogueSubtitleDisplayConfig
{
    UPROPERTY()
    FDialogueSubtitle Subtitle;
    UPROPERTY()
    EDialogueVoiceType VoiceType;
    UPROPERTY()
    bool bHideWhenFinished;
    UPROPERTY()
    bool bKeepDisplayUntilFinish;

    FDialogueSubtitleDisplayConfig()
    {
        this.VoiceType = EDialogueVoiceType(0);
        this.bHideWhenFinished = false;
        this.bKeepDisplayUntilFinish = false;
        return;
    }
    FDialogueSubtitleDisplayConfig(const FDialogueSubtitle &inout InSubtitle, const EDialogueVoiceType InVoiceType = EDialogueVoiceType::Voice2D, const bool InbHideWhenFinished = false, const bool InbKeepDisplayUntilFinish = false)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

class UDialogueSubtitleSubsystem : UScriptWorldSubsystem
{
    bool bIsDisplayingSubtitle = false;
    float32 SubtitleTimer = 0.0f;
    FDialogueSubtitleDisplayConfig CurrentSubtitleDisplayConfig;
    FEUIWidgetRef OpenedDialogueWidgetHandle;
    TMap<int, FECSEntity> SoundIdEntityMap;
    TMap<FECSEntity, int> EntitySoundIdMap;
    bool bIsPlayingNarration = false;
    TArray<FDialogueSubtitle> NarrationSubtitles;
    int NarrationCurrentIndex = -1;
    float32 NarrationSubtitleInterval = 1.0f;
    FName NarrationDialogueName;


    UFUNCTION()
    void Tick_Implementation(const float32 DeltaTime)
    {
        if (this.SubtitleTimer <= 0.0f)
        {
            return;
        }
        this.SubtitleTimer = (this.SubtitleTimer - DeltaTime);
        if (this.SubtitleTimer <= 0.0f)
        {
            this.SubtitleTimer = 0.0f;
            if (this.bIsPlayingNarration)
            {
                this.AdvanceNarrationSubtitle();
                return;
            }
            if (this.bIsDisplayingSubtitle)
            {
                this.bIsDisplayingSubtitle = false;
                if (this.CurrentSubtitleDisplayConfig.bHideWhenFinished)
                {
                    this.HideDialogueWidgetImmediately();
                }
            }
        }
        return;
    }
    void InitAndPreloadDialogueAssets()
    {
        const UDialogueSettings local_2;
        GetGameplaySettings<UDialogueSettings> local_4;
        local_2 = local_4;
        if (local_2.SimpleDialogueWidget.IsPending())
        {
            local_2.SimpleDialogueWidget.LoadAsync(FOnSoftClassLoaded());
        }
        if (local_2.AmbientDialogueWidget.IsPending())
        {
            local_2.AmbientDialogueWidget.LoadAsync(FOnSoftClassLoaded());
        }
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetDialogueWidgetClass(const EDialogueType DialogueType) const
    {
        const UDialogueSettings local_2;
        GetGameplaySettings<UDialogueSettings> local_4;
        local_2 = local_4;
        if (int(DialogueType) == 0)
        {
            return local_2.SimpleDialogueWidget;
        }
        if (int(DialogueType) == 1)
        {
            return local_2.AmbientDialogueWidget;
        }
        return TSoftClassPtr<UEUIUserWidget>(nullptr);
    }
    bool ShowDialogueWidget(const ULocalPlayer LocalPlayer, const EDialogueType DialogueType)
    {
        UClass local_30;
        TSoftClassPtr<UObject> local_20 = this.GetDialogueWidgetClass(EDialogueType(DialogueType));
        if (local_20.IsNull())
        {
            XError(ELog(64), FString().Append("Dialogue widget class is null"));
            return false;
        }
        if (local_20.IsPending())
        {
            XLog(ELog(64), FString().Append("Dialogue widget class is pending, LoadClassAsset_Blocking."));
            local_30 = System::LoadClassAsset_Blocking(local_20);
        }
        else
        {
            local_30 = local_20.Get();
        }
        if ((!((local_30 != nullptr))))
        {
            XError(ELog(64), FString().Append("Dialogue widget class is null"));
            return false;
        }
        if (this.OpenedDialogueWidgetHandle.IsValid())
        {
            if (this.OpenedDialogueWidgetHandle.GetUserWidget().GetClass() == local_30)
            {
                return true;
            }
            XWarning(ELog(64), FString().Append("Dialogue widget already opened, but not the same widget"));
            this.HideDialogueWidgetImmediately();
        }
        this.OpenedDialogueWidgetHandle = FEUIWidget::AddWidgetByClass(LocalPlayer, TSoftClassPtr<UEUIUserWidget>(local_30));
        return this.OpenedDialogueWidgetHandle.IsValid();
    }
    void HideDialogueWidgetImmediately()
    {
        if (this.OpenedDialogueWidgetHandle.IsValid())
        {
            FEUIWidget::RemoveWidget(this.OpenedDialogueWidgetHandle);
        }
        this.StopAllDialogueVoice();
        this.bIsDisplayingSubtitle = false;
        this.SubtitleTimer = 0.0f;
        this.OpenedDialogueWidgetHandle = FEUIWidgetRef();
        return;
    }
    void RequestHideDialogueWidget()
    {
        if ((!(this.bIsDisplayingSubtitle) || !(this.CurrentSubtitleDisplayConfig.bKeepDisplayUntilFinish)))
        {
            this.HideDialogueWidgetImmediately();
            return;
        }
        this.CurrentSubtitleDisplayConfig.bHideWhenFinished = true;
        return;
    }
    void DisplaySubtitle(const FDialogueSubtitleDisplayConfig &inout DisplayConfig)
    {
        if (!(this.OpenedDialogueWidgetHandle.IsValid()))
        {
            XError(ELog(64), FString().Append("Dialogue widget not opened"));
            return;
        }
        this.bIsDisplayingSubtitle = true;
        FDialogueSubtitle local_10;
        this.SubtitleTimer = local_10.GetDuration();
        if (::FASCommonUtils::GetLocalPlayerProxy().IsValid())
        {
            FCE_DialogueUpdateUI local_30;
            FFPTime local_26 = FFPTime(-1);
            local_30.Subtitle = local_10;
            local_30.bUpdateSubtitle = true;
        }
        this.PlayDialogueVoice(local_10.GetEntity(), local_10.GetVOFile(), this.CurrentSubtitleDisplayConfig.VoiceType);
        return;
    }
    void DisplayOptions(const TArray<FDialogueOptionInfo> &inout Options)
    {
        if (!(this.OpenedDialogueWidgetHandle.IsValid()))
        {
            XError(ELog(64), FString().Append("Dialogue widget not opened"));
            return;
        }
        FECSEntity local_12 = ::FASCommonUtils::GetLocalPlayerProxy();
        if (local_12.IsValid())
        {
            FCE_DialogueUpdateUI local_26;
            FFPTime local_22 = FFPTime(-1);
            local_26.Options = Options;
            local_26.bUpdateOptions = true;
        }
        return;
    }
    void ClearOptions()
    {
        FECSEntity local_4 = ::FASCommonUtils::GetLocalPlayerProxy();
        if (local_4.IsValid())
        {
            FFPTime local_16 = FFPTime(-1);
            FCE_DialogueUpdateUI local_20;
            local_20.bUpdateOptions = true;
        }
        return;
    }
    void StopDialogueVoice(const FECSEntity &inout Entity)
    {
        if (this.EntitySoundIdMap.Contains(Entity))
        {
            FGameAudioUtils::StopSound(this.EntitySoundIdMap[Entity], 100);
        }
        return;
    }
    void StopAllDialogueVoice()
    {
        TArray<FECSEntity> local_4;
        this.EntitySoundIdMap.GetKeys(local_4);
        for (auto& local_20 : local_4)
        {
            this.StopDialogueVoice(local_20);
        }
        return;
    }
    int PlayDialogueVoice(const FECSEntity &inout Entity, const FString &inout VOFile, const EDialogueVoiceType VoiceType)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    UFUNCTION()
    void OnDialogueVoiceEnd(const int SoundId)
    {
        if (!(this.SoundIdEntityMap.Contains(SoundId)))
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(this.SoundIdEntityMap[SoundId]);
        if (this.EntitySoundIdMap.Contains(local_6) && (this.EntitySoundIdMap[local_6] == SoundId))
        {
        }
        return;
    }
    void StartNarration(const FName &inout DialogueName, const TArray<FDialogueSubtitle> &inout Subtitles, const float32 SubtitleInterval)
    {
        int local_10 = 0;
        if (Subtitles.IsEmpty())
        {
            return;
        }
        if (this.bIsPlayingNarration)
        {
            this.StopNarrationInternal();
        }
        this.bIsPlayingNarration = true;
        this.NarrationDialogueName = DialogueName;
        this.NarrationSubtitles = Subtitles;
        this.NarrationSubtitleInterval = SubtitleInterval;
        this.NarrationCurrentIndex = -1;
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (!(this.ShowDialogueWidget(local_10.UEPlayerController.GetLocalPlayer(), EDialogueType(1))))
        {
            XError(ELog(64), FString().Append("[Dialogue] StartNarration failed: cannot open dialogue widget for ").Append(DialogueName));
            this.bIsPlayingNarration = false;
            return;
        }
        this.AdvanceNarrationSubtitle();
        return;
    }
    void StopNarration()
    {
        if (!(this.bIsPlayingNarration))
        {
            return;
        }
        this.StopNarrationInternal();
        return;
    }
    bool IsPlayingNarration() const
    {
        return this.bIsPlayingNarration;
    }
    void StopNarrationInternal()
    {
        this.bIsPlayingNarration = false;
        this.NarrationSubtitles.Empty(0);
        this.NarrationCurrentIndex = -1;
        this.SubtitleTimer = 0.0f;
        this.StopAllDialogueVoice();
        this.RequestHideDialogueWidget();
        return;
    }
    void AdvanceNarrationSubtitle()
    {
        ++this.NarrationCurrentIndex;
        if (this.NarrationCurrentIndex >= this.NarrationSubtitles.Num())
        {
            this.StopNarrationInternal();
            return;
        }
        FDialogueSubtitle& local_6 = this.NarrationSubtitles[this.NarrationCurrentIndex];
        this.DisplaySubtitle(FDialogueSubtitleDisplayConfig(local_6, EDialogueVoiceType(0), false, false));
        this.SubtitleTimer = (local_6.GetDuration() + this.NarrationSubtitleInterval);
        return;
    }
}

