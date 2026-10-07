
namespace ListenSingleEntityPins
{
    const FName Activate = n"Activate";
    const FName Deactivate = n"Deactivate";
    const FName Out = n"Out";
    const FName OnEntityReady = n"OnEntityReady";
    const FName OnEntityDie = n"OnEntityDie";
    const FName OnEntityDestroy = n"OnEntityDestroy";

// NOTE: class defaults are not authored in this module: FKLFlowNode_ListenSingleEntity (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

}
struct FKLFlowEvent_EntityLifecycle : FKLFlowEvent_Base
{
    UPROPERTY()
    int _Padding = 0;
    UPROPERTY()
    FKLFlowECSEntityId TargetEntityId;


}

struct FKLFlowNodeMemory_ListenSingleEntity
{
    UPROPERTY()
    int HandleReady = 0;
    UPROPERTY()
    int HandleDie = 0;
    UPROPERTY()
    int HandleDestroy = 0;
    UPROPERTY()
    bool bIsActive = false;


}

struct FKLFlowNode_ListenSingleEntity : FKLFlowNode
{
    FKLFlowNode _base_FKLFlowNode;
    UPROPERTY()
    FKLFlowLevelUnitRef LevelUnitRef;
    UPROPERTY()
    FKLFlowECSEntityId TargetEntityId;
    UPROPERTY()
    int HandleReady;
    UPROPERTY()
    int HandleDie;
    UPROPERTY()
    int HandleDestroy;
    UPROPERTY()
    bool bIsActive;

    FKLFlowNode_ListenSingleEntity()
    {
        this.HandleReady = 0;
        this.HandleDie = 0;
        this.HandleDestroy = 0;
        this.bIsActive = false;
        this.__InitDefaults();
        return;
    }
    void OnBuild_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnInit_Implementation()
    {
        this.HandleReady = this.SubscribeEvent(KLFlowEventTags::ECS_EntityOnReady, ListenSingleEntityPins::OnEntityReady);
        this.HandleDie = this.SubscribeEvent(KLFlowEventTags::ECS_EntityOnDie, ListenSingleEntityPins::OnEntityDie);
        this.HandleDestroy = this.SubscribeEvent(KLFlowEventTags::ECS_EntityOnDestroy, ListenSingleEntityPins::OnEntityDestroy);
        return;
    }
    void OnExec_Implementation(const FName &inout PinName)
    {
        if ((PinName == ListenSingleEntityPins::Activate))
        {
            this.ActivateListening();
            this.TriggerOutput(ListenSingleEntityPins::Out, false);
            return;
        }
        else
        {
            if ((PinName == ListenSingleEntityPins::Deactivate))
            {
                this.DeactivateListening();
                this.TriggerOutput(ListenSingleEntityPins::Out, false);
                return;
            }
            else
            {
                if ((PinName == ListenSingleEntityPins::OnEntityReady))
                {
                    FKLFlowEvent_EntityLifecycle local_4;
                    if (this.TryConsumeLifecycleEvent(this.HandleReady, local_4) && this.bIsActive)
                    {
                        this.TargetEntityId = local_4.TargetEntityId;
                        this.TriggerOutput(ListenSingleEntityPins::OnEntityReady, false);
                    }
                    return;
                }
                else
                {
                    if ((PinName == ListenSingleEntityPins::OnEntityDie))
                    {
                        FKLFlowEvent_EntityLifecycle local_4;
                        if (this.TryConsumeLifecycleEvent(this.HandleDie, local_4) && this.bIsActive)
                        {
                            this.TargetEntityId = local_4.TargetEntityId;
                            this.TriggerOutput(ListenSingleEntityPins::OnEntityDie, false);
                        }
                        return;
                    }
                    else
                    {
                        if ((PinName == ListenSingleEntityPins::OnEntityDestroy))
                        {
                            FKLFlowEvent_EntityLifecycle local_4;
                            if (this.TryConsumeLifecycleEvent(this.HandleDestroy, local_4) && this.bIsActive)
                            {
                                this.TargetEntityId = local_4.TargetEntityId;
                                this.TriggerOutput(ListenSingleEntityPins::OnEntityDestroy, false);
                            }
                            return;
                        }
                    }
                }
            }
        }
    }
    void OnQuit_Implementation()
    {
        this.bIsActive = false;
        this.UnsubscribeAllEvents();
        return;
    }
    void OnSave_Implementation(FKLFlowNodeSnapshot &inout OutSnapshot)
    {
        FKLFlowNodeMemory_ListenSingleEntity local_4;
        local_4.HandleReady = this.HandleReady;
        local_4.HandleDie = this.HandleDie;
        local_4.HandleDestroy = this.HandleDestroy;
        local_4.bIsActive = this.bIsActive;
        OutSnapshot.Memory = FInstancedStruct::Make(local_4);
        return;
    }
    void OnLoad_Implementation(const FKLFlowNodeSnapshot &inout InSnapshot)
    {
        int local_10 = 0;
        bool local_9 = !(FInstancedStruct::GetPtr<FKLFlowNodeMemory_ListenSingleEntity>(InSnapshot.Memory).opCall());
        if (local_9)
        {
            return;
        }
        this.HandleReady = local_10;
        this.HandleDie = local_10;
        this.HandleDestroy = local_10;
        this.bIsActive = local_9;
        return;
    }
    void ActivateListening()
    {
        if (this.bIsActive)
        {
            return;
        }
        this.bIsActive = true;
        return;
    }
    void DeactivateListening()
    {
        this.bIsActive = false;
        return;
    }
    void UnsubscribeAllEvents()
    {
        if (this.HandleReady != 0)
        {
            this.UnsubscribeEvent(this.HandleReady);
            this.HandleReady = 0;
        }
        if (this.HandleDie != 0)
        {
            this.UnsubscribeEvent(this.HandleDie);
            this.HandleDie = 0;
        }
        if (this.HandleDestroy != 0)
        {
            this.UnsubscribeEvent(this.HandleDestroy);
            this.HandleDestroy = 0;
        }
        return;
    }
    bool TryConsumeLifecycleEvent(const int SubscriptionHandle, FKLFlowEvent_EntityLifecycle &inout OutEvent)
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
}

