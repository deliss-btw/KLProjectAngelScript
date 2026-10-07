

struct FAccountExclusiveTeleporterStateConfig
{
    UPROPERTY()
    FAccountExclusiveTeleporterStateData Locked;
    UPROPERTY()
    FAccountExclusiveTeleporterStateData Unlocked;
    UPROPERTY()
    FAccountExclusiveTeleporterStateData Active;
    UPROPERTY()
    FAccountExclusiveTeleporterStateData Activating;
    UPROPERTY()
    FAccountExclusiveTeleporterStateData Default;

    FAccountExclusiveTeleporterStateConfig()
    {
        return;
    }
    const FAccountExclusiveTeleporterStateData GetDataRaw(const ETeleporterState Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FAccountExclusiveTeleporterStateData __r; return __r;
    }
    FAccountExclusiveTeleporterStateData ModifyDataRaw(const ETeleporterState Value)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FAccountExclusiveTeleporterStateData __r; return __r;
    }
    const FAccountExclusiveTeleporterStateData GetDataRawByName(const FName &inout EnumName) const
    {
        const FAccountExclusiveTeleporterStateData __r;
        if ((EnumName == "Locked"))
        {
        }
        else
        {
            if ((EnumName == "Unlocked"))
            {
            }
            else
            {
                if ((EnumName == "Active"))
                {
                }
                else
                {
                    if ((EnumName == "Activating"))
                    {
                    }
                    else
                    {
                    }
                }
            }
        }
        return __r;
    }
    const FAccountExclusiveTeleporterStateData& GetData(const ETeleporterState Value) const
    {
        const FAccountExclusiveTeleporterStateData& local_2 = this.GetDataRaw(ETeleporterState(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FAccountExclusiveTeleporterStateData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    void CopyFallbackData(const ETeleporterState Src, const ETeleporterState Dst)
    {
        FAccountExclusiveTeleporterStateData& local_2 = this.ModifyDataRaw(ETeleporterState(Dst));
        int local_3 = local_2.bFallBack;
        ETeleporterState local_5 = local_2.FallBack;
        FAccountExclusiveTeleporterStateData& local_2_2 = this.GetDataRaw(ETeleporterState(Src));
        local_2_2.bFallBack = (local_3 != 0);
        local_2_2.FallBack = ETeleporterState(local_5);
        return;
    }
    void OnDataTableChangedInternal(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"ETeleporterState");
        int local_7 = 0;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            const FAccountExclusiveTeleporterStateData& local_22 = this.GetDataRaw(ETeleporterState(local_19));
            if (local_22.bFallBack)
            {
                ETeleporterState local_23;
                local_23 = local_22.FallBack;
                ETeleporterState local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(ETeleporterState(local_14), ETeleporterState(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

