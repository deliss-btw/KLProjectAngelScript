
enum EDialogueScope
{
    Personal,
    Team,
    Global,
}

enum EDialogueType
{
    Simple,
    Ambient,
}


struct FDialogueConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EDialogueType DialogueType;
    UPROPERTY()
    EDialogueScope DialogueScope;
    UPROPERTY()
    int DialoguePriority = 0;
    UPROPERTY()
    FDataObjectPtr m_InteractTargetNPC;
    UPROPERTY()
    TObjectPtr<UDialogueGraphAsset> DialogueData;
    UPROPERTY()
    FDataObjectPtr m_LevelInfo;


    const TDataObjectPtr<FNPCMainConfig> GetInteractTargetNPC() const property
    {
        const TDataObjectPtr<FNPCMainConfig> __r;
        return __r;
    }
    void SetInteractTargetNPC(const TDataObjectPtr<FNPCMainConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FNPCMainConfig>> local_2;
        this.m_InteractTargetNPC = local_2;
        return;
    }
    TDataObjectPtr<FLevelInfoConfig> GetLevelInfo() const property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        return __r;
    }
    void SetLevelInfo(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FLevelInfoConfig>> local_2;
        this.m_LevelInfo = local_2;
        return;
    }
}

struct FSimpleDialogueConfig : FDialogueConfig
{
    FDialogueConfig _base_FDialogueConfig;

    default DialogueType = EDialogueType(0);

    FSimpleDialogueConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FDailyDialogueConfig : FDialogueConfig
{
    FDialogueConfig _base_FDialogueConfig;

    default DialogueType = EDialogueType(0);
    default DialogueScope = EDialogueScope(2);

    FDailyDialogueConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FAmbientDialogueConfig : FDialogueConfig
{
    FDialogueConfig _base_FDialogueConfig;
    UPROPERTY()
    EDialogueScope BroadcastScope;

    default DialogueType = EDialogueType(1);
    default DialogueScope = EDialogueScope(2);

    FAmbientDialogueConfig()
    {
        super();
        this.BroadcastScope = EDialogueScope(0);
        this.__InitDefaults();
        return;
    }
}

struct FDialogueLineConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FDataObjectPtr m_SpeakerNPC;
    UPROPERTY()
    FText LineText;
    UPROPERTY()
    FDataObjectPtr m_VoiceConfig;

    FDialogueLineConfig()
    {
        return;
    }
    FText GetSpeakerName() const
    {
        if (this.GetSpeakerNPC().IsSet())
        {
            return ::DialogueUtils::GetNPCDisplayName(this.GetSpeakerNPC());
        }
        return FText();
    }
    FString ToString() const
    {
        return FString().Append(this.GetSpeakerName()).Append(": ").Append(this.LineText);
    }
    const TDataObjectPtr<FNPCMainConfig> GetSpeakerNPC() const property
    {
        const TDataObjectPtr<FNPCMainConfig> __r;
        return __r;
    }
    void SetSpeakerNPC(const TDataObjectPtr<FNPCMainConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FNPCMainConfig>> local_2;
        this.m_SpeakerNPC = local_2;
        return;
    }
    const TDataObjectPtr<FDialogueVoiceConfig> GetVoiceConfig() const property
    {
        const TDataObjectPtr<FDialogueVoiceConfig> __r;
        return __r;
    }
    void SetVoiceConfig(const TDataObjectPtr<FDialogueVoiceConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDialogueVoiceConfig>> local_2;
        this.m_VoiceConfig = local_2;
        return;
    }
}

struct FNarrationSubtitleEntry
{
    UPROPERTY()
    TDataObjectPtr<FDialogueLineConfig> DialogueLine;
    UPROPERTY()
    float32 SubtitleDuration = 3.0f;


}

struct FNarrationDialogueConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EDialogueScope BroadcastScope = EDialogueScope(0);
    UPROPERTY()
    TArray<FNarrationSubtitleEntry> NarrationEntries;


}

struct FDialogueOptionStyleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FSoftBrush OptionIcon;
    UPROPERTY()
    FLinearColor OptionBgColor = FLinearColor(0.0f, 0.0f, 0.0f, 0.5f);
    UPROPERTY()
    bool bIsEscapeOption;
    UPROPERTY()
    bool bNeedConfirm;
    UPROPERTY()
    FText ConfirmTitle;
    UPROPERTY()
    FText ConfirmMessage;
    UPROPERTY()
    FText ConfirmButtonText = FText();
    UPROPERTY()
    FText CancelButtonText = FText();


}

