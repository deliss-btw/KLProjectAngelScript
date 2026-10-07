
enum ECheckNavReachableType
{
    Any,
    Ground,
    Air,
}


class UBTDecorator_CheckLocationIsInCombatAreaAndNav : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    bool bUseSelfLocation = false;
    UPROPERTY()
    bool bCheckNavMesh = true;
    UPROPERTY()
    ECheckNavReachableType CheckNavReachableType = ECheckNavReachableType(1);
    UPROPERTY()
    bool bCheckCombatArea = true;
    UPROPERTY()
    bool UsePreferInnerVolume = false;
    UPROPERTY()
    FBlackboardKeySelector Location;
    UPROPERTY()
    FAISmart_EntityId SelfEntity = FAISmart_EntityId(FAIBlackboardNativeKey::SelfEntity, EAISmartValue(0));

    default SetbAllowAbortLowerPri(true);
    default SetbAllowAbortChildNodes(true);
    default SetNodeName("Check Location Is In Combat Area and Nav");


    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        AECSRegionVolume local_188;
        AECSCombatRegionVolume local_194;
        if (!(this.bCheckNavMesh) && !(this.bCheckCombatArea))
        {
            return true;
        }
        UBlackboardComponent local_4 = Context.GetBlackboardComponent();
        FVector local_12;
        FECSEntity local_24 = FECSEntity(this.SelfEntity.GetValue(Context.opImplConv()));
        if (this.bUseSelfLocation)
        {
            Get local_28;
            local_12 = local_28.opCall().GetPosition();
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
            FECSRuntimeQuery local_88 = FECSRuntimeQueryHelper::MakeRuntimeQuery(Context.PawnEntity, EECSQueryRegsitryType(1), false);
            Include local_132;
            local_132.opCall();
            FECSRuntimeQueryIterator local_154 = local_88.Iterator();
            for (; local_154.CanProceed;)
            {
                local_154.Proceed();
                AActor local_184;
                local_188 = Cast<AECSRegionVolume>(local_184);
                if (local_188 != nullptr && local_188.bAffectCombat)
                {
                    bool local_189;
                    local_189 = false;
                    if (this.UsePreferInnerVolume)
                    {
                        local_194 = Cast<AECSCombatRegionVolume>(local_188);
                        if (local_194 != nullptr)
                        {
                            if (local_194.PreferAreaPoints.Num() >= 3)
                            {
                                local_189 = local_194.IsPointInPreferArea(local_12);
                            }
                            else
                            {
                                local_189 = local_188.EncompassesPoint(local_12, 0.0f);
                            }
                        }
                        else
                        {
                            local_189 = local_188.EncompassesPoint(local_12, 0.0f);
                        }
                    }
                    else
                    {
                        local_189 = local_188.EncompassesPoint(local_12, 0.0f);
                    }
                    if (local_189)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        return true;
    }
}

