
namespace ListenLevelGroupPins
{
    const FName OnGroupReady = n"OnGroupReady";
    const FName OnPassReady = n"OnPassReady";
    const FName OnAnyPassReady = n"OnAnyPassReady";
    const FName OnECSBeginPlay = n"OnECSBeginPlay";

// NOTE: class defaults are not authored in this module: FKLFlowNode_ListenLevelGroup (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

}
struct FKLFlowNodeMemory_ListenLevelGroup
{
    UPROPERTY()
    int HandleReady = 0;
    UPROPERTY()
    int HandlePassReady = 0;
    UPROPERTY()
    int HandleAnyPassReady = 0;
    UPROPERTY()
    int HandleECSBeginPlay = 0;


}

struct FKLFlowNode_ListenLevelGroup : FKLFlowNode
{
    FKLFlowNode _base_FKLFlowNode;
    UPROPERTY()
    FName LevelGroupName;
    UPROPERTY()
    FKLFlowEvent_LevelGroup LevelGroupInfo;
    UPROPERTY()
    int SubscriptionHandleReady;
    UPROPERTY()
    int SubscriptionHandlePassReady;
    UPROPERTY()
    int SubscriptionHandleAnyPassReady;
    UPROPERTY()
    int SubscriptionHandleECSBeginPlay;

    FKLFlowNode_ListenLevelGroup()
    {
        this.SubscriptionHandleReady = 0;
        this.SubscriptionHandlePassReady = 0;
        this.SubscriptionHandleAnyPassReady = 0;
        this.SubscriptionHandleECSBeginPlay = 0;
        this.__InitDefaults();
        return;
    }
    void OnBuild_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnInit_Implementation()
    {
        this.SubscriptionHandleReady = this.SubscribeEvent(KLFlowEventTags::Level_LevelGroupReady, ListenLevelGroupPins::OnGroupReady);
        this.SubscriptionHandlePassReady = this.SubscribeEvent(KLFlowEventTags::Level_LevelGroupPassReady, ListenLevelGroupPins::OnPassReady);
        this.SubscriptionHandleAnyPassReady = this.SubscribeEvent(KLFlowEventTags::Level_LevelGroupAnyPassReady, ListenLevelGroupPins::OnAnyPassReady);
        this.SubscriptionHandleECSBeginPlay = this.SubscribeEvent(KLFlowEventTags::Level_ECSBeginPlay, ListenLevelGroupPins::OnECSBeginPlay);
        return;
    }
    void OnExec_Implementation(const FName &inout PinName)
    {
        if ((PinName == ListenLevelGroupPins::OnGroupReady))
        {
            FKLFlowEvent_LevelGroup local_8;
            if (this.TryConsumeLevelGroupEvent(this.SubscriptionHandleReady, local_8))
            {
                this.LevelGroupInfo = local_8;
                this.TriggerOutput(ListenLevelGroupPins::OnGroupReady, false);
            }
            return;
        }
        else
        {
            if ((PinName == ListenLevelGroupPins::OnPassReady))
            {
                FKLFlowEvent_LevelGroup local_8;
                if (this.TryConsumeLevelGroupEvent(this.SubscriptionHandlePassReady, local_8))
                {
                    this.LevelGroupInfo = local_8;
                    this.TriggerOutput(ListenLevelGroupPins::OnPassReady, false);
                }
                return;
            }
            else
            {
                if ((PinName == ListenLevelGroupPins::OnAnyPassReady))
                {
                    FKLFlowEvent_LevelGroup local_8;
                    if (this.TryConsumeLevelGroupEvent(this.SubscriptionHandleAnyPassReady, local_8))
                    {
                        this.LevelGroupInfo = local_8;
                        this.TriggerOutput(ListenLevelGroupPins::OnAnyPassReady, false);
                    }
                    return;
                }
                else
                {
                    if ((PinName == ListenLevelGroupPins::OnECSBeginPlay))
                    {
                        FKLFlowEvent_LevelGroup local_8;
                        if (this.TryConsumeLevelGroupEvent(this.SubscriptionHandleECSBeginPlay, local_8))
                        {
                            this.LevelGroupInfo = local_8;
                            this.TriggerOutput(ListenLevelGroupPins::OnECSBeginPlay, false);
                        }
                        return;
                    }
                }
            }
        }
    }
    bool TryConsumeLevelGroupEvent(const int SubscriptionHandle, FKLFlowEvent_LevelGroup &inout OutEvent)
    {
        FInstancedStruct local_4;
        if (!(this.ConsumeEvent(SubscriptionHandle, local_4)))
        {
            return false;
        }
        FInstancedStruct::GetPtr local_10;
        if (!(local_10.opCall()))
        {
            return false;
        }
        FName local_16;
        if (!(this.LevelGroupName.IsNone()) && !((local_16 == this.LevelGroupName)))
        {
            return false;
        }
        return true;
    }
    void OnQuit_Implementation()
    {
        if (this.SubscriptionHandleReady != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandleReady);
            this.SubscriptionHandleReady = 0;
        }
        if (this.SubscriptionHandlePassReady != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandlePassReady);
            this.SubscriptionHandlePassReady = 0;
        }
        if (this.SubscriptionHandleAnyPassReady != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandleAnyPassReady);
            this.SubscriptionHandleAnyPassReady = 0;
        }
        if (this.SubscriptionHandleECSBeginPlay != 0)
        {
            this.UnsubscribeEvent(this.SubscriptionHandleECSBeginPlay);
            this.SubscriptionHandleECSBeginPlay = 0;
        }
        return;
    }
    void OnSave_Implementation(FKLFlowNodeSnapshot &inout OutSnapshot)
    {
        FKLFlowNodeMemory_ListenLevelGroup local_4;
        local_4.HandleReady = this.SubscriptionHandleReady;
        local_4.HandlePassReady = this.SubscriptionHandlePassReady;
        local_4.HandleAnyPassReady = this.SubscriptionHandleAnyPassReady;
        local_4.HandleECSBeginPlay = this.SubscriptionHandleECSBeginPlay;
        OutSnapshot.Memory = FInstancedStruct::Make(local_4);
        return;
    }
    void OnLoad_Implementation(const FKLFlowNodeSnapshot &inout InSnapshot)
    {
        int local_10 = 0;
        if (!(FInstancedStruct::GetPtr<FKLFlowNodeMemory_ListenLevelGroup>(InSnapshot.Memory).opCall()))
        {
            return;
        }
        this.SubscriptionHandleReady = local_10;
        this.SubscriptionHandlePassReady = local_10;
        this.SubscriptionHandleAnyPassReady = local_10;
        this.SubscriptionHandleECSBeginPlay = local_10;
        return;
    }
}

