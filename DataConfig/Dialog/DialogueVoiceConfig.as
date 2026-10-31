enum EPlayerGenderType
{
    All,
    Male,
    Female,
}

struct FDialogueVOSource
{
    UPROPERTY()
    FString VOFile;
    UPROPERTY()
    EPlayerGenderType PlayerGender;
    UPROPERTY()
    float32 StartDelay;
    UPROPERTY()
    float32 Duration;

    bool IsSame(const FDialogueVOSource &inout Other) const
    {
        return ((this.VOFile == Other.VOFile) && (int(this.PlayerGender) == int(Other.PlayerGender)) && (this.StartDelay == Other.StartDelay) && (this.Duration == Other.Duration));
    }
}

struct FDialogueVoiceConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FDialogueVOSource> VOSources;

    FDialogueVoiceConfig()
    {
        return;
    }
    float32 GetDurationForLevelSequence() const
    {
        float32 local_1 = 0.0f;
        for (auto& local_18 : this.VOSources)
        {
            local_1 = FMath::Max(local_1, local_18.Duration);
        }
        return local_1;
    }
    bool IsSame(const FDialogueVoiceConfig &inout Other) const
    {
        if (this.VOSources.Num() != Other.VOSources.Num())
        {
            return false;
        }
        int local_4 = 0;
        for (; local_4 < this.VOSources.Num(); ++local_4)
        {
            if (!(this.VOSources[local_4].IsSame(Other.VOSources[local_4])))
            {
                return false;
            }
        }
        return true;
    }
}

