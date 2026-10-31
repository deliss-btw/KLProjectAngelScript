struct FKLFlowEvent_SpawnerMonster : FKLFlowParameterValue
{
    UPROPERTY()
    FECSEntityId SpawnerEntityId;
    UPROPERTY()
    FECSEntityId MonsterEntityId;

    FKLFlowEvent_SpawnerMonster()
    {
        return;
    }
}

struct FKLFlowNodeMemory_ListenSpawner
{
    UPROPERTY()
    int HandleMonsterDeath = 0;
    UPROPERTY()
    int HandleNewMonsterReady = 0;

}

struct FKLFlowNode_ListenSpawner : FKLFlowNode
{
    FKLFlowNode _base_FKLFlowNode;
    UPROPERTY()
    FKLFlowLevelUnitRef LevelUnitRef;
    UPROPERTY()
    FKLFlowEvent_SpawnerMonster MonsterInfo;
    UPROPERTY()
    int SubscriptionHandleMonsterDeath;
    UPROPERTY()
    int SubscriptionHandleNewMonsterReady;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FKLFlowNode_ListenSpawner.Get());

    FKLFlowNode_ListenSpawner()
    {
        this.SubscriptionHandleMonsterDeath = 0;
        this.SubscriptionHandleNewMonsterReady = 0;
        this.__InitDefaults();
        return;
    }
    void OnBuild_Implementation()
    {
        this.bIsEntryNode = true;
        this.OutputPins = {n"OnMonsterDeath", n"OnNewMonsterReady"};
        return;
    }
    void OnInit_Implementation()
    {
        this.SubscriptionHandleMonsterDeath = this.SubscribeEvent(KLFlowEventTags::Level_MonsterDeath, n"OnMonsterDeath");
        this.SubscriptionHandleNewMonsterReady = this.SubscribeEvent(KLFlowEventTags::Level_NewMonsterReady, n"OnNewMonsterReady");
        return;
    }
    void OnExec_Implementation(const FName &inout PinName)
    {
        if ((PinName == n"OnMonsterDeath"))
        {
            FKLFlowEvent_SpawnerMonster local_4;
            if (this.TryConsumeSpawnerEvent(this.SubscriptionHandleMonsterDeath, local_4))
            {
                this.TriggerOutput(n"OnMonsterDeath", false);
            }
            return;
        }
        else
        {
            if ((PinName == n"OnNewMonsterReady"))
            {
                FKLFlowEvent_SpawnerMonster local_4;
                if (this.TryConsumeSpawnerEvent(this.SubscriptionHandleNewMonsterReady, local_4))
                {
                    this.TriggerOutput(n"OnNewMonsterReady", false);
                }
                return;
            }
        }
    }
    bool TryConsumeSpawnerEvent(const int SubscriptionHandle, FKLFlowEvent_SpawnerMonster &inout OutEvent)
    {
        FInstancedStruct local_4;
        if (!(this.ConsumeEvent(SubscriptionHandle, local_4)))
        {
            return false;
        }
        FInstancedStruct::GetPtr local_10;
        TConstRawPtr<FKLFlowEvent_SpawnerMonster> local_12 = local_10.opCall();
        if (!(local_12))
        {
            return false;
        }
        if (this.LevelUnitRef.IsValid())
        {
            FECSEntity local_18;
            if (!(::KLFlowLibrary::GetEntityByLevelUnitRef(this.LevelUnitRef, local_18)) || !((local_18.GetId() == local_12.Get().SpawnerEntityId)))
            {
                return false;
            }
        }
        return true;
    }
    void OnQuit_Implementation()
    {
        if (this.SubscriptionHandleMonsterDeath != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandleMonsterDeath);
            this.SubscriptionHandleMonsterDeath = 0;
        }
        if (this.SubscriptionHandleNewMonsterReady != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandleNewMonsterReady);
            this.SubscriptionHandleNewMonsterReady = 0;
        }
        return;
    }
    void OnSave_Implementation(FKLFlowNodeSnapshot &inout OutSnapshot)
    {
        FKLFlowNodeMemory_ListenSpawner local_2;
        local_2.HandleMonsterDeath = this.SubscriptionHandleMonsterDeath;
        local_2.HandleNewMonsterReady = this.SubscriptionHandleNewMonsterReady;
        OutSnapshot.Memory = FInstancedStruct::Make(local_2);
        return;
    }
    void OnLoad_Implementation(const FKLFlowNodeSnapshot &inout InSnapshot)
    {
        TConstRawPtr<FKLFlowNodeMemory_ListenSpawner> local_6 = FInstancedStruct::GetPtr<FKLFlowNodeMemory_ListenSpawner>(InSnapshot.Memory).opCall();
        if (!(local_6))
        {
            return;
        }
        this.SubscriptionHandleMonsterDeath = local_6.Get().HandleMonsterDeath;
        this.SubscriptionHandleNewMonsterReady = local_6.Get().HandleNewMonsterReady;
        return;
    }
}

