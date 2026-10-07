

// NOTE: class defaults are not authored in this module: UESMAction_InstantSFXLocalReg (default scalar field UESMAction.ActionFilterType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

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
        return FString().Append("ж’­ж”ѕйџіж•€(йЂ‚з”ЁдєЋAccountExclusiveProp): ").Append(this.Event.GetAssetName());
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
        return FString().Append("ж’­ж”ѕйџіж•€(йЂ‚з”ЁдєЋAccountExclusiveProp):Enter: ").Append(this.EnterEvent.GetAssetName()).Append(", Exit: ").Append(this.ExitEvent.GetAssetName());
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

