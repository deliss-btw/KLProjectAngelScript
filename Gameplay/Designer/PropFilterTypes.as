
namespace FPropFilterTypes
{
    const TArray<FName> PropFilterTypes = TArray<FName>();

UFUNCTION()
TArray<FName> GetPropFilterTypes()
{
    return FPropFilterTypes::PropFilterTypes;
}
}
