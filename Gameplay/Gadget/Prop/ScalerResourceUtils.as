
namespace FScalerResourceUtils
{
UFUNCTION()
bool IsReachRecoverExtreme(const FC_ScalerResourceConfig &inout ScalerResourceConfig, const FC_ScalerResourceRuntime &inout ScalerResourceRuntime, const int Index)
{
    if (!(ScalerResourceConfig.ScalerResourceConfigData.Num() > Index && (ScalerResourceRuntime.GetValues().Num() > Index)))
    {
        return false;
    }
    EScalerResourceChangeType local_4 = ScalerResourceConfig.ScalerResourceConfigData[Index].ChangeType;
    float32 local_6 = ScalerResourceConfig.ScalerResourceConfigData[Index].ValueMin;
    float32 local_7 = ScalerResourceConfig.ScalerResourceConfigData[Index].ValueMax;
    float32 local_9 = ScalerResourceRuntime.GetValues()[Index];
    return (((int(local_4) == 0 || (int(local_4) == 1)) && (local_9 >= local_7))) || (int(local_4) == 2 && (local_9 <= local_6));
}
UFUNCTION()
bool IsReachConsumeExtreme(const FC_ScalerResourceConfig &inout ScalerResourceConfig, const FC_ScalerResourceRuntime &inout ScalerResourceRuntime, const int Index)
{
    if (!(ScalerResourceConfig.ScalerResourceConfigData.Num() > Index && (ScalerResourceRuntime.GetValues().Num() > Index)))
    {
        return false;
    }
    EScalerResourceChangeType local_4 = ScalerResourceConfig.ScalerResourceConfigData[Index].ChangeType;
    float32 local_6 = ScalerResourceConfig.ScalerResourceConfigData[Index].ValueMin;
    float32 local_8 = ScalerResourceConfig.ScalerResourceConfigData[Index].ValueMax;
    float32 local_9 = ScalerResourceRuntime.GetValues()[Index];
    return (((int(local_4) == 0 || (int(local_4) == 1)) && (local_9 <= local_6))) || (int(local_4) == 2 && (local_9 >= local_8));
}
UFUNCTION()
bool IsRestResourceEnoughForDecrement(const FC_ScalerResourceConfig &inout ScalerResourceConfig, const FC_ScalerResourceRuntime &inout ScalerResourceRuntime, const int Index)
{
    if (!(ScalerResourceConfig.ScalerResourceConfigData.Num() > Index && (ScalerResourceRuntime.GetValues().Num() > Index)))
    {
        return false;
    }
    else
    {
        if (!(int(ScalerResourceConfig.ScalerResourceConfigData[Index].ChangeType) == 1 || (int(ScalerResourceConfig.ScalerResourceConfigData[Index].ChangeType) == 0)))
        {
            return false;
        }
        else
        {
            float32 local_10;
            float32 local_9;
            float32 local_7;
            EScalerResourceChangeType local_6;
            local_6 = ScalerResourceConfig.ScalerResourceConfigData[Index].ChangeType;
            local_7 = ScalerResourceConfig.ScalerResourceConfigData[Index].ValueMin;
            local_9 = ScalerResourceConfig.ScalerResourceConfigData[Index].ValueMax;
            local_10 = ScalerResourceRuntime.GetValues()[Index];
            float32 local_8 = local_10 - local_7;
            if ((int(ScalerResourceConfig.ScalerResourceConfigData[Index].ChangeType)) == 1)
            {
                return (local_8 >= ScalerResourceConfig.ScalerResourceConfigData[Index].DeltaValueAbs);
            }
            else
            {
                return (local_8 > 0.0f);
            }
        }
    }
}
void ProcessConsumeScalerResource(const int Index, const FECSEntity &inout Entity, const FC_ScalerResourceConfig &inout ScalerResourceConfig, FC_ScalerResourceRuntime &inout ScalerResourceRuntime, const float32 DeltaValueAbs)
{
    float32 local_8;
    const FScalerResourceConfigData& local_2 = ScalerResourceConfig.ScalerResourceConfigData[Index];
    if (int(local_2.ChangeType) == 0 || (int(local_2.ChangeType) == 1))
    {
        local_8 = -1.0f;
    }
    else
    {
        local_8 = 1.0f;
    }
    float32 local_9 = DeltaValueAbs * local_8;
    local_8 = ScalerResourceRuntime.GetModify_Values()[] + local_9;
    if (int(local_2.ChangeType) == 2 && (ScalerResourceRuntime.GetValues()[] >= local_2.ValueMax))
    {
        Get local_18;
        Has local_14;
        bool local_7;
        float32 local_9_2 = local_2.ValueMax;
        ScalerResourceRuntime.GetModify_Values()[] = local_9_2;
        if (local_2.bValueConsumeExtremeActivateESMTrigger)
        {
            FESMUtils::ActivateESMTrigger(Entity, local_2.ValueConsumeExtremeESMTrigger, 0.1f);
            local_7 = local_14.opCall();
            if (local_7)
            {
                const FC_Owner& local_20 = local_18.opCall();
                if (local_20)
                {
                    if (local_20.GetOwnerEntity().IsValid())
                    {
                        FESMUtils::ActivateESMTrigger(local_20.GetOwnerEntity(), local_2.ValueConsumeExtremeESMTrigger, 0.1f);
                    }
                }
            }
        }
    }
    else
    {
        Get local_18;
        Has local_14;
        bool local_7;
        if ((int(local_2.ChangeType) == 0 || (int(local_2.ChangeType) == 1)) && (ScalerResourceRuntime.GetValues()[] <= local_2.ValueMin))
        {
            ScalerResourceRuntime.GetModify_Values()[] = local_2.ValueMin;
            if (local_2.bValueConsumeExtremeActivateESMTrigger)
            {
                FESMUtils::ActivateESMTrigger(Entity, local_2.ValueConsumeExtremeESMTrigger, 0.1f);
                local_7 = local_14.opCall();
                if (local_7)
                {
                    const FC_Owner& local_20_2 = local_18.opCall();
                    if (local_20_2)
                    {
                        if (local_20_2.GetOwnerEntity().IsValid())
                        {
                            FESMUtils::ActivateESMTrigger(local_20_2.GetOwnerEntity(), local_2.ValueConsumeExtremeESMTrigger, 0.1f);
                        }
                    }
                }
            }
        }
    }
    ScalerResourceRuntime.SetCurrentFixedTickChangedBitMask(uint8((ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() | (1 << Index))));
    return;
}
UFUNCTION()
bool DealConsumeScalerResource(const FECSEntity &inout Entity, const FC_ScalerResourceConfig &inout ScalerResourceConfig, FC_ScalerResourceRuntime &inout ScalerResourceRuntime, const FScalerResourceConsumeConfig &inout ScalerResourceConsumeConfig)
{
    float32 local_33;
    int local_35 = 0;
    bool local_38;
    bool local_39;
    int local_2 = ScalerResourceRuntime.GetValues().Num();
    if (!((ScalerResourceConfig.ScalerResourceConfigData.Num() == local_2)))
    {
        return false;
    }
    bool local_4 = true;
    int local_1 = int(ScalerResourceConsumeConfig.ChangeOrder);
    if (local_1 == 0)
    {
        float32 local_37;
        float32 local_31;
        float32 local_30;
        float32 local_28;
        if (ScalerResourceConsumeConfig.bRevertIfAnyOneFails)
        {
            for (auto& local_20 : ScalerResourceConsumeConfig.SpecificScalerResourceConsumeConfigs)
            {
                int local_21 = 0;
                while (local_21 < local_1)
                {
                    const FScalerResourceConfigData& local_24 = ScalerResourceConfig.ScalerResourceConfigData[local_21];
                    if ((local_24.Name == local_20.Name))
                    {
                        float32 local_32;
                        if (local_20.bOverrideDeltaValueAbs)
                        {
                            local_28 = local_20.OverrideDeltaValueAbs;
                        }
                        else
                        {
                            local_28 = local_24.DeltaValueAbs;
                        }
                        local_30 = ScalerResourceConfig.ScalerResourceConfigData[local_21].ValueMin;
                        local_31 = ScalerResourceConfig.ScalerResourceConfigData[local_21].ValueMax;
                        local_32 = ScalerResourceRuntime.GetValues()[local_21];
                        local_1 = int(local_24.ChangeType);
                        if (local_1 == 0 || (int(local_24.ChangeType) == 1))
                        {
                            local_37 = local_32 - local_30;
                        }
                        else
                        {
                            local_37 = local_31 - local_32;
                        }
                        local_35 = int(local_24.ChangeType);
                        if ((local_35 == 1 && (local_37 < local_28)) || (int(local_24.ChangeType) == 0 && FScalerResourceUtils::IsReachConsumeExtreme(ScalerResourceConfig, ScalerResourceRuntime, local_21)))
                        {
                            local_4 = false;
                            break;
                        }
                    }
                    ++local_21;
                }
                if (!(local_4))
                {
                    break;
                }
            }
        }
        if (local_4)
        {
            for (auto& local_20 : ScalerResourceConsumeConfig.SpecificScalerResourceConsumeConfigs)
            {
                int local_21_2 = 0;
                while (local_21_2 < local_1)
                {
                    const FScalerResourceConfigData& local_24_2 = ScalerResourceConfig.ScalerResourceConfigData[local_21_2];
                    if ((local_24_2.Name == local_20.Name))
                    {
                        if (local_20.bOverrideDeltaValueAbs)
                        {
                            local_33 = local_20.OverrideDeltaValueAbs;
                        }
                        else
                        {
                            local_33 = local_24_2.DeltaValueAbs;
                        }
                        FScalerResourceUtils::ProcessConsumeScalerResource(local_21_2, Entity, ScalerResourceConfig, ScalerResourceRuntime, local_33);
                    }
                    ++local_21_2;
                }
            }
        }
    }
    else
    {
        float32 local_37;
        float32 local_31;
        float32 local_30;
        float32 local_28;
        if (int(ScalerResourceConsumeConfig.ChangeOrder) == 1)
        {
            if (ScalerResourceConsumeConfig.bRevertIfAnyOneFails)
            {
                for (auto& local_20 : ScalerResourceConsumeConfig.SpecificScalerResourceConsumeConfigs)
                {
                    local_39 = false;
                    int local_21_3 = 0;
                    while (local_21_3 < local_2)
                    {
                        const FScalerResourceConfigData& local_24_3 = ScalerResourceConfig.ScalerResourceConfigData[local_21_3];
                        if (local_20.bOverrideDeltaValueAbs)
                        {
                            local_30 = local_20.OverrideDeltaValueAbs;
                        }
                        else
                        {
                            local_30 = local_24_3.DeltaValueAbs;
                        }
                        if ((local_24_3.Name == local_20.Name))
                        {
                            if (local_24_3.bCanRecover)
                            {
                                local_39 = true;
                                break;
                            }
                            if ((int(local_24_3.ChangeType) == 1 && (ScalerResourceRuntime.GetValues()[local_21_3] < local_30)) || FScalerResourceUtils::IsReachConsumeExtreme(ScalerResourceConfig, ScalerResourceRuntime, local_21_3))
                            {
                                local_4 = false;
                                break;
                            }
                        }
                        ++local_21_3;
                    }
                    if (local_39 || !(local_4))
                    {
                        break;
                    }
                }
            }
            if (local_4)
            {
                for (auto& local_20 : ScalerResourceConsumeConfig.SpecificScalerResourceConsumeConfigs)
                {
                    int local_21_4 = 0;
                    while (local_21_4 < local_35)
                    {
                        const FScalerResourceConfigData& local_24_4 = ScalerResourceConfig.ScalerResourceConfigData[local_21_4];
                        if (local_20.bOverrideDeltaValueAbs)
                        {
                            local_31 = local_20.OverrideDeltaValueAbs;
                        }
                        else
                        {
                            local_31 = local_24_4.DeltaValueAbs;
                        }
                        local_30 = ScalerResourceConfig.ScalerResourceConfigData[local_21_4].ValueMin;
                        float32 local_27 = ScalerResourceConfig.ScalerResourceConfigData[local_21_4].ValueMax;
                        local_28 = local_27;
                        local_37 = ScalerResourceRuntime.GetValues()[local_21_4];
                        if (int(local_24_4.ChangeType) == 0 || (int(local_24_4.ChangeType) == 1))
                        {
                            local_27 = local_37 - local_30;
                        }
                        else
                        {
                            local_27 = local_28 - local_37;
                        }
                        local_38 = int(ScalerResourceConfig.ScalerResourceConfigData[local_21_4].ChangeType) == 1 && (local_27 < local_31);
                        if (local_38 || FScalerResourceUtils::IsReachConsumeExtreme(ScalerResourceConfig, ScalerResourceRuntime, local_21_4))
                        {
                        }
                        else
                        {
                            FScalerResourceUtils::ProcessConsumeScalerResource(local_21_4, Entity, ScalerResourceConfig, ScalerResourceRuntime, local_31);
                            break;
                        }
                        ++local_21_4;
                    }
                }
            }
        }
    }
    if (!(ScalerResourceConfig.ScalerResourceConfigData.Num() > 0 && (ScalerResourceRuntime.GetValues().Num() > 0) && ScalerResourceConfig.ScalerResourceConfigData[0].bCanRecover))
    {
        local_38 = false;
    }
    else
    {
        int local_42 = ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() & 1;
        local_38 = (local_42 != 0);
    }
    if (local_38)
    {
        Remove local_48;
        local_48.opCall();
        Remove local_52;
        local_52.opCall();
    }
    local_38 = ScalerResourceConfig.ScalerResourceConfigData.Num() > 1 && (ScalerResourceRuntime.GetValues().Num() > 1);
    if (!(local_38 && ScalerResourceConfig.ScalerResourceConfigData[1].bCanRecover))
    {
        local_38 = false;
    }
    else
    {
        int local_43 = ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() & 2;
        local_38 = (local_43 != 0);
    }
    if (local_38)
    {
        Remove local_56;
        local_56.opCall();
        Remove local_60;
        local_60.opCall();
    }
    if (!(ScalerResourceConfig.ScalerResourceConfigData.Num() > 2 && (ScalerResourceRuntime.GetValues().Num() > 2) && ScalerResourceConfig.ScalerResourceConfigData[2].bCanRecover))
    {
        local_38 = false;
    }
    else
    {
        int local_42_2 = ScalerResourceRuntime.GetCurrentFixedTickChangedBitMask() & 4;
        local_38 = (local_42_2 != 0);
    }
    if (local_38)
    {
        Remove local_64;
        local_64.opCall();
        Remove local_68;
        local_68.opCall();
    }
    return local_4;
}
UFUNCTION()
int GetScalerResourceIndexByName(const FC_ScalerResourceConfig &inout ScalerResourceConfig, const FC_ScalerResourceRuntime &inout ScalerResourceRuntime, const FName &inout Name)
{
    int local_1 = 0;
    for (; local_1 < ScalerResourceConfig.ScalerResourceConfigData.Num(); ++local_1)
    {
        if ((FName(ScalerResourceConfig.ScalerResourceConfigData[local_1].Name) == Name))
        {
            if (ScalerResourceRuntime.GetValues().Num() > local_1)
            {
                return local_1;
            }
        }
    }
    return -1;
}
UFUNCTION()
float32 GetScalerResourceValuePercentageIndexByName(const FC_ScalerResourceConfig &inout ScalerResourceConfig, const FC_ScalerResourceRuntime &inout ScalerResourceRuntime, const FName &inout Name)
{
    int local_2 = FScalerResourceUtils::GetScalerResourceIndexByName(ScalerResourceConfig, ScalerResourceRuntime, Name);
    if (local_2 != -1)
    {
        return (ScalerResourceRuntime.GetValues()[local_2] - ScalerResourceConfig.ScalerResourceConfigData[local_2].ValueMin) / (ScalerResourceConfig.ScalerResourceConfigData[local_2].ValueMax - ScalerResourceConfig.ScalerResourceConfigData[local_2].ValueMin);
    }
    return 0.0f;
}
}
