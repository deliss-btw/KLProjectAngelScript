

struct FDistanceFormattingOptions
{
    UPROPERTY()
    EUnit MetricMinUnit = EUnit(3);
    UPROPERTY()
    EUnit MetricMaxUnit = EUnit(4);
    UPROPERTY()
    EUnit ImperialMinUnit = EUnit(6);
    UPROPERTY()
    EUnit ImperialMaxUnit = EUnit(8);


    bool IsConfigValid() const
    {
        return int(this.MetricMinUnit) <= int(this.MetricMaxUnit) && (int(this.ImperialMinUnit) <= int(this.ImperialMaxUnit));
    }
}

namespace CommonPropertyConversions
{
UFUNCTION()
FSlateBrush SoftBrushToSlateBrush(const FSoftBrush &inout SoftBrush)
{
    return SoftBrush.LoadBrush();
}
UFUNCTION()
FSlateBrush TextureToSlateBrush(const UTexture2D Texture, const bool bMatchSize = false)
{
    return FEUIUtils::ConvertTextureToBrush(Texture, bMatchSize);
}
UFUNCTION()
ESlateVisibility BoolToVisibility(const bool bValue, const ESlateVisibility FalseValue = ESlateVisibility::Collapsed, const ESlateVisibility TrueValue = ESlateVisibility::SelfHitTestInvisible)
{
    int local_1;
    if (bValue)
    {
        local_1 = TrueValue;
    }
    else
    {
        local_1 = FalseValue;
    }
    return ESlateVisibility(local_1);
}
UFUNCTION()
ESlateVisibility IntGreaterThanZeroToVisibility(const int Value, const ESlateVisibility NonPositiveVisibility = ESlateVisibility::Collapsed, const ESlateVisibility PositiveVisibility = ESlateVisibility::Visible)
{
    int local_3;
    if (Value > 0)
    {
        local_3 = PositiveVisibility;
    }
    else
    {
        local_3 = NonPositiveVisibility;
    }
    return ESlateVisibility(local_3);
}
UFUNCTION()
FText FPTimeToTimespan(const FFPTime &inout FPTime)
{
    return FText::AsTimespan(FTimespan::FromSeconds(FPTime.ToSeconds()));
}
UFUNCTION()
FText InputActionToText(const UInputAction InputAction)
{
    if (!(IsValid(InputAction)))
    {
        return NSLOCTEXT("InvalidInputAction", "<Invalid Input Action>");
    }
    ULocalPlayer local_10 = FASCommonUtils::GetLocalPlayerController().GetLocalPlayer();
    if (!(IsValid(local_10)))
    {
        XError(ELog(16), "Failed to get local player.");
        return NSLOCTEXT("InvalidInputAction", "<Invalid Input Action>");
    }
    return UICommonUtil::InputActionToText(local_10, InputAction);
}
UFUNCTION()
FText TimespanToText(const FTimespan &inout Timespan)
{
    return FText::AsTimespan(Timespan);
}
UFUNCTION()
FText DateTimeToUnixTimeText(const FDateTime &inout DateTime)
{
    return FText::FromString(DateTime.ToString("%H:%M"));
}
UFUNCTION()
FText DateTimeToTimeText(const FDateTime &inout DateTime)
{
    return FText::AsTime(DateTime, EDateTimeStyle(0), FString());
}
UFUNCTION()
FText DateTimeToDateText(const FDateTime &inout DateTime)
{
    return FText::AsDate(DateTime, EDateTimeStyle(0), FString());
}
UFUNCTION()
FText DateTimeToText(const FDateTime &inout DateTime)
{
    return FText::AsDateTime(DateTime, EDateTimeStyle(0), EDateTimeStyle(0), FString());
}
UFUNCTION()
FText DistanceToText(const float Distance, const FDistanceFormattingOptions &inout DistanceFormattingOptions = FDistanceFormattingOptions())
{
    FText local_20;
    FNumberFormattingOptions local_6;
    local_6 = FNumberFormattingOptions().SetMaximumFractionalDigits(0).SetMinimumFractionalDigits(0).SetUseGrouping(true);
    if (!(DistanceFormattingOptions.IsConfigValid()))
    {
        FText::AsNumber(local_20, Distance);
        return FText::Format(NSLOCTEXT("InvalidDistanceFormattingOptions", "<Invalid Distance Formatting Options> ({0}cm)"), local_20);
    }
    int local_31 = int(FUnitConversion::CalculateDisplayUnit(Distance, EUnit(2)));
    int local_30 = int(CommonPropertyConversions_DistanceInternal::FindDisplayUnit(EUnit(local_31), DistanceFormattingOptions));
    float local_34 = FUnitConversion::Convert(Distance, EUnit(local_31), EUnit(local_30));
    FUnitConversion::GetUnitDisplayString(EUnit(local_30));
    FText::FromString(local_20);
    return FText::Format(INVTEXT("{0}{1}"), FText::AsNumber(local_34, local_6), local_20);
}
UFUNCTION()
TArray<FEUIModelContainer> ModelRefToContainerArray(const TArray<FEUIModelRef> &inout ModelRefs)
{
    return EUI::Conv_ModelArrayToContainerArray(ModelRefs);
}
UFUNCTION()
const UInputAction EUIInputActionToInputAction(const FEUIInputAction &inout EUIInputAction)
{
    UInputAction local_2 = EUIInputAction.EnhancedAction;
    return local_2;
}
UFUNCTION()
ESlateVisibility ModelRefToVisibility(const FEUIModelRef &inout ModelRef, const ESlateVisibility ValidVisibility = ESlateVisibility::SelfHitTestInvisible, const ESlateVisibility InvalidVisibility = ESlateVisibility::Collapsed)
{
    int local_2;
    if (ModelRef.IsValid())
    {
        local_2 = ValidVisibility;
    }
    else
    {
        local_2 = InvalidVisibility;
    }
    return ESlateVisibility(local_2);
}
UFUNCTION()
float32 BoolToOpacity(const bool bValue, const float32 TrueOpacity = 1.0f, const float32 FalseOpacity = 0.5f)
{
    float32 local_1;
    if (bValue)
    {
        local_1 = TrueOpacity;
    }
    else
    {
        local_1 = FalseOpacity;
    }
    return local_1;
}
UFUNCTION()
ESlateVisibility SoftBrushToVisibility(const FSoftBrush &inout SoftBrush, const ESlateVisibility ValidVisibility = ESlateVisibility::SelfHitTestInvisible, const ESlateVisibility InvalidVisibility = ESlateVisibility::Collapsed)
{
    int local_2;
    if (SoftBrush.IsSet())
    {
        local_2 = ValidVisibility;
    }
    else
    {
        local_2 = InvalidVisibility;
    }
    return ESlateVisibility(local_2);
}
UFUNCTION()
ESlateVisibility TextToVisibility(const FText &inout Text, const ESlateVisibility ValidVisibility = ESlateVisibility::SelfHitTestInvisible, const ESlateVisibility InvalidVisibility = ESlateVisibility::Collapsed)
{
    int local_2;
    if (Text.IsEmpty())
    {
        local_2 = InvalidVisibility;
    }
    else
    {
        local_2 = ValidVisibility;
    }
    return ESlateVisibility(local_2);
}
UFUNCTION()
int ModelRefValidToIndex(const FEUIModelRef &inout ModelRef, const int InvalidIndex = 0, const int ValidIndex = 1)
{
    int local_2;
    if (ModelRef.IsValid())
    {
        local_2 = ValidIndex;
    }
    else
    {
        local_2 = InvalidIndex;
    }
    return local_2;
}
UFUNCTION()
int DataObjectValidToIndex(const FDataObjectPtr &inout DataObjectPtr, const int InvalidIndex = 0, const int ValidIndex = 1)
{
    int local_2;
    if (DataObjectPtr.IsValid())
    {
        local_2 = ValidIndex;
    }
    else
    {
        local_2 = InvalidIndex;
    }
    return local_2;
}
}
namespace CommonPropertyConversions_DistanceInternal
{
bool IsImperialUnit(const EUnit Unit)
{
    return (int(Unit) == 5 || (int(Unit) == 6) || (int(Unit) == 7) || (int(Unit) == 8));
}
EUnit FindDisplayUnit(const EUnit DesiredUnit, const FDistanceFormattingOptions &inout DistanceFormattingOptions)
{
    if (CommonPropertyConversions_DistanceInternal::IsImperialUnit(EUnit(DesiredUnit)))
    {
        return CommonPropertyConversions_DistanceInternal::FindDisplayImperialUnitInternal(EUnit(DesiredUnit), DistanceFormattingOptions);
    }
    else
    {
        return CommonPropertyConversions_DistanceInternal::FindDisplayMetricUnitInternal(EUnit(DesiredUnit), DistanceFormattingOptions);
    }
}
EUnit FindDisplayImperialUnitInternal(const EUnit DesiredUnit, const FDistanceFormattingOptions &inout DistanceFormattingOptions)
{
    if (int(DesiredUnit) < int(DistanceFormattingOptions.ImperialMinUnit))
    {
        return DistanceFormattingOptions.ImperialMinUnit;
    }
    if (int(DesiredUnit) > int(DistanceFormattingOptions.ImperialMaxUnit))
    {
        return DistanceFormattingOptions.ImperialMaxUnit;
    }
    return DesiredUnit;
}
EUnit FindDisplayMetricUnitInternal(const EUnit DesiredUnit, const FDistanceFormattingOptions &inout DistanceFormattingOptions)
{
    if (int(DesiredUnit) < int(DistanceFormattingOptions.MetricMinUnit))
    {
        return DistanceFormattingOptions.MetricMinUnit;
    }
    if (int(DesiredUnit) > int(DistanceFormattingOptions.MetricMaxUnit))
    {
        return DistanceFormattingOptions.MetricMaxUnit;
    }
    return DesiredUnit;
}
}
