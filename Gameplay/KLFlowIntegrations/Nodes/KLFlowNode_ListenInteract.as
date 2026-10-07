

// NOTE: class defaults are not authored in this module: FKLFlowNode_ListenInteract (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FKLFlowNodeMemory_ListenInteract
{
    UPROPERTY()
    int HandleBeginInteract = 0;
    UPROPERTY()
    int HandleEndInteract = 0;


}

struct FKLFlowNode_ListenInteract : FKLFlowNode
{
    FKLFlowNode _base_FKLFlowNode;
    UPROPERTY()
    FKLFlowLevelUnitRef LevelUnitRef;
    UPROPERTY()
    int InteractPointIndex;
    UPROPERTY()
    FName InteractName;
    UPROPERTY()
    FKLFlowECSEntityId TargetEntityId;
    UPROPERTY()
    FKLFlowECSEntityId InteracterEntityId;
    UPROPERTY()
    int InteracterPlayerUid;
    UPROPERTY()
    int SubscriptionHandleBeginInteract;
    UPROPERTY()
    int SubscriptionHandleEndInteract;

    FKLFlowNode_ListenInteract()
    {
        this.InteracterPlayerUid = 0;
        this.InteractPointIndex = 0;
        this.SubscriptionHandleBeginInteract = 0;
        this.SubscriptionHandleEndInteract = 0;
        this.__InitDefaults();
        return;
    }
    void OnBuild_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnInit_Implementation()
    {
        this.SubscriptionHandleBeginInteract = this.SubscribeEvent(KLFlowEventTags::Interact_BeginInteract, n"OnBeginInteractEvent");
        this.SubscriptionHandleEndInteract = this.SubscribeEvent(KLFlowEventTags::Interact_EndInteract, n"OnEndInteractEvent");
        return;
    }
    void OnExec_Implementation(const FName &inout PinName)
    {
        if ((PinName == n"OnBeginInteractEvent"))
        {
            FKLFlowEvent_Interact local_8;
            if (!(this.TryConsumeInteractEvent(this.SubscriptionHandleBeginInteract, local_8)))
            {
                return;
            }
            this.FillOutputParams(local_8);
            if (local_8.bIsPlayer)
            {
                this.TriggerOutput(n"OnBeginInteractByPlayer", false);
            }
            else
            {
                this.TriggerOutput(n"OnBeginInteractByNonPlayer", false);
            }
            return;
        }
        if ((PinName == n"OnEndInteractEvent"))
        {
            FKLFlowEvent_Interact local_8;
            if (!(this.TryConsumeInteractEvent(this.SubscriptionHandleEndInteract, local_8)))
            {
                return;
            }
            this.FillOutputParams(local_8);
            if (local_8.bIsPlayer)
            {
                this.TriggerOutput(n"OnEndInteractByPlayer", false);
            }
            else
            {
                this.TriggerOutput(n"OnEndInteractByNonPlayer", false);
            }
        }
        return;
    }
    void OnQuit_Implementation()
    {
        if (this.SubscriptionHandleBeginInteract != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandleBeginInteract);
            this.SubscriptionHandleBeginInteract = 0;
        }
        if (this.SubscriptionHandleEndInteract != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandleEndInteract);
            this.SubscriptionHandleEndInteract = 0;
        }
        return;
    }
    void OnSave_Implementation(FKLFlowNodeSnapshot &inout OutSnapshot)
    {
        FKLFlowNodeMemory_ListenInteract local_2;
        local_2.HandleBeginInteract = this.SubscriptionHandleBeginInteract;
        local_2.HandleEndInteract = this.SubscriptionHandleEndInteract;
        OutSnapshot.Memory = FInstancedStruct::Make(local_2);
        return;
    }
    void OnLoad_Implementation(const FKLFlowNodeSnapshot &inout InSnapshot)
    {
        int local_10 = 0;
        if (!(FInstancedStruct::GetPtr<FKLFlowNodeMemory_ListenInteract>(InSnapshot.Memory).opCall()))
        {
            return;
        }
        this.SubscriptionHandleBeginInteract = local_10;
        this.SubscriptionHandleEndInteract = local_10;
        return;
    }
    bool TryConsumeInteractEvent(const int SubscriptionHandle, FKLFlowEvent_Interact &inout OutEvent)
    {
        FInstancedStruct local_4;
        int local_20 = 0;
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
            if (!(::KLFlowLibrary::GetEntityByLevelUnitRef(this.LevelUnitRef, local_18)) || !((local_18.GetId() == FECSEntityId(local_20))))
            {
                return false;
            }
        }
        return true;
    }
    void FillOutputParams(const FKLFlowEvent_Interact &inout Event)
    {
        this.InteractPointIndex = int(Event.InteractPointIndex);
        this.InteractName = Event.InteractName;
        this.TargetEntityId = Event.EntityId;
        this.InteracterEntityId = Event.InteracterEntityId;
        if (Event.bIsPlayer)
        {
            FECSEntity local_6;
            if (::KLFlowLibrary::GetEntityByKLFlowECSEntityId(Event.InteracterEntityId, local_6))
            {
                this.InteracterPlayerUid = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_6);
            }
            return;
        }
        this.InteracterPlayerUid = 0;
        return;
    }
}

