

class UESMAction_ToggleHitBox : UESMBPBaseSpanAction
{
    UPROPERTY()
    TArray<FEnableDisableColliderItem> HitBoxList;

    UESMAction_ToggleHitBox()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        for (auto& local_16 : this.HitBoxList)
        {
            bool local_13 = !(local_16.bColliderEnabled);
            this.SetColiderDisabled(Context.GetEntity(), local_16.ColliderName, Time.WorldTime, local_13);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        for (auto& local_16 : this.HitBoxList)
        {
            this.SetColiderDisabled(Context.GetEntity(), local_16.ColliderName, Time.WorldTime, local_16.bColliderEnabled);
        }
        return;
    }
    void SetColiderDisabled(const FECSEntity &inout Entity, const FName &inout ColliderName, const FFPTime &inout Time, const bool bColliderDisabled) const
    {
        if (!((ColliderName == NAME_None)))
        {
            if (bColliderDisabled && FCollisionUtils::IsHitBoxDisable(Entity, ColliderName, Time))
            {
                XError(ELog(5), FString().Append("HitBox '").Append(ColliderName).Append("' is already disabled, don't disable repeatedly, Action: '").Append(this.GetDataPathName()).Append("' "));
                return;
            }
            FCollisionUtils::DisableHitBox(Entity, ColliderName, Time, bColliderDisabled);
        }
        return;
    }
}

