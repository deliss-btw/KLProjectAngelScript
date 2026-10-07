

class UESMAction_SetAnimDataSpanTime : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarFloat VarName;

    UESMAction_SetAnimDataSpanTime()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FNameHandle_EntityBBVar local_4;
        local_4;
        if (Context.GetEntity().HasEntityBB(local_4))
        {
            FNameHandle_EntityBBVarFloat local_22;
            FFPTime local_8 = FFPTime(Time.ActionDuration);
            if (local_8.opCmp(0.0) < 0)
            {
            }
            else
            {
                float local_14_2 = (FFPTime(Time.ActionTime) / Time.ActionDuration);
            }
            local_22;
            Context.GetEntity().SetBB_Float(local_22, this.VarName.Name);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FNameHandle_EntityBBVar local_4;
        local_4;
        Context.GetEntity().ResetBB_Value(local_4);
        return;
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
}

