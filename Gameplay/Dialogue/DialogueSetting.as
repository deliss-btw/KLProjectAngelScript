

struct FDialogueArgTextConfig
{
    UPROPERTY()
    bool bNeedCache;
    UPROPERTY()
    EPlayerGenderType PlayerGender;
    UPROPERTY()
    bool bEnableArgText;
    UPROPERTY()
    FArgText ArgText;


}

class UDialogueSettings : UGameplaySettingsBase
{
    UPROPERTY()
    FName DialogueInteractionPointName;
    UPROPERTY()
    float DialogueInterruptDistance = 500.0;
    UPROPERTY()
    float DialogueInterruptDistanceExtra = 200.0;
    UPROPERTY()
    float AmbientDialogueResumeDistanceMin = 300.0;
    UPROPERTY()
    float32 DialogueClickInterval = 0.3f;
    UPROPERTY()
    float32 DialogueSubtitleInterval = 1.0f;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> SimpleDialogueWidget;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> AmbientDialogueWidget;
    UPROPERTY()
    TMap<FString, FDialogueArgTextConfig> DialogueArgTextMap;


}

