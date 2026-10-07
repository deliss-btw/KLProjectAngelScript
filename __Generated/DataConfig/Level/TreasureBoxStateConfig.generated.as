

struct FTreasureBoxStateConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FTreasureBoxStateData Default;
    UPROPERTY()
    FTreasureBoxStateData CoolDown;
    UPROPERTY()
    FTreasureBoxStateData Ready;
    UPROPERTY()
    FTreasureBoxStateData FirstEncounter;
    UPROPERTY()
    FTreasureBoxStateData Opening;

    FTreasureBoxStateConfig()
    {
        return;
    }
    const FTreasureBoxStateData GetDataRaw(const ETreasureBoxState Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FTreasureBoxStateData __r; return __r;
    }
    FTreasureBoxStateData ModifyDataRaw(const ETreasureBoxState Value)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FTreasureBoxStateData __r; return __r;
    }
    const FTreasureBoxStateData GetDataRawByName(const FName &inout EnumName) const
    {
        const FTreasureBoxStateData __r;
        if ((EnumName == "Default"))
        {
        }
        else
        {
            if ((EnumName == "CoolDown"))
            {
            }
            else
            {
                if ((EnumName == "Ready"))
                {
                }
                else
                {
                    if ((EnumName == "FirstEncounter"))
                    {
                    }
                    else
                    {
                        if ((EnumName == "Opening"))
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
    const FTreasureBoxStateData& GetData(const ETreasureBoxState Value) const
    {
        const FTreasureBoxStateData& local_2 = this.GetDataRaw(ETreasureBoxState(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FTreasureBoxStateData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    void CopyFallbackData(const ETreasureBoxState Src, const ETreasureBoxState Dst)
    {
        FTreasureBoxStateData& local_2 = this.ModifyDataRaw(ETreasureBoxState(Dst));
        int local_3 = local_2.bFallBack;
        ETreasureBoxState local_5 = local_2.FallBack;
        local_2.bFallBack = (local_3 != 0);
        local_2.FallBack = ETreasureBoxState(local_5);
        return;
    }
    void OnDataTableChangedInternal(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"ETreasureBoxState");
        int local_7 = 0;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            const FTreasureBoxStateData& local_22 = this.GetDataRaw(ETreasureBoxState(local_19));
            if (local_22.bFallBack)
            {
                ETreasureBoxState local_23;
                local_23 = local_22.FallBack;
                ETreasureBoxState local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(ETreasureBoxState(local_14), ETreasureBoxState(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

