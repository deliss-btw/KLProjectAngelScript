
namespace MonsterThrowDetectUtils
{
    const FName MonsterCatchSuccBBVar = n"bMonsterCatchSucc";
    const FName MonsterCatchTargetLostBBVar = n"bMonsterCatchTargetLost";
    const FName CatchedByEntityBBVar = n"tLastCatchedByEntity";

}
class US_MonsterThrowDetectSystem : UECSScriptSystem
{
    US_MonsterThrowDetectSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_MonsterThrowHandleHitEvent(const FCE_HitEvent &inout Event) const
    {
        Has local_4;
        int local_14 = 0;
        bool local_15;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (0 != 2)
        {
            return;
        }
        if (!(local_14) || local_14.GetbHasThrow())
        {
            return;
        }
        Has local_20;
        if (local_20.opCall())
        {
            local_15 = true;
        }
        else
        {
            Has local_24;
            local_15 = local_24.opCall();
        }
        if (local_15)
        {
            return;
        }
        if (Event.Receiver.MatchGameplayTag(GameplayTags::CombatState_ControlMonster))
        {
            return;
        }
        if (Event.Receiver.MatchGameplayTag(GameplayTags::CombatState_MuteCatch))
        {
            return;
        }
        EPrefabType local_26 = ::GetPrefabType(Event.Receiver);
        bool local_27 = false;
        if (local_14.GetbCanCatchAvatarPrefab() && (int(local_26) == 1))
        {
            local_27 = true;
        }
        if (local_14.GetbCanCatchMonsterPrefab() && (int(local_26) == 2))
        {
            local_27 = true;
        }
        if (!(local_27))
        {
            return;
        }
        if (!(::BlueprintFunctions_Common::CheckEntityOrControllerSame(Event.Receiver, local_14.GetTargetEntity())))
        {
            return;
        }
        local_14.SetbHasThrow(true);
        FNameHandle_EntityBBVarBool local_32;
        local_32;
        Event.Attacker.SetBB_Bool(local_32, MonsterThrowDetectUtils::MonsterCatchSuccBBVar);
        Event.Attacker.SetBB_Entity(local_14.GetCatchSuccessEntityBBVar(), Event.Receiver);
        FNameHandle_EntityBBVarEntity local_36;
        local_36;
        Event.Receiver.SetBB_Entity(local_36, MonsterThrowDetectUtils::CatchedByEntityBBVar);
        Remove local_40;
        local_40.opCall();
        return;
    }
    UFUNCTION()
    void Run_Job_MonsterThrowHandleHitEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_MonsterThrowHandleHitEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

