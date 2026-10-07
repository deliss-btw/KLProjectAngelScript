
enum EEASAbilityEvent
{
    OnAdd,
    OnActivate,
    OnTick,
    OnEnd,
    OnRemove,
    OnSignal,
    OnBeginOverlap,
    OnEndOverlap,
    NATIVE_MAX = 7,
    OnHitOther,
    OnBeingHit,
    OnDealDamageCalculated,
    OnTakeDamageCalculated,
    OnDealDamageResolved,
    OnTakeDamageResolved,
    OnBeforeHittingOther,
    OnBeforeBeingHit,
    OnHittingOther,
    OnHitStateChanged,
    OnBodyPartDestroy,
    OnInvincibleCounter,
    OnPerfectDodge,
    OnGuardHit,
    OnDead,
    OnNearDeath,
    OnDeathResistanceHPChange,
    OnRescuedFromNearDeath,
    OnReborn,
    PreFireProjectile,
    PostFireProjectile,
    OnAbilityCustomInteract,
    OnEntityEnterWeather,
    OnEntityExitWeather,
    OnPlayerControllerEnterWeather,
    OnPlayerControllerExitWeather,
    OnPlayerControllerBeginOverlap,
    OnPlayerControllerEndOverlap,
    OnCharacterSwitchIn,
    OnCharacterSwitchOut,
    OnShieldActivate,
    OnShieldDectivate,
    OnShieldBroken,
    OnShieldDestroy,
    OnMutualClash,
    OnMutualClashAttributeConsume,
    OnMutualClashPlayerBeHitFromNoRange,
    OnDefenseHit,
    OnLaserEndPointHitUnit,
    OnEnvBreakablePropPhaseChanged,
    OnEnvBreakablePropDead,
    OnDOTSensorStateChange,
    OnHealOther,
    OnBeHealed,
    OnSummon,
    OnInitFakeCharacter,
    OnSelfKill,
    OnTeamKill,
    OnConsumeCombatItem,
    OnBuffAdded,
    OnBuffRemoved,
    OnTriggerLockHP,
    OnSkillTransitComplete,
    OnBeginMount,
    OnEndMount,
    OnMountBeginBeingDriven,
    OnMountEndBeingDriven,
}


struct FAbilityHitEventContextData : FAbilityEventCustomDataBase
{
    UPROPERTY()
    int HitEventId;
    UPROPERTY()
    int DamageEventId;


}

struct FAbilityHitEventData : FAbilityEventCustomDataBase
{
    UPROPERTY()
    int DamageIndex;


}

struct FAbilityDamageCalculatedEventData : FAbilityEventCustomDataBase
{
    UPROPERTY()
    FECSEntity DamageTarget;
    UPROPERTY()
    int DamageIndex;


}

struct FAbilitySelfKillEventData : FAbilityEventCustomDataBase
{
    UPROPERTY()
    FECSEntity Victim;

    FAbilitySelfKillEventData()
    {
        return;
    }
}

struct FAbilityTeamKillEventData : FAbilityEventCustomDataBase
{
    UPROPERTY()
    FECSEntity Victim;
    UPROPERTY()
    FECSEntity Killer;

    FAbilityTeamKillEventData()
    {
        return;
    }
}

UCLASS(Abstract)
class UAbility : UEASAbility
{
    UAbility()
    {
        return;
    }
    UFUNCTION()
    void OnHitOther_Implementation(const FAbilityHitEventData &inout EventData)
    {
        return;
    }
    UFUNCTION()
    void OnBeingHit_Implementation(const FAbilityHitEventData &inout EventData)
    {
        return;
    }
    UFUNCTION()
    void OnDealDamageCalculated_Implementation(const FAbilityDamageCalculatedEventData &inout EventData)
    {
        return;
    }
    UFUNCTION()
    void OnTakeDamageCalculated_Implementation(const FAbilityDamageCalculatedEventData &inout EventData)
    {
        return;
    }
    UFUNCTION()
    void OnDealDamageResolved_Implementation(const FCE_DamageEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnTakeDamageResolved_Implementation(const FCE_DamageEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnHitStateChanged_Implementation(const FCE_HitStateChanged &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnBodyPartDestroy_Implementation(const FCE_BodyPartDestroyEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnInvincibleCounter_Implementation(const FCE_InvincibleCounterEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnPerfectDodge_Implementation(const FCE_PerfectDodgeEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnGuardHit_Implementation(const FCE_GuardHitEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnNearDeath_Implementation(const FCE_NearDeathEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnDeathResistanceHPChange_Implementation(const FCE_DeathResistanceHPChangeEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnRescuedFromNearDeath_Implementation(const FCE_RescuedFromNearDeathEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnDead_Implementation(const FCE_DeathEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnReborn_Implementation(const FCE_Reborn &inout Event)
    {
        return;
    }
    UFUNCTION()
    void PreFireProjectile_Implementation(const FCE_CharacterFireProjectile &inout Event)
    {
        return;
    }
    UFUNCTION()
    void PostFireProjectile_Implementation(const FCE_CharacterFireProjectile &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnAbilityCustomInteract_Implementation(const FCE_OnAbilityCustomInteract &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnEntityEnterWeather_Implementation(const FCE_EntityEnterWeather &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnEntityExitWeather_Implementation(const FCE_EntityExitWeather &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnPlayerControllerEnterWeather_Implementation(const FCE_PlayerControllerEnterWeather &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnPlayerControllerExitWeather_Implementation(const FCE_PlayerControllerExitWeather &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnPlayerControllerBeginOverlap_Implementation(const FCE_PlayerControllerBeginOverlap &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnPlayerControllerEndOverlap_Implementation(const FCE_PlayerControllerEndOverlap &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnCharacterSwitchIn_Implementation(const FCE_PlayerSwitchSuccess &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnCharacterSwitchOut_Implementation(const FCE_PlayerSwitchSuccess &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnShieldActivate_Implementation(const FCE_ShieldActivateEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnShieldDeactivate_Implementation(const FCE_ShieldDeactivateEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnShieldBroken_Implementation(const FCE_ShieldBrokenEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnShieldDestroy_Implementation(const FCE_ShieldDestroyEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnMutualClash_Implementation(const FCE_MutualClashEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnMutualClashAttributeConsume_Implementation(const FCE_MutualClashAttributeConsumeEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnMutualClashPlayerBeHitFromNoRange_Implementation(const FCE_MutualClashPlayerBeHitFromNoRangeEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnDefenseHit_Implementation(const FCE_DefenseHitEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnLaserEndPointHitUnit_Implementation(const FCE_LaserEndPointHitUnitEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnEnvBreakablePropDead_Implementation(const FCE_EnvBreakablePropDeadEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnEnvBreakablePropPhaseChanged_Implementation(const FCE_EnvBreakablePropPhaseChangedEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnDOTSensorStateChange_Implementation(const FCE_DOTSensorStateChange &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnHealOther_Implementation(const FCE_HealOtherEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnBeHealed_Implementation(const FCE_HealOtherEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnSummon_Implementation(const FCE_SummonEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnInitFakeCharacter_Implementation(const FCE_InitFakeCharacterEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnSelfKill_Implementation(const FAbilitySelfKillEventData &inout EventData)
    {
        return;
    }
    UFUNCTION()
    void OnTeamKill_Implementation(const FAbilityTeamKillEventData &inout EventData)
    {
        return;
    }
    UFUNCTION()
    void OnConsumeCombatItem_Implementation(const FCE_ConsumeCombatItemEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnBuffAdded_Implementation(const FCE_BuffAddedEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnBuffRemoved_Implementation(const FCE_BuffRemovedEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnTriggerLockHP_Implementation(const FCE_TriggerLockHPEvent &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnSkillTransitComplete_Implementation(const FCE_SkillTransitComplete &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnBeginMount_Implementation(const FCE_OnBeginMount &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnEndMount_Implementation(const FCE_OnEndMount &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnMountBeginBeingDriven_Implementation(const FCE_OnBeginMount &inout Event)
    {
        return;
    }
    UFUNCTION()
    void OnMountEndBeingDriven_Implementation(const FCE_OnEndMount &inout Event)
    {
        return;
    }
    void OnHitOther(const FAbilityHitEventData &inout EventData)
    {
        __Evt_PushArgument(EventData);
        __Evt_Execute(this, n"OnHitOther");
        return;
    }
    void OnBeingHit(const FAbilityHitEventData &inout EventData)
    {
        __Evt_PushArgument(EventData);
        __Evt_Execute(this, n"OnBeingHit");
        return;
    }
    void OnDealDamageCalculated(const FAbilityDamageCalculatedEventData &inout EventData)
    {
        __Evt_PushArgument(EventData);
        __Evt_Execute(this, n"OnDealDamageCalculated");
        return;
    }
    void OnTakeDamageCalculated(const FAbilityDamageCalculatedEventData &inout EventData)
    {
        __Evt_PushArgument(EventData);
        __Evt_Execute(this, n"OnTakeDamageCalculated");
        return;
    }
    void OnDealDamageResolved(const FCE_DamageEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnDealDamageResolved");
        return;
    }
    void OnTakeDamageResolved(const FCE_DamageEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnTakeDamageResolved");
        return;
    }
    void OnHitStateChanged(const FCE_HitStateChanged &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnHitStateChanged");
        return;
    }
    void OnBodyPartDestroy(const FCE_BodyPartDestroyEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnBodyPartDestroy");
        return;
    }
    void OnInvincibleCounter(const FCE_InvincibleCounterEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnInvincibleCounter");
        return;
    }
    void OnPerfectDodge(const FCE_PerfectDodgeEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnPerfectDodge");
        return;
    }
    void OnGuardHit(const FCE_GuardHitEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnGuardHit");
        return;
    }
    void OnNearDeath(const FCE_NearDeathEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnNearDeath");
        return;
    }
    void OnDeathResistanceHPChange(const FCE_DeathResistanceHPChangeEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnDeathResistanceHPChange");
        return;
    }
    void OnRescuedFromNearDeath(const FCE_RescuedFromNearDeathEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnRescuedFromNearDeath");
        return;
    }
    void OnDead(const FCE_DeathEvent &inout Event)
    {
        __Evt_PushArgument__FCE_DeathEvent(Event);
        __Evt_Execute(this, n"OnDead");
        return;
    }
    void OnReborn(const FCE_Reborn &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnReborn");
        return;
    }
    void PreFireProjectile(const FCE_CharacterFireProjectile &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"PreFireProjectile");
        return;
    }
    void PostFireProjectile(const FCE_CharacterFireProjectile &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"PostFireProjectile");
        return;
    }
    void OnAbilityCustomInteract(const FCE_OnAbilityCustomInteract &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnAbilityCustomInteract");
        return;
    }
    void OnEntityEnterWeather(const FCE_EntityEnterWeather &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnEntityEnterWeather");
        return;
    }
    void OnEntityExitWeather(const FCE_EntityExitWeather &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnEntityExitWeather");
        return;
    }
    void OnPlayerControllerEnterWeather(const FCE_PlayerControllerEnterWeather &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnPlayerControllerEnterWeather");
        return;
    }
    void OnPlayerControllerExitWeather(const FCE_PlayerControllerExitWeather &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnPlayerControllerExitWeather");
        return;
    }
    void OnPlayerControllerBeginOverlap(const FCE_PlayerControllerBeginOverlap &inout Event)
    {
        __Evt_PushArgument__FCE_PlayerControllerBeginOverlap(Event);
        __Evt_Execute(this, n"OnPlayerControllerBeginOverlap");
        return;
    }
    void OnPlayerControllerEndOverlap(const FCE_PlayerControllerEndOverlap &inout Event)
    {
        __Evt_PushArgument__FCE_PlayerControllerEndOverlap(Event);
        __Evt_Execute(this, n"OnPlayerControllerEndOverlap");
        return;
    }
    void OnCharacterSwitchIn(const FCE_PlayerSwitchSuccess &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnCharacterSwitchIn");
        return;
    }
    void OnCharacterSwitchOut(const FCE_PlayerSwitchSuccess &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnCharacterSwitchOut");
        return;
    }
    void OnShieldActivate(const FCE_ShieldActivateEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnShieldActivate");
        return;
    }
    void OnShieldDeactivate(const FCE_ShieldDeactivateEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnShieldDeactivate");
        return;
    }
    void OnShieldBroken(const FCE_ShieldBrokenEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnShieldBroken");
        return;
    }
    void OnShieldDestroy(const FCE_ShieldDestroyEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnShieldDestroy");
        return;
    }
    void OnMutualClash(const FCE_MutualClashEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnMutualClash");
        return;
    }
    void OnMutualClashAttributeConsume(const FCE_MutualClashAttributeConsumeEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnMutualClashAttributeConsume");
        return;
    }
    void OnMutualClashPlayerBeHitFromNoRange(const FCE_MutualClashPlayerBeHitFromNoRangeEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnMutualClashPlayerBeHitFromNoRange");
        return;
    }
    void OnDefenseHit(const FCE_DefenseHitEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnDefenseHit");
        return;
    }
    void OnLaserEndPointHitUnit(const FCE_LaserEndPointHitUnitEvent &inout Event)
    {
        __Evt_PushArgument__FCE_LaserEndPointHitUnitEvent(Event);
        __Evt_Execute(this, n"OnLaserEndPointHitUnit");
        return;
    }
    void OnEnvBreakablePropDead(const FCE_EnvBreakablePropDeadEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnEnvBreakablePropDead");
        return;
    }
    void OnEnvBreakablePropPhaseChanged(const FCE_EnvBreakablePropPhaseChangedEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnEnvBreakablePropPhaseChanged");
        return;
    }
    void OnDOTSensorStateChange(const FCE_DOTSensorStateChange &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnDOTSensorStateChange");
        return;
    }
    void OnHealOther(const FCE_HealOtherEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnHealOther");
        return;
    }
    void OnBeHealed(const FCE_HealOtherEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnBeHealed");
        return;
    }
    void OnSummon(const FCE_SummonEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnSummon");
        return;
    }
    void OnInitFakeCharacter(const FCE_InitFakeCharacterEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnInitFakeCharacter");
        return;
    }
    void OnSelfKill(const FAbilitySelfKillEventData &inout EventData)
    {
        __Evt_PushArgument(EventData);
        __Evt_Execute(this, n"OnSelfKill");
        return;
    }
    void OnTeamKill(const FAbilityTeamKillEventData &inout EventData)
    {
        __Evt_PushArgument(EventData);
        __Evt_Execute(this, n"OnTeamKill");
        return;
    }
    void OnConsumeCombatItem(const FCE_ConsumeCombatItemEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnConsumeCombatItem");
        return;
    }
    void OnBuffAdded(const FCE_BuffAddedEvent &inout Event)
    {
        __Evt_PushArgument__FCE_BuffAddedEvent(Event);
        __Evt_Execute(this, n"OnBuffAdded");
        return;
    }
    void OnBuffRemoved(const FCE_BuffRemovedEvent &inout Event)
    {
        __Evt_PushArgument__FCE_BuffRemovedEvent(Event);
        __Evt_Execute(this, n"OnBuffRemoved");
        return;
    }
    void OnTriggerLockHP(const FCE_TriggerLockHPEvent &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnTriggerLockHP");
        return;
    }
    void OnSkillTransitComplete(const FCE_SkillTransitComplete &inout Event)
    {
        __Evt_PushArgument__FCE_SkillTransitComplete(Event);
        __Evt_Execute(this, n"OnSkillTransitComplete");
        return;
    }
    void OnBeginMount(const FCE_OnBeginMount &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnBeginMount");
        return;
    }
    void OnEndMount(const FCE_OnEndMount &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnEndMount");
        return;
    }
    void OnMountBeginBeingDriven(const FCE_OnBeginMount &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnMountBeginBeingDriven");
        return;
    }
    void OnMountEndBeingDriven(const FCE_OnEndMount &inout Event)
    {
        __Evt_PushArgument(Event);
        __Evt_Execute(this, n"OnMountEndBeingDriven");
        return;
    }
}

UCLASS(Abstract)
class UAbilityASWritableBase : UAbility
{
    UAbilityASWritableBase()
    {
        super();
        return;
    }
}

