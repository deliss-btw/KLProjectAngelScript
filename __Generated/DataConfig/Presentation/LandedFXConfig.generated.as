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
    const FLandedImpactSFXData& GetDataRaw(const ELandedMaterialType Value) const
    {
        switch (int8(Value))
        {
        case 1:
            return this.Flesh;
        case 2:
            return this.Grass;
        case 3:
            return this.LandGrass;
        case 4:
            return this.LandSoil;
        case 5:
            return this.LandStone;
        case 6:
            return this.Metal;
        case 7:
            return this.Stone;
        case 8:
            return this.Water;
        case 9:
            return this.Wood;
        default:
            return this.Default;
        }
    }
    FLandedImpactSFXData& ModifyDataRaw(const ELandedMaterialType Value)
    {
        switch (int8(Value))
        {
        case 1:
            return this.Flesh;
        case 2:
            return this.Grass;
        case 3:
            return this.LandGrass;
        case 4:
            return this.LandSoil;
        case 5:
            return this.LandStone;
        case 6:
            return this.Metal;
        case 7:
            return this.Stone;
        case 8:
            return this.Water;
        case 9:
            return this.Wood;
        default:
            return this.Default;
        }
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
        const FLandedImpactSFXData& local_2 = this.GetDataRaw(ELandedMaterialType(FirstType));
        const FLISCharacterSizeData& local_4 = this.GetDataRawBySecondType(local_2, EPrefabSize(SecondType));
        const FLISStrengthData& local_6 = this.GetDataRawByThirdType(local_4, ELandedStrength(ThirdType));
        return local_6;
    }
    const FLISStrengthData& GetData(const FName &inout FirstType, const EPrefabSize SecondType, const ELandedStrength ThirdType) const
    {
        const FLandedImpactSFXData& local_2 = this.GetDataRawByName(FirstType);
        const FLISCharacterSizeData& local_4 = this.GetDataRawBySecondType(local_2, EPrefabSize(SecondType));
        const FLISStrengthData& local_6 = this.GetDataRawByThirdType(local_4, ELandedStrength(ThirdType));
        return local_6;
    }
    const FLISCharacterSizeData& GetDataRawBySecondType(const FLandedImpactSFXData &inout Data, const EPrefabSize Value) const
    {
        switch (int8(Value))
        {
        case 1:
            return Data.Small;
        case 2:
            return Data.Medium;
        case 3:
            return Data.Large;
        case 4:
            return Data.ExtraLarge;
        default:
            return Data.Default;
        }
    }
    const FLISStrengthData& GetDataRawByThirdType(const FLISCharacterSizeData &inout Data, const ELandedStrength Value) const
    {
        switch (int8(Value))
        {
        case 1:
            return Data.Light;
        case 2:
            return Data.Moderate;
        case 3:
            return Data.High;
        case 4:
            return Data.Extreme;
        default:
            return Data.Default;
        }
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
                int local_14 = int(local_22.FallBack);
                ELandedMaterialType local_23;
                local_23 = ELandedMaterialType(local_14);
                FName local_11 = local_2.GetNameByValue(int(local_22.FallBack));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = int(local_22.FallBack);
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
    const FLandedImpactVFXData& GetDataRaw(const ELandedMaterialType Value) const
    {
        switch (int8(Value))
        {
        case 1:
            return this.Flesh;
        case 2:
            return this.Grass;
        case 3:
            return this.LandGrass;
        case 4:
            return this.LandSoil;
        case 5:
            return this.LandStone;
        case 6:
            return this.Metal;
        case 7:
            return this.Stone;
        case 8:
            return this.Water;
        case 9:
            return this.Wood;
        default:
            return this.Default;
        }
    }
    FLandedImpactVFXData& ModifyDataRaw(const ELandedMaterialType Value)
    {
        switch (int8(Value))
        {
        case 1:
            return this.Flesh;
        case 2:
            return this.Grass;
        case 3:
            return this.LandGrass;
        case 4:
            return this.LandSoil;
        case 5:
            return this.LandStone;
        case 6:
            return this.Metal;
        case 7:
            return this.Stone;
        case 8:
            return this.Water;
        case 9:
            return this.Wood;
        default:
            return this.Default;
        }
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
        const FLandedImpactVFXData& local_2 = this.GetDataRaw(ELandedMaterialType(FirstType));
        const FLIVCharacterSizeData& local_4 = this.GetDataRawBySecondType(local_2, EPrefabSize(SecondType));
        const FLIVStrengthData& local_6 = this.GetDataRawByThirdType(local_4, ELandedStrength(ThirdType));
        return local_6;
    }
    const FLIVStrengthData& GetData(const FName &inout FirstType, const EPrefabSize SecondType, const ELandedStrength ThirdType) const
    {
        const FLandedImpactVFXData& local_2 = this.GetDataRawByName(FirstType);
        const FLIVCharacterSizeData& local_4 = this.GetDataRawBySecondType(local_2, EPrefabSize(SecondType));
        const FLIVStrengthData& local_6 = this.GetDataRawByThirdType(local_4, ELandedStrength(ThirdType));
        return local_6;
    }
    const FLIVCharacterSizeData& GetDataRawBySecondType(const FLandedImpactVFXData &inout Data, const EPrefabSize Value) const
    {
        switch (int8(Value))
        {
        case 1:
            return Data.Small;
        case 2:
            return Data.Medium;
        case 3:
            return Data.Large;
        case 4:
            return Data.ExtraLarge;
        default:
            return Data.Default;
        }
    }
    const FLIVStrengthData& GetDataRawByThirdType(const FLIVCharacterSizeData &inout Data, const ELandedStrength Value) const
    {
        switch (int8(Value))
        {
        case 1:
            return Data.Light;
        case 2:
            return Data.Moderate;
        case 3:
            return Data.High;
        case 4:
            return Data.Extreme;
        default:
            return Data.Default;
        }
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
                int local_14 = int(local_22.FallBack);
                ELandedMaterialType local_23;
                local_23 = ELandedMaterialType(local_14);
                FName local_11 = local_2.GetNameByValue(int(local_22.FallBack));
                if (local_2.GetIndexByName(local_11, EGetByNameFlags(0)) < local_7)
                {
                    local_14 = int(local_22.FallBack);
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

