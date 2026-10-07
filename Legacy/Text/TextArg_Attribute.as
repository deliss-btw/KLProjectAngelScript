
enum ETextArgAttributeProperty
{
    AttributeName,
    AttributeRichTextIcon,
}


struct FTextArgConfig_Attribute : FTextArgConfig
{
    FTextArgConfig _base_FTextArgConfig;
    UPROPERTY()
    ETextArgAttributeProperty Property;


}

class UTextArgParser_Attribute : UBlueprintTextArgParser
{
    UTextArgParser_Attribute()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetConfigType_Implementation() const
    {
        return FTextArgConfig_Attribute;
    }
    UFUNCTION()
    bool ParseArgValue_Implementation(const FDataObjectPtr &inout Config, const FTextArgument &inout Arg, FText &inout OutResult) const
    {
        TDataObjectPtr<FTextArgConfig_Attribute> local_24 = TDataObjectPtr<FTextArgConfig_Attribute>(Config);
        TDataObjectPtr<FAttributeConfig> local_56 = TDataObjectPtr<FAttributeConfig>(0);
        if (local_56)
        {
            FTextArgConfig_Attribute local_26;
            int local_83 = int(local_26.Property);
            if (local_83 <= 1)
            {
                if (local_83 != 0)
                {
                    if (local_83 != 1)
                    {
                    }
                }
                else
                {
                    if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
                    {
                        OutResult = local_56.opArrow().Presentation.GetDisplayName();
                    }
                    else
                    {
                        OutResult = local_56.opArrow().AttributeName;
                    }
                    OutResult = local_56.opArrow().AttributeRichIconName;
                }
            }
            return false;
        }
        return true;
    }
}

