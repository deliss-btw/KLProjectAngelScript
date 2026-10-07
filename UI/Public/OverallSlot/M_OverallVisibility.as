
const FConsoleCommand CCmd_DebugOverallHide = FConsoleCommand();
const FConsoleVariable CVar_DebugOverallHideVar = FConsoleVariable();

void CMD_DebugOverallHide(const TArray<FString> &inout Arguments)
{
    if (Arguments.Num() < 1)
    {
        return;
    }
    bool local_3 = (String::Conv_StringToInt(Arguments[0]) != 0);
    APlayerController local_10 = FASCommonUtils::GetLocalPlayerController();
    TDataObjectPtr<FWidgetHiddenConfig> local_34;
    TDataObjectIterator<FWidgetHiddenConfig> local_50;
    for (; local_50; )
    {
        FName local_76 = local_50.GetDataPtr().GetDataName();
        if ((local_50.GetDataPtr().GetDataName() == n"Overall"))
        {
            local_34 = local_50.GetDataPtr();
            break;
        }
        local_50.Next();
    }
    if ((local_10 == nullptr || (local_34 == nullptr)))
    {
        return;
    }
    if (!(local_3) == !(CVar_DebugOverallHideVar.GetBool()))
    {
        return;
    }
    CVar_DebugOverallHideVar.SetBool(local_3);
    if (local_3)
    {
        FEUIHideConfig::Apply(local_10, n"AllOverall", local_34);
        return;
    }
    FEUIHideConfig::Release(local_10, n"AllOverall", local_34);
    return;
}
