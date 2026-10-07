

class UESMAction_SetInteractionEnable : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bEnable = false;
    UPROPERTY()
    int PointIndex = -1;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FInteractUtils::SetEntityInteractTargetEnabled(Context.GetEntity(), this.bEnable, this.PointIndex);
        return;
    }
}

