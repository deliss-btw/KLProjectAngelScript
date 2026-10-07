

class USkillUsableCheckFunctions_Default : USkillUsableCheckFunctions
{
    USkillUsableCheckFunctions_Default()
    {
        return;
    }
    UFUNCTION()
    bool CheckCD_Implementation(const FECSEntity &inout OwnerEntity, const FC_SkillInstance &inout SkillInstance, const FFPTime &inout Time) const
    {
        Get local_4;
        const FC_CheatComponent& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetbHasNoCDBuff() || local_6.GetbSkillNoCD())
            {
                return true;
            }
        }
        return (SkillInstance.GetCDCost().Evaluate(Time) >= 1.0f);
    }
    UFUNCTION()
    bool CheckCosumeItem_Implementation(const FECSEntity &inout OwnerEntity, const FC_SkillInstance &inout SkillInstance, const FFPTime &inout Time) const
    {
        if (SkillInstance.GetConsumeConfig().ConsumeItemRow.IsValid())
        {
            TDataObjectPtr<FItemConfig> local_50 = TDataObjectPtr<FItemConfig>(SkillInstance.GetConsumeConfig().ConsumeItemRow);
            if (::InventoryUtils::GetInventoryItemNumber(OwnerEntity, local_50) < int(SkillInstance.GetConsumeConfig().ConsumeItemNumber))
            {
                TDataObjectPtr<FMessageHintConfig> local_100;
                if (GetItemShortageTips())
                {
                    local_100 = GetItemShortageTips();
                }
                else
                {
                    local_100 = ::UCombatGlobalSettings::Get().ConsumeItemFailHint;
                }
                ::MessageHintUtils::ShowMessageHint(OwnerEntity, local_100, TArray<FTextArgument>());
                return false;
            }
        }
        return true;
    }
    UFUNCTION()
    bool CheckCosumeAttribute_Implementation(const FECSEntity &inout OwnerEntity, const FC_SkillInstance &inout SkillInstance, const FFPTime &inout Time) const
    {
        float32 local_29 = 0.0f;
        UCombatGlobalSettings local_40;
        float32 local_1 = 0.0f;
        if (!(SkillInstance.GetConsumeConfig().ConsumeAttribute.IsEmpty()))
        {
            Make local_110;
            UDataTable::FindDataObject local_70;
            FCS_FixedTime local_38;
            Get local_8;
            bool local_4;
            local_4 = false;
            const FC_GameAttribute& local_10 = local_8.opCall();
            if (local_10)
            {
                for (auto& local_28 : SkillInstance.GetConsumeConfig().ConsumeAttribute)
                {
                    float32 local_2 = local_10.GetAttributeValue(local_28.GetKey(), Time);
                    if (local_2 < (local_29 + local_1))
                    {
                        if (local_2 < local_29)
                        {
                            FECSWorldPtr local_32 = ECS::GetECSWorld();
                            if (local_38.bLatestFrame)
                            {
                                local_40 = ::UCombatGlobalSettings::Get();
                                FName local_76 = FName(local_28.GetKey().ToString());
                                TDataObjectPtr<FAttributeTextData> local_100 = local_70.opCall(local_76);
                                TArray<FTextArgument> local_104;
                                local_104.Add(local_110.opImplConv());
                                ::MessageHintUtils::ShowMessageHint(OwnerEntity, ::UCombatGlobalSettings::Get().SkillInsufficientResourceHint, local_104);
                            }
                        }
                        local_4 = true;
                        break;
                    }
                }
            }
            else
            {
                local_4 = true;
            }
            if (local_4)
            {
                return false;
            }
        }
        local_29 = 0.0f;
        if (!(SkillInstance.GetConsumeConfig().BlockWhenNegativeAttributes.IsEmpty()))
        {
            Make local_110;
            UDataTable::FindDataObject local_70;
            FCS_FixedTime local_38;
            Get local_8;
            const FC_GameAttribute& local_10_2 = local_8.opCall();
            if (local_10_2)
            {
                for (auto& local_132 : SkillInstance.GetConsumeConfig().BlockWhenNegativeAttributes)
                {
                    float32 local_30 = local_10_2.GetAttributeValue(local_132, Time);
                    if (local_30 < local_29)
                    {
                        if (local_30 < 0.0f)
                        {
                            FECSWorldPtr local_32_2 = ECS::GetECSWorld();
                            if (local_38.bLatestFrame)
                            {
                                local_40 = ::UCombatGlobalSettings::Get();
                                FName local_76_2 = FName(local_132.ToString());
                                TDataObjectPtr<FAttributeTextData> local_66 = local_70.opCall(local_76_2);
                                TArray<FTextArgument> local_104;
                                local_104.Add(local_110.opImplConv());
                                ::MessageHintUtils::ShowMessageHint(OwnerEntity, ::UCombatGlobalSettings::Get().SkillInsufficientResourceHint, local_104);
                            }
                        }
                        return false;
                    }
                }
            }
        }
        return true;
    }
    UFUNCTION()
    bool CheckRemnantItemUsableCount_Implementation(const FECSEntity &inout OwnerEntity, const FC_SkillInstance &inout SkillInstance, const FFPTime &inout Time) const
    {
        if (SkillInstance.GetConsumeConfig().bConsumeRemnantItemUsableCount)
        {
            FECSEntity local_6 = ::FASCommonUtils::GetUniquePlayerEntity(OwnerEntity);
            if (local_6.IsValid())
            {
                Get local_14;
                const FC_RemnantInfo& local_16 = local_14.opCall();
                if (local_16)
                {
                    if (local_16.GetRemainUsableCount() > 0)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        return true;
    }
}

