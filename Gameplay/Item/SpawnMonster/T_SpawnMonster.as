struct FT_SpawnMonster : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SpawnMonsterConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SpawnMonsterConfig, NAME_None);
    UPROPERTY()
    FC_SpawnMonsterConfig Config_FC_SpawnMonsterConfig;

    FT_SpawnMonster()
    {
        return;
    }
    FString ValidateConfig(const AECSPrefab Prefab) const
    {
        TSet<TDataObjectPtr<FMonsterMainConfig>> local_20;
        if (!(this.Config_FC_SpawnMonsterConfig.SpawnMonsterConfigs.IsEmpty()))
        {
            float32 local_22 = 0.0f;
            for (auto& local_38 : this.Config_FC_SpawnMonsterConfig.SpawnMonsterConfigs)
            {
                if (local_20.Contains(local_38.MonsterConfig))
                {
                    return FString().Append("Prefab [").Append(Prefab.GetPathName(nullptr)).Append("] ValidateConfig Fail: SpawnMonster Configs中有重复的Monster种类！");
                }
                local_20.Add(local_38.MonsterConfig);
                local_22 = local_22 + local_38.SpawnProbability;
            }
            if (local_20.Contains(TDataObjectPtr<FMonsterMainConfig>(nullptr)) && (local_22 != 1.0f))
            {
                return FString().Append("Prefab [").Append(Prefab.GetPathName(nullptr)).Append("] ValidateConfig Fail: SpawnMonster Configs中有显式指定不生成Monster项时，应保证概率总和为1.0！");
            }
            if ((local_22 <= 0.0f || (local_22 > 1.0f)))
            {
                return FString().Append("Prefab [").Append(Prefab.GetPathName(nullptr)).Append("] ValidateConfig Fail: SpawnMonster Configs中概率总和Sum应满足 0.0f < Sum <= 1.0f (当没有显示指定不生成Monster项时, 总和可以小于1)！");
            }
        }
        return "";
    }
}

