
enum ESwitchPlayerBlockReason
{
    None,
    SystemNull,
    AICombat,
    InFakeControl,
    NoOwner,
    OwnerInvalid,
    SwitchCD,
    Manipulated,
    TagBlocked,
}

namespace FSwitchPlayerUtils
{
bool CheckSwitchPlayerCondition(const FECSEntity &inout Entity, const FFPTime &inout Time)
{
    return (int((FSwitchPlayerUtils::GetSwitchPlayerBlockReason(Entity, Time))) == 0);
}
ESwitchPlayerBlockReason GetSwitchPlayerBlockReason(const FECSEntity &inout Entity, const FFPTime &inout Time)
{
    US_SwitchPlayerSystem local_6 = Cast<US_SwitchPlayerSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_SwitchPlayerSystem));
    if (local_6 == nullptr)
    {
        return ESwitchPlayerBlockReason(1);
    }
    Has local_12;
    bool local_7 = local_12.opCall();
    if (local_7)
    {
        return ESwitchPlayerBlockReason(2);
    }
    FECSEntity local_16 = FASCommonUtils::GetUniqueAvatarPawnEntity(Entity);
    if (!(local_16.IsValid()))
    {
        local_7 = false;
    }
    else
    {
        Has local_24;
        local_7 = local_24.opCall();
    }
    if (local_7)
    {
        return ESwitchPlayerBlockReason(3);
    }
    return local_6.GetSwitchPlayerConditionsReason(local_16, Time);
}
void SetCharacterEntityActive(const FECSEntity &inout CharacterEntity, const bool bActive)
{
    int local_12 = 0;
    if ((!((CharacterEntity == ENTITY_NULL))))
    {
        CharacterEntity.SetActive(bActive, FFPTime(-1));
        if (local_12)
        {
            int local_5 = local_12.GetNumWeapons();
            int local_14 = 0;
            for (; local_14 < local_5; ++local_14)
            {
                const FCharacterAttachWeaponData& local_18 = local_12.GetWeapon(local_14);
                if (local_18.GetWeaponEntity().IsValid())
                {
                    local_18.GetWeaponEntity().SetActive(bActive, FFPTime(-1));
                }
            }
        }
        if (bActive)
        {
            Remove local_22;
            local_22.opCall();
            return;
        }
        Assign local_26;
        local_26.opCall(FC_CharacterInBackgroundTag());
    }
    return;
}
void CopyMovementControl(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity)
{
    0.SetbSprintOn(0.GetbSprintOn());
    Get local_18;
    const FC_CharacterKeepSprint& local_20 = local_18.opCall();
    if (local_20)
    {
        ModifyOrAdd local_24;
        local_24.opCall() = local_20;
    }
    return;
}
FECSEntity GetSwitchPlayerNextEntity(const FECSEntity &inout PrevEntity)
{
    int local_6 = 0;
    int local_18 = 0;
    if (!(local_6))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_12 = local_6.GetPlayerEntity();
    if (!(local_18))
    {
        return ENTITY_NULL;
    }
    if ((!((FECSEntity(local_18.GetPlayerPawnEntity()) == PrevEntity))))
    {
        return ENTITY_NULL;
    }
    int local_20 = local_18.GetAllPlayerPawnEntities().IndexOfByKey(PrevEntity);
    if (local_20 == -1)
    {
        return ENTITY_NULL;
    }
    if (local_18.GetAllPlayerPawnEntities().Num() < 2)
    {
        return ENTITY_NULL;
    }
    return FECSEntity(local_18.GetAllPlayerPawnEntities()[((local_20 + 1) % local_18.GetAllPlayerPawnEntities().Num())]);
}
FECSEntity SwitchToNextCharacter(const FECSEntity &inout PrevEntity, const FFPTime &inout Time)
{
    int local_6 = 0;
    int local_54 = 0;
    if (!(local_6))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_18 = FSwitchPlayerUtils::GetSwitchPlayerNextEntity(PrevEntity);
    if ((local_18 == ENTITY_NULL))
    {
        return ENTITY_NULL;
    }
    FGameAttributeUtils::SaveSwitchSyncValues(PrevEntity, Time);
    FSwitchPlayerUtils::SwitchInPlayer(local_18);
    Modify local_26;
    FC_DivineSkill& local_28 = local_26.opCall();
    if (local_28)
    {
        DivineSkillUtils::RemoveDivineSkillModifier(PrevEntity, local_28);
        FECSWorldPtr local_30 = ECS::GetECSWorld();
        Get local_34;
        DivineSkillUtils::AddDivineSkillModifier(local_18, local_28, local_34.opCall().LastTime);
    }
    FBuffUtils::TransferSharedBuff(PrevEntity, local_18);
    FSwitchPlayerUtils::CopyMovementControl(PrevEntity, local_18);
    FLockTargetUtils::KeepLockTargetWhenSwitchControlEntity(PrevEntity, local_18);
    FSwitchPlayerUtils::SwitchPlayerControlledPawnEntity(PrevEntity, local_18);
    Get local_38;
    const FC_CombatState& local_40 = local_38.opCall();
    if (local_40)
    {
        Assign local_44;
        local_44.opCall(local_40);
    }
    FAIKnowledgeUtils::SyncCombatAndKnowledgeInfoToSwitchedPlayer(PrevEntity, local_18);
    ModifyOrAdd local_48;
    local_48.opCall().SetSyncTime(Time);
    local_54.SwitchOutPawn = PrevEntity;
    local_54.SwitchInPawn = local_18;
    return local_18;
}
void SwitchPlayerForChangeRole(const FECSEntity &inout PrevEntity, const FECSEntity &inout NextEntity, const FFPTime &inout StateTransitWorldTime)
{
    int local_40 = 0;
    FBuffUtils::TransferSharedBuff(PrevEntity, NextEntity);
    FSwitchPlayerUtils::CopyMovementControl(PrevEntity, NextEntity);
    FLockTargetUtils::KeepLockTargetWhenSwitchControlEntity(PrevEntity, NextEntity);
    FSwitchPlayerUtils::SwitchPlayerControlledPawnEntity(PrevEntity, NextEntity);
    Get local_4;
    if (local_4.opCall())
    {
        Assign local_12;
        Get local_16;
        local_12.opCall(local_16.opCall());
    }
    FAIKnowledgeUtils::SyncCombatAndKnowledgeInfoToSwitchedPlayer(PrevEntity, NextEntity);
    FSwitchPlayerUtils::CopyStatesForInplaceSwitch(PrevEntity, NextEntity, StateTransitWorldTime);
    Get local_20;
    if (local_20.opCall())
    {
    }
    Get local_32;
    const FC_Faction& local_34 = local_32.opCall();
    if (local_34)
    {
        local_40.SetFactionId(local_34.GetFactionId());
        FFactionUtils::InitFactionRelationForEntity(NextEntity, local_40);
    }
    ModifyOrAdd local_46;
    local_46.opCall().SetSyncTime(StateTransitWorldTime);
    return;
}
void CopyStatesForInplaceSwitch(const FECSEntity &inout PrevEntity, const FECSEntity &inout NextEntity, const FFPTime &inout StateTransitWorldTime)
{
    int local_6 = 0;
    int local_16 = 0;
    int local_22 = 0;
    int local_28 = 0;
    int local_34 = 0;
    int local_40 = 0;
    int local_46 = 0;
    int local_48 = 0;
    int local_57;
    NextEntity.MoveTo(local_6.GetPosition(), local_6.GetRotation(), FFPTime(-1));
    local_22.SetDesiredRotation(local_16.GetDesiredRotation());
    local_22.SetInternalVelocity(local_16.GetInternalVelocity());
    local_22.SetInternalAngularVelocity(local_16.GetInternalAngularVelocity());
    local_34.SetVelocity(local_28.GetVelocity());
    local_34.SetAngularVelocity(local_28.GetAngularVelocity());
    int local_49 = 0;
    for (; local_49 < local_46.Player.GetSMRuntime().Num(); ++local_49)
    {
        UESMStateMachine local_56 = local_40.Asset.GetStateMachine(local_49);
        local_57 = local_46.Player.GetSMRuntime()[].GetStateIndex();
        FName local_59 = local_56.GetDataName();
        FName local_61 = local_56.GetState_BP(local_57).GetDataName();
        FFPTime local_68 = local_46.Player.GetSMRuntime()[].GetStateLastTime();
        if (local_48.Asset.GetStateMachineByName(local_59) == nullptr)
        {
            continue;
        }
        NextEntity.ESMExternalTransit(local_59, local_61, NAME_None).SetToStateTimeOffset(float32(local_68.ToSeconds()));
    }
    return;
}
void SwitchPlayerControlledPawnEntity(const FECSEntity &inout PrevEntity, const FECSEntity &inout NextEntity)
{
    int local_12 = 0;
    int local_18 = 0;
    int local_24 = 0;
    int local_30 = 0;
    FECSEntity local_4 = FECSEntity(ENTITY_NULL);
    if (PrevEntity.IsValid())
    {
        local_4 = local_12.GetPlayerEntity();
        local_24.CopyFrom(local_18);
        FCharacterCommonMoveUtils::SetMoveStanceAtLayer(local_30, ECharacterMoveStanceLayer(1), ECharacterMoveStance(1));
    }
    else
    {
        local_4 = local_12.GetPlayerEntity();
    }
    Modify local_36;
    FC_PlayerController& local_38 = local_36.opCall();
    if (local_38)
    {
        local_38.SetPlayerPawnEntity(NextEntity);
    }
    return;
}
void StartSwitchPlayerCD(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 Duration)
{
    int local_10 = 0;
    int local_24 = 0;
    if (Debug::CVar_Debug_SwitchPlayerNoCD.GetInt() > 0)
    {
        return;
    }
    if (!(local_10))
    {
        return;
    }
    if (!(FECSEntity(local_10.GetOwnerEntity()).IsValid()))
    {
        return;
    }
    if (local_24)
    {
        local_24.GetModify_SwitchPlayerCD().SetCD(Time, Duration);
    }
    return;
}
void SwitchOutPlayer(const FECSEntity &inout Entity)
{
    FC_PlayerPendingSwitchOutTag local_6;
    int local_18 = 0;
    Assign local_4;
    local_4.opCall(local_6);
    FName local_8 = US_SwitchPlayerSystem.GetDefaultObject().InactiveStateName;
    if ((!((local_8 == NAME_None))))
    {
        int local_25 = 0;
        for (; local_25 < 0.Player.GetSMRuntime().Num(); )
        {
            UESMStateMachine local_32 = local_18.Asset.GetStateMachine(local_25);
            FName local_34 = local_32.GetDataName();
            FESMExternalTransitHandle local_44 = Entity.ESMExternalTransit(local_34, local_8, NAME_None);
            ++local_25;
        }
    }
    return;
}
void SwitchInPlayer(const FECSEntity &inout Entity)
{
    FC_PlayerPendingSwitchInTag local_6;
    Assign local_4;
    local_4.opCall(local_6);
    return;
}
}
