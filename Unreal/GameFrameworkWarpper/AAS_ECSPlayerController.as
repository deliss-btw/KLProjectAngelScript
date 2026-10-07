

class AAS_ECSPlayerController : APXECSPlayerController
{
    UPROPERTY()
    TArray<float32> CameraArmLengthRatioArray;
    int CameraArmLengthIndex;
    UPROPERTY()
    TArray<FDataObjectPtr> CameraArmLengthAddictiveModifiers;
    FDataObjectPtr CurrentArmLengthModifierConfig;
    UPROPERTY()
    float32 CameraArmLengthRatioBlendTime;
    UPROPERTY()
    float32 TargetCameraRatio;
    FShowSideHintDelegate ShowSideHint;
    FDebugShowHintTextDelegate ShowHintText;
    FDebugShowHintTextDelegate ShowDialogText;
    FShowHeadBubbleDelegate ShowHeadBubble;
    FSetMissionPanelDelegate ShowLevelHintPanel;
    FSetIndicatorIconsVisibleDelegate SetIndicatorIconsVisible;
    FShowCustomWheelOptionDelegate ShowCustomWheelOption;
    FGameModeStateChangedDelegate GameModeStateChanged;
    FSetHUDVisibilityDelegate MainHUDSetVisibility;

    AAS_ECSPlayerController()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Tick_Implementation(const float32 DeltaSeconds)
    {
        this.TickCameraArmLengthRatioChange(DeltaSeconds);
        return;
    }
    void TickCameraArmLengthRatioChange(const float32 DeltaTime)
    {
        FCS_TPCameraParam local_10;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (local_10)
        {
            if (this.TargetCameraRatio != local_10.ArmLengthRatioTweaked)
            {
                float32 local_15 = FMathUtils::LerpToInDuration(local_10.ArmLengthRatioTweaked, this.TargetCameraRatio, this.CameraArmLengthRatioBlendTime, DeltaTime);
                if (FMath::IsNearlyEqual(local_10.ArmLengthRatioTweaked, 1.0, 0.001))
                {
                }
            }
        }
        return;
    }
    UFUNCTION()
    void SwitchFarNearCamera()
    {
        int local_10 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (local_10 && local_10.GetbAllowArmLengthRatio())
        {
            ++this.CameraArmLengthIndex;
            if (this.CameraArmLengthIndex >= this.CameraArmLengthRatioArray.Num())
            {
                this.CameraArmLengthIndex = 0;
            }
            this.TargetCameraRatio = this.CameraArmLengthRatioArray[this.CameraArmLengthIndex];
            if (this.TargetCameraRatio < 1.0f)
            {
                this.MainHUDSetVisibility.ExecuteIfBound(ESlateVisibility(2));
            }
            else
            {
                this.MainHUDSetVisibility.ExecuteIfBound(ESlateVisibility(0));
            }
        }
        else
        {
            this.TargetCameraRatio = 1.0f;
        }
        return;
    }
}

delegate void FSetHUDVisibilityDelegate(const ESlateVisibility Visibility);

delegate void FShowSideHintDelegate(const FString &inout Content, const ESideHintType HintType, const FECSEntity &inout HintTarget, const int32 ShowCount = 0);

delegate void FDebugShowHintTextDelegate(const FString &inout Content, const float32 ShowLastTime, const FECSEntity &inout SpecifiedShowEntity = ENTITY_NULL);

delegate void FSpawnSignalTargetDelegate(const FVector &inout TargetPos, const EPlayerSignalType SignalType, const FECSEntity &inout TargetEntity, const FECSEntity &inout Sender);

delegate void FShowHeadBubbleDelegate(const FCE_ShowHeadBubble &inout Event, const bool bIsChaos = false);

delegate void FAddLeftInfoContentDelegate(const FString &inout AddContent, const FString &inout SenderName, const EDialogSenderType SenderType);

delegate void FSetMissionTargetDelegate(const FString &inout Content);

delegate void FSetSubMissionTargetDelegate(const FString &inout Content, const FString &inout SubContent);

delegate void FSetMissionPanelDelegate(const FName &inout MissionName);

delegate void FStartBlackScreenDelegate(const float32 BlackTime);

delegate void FSetIndicatorIconsVisibleDelegate(const bool bVisible);

delegate void FShowCustomWheelOptionDelegate(const FCE_ShowCustomWheelOption &inout Event);

delegate void FGameModeStateChangedDelegate();

