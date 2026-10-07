

class UBTTask_TrySendChangeAreaMessage : UBTTask_ECSScriptBase
{
    default SetNodeName("TrySendChangeAreaMessage");

    UBTTask_TrySendChangeAreaMessage()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        Get local_14;
        int local_28 = 0;
        int local_100 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        Has local_8;
        if (!(local_8.opCall()))
        {
            return EBTNodeResult(0);
        }
        if (!(local_14.opCall()))
        {
            return EBTNodeResult(0);
        }
        if (!(FECSEntity(local_14.opCall().FlockProxyEntity).IsValid()))
        {
            return EBTNodeResult(0);
        }
        if (!(local_28))
        {
            return EBTNodeResult(0);
        }
        if (!(local_28.ChangeAreaData.bNeedChangeAreaMessage))
        {
            return EBTNodeResult(0);
        }
        FChangeAreaMessageInfo local_54;
        if (!(local_54.MessageConfig.IsSet()))
        {
            return EBTNodeResult(0);
        }
        TArray<FECSEntity> local_90 = ::FEcologyUtils::SearchPlayerByRadiusAndHalfHeight(local_4, local_54.Radius, local_54.HalfHeight);
        FFPTime local_96 = FFPTime(-1);
        local_100.PlayerEntityList = local_90;
        local_100.MessageConfig = local_54.MessageConfig;
        FFPTime local_96_2 = FFPTime(-1);
        SendEvent local_128;
        local_128.opCall(local_96_2);
        Remove local_132;
        local_132.opCall();
        return EBTNodeResult(0);
    }
}

