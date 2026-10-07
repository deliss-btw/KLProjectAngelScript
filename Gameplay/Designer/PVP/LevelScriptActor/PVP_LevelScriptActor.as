

class APVP_LevelScriptActor : AKLLevelScriptActor
{
    FName BrawlPrepStartLevelEventName = n"PVP_BRAWL_PREP_START";
    FName BrawlPrepEndLevelEventName = n"PVP_BRAWL_PREP_END";
    UPROPERTY()
    TArray<AActor> PrepBlockingActors;
    UPROPERTY()
    bool bBlockingActorsEnabled = true;


    UFUNCTION()
    void PreLevelBeginPlay_Implementation()
    {
        this.RegisterLevelEventCallback(n"OnLevelCustomEvent", FCE_CustomLevelEvent, ENTITY_NULL);
        return;
    }
    UFUNCTION()
    void ECSBeginPlayBP_Implementation()
    {
        this.EnableBlockingActors();
        return;
    }
    UFUNCTION()
    void ECSClientBeginPlay_Implementation()
    {
        this.EnableBlockingActors();
        return;
    }
    UFUNCTION()
    void OnBrawlPrepStageStart_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnBrawlPrepStageEnd_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnLevelCustomEvent(const FCE_CustomLevelEvent &inout Event)
    {
        if ((Event.CustomName == this.BrawlPrepStartLevelEventName))
        {
            this.bBlockingActorsEnabled = true;
            this.EnableBlockingActors();
            this.OnBrawlPrepStageStart();
            return;
        }
        if ((Event.CustomName == this.BrawlPrepEndLevelEventName))
        {
            this.bBlockingActorsEnabled = false;
            this.DisableBlockingActors();
            this.OnBrawlPrepStageEnd();
        }
        return;
    }
    void SyncBlockingState(const bool bShouldEnable)
    {
        if (!(bShouldEnable) == !(this.bBlockingActorsEnabled))
        {
            return;
        }
        this.bBlockingActorsEnabled = bShouldEnable;
        if (bShouldEnable)
        {
            this.EnableBlockingActors();
            this.OnBrawlPrepStageStart();
            return;
        }
        this.DisableBlockingActors();
        this.OnBrawlPrepStageEnd();
        return;
    }
    void OnBrawlPrepStageStart()
    {
        __Evt_Execute(this, n"OnBrawlPrepStageStart");
        return;
    }
    void OnBrawlPrepStageEnd()
    {
        __Evt_Execute(this, n"OnBrawlPrepStageEnd");
        return;
    }
    void EnableBlockingActors()
    {
        for (auto local_16 : this.PrepBlockingActors)
        {
            if (local_16 == nullptr)
            {
                continue;
            }
            this.SetAllPrimitiveCollision(local_16, ECollisionEnabled(3));
            if (local_16.GetRootComponent() != nullptr)
            {
                local_16.GetRootComponent().SetVisibility(true, true);
            }
        }
        return;
    }
    void DisableBlockingActors()
    {
        for (auto local_16 : this.PrepBlockingActors)
        {
            if (local_16 == nullptr)
            {
                continue;
            }
            this.SetAllPrimitiveCollision(local_16, ECollisionEnabled(0));
            if (local_16.GetRootComponent() != nullptr)
            {
                local_16.GetRootComponent().SetVisibility(false, true);
            }
        }
        return;
    }
    void SetAllPrimitiveCollision(const AActor Actor, const ECollisionEnabled CollisionType)
    {
        TArray<UPrimitiveComponent> local_4 = Actor.GetComponentsByClass(UPrimitiveComponent);
        for (auto local_24 : local_4)
        {
            local_24.SetCollisionEnabled(ECollisionEnabled(CollisionType));
        }
        return;
    }
}

