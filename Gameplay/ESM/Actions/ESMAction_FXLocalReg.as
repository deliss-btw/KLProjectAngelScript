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
            return FString().Append("播放特效(适用于AccountExclusiveProp): ").Append(this.FXConfig.Asset.GetAssetName());
        }
        else
        {
            return FString().Append("<").Append(this.FXConfig.AttachRefName.Name).Append("> 特效(适用于AccountExclusiveProp): ").Append(this.FXConfig.Asset.GetAssetName());
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

