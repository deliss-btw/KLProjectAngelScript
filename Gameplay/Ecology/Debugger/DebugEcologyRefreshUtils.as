
namespace FDebugEcologyRefreshUtils
{
void ForceRefreshAllSpawner()
{
    FECSEntity local_10 = ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(9), n"Query");
    FECSRuntimeQuery local_56 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_10, EECSQueryRegsitryType(4), false);
    Include local_100;
    local_100.opCall();
    FECSRuntimeQueryIterator local_122 = local_56.Iterator();
    for (; local_122.CanProceed;)
    {
        const FECSEntity& local_146 = local_122.Proceed();
        int local_153 = 0;
        for (; local_153 < 0.SpawnerData.Num(); )
        {
            FEcologySpawnerUtils::RefreshFlockSpawner(ECS::GetECSWorld().GetFixedTime(), local_146, local_153);
            ++local_153;
        }
    }
    return;
}
void ForceAllSpawnerReSpawn()
{
    int local_152 = 0;
    FECSEntity local_10 = ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(9), n"Query");
    FECSRuntimeQuery local_56 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_10, EECSQueryRegsitryType(4), false);
    Include local_100;
    local_100.opCall();
    FECSRuntimeQueryIterator local_122 = local_56.Iterator();
    for (; local_122.CanProceed;)
    {
        const FECSEntity& local_146 = local_122.Proceed();
        int local_153 = 0;
        for (; local_153 < local_152.SpawnerData.Num(); )
        {
            FFlockSpawnerData& local_156 = local_152.SpawnerData[local_153];
            TArray<FECSEntity> local_160 = local_156.FlockEntities;
            for (auto& local_174 : local_160)
            {
                FEcologyLifeCycleUtils::KillFlockEntity(local_174);
                Modify local_178;
                FC_EcologyFlockComponent& local_180 = local_178.opCall();
                if (local_180)
                {
                    FEcologyLifeCycleUtils::ImmediateUnregisterFlockData(local_174, local_180);
                }
            }
            local_156.FlockEntities.Empty(0);
            FEcologySpawnerUtils::RefreshFlockSpawner(ECS::GetECSWorld().GetFixedTime(), local_146, local_153);
            ++local_153;
        }
    }
    return;
}
void ForceRespawnFlock(const FECSEntity &inout FlockEntity)
{
    int local_6 = 0;
    FECSEntity::Modify<FC_EcologyFlockComponent> local_4 = FECSEntity::Modify<FC_EcologyFlockComponent>(FlockEntity);
    FECSEntity local_10 = FECSEntity(local_6.SpawnerDataRef.SpawnerEntity);
    FEcologyLifeCycleUtils::KillFlockEntity(FlockEntity);
    FEcologyLifeCycleUtils::ImmediateUnregisterFlockData(FlockEntity, local_6);
    FEcologySpawnerUtils::RefreshFlockSpawner(ECS::GetECSWorld().GetFixedTime(), local_10, local_6.SpawnerDataRef.SubIndex);
    return;
}
FECSEntity GetAvatarEntity()
{
    FECSEntity local_4;
    int local_138 = 0;
    FECSEntity __return;
    FECSWorldPtr local_6 = FECSWorldPtr(ECS::GetECSWorld());
    if (!(local_6.IsValid()))
    {
        return local_4;
    }
    Has local_124;
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FECSRuntimeView local_28 = local_6.GetRuntimeView(EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        FECSRuntimeViewIterator local_84 = local_28.Iterator();
        for (; local_84.CanProceed;)
        {
            const FECSEntity& local_120 = local_84.Proceed();
            if (local_124.opCall() && local_120.IsActive())
            {
                Get local_130;
                const FC_MountIsDrivenBy& local_132 = local_130.opCall();
                if (local_132)
                {
                    return local_132.GetDriverEntity();
                }
                return local_120;
            }
        }
    }
    else
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            if (!(local_138))
            {
                return local_4;
            }
            FECSEntity local_142 = FECSEntity(local_138.GetPlayerPawnEntity());
            if (!(local_142.IsValid()))
            {
                return local_4;
            }
            __return = local_142;
        }
        else
        {
        }
    }
    __return = local_4;
    return __return;
}
FTransform GetWorldTransform(const FECSEntity &inout Entity)
{
    int local_6 = 0;
    FTransform local_32 = FTransform(FTransform::Identity);
    if (!(local_6))
    {
        return local_32;
    }
    local_32.SetLocation(local_6.GetPosition());
    local_32.SetRotation(local_6.GetRotation());
    return local_32;
}
bool DebugCheckCVarIntValue(const int CVarInt, const int value)
{
    if (CVarInt == value)
    {
        return true;
    }
    return false;
}
bool ParserFunctorParams(const FString &inout Clasure, FEcoQueryContext &inout OutParams)
{
    TArray<FString> local_8;
    int local_20 = 0;
    FString local_16;
    bool local_18 = SwiProlog::DebugParserPrologArgs(Clasure, local_8, local_16);
    if (!(local_18))
    {
        return false;
    }
    local_20.Reset(0);
    if (!(local_16.IsEmpty()))
    {
        int local_21 = local_8.Num();
    }
    for (auto& local_42 : local_8)
    {
        local_20.Add(FDebugEcologyRefreshUtils::ParserTerm(local_42));
    }
    return true;
}
FPlTerm ParserTerm(const FString &inout TermStr)
{
    FString local_8 = TermStr.TrimStartAndEnd();
    int local_9 = 0;
    int local_11 = 0;
    if (!(local_8.FindChar(int16(123), local_9)))
    {
        return FPlTerm(local_8);
    }
    local_8.FindChar(int16(125), local_11);
    FString local_20 = local_8.Left(local_9).ToLower();
    FString local_24 = local_8.Mid(local_9 + 1, ((local_11 - local_9) - 1));
    if ((local_20 == "entity"))
    {
        int local_31;
        local_31 = 0;
        if (!(local_24.IsEmpty()) && local_24.IsNumeric())
        {
            local_31 = String::Conv_StringToInt(local_24);
        }
        return FPlTerm(FECSEntityId(local_31));
    }
    return FPlTerm(local_8);
}
}
