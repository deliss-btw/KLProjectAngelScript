
namespace FEcologyMisc
{
    const FConsoleVariable CVar_EcosimAI_Enable = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_Simalute_Enable = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_EnableDataMonitor = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_DebugSpawnErrorLocation = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_DebugDisableSpawn = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_DebugActivityTimeRatio = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_EnableDelayTask = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_EnableDelayUpdateTargetting = FConsoleVariable();
    const FConsoleVariable CVar_Prolog_DebugPrologTrace = FConsoleVariable();
    const FConsoleVariable CVar_Prolog_DebugPrologLog = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_LOD = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_EnableHumanity = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_ScopeCounter = FConsoleVariable();
    const FConsoleVariable CVar_EcosimAI_EnableIncreaDynamicArea = FConsoleVariable();
    const FConsoleVariable CVar_Ecology_HTNAIBranch = FConsoleVariable();
    const float32 TickInterval = 0.06666667f;
    const float32 ActivityGroupInDynamicPointAreaTickInterval = 0.25f;
    const FConsoleVariable CVar_Ecology_DelayActiveFlock = FConsoleVariable();
    const FConsoleVariable CVar_Ecology_Experimental = FConsoleVariable();

bool IsEcologySimaluteEnable()
{
    return FEcologyMisc::CVar_EcosimAI_Enable.GetBool() && FEcologyMisc::CVar_EcosimAI_EnableDataMonitor.GetBool() && FEcologyMisc::CVar_EcosimAI_Simalute_Enable.GetBool();
}
bool IsEcologySimaluteDataMonitorEnable()
{
    return FEcologyMisc::CVar_EcosimAI_Enable.GetBool() && FEcologyMisc::CVar_EcosimAI_EnableDataMonitor.GetBool();
}
}
