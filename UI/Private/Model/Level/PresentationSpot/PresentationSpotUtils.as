
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
    bool local_3 = !(local_2.GetMapRegistries().Contains(MapConfig));
    if (local_3)
    {
        local_3 = true;
        FName local_5 = MapConfig.opArrow().GetDataName();
        local_8.SetDefaultDisplayScopeInternal(EPresentationSpotDisplayScope(1));
        local_2.GetModify_MapRegistries().Add(MapConfig, TEUIModelRef<FM_SpotRegistry>(local_8));
    }
    return local_3;
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
        TDataObjectPtr<FMapConfig> local_30;
        FMapUtils::GetMapConfigByRefrence(TSoftObjectPtr<UWorld>(local_4));
        local_78 = local_30;
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
    FM_Spot& local_10;
    FM_Spot __r;
    FMS_SpotByEntityId& local_2 = FMS_SpotByEntityId::Get(WorldContextObject);
    if (local_2.GetEntityIdToSpotsMap().Find(EntityId))
    {
        if (local_10)
        {
        }
        else
        {
        }
    }
    local_10 = FM_Spot::Create(WorldContextObject);
    local_10.SetEntityIdInternal(EntityId);
    local_2.RegisterEntitySpot(local_10, EntityId);
    return __r;
}
FM_Spot& RequireEntitySpot(const UObject WorldContextObject, const FECSEntityId &inout EntityId, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    bool local_9 = false;
    FM_Spot& local_12;
    FMS_SpotByEntityId& local_2 = FMS_SpotByEntityId::Get(WorldContextObject);
    FM_SpotRegistry& local_4 = PresentationSpotUtils::GetDefaulted(WorldContextObject, Registry);
    if (local_2.GetEntityIdToSpotsMap().Find(EntityId))
    {
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
    local_12 = local_4.CreateSpot();
    local_12.SetEntityIdInternal(EntityId);
    local_2.RegisterEntitySpot(local_12, EntityId);
    return local_9;
}
void BindEntitySpot(const TEUIModelRef<FM_Spot> &inout Spot, const FECSEntityId &inout EntityId)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<TEUIModelRef<FM_Spot>> FindSpotsByEntityId(const UObject WorldContextObject, const FECSEntityId &inout EntityId, const TEUIModelRef<FM_SpotRegistry> &inout SpecificRegistry = FEUIModelRef())
{
    TEUIModelRef<FM_Spot> local_26;
    TArray<TEUIModelRef<FM_Spot>> local_4;
    TConstRawPtr<FSpotByEntityIdData> local_6 = FMS_SpotByEntityId::Get(WorldContextObject).GetEntityIdToSpotsMap().Find(EntityId);
    if (local_6)
    {
        for (auto& local_24 : local_6.opArrow().Spots)
        {
            if (local_24 && (!(SpecificRegistry) || SpecificRegistry.opArrow().HasSpot(local_26)))
            {
                local_4.Add(local_26);
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
        TWeakObjectPtr<AECSPlayerController> local_42 = local_40.GetUEPlayerController();
        AECSPlayerController local_44;
        local_30 = local_44;
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
            switch (int(local_86.OffsetType))
            {
            case 1:
            {
                if (!(local_96))
                {
                    break;
                }
                else
                {
                    switch (int(local_86.AnchorType))
                    {
                    case 0:
                    {
                        float32 local_105 = local_96.GetScaledHalfHeight();
                        local_66 = (FVector(FVector::UpVector) * local_105);
                        break;
                    }
                    case 1:
                    {
                        FVector local_104_2 = FVector(FVector::DownVector);
                        float32 local_105_2 = local_96.GetScaledHalfHeight();
                        local_66 = (local_104_2 * local_105_2);
                        break;
                    }
                    case 2:
                    {
                        break;
                    }
                    }
                    break;
                }
            }
            case 2:
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
            case 0:
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
    int __r; return __r;
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
