

class UBTTask_EcosimAITryKickRiderOff : UBTTask_ECSScriptBase
{
    default SetNodeName("EcosimAITryKickRiderOff");

    UBTTask_EcosimAITryKickRiderOff()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        Get local_4;
        const FC_AttachmentChildren& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto& local_22 : local_6.GetChildren())
            {
                FESMTriggerUtils::ActivateESMTrigger(local_22, n"EndMountTrigger", ECS::GetContextTime(), FFPTime(0.2), 0);
            }
        }
        return EBTNodeResult(0);
    }
}

