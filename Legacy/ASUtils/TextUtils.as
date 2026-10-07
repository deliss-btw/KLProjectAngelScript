
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
            FText local_110;
            local_4 = local_110;
        }
    }
    return local_4;
}
FString ReplaceBracedText(const FString &inout Input, const TMap<FString, FString> &inout Replacements)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FString __r; return __r;
}
}
