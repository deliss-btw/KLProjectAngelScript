

class AKLLevelScriptBaseActor : AKLLevelScriptActor
{
    UPROPERTY()
    bool bEnableOnLevelMonsterDeadEvent = false;


    UFUNCTION()
    void OnInitLevelScriptEntity_Implementation()
    {
        return;
    }
    UFUNCTION()
    void PreLevelBeginPlay_Implementation()
    {
        if (this.bEnableOnLevelMonsterDeadEvent)
        {
            this.RegisterLevelEventCallback(n"ReceiveDeathEvent", FCE_DeathEvent, ENTITY_NULL);
        }
        return;
    }
    UFUNCTION()
    void OnLevelMonsterDead_Implementation(const FECSEntity &inout DeadEntity, const FECSEntity &inout KilledByEntity)
    {
        return;
    }
    UFUNCTION()
    void ReceiveDeathEvent(const FCE_DeathEvent &inout DeathEvent)
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        Get local_16;
        if (local_5)
        {
            Get local_20;
            if ((local_16.opCall().GetOwnerDataLayerName() == local_20.opCall().DataLayerName))
            {
                this.OnLevelMonsterDead(DeathEvent.Sender, FECSEntity(DeathEvent.KilledByEntity));
            }
        }
        return;
    }
    void OnLevelMonsterDead(const FECSEntity &inout DeadEntity, const FECSEntity &inout KilledByEntity)
    {
        __Evt_PushArgument__FECSEntity(DeadEntity);
        __Evt_PushArgument__FECSEntity(KilledByEntity);
        __Evt_Execute(this, n"OnLevelMonsterDead");
        return;
    }
}

