
namespace AutoTest::API::ECSAPI
{
uint GetAvatarEntityId()
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return local_8.GetIdValue();
}
uint GetMountEntityId()
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    bool local_5 = !(local_12);
    ThrowIf(local_5, "LocalPlayer is null.");
    ThrowIf(!(FECSEntity(local_12.GetPlayerPawnEntity()).IsValid()), "LocalPlayerPawnEntity is invalid.");
    Get local_24;
    const FC_PawnRiddingMount& local_26 = local_24.opCall();
    if (local_26)
    {
        if (local_26.IsDriver())
        {
            return local_26.GetMountEntity().GetIdValue();
        }
    }
    return 0;
}
bool IsPlayControllerReady()
{
    int local_12 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_2.IsValid()))
    {
        return false;
    }
    if ((!(local_12) || (!((local_12.UEPlayerController != nullptr)))))
    {
        return false;
    }
    return true;
}
uint GetNearestMonsterInRange(const float32 Range, const bool bIncludeDeath, const bool bOnlyBoss, const FString &inout DataName)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return (AutoTest::API::ECSAPI::GetNearestMonsterInRangeByEntity(local_8.GetIdValue(), Range, bIncludeDeath, bOnlyBoss, DataName));
}
uint GetNearestMonsterInRangeByEntity(const uint EntityId, const float32 Range, const bool bIncludeDeath, const bool bOnlyBoss, const FString &inout DataName)
{
    int local_16 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), "CenterEntity is invalid.");
    FVector local_22 = local_16.GetPosition();
    FECSWorldPtr local_26 = ECS::GetECSWorld();
    FECSEntity local_30 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_72 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_30, local_22, Range, EECSQueryRegsitryType(3), false);
    Include local_116;
    local_116.opCall();
    if (!(bIncludeDeath))
    {
        Exclude(local_72).opCall();
    }
    if ((local_72.GetAllEntities().Num()) == 0)
    {
        return 0;
    }
    float local_130 = Range + 10000.0f;
    int local_135 = 0;
    FECSRuntimeQueryIterator local_158 = local_72.Iterator();
    Get local_188;
    for (; local_158.CanProceed;)
    {
        const FECSEntity& local_182 = local_158.Proceed();
        if (!(FASCommonUtils::IsMonsterPrefab(local_182)))
        {
            continue;
        }
        if (bOnlyBoss && (int(FASCommonUtils::GetMonsterRank(local_182)) != 2))
        {
            continue;
        }
        if (!(DataName.IsEmpty()) && !((local_188.opCall().ConfigPtr.GetDataName() == DataName)))
        {
            continue;
        }
        Get local_14;
        FVector local_196 = local_14.opCall().GetPosition();
        float local_134 = local_196.Distance(local_22);
        if (local_134 < local_130)
        {
            local_130 = local_134;
            local_135 = local_182.GetIdValue();
        }
    }
    return local_135;
}
TArray<uint> GetMonsterListInRange(const float32 Range, const bool bIncludeDeath, const bool bOnlyBoss, const FString &inout DataName)
{
    int local_16 = 0;
    ThrowIf(!(AutoTest::CommonUtils::GetLocalAvatarEntity().IsValid()), "AvatarEntity is invalid.");
    FVector local_22 = local_16.GetPosition();
    FECSWorldPtr local_26 = ECS::GetECSWorld();
    FECSEntity local_30 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_72 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_30, local_22, Range, EECSQueryRegsitryType(3), false);
    Include local_116;
    local_116.opCall();
    if (!(bIncludeDeath))
    {
        Exclude(local_72).opCall();
    }
    TArray<uint> local_124;
    if ((local_72.GetAllEntities().Num()) == 0)
    {
        return local_124;
    }
    float local_132 = Range + 10000.0f;
    FECSRuntimeQueryIterator local_158 = local_72.Iterator();
    Get local_188;
    for (; local_158.CanProceed;)
    {
        const FECSEntity& local_182 = local_158.Proceed();
        if (!(FASCommonUtils::IsMonsterPrefab(local_182)))
        {
            continue;
        }
        if (bOnlyBoss && (int(FASCommonUtils::GetMonsterRank(local_182)) != 2))
        {
            continue;
        }
        if (!(DataName.IsEmpty()) && !((local_188.opCall().ConfigPtr.GetDataName() == DataName)))
        {
            continue;
        }
        local_124.Add(local_182.GetIdValue());
    }
    return local_124;
}
uint GetNearestPropInRange(const float32 Range, const FString &inout PropType, const FString &inout DataName)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return (AutoTest::API::ECSAPI::GetNearestPropInRangeByEntity(local_8.GetIdValue(), Range, PropType, DataName));
}
uint GetNearestPropInRangeByEntity(const uint EntityId, const float32 Range, const FString &inout PropType, const FString &inout DataName)
{
    bool local_9;
    int local_16 = 0;
    bool local_213;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), "CenterEntity is invalid.");
    FVector local_22 = local_16.GetPosition();
    FECSWorldPtr local_26 = ECS::GetECSWorld();
    FECSEntity local_30 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_72 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_30, local_22, Range, EECSQueryRegsitryType(3), false);
    Include local_116;
    local_116.opCall();
    if (local_72.GetAllEntities().Num() == 0)
    {
        return 0;
    }
    float local_126 = (Range + 10000.0f);
    int local_131 = 0;
    int local_133 = 0;
    int local_132 = local_133;
    if ((PropType == "Default"))
    {
        local_133 = 0;
        local_132 = local_133;
    }
    else
    {
        if ((PropType == "Collect"))
        {
            local_133 = 1;
            local_132 = local_133;
        }
        else
        {
            if ((PropType == "CombatProp"))
            {
                local_133 = 2;
                local_132 = local_133;
            }
            else
            {
                Throw((FString("Invalid PropType: ") + PropType));
            }
        }
    }
    FECSRuntimeQueryIterator local_164 = local_72.Iterator();
    for (; local_164.CanProceed;)
    {
        const FECSEntity& local_188 = local_164.Proceed();
        if (!(FASCommonUtils::IsPropPrefab(local_188)))
        {
            continue;
        }
        if (!(!(PropType.IsEmpty())))
        {
            local_9 = false;
        }
        else
        {
            local_9 = GetPropConfig(local_188);
        }
        if (!(local_9))
        {
            local_9 = false;
        }
        else
        {
            GetPropConfig(local_188);
            local_9 = (local_133 != local_132);
        }
        if (local_9)
        {
            continue;
        }
        if (!(!(DataName.IsEmpty())))
        {
            local_213 = false;
        }
        else
        {
            local_213 = GetPropConfig(local_188);
        }
        if (!(local_213))
        {
            local_213 = false;
        }
        else
        {
            FName local_215;
            GetPropConfig(local_188);
            local_215.GetDataName();
            local_213 = !((local_215 == DataName));
        }
        if (local_213)
        {
            continue;
        }
        Get local_14;
        FVector local_222 = local_14.opCall().GetPosition();
        float local_130 = local_222.Distance(local_22);
        if (local_130 < local_126)
        {
            local_126 = local_130;
            local_131 = local_188.GetIdValue();
        }
    }
    return local_131;
}
TArray<uint> GetAllPropsInRange(const float32 Range, const FString &inout PropType, const FString &inout DataName)
{
    bool local_9;
    int local_16 = 0;
    bool local_213;
    ThrowIf(!(AutoTest::CommonUtils::GetLocalAvatarEntity().IsValid()), "AvatarEntity is invalid.");
    FVector local_22 = local_16.GetPosition();
    TArray<uint> local_26;
    FECSWorldPtr local_30 = ECS::GetECSWorld();
    FECSEntity local_34 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_76 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_34, local_22, Range, EECSQueryRegsitryType(3), false);
    Include local_120;
    local_120.opCall();
    if (local_76.GetAllEntities().Num() == 0)
    {
        return local_26;
    }
    float local_128 = (Range + 10000.0f);
    int local_134 = 0;
    int local_133 = local_134;
    if ((PropType == "Default"))
    {
        local_134 = 0;
        local_133 = local_134;
    }
    else
    {
        if ((PropType == "Collect"))
        {
            local_134 = 1;
            local_133 = local_134;
        }
        else
        {
            if ((PropType == "CombatProp"))
            {
                local_134 = 2;
                local_133 = local_134;
            }
            else
            {
                Throw((FString("Invalid PropType: ") + PropType));
            }
        }
    }
    FECSRuntimeQueryIterator local_164 = local_76.Iterator();
    for (; local_164.CanProceed;)
    {
        const FECSEntity& local_188 = local_164.Proceed();
        if (!(FASCommonUtils::IsPropPrefab(local_188)))
        {
            continue;
        }
        if (!(!(PropType.IsEmpty())))
        {
            local_9 = false;
        }
        else
        {
            local_9 = GetPropConfig(local_188);
        }
        if (!(local_9))
        {
            local_9 = false;
        }
        else
        {
            GetPropConfig(local_188);
            local_9 = (local_134 != local_133);
        }
        if (local_9)
        {
            continue;
        }
        if (!(!(DataName.IsEmpty())))
        {
            local_213 = false;
        }
        else
        {
            local_213 = GetPropConfig(local_188);
        }
        if (!(local_213))
        {
            local_213 = false;
        }
        else
        {
            FName local_215;
            GetPropConfig(local_188);
            local_215.GetDataName();
            local_213 = !((local_215 == DataName));
        }
        if (local_213)
        {
            continue;
        }
        local_26.Add(local_188.GetIdValue());
    }
    return local_26;
}
TArray<uint> GetAllPrefabsInRange(const float32 Range, const FString &inout PrefabClassName)
{
    int local_16 = 0;
    int local_178 = 0;
    ThrowIf(!(AutoTest::CommonUtils::GetLocalAvatarEntity().IsValid()), "AvatarEntity is invalid.");
    FVector local_22 = local_16.GetPosition();
    TArray<uint> local_26;
    FECSWorldPtr local_30 = ECS::GetECSWorld();
    FECSEntity local_34 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_76 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_34, local_22, Range, EECSQueryRegsitryType(3), false);
    Include local_120;
    local_120.opCall();
    if (local_76.GetAllEntities().Num() == 0)
    {
        return local_26;
    }
    FECSRuntimeQueryIterator local_148 = local_76.Iterator();
    for (; local_148.CanProceed;)
    {
        const FECSEntity& local_172 = local_148.Proceed();
        if ((local_178.PrefabClass.GetAssetName() == PrefabClassName))
        {
            local_26.Add(local_172.GetIdValue());
        }
    }
    return local_26;
}
TArray<uint> GetPlayerIdListInRange(const float32 Range, const bool bIncludeDeath)
{
    int local_16 = 0;
    ThrowIf(!(AutoTest::CommonUtils::GetLocalAvatarEntity().IsValid()), "AvatarEntity is invalid.");
    FVector local_22 = local_16.GetPosition();
    FECSWorldPtr local_26 = ECS::GetECSWorld();
    FECSEntity local_30 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_72 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_30, local_22, Range, EECSQueryRegsitryType(3), false);
    Include local_116;
    local_116.opCall();
    if (!(bIncludeDeath))
    {
        Exclude(local_72).opCall();
    }
    TArray<uint> local_124;
    FECSRuntimeQueryIterator local_146 = local_72.Iterator();
    for (; local_146.CanProceed;)
    {
        local_124.Add(local_146.Proceed().GetIdValue());
    }
    return local_124;
}
uint GetNearestEntityInRangeByPrefabClass(const float32 Range, const FString &inout PrefabClassName)
{
    int local_16 = 0;
    int local_184 = 0;
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    FVector local_22 = local_16.GetPosition();
    FECSWorldPtr local_26 = ECS::GetECSWorld();
    FECSEntity local_30 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_72 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_30, local_22, Range, EECSQueryRegsitryType(3), false);
    Include local_116;
    local_116.opCall();
    if (local_72.GetAllEntities().Num() == 0)
    {
        return 0;
    }
    float local_126 = (Range + 10000.0f);
    int local_131 = 0;
    FECSRuntimeQueryIterator local_154 = local_72.Iterator();
    for (; local_154.CanProceed;)
    {
        const FECSEntity& local_178 = local_154.Proceed();
        if ((!((local_184.PrefabClass.GetAssetName() == PrefabClassName))))
        {
            continue;
        }
        Get local_14;
        FVector local_194 = local_14.opCall().GetPosition();
        float local_130 = local_194.Distance(local_22);
        if (local_130 < local_126)
        {
            local_126 = local_130;
            local_131 = local_178.GetIdValue();
        }
    }
    return local_131;
}
void KillEntity(const uint DeathEntityId, const uint KillerEntityId)
{
    bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
    ThrowIf(local_1, "KillEntity can only be called on server side.");
    FECSEntity local_6 = FECSEntity(DeathEntityId);
    ThrowIf(!(local_6.IsValid()), FString().Append("DeathEntityId: ").Append(DeathEntityId).Append(" is invalid"));
    FECSEntity local_10 = FECSEntity(KillerEntityId);
    ThrowIf(!(local_10.IsValid()), FString().Append("KillerEntityId: ").Append(KillerEntityId).Append(" is invalid"));
    FLifeCycleUtils::EntityDeath(local_6, local_10.GetId(), ECS::GetECSWorld().GetFixedTime().Time, true, true, false, true, EDeathReason(0));
    return;
}
void KillEntityCheckNearDeathRule(const uint DeathEntityId, const uint KillerEntityId)
{
    bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
    ThrowIf(local_1, "KillEntity can only be called on server side.");
    FECSEntity local_6 = FECSEntity(DeathEntityId);
    ThrowIf(!(local_6.IsValid()), FString().Append("DeathEntityId: ").Append(DeathEntityId).Append(" is invalid"));
    FECSEntity local_10 = FECSEntity(KillerEntityId);
    ThrowIf(!(local_10.IsValid()), FString().Append("KillerEntityId: ").Append(KillerEntityId).Append(" is invalid"));
    FLifeCycleUtils::KillEntityCheckNearDeathRule(local_6, local_10.GetId(), ECS::GetECSWorld().GetFixedTime().Time, true, true, false, true);
    return;
}
void DestroyEntity(const uint EntityId)
{
    bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
    ThrowIf(local_1, "DestroyEntity can only be called on server side.");
    FECSEntity local_6 = FECSEntity(EntityId);
    ThrowIf(!(local_6.IsValid()), FString().Append("EntityId: ").Append(EntityId).Append(" is invalid"));
    FLifeCycleUtils::EntityDestroyDirectly(local_6, ECS::GetContextTime());
    return;
}
uint SpawnPrefab(const FString &inout PrefabPath, const float32 X, const float32 Y, const float32 Z, const float32 Yaw)
{
    bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
    ThrowIf(local_1, "SpawnPrefab can only be called on server side.");
    TSubclassOf<AECSPrefab> local_8 = TSubclassOf<AECSPrefab>((Cast<UClass>(LoadObject(nullptr, PrefabPath))));
    ThrowIf((local_8 == nullptr), FString().Append("Failed to load PrefabClass from path: ").Append(PrefabPath));
    FRotator local_24 = FRotator(0.0, Yaw, 0.0);
    FECSEntity local_42 = ECS::RequestEntityByPrefabDeferred(local_8, FVector(X, Y, Z), local_24, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    ThrowIf((local_42 == ENTITY_NULL), "Failed to spawn prefab.");
    return local_42.GetIdValue();
}
}
