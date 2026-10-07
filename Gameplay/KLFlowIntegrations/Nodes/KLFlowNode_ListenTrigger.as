

// NOTE: class defaults are not authored in this module: FKLFlowNode_ListenTrigger (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FKLFlowNodeMemory_ListenTrigger
{
    UPROPERTY()
    int HandleBeginOverlap = 0;
    UPROPERTY()
    int HandleEndOverlap = 0;


}

struct FKLFlowNode_ListenTrigger : FKLFlowNode
{
    FKLFlowNode _base_FKLFlowNode;
    UPROPERTY()
    FKLFlowLevelUnitRef LevelUnitRef;
    UPROPERTY()
    FKLFlowEvent_PlayerControllerOverlap PlayerControllerOverlapInfo;
    UPROPERTY()
    int SubscriptionHandleBeginOverlap;
    UPROPERTY()
    int SubscriptionHandleEndOverlap;

    FKLFlowNode_ListenTrigger()
    {
        this.SubscriptionHandleBeginOverlap = 0;
        this.SubscriptionHandleEndOverlap = 0;
        this.__InitDefaults();
        return;
    }
    void OnBuild_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnInit_Implementation()
    {
        this.SubscriptionHandleBeginOverlap = this.SubscribeEvent(KLFlowEventTags::ECS_PlayerControllerBeginOverlap, n"OnPlayerControllerBeginOverlap");
        this.SubscriptionHandleEndOverlap = this.SubscribeEvent(KLFlowEventTags::ECS_PlayerControllerEndOverlap, n"OnPlayerControllerEndOverlap");
        return;
    }
    void OnExec_Implementation(const FName &inout PinName)
    {
        if ((PinName == n"OnPlayerControllerBeginOverlap"))
        {
            FKLFlowEvent_PlayerControllerOverlap local_4;
            if (this.TryConsumeOverlapEvent(this.SubscriptionHandleBeginOverlap, local_4))
            {
                this.PlayerControllerOverlapInfo = local_4;
                this.TriggerOutput(n"OnPlayerControllerBeginOverlap", false);
            }
            return;
        }
        else
        {
            if ((PinName == n"OnPlayerControllerEndOverlap"))
            {
                FKLFlowEvent_PlayerControllerOverlap local_4;
                if (this.TryConsumeOverlapEvent(this.SubscriptionHandleEndOverlap, local_4))
                {
                    this.PlayerControllerOverlapInfo = local_4;
                    this.TriggerOutput(n"OnPlayerControllerEndOverlap", false);
                }
                return;
            }
        }
    }
    bool TryConsumeOverlapEvent(const int SubscriptionHandle, FKLFlowEvent_PlayerControllerOverlap &inout OutEvent)
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
    void OnQuit_Implementation()
    {
        if (this.SubscriptionHandleBeginOverlap != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandleBeginOverlap);
            this.SubscriptionHandleBeginOverlap = 0;
        }
        if (this.SubscriptionHandleEndOverlap != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandleEndOverlap);
            this.SubscriptionHandleEndOverlap = 0;
        }
        return;
    }
    void OnSave_Implementation(FKLFlowNodeSnapshot &inout OutSnapshot)
    {
        FKLFlowNodeMemory_ListenTrigger local_2;
        local_2.HandleBeginOverlap = this.SubscriptionHandleBeginOverlap;
        local_2.HandleEndOverlap = this.SubscriptionHandleEndOverlap;
        OutSnapshot.Memory = FInstancedStruct::Make(local_2);
        return;
    }
    void OnLoad_Implementation(const FKLFlowNodeSnapshot &inout InSnapshot)
    {
        int local_10 = 0;
        if (!(FInstancedStruct::GetPtr<FKLFlowNodeMemory_ListenTrigger>(InSnapshot.Memory).opCall()))
        {
            return;
        }
        this.SubscriptionHandleBeginOverlap = local_10;
        this.SubscriptionHandleEndOverlap = local_10;
        return;
    }
}

