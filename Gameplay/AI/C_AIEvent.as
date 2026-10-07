
namespace __INTENRAL_FCE_RequireNewTarget_NS
{
    const TECSEventDerivedPtr<FCE_RequireNewTarget> DerivedPtr = TECSEventDerivedPtr<FCE_RequireNewTarget>();
}
namespace __INTENRAL_FCE_AIEnterCombat_NS
{
    const TECSEventDerivedPtr<FCE_AIEnterCombat> DerivedPtr = TECSEventDerivedPtr<FCE_AIEnterCombat>();
}
namespace __INTENRAL_FCE_AIQuitCombat_NS
{
    const TECSEventDerivedPtr<FCE_AIQuitCombat> DerivedPtr = TECSEventDerivedPtr<FCE_AIQuitCombat>();
}
namespace __INTENRAL_FCE_AIStopMoveAndSprint_NS
{
    const TECSEventDerivedPtr<FCE_AIStopMoveAndSprint> DerivedPtr = TECSEventDerivedPtr<FCE_AIStopMoveAndSprint>();
}
namespace __INTENRAL_FCE_AIChangeMountMoveStance_NS
{
    const TECSEventDerivedPtr<FCE_AIChangeMountMoveStance> DerivedPtr = TECSEventDerivedPtr<FCE_AIChangeMountMoveStance>();

}
struct FCE_RequireNewTarget : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FGameplayTagContainer IncludeGameplayTags;
    UPROPERTY()
    FGameplayTagContainer ExcludeGameplayTags;

    FCE_RequireNewTarget()
    {
        return;
    }
}

struct FCE_AIEnterCombat : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_AIEnterCombat()
    {
        return;
    }
}

struct FCE_AIQuitCombat : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_AIQuitCombat()
    {
        return;
    }
}

struct FCE_AIStopMoveAndSprint : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;

    FCE_AIStopMoveAndSprint()
    {
        return;
    }
}

struct FCE_AIChangeMountMoveStance : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    ECharacterMoveStance NewStance = ECharacterMoveStance(0);
    UPROPERTY()
    ECharacterMoveStanceLayer MoveStanceLayer = ECharacterMoveStanceLayer(0);


}

