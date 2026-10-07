
namespace FEditorSlateTool
{
UFUNCTION()
void EnableSlateFastPath()
{
    WorldUtils::ExecuteConsoleCommand("Slate.EnableFastWidgetPath 1", nullptr);
    WorldUtils::ExecuteConsoleCommand("Slate.EnableGlobalInvalidation 1", nullptr);
    WorldUtils::ExecuteConsoleCommand("Slate.EnableAllWindowFastUpdate 1", nullptr);
    return;
}
UFUNCTION()
void DisableSlateFastPath()
{
    WorldUtils::ExecuteConsoleCommand("Slate.EnableFastWidgetPath 0", nullptr);
    WorldUtils::ExecuteConsoleCommand("Slate.EnableGlobalInvalidation 0", nullptr);
    WorldUtils::ExecuteConsoleCommand("Slate.EnableAllWindowFastUpdate 0", nullptr);
    return;
}
UFUNCTION()
void EnableAllWindowFastUpdate()
{
    WorldUtils::ExecuteConsoleCommand("Slate.EnableAllWindowFastUpdate 1", nullptr);
    return;
}
UFUNCTION()
void DisableAllWindowFastUpdate()
{
    WorldUtils::ExecuteConsoleCommand("Slate.EnableAllWindowFastUpdate 0", nullptr);
    return;
}
}
