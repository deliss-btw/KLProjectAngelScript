

class UBTTask_SyncDynamicBehaviorFromActivityDefine : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_GameplayTag DynamicBehaviorTreeInjectTag;

    default SetNodeName("SyncDynamicBehaviorFromActivityDefine");

    UBTTask_SyncDynamicBehaviorFromActivityDefine()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_10 = 0;
        UEcologyBehaviorDefine local_16;
        UBehaviorTree local_26;
        UBehaviorTree local_30;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        else
        {
            TObjectPtr<UEcologyBehaviorDefine> local_14 = TObjectPtr<UEcologyBehaviorDefine>(local_10.ActivityData.BehaviorDefine);
            if (!(local_16.bHasBehaviorTreeAsset))
            {
                return EBTNodeResult(1);
            }
            else
            {
                Ecology::SyncLoadObject(local_16.BehaviorTreeAsset.ToSoftObjectPath());
                if ((!((local_26 != nullptr))))
                {
                    return EBTNodeResult(1);
                }
                else
                {
                    FGameplayTag local_34 = this.DynamicBehaviorTreeInjectTag.GetValue(Context.opImplConv());
                    FECSWorldPtr local_38 = ECS::GetECSWorld();
                    ModifyOrAdd local_42;
                    local_42.opCall().AddAICommandSource(local_30);
                    Context.GetOwnerComponent().SetDynamicSubtree(local_34, local_30);
                    return EBTNodeResult(0);
                }
            }
        }
    }
}

