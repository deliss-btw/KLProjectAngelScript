

struct FLookDevWeatherItem
{
    UPROPERTY()
    FName DisplayName;
    UPROPERTY()
    FLinearColor BackgroundColor = FLinearColor(0.06f, 0.06f, 0.06f, 0.8f);
    UPROPERTY()
    FLinearColor TextColor = FLinearColor(0.266347f, 0.689236f, 0.512223f, 1.0f);
    UPROPERTY()
    FName LogicWeatherName;
    UPROPERTY()
    TArray<FName> WeatherNames;
    UPROPERTY()
    float32 InitTime = 12.0f;
    UPROPERTY()
    float32 InitLogicTime = 12.0f;


}

struct FLookDevWeatherCategoryData
{
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    TArray<FLookDevWeatherItem> WeatherItems;

    FLookDevWeatherCategoryData()
    {
        return;
    }
}

