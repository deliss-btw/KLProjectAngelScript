class UESMAction_SetAutoSpawnMonsterOnDeathEnabled : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bEnabled = false;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_10;
        XLog(ELog(42), FString().Append("[SpawnMonster] Entity[").Append(Context.GetEntity().GetIdValue()).Append("] SetAutoSpawnMonsterOnDeath=").Append(this.bEnabled).Append(", Previous=").Append(local_10.opCall()));
        if (this.bEnabled)
        {
            FC_SpawnMonsterOnDeathTag local_18;
            Assign local_16;
            local_16.opCall(local_18);
            return;
        }
        Remove local_22;
        local_22.opCall();
        return;
    }
}

class UESMAction_SpawnMonsterBasedOnProbability : UESMBPBaseInstantAction
{
    UPROPERTY()
    TArray<FSpawnMonsterConfigItem> OverrideSpawnMonsterConfigs;
    UPROPERTY()
    bool bDisableAutoSpawnOnDeath = false;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        TSet<TDataObjectPtr<FMonsterMainConfig>> local_20;
        if (!(this.OverrideSpawnMonsterConfigs.IsEmpty()))
        {
            float32 local_22 = 0.0f;
            for (auto& local_38 : this.OverrideSpawnMonsterConfigs)
            {
                if (local_20.Contains(local_38.MonsterConfig))
                {
                    Info.AddDataInvalidComment(EESMDataValidType(2), FString().Append("SpawnMonster Configs中有重复的Monster种类！"));
                    return;
                }
                local_20.Add(local_38.MonsterConfig);
                local_22 = local_22 + local_38.SpawnProbability;
            }
            if (local_20.Contains(TDataObjectPtr<FMonsterMainConfig>(nullptr)) && (local_22 != 1.0f))
            {
                Info.AddDataInvalidComment(EESMDataValidType(2), FString().Append("SpawnMonster Configs中有显式指定不生成Monster项时，应保证概率总和为1.0！"));
                return;
            }
            if ((local_22 <= 0.0f || (local_22 > 1.0f)))
            {
                Info.AddDataInvalidComment(EESMDataValidType(2), FString().Append("SpawnMonster Configs中概率总和Sum应满足 0.0f < Sum <= 1.0f (当没有显示指定不生成Monster项时, 总和可以小于1)！"));
                return;
            }
        }
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (this.OverrideSpawnMonsterConfigs.IsEmpty())
        {
            if (local_6)
            {
                ::SpawnMonsterUtils::SpawnMonsterByConfig(Context.GetEntity(), local_6.SpawnMonsterConfigs);
            }
        }
        else
        {
            ::SpawnMonsterUtils::SpawnMonsterByConfig(Context.GetEntity(), this.OverrideSpawnMonsterConfigs);
        }
        if (this.bDisableAutoSpawnOnDeath)
        {
            Has local_18;
            XLog(ELog(42), FString().Append("[SpawnMonster] Entity[").Append(Context.GetEntity().GetIdValue()).Append("] DisableAutoSpawnOnDeath, Previous=").Append(local_18.opCall()));
            Remove local_24;
            local_24.opCall();
        }
        return;
    }
}

