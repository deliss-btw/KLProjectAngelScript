
enum ELevelListeningAttributeType
{
    HP,
    MAX,
}


struct FEntityAttributeChangedCallbackContainer
{
    UPROPERTY()
    TArray<FEntityAttributeChangedDelegate> Callbacks;

    FEntityAttributeChangedCallbackContainer()
    {
        return;
    }
}

struct FLevelListeningEntityAttributes
{
    UPROPERTY()
    TMap<uint, FEntityAttributeChangedCallbackContainer> SpecificEntityAttributeChangedEvents;
    UPROPERTY()
    FEntityAttributeChangedCallbackContainer AnyEntityAttributeChangedEvents;

    FLevelListeningEntityAttributes()
    {
        return;
    }
}

struct FLevelListeningEntityCreateFinish
{
    UPROPERTY()
    FECSEntity Entiity;
    UPROPERTY()
    FEntityCreateFinishDelegate Callback;

    FLevelListeningEntityCreateFinish()
    {
        return;
    }
}

struct FLevelListeningCreatureCreateFinish
{
    UPROPERTY()
    FECSEntityId Entiity;
    UPROPERTY()
    FEntityCreateFinishDelegate Callback;

    FLevelListeningCreatureCreateFinish()
    {
        return;
    }
    void opCall() const
    {
        this.Callback.ExecuteIfBound(FECSEntity(this));
        return;
    }
}

struct FEventCallbackArray
{
    UPROPERTY()
    TArray<FStructClosure> Closure;

    FEventCallbackArray()
    {
        return;
    }
}

struct FRandomFriendNameRequestContext
{
    UPROPERTY()
    FRandomFriendNameDelegate Callback;
    UPROPERTY()
    bool bFallbackToSelfName = true;


}

struct FCGPlayFinishedCallbacksByPlayer
{
    UPROPERTY()
    TMap<uint, FCGPlayFinishedDelegate> ByPlayer;

    FCGPlayFinishedCallbacksByPlayer()
    {
        return;
    }
}

struct FESMTriggerDelegateArray
{
    UPROPERTY()
    TArray<FESMTriggerRespondedDelegate> Callbacks;

    FESMTriggerDelegateArray()
    {
        return;
    }
}

struct FESMTriggerCallbacksByName
{
    UPROPERTY()
    TMap<FName, FESMTriggerDelegateArray> ByTriggerName;

    FESMTriggerCallbacksByName()
    {
        return;
    }
}

struct FESMActionDelegateArray
{
    UPROPERTY()
    TArray<FESMActionEventDelegate> Callbacks;

    FESMActionDelegateArray()
    {
        return;
    }
}

struct FESMAsyncHandleArray
{
    UPROPERTY()
    TArray<uint> Handles;

    FESMAsyncHandleArray()
    {
        return;
    }
}

struct FESMStateCacheEntry
{
    UPROPERTY()
    TArray<int> StateIndices;

    FESMStateCacheEntry()
    {
        return;
    }
}

struct FESMAsyncHandlesByName
{
    UPROPERTY()
    TMap<FName, FESMAsyncHandleArray> ByName;

    FESMAsyncHandlesByName()
    {
        return;
    }
}

class ULevelEventManager : UScriptWorldSubsystem
{
    UPROPERTY()
    TArray<FLevelListeningEntityAttributes> LevelListeningEntityAttributes;
    UPROPERTY()
    TArray<FGameAttributeRef> AttributeTypeToRef;
    UPROPERTY()
    TArray<FGameAttributeRef> AttributeMaxTypeToRef;
    UPROPERTY()
    TArray<FLevelListeningEntityCreateFinish> LevelListeningEntityCreateFinish;
    UPROPERTY()
    TMap<uint, FObjectiveFinishDelegate> ObjectiveFinishCallbacks;
    UPROPERTY()
    TMap<TDataObjectPtr<FCGConfig>, FCGPlayFinishedCallbacksByPlayer> CGPlayFinishedCallbacks;
    UPROPERTY()
    TMap<uint, FRandomFriendNameRequestContext> RandomFriendNameRequests;
    UPROPERTY()
    TMap<FECSEntityId, FEventCallbackArray> OnCreatureCreateFinishEventMap;
    UPROPERTY()
    TMap<uint, FESMTriggerCallbacksByName> EntityESMTriggerCallbacks;
    UPROPERTY()
    TMap<FName, FESMActionDelegateArray> ESMActionEventCallbacks;
    UPROPERTY()
    TMap<uint, FESMAsyncHandlesByName> EntityESMTriggerAsyncHandles;
    UPROPERTY()
    TMap<uint, FESMAsyncHandlesByName> ESMActionAsyncHandles;
    UPROPERTY()
    TMap<uint, FESMAsyncHandleArray> EntityESMStateEntryHandles;
    UPROPERTY()
    TMap<uint, FESMAsyncHandleArray> TutorialGraphicClosedHandles;

    ULevelEventManager()
    {
        return;
    }
    UFUNCTION()
    void Initialize_Implementation()
    {
        this.LevelListeningEntityAttributes.SetNum(1);
        this.AttributeTypeToRef.SetNum(1);
        this.AttributeTypeToRef[0] = Attribute::HP;
        this.AttributeMaxTypeToRef.SetNum(1);
        this.AttributeMaxTypeToRef[0] = Attribute::HPMax;
        return;
    }
    UFUNCTION()
    void DeInitialize_Implementation()
    {
        this.LevelListeningEntityAttributes.Empty(0);
        return;
    }
    int GetAttributeTypeIdx(const FGameAttributeRef &inout AttributeRef) const
    {
        int local_1 = 0;
        for (; local_1 < this.AttributeTypeToRef.Num(); ++local_1)
        {
            if (this.AttributeTypeToRef[local_1].GetGlobalIndex() == AttributeRef.GetGlobalIndex())
            {
                return local_1;
            }
        }
        return -1;
    }
    UFUNCTION()
    void RegisterEntityAttributeChanged(const FECSEntity &inout SpecificEntity, const ELevelListeningAttributeType AttributeType, const FEntityAttributeChangedDelegate &inout Callback)
    {
        if ((SpecificEntity == ENTITY_NULL))
        {
            this.LevelListeningEntityAttributes[int(AttributeType)].AnyEntityAttributeChangedEvents.Callbacks.AddUnique(Callback);
            return;
        }
        this.LevelListeningEntityAttributes[int(AttributeType)].SpecificEntityAttributeChangedEvents.FindOrAdd(SpecificEntity.GetIdValue()).Callbacks.AddUnique(Callback);
        return;
    }
    UFUNCTION()
    void UnRegisterEntityAttributeChanged(const FECSEntity &inout SpecificEntity, const ELevelListeningAttributeType AttributeType, const FEntityAttributeChangedDelegate &inout Callback)
    {
        if ((SpecificEntity == ENTITY_NULL))
        {
            return;
        }
        int local_3 = SpecificEntity.GetIdValue();
        return;
    }
    UFUNCTION()
    void NotifyEntityAttributeChanged(const FECSEntity &inout Entity, const FGameAttributeRef &inout AttributeRef, const float32 OldValue, const float32 NewValue)
    {
        int local_36 = 0;
        FEntityAttributeChangedCallbackContainer local_56;
        int local_2 = this.GetAttributeTypeIdx(AttributeRef);
        if (local_2 == -1)
        {
            return;
        }
        float32 local_4 = 0.0f;
        float32 local_6 = 0.0f;
        FGameAttributeRef local_20 = this.AttributeMaxTypeToRef[local_2];
        if (local_20.GetGlobalIndex() > 0)
        {
            Get local_26;
            const FC_GameAttribute& local_28 = local_26.opCall();
            if (local_28)
            {
                FECSWorldPtr local_30 = Entity.GetWorld();
                float32 local_5 = local_28.GetAttributeValue(local_20, local_36.Time);
                if (local_5 != 0.0f)
                {
                    local_4 = OldValue / local_5;
                    local_6 = NewValue / local_5;
                }
            }
        }
        for (auto& local_52 : this.LevelListeningEntityAttributes[local_2].AnyEntityAttributeChangedEvents.Callbacks)
        {
            local_52.ExecuteIfBound(Entity, OldValue, NewValue, local_4, local_6);
        }
        if (this.LevelListeningEntityAttributes[local_2].SpecificEntityAttributeChangedEvents.Find(Entity.GetIdValue(), local_56))
        {
            for (auto& local_52 : local_56.Callbacks)
            {
                local_52.ExecuteIfBound(Entity, OldValue, NewValue, local_4, local_6);
            }
        }
        return;
    }
    UFUNCTION()
    void RegisterEntityEntityCreateFinishCallback(const FECSEntity &inout Entity, const FEntityCreateFinishDelegate &inout Callback)
    {
        FLevelListeningEntityCreateFinish local_8;
        local_8.Entiity = Entity;
        local_8.Callback = Callback;
        this.LevelListeningEntityCreateFinish.Add(local_8);
        return;
    }
    UFUNCTION()
    void NotifyEntityCreateFinish()
    {
        if (this.LevelListeningEntityCreateFinish.IsEmpty())
        {
            return;
        }
        for (auto& local_16 : this.LevelListeningEntityCreateFinish)
        {
            local_16.Callback.ExecuteIfBound(local_16.Entiity);
        }
        this.LevelListeningEntityCreateFinish.Reset(0);
        return;
    }
    void RegisterObjectiveFinishCallback(const uint ObjectiveInstanceId, const FObjectiveFinishDelegate &inout Callback)
    {
        this.ObjectiveFinishCallbacks.FindOrAdd(ObjectiveInstanceId) = Callback;
        return;
    }
    void NotifyObjectiveFinish(const uint ObjectiveInstanceId)
    {
        FObjectiveFinishDelegate local_4;
        if (!(this.ObjectiveFinishCallbacks.Find(ObjectiveInstanceId, local_4)))
        {
            return;
        }
        if (local_4.IsBound())
        {
            local_4.ExecuteIfBound();
        }
        return;
    }
    void RegisterRandomFriendNameCallback(const FECSEntity &inout PlayerEntity, const FRandomFriendNameRequestContext &inout Context)
    {
        int local_1 = PlayerEntity.GetIdValue();
        return;
    }
    void NotifyRandomFriendNameResult(const FECSEntity &inout PlayerEntity, const FString &inout FriendName)
    {
        FString local_4 = FriendName;
        int local_6 = PlayerEntity.GetIdValue();
        FRandomFriendNameRequestContext local_12;
        if (!(this.RandomFriendNameRequests.Find(local_6, local_12)))
        {
            return;
        }
        if (local_4.IsEmpty() && local_12.bFallbackToSelfName)
        {
            Get local_18;
            const FC_DSPlayerInfo& local_20 = local_18.opCall();
            if (local_20)
            {
                local_4 = local_20.GetNickName();
            }
        }
        if (local_12.Callback.IsBound())
        {
            local_12.Callback.ExecuteIfBound(local_4);
        }
        return;
    }
    void RegisterCGPlayFinishedCallback(const TDataObjectPtr<FCGConfig> &inout CGConfig, const FECSEntity &inout PlayerEntity, const FCGPlayFinishedDelegate &inout Callback)
    {
        if (!(CGConfig.IsSet()))
        {
            return;
        }
        int local_2 = PlayerEntity.GetIdValue();
        this.CGPlayFinishedCallbacks.FindOrAdd(CGConfig).ByPlayer.FindOrAdd(local_2) = Callback;
        return;
    }
    void NotifyCGPlayFinished(const TDataObjectPtr<FCGConfig> &inout CGConfig, const FECSEntity &inout PlayerEntity)
    {
        if (!(this.CGPlayFinishedCallbacks.Contains(CGConfig)))
        {
            return;
        }
        FCGPlayFinishedCallbacksByPlayer& local_4 = this.CGPlayFinishedCallbacks[CGConfig];
        int local_6 = PlayerEntity.GetIdValue();
        FCGPlayFinishedDelegate local_10;
        if (!(local_4.ByPlayer.Find(local_6, local_10)))
        {
            return;
        }
        if (local_10.IsBound())
        {
            local_10.ExecuteIfBound(PlayerEntity);
            if (local_4.ByPlayer.Num() == 0)
            {
            }
        }
        return;
    }
    void RegisterCreatureCreateFinishCallback(const FECSEntity &inout Entity, const FEntityCreateFinishDelegate &inout Callback)
    {
        int local_4 = 0;
        FECSEntityId local_1 = Entity.GetId();
        FLevelListeningCreatureCreateFinish local_10;
        local_10.Entiity = Entity.GetId();
        local_10.Callback = Callback;
        local_4.Closure.Add(Foundation::MakeClosure(local_10));
        return;
    }
    void NotifyCreatureCreateFinish(const FECSEntity &inout Entity)
    {
        if (this.OnCreatureCreateFinishEventMap.Contains(Entity.GetId()))
        {
            int local_4;
            FECSEntityId local_1 = Entity.GetId();
            for (auto& local_18 : local_4.Closure)
            {
                local_18.Execute();
            }
            FECSEntityId local_1_2 = Entity.GetId();
        }
        return;
    }
    UFUNCTION()
    void RegisterESMTriggerCallback(const FECSEntity &inout SpecificEntity, const FName &inout TriggerName, const FESMTriggerRespondedDelegate &inout Callback)
    {
        this.EntityESMTriggerCallbacks.FindOrAdd(SpecificEntity.GetIdValue()).ByTriggerName.FindOrAdd(TriggerName).Callbacks.AddUnique(Callback);
        return;
    }
    UFUNCTION()
    void UnRegisterESMTriggerCallback(const FECSEntity &inout SpecificEntity, const FName &inout TriggerName, const FESMTriggerRespondedDelegate &inout Callback)
    {
        if (!(this.EntityESMTriggerCallbacks.Contains(SpecificEntity.GetIdValue())))
        {
            return;
        }
        FESMTriggerCallbacksByName& local_4 = this.EntityESMTriggerCallbacks[SpecificEntity.GetIdValue()];
        if (!(local_4.ByTriggerName.Contains(TriggerName)))
        {
            return;
        }
        if (local_4.ByTriggerName[TriggerName].Callbacks.IsEmpty())
        {
        }
        if (local_4.ByTriggerName.Num() == 0)
        {
            int local_1 = SpecificEntity.GetIdValue();
        }
        return;
    }
    void NotifyESMTriggerResponded(const FECSEntity &inout Entity, const FName &inout TriggerName, const int StateMachineIndex)
    {
        this.BroadcastESMTriggerDelegates(Entity.GetIdValue(), Entity, TriggerName, StateMachineIndex);
        int local_1 = Entity.GetIdValue();
        if (local_1 != 0)
        {
            this.BroadcastESMTriggerDelegates(0, Entity, TriggerName, StateMachineIndex);
        }
        this.BroadcastESMTriggerAsyncHandles(Entity.GetIdValue(), TriggerName, Entity, StateMachineIndex);
        int local_1_2 = Entity.GetIdValue();
        if (local_1_2 != 0)
        {
            this.BroadcastESMTriggerAsyncHandles(0, TriggerName, Entity, StateMachineIndex);
        }
        return;
    }
    void BroadcastESMTriggerDelegates(const uint EntityKey, const FECSEntity &inout Entity, const FName &inout TriggerName, const int StateMachineIndex)
    {
        if (!(this.EntityESMTriggerCallbacks.Contains(EntityKey)))
        {
            return;
        }
        FESMTriggerCallbacksByName& local_4 = this.EntityESMTriggerCallbacks[EntityKey];
        if (!(local_4.ByTriggerName.Contains(TriggerName)))
        {
            return;
        }
        TArray<FESMTriggerRespondedDelegate> local_8 = local_4.ByTriggerName[TriggerName].Callbacks;
        for (auto& local_22 : local_8)
        {
            local_22.ExecuteIfBound(Entity, TriggerName, StateMachineIndex);
        }
        return;
    }
    void BroadcastESMTriggerAsyncHandles(const uint EntityKey, const FName &inout TriggerName, const FECSEntity &inout Entity, const int StateMachineIndex)
    {
        bool local_1;
        int local_24 = 0;
        int local_30 = 0;
        int local_84 = 0;
        int local_92 = 0;
        if (!(this.EntityESMTriggerAsyncHandles.Contains(EntityKey)))
        {
            return;
        }
        FESMAsyncHandlesByName& local_4 = this.EntityESMTriggerAsyncHandles[EntityKey];
        if (!(local_4.ByName.Contains(TriggerName)))
        {
            return;
        }
        FString local_8;
        Has local_12;
        if (!(local_12.opCall()))
        {
            local_1 = false;
        }
        else
        {
            Has local_16;
            local_1 = local_16.opCall();
        }
        if (local_1)
        {
            if (StateMachineIndex >= 0 && (StateMachineIndex < local_30.Player.GetSMRuntime().Num()))
            {
                UESMStateMachine local_36 = local_24.Asset.GetStateMachine(StateMachineIndex);
                if (local_36 != nullptr)
                {
                    UESMBaseState local_40 = local_36.GetBaseState(local_30.Player.GetSMRuntime()[].GetStateIndex());
                    if (local_40 != nullptr)
                    {
                        local_8 = local_40.GetDataName().ToString();
                    }
                }
            }
        }
        TArray<uint> local_50 = local_4.ByName[TriggerName].Handles;
        ULevelActorManager local_52 = ULevelActorManager::Get();
        for (auto local_67 : local_50)
        {
            FInstancedStruct local_76 = local_52.GetAsyncActionStruct(local_67);
            if (!(local_76.IsValid()))
            {
                continue;
            }
            if (local_76.Contains(FASWaitForESMTrigger))
            {
                if (local_84.MatchESMState.Len() > 0 && !((local_8 == local_84.MatchESMState)))
                {
                    continue;
                }
                local_84.OnTriggerResponded.Broadcast(local_8);
            }
            else
            {
                if (local_76.Contains(FASWaitForESMSkillTrigger))
                {
                    local_92.OnTriggerResponded.Broadcast();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void RegisterESMActionEventCallback(const FName &inout EventName, const FESMActionEventDelegate &inout Callback)
    {
        this.ESMActionEventCallbacks.FindOrAdd(EventName).Callbacks.AddUnique(Callback);
        return;
    }
    UFUNCTION()
    void UnRegisterESMActionEventCallback(const FName &inout EventName, const FESMActionEventDelegate &inout Callback)
    {
        if (!(this.ESMActionEventCallbacks.Contains(EventName)))
        {
            return;
        }
        if (this.ESMActionEventCallbacks[EventName].Callbacks.IsEmpty())
        {
        }
        return;
    }
    void NotifyESMActionEvent(const FECSEntity &inout Entity, const FName &inout EventName, const bool bIsEnter)
    {
        if (this.ESMActionEventCallbacks.Contains(EventName))
        {
            TArray<FESMActionEventDelegate> local_6 = this.ESMActionEventCallbacks[EventName].Callbacks;
            for (auto& local_20 : local_6)
            {
                local_20.ExecuteIfBound(Entity, EventName, bIsEnter);
            }
        }
        this.BroadcastESMActionAsyncHandles(Entity.GetIdValue(), EventName);
        int local_21 = Entity.GetIdValue();
        if (local_21 != 0)
        {
            this.BroadcastESMActionAsyncHandles(0, EventName);
        }
        return;
    }
    void BroadcastESMActionAsyncHandles(const uint EntityKey, const FName &inout EventName)
    {
        int local_40 = 0;
        if (!(this.ESMActionAsyncHandles.Contains(EntityKey)))
        {
            return;
        }
        FESMAsyncHandlesByName& local_4 = this.ESMActionAsyncHandles[EntityKey];
        if (!(local_4.ByName.Contains(EventName)))
        {
            return;
        }
        TArray<uint> local_8 = local_4.ByName[EventName].Handles;
        ULevelActorManager local_10 = ULevelActorManager::Get();
        for (auto local_25 : local_8)
        {
            if (local_10.GetAsyncActionStruct(local_25).IsValid())
            {
                local_40.OnActionEvent.Broadcast();
                local_40.MarkFinished();
            }
        }
        return;
    }
    void RegisterESMTriggerAsyncAction(const FECSEntity &inout SpecificEntity, const FName &inout TriggerName, const uint Handle)
    {
        this.EntityESMTriggerAsyncHandles.FindOrAdd(SpecificEntity.GetIdValue()).ByName.FindOrAdd(TriggerName).Handles.AddUnique(Handle);
        return;
    }
    void UnRegisterESMTriggerAsyncAction(const FECSEntity &inout SpecificEntity, const FName &inout TriggerName, const uint Handle)
    {
        if (!(this.EntityESMTriggerAsyncHandles.Contains(SpecificEntity.GetIdValue())))
        {
            return;
        }
        FESMAsyncHandlesByName& local_4 = this.EntityESMTriggerAsyncHandles[SpecificEntity.GetIdValue()];
        if (!(local_4.ByName.Contains(TriggerName)))
        {
            return;
        }
        if (local_4.ByName[TriggerName].Handles.IsEmpty())
        {
        }
        if (local_4.ByName.Num() == 0)
        {
            int local_1 = SpecificEntity.GetIdValue();
        }
        return;
    }
    void RegisterESMActionAsyncAction(const FECSEntity &inout SpecificEntity, const FName &inout EventName, const uint Handle)
    {
        this.ESMActionAsyncHandles.FindOrAdd(SpecificEntity.GetIdValue()).ByName.FindOrAdd(EventName).Handles.AddUnique(Handle);
        return;
    }
    void UnRegisterESMActionAsyncAction(const FECSEntity &inout SpecificEntity, const FName &inout EventName, const uint Handle)
    {
        if (!(this.ESMActionAsyncHandles.Contains(SpecificEntity.GetIdValue())))
        {
            return;
        }
        FESMAsyncHandlesByName& local_4 = this.ESMActionAsyncHandles[SpecificEntity.GetIdValue()];
        if (!(local_4.ByName.Contains(EventName)))
        {
            return;
        }
        if (local_4.ByName[EventName].Handles.IsEmpty())
        {
        }
        if (local_4.ByName.Num() == 0)
        {
            int local_1 = SpecificEntity.GetIdValue();
        }
        return;
    }
    void RegisterESMStateEntryAction(const FECSEntity &inout SpecificEntity, const uint Handle)
    {
        int local_2 = SpecificEntity.GetIdValue();
        bool local_4 = !(this.EntityESMStateEntryHandles.Contains(local_2));
        if (this.EntityESMStateEntryHandles.FindOrAdd(local_2).Handles.AddUnique(Handle) && (local_2 != 0))
        {
            Assign local_10;
            local_10.opCall(FC_ESMStateEntryListener());
        }
        return;
    }
    void UnRegisterESMStateEntryAction(const FECSEntity &inout SpecificEntity, const uint Handle)
    {
        int local_2 = SpecificEntity.GetIdValue();
        if (!(this.EntityESMStateEntryHandles.Contains(local_2)))
        {
            return;
        }
        FESMAsyncHandleArray& local_6 = this.EntityESMStateEntryHandles[local_2];
        if (local_6.Handles.IsEmpty())
        {
            if (local_2 != 0)
            {
                Remove local_12;
                local_12.opCall();
            }
        }
        return;
    }
    void HandleESMStateEntryForEntity(const FECSEntity &inout Entity, const int StateMachineIndex, const FName &inout StateName)
    {
        if (this.EntityESMStateEntryHandles.IsEmpty())
        {
            return;
        }
        int local_3 = Entity.GetIdValue();
        if (!(this.EntityESMStateEntryHandles.Contains(local_3)) && !(this.EntityESMStateEntryHandles.Contains(0)))
        {
            return;
        }
        this.BroadcastESMStateEntry(local_3, Entity, StateMachineIndex, StateName);
        if (local_3 != 0)
        {
            this.BroadcastESMStateEntry(0, Entity, StateMachineIndex, StateName);
        }
        return;
    }
    void BroadcastESMStateEntry(const uint EntityKey, const FECSEntity &inout Entity, const int StateMachineIndex, const FName &inout EnteredStateName)
    {
        bool local_1;
        int local_32 = 0;
        int local_38 = 0;
        int local_86 = 0;
        if (!(this.EntityESMStateEntryHandles.Contains(EntityKey)))
        {
            return;
        }
        FString local_10 = EnteredStateName.ToString();
        FString local_14;
        if (local_10.Len() != 0)
        {
            local_1 = false;
        }
        else
        {
            Has local_20;
            local_1 = local_20.opCall();
        }
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            Has local_26;
            local_1 = local_26.opCall();
        }
        if (local_1)
        {
            if (StateMachineIndex >= 0 && (StateMachineIndex < local_38.Player.GetSMRuntime().Num()))
            {
                UESMStateMachine local_42 = local_32.Asset.GetStateMachine(StateMachineIndex);
                if (local_42 != nullptr)
                {
                    UESMBaseState local_46 = local_42.GetBaseState(local_38.Player.GetSMRuntime()[].GetStateIndex());
                    if (local_46 != nullptr)
                    {
                        local_10 = local_46.GetDataName().ToString();
                    }
                    else
                    {
                        local_14 = FString().Append("StateNull StateIndex=").Append(local_38.Player.GetSMRuntime()[].GetStateIndex());
                    }
                }
                else
                {
                    local_14 = "StateMachineNull";
                }
            }
            else
            {
                local_14 = FString().Append("StateMachineIndexOutOfRange RuntimeCount=").Append(local_38.Player.GetSMRuntime().Num());
            }
        }
        else
        {
            Has local_26;
            Has local_20;
            local_14 = FString().Append("MissingESMComponents HasESM=").Append(local_20.opCall()).Append(" HasESMPlayer=").Append(local_26.opCall());
        }
        TArray<uint> local_52 = this.EntityESMStateEntryHandles[EntityKey].Handles;
        ULevelActorManager local_54 = ULevelActorManager::Get();
        for (auto local_69 : local_52)
        {
            FInstancedStruct local_78 = local_54.GetAsyncActionStruct(local_69);
            if (!(local_78.IsValid()))
            {
                continue;
            }
            if (!(local_78.Contains(FASWaitForESMState)))
            {
                continue;
            }
            if (local_86.MatchESMState.Len() > 0 && !((local_10 == local_86.MatchESMState)))
            {
                continue;
            }
            local_86.OnStateEntered.Broadcast(local_10);
        }
        return;
    }
    void RegisterTutorialGraphicClosedAction(const TDataObjectPtr<FGuideGroupConfig> &inout GraphicConfig, const uint Handle)
    {
        if (!(GraphicConfig.IsSet()))
        {
            return;
        }
        return;
    }
    void UnRegisterTutorialGraphicClosedAction(const TDataObjectPtr<FGuideGroupConfig> &inout GraphicConfig, const uint Handle)
    {
        int local_3 = 0;
        if (!(GraphicConfig.IsSet()))
        {
            return;
        }
        int local_2 = local_3;
        if (!(this.TutorialGraphicClosedHandles.Contains(local_2)))
        {
            return;
        }
        if (this.TutorialGraphicClosedHandles[local_2].Handles.IsEmpty())
        {
        }
        return;
    }
    void BroadcastTutorialGraphicClosed(const TDataObjectPtr<FGuideGroupConfig> &inout GraphicConfig)
    {
        int local_3 = 0;
        int local_40 = 0;
        if (!(GraphicConfig.IsSet()))
        {
            return;
        }
        int local_2 = local_3;
        if (!(this.TutorialGraphicClosedHandles.Contains(local_2)))
        {
            return;
        }
        TArray<uint> local_8 = this.TutorialGraphicClosedHandles[local_2].Handles;
        ULevelActorManager local_10 = ULevelActorManager::Get();
        for (auto local_25 : local_8)
        {
            if (local_10.GetAsyncActionStruct(local_25).IsValid())
            {
                local_40.OnClosed.Broadcast();
                local_40.MarkFinished();
            }
        }
        return;
    }
}

delegate void FEntityAttributeChangedDelegate(const FECSEntity &inout Entity, const float32 OldValue, const float32 NewValue, const float32 OldRatio, const float32 NewRatio);

delegate void FEntityCreateFinishDelegate(const FECSEntity &inout Entity);

delegate void FObjectiveFinishDelegate();

delegate void FRandomFriendNameDelegate(const FString &inout FriendName);

delegate void FCGPlayFinishedDelegate(const FECSEntity &inout PlayerEntity);

delegate void FESMTriggerRespondedDelegate(const FECSEntity &inout Entity, const FName &inout TriggerName, const int32 StateMachineIndex);

delegate void FESMActionEventDelegate(const FECSEntity &inout Entity, const FName &inout EventName, const bool bIsEnter);

