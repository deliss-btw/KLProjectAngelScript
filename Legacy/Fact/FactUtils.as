
namespace FFactUtils
{
    const TArray<FString> EngActionNames = TArray<FString>();
    const TMap<FString, FString> EngActionNameToChm = TMap<FString, FString>();

UFUNCTION()
bool GetPawnEntityFactExtraInfo(const FECSEntity &inout PawnEntity, FEntityFactExtraInfo &inout EntityFactExtraInfo)
{
    int local_6 = 0;
    if (local_6)
    {
        return true;
    }
    return false;
}
UFUNCTION()
FString GetPawnEntityShowName(const FECSEntity &inout PawnEntity)
{
    FEntityFactExtraInfo local_4;
    if (FFactUtils::GetPawnEntityFactExtraInfo(PawnEntity, local_4))
    {
        return local_4.ShowName;
    }
    return "Undefined";
}
UFUNCTION()
void SetCurrentActionName(const FECSEntity &inout PawnEntity, const FString &inout ActionName)
{
    Has local_4;
    int local_12 = 0;
    if (!(local_4.opCall()) == !(false))
    {
        return;
    }
    FString local_16 = ActionName;
    if ((local_16 == "standby"))
    {
        if ((local_12.LastActionName == "crouch"))
        {
            local_16 = "crouch_recover";
        }
        else
        {
            return;
        }
    }
    local_12.CurrentActionName = local_16;
    if (!(local_16.IsEmpty()))
    {
        local_12.LastActionName = local_16;
    }
    return;
}
UFUNCTION()
FString DebugGetActionChmNameFromEng(const FString &inout ActionEngName)
{
    if (FFactUtils::EngActionNameToChm.Contains(ActionEngName))
    {
        FString local_6;
        FFactUtils::EngActionNameToChm.Find(ActionEngName, local_6);
        return local_6;
    }
    FString local_10 = "Could Not Find ActionEngName : ";
    return "";
}
}
