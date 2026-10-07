
const FConsoleVariable CVar_Debug_EnableFx = FConsoleVariable();

class UESMAction_PlayFX : UESMFXAction
{
    UPROPERTY()
    FSimpleSurfaceLineTraceConfig TraceConfig;
    UPROPERTY()
    bool bCheckSurfaceMaterial = false;
    UPROPERTY()
    bool bShowNameInSlot = true;


    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if (this.FXConfig.AttachRefName.Name.IsNone() || !(this.bShowNameInSlot))
        {
            return FString().Append("ж’­ж”ѕз‰№ж•€: ").Append(this.FXConfig.Asset.GetAssetName());
        }
        else
        {
            return FString().Append("<").Append(this.FXConfig.AttachRefName.Name).Append("> з‰№ж•€: ").Append(this.FXConfig.Asset.GetAssetName());
        }
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        UESMAsset::ModifyAutoCustomConfig local_4;
        UESMPreloadCustomData local_8 = local_4.opCall(this);
        if (local_8 != nullptr)
        {
            local_8.PreloadFXActors.Add(TSoftClassPtr<AFXActor>(this.FXConfig.Asset));
        }
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
}

