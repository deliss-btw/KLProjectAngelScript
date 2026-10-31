class UMovieSceneDialogueSection : UMovieSceneDialogueSectionBase
{
    UPROPERTY()
    TDataObjectPtr<FDialogueLineConfig> DialogueLine;

    UMovieSceneDialogueSection()
    {
        return;
    }
    UFUNCTION()
    FText GetSubtitle_Implementation() const
    {
        if (this.DialogueLine)
        {
            return this.DialogueLine.Get().LineText;
        }
        return FText::FromName(NAME_None);
    }
    UFUNCTION()
    float32 GetDuration_Implementation() const
    {
        float32 local_53;
        float32 local_1 = 0.0f;
        if (this.DialogueLine)
        {
            TDataObjectPtr<FDialogueVoiceConfig> local_28 = this.DialogueLine.Get().GetVoiceConfig();
            if (local_28)
            {
                local_1 = local_28.Get().GetDurationForLevelSequence();
            }
        }
        if (local_1 > 0.0f)
        {
            local_53 = local_1;
        }
        else
        {
            local_53 = 2.0f;
        }
        return local_53;
    }
    UFUNCTION()
    FString GetExternalSourcePath_Implementation(const FECSEntity &inout Entity) const
    {
        return this.GetPreviewExternalSourcePath();
    }
    UFUNCTION()
    void WhenEnter_Implementation(const FECSEntity &inout Entity) const
    {
        return;
    }
    UFUNCTION()
    void WhenExit_Implementation(const FECSEntity &inout Entity) const
    {
        return;
    }
    UFUNCTION()
    FString GetPreviewExternalSourcePath_Implementation(const AActor Actor) const
    {
        return this.GetPreviewExternalSourcePath();
    }
    UFUNCTION()
    FECSEntity GetOwnerEntity_Implementation(const AActor Actor) const
    {
        FECSEntity local_6 = ECS::GetEntity(Actor, false);
        if (!(local_6))
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            Get local_16;
            const FCS_CutSceneViewData& local_18 = local_16.opCall();
            if (local_18)
            {
                TConstRawPtr<FECSEntity> local_22 = local_18.ActorToEntity.Find(TWeakObjectPtr<AActor>(Actor));
                if (local_22)
                {
                    local_6 = local_22.Get();
                }
            }
        }
        return local_6;
    }
    FString GetPreviewExternalSourcePath() const
    {
        if (this.DialogueLine)
        {
            TDataObjectPtr<FDialogueVoiceConfig> local_26 = this.DialogueLine.Get().GetVoiceConfig();
            if (local_26)
            {
                if (local_26.Get().VOSources.Num() > 0)
                {
                    return local_26.Get().VOSources[0].VOFile;
                }
            }
        }
        return "";
    }
}

