
enum ELightFollowSource
{
    MainLight,
    TODCurve,
}


class ULightDistanceComponent : UActorComponent
{
    UPROPERTY()
    float32 StartDistance;
    UPROPERTY()
    float32 EndDistance;
    UPROPERTY()
    FRuntimeFloatCurve IntensityCurve;
    UPROPERTY()
    bool bEnableFollow;
    UPROPERTY()
    ELightFollowSource FollowSource;
    UPROPERTY()
    bool bFollowIntensity;
    UPROPERTY()
    bool bFollowColor;
    UPROPERTY()
    FRuntimeFloatCurve TODIntensityCurve;
    UPROPERTY()
    FRuntimeCurveLinearColor TODColorCurve;
    UPROPERTY()
    FLinearColor BaseColor;
    ULightComponent CachedLightComp;
    UDirectionalLightComponent CachedSunComp;
    float32 BaseSunIntensity;
    UPROPERTY()
    bool bBaseColorCached;
    UPROPERTY()
    bool bColorModified;
    UPROPERTY()
    bool bFollowColorStateInitialized;
    UPROPERTY()
    bool bLastEnableFollow;
    UPROPERTY()
    bool bLastFollowColor;
    UPROPERTY()
    ELightFollowSource LastFollowSource;
    UPROPERTY()
    bool bFollowIntensityStateInitialized;
    UPROPERTY()
    bool bLastEnableFollowForIntensity;
    UPROPERTY()
    bool bLastFollowIntensity;
    UPROPERTY()
    ELightFollowSource LastIntensityFollowSource;

    ULightDistanceComponent()
    {
        this.StartDistance = 5000.0f;
        this.EndDistance = 1000.0f;
        this.IntensityCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
        this.bEnableFollow = false;
        this.FollowSource = ELightFollowSource(0);
        this.bFollowIntensity = true;
        this.bFollowColor = true;
        this.TODIntensityCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
        this.BaseSunIntensity = 0.0f;
        this.bBaseColorCached = false;
        this.bColorModified = false;
        this.bFollowColorStateInitialized = false;
        this.bLastEnableFollow = false;
        this.bLastFollowColor = false;
        this.LastFollowSource = ELightFollowSource(0);
        this.bFollowIntensityStateInitialized = false;
        this.bLastEnableFollowForIntensity = false;
        this.bLastFollowIntensity = false;
        this.LastIntensityFollowSource = ELightFollowSource(0);
        this.SetbTickInEditor(true);
        return;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        this.EnsureLightComp();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const float32 DeltaTime)
    {
        this.UpdateLight();
        return;
    }
    AKLWeatherManager GetWeatherManager()
    {
        TArray<AKLWeatherManager> local_4;
        GetAllActorsOfClass(local_4);
        if (local_4.Num() == 0)
        {
            AKLWeatherManager local_10;
            return local_10;
        }
        return local_4[0];
    }
    void CacheBaseColorFromCurrentLight()
    {
        if (this.CachedLightComp == nullptr)
        {
            return;
        }
        this.BaseColor = this.CachedLightComp.GetLightColor();
        this.bBaseColorCached = true;
        return;
    }
    void EnsureLightComp()
    {
        if (this.CachedLightComp != nullptr)
        {
            return;
        }
        ALight local_6 = (Cast<ALight>(this.GetOwner()));
        if (local_6 != nullptr)
        {
            this.CachedLightComp = local_6.LightComponent;
        }
        if ((this.CachedLightComp != nullptr && !(this.bBaseColorCached)))
        {
            this.CacheBaseColorFromCurrentLight();
        }
        return;
    }
    void EnsureSunComp()
    {
        AKLWeatherManager local_2 = this.GetWeatherManager();
        if ((local_2 == nullptr || ((local_2.DirectionalLightComponent == nullptr))))
        {
            return;
        }
        UDirectionalLightComponent local_12 = local_2.DirectionalLightComponent;
        if (this.CachedSunComp != local_12)
        {
            this.CachedSunComp = local_12;
            this.BaseSunIntensity = FMath::Max(this.CachedSunComp.Intensity, 0.001f);
            return;
        }
        if (this.BaseSunIntensity <= 0.0f)
        {
            this.BaseSunIntensity = FMath::Max(this.CachedSunComp.Intensity, 0.001f);
        }
        return;
    }
    void CacheBaseSunIntensityFromCurrentSun()
    {
        this.EnsureSunComp();
        if (this.CachedSunComp == nullptr)
        {
            return;
        }
        this.BaseSunIntensity = FMath::Max(this.CachedSunComp.Intensity, 0.001f);
        return;
    }
    bool TryGetCameraLocation(FVector &inout OutLocation) const
    {
        if (this.GetWorld() == nullptr)
        {
            return false;
        }
        APlayerCameraManager local_8 = Gameplay::GetPlayerCameraManager(__GetWorldContext(), 0);
        if (local_8 == nullptr)
        {
            return false;
        }
        OutLocation = local_8.GetCameraLocation();
        return true;
    }
    float32 ComputeDistanceMultiplier() const
    {
        FVector local_6;
        if (!(this.TryGetCameraLocation(local_6)))
        {
            return 1.0f;
        }
        float32 local_8 = float32(((local_6 - this.GetOwner().GetActorLocation()).Size()));
        if (this.StartDistance > this.EndDistance)
        {
            float32 local_27_2 = FMath::Clamp((local_8 - this.EndDistance) / (this.StartDistance - this.EndDistance), 0.0f, 1.0f);
            return this.IntensityCurve.GetFloatValue(local_27_2, 0.0f);
        }
        return 1.0f;
    }
    bool TryGetCurrentDayAlpha(float32 &inout OutAlpha)
    {
        float32 local_11 = 0.0f;
        UWorld local_2 = this.GetWorld();
        if (local_2 == nullptr)
        {
            return false;
        }
        if (this.GetWeatherManager() != nullptr)
        {
            OutAlpha = FMath::Clamp((KLWeather::KLWeather_GetVisualTimeInHours(__GetWorldContext()) / 24.0f), 0.0f, 1.0f);
            return true;
        }
        if (!(local_2.IsGameWorld()))
        {
            return false;
        }
        int local_19 = ::FTimeOfDayUtils::GetCurrentTimeOfDayInSeconds();
        local_11 = 0.0f;
        OutAlpha = FMath::Clamp((::FTimeOfDayUtils::GetTimeOfDayInHoursClamp24(local_19) / 24.0f), 0.0f, 1.0f);
        return true;
    }
    float32 ComputeFollowIntensity()
    {
        if (int(this.FollowSource) == 0)
        {
            this.EnsureSunComp();
            if ((this.CachedSunComp == nullptr || (this.BaseSunIntensity <= 0.0f)))
            {
                return 1.0f;
            }
            else
            {
                return (this.CachedSunComp.Intensity / this.BaseSunIntensity);
            }
        }
        else
        {
            float32 local_10 = 0.0f;
            if (!(this.TryGetCurrentDayAlpha(local_10)))
            {
                return 1.0f;
            }
            else
            {
                return this.TODIntensityCurve.GetFloatValue(local_10, 0.0f);
            }
        }
    }
    FLinearColor GetSunColorWithTemperature() const
    {
        FLinearColor local_8 = this.CachedSunComp.GetLightColor();
        if (this.CachedSunComp.GetbUseTemperature())
        {
            local_8 *= FLinearColor::MakeFromColorTemperature(this.CachedSunComp.GetTemperature());
        }
        return local_8;
    }
    void ApplyFollowColor()
    {
        FLinearColor local_4;
        if (int(this.FollowSource) == 0)
        {
            this.EnsureSunComp();
            if (this.CachedSunComp == nullptr)
            {
                return;
            }
            FLinearColor local_18 = this.GetSunColorWithTemperature();
            local_4 = FLinearColor((this.BaseColor.R * local_18.R), (this.BaseColor.G * local_18.G), (this.BaseColor.B * local_18.B), int(this.BaseColor.A));
        }
        else
        {
            float32 local_24 = 0.0f;
            if (!(this.TryGetCurrentDayAlpha(local_24)))
            {
                return;
            }
            local_4 = this.TODColorCurve.GetLinearColorValue(local_24);
        }
        this.CachedLightComp.SetLightColor(local_4, true);
        this.bColorModified = true;
        return;
    }
    void RestoreColorIfNeeded()
    {
        if ((this.bColorModified && this.bBaseColorCached))
        {
            this.CachedLightComp.SetLightColor(this.BaseColor, true);
            this.bColorModified = false;
        }
        return;
    }
    void UpdateFollowColorState()
    {
        bool local_2 = this.bEnableFollow && this.bFollowColor;
        if (!(this.bFollowColorStateInitialized))
        {
            if (!(local_2) && !(this.bColorModified))
            {
                this.CacheBaseColorFromCurrentLight();
            }
            this.bFollowColorStateInitialized = true;
            this.bLastEnableFollow = this.bEnableFollow;
            this.bLastFollowColor = this.bFollowColor;
            this.LastFollowSource = this.FollowSource;
            return;
        }
        bool local_1 = this.bLastEnableFollow && this.bLastFollowColor;
        bool local_3 = local_2 && local_1 && (int(this.FollowSource) != int(this.LastFollowSource));
        bool local_5 = (!(local_2) != !(local_1));
        if ((local_5 && local_2 && !(this.bColorModified)))
        {
            this.CacheBaseColorFromCurrentLight();
        }
        if (local_3 || local_5)
        {
            this.RestoreColorIfNeeded();
        }
        if ((!(local_2) && !(this.bColorModified)))
        {
            this.CacheBaseColorFromCurrentLight();
        }
        this.bLastEnableFollow = this.bEnableFollow;
        this.bLastFollowColor = this.bFollowColor;
        this.LastFollowSource = this.FollowSource;
        return;
    }
    void UpdateFollowIntensityState()
    {
        bool local_2 = this.bEnableFollow && this.bFollowIntensity && (int(this.FollowSource) == 0);
        if (!(this.bFollowIntensityStateInitialized))
        {
            if (!(local_2) && (int(this.FollowSource) == 0))
            {
                this.CacheBaseSunIntensityFromCurrentSun();
            }
            this.bFollowIntensityStateInitialized = true;
            this.bLastEnableFollowForIntensity = this.bEnableFollow;
            this.bLastFollowIntensity = this.bFollowIntensity;
            this.LastIntensityFollowSource = this.FollowSource;
            return;
        }
        bool local_3 = this.bLastEnableFollowForIntensity && this.bLastFollowIntensity && (int(this.LastIntensityFollowSource) == 0);
        bool local_1 = (!(local_2) != !(local_3));
        if (((local_1 && local_2)) || (!(local_2) && (int(this.FollowSource) == 0)))
        {
            this.CacheBaseSunIntensityFromCurrentSun();
        }
        this.bLastEnableFollowForIntensity = this.bEnableFollow;
        this.bLastFollowIntensity = this.bFollowIntensity;
        this.LastIntensityFollowSource = this.FollowSource;
        return;
    }
    void UpdateLight()
    {
        this.EnsureLightComp();
        if (this.CachedLightComp == nullptr)
        {
            return;
        }
        this.UpdateFollowColorState();
        this.UpdateFollowIntensityState();
        float32 local_5 = this.ComputeDistanceMultiplier();
        if (this.bEnableFollow)
        {
            if (this.bFollowIntensity)
            {
                local_5 = local_5 * this.ComputeFollowIntensity();
            }
            if (this.bFollowColor)
            {
                this.ApplyFollowColor();
            }
            else
            {
                this.RestoreColorIfNeeded();
            }
        }
        else
        {
            this.RestoreColorIfNeeded();
        }
        this.CachedLightComp.SetIntensityMultiplier(local_5);
        return;
    }
    UFUNCTION()
    void SetStartDistanceFromCamera()
    {
        return;
    }
    UFUNCTION()
    void SetEndDistanceFromCamera()
    {
        return;
    }
    UFUNCTION()
    void RestoreLightColor()
    {
        return;
    }
}

