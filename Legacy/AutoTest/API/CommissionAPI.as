
namespace AutoTest::API::CommissionAPI
{
bool IsInCommission()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    return local_6.opCall();
}
uint GetCommissionId()
{
    if (!(AutoTest::API::CommissionAPI::IsInCommission()))
    {
        return 0;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Get local_8;
    return local_8.opCall().CommissionConfig.opArrow().DataId;
}
FString CheckCommissionStatus()
{
    if (!(AutoTest::API::CommissionAPI::IsInCommission()))
    {
        return "NotInCommission";
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Has local_8;
    if (!(local_8.opCall()))
    {
        return "InProgress";
    }
    FECSWorldPtr local_4_2 = ECS::GetECSWorld();
    Get local_12;
    bool local_1 = local_12.opCall().GetbSuccess();
    if (local_1)
    {
        return "Finished";
    }
    return "Failed";
}
FString CheckCommissionSubTargetStatus()
{
    int local_10 = 0;
    if (!(AutoTest::API::CommissionAPI::IsInCommission()))
    {
        return "NotInCommission";
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (int(local_10.GetStatus()) == 0)
    {
        return "InProgress";
    }
    if ((int(local_10.GetStatus())) == 1)
    {
        return "Finished";
    }
    if (int(local_10.GetStatus()) == 2)
    {
        return "Failed";
    }
    return "UnknownStatus";
}
FString CheckCommissionIntrusionPolicyStatus()
{
    if (!(AutoTest::API::CommissionAPI::IsInCommission()))
    {
        return "NotInCommission";
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Has local_8;
    if (!(local_8.opCall()))
    {
        return "InProgress";
    }
    FECSWorldPtr local_4_2 = ECS::GetECSWorld();
    Get local_12;
    bool local_1 = local_12.opCall().GetChallengeObjectiveIsFinish();
    if (local_1)
    {
        return "Finished";
    }
    return "Failed";
}
uint GetCommissionRewardScore()
{
    bool local_1 = !(AutoTest::API::CommissionAPI::IsInCommission());
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Has local_8;
        local_1 = !(local_8.opCall());
    }
    if (local_1)
    {
        return 0;
    }
    FECSWorldPtr local_4_2 = ECS::GetECSWorld();
    Get local_14;
    return local_14.opCall().GetRewardScore();
}
uint64 GetActiveCommissionInstIdById(const uint CommissionId)
{
    FAngelscriptGameThreadScopeWorldContext local_2 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    APlayerController local_8 = FASCommonUtils::GetLocalPlayerController();
    ThrowIf(local_8, !((local_8 != nullptr)));
    FMS_CommissionData& local_12 = FMS_CommissionData::Get(local_8);
    return local_12.GetInstIdByCommissionId(CommissionId);
}
void StartCommissionByInstId(const uint64 CommissionInstId)
{
    FAngelscriptGameThreadScopeWorldContext local_2 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UAutoTestClientConnectionSubsystem local_8 = UAutoTestClientConnectionSubsystem::Get();
    ThrowIf(local_8, !((local_8 != nullptr)));
    local_8.Initialize();
    local_8.StartCommissionByInstId(CommissionInstId);
    return;
}
}
