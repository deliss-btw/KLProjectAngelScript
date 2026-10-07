

class UHTNS_GetSpecifiedEntity : UHTNService_ECSScriptBase
{
    UPROPERTY()
    bool bGetFromTeam = false;
    UPROPERTY()
    bool bFindInRange = false;
    UPROPERTY()
    float32 Range = 1000.0f;
    UPROPERTY()
    bool bGetByTag = true;
    UPROPERTY()
    FGameplayTag Tag;
    UPROPERTY()
    FBlackboardKeySelector ResultEntity;
    UPROPERTY()
    bool bTickUpdate = false;


    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        this.GetSpecifiedEntity(Context);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        if (this.bTickUpdate)
        {
            this.GetSpecifiedEntity(Context);
        }
        return;
    }
    void GetSpecifiedEntity(const FHTNContext &inout Context)
    {
        HTNNode::ClearWorldStateValue(Context, this.ResultEntity);
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (this.bGetFromTeam)
        {
            Get local_32;
            Get local_10;
            const FC_EcosimAIV2TeamMember& local_12 = local_10.opCall();
            if (local_12)
            {
                if (!(FECSEntity(local_12.TeamEntity).IsValid()))
                {
                    return;
                }
                Get local_20;
                const FC_EcosimAIV2Team& local_22 = local_20.opCall();
                if (local_22)
                {
                    FVector local_28 = local_32.opCall().GetPosition();
                    for (auto& local_46 : local_22.EntityMemberList)
                    {
                        FECSEntity local_50 = FECSEntity(local_46.GetEntity());
                        if (!(local_50.IsValid()) || (local_50 == local_4))
                        {
                            continue;
                        }
                        if (this.bFindInRange)
                        {
                            if ((float32(((FVector(local_32.opCall().GetPosition()) - local_28).SizeSquared()))) > (this.Range * this.Range))
                            {
                                continue;
                            }
                        }
                        if (this.bGetByTag && !(local_50.MatchGameplayTag(this.Tag)))
                        {
                            continue;
                        }
                        local_50.GetId();
                        return;
                    }
                }
            }
        }
        else
        {
            Get local_32;
            if (this.bFindInRange)
            {
                FVector local_28_2 = local_32.opCall().GetPosition();
                FECSRuntimeQuery local_116 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_4, local_28_2, this.Range, EECSQueryRegsitryType(3), false);
                Exclude(local_116).opCall();
                FECSRuntimeQueryIterator local_182 = local_116.Iterator();
                for (; local_182.CanProceed;)
                {
                    const FECSEntity& local_206 = local_182.Proceed();
                    if ((local_206 == local_4))
                    {
                        continue;
                    }
                    if (this.bGetByTag && !(local_206.MatchGameplayTag(this.Tag)))
                    {
                        continue;
                    }
                    local_206.GetId();
                    return;
                }
            }
        }
        return;
    }
}

