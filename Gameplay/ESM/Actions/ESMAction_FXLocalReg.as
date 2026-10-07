

// NOTE: class defaults are not authored in this module: UESMAction_PlayFXLocalReg (default scalar field UESMAction.ActionFilterType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_PlayFXLocalReg : UESMAction_PlayFX
{
    UESMAction_PlayFXLocalReg()
    {
        super();
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if (this.FXConfig.AttachRefName.Name.IsNone() || !(this.bShowNameInSlot))
        {
            return FString().Append("ж’­ж”ѕз‰№ж•€(йЂ‚з”ЁдєЋAccountExclusiveProp): ").Append(this.FXConfig.Asset.GetAssetName());
        }
        else
        {
            return FString().Append("<").Append(this.FXConfig.AttachRefName.Name).Append("> з‰№ж•€(йЂ‚з”ЁдєЋAccountExclusiveProp): ").Append(this.FXConfig.Asset.GetAssetName());
        }
    }
    UFUNCTION()
    FECSEntity GetOwnerEntity_Implementation(const FESMViewContext &inout Context) const
    {
        Get local_4;
        const FC_LocalToDefault& local_6 = local_4.opCall();
        if (local_6)
        {
            return FECSEntity(local_6.DefaultEntityId);
        }
        return ENTITY_NULL;
    }
}

