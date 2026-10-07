
enum ESettingApplyType
{
    Inmediate,
    OnSave,
    OnRestart,
}

namespace FSettingApply_Resolution
{
    const TMap<int, int> ResolutionSupportedMap = TMap<int, int>();
    const TMap<int, FText> ResolutionTextMap = TMap<int, FText>();
}
namespace FSettingApply_UpscalingMethod
{
    const TMap<EKLAntiAliasingMethod, FText> MethodTextMap = TMap<EKLAntiAliasingMethod, FText>();
    const TMap<EKLAntiAliasingMethod, int> MethodIndexMap = TMap<EKLAntiAliasingMethod, int>();
    const TMap<int, EKLAntiAliasingMethod> IndexMethodMap = TMap<int, EKLAntiAliasingMethod>();
}
namespace FSettingApply_FrameGeneration
{
    const TMap<EKLFrameGenerationMode, FText> FrameGenerationTextMap = TMap<EKLFrameGenerationMode, FText>();
    const TMap<EKLFrameGenerationMode, int> FrameGenerationIndexMap = TMap<EKLFrameGenerationMode, int>();
    const TMap<int, EKLFrameGenerationMode> IndexFrameGenerationMap = TMap<int, EKLFrameGenerationMode>();

}
struct FSettingCategoryConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    FFilteredGameplayTag CategoryTag;
    UPROPERTY()
    FSoftBrush ItemIcon;

    FSettingCategoryConfig()
    {
        return;
    }
}

struct FSettingComponentWidgetClass : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> SettingSubTitleWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> SettingItemWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> DropDownWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> SliderWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> LinkWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> ToggleWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> KeyboardWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> GamepadWidgetClass;

    FSettingComponentWidgetClass()
    {
        return;
    }
}

struct FSettingSubTitleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    FFilteredGameplayTag SubTitleTag;

    FSettingSubTitleConfig()
    {
        return;
    }
}

struct FSettingItemBase
{
    FSettingItemBase()
    {
        return;
    }
}

struct FSettingOption
{
    UPROPERTY()
    FText Name;
    UPROPERTY()
    float32 Value;
    UPROPERTY()
    bool IsDisabled;

    FSettingOption()
    {
        FText::FromString("");
        this.Value = 0.0f;
        this.IsDisabled = false;
        return;
    }
}

struct FSettingDropDown : FSettingItemBase
{
    FSettingItemBase _base_FSettingItemBase;
    UPROPERTY()
    TArray<FSettingOption> Options;

    FSettingDropDown()
    {
        super();
        return;
    }
}

struct FSettingSlider : FSettingItemBase
{
    FSettingItemBase _base_FSettingItemBase;
    UPROPERTY()
    float32 MaxValue;
    UPROPERTY()
    float32 MinValue;
    UPROPERTY()
    float32 MidValue;
    UPROPERTY()
    float32 Step;


}

struct FSettingToggle : FSettingItemBase
{
    FSettingItemBase _base_FSettingItemBase;
    UPROPERTY()
    TArray<FSettingOption> Options;

    FSettingToggle()
    {
        super();
        return;
    }
}

struct FSettingLink : FSettingItemBase
{
    FSettingItemBase _base_FSettingItemBase;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FFilteredGameplayTag TargetTag;

    FSettingLink()
    {
        super();
        return;
    }
}

struct FSettingApplyBase
{
    UPROPERTY()
    float32 CurrentValue = 0.0f;
    UPROPERTY()
    FGameplayTag ItemTag;
    UPROPERTY()
    UKLGameUserSettings Settings = UKLGameUserSettings::Get();


    void SetSavedValue(const FGameplayTag &inout InItemTag, const float32 InValue)
    {
        this.ItemTag = InItemTag;
        this.CurrentValue = InValue;
        return;
    }
    bool ApplyBase(const float32 value) const
    {
        return true;
    }
    float32 GetDefaultValueBase() const
    {
        return this.CurrentValue;
    }
    float32 GetCurrentValueBase() const
    {
        return 3.4028235e38f;
    }
    void BuildOptionsBase(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_ScreenMode : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_ScreenMode()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetDisplayMode(FMath::Clamp(uint(value), 0, 1));
        return true;
    }
    float32 GetDefaultValue() const
    {
        return this.Settings.GetDisplayMode();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_Resolution : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_Resolution()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        const TArray<FIntPoint>& local_2 = this.Settings.GetSupportedResolutions();
        if (!(local_2.IsValidIndex(uint(value))))
        {
            return false;
        }
        this.Settings.SetUIResolution(local_2[uint(value)]);
        return true;
    }
    float32 GetDefaultValue() const
    {
        FIntPoint local_2 = this.Settings.GetUIResolution();
        int local_5 = 0;
        for (; local_5 < this.Settings.GetSupportedResolutions().Num(); ++local_5)
        {
            if ((FIntPoint(this.Settings.GetSupportedResolutions()[]) == local_2))
            {
                return local_5;
            }
        }
        return (this.Settings.GetSupportedResolutions().Num() - 1);
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        OutOptions.Empty(0);
        int local_2 = 0;
        for (; local_2 < this.Settings.GetSupportedResolutions().Num(); )
        {
            FIntPoint local_6 = FIntPoint(this.Settings.GetSupportedResolutions()[]);
            FSettingOption local_12;
            local_12.Name = FText::FromString(FString().Append(local_6.X).Append("x").Append(local_6.Y));
            local_12.Value = local_2;
            OutOptions.Add(local_12);
            ++local_2;
        }
        return;
    }
}

struct FSettingApply_DisplayDevice : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_DisplayDevice()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        if (this.Settings.GetMonitorCount() <= uint(value))
        {
            return false;
        }
        this.Settings.SwitchToMonitor(uint(value));
        return true;
    }
    float32 GetDefaultValue() const
    {
        return this.Settings.GetCurrentMonitorIndex();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        OutOptions.Empty(0);
        int local_2 = 1;
        for (auto& local_22 : this.Settings.GetMonitorInfos())
        {
            FSettingOption local_28;
            int local_30 = FMath::Min(int(local_22.MaxResolution.X), int(local_22.MaxResolution.Y));
            FString local_34;
            ::FSettingApply_Resolution::GetResolutionIndex(local_34);
            FString local_42 = FString();
            FText local_38;
            local_28.Name = local_38;
            local_28.Value = local_2;
            OutOptions.Add(local_28);
            ++local_2;
        }
        if (OutOptions.IsEmpty())
        {
            FSettingOption local_28;
            local_28.Name = FText::FromString(FString().Append("1: Main Monitor"));
            local_28.Value = 0.0f;
            OutOptions.Add(local_28);
        }
        return;
    }
}

struct FSettingApply_FrameRateLimit : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_FrameRateLimit()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        if (value == 2.0f)
        {
            this.Settings.SetFrameRateLimit(0.0f);
        }
        else
        {
            this.Settings.SetFrameRateLimit(((value + 1.0f) * 30.0f));
        }
        return true;
    }
    float32 GetDefaultValue() const
    {
        int local_6;
        float32 local_1 = this.Settings.GetFrameRateLimit();
        if (local_1 == 0.0f)
        {
            local_6 = 2;
        }
        else
        {
            local_6 = uint(((local_1 / 30.0f) - 1.0f));
        }
        return local_6;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        float32 local_1 = this.Settings.GetFrameRateLimit();
        return;
    }
}

struct FSettingApply_VSync : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_VSync()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetVSyncEnabled((value == 1.0f));
        return true;
    }
    float32 GetDefaultValue() const
    {
        int local_2 = this.Settings.IsVSyncEnabled() ? 1 : 0;
        return local_2;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_UpscalingMethod : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_UpscalingMethod()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        if (!(FSettingApply_UpscalingMethod::IndexMethodMap.Contains(uint(value))))
        {
            return false;
        }
        this.Settings.SetAAMethod(EKLAntiAliasingMethod(FSettingApply_UpscalingMethod::IndexMethodMap[uint(value)]), true);
        return true;
    }
    float32 GetDefaultValue() const
    {
        int local_1 = int(this.Settings.GetAAMethod());
        if (!(FSettingApply_UpscalingMethod::MethodIndexMap.Contains(EKLAntiAliasingMethod(local_1))))
        {
            return 3.4028235e38f;
        }
        return FSettingApply_UpscalingMethod::MethodIndexMap[EKLAntiAliasingMethod(local_1)];
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        OutOptions.Empty(0);
        TArray<EKLAntiAliasingMethod> local_6 = this.Settings.GetSupportedAntiAliasingMethods();
        for (auto& local_26 : FSettingApply_UpscalingMethod::MethodTextMap)
        {
            FSettingOption local_32;
            local_32.Value = 0.0f;
            if (!(local_6.Contains(local_26.GetKey())))
            {
                local_32.IsDisabled = true;
            }
            OutOptions.Add(local_32);
        }
        return;
    }
}

struct FSettingApply_FrameGeneration : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_FrameGeneration()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        if (!(FSettingApply_FrameGeneration::IndexFrameGenerationMap.Contains(uint(value))))
        {
            return false;
        }
        EKLFrameGenerationMode local_3 = FSettingApply_FrameGeneration::IndexFrameGenerationMap[uint(value)];
        this.Settings.SetFrameGenerationMode(EKLFrameGenerationMode(local_3));
        return true;
    }
    float32 GetDefaultValue() const
    {
        int local_1 = int(this.Settings.GetFrameGenerationMode());
        if (!(FSettingApply_FrameGeneration::FrameGenerationIndexMap.Contains(EKLFrameGenerationMode(local_1))))
        {
            return 3.4028235e38f;
        }
        return FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(local_1)];
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        OutOptions.Empty(0);
        for (auto& local_22 : FSettingApply_FrameGeneration::FrameGenerationTextMap)
        {
            local_22;
            FSettingOption local_28;
            local_28.Value = 0.0f;
            OutOptions.Add(local_28);
        }
        OutOptions[FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(1)]].IsDisabled = true;
        EKLAntiAliasingMethod local_31 = this.Settings.GetAAMethod();
        TArray<EKLFrameGenerationMode> local_36 = this.Settings.GetSupportedFrameGenerationModes();
        if (int(local_31) == 1)
        {
            if (!(local_36.Contains(EKLFrameGenerationMode(2))))
            {
                OutOptions[FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(2)]].IsDisabled = true;
            }
            if (!(local_36.Contains(EKLFrameGenerationMode(4))))
            {
                OutOptions[FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(4)]].IsDisabled = true;
            }
        }
        else
        {
            OutOptions[FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(2)]].IsDisabled = true;
            OutOptions[FSettingApply_FrameGeneration::FrameGenerationIndexMap[EKLFrameGenerationMode(4)]].IsDisabled = true;
        }
        return;
    }
}

struct FSettingApply_UpscaleQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_UpscaleQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        if (value > this.Settings.GetUpscaleQualityPresets().Num())
        {
            return false;
        }
        this.Settings.SetUpscalePresetIndex(uint(value));
        return true;
    }
    float32 GetDefaultValue() const
    {
        return this.Settings.GetUpscalePresetIndex();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_Gamma : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_Gamma()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetDisplayGamma(value);
        return true;
    }
    float32 GetDefaultValue() const
    {
        return this.Settings.GetDisplayGamma();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_QualityPreset : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;
    UPROPERTY()
    bool bIsRecommended = false;


    bool Apply(const float32 value) const
    {
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        if (this.bIsRecommended)
        {
            return 4.0f;
        }
        return ::SettingUtils::GetCurrentQualityPresetIndex();
    }
}

struct FSettingApply_FoliageQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_FoliageQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetFoliageQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetFoliageQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).FoliageQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).FoliageQuality);
    }
}

struct FSettingApply_ViewDistanceQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_ViewDistanceQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetViewDistanceQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetViewDistanceQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).ViewDistanceQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).ViewDistanceQuality);
    }
}

struct FSettingApply_TextureQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_TextureQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetTextureQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetTextureQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).TextureQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).TextureQuality);
    }
}

struct FSettingApply_EffectsQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_EffectsQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetVisualEffectQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetVisualEffectQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).EffectsQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).EffectsQuality);
    }
}

struct FSettingApply_ShadowQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_ShadowQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetShadowQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetShadowQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).ShadowQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).ShadowQuality);
    }
}

struct FSettingApply_ShadingQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_ShadingQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetShadingQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetShadingQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).ShadingQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).ShadingQuality);
    }
}

struct FSettingApply_GlobalIlluminationQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_GlobalIlluminationQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetGlobalIlluminationQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetGlobalIlluminationQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).GlobalIlluminationQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).GlobalIlluminationQuality);
    }
}

struct FSettingApply_ReflectionQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_ReflectionQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetReflectionQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetReflectionQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).ReflectionQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).ReflectionQuality);
    }
}

struct FSettingApply_LandscapeQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_LandscapeQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetLandscapeQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetLandscapeQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).LandscapeQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).LandscapeQuality);
    }
}

struct FSettingApply_AntialiasingQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_AntialiasingQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetAntiAliasingQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetAntiAliasingQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).AntiAliasingQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).AntiAliasingQuality);
    }
}

struct FSettingApply_PostProcessQuality : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_PostProcessQuality()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetPostProcessingQuality(uint(value));
        return true;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
    float32 GetDefaultValue() const
    {
        return FMath::Clamp(this.Settings.GetPostProcessingQuality(), 0.0f, 3.0f);
    }
    float32 GetPresetValue(const float32 value) const
    {
        if (value == 4.0f)
        {
            return this.GetRecommendedValue();
        }
        int local_3 = uint(value);
        return int(FQualitySet(this.Settings.GetQualityPresets()[]).PostProcessQuality);
    }
    float32 GetRecommendedValue() const
    {
        return int(FQualitySet(this.Settings.GetRecommendQuality()).PostProcessQuality);
    }
}

struct FSettingApply_SSAO : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_SSAO()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetAmbientOcclusionEnabled((value == 1.0f));
        return true;
    }
    float32 GetDefaultValue() const
    {
        int local_2 = this.Settings.IsAmbientOcclusionEnabled() ? 1 : 0;
        return local_2;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_Bloom : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_Bloom()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetBloomEnabled((value == 1.0f));
        return true;
    }
    float32 GetDefaultValue() const
    {
        int local_2 = this.Settings.IsBloomEnabled() ? 1 : 0;
        return local_2;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_MotionBlur : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_MotionBlur()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        this.Settings.SetMotionBlurEnabled((value == 1.0f));
        return true;
    }
    float32 GetDefaultValue() const
    {
        int local_2 = this.Settings.IsMotionBlurEnabled() ? 1 : 0;
        return local_2;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_Volume : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_Volume()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        FGameAudioUtils::SetMasterVolume(value);
        return false;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        return FGameAudioUtils::GetMasterVolume();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_MusicVolume : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_MusicVolume()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        FGameAudioUtils::SetMusicVolume(value);
        return true;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        return FGameAudioUtils::GetMusicVolume();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_SFXVolume : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_SFXVolume()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        FGameAudioUtils::SetSFXVolume(value);
        return true;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        return FGameAudioUtils::GetSFXVolume();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_VoiceVolume : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_VoiceVolume()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        FGameAudioUtils::SetVOVolume(value);
        return true;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        return FGameAudioUtils::GetVOVolume();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_VoiceReceiveVolume : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_VoiceReceiveVolume()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        FGameAudioUtils::SetVoiceChatVolume(value);
        return true;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        return FGameAudioUtils::GetVoiceChatVolume();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_AttackLockOnMode : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_AttackLockOnMode()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        if (value == 0.0f)
        {
            ::FLockTargetUtils::SetPlayerSettingInputFirst(false);
        }
        else
        {
            if (value == 1.0f)
            {
                ::FLockTargetUtils::SetPlayerSettingInputFirst(true);
            }
        }
        return false;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        int local_2 = ::FLockTargetUtils::IsPlayerSettingInputFirstEnabled() ? 1 : 0;
        return local_2;
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_CameraYawDirection : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_CameraYawDirection()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        if (value == 0.0f)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), "Camera.EnableAutoYaw 0", nullptr);
        }
        else
        {
            if (value == 1.0f)
            {
                System::ExecuteConsoleCommand(__GetWorldContext(), "Camera.EnableAutoYaw 1", nullptr);
            }
        }
        return true;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        return CameraOptions::CVar_Camera_EnableAutoYaw.GetFloat();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_InvertCameraX_Axis : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_InvertCameraX_Axis()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("Camera.Look.InvertX ").Append(int(FMath::Clamp(value, 0.0, 1.0))), nullptr);
        return true;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        return CameraOptions::CVar_Camera_Look_InvertX.GetFloat();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_InvertCameraY_Axis : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_InvertCameraY_Axis()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("Camera.Look.InvertY ").Append(int(FMath::Clamp(value, 0.0, 1.0))), nullptr);
        return true;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        return CameraOptions::CVar_Camera_Look_InvertY.GetFloat();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_CameraSensitivity : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_CameraSensitivity()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("Camera.Look.Sensitivity ").Append(int(FMath::Clamp(value, 0.0, 10.0))), nullptr);
        return true;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        return CameraOptions::CVar_Camera_Look_Sensitivity.GetFloat();
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingApply_CameraMode : FSettingApplyBase
{
    FSettingApplyBase _base_FSettingApplyBase;

    FSettingApply_CameraMode()
    {
        super();
        return;
    }
    bool Apply(const float32 value) const
    {
        int local_9 = int((FMath::Clamp(value, 0.0, 3.0)));
        FECSWorldPtr local_12 = FECSWorldPtr(ECS::GetECSWorld());
        if (!(local_12.IsValid()))
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("Camera.AdditionalInputModifierIndex ").Append(local_9), nullptr);
            return true;
        }
        ::CameraOptions::ClientSetCameraAdditionalInputModifierIndex(local_12, local_9);
        return true;
    }
    float32 GetDefaultValue() const
    {
        return 3.4028235e38f;
    }
    float32 GetCurrentValue() const
    {
        FECSWorldPtr local_2 = FECSWorldPtr(ECS::GetECSWorld());
        if (!(local_2.IsValid()))
        {
            return CameraOptions::CVar_Camera_AdditionalInputModifierIndex.GetFloat();
        }
        return ::CameraOptions::ClientGetCameraAdditionalInputModifierIndex(local_2);
    }
    void BuildOptions(TArray<FSettingOption> &inout OutOptions) const
    {
        return;
    }
}

struct FSettingItemConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    FFilteredGameplayTag ItemTag;
    UPROPERTY()
    float32 DefaultValue;
    UPROPERTY()
    ESettingApplyType ApplyType;
    UPROPERTY()
    FInstancedStruct VisualConfig;
    UPROPERTY()
    FInstancedStruct ApplyEffect;
    UPROPERTY()
    bool bIsResolutionOption;
    UPROPERTY()
    bool bToHide;


}

namespace FSettingApply_Resolution
{
const FText GetResolutionIndex(const int Resolution)
{
    if (FSettingApply_Resolution::ResolutionTextMap.Contains(Resolution))
    {
        return FSettingApply_Resolution::ResolutionTextMap[Resolution];
    }
    if (Resolution > 2160)
    {
        return FSettingApply_Resolution::ResolutionTextMap[2160];
    }
    if (Resolution < 720)
    {
        return FSettingApply_Resolution::ResolutionTextMap[720];
    }
    int local_3 = 0;
    FText local_12;
    for (; local_3 < (FSettingApply_Resolution::ResolutionSupportedMap.Num() - 1); ++local_3)
    {
        if ((Resolution > FSettingApply_Resolution::ResolutionSupportedMap[local_3] && (Resolution < FSettingApply_Resolution::ResolutionSupportedMap[local_3 + 1])))
        {
            int local_5 = FMath::Abs(Resolution - FSettingApply_Resolution::ResolutionSupportedMap[local_3]);
            if (local_5 < FMath::Abs((Resolution - (FSettingApply_Resolution::ResolutionSupportedMap[local_3 + 1]))))
            {
                local_12 = FSettingApply_Resolution::ResolutionTextMap[FSettingApply_Resolution::ResolutionSupportedMap[local_3]];
            }
            else
            {
                local_12 = FSettingApply_Resolution::ResolutionTextMap[FSettingApply_Resolution::ResolutionSupportedMap[local_3 + 1]];
            }
            return local_12;
        }
    }
    return FText::FromString(FString().Append(Resolution).Append("p"));
}
}
