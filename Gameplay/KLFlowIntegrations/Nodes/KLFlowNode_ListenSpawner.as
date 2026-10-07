

// NOTE: class defaults are not authored in this module: FKLFlowNode_ListenSpawner (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

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

    FKLFlowNode_ListenSpawner()
    {
        this.SubscriptionHandleMonsterDeath = 0;
        this.SubscriptionHandleNewMonsterReady = 0;
        this.__InitDefaults();
        return;
    }
    void OnBuild_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
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
        bool local_20 = false;
        if (!(this.ConsumeEvent(SubscriptionHandle, local_4)))
        {
            return false;
        }
        FInstancedStruct::GetPtr local_10;
        if (!(local_10.opCall()))
        {
            return false;
        }
        if (this.LevelUnitRef.IsValid())
        {
            FECSEntity local_18;
            bool local_5 = !(::KLFlowLibrary::GetEntityByLevelUnitRef(this.LevelUnitRef, local_18));
            if (local_5)
            {
                local_5 = true;
            }
            else
            {
                FECSEntityId local_19 = local_18.GetId();
                local_20 = !local_20;
                local_5 = local_20;
            }
            if (local_5)
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
        int local_10 = 0;
        if (!(FInstancedStruct::GetPtr<FKLFlowNodeMemory_ListenSpawner>(InSnapshot.Memory).opCall()))
        {
            return;
        }
        this.SubscriptionHandleMonsterDeath = local_10;
        this.SubscriptionHandleNewMonsterReady = local_10;
        return;
    }
}

