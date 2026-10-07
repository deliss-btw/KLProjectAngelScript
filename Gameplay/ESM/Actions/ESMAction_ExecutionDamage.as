

class UESMAction_ExecutionDamage : UESMBPBaseInstantAction
{
    UPROPERTY()
    float32 DamageRatio = 1.0f;
    UPROPERTY()
    bool FinalExecutionDamage = false;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_36 = 0;
        bool local_77 = false;
        if (Context.GetECSRuntime().IsServer)
        {
            FDataObjectPtr local_26 = FDataObjectPtr(UCombatGlobalSettingsBase::Get().DefaultExecutionAttackDataRow);
            Modify local_32;
            FC_ExecutedInfo& local_34 = local_32.opCall();
            if (local_34)
            {
                if (local_34.GetExecuteEntityArray().Num() > 0)
                {
                    Get local_44;
                    FECSEntity local_40 = FECSEntity(local_34.GetExecuteEntityArray()[0]);
                    float32 local_69 = this.DamageRatio;
                    ::FDamageUtils::AddExecutionDamage(local_40, local_40, Context.GetEntity(), local_69, local_44.opCall().GetPosition(), Time.WorldTime);
                    bool local_1_2 = this.FinalExecutionDamage;
                    if (local_1_2)
                    {
                        FC_ExecutedConfig local_76;
                        if (local_34.GetChaosKnotFXEntity().IsValid())
                        {
                            ::BlueprintFunctions_Common::StopFX(FECSEntityAdapter(local_34.GetChaosKnotFXEntity()), false, false, 0.0f);
                            local_34.SetChaosKnotFXEntity(ENTITY_NULL);
                        }
                        if (!(local_76))
                        {
                            local_1_2 = false;
                        }
                        else
                        {
                            local_77 = local_76.ExecutionConfigData;
                            local_1_2 = local_77;
                        }
                        if (local_1_2)
                        {
                            int local_237;
                            local_77 = !local_77;
                            if (local_77)
                            {
                                local_1_2 = true;
                                FECSEntityAdapter local_84 = FECSEntityAdapter(Context.GetEntity());
                            }
                            FBuffConfigRef local_154 = local_76.GetExecuteBuff();
                            TDataObjectPtr<FMessageHintConfig> local_202 = local_76.GetMessageHintConfig();
                            FFPTime local_236 = (FFPTime(Time.WorldTime) + FFPTime(local_69));
                            local_237 = 0;
                            if (local_154.IsValid())
                            {
                                TDataObjectPtr<FBuffConfig> local_262;
                                local_69 = local_262.opArrow().BuffDuration;
                                local_237 = int(local_69);
                            }
                            FVector local_268;
                            ::BlueprintFunctions_Level::GetEntityLocation(FECSEntityAdapter(Context.GetEntity()), local_268);
                            local_69 = local_69 * 0.0f;
                            TArray<FECSEntity> local_274;
                            if (local_34.GetExecuteTeamEntity().IsValid())
                            {
                                Get local_278;
                                const FC_TeamInfo& local_280 = local_278.opCall();
                                if (local_280)
                                {
                                    for (auto& local_294 : local_280.GetMembers())
                                    {
                                        local_294;
                                        FECSEntity local_298 = FECSEntity(ENTITY_NULL);
                                        Get local_302;
                                        const FC_PlayerController& local_304 = local_302.opCall();
                                        if (local_304)
                                        {
                                            local_298 = local_304.GetPlayerPawnEntity();
                                        }
                                        if (!(local_298.IsValid()))
                                        {
                                            continue;
                                        }
                                        if (local_34.GetExecuteEntityArray().Contains(local_298))
                                        {
                                            local_274.Add(local_298);
                                        }
                                        else
                                        {
                                            if ((FVector(local_44.opCall().GetPosition()) - local_268).SizeSquared2D() <= local_69)
                                            {
                                                local_274.Add(local_298);
                                            }
                                        }
                                    }
                                }
                            }
                            else
                            {
                                local_274 = local_34.GetExecuteEntityArray();
                            }
                            local_34.SetAddBuffEntityArray(local_274);
                            for (auto& local_338 : local_274)
                            {
                                ::MessageHintUtils::ShowMessageHint(local_338, local_202, TArray<FTextArgument>());
                                if (local_154.IsValid())
                                {
                                    local_1_2 = false;
                                    FBuffUtils::AddBuff(local_338, local_154, local_236, local_338, false, local_237, 1, local_1_2);
                                }
                                if (ECS::GetRuntimeInfo().IsServer && local_1_2)
                                {
                                    ::BlueprintFunctions_Common::SpawnEnergyBall(FECSEntityAdapter(local_338), TSoftClassPtr<AEnergyBallPrefab>(), local_268, local_36, EEnergyBallSpawnDirection(0));
                                }
                            }
                            if (unresolved.ExecuteMonsterDebuff.IsValid())
                            {
                                local_77 = false;
                            }
                        }
                    }
                }
            }
        }
        return;
    }
}

