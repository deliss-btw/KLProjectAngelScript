

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
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    float32 __r; return __r;
}
float32 GetPresetValue(const FInstancedStruct &inout ApplyEffect, const float32 Value)
{
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_FoliageQuality> local_6 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_ViewDistanceQuality> local_14 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_TextureQuality> local_20 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_EffectsQuality> local_26 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_ShadingQuality> local_32 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_ShadowQuality> local_38 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_GlobalIlluminationQuality> local_44 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_ReflectionQuality> local_50 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_LandscapeQuality> local_56 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_AntialiasingQuality> local_62 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_PostProcessQuality> local_68 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.GetPresetValue();
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
        TConstRawPtr<FSettingApply_ScreenMode> local_12 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_Resolution> local_18 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_DisplayDevice> local_24 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_FrameRateLimit> local_30 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_VSync> local_36 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_UpscalingMethod> local_42 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_FrameGeneration> local_48 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_UpscaleQuality> local_54 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_Gamma> local_60 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_QualityPreset> local_66 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_FoliageQuality> local_72 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_ViewDistanceQuality> local_78 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_TextureQuality> local_84 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_EffectsQuality> local_90 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_ShadingQuality> local_96 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_ShadowQuality> local_102 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_GlobalIlluminationQuality> local_108 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_ReflectionQuality> local_114 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_LandscapeQuality> local_120 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_AntialiasingQuality> local_126 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_PostProcessQuality> local_132 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_SSAO> local_138 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_Bloom> local_144 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_MotionBlur> local_150 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_Volume> local_156 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_MusicVolume> local_162 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_SFXVolume> local_168 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_VoiceVolume> local_174 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_VoiceReceiveVolume> local_180 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_AttackLockOnMode> local_186 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_CameraYawDirection> local_192 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_InvertCameraX_Axis> local_198 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_InvertCameraY_Axis> local_204 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_CameraSensitivity> local_210 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
    }
    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
    {
        TConstRawPtr<FSettingApply_CameraMode> local_216 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        return Value.Apply();
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
            TConstRawPtr<FSettingApply_ScreenMode> local_12 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            OutOptions.BuildOptions();
            return;
        }
        else
        {
            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
            {
                TConstRawPtr<FSettingApply_Resolution> local_18 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                OutOptions.BuildOptions();
                return;
            }
            else
            {
                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                {
                    TConstRawPtr<FSettingApply_DisplayDevice> local_24 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                    OutOptions.BuildOptions();
                    return;
                }
                else
                {
                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                    {
                        TConstRawPtr<FSettingApply_FrameRateLimit> local_30 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                        OutOptions.BuildOptions();
                        return;
                    }
                    else
                    {
                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                        {
                            TConstRawPtr<FSettingApply_VSync> local_36 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                            OutOptions.BuildOptions();
                            return;
                        }
                        else
                        {
                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                            {
                                TConstRawPtr<FSettingApply_UpscalingMethod> local_42 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                OutOptions.BuildOptions();
                                return;
                            }
                            else
                            {
                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                {
                                    TConstRawPtr<FSettingApply_FrameGeneration> local_48 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                    OutOptions.BuildOptions();
                                    return;
                                }
                                else
                                {
                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                    {
                                        TConstRawPtr<FSettingApply_UpscaleQuality> local_54 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                        OutOptions.BuildOptions();
                                        return;
                                    }
                                    else
                                    {
                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                        {
                                            TConstRawPtr<FSettingApply_Gamma> local_60 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                            OutOptions.BuildOptions();
                                            return;
                                        }
                                        else
                                        {
                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                            {
                                                TConstRawPtr<FSettingApply_QualityPreset> local_66 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                OutOptions.BuildOptions();
                                                return;
                                            }
                                            else
                                            {
                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                {
                                                    TConstRawPtr<FSettingApply_FoliageQuality> local_72 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                    OutOptions.BuildOptions();
                                                    return;
                                                }
                                                else
                                                {
                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                    {
                                                        TConstRawPtr<FSettingApply_ViewDistanceQuality> local_78 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                        OutOptions.BuildOptions();
                                                        return;
                                                    }
                                                    else
                                                    {
                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                        {
                                                            TConstRawPtr<FSettingApply_TextureQuality> local_84 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                            OutOptions.BuildOptions();
                                                            return;
                                                        }
                                                        else
                                                        {
                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                            {
                                                                TConstRawPtr<FSettingApply_EffectsQuality> local_90 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                OutOptions.BuildOptions();
                                                                return;
                                                            }
                                                            else
                                                            {
                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                {
                                                                    TConstRawPtr<FSettingApply_ShadingQuality> local_96 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                    OutOptions.BuildOptions();
                                                                    return;
                                                                }
                                                                else
                                                                {
                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                    {
                                                                        TConstRawPtr<FSettingApply_ShadowQuality> local_102 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                        OutOptions.BuildOptions();
                                                                        return;
                                                                    }
                                                                    else
                                                                    {
                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                        {
                                                                            TConstRawPtr<FSettingApply_GlobalIlluminationQuality> local_108 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                            OutOptions.BuildOptions();
                                                                            return;
                                                                        }
                                                                        else
                                                                        {
                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                            {
                                                                                TConstRawPtr<FSettingApply_ReflectionQuality> local_114 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                OutOptions.BuildOptions();
                                                                                return;
                                                                            }
                                                                            else
                                                                            {
                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                {
                                                                                    TConstRawPtr<FSettingApply_LandscapeQuality> local_120 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                    OutOptions.BuildOptions();
                                                                                    return;
                                                                                }
                                                                                else
                                                                                {
                                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                    {
                                                                                        TConstRawPtr<FSettingApply_AntialiasingQuality> local_126 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                        OutOptions.BuildOptions();
                                                                                        return;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                        {
                                                                                            TConstRawPtr<FSettingApply_PostProcessQuality> local_132 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                            OutOptions.BuildOptions();
                                                                                            return;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                            {
                                                                                                TConstRawPtr<FSettingApply_SSAO> local_138 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                OutOptions.BuildOptions();
                                                                                                return;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                {
                                                                                                    TConstRawPtr<FSettingApply_Bloom> local_144 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                    OutOptions.BuildOptions();
                                                                                                    return;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                    {
                                                                                                        TConstRawPtr<FSettingApply_MotionBlur> local_150 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                        OutOptions.BuildOptions();
                                                                                                        return;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                        {
                                                                                                            TConstRawPtr<FSettingApply_Volume> local_156 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                            OutOptions.BuildOptions();
                                                                                                            return;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                            {
                                                                                                                TConstRawPtr<FSettingApply_MusicVolume> local_162 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                OutOptions.BuildOptions();
                                                                                                                return;
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                {
                                                                                                                    TConstRawPtr<FSettingApply_SFXVolume> local_168 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                    OutOptions.BuildOptions();
                                                                                                                    return;
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                    {
                                                                                                                        TConstRawPtr<FSettingApply_VoiceVolume> local_174 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                        OutOptions.BuildOptions();
                                                                                                                        return;
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                        {
                                                                                                                            TConstRawPtr<FSettingApply_VoiceReceiveVolume> local_180 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                            OutOptions.BuildOptions();
                                                                                                                            return;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                            {
                                                                                                                                TConstRawPtr<FSettingApply_AttackLockOnMode> local_186 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                                OutOptions.BuildOptions();
                                                                                                                                return;
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                {
                                                                                                                                    TConstRawPtr<FSettingApply_CameraYawDirection> local_192 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                                    OutOptions.BuildOptions();
                                                                                                                                    return;
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                    if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                    {
                                                                                                                                        TConstRawPtr<FSettingApply_InvertCameraX_Axis> local_198 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                                        OutOptions.BuildOptions();
                                                                                                                                        return;
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                        {
                                                                                                                                            TConstRawPtr<FSettingApply_InvertCameraY_Axis> local_204 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                                            OutOptions.BuildOptions();
                                                                                                                                            return;
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                            {
                                                                                                                                                TConstRawPtr<FSettingApply_CameraSensitivity> local_210 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                                                OutOptions.BuildOptions();
                                                                                                                                                return;
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                                                                                                                                                {
                                                                                                                                                    TConstRawPtr<FSettingApply_CameraMode> local_216 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                                                                                                                                                    OutOptions.BuildOptions();
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
            TConstRawPtr<FSettingApply_ScreenMode> local_12 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_Resolution> local_18 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_DisplayDevice> local_24 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_FrameRateLimit> local_30 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_VSync> local_36 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_UpscalingMethod> local_42 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_FrameGeneration> local_48 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_UpscaleQuality> local_54 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_Gamma> local_60 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_QualityPreset> local_66 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_FoliageQuality> local_72 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_ViewDistanceQuality> local_78 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_TextureQuality> local_84 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_EffectsQuality> local_90 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_ShadingQuality> local_96 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_ShadowQuality> local_102 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_GlobalIlluminationQuality> local_108 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_ReflectionQuality> local_114 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_LandscapeQuality> local_120 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_AntialiasingQuality> local_126 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_PostProcessQuality> local_132 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_SSAO> local_138 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_Bloom> local_144 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_MotionBlur> local_150 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetDefaultValue();
        }
    }
    else
    {
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_Volume> local_156 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_MusicVolume> local_162 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_SFXVolume> local_168 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_VoiceVolume> local_174 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_VoiceReceiveVolume> local_180 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_AttackLockOnMode> local_186 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_CameraYawDirection> local_192 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_InvertCameraX_Axis> local_198 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetCurrentValue();
        }
        if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
        {
            TConstRawPtr<FSettingApply_InvertCameraY_Axis> local_204 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
            return GetCurrentValue();
        }
        else
        {
            if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
            {
                TConstRawPtr<FSettingApply_CameraSensitivity> local_210 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                return GetCurrentValue();
            }
            else
            {
                if (FInstancedStruct::GetPtr(ApplyEffect).opCall())
                {
                    TConstRawPtr<FSettingApply_CameraMode> local_216 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
                    return GetCurrentValue();
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
        TConstRawPtr<FSettingApply_ScreenMode> local_12 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_13 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_Resolution> local_22 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_14 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_DisplayDevice> local_28 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_15 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_FrameRateLimit> local_34 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_13 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_VSync> local_40 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_14 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_UpscalingMethod> local_46 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_15 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_FrameGeneration> local_52 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_13 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_UpscaleQuality> local_58 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_14 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_Gamma> local_64 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_15 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_QualityPreset> local_70 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_13 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_FoliageQuality> local_76 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_14 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_ViewDistanceQuality> local_82 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_15 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_TextureQuality> local_88 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_13 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_EffectsQuality> local_94 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_14 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_ShadingQuality> local_100 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_15 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_ShadowQuality> local_106 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_13 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_GlobalIlluminationQuality> local_112 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_14 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_ReflectionQuality> local_118 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_15 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_LandscapeQuality> local_124 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_13 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_AntialiasingQuality> local_130 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_14 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_PostProcessQuality> local_136 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_15 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_SSAO> local_142 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_13 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_Bloom> local_148 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_14 = GetDefaultValue();
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
        TConstRawPtr<FSettingApply_MotionBlur> local_154 = FInstancedStruct::GetPtr(ApplyEffect).opCall();
        local_15 = GetDefaultValue();
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
