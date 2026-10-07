

class UESMAction_MonsterCommonThrow : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity CatchSuccessEntityBBVar;
    UPROPERTY()
    bool bCanCatchMonsterPrefab = true;
    UPROPERTY()
    bool bCanCatchAvatarPrefab = true;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_24 = 0;
        Context.GetEntity().SetBB_Entity(this.CatchSuccessEntityBBVar, ENTITY_NULL);
        FNameHandle_EntityBBVarBool local_4;
        local_4;
        Context.GetEntity().SetBB_Bool(local_4, MonsterThrowDetectUtils::MonsterCatchSuccBBVar);
        local_24.SetTargetEntity(Context.GetEntity().GetBB_Entity(this.TargetEntityBBVar));
        local_24.SetCatchSuccessEntityBBVar(this.CatchSuccessEntityBBVar);
        local_24.SetbCanCatchMonsterPrefab(this.bCanCatchMonsterPrefab);
        local_24.SetbCanCatchAvatarPrefab(this.bCanCatchAvatarPrefab);
        FNameHandle_EntityBBVar local_32;
        local_32;
        if (Context.GetEntity().HasEntityBB(local_32))
        {
            local_4;
            Context.GetEntity().SetBB_Bool(local_4, MonsterThrowDetectUtils::MonsterCatchTargetLostBBVar);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

