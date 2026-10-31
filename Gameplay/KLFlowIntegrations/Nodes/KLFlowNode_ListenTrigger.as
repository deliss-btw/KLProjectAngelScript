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

    default m_ScriptOverrideMeta = Cast<UASStruct>(FKLFlowNode_ListenTrigger.Get());

    FKLFlowNode_ListenTrigger()
    {
        this.SubscriptionHandleBeginOverlap = 0;
        this.SubscriptionHandleEndOverlap = 0;
        this.__InitDefaults();
        return;
    }
    void OnBuild_Implementation()
    {
        this.bIsEntryNode = true;
        this.OutputPins = {n"OnPlayerControllerBeginOverlap", n"OnPlayerControllerEndOverlap"};
        return;
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
        if (!(this.ConsumeEvent(SubscriptionHandle, local_4)))
        {
            return false;
        }
        FInstancedStruct::GetPtr local_10;
        TConstRawPtr<FKLFlowEvent_PlayerControllerOverlap> local_12 = local_10.opCall();
        if (!(local_12))
        {
            return false;
        }
        if (this.LevelUnitRef.IsValid())
        {
            FECSEntity local_18;
            if (!(::KLFlowLibrary::GetEntityByLevelUnitRef(this.LevelUnitRef, local_18)) || !((local_18.GetId() == FECSEntityId(int(local_12.Get().TriggerEntityId.Value)))))
            {
                return false;
            }
        }
        OutEvent = local_12.Get();
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
        TConstRawPtr<FKLFlowNodeMemory_ListenTrigger> local_6 = FInstancedStruct::GetPtr<FKLFlowNodeMemory_ListenTrigger>(InSnapshot.Memory).opCall();
        if (!(local_6))
        {
            return;
        }
        this.SubscriptionHandleBeginOverlap = local_6.Get().HandleBeginOverlap;
        this.SubscriptionHandleEndOverlap = local_6.Get().HandleEndOverlap;
        return;
    }
}

