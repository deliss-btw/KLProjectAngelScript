
const FConsoleCommand CVar_ResetLoadingPassFromJson = FConsoleCommand();

namespace FLevelDebugUtils
{
UFUNCTION()
void DebugNoCDBuff(const FECSEntity &inout Entity, const bool bEnable)
{
    int local_4 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    local_4.SetbHasNoCDBuff(bEnable);
    System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLEnableServerPlayerMaxCombatEnergy ").Append(Entity.GetIdValue()).Append(" ").Append(bEnable ? 1 : 0));
    System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLEnableServerPlayerSkillNoCD ").Append(Entity.GetIdValue()).Append(" ").Append(bEnable ? 1 : 0));
    return;
}
}
void CMD_ResetLoadingPassFromJson(const TArray<FString> &inout Arguments)
{
    return;
}
