

class UEQT_InCurrentCombatArea : UEnvQueryTest_ECS_BlueprintBase
{
    UPROPERTY()
    bool UsePreferInnerVolume = false;
    UPROPERTY()
    AECSRegionVolume CachedVolume;
    UPROPERTY()
    AECSCombatRegionVolume CachedCombatVolume;
    UPROPERTY()
    bool bHasRegion = false;

    default SetWorkOnBool(true);
    default SetValidItemType(UEnvQueryItemType_VectorBase);


    UFUNCTION()
    void PrepareRunTest_Implementation(FEnvQueryTest_ECSContext &inout Context)
    {
        int local_16 = 0;
        AECSCombatRegionVolume local_28;
        this.CachedVolume = nullptr;
        this.CachedCombatVolume = nullptr;
        this.bHasRegion = false;
        if (!(::FEcologySceneInfoUtils::FindCreatureTargetCombatRegion(Context.QueryEntity)))
        {
            return;
        }
        if (!(local_16))
        {
            return;
        }
        AActor local_18;
        AECSRegionVolume local_22 = (Cast<AECSRegionVolume>(local_18));
        if ((local_22 == nullptr || !(local_22.bAffectCombat)))
        {
            return;
        }
        this.CachedVolume = local_22;
        this.bHasRegion = true;
        if (this.UsePreferInnerVolume)
        {
            local_28 = (Cast<AECSCombatRegionVolume>(local_22));
            if (local_28 != nullptr)
            {
                if (local_28.PreferAreaPoints.Num() >= 3)
                {
                    this.CachedCombatVolume = local_28;
                }
                else
                {
                    XLog(ELog(14), "[EQT_InCurrentCombatArea] UsePreferInnerVolume=true but PreferAreaPoints < 3, fallback to outer volume");
                }
            }
            else
            {
                XLog(ELog(14), "[EQT_InCurrentCombatArea] UsePreferInnerVolume=true but volume is not AECSCombatRegionVolume, fallback to outer");
            }
        }
        return;
    }
    UFUNCTION()
    void RunTest_Implementation(FEnvQueryTest_ECSContext &inout Context, const FEnvQueryTest_ECSItemIterator &inout Item) const
    {
        if (!(this.bHasRegion) || ((this.CachedVolume == nullptr)))
        {
            Item.SetScore(false);
            return;
        }
        FVector local_18 = Item.GetItemLocation();
        bool local_19 = false;
        if (this.UsePreferInnerVolume && ((this.CachedCombatVolume != nullptr)))
        {
            local_19 = this.CachedCombatVolume.IsPointInPreferArea(local_18);
        }
        else
        {
            local_19 = this.CachedVolume.EncompassesPoint(local_18, 0.0f);
        }
        Item.SetScore(local_19);
        return;
    }
}

