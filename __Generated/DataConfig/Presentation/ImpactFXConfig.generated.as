

struct FImpactConfigSFX : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FImpactSFXData Default;
    UPROPERTY()
    FImpactSFXData Cut;
    UPROPERTY()
    FImpactSFXData Stab;
    UPROPERTY()
    FImpactSFXData Smash;
    UPROPERTY()
    FImpactSFXData BossBattle;

    FImpactConfigSFX()
    {
        return;
    }
    const FImpactSFXData GetDataRaw(const EImpactType Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FImpactSFXData __r; return __r;
    }
    FImpactSFXData ModifyDataRaw(const EImpactType Value)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FImpactSFXData __r; return __r;
    }
    const FImpactSFXData GetDataRawByName(const FName &inout EnumName) const
    {
        const FImpactSFXData __r;
        if ((EnumName == "Default"))
        {
        }
        else
        {
            if ((EnumName == "Cut"))
            {
            }
            else
            {
                if ((EnumName == "Stab"))
                {
                }
                else
                {
                    if ((EnumName == "Smash"))
                    {
                    }
                    else
                    {
                        if ((EnumName == "BossBattle"))
                        {
                        }
                        else
                        {
                        }
                    }
                }
            }
        }
        return __r;
    }
    const FImpactSFXData& GetData(const EImpactType Value) const
    {
        const FImpactSFXData& local_2 = this.GetDataRaw(EImpactType(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FImpactSFXData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    void CopyFallbackData(const EImpactType Src, const EImpactType Dst)
    {
        FImpactSFXData& local_2 = this.ModifyDataRaw(EImpactType(Dst));
        int local_3 = local_2.bFallBack;
        EImpactType local_5 = local_2.FallBack;
        local_2.bFallBack = (local_3 != 0);
        local_2.FallBack = EImpactType(local_5);
        return;
    }
    void OnDataTableChangedInternal(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"EImpactType");
        int local_7 = 0;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            const FImpactSFXData& local_22 = this.GetDataRaw(EImpactType(local_19));
            if (local_22.bFallBack)
            {
                EImpactType local_23;
                local_23 = local_22.FallBack;
                EImpactType local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(EImpactType(local_14), EImpactType(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

struct FImpactConfigVFX : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FImpactVFXDataWithStrength Default;
    UPROPERTY()
    FImpactVFXDataWithStrength Cut;
    UPROPERTY()
    FImpactVFXDataWithStrength Stab;
    UPROPERTY()
    FImpactVFXDataWithStrength Smash;
    UPROPERTY()
    FImpactVFXDataWithStrength BossBattle;

    FImpactConfigVFX()
    {
        return;
    }
    const FImpactVFXDataWithStrength GetDataRaw(const EImpactType Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FImpactVFXDataWithStrength __r; return __r;
    }
    FImpactVFXDataWithStrength ModifyDataRaw(const EImpactType Value)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FImpactVFXDataWithStrength __r; return __r;
    }
    const FImpactVFXDataWithStrength GetDataRawByName(const FName &inout EnumName) const
    {
        const FImpactVFXDataWithStrength __r;
        if ((EnumName == "Default"))
        {
        }
        else
        {
            if ((EnumName == "Cut"))
            {
            }
            else
            {
                if ((EnumName == "Stab"))
                {
                }
                else
                {
                    if ((EnumName == "Smash"))
                    {
                    }
                    else
                    {
                        if ((EnumName == "BossBattle"))
                        {
                        }
                        else
                        {
                        }
                    }
                }
            }
        }
        return __r;
    }
    const FImpactVFXDataWithStrength& GetData(const EImpactType Value) const
    {
        const FImpactVFXDataWithStrength& local_2 = this.GetDataRaw(EImpactType(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FImpactVFXDataWithStrength& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    void CopyFallbackData(const EImpactType Src, const EImpactType Dst)
    {
        FImpactVFXDataWithStrength& local_2 = this.ModifyDataRaw(EImpactType(Dst));
        int local_3 = local_2.bFallBack;
        EImpactType local_5 = local_2.FallBack;
        local_2.bFallBack = (local_3 != 0);
        local_2.FallBack = EImpactType(local_5);
        return;
    }
    void OnDataTableChangedInternal(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"EImpactType");
        int local_7 = 0;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            const FImpactVFXDataWithStrength& local_22 = this.GetDataRaw(EImpactType(local_19));
            if (local_22.bFallBack)
            {
                EImpactType local_23;
                local_23 = local_22.FallBack;
                EImpactType local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(EImpactType(local_14), EImpactType(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

