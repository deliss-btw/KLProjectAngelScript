
namespace FloatUtils
{
UFUNCTION()
FString FormatFloatOneDecimal(const float32 Value)
{
    float32 local_2 = FMath::RoundToFloat((Value * 10.0f)) / 10.0f;
    int local_6 = FMath::TruncToInt(local_2);
    int local_5 = FMath::RoundToInt((local_2 - local_6) * 10.0f);
    if (local_5 >= 10)
    {
        ++local_6;
        local_5 = 0;
    }
    return ((String::Conv_IntToString(local_6) + ".") + String::Conv_IntToString(local_5));
}
}
