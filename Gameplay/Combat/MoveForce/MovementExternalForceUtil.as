

// NOTE: class defaults are not authored in this module: AMovementExternalRadialForce (default scalar field AECSPrefab.bHasActor has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FT_MovementRadialForce : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MovementRadialForce_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MovementRadialForce, NAME_None);
    UPROPERTY()
    FC_MovementRadialForce Config_FC_MovementRadialForce;

    FT_MovementRadialForce()
    {
        return;
    }
}

class AMovementExternalRadialForce : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_MovementRadialForce ForceData;

    AMovementExternalRadialForce()
    {
        return;
    }
}

struct FT_MovementBoxForce : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MovementBoxForce_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MovementBoxForce, NAME_None);
    UPROPERTY()
    FC_MovementBoxForce Config_FC_MovementBoxForce;

    FT_MovementBoxForce()
    {
        return;
    }
}

class AMovementExternalBoxForce : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_MovementBoxForce ForceData;

    AMovementExternalBoxForce()
    {
        return;
    }
}

namespace MovementExternalForceUtil
{
UFUNCTION()
FECSEntity CreateRadialForce(const FVector &inout Location, const float32 Radius = 1000.f, const float32 InnerRadius = 20.f, const float32 Force = 4000.f, const float32 MaxSpeed = 1000.f, const float32 Duration = 4.f)
{
    int local_14 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_8 = ECS::RequestEntityByPrefabDeferred(AMovementExternalRadialForce, Location, FRotator::ZeroRotator, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    local_14.SetStartSeconds(ECS::GetECSWorld().GetFixedTime().Time);
    local_14.SetRadius(Radius);
    local_14.SetInnerRadius(InnerRadius);
    local_14.SetForce(Force);
    local_14.SetMaxSpeed(MaxSpeed);
    local_14.SetDuration(Duration);
    return local_8;
}
UFUNCTION()
FECSEntity CreateRadialForceEx(const FVector &inout Location, const FC_MovementRadialForce &inout Settings, const EFaction Faction)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_8 = ECS::RequestEntityByPrefabDeferred(AMovementExternalRadialForce, Location, FRotator::ZeroRotator, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    if (int(Faction) != 0)
    {
        ModifyOrAdd local_18;
        local_18.opCall().SetFactionId();
    }
    int local_20 = Settings;
    local_20.SetStartSeconds(ECS::GetECSWorld().GetFixedTime().Time);
    return local_8;
}
UFUNCTION()
FECSEntity CreateBoxForce(const FVector &inout Location, const FRotator &inout Rotation, const FVector &inout HalfExtend = FVector(500.f,100.f,100.f), const float32 Force = 4000.f, const float32 MaxSpeed = 1000.f, const float32 Duration = 4.f)
{
    int local_14 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_8 = ECS::RequestEntityByPrefabDeferred(AMovementExternalBoxForce, Location, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    local_14.SetStartSeconds(ECS::GetECSWorld().GetFixedTime().Time);
    local_14.SetHalfExtend(HalfExtend);
    local_14.SetForce(Force);
    local_14.SetMaxSpeed(MaxSpeed);
    local_14.SetDuration(Duration);
    return local_8;
}
UFUNCTION()
FECSEntity CreateBoxForceEx(const FVector &inout Location, const FRotator &inout Rotation, const FC_MovementBoxForce &inout Settings, const EFaction Faction)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_8 = ECS::RequestEntityByPrefabDeferred(AMovementExternalBoxForce, Location, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    if (int(Faction) != 0)
    {
        ModifyOrAdd local_18;
        local_18.opCall().SetFactionId();
    }
    int local_20 = Settings;
    local_20.SetStartSeconds(ECS::GetECSWorld().GetFixedTime().Time);
    return local_8;
}
UFUNCTION()
void AddRadialForceToEntity(const FECSEntity &inout Entity, const float32 Radius = 1000.f, const float32 InnerRadius = 20.f, const float32 Force = 4000.f, const float32 MaxSpeed = 1000.f, const float32 Duration = 4.f)
{
    int local_2 = 0;
    local_2.SetStartSeconds(ECS::GetECSWorld().GetFixedTime().Time);
    local_2.SetRadius(Radius);
    local_2.SetInnerRadius(InnerRadius);
    local_2.SetForce(Force);
    local_2.SetMaxSpeed(MaxSpeed);
    local_2.SetDuration(Duration);
    return;
}
UFUNCTION()
void AddBoxForceToEntity(const FECSEntity &inout Entity, const FVector &inout HalfExtend = FVector(500.f,100.f,100.f), const float32 Force = 4000.f, const float32 MaxSpeed = 1000.f, const float32 Duration = 4.f)
{
    int local_2 = 0;
    local_2.SetStartSeconds(ECS::GetECSWorld().GetFixedTime().Time);
    local_2.SetHalfExtend(HalfExtend);
    local_2.SetForce(Force);
    local_2.SetMaxSpeed(MaxSpeed);
    local_2.SetDuration(Duration);
    return;
}
}
