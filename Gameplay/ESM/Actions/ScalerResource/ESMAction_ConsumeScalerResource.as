

class UESMAction_ConsumeScalerResource : UESMBPBaseInstantAction
{
    UPROPERTY()
    FScalerResourceConsumeConfig ScalerResourceConsumeConfig;

    UESMAction_ConsumeScalerResource()
    {
        return;
    }
    UFUNCTION()
    FECSEntity GetScalerResourceOwner_Implementation(const FECSEntity &inout ContextEntity) const
    {
        return ContextEntity;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_16 = 0;
        int local_22 = 0;
        FECSEntity local_8 = this.GetScalerResourceOwner(Context.GetEntity());
        if (local_8)
        {
            if (!(!(local_16)) && local_22)
            {
                ::FScalerResourceUtils::DealConsumeScalerResource(local_8, local_16, local_22, this.ScalerResourceConsumeConfig);
            }
        }
        return;
    }
    FECSEntity GetScalerResourceOwner(const FECSEntity &inout ContextEntity) const
    {
        __Evt_PushArgument__FECSEntity(ContextEntity);
        FECSEntity local_4;
        __Evt_PushArgumentRef__FECSEntity(local_4);
        __Evt_Execute(this, n"GetScalerResourceOwner");
        return local_4;
    }
}

