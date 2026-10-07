
namespace SpawnMonsterUtils
{
void SpawnMonsterByConfig(const FECSEntity &inout Entity, const TArray<FSpawnMonsterConfigItem> &inout SpawnMonsterConfigs)
{
    int local_24 = 0;
    float32 local_4 = FMath::RandRange(0.0f, 1.0f);
    float32 local_5 = 0.0f;
    XLog(ELog(42), FString().Append("[SpawnMonster] Entity[").Append(Entity.GetIdValue()).Append("] ConfigCount=").Append(SpawnMonsterConfigs.Num()).Append(" RandomWeight=").Append(local_4));
    int local_14 = 0;
    for (; local_14 < SpawnMonsterConfigs.Num(); ++local_14)
    {
        const FSpawnMonsterConfigItem& local_18 = SpawnMonsterConfigs[local_14];
        local_5 = local_5 + local_18.SpawnProbability;
        if (local_5 > local_4)
        {
            if (!(local_18.MonsterConfig.IsSet()))
            {
                XLog(ELog(42), FString().Append("[SpawnMonster] Entity[").Append(Entity.GetIdValue()).Append("] Hit index=").Append(local_14).Append(" but MonsterConfig is not set, skip spawn"));
                break;
            }
            if (local_24)
            {
                FVector local_42 = (FVector(local_24.GetPosition()) + local_18.LocationOffset);
                FRotator local_60 = (local_24.GetRotation().Rotator() + local_18.RotationOffset);
                XLog(ELog(42), FString().Append("[SpawnMonster] Entity[").Append(Entity.GetIdValue()).Append("] Hit index=").Append(local_14).Append(" Monster=").Append(local_18.MonsterConfig.ToString()).Append(" Probability=").Append(local_60).Append(" Pos=").Append(local_42).Append(" Rot=").Append(local_60));
                FECSEntity local_80 = BlueprintFunctions_Ecology::SpawnMonsterByMonsterIdInValidPos(FECSEntityAdapter(Entity), local_18.MonsterConfig, local_42, local_60, local_18.MaxNearbyRadius, local_18.StepLength, true, nullptr, 0, NAME_None, false);
                if (local_80.IsValid() && !((local_18.OverrideESMEntryStateName == NAME_None)))
                {
                    XLog(ELog(42), FString().Append("[SpawnMonster] Entity[").Append(Entity.GetIdValue()).Append("] OverrideESMEntryState=").Append(local_18.OverrideESMEntryStateName).Append(" SMIndex=").Append(local_18.OverrideESMEntryStateMachineIndex).Append(" on SpawnedEntity[").Append(local_80.GetIdValue()).Append("]"));
                    ModifyOrAdd local_88;
                    FC_ESMOverrideEntryState& local_90 = local_88.opCall();
                    if (local_90)
                    {
                        local_90.Add(uint8(int(local_18.OverrideESMEntryStateMachineIndex)), local_18.OverrideESMEntryStateName);
                    }
                }
            }
            break;
        }
    }
    return;
}
}
