delegate bool FSettingApplyIndexHandler(const int OptionIndex);

delegate bool FSettingApplyValueHandler(const float32 Value);

delegate bool FSettingReadIndexHandler(int &inout OutOptionIndex);

delegate bool FSettingReadValueHandler(float32 &inout OutValue);

namespace SettingUtils
{
UKLGameUserSettings GetSettings()
{
    return UKLGameUserSettings::Get();
}
bool QualitySetMatchesCurrent(const FQualitySet &inout Preset)
{
    UKLGameUserSettings local_2 = UKLGameUserSettings::Get();
    return int(Preset.ViewDistanceQuality) == local_2.GetViewDistanceQuality() && (int(Preset.AntiAliasingQuality) == local_2.GetAntiAliasingQuality()) && (int(Preset.ShadowQuality) == local_2.GetShadowQuality()) && (int(Preset.GlobalIlluminationQuality) == local_2.GetGlobalIlluminationQuality()) && (int(Preset.ReflectionQuality) == local_2.GetReflectionQuality()) && (int(Preset.PostProcessQuality) == local_2.GetPostProcessingQuality()) && (int(Preset.TextureQuality) == local_2.GetTextureQuality()) && (int(Preset.EffectsQuality) == local_2.GetVisualEffectQuality()) && (int(Preset.FoliageQuality) == local_2.GetFoliageQuality()) && (int(Preset.ShadingQuality) == local_2.GetShadingQuality()) && (int(Preset.LandscapeQuality) == local_2.GetLandscapeQuality());
}
float32 GetCurrentQualityPresetIndex()
{
    UKLGameUserSettings local_2 = UKLGameUserSettings::Get();
    if (SettingUtils::QualitySetMatchesCurrent(local_2.GetRecommendQuality()))
    {
        return 4.0f;
    }
    const TArray<FQualitySet>& local_8 = local_2.GetQualityPresets();
    int local_9 = 0;
    for (; local_9 < local_8.Num(); ++local_9)
    {
        if (SettingUtils::QualitySetMatchesCurrent(local_8[local_9]))
        {
            return local_9;
        }
    }
    return 4.0f;
}
float32 GetPresetValue(const FInstancedStruct &inout ApplyEffect, const float32 Value)
{
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetPresetValue(Value);
    }
    return Value;
}
bool Apply(const FInstancedStruct &inout ApplyEffect, const float32 Value)
{
    if (SettingUtils::GetSettings() == nullptr || !(ApplyEffect.IsValid()))
    {
        return false;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().Apply(Value);
    }
    XWarning(ELog(16), FString().Append("Unknown setting apply: ").Append(ApplyEffect.GetScriptStruct().GetName()));
    return false;
}
void BuildOptions(const FInstancedStruct &inout ApplyEffect, TArray<FSettingOption> &inout OutOptions)
{
    if (UKLGameUserSettings::Get() == nullptr)
    {
        return;
    }
    else
    {
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
            return;
        }
        else
        {
            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
            {
                FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                return;
            }
            else
            {
                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                {
                    FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                    return;
                }
                else
                {
                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                    {
                        FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                        return;
                    }
                    else
                    {
                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                        {
                            FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                            return;
                        }
                        else
                        {
                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                            {
                                FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                return;
                            }
                            else
                            {
                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                {
                                    FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                    return;
                                }
                                else
                                {
                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                    {
                                        FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                        return;
                                    }
                                    else
                                    {
                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                        {
                                            FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                            return;
                                        }
                                        else
                                        {
                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                            {
                                                FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                return;
                                            }
                                            else
                                            {
                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                {
                                                    FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                    return;
                                                }
                                                else
                                                {
                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                    {
                                                        FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                        return;
                                                    }
                                                    else
                                                    {
                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                        {
                                                            FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                            return;
                                                        }
                                                        else
                                                        {
                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                            {
                                                                FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                return;
                                                            }
                                                            else
                                                            {
                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                {
                                                                    FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                    return;
                                                                }
                                                                else
                                                                {
                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                    {
                                                                        FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                        return;
                                                                    }
                                                                    else
                                                                    {
                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                        {
                                                                            FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                            return;
                                                                        }
                                                                        else
                                                                        {
                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                            {
                                                                                FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                return;
                                                                            }
                                                                            else
                                                                            {
                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                {
                                                                                    FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                    return;
                                                                                }
                                                                                else
                                                                                {
                                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                    {
                                                                                        FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                        return;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                        {
                                                                                            FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                            return;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                            {
                                                                                                FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                return;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                {
                                                                                                    FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                    return;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                    {
                                                                                                        FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                        return;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                        {
                                                                                                            FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                            return;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                            {
                                                                                                                FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                return;
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                {
                                                                                                                    FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                    return;
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                    {
                                                                                                                        FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                        return;
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                        {
                                                                                                                            FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                            return;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                            {
                                                                                                                                FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                                return;
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                {
                                                                                                                                    FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                                    return;
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                    {
                                                                                                                                        FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                                        return;
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                        {
                                                                                                                                            FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                                            return;
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                            {
                                                                                                                                                FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                                                return;
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                                {
                                                                                                                                                    FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().BuildOptions(OutOptions);
                                                                                                                                                    return;
                                                                                                                                                }
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
float32 GetCurrentValue(const FInstancedStruct &inout ApplyEffect, const bool bUseDefaultValue = false)
{
    if (UKLGameUserSettings::Get() == nullptr)
    {
        return 3.4028235e38f;
    }
    if (bUseDefaultValue)
    {
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        }
    }
    else
    {
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
        }
        else
        {
            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
            {
                return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
            }
            else
            {
                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                {
                    return FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetCurrentValue();
                }
            }
        }
    }
    return 3.4028235e38f;
}
float32 GetDefaultValue(const FInstancedStruct &inout ApplyEffect, const float32 DefaultValue)
{
    if (UKLGameUserSettings::Get() == nullptr)
    {
        return DefaultValue;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_13;
        local_13 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_13 == 3.4028235e38f)
        {
            local_15 = DefaultValue;
        }
        else
        {
            local_15 = local_13;
        }
        return local_15;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_14;
        float32 local_13;
        local_14 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_14 == 3.4028235e38f)
        {
            local_13 = DefaultValue;
        }
        else
        {
            local_13 = local_14;
        }
        return local_13;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_14;
        local_15 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_15 == 3.4028235e38f)
        {
            local_14 = DefaultValue;
        }
        else
        {
            local_14 = local_15;
        }
        return local_14;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_13;
        local_13 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_13 == 3.4028235e38f)
        {
            local_15 = DefaultValue;
        }
        else
        {
            local_15 = local_13;
        }
        return local_15;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_14;
        float32 local_13;
        local_14 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_14 == 3.4028235e38f)
        {
            local_13 = DefaultValue;
        }
        else
        {
            local_13 = local_14;
        }
        return local_13;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_14;
        local_15 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_15 == 3.4028235e38f)
        {
            local_14 = DefaultValue;
        }
        else
        {
            local_14 = local_15;
        }
        return local_14;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_13;
        local_13 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_13 == 3.4028235e38f)
        {
            local_15 = DefaultValue;
        }
        else
        {
            local_15 = local_13;
        }
        return local_15;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_14;
        float32 local_13;
        local_14 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_14 == 3.4028235e38f)
        {
            local_13 = DefaultValue;
        }
        else
        {
            local_13 = local_14;
        }
        return local_13;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_14;
        local_15 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_15 == 3.4028235e38f)
        {
            local_14 = DefaultValue;
        }
        else
        {
            local_14 = local_15;
        }
        return local_14;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_13;
        local_13 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_13 == 3.4028235e38f)
        {
            local_15 = DefaultValue;
        }
        else
        {
            local_15 = local_13;
        }
        return local_15;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_14;
        float32 local_13;
        local_14 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_14 == 3.4028235e38f)
        {
            local_13 = DefaultValue;
        }
        else
        {
            local_13 = local_14;
        }
        return local_13;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_14;
        local_15 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_15 == 3.4028235e38f)
        {
            local_14 = DefaultValue;
        }
        else
        {
            local_14 = local_15;
        }
        return local_14;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_13;
        local_13 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_13 == 3.4028235e38f)
        {
            local_15 = DefaultValue;
        }
        else
        {
            local_15 = local_13;
        }
        return local_15;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_14;
        float32 local_13;
        local_14 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_14 == 3.4028235e38f)
        {
            local_13 = DefaultValue;
        }
        else
        {
            local_13 = local_14;
        }
        return local_13;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_14;
        local_15 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_15 == 3.4028235e38f)
        {
            local_14 = DefaultValue;
        }
        else
        {
            local_14 = local_15;
        }
        return local_14;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_13;
        local_13 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_13 == 3.4028235e38f)
        {
            local_15 = DefaultValue;
        }
        else
        {
            local_15 = local_13;
        }
        return local_15;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_14;
        float32 local_13;
        local_14 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_14 == 3.4028235e38f)
        {
            local_13 = DefaultValue;
        }
        else
        {
            local_13 = local_14;
        }
        return local_13;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_14;
        local_15 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_15 == 3.4028235e38f)
        {
            local_14 = DefaultValue;
        }
        else
        {
            local_14 = local_15;
        }
        return local_14;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_13;
        local_13 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_13 == 3.4028235e38f)
        {
            local_15 = DefaultValue;
        }
        else
        {
            local_15 = local_13;
        }
        return local_15;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_14;
        float32 local_13;
        local_14 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_14 == 3.4028235e38f)
        {
            local_13 = DefaultValue;
        }
        else
        {
            local_13 = local_14;
        }
        return local_13;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_14;
        local_15 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_15 == 3.4028235e38f)
        {
            local_14 = DefaultValue;
        }
        else
        {
            local_14 = local_15;
        }
        return local_14;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_13;
        local_13 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_13 == 3.4028235e38f)
        {
            local_15 = DefaultValue;
        }
        else
        {
            local_15 = local_13;
        }
        return local_15;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_14;
        float32 local_13;
        local_14 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_14 == 3.4028235e38f)
        {
            local_13 = DefaultValue;
        }
        else
        {
            local_13 = local_14;
        }
        return local_13;
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        float32 local_15;
        float32 local_14;
        local_15 = FInstancedStruct::GetPtr(ApplyEffect).opCall().Get().GetDefaultValue();
        if (local_15 == 3.4028235e38f)
        {
            local_14 = DefaultValue;
        }
        else
        {
            local_14 = local_15;
        }
        return local_14;
    }
    return DefaultValue;
}
}
