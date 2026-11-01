namespace PresentationSpotUtils
{
FM_SpotRegistry& GetDefaultRegistry(const UObject WorldContextObject)
{
    UObject local_2;
    if ((!((local_2 != nullptr))))
    {
        local_2 = Cast<UObject>(GetCurrentWorld());
    }
    FMS_SpotRegistries& local_8 = FMS_SpotRegistries::Get(local_2);
    bool local_3 = !(local_8.GetDefaultRegistry());
    if (local_3)
    {
        local_3 = true;
        FM_SpotRegistry& local_14 = FM_SpotRegistry::Create(local_2, n"Default", local_3);
        local_14.SetDefaultDisplayScopeInternal(EPresentationSpotDisplayScope(0));
        local_8.SetDefaultRegistry(TEUIModelRef<FM_SpotRegistry>(local_14));
    }
    TEUIModelRef<FM_SpotRegistry> local_10 = local_8.GetDefaultRegistry();
    return local_3;
}
FM_SpotRegistry& GetLevelSpotRegistry(const UObject WorldContextObject)
{
    UObject local_2;
    if ((!((local_2 != nullptr))))
    {
        local_2 = Cast<UObject>(GetCurrentWorld());
    }
    FMS_SpotRegistries& local_8 = FMS_SpotRegistries::Get(local_2);
    bool local_3 = !(local_8.GetLevelSpotRegistry());
    if (local_3)
    {
        local_3 = true;
        FM_SpotRegistry& local_14 = FM_SpotRegistry::Create(local_2, n"LevelSpot", local_3);
        local_14.SetDefaultDisplayScopeInternal(EPresentationSpotDisplayScope(0));
        local_8.SetLevelSpotRegistry(TEUIModelRef<FM_SpotRegistry>(local_14));
    }
    TEUIModelRef<FM_SpotRegistry> local_10 = local_8.GetLevelSpotRegistry();
    return local_3;
}
FM_SpotRegistry& GetMapRegistry(const UObject WorldContextObject, const TDataObjectPtr<FMapConfig> &inout MapConfig)
{
    int local_8 = 0;
    FMS_SpotRegistries& local_2 = FMS_SpotRegistries::Get(WorldContextObject);
    if (!(local_2.GetMapRegistries().Contains(MapConfig)))
    {
        FName local_5 = MapConfig.opArrow().GetDataName();
        local_8.SetDefaultDisplayScopeInternal(EPresentationSpotDisplayScope(1));
        local_2.GetModify_MapRegistries().Add(MapConfig, TEUIModelRef<FM_SpotRegistry>(local_8));
    }
    return local_2.GetMapRegistries()[MapConfig].Get();
}
TDataObjectPtr<FMapConfig> GetCurrentMapConfig(const UObject WorldContextObject)
{
    UWorld local_4 = WorldContextObject.GetWorld();
    if ((!(!(!((local_4 != nullptr))))))
    {
        return TDataObjectPtr<FMapConfig>();
    }
    TDataObjectPtr<FMapConfig> local_78;
    TDataObjectPtr<FLevelInfoConfig> local_102 = FLevelUtils::GetCurrentLevelInfoConfig(local_4);
    if (local_102)
    {
        local_78 = local_102.opArrow().GetMapConfig();
    }
    else
    {
        local_78 = (TDataObjectPtr<FMapConfig>(FMapUtils::GetMapConfigByRefrence(TSoftObjectPtr<UWorld>(local_4))));
    }
    return local_78;
}
TEUIModelRef<FM_SpotRegistry> GetCurrentMapRegistry(const UObject WorldContextObject)
{
    TDataObjectPtr<FMapConfig> local_24 = PresentationSpotUtils::GetCurrentMapConfig(WorldContextObject);
    if (!(local_24))
    {
        return TEUIModelRef<FM_SpotRegistry>();
    }
    return TEUIModelRef<FM_SpotRegistry>(PresentationSpotUtils::GetMapRegistry(WorldContextObject, local_24));
}
FM_SpotRegistry& GetDefaulted(const UObject WorldContext, const TEUIModelRef<FM_SpotRegistry> &inout Registry)
{
    if (!(Registry))
    {
        return PresentationSpotUtils::GetDefaultRegistry(WorldContext);
    }
    return Registry.Get();
}
FSpotView GetDefaultView(const UObject WorldContextObject)
{
    FSpotView __r;
    FMS_CommonSpotViews::Get(WorldContextObject).GetOrCreateGlobalDefaultView();
    return __r;
}
FM_Spot& CreateSpot(const UObject WorldContextObject, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    return (PresentationSpotUtils::GetDefaulted(WorldContextObject, Registry)).CreateSpot();
}
void RemoveSpot(const TEUIModelRef<FM_Spot> &inout Spot, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    if (Spot)
    {
        FM_SpotRegistry& local_6 = PresentationSpotUtils::GetDefaulted(Spot.opArrow().GetManager(), Registry);
        local_6.RemoveSpot(Spot);
    }
    return;
}
bool IsEntitySpot(const TEUIModelRef<FM_Spot> &inout Spot)
{
    if (!(Spot))
    {
        return false;
    }
    TConstRawPtr<FSpotByEntityIdData> local_8 = FMS_SpotByEntityId::Get(Spot.opArrow().GetManager()).GetEntityIdToSpotsMap().Find(GetOwnerEntityId(Spot.opArrow()));
    if (local_8)
    {
        TEUIModelWeakRef<FM_Spot> local_12;
        local_12 = local_8.opArrow().EntitySpot;
        return (local_12 == Spot.opImplConv());
    }
    return false;
}
TEUIModelRef<FM_Spot> GetEntitySpot(const UObject WorldContextObject, const FECSEntityId &inout EntityId)
{
    TConstRawPtr<FSpotByEntityIdData> local_2 = FMS_SpotByEntityId::Get(WorldContextObject).GetEntityIdToSpotsMap().Find(EntityId);
    if (local_2)
    {
        return local_2.opArrow().EntitySpot.AsRef();
    }
    return TEUIModelRef<FM_Spot>();
}
FM_Spot AcquireEntitySpotForRead(const UObject WorldContextObject, const FECSEntityId &inout EntityId)
{
    FM_Spot __r;
    FMS_SpotByEntityId& local_2 = FMS_SpotByEntityId::Get(WorldContextObject);
    TConstRawPtr<FSpotByEntityIdData> local_4 = local_2.GetEntityIdToSpotsMap().Find(EntityId);
    if (local_4)
    {
        FM_Spot& local_10 = local_4.opArrow().EntitySpot.Get();
        if (local_10)
        {
        }
        else
        {
        }
    }
    FM_Spot& local_10_2 = FM_Spot::Create(WorldContextObject);
    local_10_2.SetEntityIdInternal(EntityId);
    local_2.RegisterEntitySpot(local_10_2, EntityId);
    return __r;
}
FM_Spot& RequireEntitySpot(const UObject WorldContextObject, const FECSEntityId &inout EntityId, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    bool local_9 = false;
    FMS_SpotByEntityId& local_2 = FMS_SpotByEntityId::Get(WorldContextObject);
    FM_SpotRegistry& local_4 = PresentationSpotUtils::GetDefaulted(WorldContextObject, Registry);
    TConstRawPtr<FSpotByEntityIdData> local_6 = local_2.GetEntityIdToSpotsMap().Find(EntityId);
    if (local_6)
    {
        FM_Spot& local_12 = local_6.opArrow().EntitySpot.Get();
        if (local_12)
        {
            local_9 = (GetOwnerEntityId(local_12) == ENTITY_ID_NULL);
            if (local_9)
            {
                local_12.SetEntityIdInternal(EntityId);
            }
            local_4.AddSpot(TEUIModelRef<FM_Spot>(local_12));
        }
        else
        {
        }
    }
    FM_Spot& local_12_2 = local_4.CreateSpot();
    local_12_2.SetEntityIdInternal(EntityId);
    local_2.RegisterEntitySpot(local_12_2, EntityId);
    return local_9;
}
void BindEntitySpot(const TEUIModelRef<FM_Spot> &inout Spot, const FECSEntityId &inout EntityId)
{
    if (!(Spot))
    {
        return;
    }
    Spot.opArrow().SetEntityIdInternal(EntityId);
    FMS_SpotByEntityId::Get(Spot.opArrow().GetManager()).RegisterEntitySpot(Spot.Get(), EntityId);
    return;
}
TArray<TEUIModelRef<FM_Spot>> FindSpotsByEntityId(const UObject WorldContextObject, const FECSEntityId &inout EntityId, const TEUIModelRef<FM_SpotRegistry> &inout SpecificRegistry = FEUIModelRef())
{
    TArray<TEUIModelRef<FM_Spot>> local_4;
    TConstRawPtr<FSpotByEntityIdData> local_6 = FMS_SpotByEntityId::Get(WorldContextObject).GetEntityIdToSpotsMap().Find(EntityId);
    if (local_6)
    {
        for (auto& local_24 : local_6.opArrow().Spots)
        {
            if (local_24 && (!(SpecificRegistry) || SpecificRegistry.opArrow().HasSpot(TEUIModelRef<FM_Spot>(local_24.Get()))))
            {
                local_4.Add(TEUIModelRef<FM_Spot>(local_24.Get()));
            }
        }
    }
    return local_4;
}
FVector GetSpotLocation(const TEUIModelRef<FM_Spot> &inout Spot)
{
    if (!(Spot))
    {
        return FVector::ZeroVector;
    }
    return Spot.opArrow().GetCachedLocation();
}
float GetDistanceToPlayerSq(const TEUIModelRef<FM_Spot> &inout Spot)
{
    if (!(Spot))
    {
        return 0.0;
    }
    return Spot.opArrow().GetCachedDistanceToPlayerSq(PresentationSpotUtils::GetLocalPlayerPositionForDistance(Spot));
}
float GetDistanceToPlayer(const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FMath::Sqrt(PresentationSpotUtils::GetDistanceToPlayerSq(Spot));
}
float GetDistanceToPlayer2D(const TEUIModelRef<FM_Spot> &inout Spot)
{
    if (!(Spot))
    {
        return 0.0;
    }
    return Spot.opArrow().GetCachedDistanceToPlayer2D(PresentationSpotUtils::GetLocalPlayerPositionForDistance(Spot));
}
bool MatchesDisplayRule(const TEUIModelRef<FM_Spot> &inout Spot, const FPresentationDisplayRule &inout DisplayRule)
{
    if (!(Spot))
    {
        return false;
    }
    return PresentationSpotUtils_Internal::ComputeMatchesDisplayRule(Spot, DisplayRule);
}
bool CompareDistance(const FVector &inout SourceLocation, const TEUIModelRef<FM_Spot> &inout SpotA, const TEUIModelRef<FM_Spot> &inout SpotB, const bool bInverse = false)
{
    FVector local_6 = PresentationSpotUtils::GetSpotLocation(SpotA);
    bool local_25 = ((!((local_6.DistSquared(SourceLocation) < PresentationSpotUtils::GetSpotLocation(SpotB).DistSquared(SourceLocation)))) != !(bInverse));
    return local_25;
}
FVector GetLocalPlayerPositionForDistance(const TEUIModelRef<FM_Spot> &inout Spot)
{
    if (!(!(Spot)) && Spot.opArrow().GetContext().GetLocalPlayerPawn())
    {
        return FTransformUtils::GetLocation(Spot.opArrow().GetContext().GetLocalPlayerPawn(), FFPTime(-1));
    }
    return FVector::ZeroVector;
}
bool ConvertSpotPositionToRenderTranslation(const TEUIModelRef<FM_Spot> &inout Spot, FVector2D &out OutTranslation, const FVector &inout Offset = FVector::ZeroVector)
{
    APlayerController local_30;
    FVector2D local_4;
    OutTranslation = local_4;
    if (!(Spot))
    {
        return false;
    }
    FVector local_24 = (PresentationSpotUtils::GetSpotLocation(Spot) + Offset);
    FVector2D local_28;
    FECSEntity local_34 = Spot.opArrow().GetContext().GetLocalPlayer();
    Get local_38;
    const FC_PlayerController& local_40 = local_38.opCall();
    if (local_40)
    {
        local_30 = local_40.GetUEPlayerController().Get();
    }
    if ((!((local_30 != nullptr))))
    {
        return false;
    }
    if (!(WidgetLayout::ProjectWorldLocationToWidgetPosition(local_30, local_24, local_28, false)))
    {
        return false;
    }
    OutTranslation = local_28;
    return true;
}
}
namespace PresentationSpotUtils_Internal
{
FVector ComputeSpotLocation(const TEUIModelRef<FM_Spot> &inout Spot)
{
    int local_96 = 0;
    const AActor local_120;
    const FPresentationSpotTransform& local_2 = Spot.opArrow().GetTransform();
    FSpotViewAdapter local_10;
    TDataObjectPtr<FPresentationConfig> local_34 = GetPresentationConfig(Spot.opArrow(), local_10);
    if (local_34)
    {
        FVector local_66(FVector::ZeroVector);
        FECSEntity local_70 = FECSEntity(GetOwnerEntityId(Spot.opArrow()));
        if (local_70)
        {
            FPresentationSpotOffset local_86;
            FECSEntity local_80 = FASCommonUtils::GetControlledPawnEntity(local_70);
            switch (local_86.OffsetType)
            {
            case EPresentationSpotOffsetType::UseAnchor:
            {
                if (!(local_96))
                {
                    break;
                }
                else
                {
                    switch (local_86.AnchorType)
                    {
                    case EPresentationSpotAnchorType::Top:
                    {
                        float32 local_105 = local_96.GetScaledHalfHeight();
                        local_66 = (FVector(FVector::UpVector) * local_105);
                        break;
                    }
                    case EPresentationSpotAnchorType::Bottom:
                    {
                        FVector local_104_2 = FVector(FVector::DownVector);
                        float32 local_105_2 = local_96.GetScaledHalfHeight();
                        local_66 = (local_104_2 * local_105_2);
                        break;
                    }
                    case EPresentationSpotAnchorType::Center:
                    {
                        break;
                    }
                    }
                    break;
                }
            }
            case EPresentationSpotOffsetType::UseSocket:
            {
                FName local_116 = local_86.SocketName;
                if (local_116.IsNone())
                {
                    break;
                }
                else
                {
                    local_120 = local_80.GetActor();
                    if ((!((local_120 != nullptr))))
                    {
                        break;
                    }
                    else
                    {
                        local_66 = (local_120.GetSocketLocation(local_116) - local_2.GetPosition());
                        break;
                    }
                }
            }
            case EPresentationSpotOffsetType::NoOffset:
            {
                break;
            }
            }
        }
        if (local_2.HasRotation())
        {
            FVector3f local_128;
            local_66 += FVector(local_2.GetRotator().RotateVector(local_128));
        }
        float32 local_105_3 = local_34.opArrow().SpotOffset.AdditionalZOffset;
        local_66.Z += local_105_3;
        return (local_2.GetPosition() + local_66);
    }
    return local_2.GetPosition();
}
bool ComputeMatchesDisplayRule(const TEUIModelRef<FM_Spot> &inout Spot, const FPresentationDisplayRule &inout DisplayRule)
{
    if (!(Spot))
    {
        return false;
    }
    int local_2 = PresentationSpotUtils_Internal::FindFirstMatchDisplayRuleIndex(Spot, DisplayRule.ConditionalRules);
    if (local_2 != INDEX_NONE)
    {
        return PresentationSpotUtils_Internal::MatchesDisplayRuleBasic(Spot, DisplayRule.ConditionalRules[local_2].Rule);
    }
    if (DisplayRule.bDisplayOnlyInCombat)
    {
        if (!(FASCommonUtils::IsInCombat(Spot.opArrow().GetContext().GetLocalPlayerPawn())))
        {
            return false;
        }
    }
    if (!(DisplayRule.bEnableDisplay))
    {
        return false;
    }
    float local_10 = PresentationSpotUtils::GetDistanceToPlayerSq(Spot);
    if (local_10 < FMath::Square(DisplayRule.MinDistance))
    {
        return false;
    }
    if (DisplayRule.MaxDistance > 0.0f && ((local_10 > FMath::Square(DisplayRule.MaxDistance))))
    {
        return false;
    }
    return true;
}
bool MatchesDisplayRuleBasic(const TEUIModelRef<FM_Spot> &inout Spot, const FPresentationDisplayRuleBasic &inout BasicRule)
{
    if (!(BasicRule.bEnableDisplay))
    {
        return false;
    }
    float local_4 = PresentationSpotUtils::GetDistanceToPlayerSq(Spot);
    if (local_4 < FMath::Square(BasicRule.MinDistance))
    {
        return false;
    }
    if (BasicRule.MaxDistance > 0.0f && ((local_4 > FMath::Square(BasicRule.MaxDistance))))
    {
        return false;
    }
    return true;
}
int FindFirstMatchDisplayRuleIndex(const TEUIModelRef<FM_Spot> &inout Spot, const TArray<FPresentationDisplayConditionalRule> &inout ConditionalRules)
{
    bool local_9;
    int local_1 = 0;
    for (; local_1 < ConditionalRules.Num(); ++local_1)
    {
        const FPresentationDisplayConditionalRule& local_6 = ConditionalRules[local_1];
        if (int(local_6.Condition.PlayerInCombat) != 0)
        {
            local_9 = false;
            FECSEntity local_14 = FECSEntity(Spot.opArrow().GetContext().GetLocalPlayerPawn());
            if (local_14)
            {
                local_9 = FASCommonUtils::IsInCombat(local_14);
            }
            if (!(PresentationSpotUtils_Internal::ConditionRequirementToBool(EPresentationDisplayConditionRequirement(local_6.Condition.PlayerInCombat))) != !(local_9))
            {
                continue;
            }
        }
        if (int(local_6.Condition.EntityInCombat) != 0)
        {
            local_9 = false;
            FECSEntity local_14_2 = FECSEntity(GetOwnerEntityId(Spot.opArrow()));
            if (local_14_2)
            {
                FECSEntity local_24 = FASCommonUtils::GetControlledPawnEntity(local_14_2);
                if (local_24)
                {
                    local_9 = FASCommonUtils::IsInCombat(local_24);
                }
            }
            bool local_4 = !(local_9);
            if (!(PresentationSpotUtils_Internal::ConditionRequirementToBool(EPresentationDisplayConditionRequirement(local_6.Condition.EntityInCombat))) != local_4)
            {
                continue;
            }
        }
        return local_1;
    }
    return INDEX_NONE;
}
bool ConditionRequirementToBool(const EPresentationDisplayConditionRequirement Requirement)
{
    switch (int(Requirement))
    {
        case 1:
            return true;
        case 2:
            return false;
        default:
            return false;
    }
}
}
