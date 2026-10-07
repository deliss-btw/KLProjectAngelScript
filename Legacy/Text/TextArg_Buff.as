
enum ETextArgBuffEffectProperty
{
    BuffName,
    BuffCurStack,
    BuffMaxStack,
    BuffAttrValue,
}


struct FTextArgConfig_Buff : FTextArgConfig
{
    FTextArgConfig _base_FTextArgConfig;
    UPROPERTY()
    ETextArgBuffEffectProperty Property;


}

class UTextArgParser_Buff : UBlueprintTextArgParser
{
    UTextArgParser_Buff()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetConfigType_Implementation() const
    {
        return FTextArgConfig_Buff;
    }
    UFUNCTION()
    bool ParseArgValue_Implementation(const FDataObjectPtr &inout Config, const FTextArgument &inout Arg, FText &inout OutResult) const
    {
        FTextArgConfig_Buff local_26;
        TDataObjectPtr<FTextArgConfig_Buff> local_24 = TDataObjectPtr<FTextArgConfig_Buff>(Config);
        if (int(local_26.Property) == 3)
        {
            return this.ParseAttrArgValue(Config, Arg, OutResult);
        }
        Get local_40;
        const FC_BuffInstance& local_42 = local_40.opCall();
        if (local_42)
        {
            const FBuffConfigRef& local_44 = local_42.GetConfig();
            if (local_44.IsValid())
            {
                switch (int(local_26.Property))
                {
                case 0:
                {
                    OutResult = TDataObjectPtr<FBuffPresentationConfig>(FDataObjectPtr(TDataObjectPtr<FBuffConfig>(local_44).opArrow().PresentationConfig)).opArrow().BuffName;
                    break;
                }
                case 1:
                {
                    FNumberFormattingOptions local_122;
                    OutResult = FText::AsNumber(local_42.GetStackCount(), local_122);
                    break;
                }
                case 2:
                {
                    FNumberFormattingOptions local_122;
                    OutResult = FText::AsNumber(int(TDataObjectPtr<FBuffConfig>(local_44).opArrow().MaxBuffCount), local_122);
                    break;
                }
                default:
                {
                    return false;
                }
                }
                return true;
            }
            return false;
        }
        return false;
    }
    bool ParseAttrArgValue(const FDataObjectPtr &inout Config, const FTextArgument &inout Arg, FText &inout OutResult) const
    {
        int local_36 = 0;
        float32 local_46 = 0.0f;
        TDataObjectPtr<FTextArgConfig_Buff> local_24 = TDataObjectPtr<FTextArgConfig_Buff>(Config);
        TConstRawPtr<FBuffModifierAttributeDescriptionInfos> local_32 = FInstancedStruct::GetPtr(Arg.GetStructValue()).opCall();
        int local_37 = local_36;
        if (local_37 == 0)
        {
            FText local_52;
            local_46 = local_46 * 100.0f;
            FText::AsNumber(local_52, local_46);
            OutResult = FText::Format(FText::FromString("{0}%"), local_52);
            if (0.0f > 0.0f)
            {
                OutResult = FText::Format(FText::FromString("+{0}"), OutResult);
            }
        }
        else
        {
            OutResult = FText::AsNumber(local_46, FNumberFormattingOptions());
        }
        return true;
    }
}

