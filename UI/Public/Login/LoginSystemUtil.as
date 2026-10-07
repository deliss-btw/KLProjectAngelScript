
namespace LoginSystemUtil
{
FText ResolveLoginTextData(const TDataObjectPtr<FKLTextData> &inout TextData)
{
    bool local_1;
    bool local_2 = false;
    FText __return;
    if (!(TextData.IsSet()))
    {
        local_1 = false;
    }
    else
    {
        local_2 = !local_2;
        local_1 = local_2;
    }
    if (local_1)
    {
    }
    else
    {
        __return = FText();
    }
    return __return;
}
}
