
namespace FESMPerformanceEditorTool
{
UFUNCTION()
void EnableAllFxAction(const UESMData Param)
{
    XLog(ELog(1), "Enable All Fx Action");
    return;
}
UFUNCTION()
void DisableAllFxAction(const UESMData Param)
{
    XLog(ELog(1), "Disable All Fx Action");
    return;
}
UFUNCTION()
void PasteWwiseAudioFromClipboard(const UESMData Param)
{
    XLog(ELog(1), "PasteWwiseAudioFromClipboard ж‰§иЎЊе®Њж€ђ");
    return;
}
UFUNCTION()
void ProcessAudioFile(const WwiseClipboardTools::FWwiseAssetResult &inout AssetResult, const UESMData Param)
{
    return;
}
FName GetNextSFXInstantName(const UESMState State)
{
    TArray<UESMAction> local_4 = State.GetActionList();
    int local_9 = 0;
    for (auto local_26 : local_4)
    {
        FName local_30 = local_26.GetDataName();
        FString local_38 = local_30.ToString();
        if (local_38.StartsWith("SFX_Instant", ESearchCase(1)))
        {
            FString local_34 = local_38.RightChop(10);
            int local_10 = String::Conv_StringToInt(local_34);
            if (local_10 > local_9)
            {
                local_9 = local_10;
            }
        }
    }
    int local_45 = local_9 + 1;
    return FName((FString("SFX_Instant") + local_45));
}
UFUNCTION()
void StopAllSound(const UESMData Param)
{
    XLog(ELog(1), "Stop All Sound");
    return;
}
UFUNCTION()
void CreateVOFromSFX(const UESMData Param)
{
    XLog(ELog(1), "CreateVOFromSFX ж‰§иЎЊе®Њж€ђ");
    return;
}
FName GetNextVOInstantName(const UESMState State)
{
    TArray<UESMAction> local_4 = State.GetActionList();
    int local_9 = 0;
    for (auto local_26 : local_4)
    {
        FName local_30 = local_26.GetDataName();
        FString local_38 = local_30.ToString();
        if (local_38.StartsWith("VO_Instant", ESearchCase(1)))
        {
            FString local_34 = local_38.RightChop(9);
            int local_10 = String::Conv_StringToInt(local_34);
            if (local_10 > local_9)
            {
                local_9 = local_10;
            }
        }
    }
    int local_45 = local_9 + 1;
    return FName((FString("VO_Instant") + local_45));
}
}
