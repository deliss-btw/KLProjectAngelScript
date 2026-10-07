
namespace FFakeCharacterUtils
{
void SpawnFakeCharacterAndControl(const FECSEntity &inout SwitchOutAvatar, const FDefaultAvatarData &inout SwitchInData, const FSpawnFakeCharacterExtractData &inout ExtraData)
{
    int local_132 = 0;
    UClass local_162;
    int local_166 = 0;
    int local_172 = 0;
    Get local_126;
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        FECSRuntimeView local_44 = local_6.GetRuntimeView(EECSRuntimeViewType(2));
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_44.Iterator();
        for (; local_82.CanProceed;)
        {
            const FECSEntity& local_118 = local_82.Proceed();
            if ((!((FECSEntity(local_126.opCall().GetPlayerPawnEntity()) == SwitchOutAvatar))))
            {
                continue;
            }
            FECSSpawnCharacterParam local_140;
            local_140.PlayerEntity = local_118.GetId();
            local_140.AIControllerPrototype = nullptr;
            local_140.Name = FName(FString().Append("MonsterPawn_").Append(local_132.GetPlayerId()).Append("_").Append(0));
            local_162 = Cast<UClass>(SwitchInData.Avatar.ToSoftObjectPath().TryLoad());
            local_140.CharacterPrototype = TSubclassOf<AECSPrefab>(local_162);
            local_140.bActive = (true != 0);
            FECSSpawnUtils::SpawnFakeCharacter(local_118, SwitchOutAvatar, local_140, local_166.GetPosition(), local_172.GetRotation(), ExtraData);
        }
    }
    return;
}
void StopControlFakeCharacterByOwner(const FECSEntity &inout FakeEntity)
{
    int local_4 = 0;
    if (!(FakeEntity.IsValid()) || !(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(local_4))
    {
        return;
    }
    FFakeCharacterUtils::StopControlFakeCharacter(local_4.GetSwitchOutEntity());
    return;
}
void StopControlFakeCharacter(const FECSEntity &inout SwitchOutAvatar)
{
    int local_52 = 0;
    if (ECS::GetRuntimeInfo().IsServer && SwitchOutAvatar.IsValid())
    {
        const FC_SpawnFakeCharacterResultComponent& local_4 = FECSEntity::Get<FC_SpawnFakeCharacterResultComponent>(SwitchOutAvatar).opCall();
        if (local_4)
        {
            if (local_4.bSharedHP)
            {
                FFakeCharacterUtils::SyncHPByRatio(local_4.FakeEntity, local_4.SwitchOutAvatar, ECS::GetContextTime());
            }
            FSwitchPlayerUtils::SwitchInPlayer(local_4.SwitchOutAvatar);
            FSwitchPlayerUtils::SwitchPlayerControlledPawnEntity(local_4.FakeEntity, local_4.SwitchOutAvatar);
            UCombatGlobalSettings local_14 = UCombatGlobalSettings::Get();
            if (local_14.SafeZoneBuff.IsValid() && FBuffUtils::HasBuff(local_4.FakeEntity, local_14.SafeZoneBuff))
            {
                FBuffUtils::RemoveBuff(local_4.FakeEntity, local_14.SafeZoneBuff, ECS::GetContextTime(), EBuffEndType(0));
                if (!(FBuffUtils::HasBuff(local_4.SwitchOutAvatar, local_14.SafeZoneBuff)))
                {
                    FBuffUtils::AddBuff(local_4.SwitchOutAvatar, local_14.SafeZoneBuff, ECS::GetContextTime(), ENTITY_NULL, false, -1.0f, 1, false);
                }
            }
            Get local_26;
            if (local_26.opCall())
            {
                Modify local_32;
                if (local_32.opCall())
                {
                }
            }
            FBuffUtils::TransferSharedBuff(local_4.FakeEntity, local_4.SwitchOutAvatar);
            FLifeCycleUtils::EntityDestroyDirectly(local_4.FakeEntity, local_4.FakeEntity.GetWorld().GetFixedTime().Time);
            Get local_40;
            const FC_CombatState& local_42 = local_40.opCall();
            if (local_42)
            {
                Assign local_46;
                local_46.opCall(local_42);
                Remove local_50;
                local_50.opCall();
            }
            local_52.SetRefCount((local_52.GetRefCount() - 1));
            if (local_52.GetRefCount() <= 0)
            {
                Remove local_62;
                local_62.opCall();
            }
            Remove local_66;
            local_66.opCall();
            FESMTriggerUtils::ActivateESMTrigger(SwitchOutAvatar, n"ControlSwitchIn", ECS::GetContextTime(), FFPTime(1), 0);
            FFPTime local_10 = FFPTime(-1);
            SendEvent local_74;
            local_74.opCall(local_10);
            return;
        }
        XError(ELog(4), "[StopControlFakeCharacter]: SwitchOutAvatar has not FakeCharacterResultComponent");
    }
    return;
}
void SyncHPByRatio(const FECSEntity &inout FromEntity, const FECSEntity &inout ToEntity, const FFPTime &inout Time)
{
    Has local_6;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(FromEntity.IsValid()) || !(ToEntity.IsValid()))
    {
        return;
    }
    if (!(local_6.opCall()) || !(local_6.opCall()))
    {
        return;
    }
    float32 local_20 = FGameAttributeUtils::GetAttributeValue(FromEntity, Attribute::HPMax, Time, true, 0.0f, false, FGameAttributeModificationValue());
    float32 local_19 = FGameAttributeUtils::GetAttributeValue(ToEntity, Attribute::HPMax, Time, true, 0.0f, false, FGameAttributeModificationValue());
    if (local_20 <= 0.0f || (local_19 <= 0.0f))
    {
        return;
    }
    float32 local_7 = FGameAttributeUtils::GetAttributeValue(FromEntity, Attribute::HP, Time, true, 0.0f, false, FGameAttributeModificationValue()) / local_20;
    float32 local_22 = local_19 * FMath::Clamp(local_7, 0.0f, 1.0f);
    FGameAttributeUtils::ChangeConsumeValue(ToEntity, Attribute::HP, Time, local_22, -1.0f);
    return;
}
}
