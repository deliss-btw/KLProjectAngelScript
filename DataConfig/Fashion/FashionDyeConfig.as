

struct FFashionHairDyeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FLinearColor BaseColor;
    UPROPERTY()
    FLinearColor RootColor;
    UPROPERTY()
    FLinearColor TipColor;
    UPROPERTY()
    FLinearColor IDColor;
    UPROPERTY()
    float32 Scatter = 0.0f;
    UPROPERTY()
    float32 Brightness = 0.0f;
    UPROPERTY()
    TArray<FName> SlotNames;
    UPROPERTY()
    FLinearColor DecoColor1;
    UPROPERTY()
    float32 DecoDye1 = 0.0f;
    UPROPERTY()
    FLinearColor DecoColor2;
    UPROPERTY()
    float32 DecoDye2 = 0.0f;
    UPROPERTY()
    FLinearColor DecoColor3;
    UPROPERTY()
    float32 DecoDye3 = 0.0f;
    UPROPERTY()
    FLinearColor DecoColor4;
    UPROPERTY()
    float32 DecoDye4 = 0.0f;
    UPROPERTY()
    TArray<FName> DecoSlotNames;


}

struct FFashionClothDyeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 Dye1 = 0.0f;
    UPROPERTY()
    FLinearColor DyeColor1;
    UPROPERTY()
    float32 Dye2 = 0.0f;
    UPROPERTY()
    FLinearColor DyeColor2;
    UPROPERTY()
    float32 Dye3 = 0.0f;
    UPROPERTY()
    FLinearColor DyeColor3;
    UPROPERTY()
    float32 Dye4 = 0.0f;
    UPROPERTY()
    FLinearColor DyeColor4;
    UPROPERTY()
    TArray<FName> SlotNames;


}

struct FFashionUpperClothDyeConfig : FFashionClothDyeConfig
{
    FFashionClothDyeConfig _base_FFashionClothDyeConfig;

    FFashionUpperClothDyeConfig()
    {
        super();
        return;
    }
}

struct FFashionLowerClothDyeConfig : FFashionClothDyeConfig
{
    FFashionClothDyeConfig _base_FFashionClothDyeConfig;

    FFashionLowerClothDyeConfig()
    {
        super();
        return;
    }
}

namespace FFashionHairDyeConfig
{
FDataObjectPtr FindByKey(const FName &inout Value)
{
    FindByGlobalKeyValue<FName> local_28 = FindByGlobalKeyValue<FName>(__DataObjectStructName(n"FFashionHairDyeConfig"), Value);
    return local_28.opImplConv();
}
}
namespace FFashionUpperClothDyeConfig
{
FDataObjectPtr FindByKey(const FName &inout Value)
{
    FindByGlobalKeyValue<FName> local_28 = FindByGlobalKeyValue<FName>(__DataObjectStructName(n"FFashionUpperClothDyeConfig"), Value);
    return local_28.opImplConv();
}
}
namespace FFashionLowerClothDyeConfig
{
FDataObjectPtr FindByKey(const FName &inout Value)
{
    FindByGlobalKeyValue<FName> local_28 = FindByGlobalKeyValue<FName>(__DataObjectStructName(n"FFashionLowerClothDyeConfig"), Value);
    return local_28.opImplConv();
}
}
