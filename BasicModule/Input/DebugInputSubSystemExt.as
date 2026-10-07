

class UDebugInputSubsystemExt : UDebugInputSubsystem
{
    UDebugInputSubsystemExt()
    {
        return;
    }
    UFUNCTION()
    void OnInitialize_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnDebugKey_Test()
    {
        XDisplay(ELog(0), "Debug Key F5 pressed!");
        return;
    }
}

