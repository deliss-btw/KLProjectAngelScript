namespace FTextUtils
{
FText GetFormatText(const FText &inout FormatText, const ETextArgType_DEPRECATED ETextArgType, const FDataObjectPtr &inout TextArg0Ptr)
{
    FText local_4;
    if (int(ETextArgType) == 0)
    {
        return FormatText;
    }
    if (int(ETextArgType) == 1)
    {
        TDataObjectPtr<FAttributeTextData> local_32 = TDataObjectPtr<FAttributeTextData>(TextArg0Ptr.CastTo(FAttributeTextData));
        if ((local_32 == nullptr))
        {
            return FormatText;
        }
        if ((!((local_32 == nullptr))))
        {
            local_4 = FText::Format(FormatText, local_32.Get().Text);
        }
    }
    return local_4;
}
FString ReplaceBracedText(const FString &inout Input, const TMap<FString, FString> &inout Replacements)
{
    FString local_4 = Input;
    int local_5 = 0;
    while (true)
    {
        int local_6 = local_4.Find("{", ESearchCase(1), ESearchDir(0), local_5);
        if (local_6 == INDEX_NONE)
        {
            break;
        }
        int local_8 = local_4.Find("}", ESearchCase(1), ESearchDir(0), local_6);
        if (local_8 == INDEX_NONE)
        {
            break;
        }
        FString local_22 = local_4.Mid(local_6 + 1, ((local_8 - local_6) - 1));
        FString local_26;
        if (Replacements.Contains(local_22))
        {
            local_26 = Replacements[local_22];
        }
        else
        {
            local_26 = "";
        }
        local_4 = ((local_4.Left(local_6) + local_26) + local_4.Mid(local_8 + 1, 2147483647));
        local_5 = local_6 + local_26.Len();
    }
    return local_4;
}
}
