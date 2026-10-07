

struct FESMDisableAllColliderInstanceData
{
    UPROPERTY()
    bool bHasSetActorEnableCollision = false;


}

class UESMAction_DisableAllCollider : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bIgnoreCollisionCollider = true;
    UPROPERTY()
    bool bIgnoreMovementCollider = true;
    UPROPERTY()
    bool bIgnoreLogicCollider = true;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMDisableAllColliderInstanceData);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        if (this.bIgnoreMovementCollider)
        {
            local_8.SetCounter((local_8.GetCounter() + 1));
        }
        if (this.bIgnoreLogicCollider)
        {
            FCollisionUtils::DisableAllPushCollider(Context.GetEntity(), Time.WorldTime, true);
            FCollisionUtils::DisableAllHitBox(Context.GetEntity(), Time.WorldTime, true);
        }
        return;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bIgnoreCollisionCollider)
        {
            FECSActorProxy local_6 = Context.GetEntity().ModifyActor();
            if (local_6)
            {
                local_6.SetCollisionEnable(false);
                this.ModifyViewInstanceData(Context).bHasSetActorEnableCollision = true;
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        if (this.bIgnoreMovementCollider)
        {
            if (local_8)
            {
                local_8.SetCounter((local_8.GetCounter() - 1));
            }
        }
        if (this.bIgnoreLogicCollider)
        {
            FCollisionUtils::IsAllPushColliderDisable(Context.GetEntity(), Time.WorldTime);
            FCollisionUtils::DisableAllPushCollider(Context.GetEntity(), Time.WorldTime, false);
            FCollisionUtils::IsAllHitBoxDisable(Context.GetEntity(), Time.WorldTime);
            FCollisionUtils::DisableAllHitBox(Context.GetEntity(), Time.WorldTime, false);
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bIgnoreCollisionCollider)
        {
            FECSActorProxy local_6 = Context.GetEntity().ModifyActor();
            if (local_6)
            {
                FESMDisableAllColliderInstanceData& local_12 = this.ModifyViewInstanceData(Context);
                if (local_12.bHasSetActorEnableCollision)
                {
                    local_6.SetCollisionEnable(true);
                    local_12.bHasSetActorEnableCollision = false;
                }
            }
        }
        return;
    }
    const FESMDisableAllColliderInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMDisableAllColliderInstanceData __r;
        return __r;
    }
    FESMDisableAllColliderInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMDisableAllColliderInstanceData __r;
        return __r;
    }
}

