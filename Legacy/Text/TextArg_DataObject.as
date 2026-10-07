

struct FTextArgConfig_DataObject : FTextArgConfig
{
    FTextArgConfig _base_FTextArgConfig;
    UPROPERTY()
    FString PropertyPath;

    FTextArgConfig_DataObject()
    {
        return;
    }
}

class UTextArgParser_DataObject : UBlueprintTextArgParser
{
    UTextArgParser_DataObject()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetConfigType_Implementation() const
    {
        return FTextArgConfig_DataObject;
    }
    UFUNCTION()
    bool ParseArgValue_Implementation(const FDataObjectPtr &inout Config, const FTextArgument &inout Arg, FText &inout OutResult) const
    {
        int local_26 = 0;
        int local_32 = 0;
        EItemRarity local_87;
        TDataObjectPtr<FTextArgConfig_DataObject> local_24 = TDataObjectPtr<FTextArgConfig_DataObject>(Config);
        TDataObjectPtr<FItemConfig> local_56 = TDataObjectPtr<FItemConfig>(local_32);
        if (local_56)
        {
            if ((local_26.PropertyPath == "ItemName_RichText"))
            {
                FText local_98;
                local_87 = local_56.opArrow().Rarity;
                FString local_92;
                if (int(local_87) == 0)
                {
                    local_92 = "ItemName_D";
                }
                else
                {
                    if (int(local_87) == 1)
                    {
                        local_92 = "ItemName_C";
                    }
                    else
                    {
                        if (int(local_87) == 2)
                        {
                            local_92 = "ItemName_B";
                        }
                        else
                        {
                            if (int(local_87) == 3)
                            {
                                local_92 = "ItemName_A";
                            }
                            else
                            {
                                if (int(local_87) == 4)
                                {
                                    local_92 = "ItemName_S";
                                }
                            }
                        }
                    }
                }
                FText::FromString(local_98);
                OutResult = FText::Format(FText::AsCultureInvariant("<{0}>{1}</>"), local_98, local_92);
                return true;
            }
            if ((local_26.PropertyPath == "Rarity_Prefix"))
            {
                local_87 = local_56.opArrow().Rarity;
                TDataObjectPtr<FItemRarityConfig> local_132 = ::UGlobalItemSettings::Get().GetRarityConfig();
                if (local_132)
                {
                    OutResult = local_132.opArrow().ItemNamePrefix;
                    return true;
                }
                XError(ELog(59), FString().Append("Rarity config not found for rarity ").Append(local_87));
                return false;
            }
        }
        return ArgTextUtils::ParseTextFromDataObjectPtr(local_32, local_26.PropertyPath, OutResult);
    }
}

