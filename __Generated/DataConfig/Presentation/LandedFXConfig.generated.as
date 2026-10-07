

struct FLandedImpactConfigSFX : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FLandedImpactSFXData Default;
    UPROPERTY()
    FLandedImpactSFXData Flesh;
    UPROPERTY()
    FLandedImpactSFXData Grass;
    UPROPERTY()
    FLandedImpactSFXData LandGrass;
    UPROPERTY()
    FLandedImpactSFXData LandSoil;
    UPROPERTY()
    FLandedImpactSFXData LandStone;
    UPROPERTY()
    FLandedImpactSFXData Metal;
    UPROPERTY()
    FLandedImpactSFXData Stone;
    UPROPERTY()
    FLandedImpactSFXData Water;
    UPROPERTY()
    FLandedImpactSFXData Wood;

    FLandedImpactConfigSFX()
    {
        return;
    }
    const FLandedImpactSFXData GetDataRaw(const ELandedMaterialType Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FLandedImpactSFXData __r; return __r;
    }
    FLandedImpactSFXData ModifyDataRaw(const ELandedMaterialType Value)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FLandedImpactSFXData __r; return __r;
    }
    const FLandedImpactSFXData GetDataRawByName(const FName &inout EnumName) const
    {
        const FLandedImpactSFXData __r;
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
    const FLandedImpactSFXData& GetData(const ELandedMaterialType Value) const
    {
        const FLandedImpactSFXData& local_2 = this.GetDataRaw(ELandedMaterialType(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FLandedImpactSFXData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    const FLISStrengthData& GetData(const ELandedMaterialType FirstType, const EPrefabSize SecondType, const ELandedStrength ThirdType) const
    {
        const FLISStrengthData& local_6 = this.GetDataRawByThirdType(this.GetDataRawBySecondType(this.GetDataRaw(ELandedMaterialType(FirstType)), EPrefabSize(SecondType)), ELandedStrength(ThirdType));
        return local_6;
    }
    const FLISStrengthData& GetData(const FName &inout FirstType, const EPrefabSize SecondType, const ELandedStrength ThirdType) const
    {
        const FLISStrengthData& local_6 = this.GetDataRawByThirdType(this.GetDataRawBySecondType(this.GetDataRawByName(FirstType), EPrefabSize(SecondType)), ELandedStrength(ThirdType));
        return local_6;
    }
    const FLISCharacterSizeData GetDataRawBySecondType(const FLandedImpactSFXData &inout Data, const EPrefabSize Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FLISCharacterSizeData __r; return __r;
    }
    const FLISStrengthData GetDataRawByThirdType(const FLISCharacterSizeData &inout Data, const ELandedStrength Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FLISStrengthData __r; return __r;
    }
    void CopyFallbackData(const ELandedMaterialType Src, const ELandedMaterialType Dst)
    {
        FLandedImpactSFXData& local_2 = this.ModifyDataRaw(ELandedMaterialType(Dst));
        int local_3 = local_2.bFallBack;
        ELandedMaterialType local_5 = local_2.FallBack;
        local_2.bFallBack = (local_3 != 0);
        local_2.FallBack = ELandedMaterialType(local_5);
        return;
    }
    void OnDataTableChanged(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"ELandedMaterialType");
        int local_7 = 1;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            const FLandedImpactSFXData& local_22 = this.GetDataRaw(ELandedMaterialType(local_19));
            if (local_22.bFallBack)
            {
                ELandedMaterialType local_23;
                local_23 = local_22.FallBack;
                ELandedMaterialType local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(ELandedMaterialType(local_14), ELandedMaterialType(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

struct FLandedImpactConfigVFX : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FLandedImpactVFXData Default;
    UPROPERTY()
    FLandedImpactVFXData Flesh;
    UPROPERTY()
    FLandedImpactVFXData Grass;
    UPROPERTY()
    FLandedImpactVFXData LandGrass;
    UPROPERTY()
    FLandedImpactVFXData LandSoil;
    UPROPERTY()
    FLandedImpactVFXData LandStone;
    UPROPERTY()
    FLandedImpactVFXData Metal;
    UPROPERTY()
    FLandedImpactVFXData Stone;
    UPROPERTY()
    FLandedImpactVFXData Water;
    UPROPERTY()
    FLandedImpactVFXData Wood;

    FLandedImpactConfigVFX()
    {
        return;
    }
    const FLandedImpactVFXData GetDataRaw(const ELandedMaterialType Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FLandedImpactVFXData __r; return __r;
    }
    FLandedImpactVFXData ModifyDataRaw(const ELandedMaterialType Value)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FLandedImpactVFXData __r; return __r;
    }
    const FLandedImpactVFXData GetDataRawByName(const FName &inout EnumName) const
    {
        const FLandedImpactVFXData __r;
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
    const FLandedImpactVFXData& GetData(const ELandedMaterialType Value) const
    {
        const FLandedImpactVFXData& local_2 = this.GetDataRaw(ELandedMaterialType(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FLandedImpactVFXData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    const FLIVStrengthData& GetData(const ELandedMaterialType FirstType, const EPrefabSize SecondType, const ELandedStrength ThirdType) const
    {
        const FLIVStrengthData& local_6 = this.GetDataRawByThirdType(this.GetDataRawBySecondType(this.GetDataRaw(ELandedMaterialType(FirstType)), EPrefabSize(SecondType)), ELandedStrength(ThirdType));
        return local_6;
    }
    const FLIVStrengthData& GetData(const FName &inout FirstType, const EPrefabSize SecondType, const ELandedStrength ThirdType) const
    {
        const FLIVStrengthData& local_6 = this.GetDataRawByThirdType(this.GetDataRawBySecondType(this.GetDataRawByName(FirstType), EPrefabSize(SecondType)), ELandedStrength(ThirdType));
        return local_6;
    }
    const FLIVCharacterSizeData GetDataRawBySecondType(const FLandedImpactVFXData &inout Data, const EPrefabSize Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FLIVCharacterSizeData __r; return __r;
    }
    const FLIVStrengthData GetDataRawByThirdType(const FLIVCharacterSizeData &inout Data, const ELandedStrength Value) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FLIVStrengthData __r; return __r;
    }
    void CopyFallbackData(const ELandedMaterialType Src, const ELandedMaterialType Dst)
    {
        FLandedImpactVFXData& local_2 = this.ModifyDataRaw(ELandedMaterialType(Dst));
        int local_3 = local_2.bFallBack;
        ELandedMaterialType local_5 = local_2.FallBack;
        local_2.bFallBack = (local_3 != 0);
        local_2.FallBack = ELandedMaterialType(local_5);
        return;
    }
    void OnDataTableChanged(const UDataTable DataTable, const FName &inout InRowName)
    {
        UEnum local_2 = UEnum::GetEnumType(n"ELandedMaterialType");
        int local_7 = 1;
        for (; local_7 < local_2.NumEnums(); ++local_7)
        {
            FName local_13 = local_2.GetNameByIndex(local_7);
            int local_19 = local_2.GetValueByName(local_13, EGetByNameFlags(0));
            const FLandedImpactVFXData& local_22 = this.GetDataRaw(ELandedMaterialType(local_19));
            if (local_22.bFallBack)
            {
                ELandedMaterialType local_23;
                local_23 = local_22.FallBack;
                ELandedMaterialType local_14 = local_22.FallBack;
                FName local_11 = local_2.GetNameByValue(int(local_14));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = local_22.FallBack;
                    this.CopyFallbackData(ELandedMaterialType(local_14), ELandedMaterialType(local_19));
                    continue;
                }
                XError(ELog(21), FString().Append("Item of ").Append(local_13).Append(" Can't fallback to ").Append(local_11).Append(", only fallback to lower index value"));
            }
        }
        FDataTableMisc::InformWholeTableChange(DataTable, NAME_None);
        return;
    }
}

