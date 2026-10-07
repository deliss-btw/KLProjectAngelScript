

class UEQT_InCombatArea : UEnvQueryTest_ECS_BlueprintBase
{
    UPROPERTY()
    bool UsePreferInnerVolume = false;
    UPROPERTY()
    TArray<AECSRegionVolume> CombatVolumes;

    default SetWorkOnBool(true);
    default SetValidItemType(UEnvQueryItemType_VectorBase);


    UFUNCTION()
    void RunTest_Implementation(FEnvQueryTest_ECSContext &inout Context, const FEnvQueryTest_ECSItemIterator &inout Item) const
    {
        bool local_31;
        AECSCombatRegionVolume local_36;
        bool local_1 = false;
        if (this.CombatVolumes.Num() > 0)
        {
            FVector local_16 = Item.GetItemLocation();
            for (auto local_30 : this.CombatVolumes)
            {
                local_31 = false;
                if (this.UsePreferInnerVolume)
                {
                    local_36 = Cast<AECSCombatRegionVolume>(local_30);
                    if (local_36 != nullptr)
                    {
                        if (local_36.PreferAreaPoints.Num() >= 3)
                        {
                            local_31 = local_36.IsPointInPreferArea(local_16);
                        }
                        else
                        {
                            local_31 = local_30.EncompassesPoint(local_16, 0.0f);
                        }
                    }
                    else
                    {
                        local_31 = local_30.EncompassesPoint(local_16, 0.0f);
                    }
                }
                else
                {
                    local_31 = local_30.EncompassesPoint(local_16, 0.0f);
                }
                if (local_31)
                {
                    local_1 = true;
                    break;
                }
            }
        }
        Item.SetScore(local_1);
        return;
    }
    UFUNCTION()
    void PrepareRunTest_Implementation(FEnvQueryTest_ECSContext &inout Context)
    {
        AECSRegionVolume local_172;
        this.CombatVolumes.Reset(0);
        FBox local_30 = Context.BuildAABB();
        if (local_30.IsValid)
        {
            FECSRuntimeQuery local_72 = FECSRuntimeQueryHelper::MakeRuntimeQuery(Context.QueryEntity, EECSQueryRegsitryType(1), false);
            Include local_116;
            local_116.opCall();
            FECSRuntimeQueryIterator local_138 = local_72.Iterator();
            for (; local_138.CanProceed;)
            {
                local_138.Proceed();
                AActor local_168;
                local_172 = Cast<AECSRegionVolume>(local_168);
                if (local_172 != nullptr && local_172.bAffectCombat && local_172.GetBounds().GetBox().IntersectXY(local_30))
                {
                    this.CombatVolumes.Add(local_172);
                }
            }
        }
        return;
    }
}

