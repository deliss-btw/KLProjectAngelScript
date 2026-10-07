
enum EEnergyBallAddType
{
    None,
    Attribute,
    Buff,
}

namespace __INTENRAL_FC_EnergyBall_NS
{
    const TECSComponentDerivedPtr<FC_EnergyBall> DerivedPtr = TECSComponentDerivedPtr<FC_EnergyBall>();
    const FC_EnergyBall DefaultValue = FC_EnergyBall();
}
namespace __INTENRAL_FC_PlayEnergyBallFXCooldown_NS
{
    const TECSComponentDerivedPtr<FC_PlayEnergyBallFXCooldown> DerivedPtr = TECSComponentDerivedPtr<FC_PlayEnergyBallFXCooldown>();
    const FC_PlayEnergyBallFXCooldown DefaultValue = FC_PlayEnergyBallFXCooldown();
}
namespace __INTENRAL_FC_DropEnergyBallSource_NS
{
    const TECSComponentDerivedPtr<FC_DropEnergyBallSource> DerivedPtr = TECSComponentDerivedPtr<FC_DropEnergyBallSource>();
    const FC_DropEnergyBallSource DefaultValue = FC_DropEnergyBallSource();
}
namespace __INTENRAL_FC_DropEnergyBallSourceOverride_NS
{
    const TECSComponentDerivedPtr<FC_DropEnergyBallSourceOverride> DerivedPtr = TECSComponentDerivedPtr<FC_DropEnergyBallSourceOverride>();
    const FC_DropEnergyBallSourceOverride DefaultValue = FC_DropEnergyBallSourceOverride();
}
namespace __INTENRAL_FC_DeathEnergyBallDroppedTag_NS
{
    const TECSComponentDerivedPtr<FC_DeathEnergyBallDroppedTag> DerivedPtr = TECSComponentDerivedPtr<FC_DeathEnergyBallDroppedTag>();
    const FC_DeathEnergyBallDroppedTag DefaultValue = FC_DeathEnergyBallDroppedTag();
}
namespace __INTENRAL_FCE_SpawnEnergyBall_NS
{
    const TECSEventDerivedPtr<FCE_SpawnEnergyBall> DerivedPtr = TECSEventDerivedPtr<FCE_SpawnEnergyBall>();
}
namespace __INTENRAL_FCE_ApplyEnergyBall_NS
{
    const TECSEventDerivedPtr<FCE_ApplyEnergyBall> DerivedPtr = TECSEventDerivedPtr<FCE_ApplyEnergyBall>();
}
namespace __INTENRAL_FCE_FadeoutEnergyBall_NS
{
    const TECSEventDerivedPtr<FCE_FadeoutEnergyBall> DerivedPtr = TECSEventDerivedPtr<FCE_FadeoutEnergyBall>();
}
namespace __INTENRAL_FCE_PlayEnergyBallFX_NS
{
    const TECSEventDerivedPtr<FCE_PlayEnergyBallFX> DerivedPtr = TECSEventDerivedPtr<FCE_PlayEnergyBallFX>();
}
namespace __INTENRAL_FCE_PlayEnergyBallMaterialAnim_NS
{
    const TECSEventDerivedPtr<FCE_PlayEnergyBallMaterialAnim> DerivedPtr = TECSEventDerivedPtr<FCE_PlayEnergyBallMaterialAnim>();
}
namespace __INTENRAL_FCE_StopEnergyBallMaterialAnim_NS
{
    const TECSEventDerivedPtr<FCE_StopEnergyBallMaterialAnim> DerivedPtr = TECSEventDerivedPtr<FCE_StopEnergyBallMaterialAnim>();

}
struct FC_EnergyBall : FECSComponent
{
    UPROPERTY()
    EEnergyBallAddType EnergyBallAddType;
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    float32 Value;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    FFXConfig FXConfig;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> ReceiverMaterialParamRequests;
    UPROPERTY()
    float32 MaterialAnimDuration;
    UPROPERTY()
    float32 FXPlayMinInterval;
    UPROPERTY()
    float32 MoveTime;
    UPROPERTY()
    float32 MoveTimeRandom;
    UPROPERTY()
    float32 DelayFadeoutSeconds;
    UPROPERTY()
    float32 FadeoutSeconds;
    UPROPERTY()
    float32 RandomVelocityConeDegree;
    UPROPERTY()
    TArray<float32> RandomVelocitySpeed;
    UPROPERTY()
    TArray<FRotator> LeftRandomVelocityRotations;
    UPROPERTY()
    TArray<FRotator> RightRandomVelocityRotations;

    FC_EnergyBall()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FCE_SpawnEnergyBall : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector OriginLocation;
    UPROPERTY()
    TSoftClassPtr<AEnergyBallPrefab> Prefab;
    UPROPERTY()
    float32 MoveTime;
    UPROPERTY()
    bool bLeft = false;


}

struct FCE_ApplyEnergyBall : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector OriginLocation;
    UPROPERTY()
    TSoftClassPtr<AEnergyBallPrefab> Prefab;

    FCE_ApplyEnergyBall()
    {
        return;
    }
}

struct FCE_FadeoutEnergyBall : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_FadeoutEnergyBall()
    {
        return;
    }
}

struct FCE_PlayEnergyBallFX : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FFXConfig FXConfig;

    FCE_PlayEnergyBallFX()
    {
        return;
    }
}

struct FCE_PlayEnergyBallMaterialAnim : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> ReceiverMaterialParamRequests;
    UPROPERTY()
    float32 Duration;


}

struct FCE_StopEnergyBallMaterialAnim : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity PawnEntity;

    FCE_StopEnergyBallMaterialAnim()
    {
        return;
    }
}

struct FC_PlayEnergyBallFXCooldown : FECSComponent
{
    UPROPERTY()
    FFPTime LastPlayTime;

    FC_PlayEnergyBallFXCooldown()
    {
        return;
    }
}

struct FDropEnergyBallData
{
    UPROPERTY()
    TSubclassOf<AEnergyBallPrefab> Prefab;
    UPROPERTY()
    int Number = 1;


}

struct FC_DropEnergyBallSource : FECSComponent
{
    UPROPERTY()
    float32 DetectRadius = 5000.0f;
    UPROPERTY()
    TArray<FDropEnergyBallData> DeathEnergyBallDrops;
    UPROPERTY()
    TArray<FDropEnergyBallData> HitStaggerEnergyBallDrops;
    UPROPERTY()
    TArray<FDropEnergyBallData> HitBreakEnergyBallDrops;


}

struct FC_DropEnergyBallSourceOverride : FECSComponent
{
    UPROPERTY()
    bool bOverrideDetectRadius = false;
    UPROPERTY()
    float32 DetectRadius = 5000.0f;
    UPROPERTY()
    bool bOverrideDeathEnergyBallDrops = false;
    UPROPERTY()
    TArray<FDropEnergyBallData> DeathEnergyBallDrops;
    UPROPERTY()
    bool bOverrideHitStaggerEnergyBallDrops = false;
    UPROPERTY()
    TArray<FDropEnergyBallData> HitStaggerEnergyBallDrops;
    UPROPERTY()
    bool bOverrideHitBreakEnergyBallDrops = false;
    UPROPERTY()
    TArray<FDropEnergyBallData> HitBreakEnergyBallDrops;


}

struct FC_DeathEnergyBallDroppedTag : FECSComponent
{
    FC_DeathEnergyBallDroppedTag()
    {
        return;
    }
}

namespace ECSFunc_FC_EnergyBall
{
UFUNCTION()
bool HasEnergyBall(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EnergyBall);
}
FC_EnergyBall& AssignEnergyBall(const FECSEntity &inout Entity, const FC_EnergyBall &inout DefaultValue = FC_EnergyBall())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EnergyBall, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEnergyBall_BP(const FECSEntity &inout Entity, const FC_EnergyBall &inout DefaultValue = FC_EnergyBall())
{
    ECSFunc_FC_EnergyBall::AssignEnergyBall(Entity, DefaultValue);
    return;
}
FC_EnergyBall& ModifyEnergyBall(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EnergyBall));
    return local_12.GetComp();
}
FC_EnergyBall& ModifyOrAddEnergyBall(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EnergyBall));
    return local_12.GetComp();
}
const FC_EnergyBall& GetEnergyBall(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EnergyBall));
    return local_12.GetComp();
}
UFUNCTION()
FC_EnergyBall GetEnergyBall_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EnergyBall __r;
    bValid = false;
    bValid = ECSFunc_FC_EnergyBall::GetEnergyBall(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EnergyBall GetDefaultedEnergyBall(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EnergyBall __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EnergyBall);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_EnergyBall GetDefaultedEnergyBall_BP(const FECSEntity &inout Entity)
{
    FC_EnergyBall __r;
    return __r;
}
UFUNCTION()
bool RemoveEnergyBall(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EnergyBall);
}
}
FECSMonitorRuntimeView __GetMonitorEnergyBallOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EnergyBall, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnergyBallOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EnergyBall, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnergyBallOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EnergyBall, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnergyBallOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EnergyBall, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnergyBallOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EnergyBall, bFixedFrame, bMustHandleAll);
}
void __MonitorEnergyBallLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EnergyBall, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEnergyBallActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EnergyBall, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEnergyBallModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EnergyBall, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayEnergyBallFXCooldown
{
UFUNCTION()
bool HasPlayEnergyBallFXCooldown(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayEnergyBallFXCooldown);
}
FC_PlayEnergyBallFXCooldown& AssignPlayEnergyBallFXCooldown(const FECSEntity &inout Entity, const FC_PlayEnergyBallFXCooldown &inout DefaultValue = FC_PlayEnergyBallFXCooldown())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayEnergyBallFXCooldown, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayEnergyBallFXCooldown_BP(const FECSEntity &inout Entity, const FC_PlayEnergyBallFXCooldown &inout DefaultValue = FC_PlayEnergyBallFXCooldown())
{
    ECSFunc_FC_PlayEnergyBallFXCooldown::AssignPlayEnergyBallFXCooldown(Entity, DefaultValue);
    return;
}
FC_PlayEnergyBallFXCooldown& ModifyPlayEnergyBallFXCooldown(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayEnergyBallFXCooldown));
    return local_12.GetComp();
}
FC_PlayEnergyBallFXCooldown& ModifyOrAddPlayEnergyBallFXCooldown(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayEnergyBallFXCooldown));
    return local_12.GetComp();
}
const FC_PlayEnergyBallFXCooldown& GetPlayEnergyBallFXCooldown(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayEnergyBallFXCooldown));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayEnergyBallFXCooldown GetPlayEnergyBallFXCooldown_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PlayEnergyBallFXCooldown __r;
    bValid = false;
    bValid = ECSFunc_FC_PlayEnergyBallFXCooldown::GetPlayEnergyBallFXCooldown(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PlayEnergyBallFXCooldown GetDefaultedPlayEnergyBallFXCooldown(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayEnergyBallFXCooldown __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayEnergyBallFXCooldown);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_PlayEnergyBallFXCooldown GetDefaultedPlayEnergyBallFXCooldown_BP(const FECSEntity &inout Entity)
{
    FC_PlayEnergyBallFXCooldown __r;
    return __r;
}
UFUNCTION()
bool RemovePlayEnergyBallFXCooldown(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayEnergyBallFXCooldown);
}
}
FECSMonitorRuntimeView __GetMonitorPlayEnergyBallFXCooldownOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayEnergyBallFXCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayEnergyBallFXCooldownOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayEnergyBallFXCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayEnergyBallFXCooldownOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayEnergyBallFXCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayEnergyBallFXCooldownOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayEnergyBallFXCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayEnergyBallFXCooldownOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayEnergyBallFXCooldown, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayEnergyBallFXCooldownLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayEnergyBallFXCooldown, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayEnergyBallFXCooldownActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayEnergyBallFXCooldown, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayEnergyBallFXCooldownModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayEnergyBallFXCooldown, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DropEnergyBallSource
{
UFUNCTION()
bool HasDropEnergyBallSource(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSource);
}
FC_DropEnergyBallSource& AssignDropEnergyBallSource(const FECSEntity &inout Entity, const FC_DropEnergyBallSource &inout DefaultValue = FC_DropEnergyBallSource())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSource, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDropEnergyBallSource_BP(const FECSEntity &inout Entity, const FC_DropEnergyBallSource &inout DefaultValue = FC_DropEnergyBallSource())
{
    ECSFunc_FC_DropEnergyBallSource::AssignDropEnergyBallSource(Entity, DefaultValue);
    return;
}
FC_DropEnergyBallSource& ModifyDropEnergyBallSource(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSource));
    return local_12.GetComp();
}
FC_DropEnergyBallSource& ModifyOrAddDropEnergyBallSource(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSource));
    return local_12.GetComp();
}
const FC_DropEnergyBallSource& GetDropEnergyBallSource(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSource));
    return local_12.GetComp();
}
UFUNCTION()
FC_DropEnergyBallSource GetDropEnergyBallSource_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DropEnergyBallSource __r;
    bValid = false;
    bValid = ECSFunc_FC_DropEnergyBallSource::GetDropEnergyBallSource(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DropEnergyBallSource GetDefaultedDropEnergyBallSource(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DropEnergyBallSource __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSource);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_DropEnergyBallSource GetDefaultedDropEnergyBallSource_BP(const FECSEntity &inout Entity)
{
    FC_DropEnergyBallSource __r;
    return __r;
}
UFUNCTION()
bool RemoveDropEnergyBallSource(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSource);
}
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DropEnergyBallSource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DropEnergyBallSource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DropEnergyBallSource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DropEnergyBallSource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DropEnergyBallSource, bFixedFrame, bMustHandleAll);
}
void __MonitorDropEnergyBallSourceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DropEnergyBallSource, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropEnergyBallSourceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DropEnergyBallSource, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropEnergyBallSourceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DropEnergyBallSource, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DropEnergyBallSourceOverride
{
UFUNCTION()
bool HasDropEnergyBallSourceOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSourceOverride);
}
FC_DropEnergyBallSourceOverride& AssignDropEnergyBallSourceOverride(const FECSEntity &inout Entity, const FC_DropEnergyBallSourceOverride &inout DefaultValue = FC_DropEnergyBallSourceOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSourceOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDropEnergyBallSourceOverride_BP(const FECSEntity &inout Entity, const FC_DropEnergyBallSourceOverride &inout DefaultValue = FC_DropEnergyBallSourceOverride())
{
    ECSFunc_FC_DropEnergyBallSourceOverride::AssignDropEnergyBallSourceOverride(Entity, DefaultValue);
    return;
}
FC_DropEnergyBallSourceOverride& ModifyDropEnergyBallSourceOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSourceOverride));
    return local_12.GetComp();
}
FC_DropEnergyBallSourceOverride& ModifyOrAddDropEnergyBallSourceOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSourceOverride));
    return local_12.GetComp();
}
const FC_DropEnergyBallSourceOverride& GetDropEnergyBallSourceOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSourceOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_DropEnergyBallSourceOverride GetDropEnergyBallSourceOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DropEnergyBallSourceOverride __r;
    bValid = false;
    bValid = ECSFunc_FC_DropEnergyBallSourceOverride::GetDropEnergyBallSourceOverride(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DropEnergyBallSourceOverride GetDefaultedDropEnergyBallSourceOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DropEnergyBallSourceOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSourceOverride);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_DropEnergyBallSourceOverride GetDefaultedDropEnergyBallSourceOverride_BP(const FECSEntity &inout Entity)
{
    FC_DropEnergyBallSourceOverride __r;
    return __r;
}
UFUNCTION()
bool RemoveDropEnergyBallSourceOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DropEnergyBallSourceOverride);
}
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DropEnergyBallSourceOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DropEnergyBallSourceOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DropEnergyBallSourceOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DropEnergyBallSourceOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropEnergyBallSourceOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DropEnergyBallSourceOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorDropEnergyBallSourceOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DropEnergyBallSourceOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropEnergyBallSourceOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DropEnergyBallSourceOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropEnergyBallSourceOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DropEnergyBallSourceOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DeathEnergyBallDroppedTag
{
UFUNCTION()
bool HasDeathEnergyBallDroppedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DeathEnergyBallDroppedTag);
}
FC_DeathEnergyBallDroppedTag& AssignDeathEnergyBallDroppedTag(const FECSEntity &inout Entity, const FC_DeathEnergyBallDroppedTag &inout DefaultValue = FC_DeathEnergyBallDroppedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DeathEnergyBallDroppedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDeathEnergyBallDroppedTag_BP(const FECSEntity &inout Entity, const FC_DeathEnergyBallDroppedTag &inout DefaultValue = FC_DeathEnergyBallDroppedTag())
{
    ECSFunc_FC_DeathEnergyBallDroppedTag::AssignDeathEnergyBallDroppedTag(Entity, DefaultValue);
    return;
}
FC_DeathEnergyBallDroppedTag& ModifyDeathEnergyBallDroppedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DeathEnergyBallDroppedTag));
    return local_12.GetComp();
}
FC_DeathEnergyBallDroppedTag& ModifyOrAddDeathEnergyBallDroppedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DeathEnergyBallDroppedTag));
    return local_12.GetComp();
}
const FC_DeathEnergyBallDroppedTag& GetDeathEnergyBallDroppedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DeathEnergyBallDroppedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DeathEnergyBallDroppedTag GetDeathEnergyBallDroppedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DeathEnergyBallDroppedTag& local_4 = ECSFunc_FC_DeathEnergyBallDroppedTag::GetDeathEnergyBallDroppedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DeathEnergyBallDroppedTag();
}
const FC_DeathEnergyBallDroppedTag GetDefaultedDeathEnergyBallDroppedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DeathEnergyBallDroppedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DeathEnergyBallDroppedTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_DeathEnergyBallDroppedTag GetDefaultedDeathEnergyBallDroppedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DeathEnergyBallDroppedTag::GetDefaultedDeathEnergyBallDroppedTag(Entity);
}
UFUNCTION()
bool RemoveDeathEnergyBallDroppedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DeathEnergyBallDroppedTag);
}
}
FECSMonitorRuntimeView __GetMonitorDeathEnergyBallDroppedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DeathEnergyBallDroppedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathEnergyBallDroppedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DeathEnergyBallDroppedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathEnergyBallDroppedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DeathEnergyBallDroppedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathEnergyBallDroppedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DeathEnergyBallDroppedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathEnergyBallDroppedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DeathEnergyBallDroppedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDeathEnergyBallDroppedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DeathEnergyBallDroppedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathEnergyBallDroppedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DeathEnergyBallDroppedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathEnergyBallDroppedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DeathEnergyBallDroppedTag, bFixedFrame, Details);
    return;
}
