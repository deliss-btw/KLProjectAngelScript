class UESMAction_EntityDestroyDirectly : UESMBPBaseInstantAction
{
    UESMAction_EntityDestroyDirectly()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(3);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        ::FLifeCycleUtils::EntityDestroyDirectly(local_2, Time.WorldTime);
        return;
    }
}

