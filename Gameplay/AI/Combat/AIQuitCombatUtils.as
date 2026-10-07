
namespace FAIQuitCombatUtils
{
    const FName MuteCombatSource = n"ReturnToHome";

FAIQuitCombatConfig GetQuitCombatConfig(const FECSEntity &inout Entity)
{
    FAIQuitCombatConfig __r;
    bool local_49 = !((FASCommonUtils::GetCombatUnitBaseConfig(Entity) == nullptr));
    if (!(local_49))
    {
        local_49 = false;
    }
    else
    {
        TDataObjectPtr<FAIQuitCombatConfig> local_74;
        local_74 = GetQuitCombatConfig();
        local_49 = !((local_74 == nullptr));
    }
    if (local_49)
    {
    }
    else
    {
    }
    return __r;
}
EAIQuitCombatRule GetQuitCombatRule(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AIQuitCombatRuleOverride& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.OverrideRule;
    }
    return FAIQuitCombatUtils::GetQuitCombatConfig(Entity).QuitCombatRule;
}
void SetQuitCombatRuleOverride(const FECSEntity &inout Entity, const EAIQuitCombatRule NewRule)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    FC_AIQuitCombatRuleOverride local_8;
    local_8.OverrideRule = NewRule;
    if (int(NewRule) == 2)
    {
        Remove local_14;
        local_14.opCall();
        Remove local_18;
        local_18.opCall();
        Remove local_22;
        local_22.opCall();
        Has local_26;
        bool local_1 = local_26.opCall();
        if (local_1)
        {
            FAIQuitCombatUtils::ClearReturnToHome(Entity);
        }
    }
    return;
}
void ClearQuitCombatRuleOverride(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Remove local_6;
    local_6.opCall();
    return;
}
void BeginQuitCombatCheck(const FECSEntity &inout Entity, const FVector &inout AnchorPosition, const FVector &inout HomeLocation)
{
    int local_10 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if ((int(FAIQuitCombatUtils::GetQuitCombatRule(Entity))) == 2)
    {
        return;
    }
    local_10.CheckStartTime = ECS::GetContextTime();
    FC_AIQuitCombatInfo local_18;
    local_18.HomeResource = FECSEntity();
    local_18.TargetCombatArea = FECSEntity();
    local_18.AnchorPosition = AnchorPosition;
    local_18.bHasAnchorPosition = true;
    local_18.HomeLocation = HomeLocation;
    local_18.bHasHomeLocation = true;
    FAIKnowledgeUtils::SetAIBlackboardValueVector(Entity, n"HomeLocation", local_18.HomeLocation);
    FAIKnowledgeUtils::SetAIBlackboardValueEntityId(Entity, n"HomeResource", ENTITY_ID_NULL);
    return;
}
void BeginQuitCombatCheckWithCombatArea(const FECSEntity &inout Entity, const FECSEntity &inout CombatArea)
{
    int local_12 = 0;
    if (!(Entity.IsValid()) || !(CombatArea.IsValid()))
    {
        return;
    }
    if ((int(FAIQuitCombatUtils::GetQuitCombatRule(Entity))) == 2)
    {
        return;
    }
    local_12.CheckStartTime = ECS::GetContextTime();
    FC_AIQuitCombatInfo local_20;
    local_20.HomeResource = FECSEntity();
    local_20.HomeLocation = FVector::ZeroVector;
    local_20.AnchorPosition = FVector::ZeroVector;
    local_20.bHasAnchorPosition = false;
    local_20.TargetCombatArea = CombatArea;
    local_20.bHasHomeLocation = FAIQuitCombatUtils::GetHomeLocation(Entity, CombatArea, local_20.HomeLocation, local_20.HomeResource);
    FAIKnowledgeUtils::SetAIBlackboardValueVector(Entity, n"HomeLocation", local_20.HomeLocation);
    FECSEntityId local_26;
    if (local_20.HomeResource.IsValid())
    {
        local_26 = local_20.HomeResource.GetId();
    }
    else
    {
        local_26 = ENTITY_ID_NULL;
    }
    FAIKnowledgeUtils::SetAIBlackboardValueEntityId(Entity, n"HomeResource", local_26);
    return;
}
void BeginQuitCombatCheckWithAnchorPosition(const FECSEntity &inout Entity, const FVector &inout AnchorPosition)
{
    int local_10 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if ((int(FAIQuitCombatUtils::GetQuitCombatRule(Entity))) == 2)
    {
        return;
    }
    local_10.CheckStartTime = ECS::GetContextTime();
    FC_AIQuitCombatInfo local_18;
    local_18.HomeResource = FECSEntity();
    local_18.HomeLocation = FVector::ZeroVector;
    local_18.TargetCombatArea = FECSEntity();
    local_18.AnchorPosition = AnchorPosition;
    local_18.bHasAnchorPosition = true;
    local_18.bHasHomeLocation = FAIQuitCombatUtils::GetHomeLocation(Entity, FECSEntity(), local_18.HomeLocation, local_18.HomeResource);
    if (!(local_18.bHasHomeLocation))
    {
        local_18.HomeLocation = AnchorPosition;
        local_18.bHasHomeLocation = true;
    }
    FAIKnowledgeUtils::SetAIBlackboardValueVector(Entity, n"HomeLocation", local_18.HomeLocation);
    FECSEntityId local_24;
    if (local_18.HomeResource.IsValid())
    {
        local_24 = local_18.HomeResource.GetId();
    }
    else
    {
        local_24 = ENTITY_ID_NULL;
    }
    FAIKnowledgeUtils::SetAIBlackboardValueEntityId(Entity, n"HomeResource", local_24);
    return;
}
void EndQuitCombatCheck(const FECSEntity &inout Entity, const bool bStopReturnToHome = true)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Remove local_6;
    local_6.opCall();
    if (bStopReturnToHome)
    {
        FAIQuitCombatUtils::ClearReturnToHome(Entity);
    }
    return;
}
bool GetHomeLocation(const FECSEntity &inout Entity, const FECSEntity &inout CombatArea, FVector &inout OutHomeLocation, FECSEntity &inout OutHomeResource)
{
    AECSVolumeBase local_30;
    if (!(Entity.IsValid()))
    {
        return false;
    }
    FECSEntityId local_7 = FEcologyBehaviorUtils::FindMainTargetResource(Entity);
    FECSEntity local_6 = FECSEntity(local_7);
    if (local_6)
    {
        Get local_16;
        const FC_Transform& local_18 = local_16.opCall();
        if (local_18)
        {
            OutHomeLocation = local_18.GetPosition();
            OutHomeResource = local_6;
            return true;
        }
    }
    if (CombatArea.IsValid())
    {
        Get local_22;
        const FC_RegionVolume& local_24 = local_22.opCall();
        if (local_24)
        {
            if (local_24.RegionVolume.IsValid())
            {
                AActor local_26;
                local_30 = (Cast<AECSVolumeBase>(local_26));
                if (local_30 != nullptr)
                {
                    OutHomeLocation = local_30.GetBounds().Origin;
                    OutHomeResource = FECSEntity();
                    return true;
                }
            }
        }
    }
    return false;
}
void ResetQuitCombatInfo(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_AIQuitCombatInfo& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.Reset();
    }
    FAIKnowledgeUtils::SetAIBlackboardValueBool(Entity, n"bIsReturnToHome", false);
    FAIKnowledgeUtils::SetAIBlackboardValueVector(Entity, n"HomeLocation", FVector::ZeroVector);
    FAIKnowledgeUtils::SetAIBlackboardValueEntityId(Entity, n"HomeResource", ENTITY_ID_NULL);
    return;
}
void ClearReturnToHome(const FECSEntity &inout Entity)
{
    Remove local_4;
    local_4.opCall();
    Remove local_10;
    local_10.opCall();
    FAIQuitCombatUtils::ResetQuitCombatInfo(Entity);
    if (FAIKnowledgeUtils::CanMuteCombat(Entity))
    {
        FAIKnowledgeUtils::RemoveMuteCombat(Entity, FAIQuitCombatUtils::MuteCombatSource);
    }
    return;
}
void BeginReturnToHome(const FECSEntity &inout Entity)
{
    FC_AIReturnToHomeTag local_6;
    Assign local_4;
    local_4.opCall(local_6);
    FAITargetingUtils::ClearSelfTargeting(Entity);
    FAIKnowledgeUtils::AddMuteCombat(Entity, FAIQuitCombatUtils::MuteCombatSource, true);
    return;
}
void EndReturnToHome(const FECSEntity &inout Entity)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    FAIQuitCombatUtils::ClearReturnToHome(Entity);
    return;
}
void CancelReturnToHomeIntent(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_AIQuitCombatInfo& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.bNeedReturnToHome = false;
    }
    FAIKnowledgeUtils::SetAIBlackboardValueBool(Entity, n"bIsReturnToHome", false);
    return;
}
bool CheckIsInCombatRange(const FECSEntity &inout Entity, const FC_AIQuitCombatInfo &inout QuitCombatInfo, const FC_Transform &inout Transform, const FAIQuitCombatConfig &inout QuitCombatConfig, const bool bCheckIn)
{
    bool local_45;
    if (!(Entity.IsValid()))
    {
        return false;
    }
    FVector local_8(FVector::ZeroVector);
    bool local_9 = false;
    if (QuitCombatInfo.bHasAnchorPosition)
    {
        local_8 = QuitCombatInfo.AnchorPosition;
        local_9 = true;
    }
    else
    {
        Get local_14;
        const FC_FlockMember& local_16 = local_14.opCall();
        if (local_16)
        {
            if (FECSEntity(local_16.FlockProxyEntity))
            {
                Get local_28;
                const FC_Transform& local_30 = local_28.opCall();
                if (local_30)
                {
                    local_8 = local_30.GetPosition();
                    local_9 = true;
                }
            }
        }
    }
    if (!(local_9))
    {
        XWarning(ELog(14), FString().Append("FAIQuitCombatUtils::CheckIsInCombatRange ").Append(Entity.GetEntityName()).Append(" no valid anchor position"));
        return false;
    }
    bool local_1 = (Transform.GetPosition().DistSquared(local_8) <= FMath::Square(QuitCombatConfig.CombatRadius));
    if (bCheckIn)
    {
        local_45 = local_1;
    }
    else
    {
        local_45 = !(local_1);
    }
    return local_45;
}
bool CheckFlockCombatArea(const FVector &inout AnchorPosition, const FC_Transform &inout Transform, const FAIQuitCombatConfig &inout QuitCombatConfig, const bool bCheckIn)
{
    int local_10;
    bool local_9 = (Transform.GetPosition().DistSquared(AnchorPosition) <= FMath::Square(QuitCombatConfig.CombatRadius));
    if (bCheckIn)
    {
        local_10 = local_9;
    }
    else
    {
        bool local_1 = !(local_9);
        local_10 = local_1;
    }
    return (local_10 != 0);
}
}
