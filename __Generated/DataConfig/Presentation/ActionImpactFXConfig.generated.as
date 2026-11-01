struct FActionImpactConfigSFX : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FActionImpactSFXData Default;
    UPROPERTY()
    FActionImpactSFXData Flesh;
    UPROPERTY()
    FActionImpactSFXData Grass;
    UPROPERTY()
    FActionImpactSFXData LandGrass;
    UPROPERTY()
    FActionImpactSFXData LandSoil;
    UPROPERTY()
    FActionImpactSFXData LandStone;
    UPROPERTY()
    FActionImpactSFXData Metal;
    UPROPERTY()
    FActionImpactSFXData Stone;
    UPROPERTY()
    FActionImpactSFXData Water;
    UPROPERTY()
    FActionImpactSFXData Wood;

    FActionImpactConfigSFX()
    {
        return;
    }
    const FActionImpactSFXData& GetDataRaw(const ELandedMaterialType Value) const
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
    FActionImpactSFXData& ModifyDataRaw(const ELandedMaterialType Value)
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
    const FActionImpactSFXData GetDataRawByName(const FName &inout EnumName) const
    {
        const FActionImpactSFXData __r;
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
    const FActionImpactSFXData& GetData(const ELandedMaterialType Value) const
    {
        const FActionImpactSFXData& local_2 = this.GetDataRaw(ELandedMaterialType(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FActionImpactSFXData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    const FActionSFXData& GetData(const ELandedMaterialType FirstType, const EPrefabSize SecondType, const EActionImpactType ThirdType) const
    {
        const FActionImpactSFXData& local_2 = this.GetDataRaw(ELandedMaterialType(FirstType));
        const FAICharacterSizeSFXData& local_4 = this.GetDataRawBySecondType(local_2, EPrefabSize(SecondType));
        const FActionSFXData& local_6 = this.GetDataRawByThirdType(local_4, EActionImpactType(ThirdType));
        return local_6;
    }
    const FActionSFXData& GetData(const FName &inout FirstType, const EPrefabSize SecondType, const EActionImpactType ThirdType) const
    {
        const FActionImpactSFXData& local_2 = this.GetDataRawByName(FirstType);
        const FAICharacterSizeSFXData& local_4 = this.GetDataRawBySecondType(local_2, EPrefabSize(SecondType));
        const FActionSFXData& local_6 = this.GetDataRawByThirdType(local_4, EActionImpactType(ThirdType));
        return local_6;
    }
    const FAICharacterSizeSFXData& GetDataRawBySecondType(const FActionImpactSFXData &inout Data, const EPrefabSize Value) const
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
    const FActionSFXData& GetDataRawByThirdType(const FAICharacterSizeSFXData &inout Data, const EActionImpactType Value) const
    {
        switch (int8(Value))
        {
        case 1:
            return Data.Jump;
        case 2:
            return Data.Land;
        default:
            return Data.Default;
        }
    }
    void CopyFallbackData(const ELandedMaterialType Src, const ELandedMaterialType Dst)
    {
        FActionImpactSFXData& local_2 = this.ModifyDataRaw(ELandedMaterialType(Dst));
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
            const FActionImpactSFXData& local_22 = this.GetDataRaw(ELandedMaterialType(local_19));
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

struct FActionImpactConfigVFX : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FActionImpactVFXData Default;
    UPROPERTY()
    FActionImpactVFXData Flesh;
    UPROPERTY()
    FActionImpactVFXData Grass;
    UPROPERTY()
    FActionImpactVFXData LandGrass;
    UPROPERTY()
    FActionImpactVFXData LandSoil;
    UPROPERTY()
    FActionImpactVFXData LandStone;
    UPROPERTY()
    FActionImpactVFXData Metal;
    UPROPERTY()
    FActionImpactVFXData Stone;
    UPROPERTY()
    FActionImpactVFXData Water;
    UPROPERTY()
    FActionImpactVFXData Wood;

    FActionImpactConfigVFX()
    {
        return;
    }
    const FActionImpactVFXData& GetDataRaw(const ELandedMaterialType Value) const
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
    FActionImpactVFXData& ModifyDataRaw(const ELandedMaterialType Value)
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
    const FActionImpactVFXData GetDataRawByName(const FName &inout EnumName) const
    {
        const FActionImpactVFXData __r;
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
    const FActionImpactVFXData& GetData(const ELandedMaterialType Value) const
    {
        const FActionImpactVFXData& local_2 = this.GetDataRaw(ELandedMaterialType(Value));
        bool local_3 = local_2.bFallBack;
        if (local_3)
        {
            const FActionImpactVFXData& local_6 = this.GetDataRaw(local_2.FallBack);
        }
        else
        {
        }
        return local_3;
    }
    const FActionVFXData& GetData(const ELandedMaterialType FirstType, const EPrefabSize SecondType, const EActionImpactType ThirdType) const
    {
        const FActionImpactVFXData& local_2 = this.GetDataRaw(ELandedMaterialType(FirstType));
        const FAICharacterSizeVFXData& local_4 = this.GetDataRawBySecondType(local_2, EPrefabSize(SecondType));
        const FActionVFXData& local_6 = this.GetDataRawByThirdType(local_4, EActionImpactType(ThirdType));
        return local_6;
    }
    const FActionVFXData& GetData(const FName &inout FirstType, const EPrefabSize SecondType, const EActionImpactType ThirdType) const
    {
        const FActionImpactVFXData& local_2 = this.GetDataRawByName(FirstType);
        const FAICharacterSizeVFXData& local_4 = this.GetDataRawBySecondType(local_2, EPrefabSize(SecondType));
        const FActionVFXData& local_6 = this.GetDataRawByThirdType(local_4, EActionImpactType(ThirdType));
        return local_6;
    }
    const FAICharacterSizeVFXData& GetDataRawBySecondType(const FActionImpactVFXData &inout Data, const EPrefabSize Value) const
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
    const FActionVFXData& GetDataRawByThirdType(const FAICharacterSizeVFXData &inout Data, const EActionImpactType Value) const
    {
        switch (int8(Value))
        {
        case 1:
            return Data.Jump;
        case 2:
            return Data.Land;
        default:
            return Data.Default;
        }
    }
    void CopyFallbackData(const ELandedMaterialType Src, const ELandedMaterialType Dst)
    {
        FActionImpactVFXData& local_2 = this.ModifyDataRaw(ELandedMaterialType(Dst));
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
            const FActionImpactVFXData& local_22 = this.GetDataRaw(ELandedMaterialType(local_19));
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

