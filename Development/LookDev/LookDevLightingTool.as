
enum ELookDevLightingMode
{
    AssetReview,
    TOD,
}

enum ELookDevAssetReviewLighting
{
    LowContrast,
    MediumContrast,
    HighContrast,
}

enum ELookDevTODLighting
{
    CloudyDay,
    CloudyNight,
    OvercastDay,
    OvercastNight,
}


class AKLLookDevLightingTool : AKLEditorTickableActor
{
    UPROPERTY()
    USceneComponent Root;
    UPROPERTY()
    UDirectionalLightComponent DirectionalLightComponent;
    UPROPERTY()
    USkyLightComponent SkyLightComponent;
    UPROPERTY()
    UStaticMeshComponent BackgroundMesh;
    UPROPERTY()
    UStaticMeshComponent PlaneMesh;
    UPROPERTY()
    USceneComponent CalibratorMeshes;
    UPROPERTY()
    UPostProcessComponent PostProcessComponent;
    UPROPERTY()
    UPostProcessComponent PBRCheckerComponent;
    UPROPERTY()
    ELookDevLightingMode LightingMode;
    UPROPERTY()
    ELookDevAssetReviewLighting AssetReviewLightingType;
    UPROPERTY()
    bool bShowBackground;
    UPROPERTY()
    bool bShowPlane;
    UPROPERTY()
    bool bShowCalibrator;
    UPROPERTY()
    bool bUsePBRChecker;
    UPROPERTY()
    float32 SkyLightIntensityLow;
    UPROPERTY()
    float32 SkyLightIntensityMedium;
    UPROPERTY()
    float32 SkyLightIntensityHigh;
    UPROPERTY()
    ELookDevTODLighting TODLightingType;
    UPROPERTY()
    bool bShowCloudShadow;
    UPROPERTY()
    bool bShowFillLights;
    UPROPERTY()
    bool bShowPlaneInTOD;
    UPROPERTY()
    float32 NorthDirectionOffset;
    UPROPERTY()
    float32 SkyLightIntensityMultiplier;
    UPROPERTY()
    bool bNeedResetLighting;

    AKLLookDevLightingTool()
    {
        this.LightingMode = ELookDevLightingMode(1);
        this.AssetReviewLightingType = ELookDevAssetReviewLighting(1);
        this.bShowBackground = true;
        this.bShowPlane = false;
        this.bShowCalibrator = false;
        this.bUsePBRChecker = false;
        this.SkyLightIntensityLow = 2.5f;
        this.SkyLightIntensityMedium = 1.2f;
        this.SkyLightIntensityHigh = 0.42f;
        this.TODLightingType = ELookDevTODLighting(0);
        this.bShowCloudShadow = false;
        this.bShowFillLights = true;
        this.bShowPlaneInTOD = true;
        this.NorthDirectionOffset = 0.0f;
        this.SkyLightIntensityMultiplier = 1.0f;
        this.bNeedResetLighting = true;
        this.PBRCheckerComponent.SetVisibility(false, false);
        this.bNeedResetLighting = true;
        this.BackgroundMesh.SetAffectDistanceFieldLighting(false);
        this.BackgroundMesh.SetAffectDynamicIndirectLighting(false);
        this.BackgroundMesh.SetCastShadow(false);
        return;
    }
    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        return;
    }
    UFUNCTION()
    void EditorPostEditChange_Implementation()
    {
        this.bNeedResetLighting = true;
        return;
    }
    UFUNCTION()
    void EditorTick_Implementation(const float32 DeltaTime)
    {
        if (this.bNeedResetLighting)
        {
            this.SetupLightingByCurrentConfig();
        }
        return;
    }
    UFUNCTION()
    void MarkLightingStateDirty()
    {
        this.bNeedResetLighting = true;
        return;
    }
    UFUNCTION()
    void MarkLightingShowStatesDirty()
    {
        this.UpdateShowStates();
        return;
    }
    void SetupLightingByCurrentConfig()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SetupAssetReviewLighting()
    {
        switch (int(this.AssetReviewLightingType))
        {
        case 0:
        {
            this.DirectionalLightComponent.SetIntensity(0.8f);
            this.DirectionalLightComponent.SetLightSourceAngle(50.0f);
            this.DirectionalLightComponent.SetLightSourceSoftAngle(50.0f);
            this.DirectionalLightComponent.SetWorldRotation(FRotator(-71.0, -110.0, 0.0));
            this.SkyLightComponent.SetIntensity(this.SkyLightIntensityLow);
            break;
        }
        case 1:
        {
            this.DirectionalLightComponent.SetIntensity(2.3f);
            this.DirectionalLightComponent.SetLightSourceAngle(20.0f);
            this.DirectionalLightComponent.SetLightSourceSoftAngle(10.0f);
            this.DirectionalLightComponent.SetWorldRotation(FRotator(-45.0, -110.0, 0.0));
            this.SkyLightComponent.SetIntensity(this.SkyLightIntensityMedium);
            break;
        }
        case 2:
        {
            this.DirectionalLightComponent.SetIntensity(7.0f);
            this.DirectionalLightComponent.SetLightSourceAngle(0.5f);
            this.DirectionalLightComponent.SetLightSourceSoftAngle(0.0f);
            this.DirectionalLightComponent.SetWorldRotation(FRotator(-60.0, -110.0, 0.0));
            this.SkyLightComponent.SetIntensity(this.SkyLightIntensityHigh);
            break;
        }
        }
        this.UpdateBackGroundMID();
        return;
    }
    void UpdateBackGroundMID()
    {
        float32 local_16;
        float32 local_19;
        UMaterialInterface local_6 = this.BackgroundMesh.GetMaterial(0);
        UMaterialInstanceDynamic local_10 = (Cast<UMaterialInstanceDynamic>(local_6));
        if (local_10 == nullptr)
        {
            local_10 = Material::CreateDynamicMaterialInstance(__GetWorldContext(), local_6, NAME_None, EMIDCreationFlags(0));
            this.BackgroundMesh.SetMaterial(0, local_10);
        }
        if (local_10 != nullptr)
        {
            if (int(this.AssetReviewLightingType) == 2)
            {
                local_19 = 0.05f;
            }
            else
            {
                local_19 = 0.09f;
            }
            local_10.SetScalarParameterValue(n"Far Value", local_19);
            local_10.SetScalarParameterValue(n"Mask Radius", 10000.0f);
            if (this.bUsePBRChecker)
            {
                local_16 = 1.0f;
            }
            else
            {
                local_16 = 0.0f;
            }
            local_10.SetScalarParameterValue(n"PBR Check", local_16);
        }
        return;
    }
    void SetupTODLighting()
    {
        KLWeather::KLWeather_CreateWeatherManager(__GetWorldContext());
        switch (int(this.TODLightingType))
        {
        case 0:
        {
            KLWeather::KLWeather_SetWeather(__GetWorldContext(), n"HG_Cloudy_TOD_Lookdev", 32400.0f, 0.0f, true);
            return;
        }
        case 1:
        {
            KLWeather::KLWeather_SetWeather(__GetWorldContext(), n"HG_Cloudy_TOD_Lookdev", 75600.0f, 0.0f, true);
            return;
        }
        case 2:
        {
            KLWeather::KLWeather_SetWeather(__GetWorldContext(), n"HG_Overcast_TOD_Standard", 32400.0f, 0.0f, true);
            return;
        }
        case 3:
        {
            KLWeather::KLWeather_SetWeather(__GetWorldContext(), n"HG_Overcast_TOD_Standard", 75600.0f, 0.0f, true);
            return;
        }
        }
        return;
    }
    void UpdateShowStates()
    {
        if (int(this.LightingMode) == 0)
        {
            int local_6;
            this.DirectionalLightComponent.SetVisibility(true, false);
            this.SkyLightComponent.SetVisibility(true, false);
            this.BackgroundMesh.SetVisibility(this.bShowBackground, false);
            this.PlaneMesh.SetVisibility(this.bShowPlane, false);
            if (this.bShowPlane)
            {
                int local_7;
                local_7 = 3;
                local_6 = local_7;
            }
            else
            {
                int local_7;
                local_7 = 0;
                local_6 = local_7;
            }
            this.PlaneMesh.SetCollisionEnabled(ECollisionEnabled(local_6));
            this.CalibratorMeshes.SetVisibility(this.bShowCalibrator, true);
            this.PostProcessComponent.SetVisibility(true, false);
            this.PBRCheckerComponent.SetVisibility(this.bUsePBRChecker, false);
        }
        else
        {
            int local_7;
            int local_6;
            this.DirectionalLightComponent.SetVisibility(false, false);
            this.SkyLightComponent.SetVisibility(false, false);
            this.BackgroundMesh.SetVisibility(false, false);
            this.PlaneMesh.SetVisibility(this.bShowPlaneInTOD, false);
            if (this.bShowPlaneInTOD)
            {
                local_7 = 3;
                local_6 = local_7;
            }
            else
            {
                local_7 = 0;
                local_6 = local_7;
            }
            this.PlaneMesh.SetCollisionEnabled(ECollisionEnabled(local_6));
            this.CalibratorMeshes.SetVisibility(false, true);
            this.PostProcessComponent.SetVisibility(false, false);
            this.PBRCheckerComponent.SetVisibility(false, false);
        }
        if (int(this.LightingMode) == 1)
        {
            KLWeather::KLWeather_SetComponentVisibility(__GetWorldContext(), EKLWeatherVisibleComponent(1), this.bShowCloudShadow);
            KLWeather::KLWeather_SetComponentVisibility(__GetWorldContext(), EKLWeatherVisibleComponent(2), this.bShowFillLights);
            KLWeather::KLWeather_SetComponentVisibility(__GetWorldContext(), EKLWeatherVisibleComponent(3), false);
            KLWeather::KLWeather_SetNorthDirectionOffset(__GetWorldContext(), this.NorthDirectionOffset);
            KLWeather::KLWeather_SetSkyLightIntensityMultiplier(__GetWorldContext(), this.SkyLightIntensityMultiplier);
            return;
        }
        KLWeather::KLWeather_DestroyWeatherManager(__GetWorldContext());
        return;
    }
}

