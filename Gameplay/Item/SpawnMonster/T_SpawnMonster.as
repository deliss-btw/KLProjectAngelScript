

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
                    return FString().Append("Prefab [").Append(Prefab.GetPathName(nullptr)).Append("] ValidateConfig Fail: SpawnMonster Configsдё­жњ‰й‡Ќе¤Ќзљ„Monsterз§Ќз±»пјЃ");
                }
                local_20.Add(local_38.MonsterConfig);
                local_22 = local_22 + local_38.SpawnProbability;
            }
            if (local_20.Contains(TDataObjectPtr<FMonsterMainConfig>(nullptr)) && (local_22 != 1.0f))
            {
                return FString().Append("Prefab [").Append(Prefab.GetPathName(nullptr)).Append("] ValidateConfig Fail: SpawnMonster Configsдё­жњ‰жѕејЏжЊ‡е®љдёЌз”џж€ђMonsterйЎ№ж—¶пјЊеє”дїќиЇЃж¦‚зЋ‡жЂ»е’Њдёє1.0пјЃ");
            }
            if ((local_22 <= 0.0f || (local_22 > 1.0f)))
            {
                return FString().Append("Prefab [").Append(Prefab.GetPathName(nullptr)).Append("] ValidateConfig Fail: SpawnMonster Configsдё­ж¦‚зЋ‡жЂ»е’ЊSumеє”ж»Ўи¶і 0.0f < Sum <= 1.0f (еЅ“жІЎжњ‰жѕз¤єжЊ‡е®љдёЌз”џж€ђMonsterйЎ№ж—¶, жЂ»е’ЊеЏЇд»Ґе°ЏдєЋ1)пјЃ");
            }
        }
        return "";
    }
}

