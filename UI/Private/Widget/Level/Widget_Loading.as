

UCLASS(Abstract)
class UWidget_LoadingCommissionInfo : UUserWidget
{
    UPROPERTY()
    UEUITextBlock TextBlock_CommissionName;
    UPROPERTY()
    UEUITextBlock TextBlock_CommissionLevel;
    UPROPERTY()
    UEUITextBlock TextBlock_Position;
    UPROPERTY()
    UPanelWidget Weather;
    UPROPERTY()
    UEUIImage Image_Weather;
    UPROPERTY()
    UEUITextBlock TextBlock_Weather;
    UPROPERTY()
    bool bWeatherFixed;
    UPROPERTY()
    UPanelWidget Time;
    UPROPERTY()
    UEUIImage Image_TimeOfDay;
    UPROPERTY()
    UEUITextBlock TextBlock_TimeOfDay;
    UPROPERTY()
    UEUIRichTextBlock TextBlock_CommissionTarget;
    UPROPERTY()
    bool bHasTimeLimit;
    UPROPERTY()
    UEUITextBlock TextBlock_CommissionTimeLimit;
    UPROPERTY()
    bool bHasDeathLimit;
    UPROPERTY()
    UEUITextBlock TextBlock_CommissionDeathLimit;
    UPROPERTY()
    UWidget AttributeWidget;
    UPROPERTY()
    UEUITextBlock w_txt_target;
    UPROPERTY()
    UEUITextBlock w_txt_Failure;

    UWidget_LoadingCommissionInfo()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        TEUIModelRef<FM_Commission> local_4 = ::FMS_Loading::Get(this).GetCommission();
        TEUIModelRef<FM_Commission> local_2;
        if (!(local_2.IsValid()))
        {
            this.SetVisibility(ESlateVisibility(1));
            return;
        }
        TDataObjectPtr<FCommissionConfig> local_30 = GetCommissionConfig();
        this.TextBlock_CommissionName.SetText(local_30.opArrow().CommissionName);
        this.TextBlock_CommissionLevel.SetText(FText::AsNumber(local_30.opArrow().CommissionStars, FNumberFormattingOptions()));
        this.TextBlock_Position.SetText(local_2.opArrow().GetLocationName());
        TDataObjectPtr<FWeatherConfig> local_90 = local_2.opArrow().GetWeatherConfig();
        if (local_90)
        {
            this.Image_Weather.SetBrush(local_90.opArrow().DisplayIcon.LoadBrush());
            this.bWeatherFixed = true;
            this.TextBlock_Weather.SetText(local_90.opArrow().DisplayName);
            this.Weather.SetVisibility(ESlateVisibility(4));
        }
        else
        {
            this.Weather.SetVisibility(ESlateVisibility(1));
        }
        if (int(local_30.opArrow().CommissionType) == 2)
        {
            TDataObjectPtr<FTODStageConfig> local_188 = ::FTimeOfDayUtils::GetTODStage(local_2.opArrow().GetStartTimeInHours());
            this.Image_TimeOfDay.SetBrush(local_188.opArrow().DisplayIcon.LoadBrush());
            this.TextBlock_TimeOfDay.SetText(local_188.opArrow().DisplayName);
            this.Time.SetVisibility(ESlateVisibility(4));
        }
        else
        {
            this.Time.SetVisibility(ESlateVisibility(1));
        }
        if (int(local_30.opArrow().ObjectiveDisplayMode) == 2)
        {
            this.w_txt_target.SetVisibility(ESlateVisibility(1));
            this.TextBlock_CommissionTarget.SetVisibility(ESlateVisibility(1));
        }
        else
        {
            if (int(local_30.opArrow().ObjectiveDisplayMode) == 1)
            {
                this.TextBlock_CommissionTarget.SetText(FText::AsCultureInvariant("???"));
            }
            else
            {
                FText local_226;
                FText local_66 = local_2.opArrow().GetCommissionTargetObjectiveOrAimDesc();
                NSLOCTEXT("CommissionTargetText", "дё»и¦Ѓпјљ{0}");
                FText::Format(local_226);
                if (int(local_30.opArrow().CommissionType) == 2)
                {
                    FText local_218;
                    ::ObjectiveUtils::GetObjectiveDesc(local_218, local_2.opArrow().GetSubTargetConfig(), 0);
                    if (!(local_218.IsEmpty()))
                    {
                        local_226 = FText::Format(FText::AsCultureInvariant("{0}\n{1}"), local_226, FText::Format(NSLOCTEXT("CommissionSubTargetText", "еЏЇйЂ‰пјљ{0}"), local_218));
                    }
                }
                this.TextBlock_CommissionTarget.SetText(local_226);
            }
        }
        if (int(local_30.opArrow().FailConditionDisplayMode) == 2)
        {
            this.w_txt_Failure.SetVisibility(ESlateVisibility(1));
            this.bHasTimeLimit = false;
            this.bHasDeathLimit = false;
        }
        else
        {
            if (int(local_30.opArrow().FailConditionDisplayMode) == 1)
            {
                this.bHasTimeLimit = true;
                this.TextBlock_CommissionTimeLimit.SetText(FText::AsCultureInvariant("???"));
                this.bHasDeathLimit = false;
            }
            else
            {
                this.bHasTimeLimit = (local_30.opArrow().CommissionTimeLimit > 0.0f);
                if (this.bHasTimeLimit)
                {
                    FNumberFormattingOptions local_261;
                    local_261 = FNumberFormattingOptions::DefaultNoGrouping();
                    local_261.SetMinimumFractionalDigits(0);
                    this.TextBlock_CommissionTimeLimit.SetText(FText::Format(NSLOCTEXT("CommissionTimeLimitText", "й™ђж—¶{0}е€†й’џ"), FText::AsNumber((local_30.opArrow().CommissionTimeLimit / 60.0f), local_261)));
                }
                this.bHasDeathLimit = (local_30.opArrow().MaxDeathCount > 0);
                if (this.bHasDeathLimit)
                {
                    int local_61_2 = local_30.opArrow().MaxDeathCount;
                    this.TextBlock_CommissionDeathLimit.SetText(FText::Format(NSLOCTEXT("CommissionDeathLimitText", "ж­»дєЎиѕѕе€°{0}ж¬Ў"), FText::AsNumber(local_61_2, FNumberFormattingOptions::DefaultNoGrouping())));
                }
            }
        }
        this.AttributeWidget.SetVisibility(ESlateVisibility(1));
        return;
    }
}

UCLASS(Abstract)
class UWidget_Loading : UUserWidget
{
    UPROPERTY()
    UProgressBar ProgressBar_Loading;
    UPROPERTY()
    UEUITextBlock TextBlock_LoadingProgress;

    UWidget_Loading()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        FMS_Loading& local_2 = ::FMS_Loading::Get(this);
        if (local_2)
        {
            FText local_22;
            float32 local_5 = local_2.GetLoadingProgress();
            this.ProgressBar_Loading.SetPercent(local_5);
            FNumberFormattingOptions local_17;
            local_17 = FNumberFormattingOptions::DefaultNoGrouping();
            local_17.SetMaximumFractionalDigits(0);
            FText::AsNumber(local_22, local_5 * 100.0f);
            this.TextBlock_LoadingProgress.SetText(FText::Format(FText::AsCultureInvariant("{0}%"), local_22));
        }
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        ::FMS_Loading::Get(this).ClearLoadingData();
        return;
    }
}

