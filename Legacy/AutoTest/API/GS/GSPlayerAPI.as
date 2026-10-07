
namespace AutoTest::API::GS::GSPlayerAPI
{
    const FString GetPlayerUidByName_JobId = FString();

FString GetPlayerUidByName(const FString &inout PlayerName)
{
    FAngelscriptGameThreadScopeWorldContext local_2 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    UAutoTestClientConnectionSubsystem local_8 = UAutoTestClientConnectionSubsystem::Get();
    ThrowIf(local_8, !((local_8 != nullptr)));
    local_8.Initialize();
    local_8.SearchPlayer(PlayerName);
    return AutoTest::API::GS::GSPlayerAPI::GetPlayerUidByName_JobId;
}
}
