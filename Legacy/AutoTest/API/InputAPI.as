
namespace AutoTest::API::InputAPI
{
void InputKey(const FName &inout KeyName, const FString &inout InputEvent)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
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
