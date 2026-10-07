

struct FPortalStateConfig
{
    UPROPERTY()
    FPortalStateData Unlocked;
    UPROPERTY()
    FPortalStateData Locked;
    UPROPERTY()
    FPortalStateData Default;

    FPortalStateConfig()
    {
        return;
    }
    const FPortalStateData GetDataRaw(const EPortalState Value) const
    {
        const FPortalStateData __r;
        int local_1 = int(Value);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
            }
            else
            {
            }
        }
        return __r;
    }
    FPortalStateData ModifyDataRaw(const EPortalState Value)
    {
        FPortalStateData __r;
        int local_1 = int(Value);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
            }
            else
            {
            }
        }
        return __r;
    }
    const FPortalStateData GetDataRawByName(const FName &inout EnumName) const
    {
        const FPortalStateData __r;
        if ((EnumName == "Unlocked"))
        {
        }
        else
        {
            if ((EnumName == "Locked"))
            {
            }
            else
            {
            }
        }
        return __r;
    }
    const FPortalStateData& GetData(const EPortalState Value) const
    {
        const FPortalStateData& local_2 = this.GetDataRaw(EPortalState(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FPortalStateData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    void CopyFallbackData(const EPortalState Src, const EPortalState Dst)
    {
        FPortalStateData& local_2 = this.ModifyDataRaw(EPortalState(Dst));
        int local_3 = local_2.bFallBack;
        EPortalState local_5 = local_2.FallBack;
        FPortalStateData& local_2_2 = this.GetDataRaw(EPortalState(Src));
        local_2_2.bFallBack = (local_3 != 0);
        local_2_2.FallBack = EPortalState(local_5);
        return;
    }
    void OnDataTableChangedInternal(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"EPortalState");
        int local_7 = 0;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            const FPortalStateData& local_22 = this.GetDataRaw(EPortalState(local_19));
            if (local_22.bFallBack)
            {
                EPortalState local_23;
                local_23 = local_22.FallBack;
                EPortalState local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(EPortalState(local_14), EPortalState(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

