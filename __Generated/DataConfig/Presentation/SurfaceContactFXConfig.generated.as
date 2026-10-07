

struct FSurfaceVFXCode : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FVFXCodeData Default;
    UPROPERTY()
    FVFXCodeData Flesh;
    UPROPERTY()
    FVFXCodeData Grass;
    UPROPERTY()
    FVFXCodeData LandGrass;
    UPROPERTY()
    FVFXCodeData LandSoil;
    UPROPERTY()
    FVFXCodeData LandStone;
    UPROPERTY()
    FVFXCodeData Metal;
    UPROPERTY()
    FVFXCodeData Stone;
    UPROPERTY()
    FVFXCodeData Water;
    UPROPERTY()
    FVFXCodeData Wood;

    FSurfaceVFXCode()
    {
        return;
    }
    const FVFXCodeData GetDataRaw(const ESurfaceMaterialType Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FVFXCodeData __r; return __r;
    }
    FVFXCodeData ModifyDataRaw(const ESurfaceMaterialType Value)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FVFXCodeData __r; return __r;
    }
    const FVFXCodeData GetDataRawByName(const FName &inout EnumName) const
    {
        const FVFXCodeData __r;
        if ((EnumName == "Default"))
        {
        }
        else
        {
            if ((EnumName == "Flesh"))
            {
            }
            else
            {
                if ((EnumName == "Grass"))
                {
                }
                else
                {
                    if ((EnumName == "LandGrass"))
                    {
                    }
                    else
                    {
                        if ((EnumName == "LandSoil"))
                        {
                        }
                        else
                        {
                            if ((EnumName == "LandStone"))
                            {
                            }
                            else
                            {
                                if ((EnumName == "Metal"))
                                {
                                }
                                else
                                {
                                    if ((EnumName == "Stone"))
                                    {
                                    }
                                    else
                                    {
                                        if ((EnumName == "Water"))
                                        {
                                        }
                                        else
                                        {
                                            if ((EnumName == "Wood"))
                                            {
                                            }
                                            else
                                            {
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return __r;
    }
    const FVFXCodeData& GetData(const ESurfaceMaterialType Value) const
    {
        const FVFXCodeData& local_2 = this.GetDataRaw(ESurfaceMaterialType(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FVFXCodeData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    void CopyFallbackData(const ESurfaceMaterialType Src, const ESurfaceMaterialType Dst)
    {
        FVFXCodeData& local_2 = this.ModifyDataRaw(ESurfaceMaterialType(Dst));
        int local_3 = local_2.bFallBack;
        ESurfaceMaterialType local_5 = local_2.FallBack;
        local_2.bFallBack = (local_3 != 0);
        local_2.FallBack = ESurfaceMaterialType(local_5);
        return;
    }
    void OnDataTableChangedInternal(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"ESurfaceMaterialType");
        int local_7 = 0;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            const FVFXCodeData& local_22 = this.GetDataRaw(ESurfaceMaterialType(local_19));
            if (local_22.bFallBack)
            {
                ESurfaceMaterialType local_23;
                local_23 = local_22.FallBack;
                ESurfaceMaterialType local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(ESurfaceMaterialType(local_14), ESurfaceMaterialType(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

struct FSurfaceContactConfigVFX : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FCharacterSizeVFXData Default;
    UPROPERTY()
    FCharacterSizeVFXData Flesh;
    UPROPERTY()
    FCharacterSizeVFXData Grass;
    UPROPERTY()
    FCharacterSizeVFXData LandGrass;
    UPROPERTY()
    FCharacterSizeVFXData LandSoil;
    UPROPERTY()
    FCharacterSizeVFXData LandStone;
    UPROPERTY()
    FCharacterSizeVFXData Metal;
    UPROPERTY()
    FCharacterSizeVFXData Stone;
    UPROPERTY()
    FCharacterSizeVFXData Water;
    UPROPERTY()
    FCharacterSizeVFXData Wood;

    FSurfaceContactConfigVFX()
    {
        return;
    }
    const FCharacterSizeVFXData GetDataRaw(const ESurfaceMaterialType Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FCharacterSizeVFXData __r; return __r;
    }
    FCharacterSizeVFXData ModifyDataRaw(const ESurfaceMaterialType Value)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FCharacterSizeVFXData __r; return __r;
    }
    const FCharacterSizeVFXData GetDataRawByName(const FName &inout EnumName) const
    {
        const FCharacterSizeVFXData __r;
        if ((EnumName == "Default"))
        {
        }
        else
        {
            if ((EnumName == "Flesh"))
            {
            }
            else
            {
                if ((EnumName == "Grass"))
                {
                }
                else
                {
                    if ((EnumName == "LandGrass"))
                    {
                    }
                    else
                    {
                        if ((EnumName == "LandSoil"))
                        {
                        }
                        else
                        {
                            if ((EnumName == "LandStone"))
                            {
                            }
                            else
                            {
                                if ((EnumName == "Metal"))
                                {
                                }
                                else
                                {
                                    if ((EnumName == "Stone"))
                                    {
                                    }
                                    else
                                    {
                                        if ((EnumName == "Water"))
                                        {
                                        }
                                        else
                                        {
                                            if ((EnumName == "Wood"))
                                            {
                                            }
                                            else
                                            {
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return __r;
    }
    const FCharacterSizeVFXData& GetData(const ESurfaceMaterialType Value) const
    {
        const FCharacterSizeVFXData& local_2 = this.GetDataRaw(ESurfaceMaterialType(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FCharacterSizeVFXData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    const FImpactFXData& GetData(const ESurfaceMaterialType FirstType, const ECharacterBodySize SecondType) const
    {
        const FImpactFXData& local_4 = this.GetDataRawBySecondType(this.GetDataRaw(ESurfaceMaterialType(FirstType)), ECharacterBodySize(SecondType));
        return local_4;
    }
    const FImpactFXData& GetData(const FName &inout FirstType, const ECharacterBodySize SecondType) const
    {
        const FImpactFXData& local_4 = this.GetDataRawBySecondType(this.GetDataRawByName(FirstType), ECharacterBodySize(SecondType));
        return local_4;
    }
    const FImpactFXData GetDataRawBySecondType(const FCharacterSizeVFXData &inout Data, const ECharacterBodySize Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FImpactFXData __r; return __r;
    }
    void CopyFallbackData(const ESurfaceMaterialType Src, const ESurfaceMaterialType Dst)
    {
        FCharacterSizeVFXData& local_2 = this.ModifyDataRaw(ESurfaceMaterialType(Dst));
        int local_3 = local_2.bFallBack;
        ESurfaceMaterialType local_5 = local_2.FallBack;
        local_2.bFallBack = (local_3 != 0);
        local_2.FallBack = ESurfaceMaterialType(local_5);
        return;
    }
    void OnDataTableChanged(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"ESurfaceMaterialType");
        int local_7 = 1;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            FCharacterSizeVFXData& local_22 = this.ModifyDataRaw(ESurfaceMaterialType(local_19));
            local_22.OnDataTableRowChanged();
            if (local_22.bFallBack)
            {
                ESurfaceMaterialType local_23;
                local_23 = local_22.FallBack;
                ESurfaceMaterialType local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(ESurfaceMaterialType(local_14), ESurfaceMaterialType(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

struct FEnvSurfaceHitConfigVFX : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FArealStrikeEnvSurfaceVFXData Default;
    UPROPERTY()
    FArealStrikeEnvSurfaceVFXData Small;
    UPROPERTY()
    FArealStrikeEnvSurfaceVFXData Medium;
    UPROPERTY()
    FArealStrikeEnvSurfaceVFXData Large;
    UPROPERTY()
    FArealStrikeEnvSurfaceVFXData ExtraLarge;

    FEnvSurfaceHitConfigVFX()
    {
        return;
    }
    const FArealStrikeEnvSurfaceVFXData GetDataRaw(const ECharacterBodySize Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FArealStrikeEnvSurfaceVFXData __r; return __r;
    }
    FArealStrikeEnvSurfaceVFXData ModifyDataRaw(const ECharacterBodySize Value)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FArealStrikeEnvSurfaceVFXData __r; return __r;
    }
    const FArealStrikeEnvSurfaceVFXData GetDataRawByName(const FName &inout EnumName) const
    {
        const FArealStrikeEnvSurfaceVFXData __r;
        if ((EnumName == "Default"))
        {
        }
        else
        {
            if ((EnumName == "Small"))
            {
            }
            else
            {
                if ((EnumName == "Medium"))
                {
                }
                else
                {
                    if ((EnumName == "Large"))
                    {
                    }
                    else
                    {
                        if ((EnumName == "ExtraLarge"))
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
    const FArealStrikeEnvSurfaceVFXData& GetData(const ECharacterBodySize Value) const
    {
        const FArealStrikeEnvSurfaceVFXData& local_2 = this.GetDataRaw(ECharacterBodySize(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FArealStrikeEnvSurfaceVFXData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    const FImpactFXData& GetData(const ECharacterBodySize FirstType, const EArealStrikeEnvSurfaceFXStyle_Sparks SecondType) const
    {
        const FImpactFXData& local_4 = this.GetDataRawBySecondType(this.GetDataRaw(ECharacterBodySize(FirstType)), EArealStrikeEnvSurfaceFXStyle_Sparks(SecondType));
        return local_4;
    }
    const FImpactFXData& GetData(const FName &inout FirstType, const EArealStrikeEnvSurfaceFXStyle_Sparks SecondType) const
    {
        const FImpactFXData& local_4 = this.GetDataRawBySecondType(this.GetDataRawByName(FirstType), EArealStrikeEnvSurfaceFXStyle_Sparks(SecondType));
        return local_4;
    }
    const FImpactFXData GetDataRawBySecondType(const FArealStrikeEnvSurfaceVFXData &inout Data, const EArealStrikeEnvSurfaceFXStyle_Sparks Value) const
    {
        const FImpactFXData __r;
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
    void CopyFallbackData(const ECharacterBodySize Src, const ECharacterBodySize Dst)
    {
        FArealStrikeEnvSurfaceVFXData& local_2 = this.ModifyDataRaw(ECharacterBodySize(Dst));
        int local_3 = local_2.bFallBack;
        ECharacterBodySize local_5 = local_2.FallBack;
        local_2.bFallBack = (local_3 != 0);
        local_2.FallBack = ECharacterBodySize(local_5);
        return;
    }
    void OnDataTableChanged(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"ECharacterBodySize");
        int local_7 = 1;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            FArealStrikeEnvSurfaceVFXData& local_22 = this.ModifyDataRaw(ECharacterBodySize(local_19));
            local_22.OnDataTableRowChanged();
            if (local_22.bFallBack)
            {
                ECharacterBodySize local_23;
                local_23 = local_22.FallBack;
                ECharacterBodySize local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(ECharacterBodySize(local_14), ECharacterBodySize(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

