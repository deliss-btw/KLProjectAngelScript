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
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        else
        {
            TObjectPtr<UEcologyBehaviorDefine> local_14 = TObjectPtr<UEcologyBehaviorDefine>(local_10.ActivityData.BehaviorDefine);
            if (!(local_14.Get().bHasBehaviorTreeAsset))
            {
                return EBTNodeResult(1);
            }
            else
            {
                Ecology::SyncLoadObject(local_14.Get().BehaviorTreeAsset.ToSoftObjectPath());
                if ((!((local_14.Get().BehaviorTreeAsset.Get() != nullptr))))
                {
                    return EBTNodeResult(1);
                }
                else
                {
                    UBehaviorTree local_30 = local_14.Get().BehaviorTreeAsset.Get();
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

