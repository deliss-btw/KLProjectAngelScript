

class UBTDecorator_CheckLocationIsInCurrentCombatArea : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    bool bUseEntityLocation;
    UPROPERTY()
    bool bCheckNavMesh;
    UPROPERTY()
    ECheckNavReachableType CheckNavReachableType;
    UPROPERTY()
    bool bCheckCombatArea;
    UPROPERTY()
    bool UsePreferInnerVolume;
    UPROPERTY()
    FBlackboardKeySelector Location;
    UPROPERTY()
    FAISmart_EntityId LocationEntity;
    UPROPERTY()
    FAISmart_EntityId SelfEntity;

    default SetbAllowAbortLowerPri(true);
    default SetbAllowAbortChildNodes(true);
    default SetNodeName("Check Location Is In Current Combat Area and Nav");

    UBTDecorator_CheckLocationIsInCurrentCombatArea()
    {
        this.bUseEntityLocation = false;
        this.bCheckNavMesh = true;
        this.CheckNavReachableType = ECheckNavReachableType(1);
        this.bCheckCombatArea = true;
        this.UsePreferInnerVolume = false;
        this.LocationEntity = FAISmart_EntityId(FAIBlackboardNativeKey::SelfEntity, EAISmartValue(0));
        this.SelfEntity = FAISmart_EntityId(FAIBlackboardNativeKey::SelfEntity, EAISmartValue(0));
        this.Location.AddVectorFilter(this, n"Location");
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_54 = 0;
        AECSRegionVolume local_60;
        AECSCombatRegionVolume local_64;
        if (!(this.bCheckNavMesh) && !(this.bCheckCombatArea))
        {
            return true;
        }
        UBlackboardComponent local_4 = Context.GetBlackboardComponent();
        FVector local_12;
        FECSEntity local_24 = FECSEntity(this.SelfEntity.GetValue(Context.opImplConv()));
        if (this.bUseEntityLocation)
        {
            if (!(FECSEntity(this.LocationEntity.GetValue(Context.opImplConv()))))
            {
                return false;
            }
            Get local_32;
            local_12 = local_32.opCall().GetPosition();
        }
        else
        {
            local_12 = local_4.GetValueAsVector(this.Location.SelectedKeyName);
        }
        if (this.bCheckNavMesh)
        {
            switch (int(this.CheckNavReachableType))
            {
            case 1:
            {
                if (!(FAIPathFollowUtils::IsPointOnNavigation(local_24, local_12, FVector(100.0, 100.0, 800.0))))
                {
                    return false;
                }
                break;
            }
            case 2:
            {
                if (!(::FAINavigationUtils::IsTargetLocationFlyReachable(local_24, local_12)))
                {
                    return false;
                }
                break;
            }
            case 0:
            {
                if (!(FAIPathFollowUtils::IsPointOnNavigation(local_24, local_12, FVector(100.0, 100.0, 800.0))) && !(::FAINavigationUtils::IsTargetLocationFlyReachable(local_24, local_12)))
                {
                    return false;
                }
                break;
            }
            }
        }
        if (this.bCheckCombatArea)
        {
            if (!(::FEcologySceneInfoUtils::FindCreatureTargetCombatRegion(local_24)))
            {
                return false;
            }
            if (!(local_54))
            {
                return false;
            }
            AActor local_56;
            local_60 = (Cast<AECSRegionVolume>(local_56));
            if (local_60 == nullptr || !(local_60.bAffectCombat))
            {
                return false;
            }
            if (this.UsePreferInnerVolume)
            {
                local_64 = (Cast<AECSCombatRegionVolume>(local_60));
                if (local_64 != nullptr && (local_64.PreferAreaPoints.Num() >= 3))
                {
                    return local_64.IsPointInPreferArea(local_12);
                }
                return local_60.EncompassesPoint(local_12, 0.0f);
            }
            return local_60.EncompassesPoint(local_12, 0.0f);
        }
        return true;
    }
}

