namespace __FDialogueConfigFunctions
{
UFUNCTION()
EDialogueType __FDialogueConfig_GetDialogueType(const TDataObjectPtr<FDialogueConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DialogueType' from a null 'FDialogueConfig' DataObject!");
        }
        FDialogueConfig local_66;
        return local_66.DialogueType;
    }
    return DataObject.Get().DialogueType;
}
UFUNCTION()
EDialogueScope __FDialogueConfig_GetDialogueScope(const TDataObjectPtr<FDialogueConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DialogueScope' from a null 'FDialogueConfig' DataObject!");
        }
        FDialogueConfig local_66;
        return local_66.DialogueScope;
    }
    return DataObject.Get().DialogueScope;
}
UFUNCTION()
int __FDialogueConfig_GetDialoguePriority(const TDataObjectPtr<FDialogueConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DialoguePriority' from a null 'FDialogueConfig' DataObject!");
        }
        FDialogueConfig defaultValue;
        return defaultValue.DialoguePriority;
    }
    return DataObject.Get().DialoguePriority;
}
UFUNCTION()
TDataObjectPtr<FNPCMainConfig> __FDialogueConfig_GetInteractTargetNPC(const TDataObjectPtr<FDialogueConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InteractTargetNPC' from a null 'FDialogueConfig' DataObject!");
        }
        FDialogueConfig local_66;
        return local_66.GetInteractTargetNPC();
    }
    return DataObject.Get().GetInteractTargetNPC();
}
UFUNCTION()
TObjectPtr<UDialogueGraphAsset> __FDialogueConfig_GetDialogueData(const TDataObjectPtr<FDialogueConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DialogueData' from a null 'FDialogueConfig' DataObject!");
        }
        FDialogueConfig local_66;
        return local_66.DialogueData;
    }
    return DataObject.Get().DialogueData;
}
UFUNCTION()
TDataObjectPtr<FLevelInfoConfig> __FDialogueConfig_GetLevelInfo(const TDataObjectPtr<FDialogueConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelInfo' from a null 'FDialogueConfig' DataObject!");
        }
        FDialogueConfig local_66;
        return local_66.GetLevelInfo();
    }
    return DataObject.Get().GetLevelInfo();
}
UFUNCTION()
FDialogueConfig CastToFDialogueConfig(const TDataObjectPtr<FDialogueConfig> &inout DataObject)
{
    FDialogueConfig __r;
    return __r;
}
}
namespace __FSimpleDialogueConfigFunctions
{
UFUNCTION()
FSimpleDialogueConfig CastToFSimpleDialogueConfig(const TDataObjectPtr<FSimpleDialogueConfig> &inout DataObject)
{
    FSimpleDialogueConfig __r;
    return __r;
}
}
namespace __FDailyDialogueConfigFunctions
{
UFUNCTION()
FDailyDialogueConfig CastToFDailyDialogueConfig(const TDataObjectPtr<FDailyDialogueConfig> &inout DataObject)
{
    FDailyDialogueConfig __r;
    return __r;
}
}
namespace __FAmbientDialogueConfigFunctions
{
UFUNCTION()
EDialogueScope __FAmbientDialogueConfig_GetBroadcastScope(const TDataObjectPtr<FAmbientDialogueConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BroadcastScope' from a null 'FAmbientDialogueConfig' DataObject!");
        }
        FAmbientDialogueConfig local_68;
        return local_68.BroadcastScope;
    }
    return DataObject.Get().BroadcastScope;
}
UFUNCTION()
FAmbientDialogueConfig CastToFAmbientDialogueConfig(const TDataObjectPtr<FAmbientDialogueConfig> &inout DataObject)
{
    FAmbientDialogueConfig __r;
    return __r;
}
}
namespace __FDialogueLineConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FNPCMainConfig> __FDialogueLineConfig_GetSpeakerNPC(const TDataObjectPtr<FDialogueLineConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpeakerNPC' from a null 'FDialogueLineConfig' DataObject!");
        }
        FDialogueLineConfig local_66;
        return local_66.GetSpeakerNPC();
    }
    return DataObject.Get().GetSpeakerNPC();
}
UFUNCTION()
FText __FDialogueLineConfig_GetLineText(const TDataObjectPtr<FDialogueLineConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LineText' from a null 'FDialogueLineConfig' DataObject!");
        }
        FDialogueLineConfig local_66;
        return local_66.LineText;
    }
    return DataObject.Get().LineText;
}
UFUNCTION()
TDataObjectPtr<FDialogueVoiceConfig> __FDialogueLineConfig_GetVoiceConfig(const TDataObjectPtr<FDialogueLineConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'VoiceConfig' from a null 'FDialogueLineConfig' DataObject!");
        }
        FDialogueLineConfig local_66;
        return local_66.GetVoiceConfig();
    }
    return DataObject.Get().GetVoiceConfig();
}
UFUNCTION()
FDialogueLineConfig CastToFDialogueLineConfig(const TDataObjectPtr<FDialogueLineConfig> &inout DataObject)
{
    FDialogueLineConfig __r;
    return __r;
}
}
namespace __FNarrationDialogueConfigFunctions
{
UFUNCTION()
EDialogueScope __FNarrationDialogueConfig_GetBroadcastScope(const TDataObjectPtr<FNarrationDialogueConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BroadcastScope' from a null 'FNarrationDialogueConfig' DataObject!");
        }
        FNarrationDialogueConfig local_20;
        return local_20.BroadcastScope;
    }
    return DataObject.Get().BroadcastScope;
}
UFUNCTION()
TArray<FNarrationSubtitleEntry> __FNarrationDialogueConfig_GetNarrationEntries(const TDataObjectPtr<FNarrationDialogueConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NarrationEntries' from a null 'FNarrationDialogueConfig' DataObject!");
        }
        FNarrationDialogueConfig local_20;
        return local_20.NarrationEntries;
    }
    return DataObject.Get().NarrationEntries;
}
UFUNCTION()
FNarrationDialogueConfig CastToFNarrationDialogueConfig(const TDataObjectPtr<FNarrationDialogueConfig> &inout DataObject)
{
    FNarrationDialogueConfig __r;
    return __r;
}
}
namespace __FDialogueOptionStyleConfigFunctions
{
UFUNCTION()
FSoftBrush __FDialogueOptionStyleConfig_GetOptionIcon(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OptionIcon' from a null 'FDialogueOptionStyleConfig' DataObject!");
        }
        FDialogueOptionStyleConfig local_84;
        return local_84.OptionIcon;
    }
    return DataObject.Get().OptionIcon;
}
UFUNCTION()
FLinearColor __FDialogueOptionStyleConfig_GetOptionBgColor(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OptionBgColor' from a null 'FDialogueOptionStyleConfig' DataObject!");
        }
        FDialogueOptionStyleConfig local_84;
        return local_84.OptionBgColor;
    }
    return DataObject.Get().OptionBgColor;
}
UFUNCTION()
bool __FDialogueOptionStyleConfig_GetbIsEscapeOption(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsEscapeOption' from a null 'FDialogueOptionStyleConfig' DataObject!");
        }
        FDialogueOptionStyleConfig local_84;
        return local_84.bIsEscapeOption;
    }
    return DataObject.Get().bIsEscapeOption;
}
UFUNCTION()
bool __FDialogueOptionStyleConfig_GetbNeedConfirm(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bNeedConfirm' from a null 'FDialogueOptionStyleConfig' DataObject!");
        }
        FDialogueOptionStyleConfig local_84;
        return local_84.bNeedConfirm;
    }
    return DataObject.Get().bNeedConfirm;
}
UFUNCTION()
FText __FDialogueOptionStyleConfig_GetConfirmTitle(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfirmTitle' from a null 'FDialogueOptionStyleConfig' DataObject!");
        }
        FDialogueOptionStyleConfig local_84;
        return local_84.ConfirmTitle;
    }
    return DataObject.Get().ConfirmTitle;
}
UFUNCTION()
FText __FDialogueOptionStyleConfig_GetConfirmMessage(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfirmMessage' from a null 'FDialogueOptionStyleConfig' DataObject!");
        }
        FDialogueOptionStyleConfig local_84;
        return local_84.ConfirmMessage;
    }
    return DataObject.Get().ConfirmMessage;
}
UFUNCTION()
FText __FDialogueOptionStyleConfig_GetConfirmButtonText(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfirmButtonText' from a null 'FDialogueOptionStyleConfig' DataObject!");
        }
        FDialogueOptionStyleConfig local_84;
        return local_84.ConfirmButtonText;
    }
    return DataObject.Get().ConfirmButtonText;
}
UFUNCTION()
FText __FDialogueOptionStyleConfig_GetCancelButtonText(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CancelButtonText' from a null 'FDialogueOptionStyleConfig' DataObject!");
        }
        FDialogueOptionStyleConfig local_84;
        return local_84.CancelButtonText;
    }
    return DataObject.Get().CancelButtonText;
}
UFUNCTION()
FDialogueOptionStyleConfig CastToFDialogueOptionStyleConfig(const TDataObjectPtr<FDialogueOptionStyleConfig> &inout DataObject)
{
    FDialogueOptionStyleConfig __r;
    return __r;
}
}
