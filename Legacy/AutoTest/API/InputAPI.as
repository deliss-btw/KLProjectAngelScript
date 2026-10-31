namespace AutoTest::API::InputAPI
{
void InputKey(const FName &inout KeyName, const FString &inout InputEvent)
{
    bool local_1 = false;
    UEnum local_4 = UEnum::GetEnumType(n"EInputEvent");
    int local_5 = local_4.GetIndexByNameString(InputEvent, EGetByNameFlags(0));
    ThrowIf((local_5 == INDEX_NONE), FString().Append("InputEvent: ").Append(InputEvent).Append(" is not a valid EInputEvent enum value."));
    bool local_1_2 = KLAutomation::InputKey(KeyName, EInputEvent(local_5));
    return;
}
void InputAxis(const FName &inout KeyName, const float32 Delta)
{
    bool local_2 = KLAutomation::InputAxis(KeyName, Delta);
    return;
}
void InputKeyEnum(const FName &inout KeyName, const EInputEvent InputEvent)
{
    XLog(ELog(50), FString().Append("EInputEvent: ").Append(InputEvent));
    KLAutomation::InputKey(KeyName, EInputEvent(InputEvent));
    return;
}
}
