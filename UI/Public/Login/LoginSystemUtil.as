namespace LoginSystemUtil
{
FText ResolveLoginTextData(const TDataObjectPtr<FKLTextData> &inout TextData)
{
    if (TextData.IsSet() && !(TextData.Get().Text.IsEmpty()))
    {
        return TextData.Get().Text;
    }
    return FText();
}
}
