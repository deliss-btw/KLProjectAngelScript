class UESMAction_InstantSFXLocalReg : UESMAction_InstantSFX
{
    UESMAction_InstantSFXLocalReg()
    {
        super();
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("播放音效(适用于AccountExclusiveProp): ").Append(this.Event.GetAssetName());
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(Super::CheckEventValied(this.Event)))
        {
            return;
        }
        FECSEntity local_10 = this.GetDefaultEntity(Context);
        if (!(local_10.IsValid()))
        {
            return;
        }
        ::FSoundSourceConfig::PostEvent(local_10, this.Event, this.SourceConfig, false, false, Context.GetWorld());
        return;
    }
    FECSEntity GetDefaultEntity(const FESMViewContext &inout Context) const
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

class UESMAction_DurationalSFXLocalReg : UESMAction_DurationalSFX
{
    UESMAction_DurationalSFXLocalReg()
    {
        super();
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("播放音效(适用于AccountExclusiveProp):Enter: ").Append(this.EnterEvent.GetAssetName()).Append(", Exit: ").Append(this.ExitEvent.GetAssetName());
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(Super::CheckEventValied(this.EnterEvent)))
        {
            return;
        }
        FECSEntity local_10 = this.GetDefaultEntity(Context);
        if (!(local_10.IsValid()))
        {
            return;
        }
        ::FSoundSourceConfig::PostEvent(local_10, this.EnterEvent, this.SourceConfig, true, false, Context.GetWorld());
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(Super::CheckEventValied(this.ExitEvent)))
        {
            return;
        }
        FECSEntity local_10 = this.GetDefaultEntity(Context);
        if (!(local_10.IsValid()))
        {
            return;
        }
        ::FSoundSourceConfig::PostEvent(local_10, this.ExitEvent, this.SourceConfig, true, true, Context.GetWorld());
        return;
    }
    FECSEntity GetDefaultEntity(const FESMViewContext &inout Context) const
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

