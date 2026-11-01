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
        FTextArgConfig_Attribute local_26;
        TDataObjectPtr<FTextArgConfig_Attribute> local_24 = TDataObjectPtr<FTextArgConfig_Attribute>(Config);
        TDataObjectPtr<FAttributeConfig> local_56 = TDataObjectPtr<FAttributeConfig>(0);
        if (local_56)
        {
            switch (int(local_26.Property))
            {
            case 0:
            {
                if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
                {
                    OutResult = local_56.opArrow().Presentation.GetDisplayName();
                }
                else
                {
                    OutResult = local_56.opArrow().AttributeName;
                }
                break;
            }
            case 1:
            {
                OutResult = local_56.opArrow().AttributeRichIconName;
                break;
            }
            default:
            {
                return false;
            }
            }
        }
        return true;
    }
}

