
namespace AutoTest::API::GTCAPI
{
uint StartTest(const int EntityId, const TArray<FGTCTestCaseInputConfig> &inout TestCaseConfigList, const FString &inout OutputFolder)
{
    int local_126 = 0;
    bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
    ThrowIf(local_1, "StartTest can only be called on server side.");
    ThrowIf(!(FECSEntity(EntityId).IsValid()), "AvatarEntity is invalid.");
    TArray<FGTCTestCaseConfig> local_14;
    for (auto& local_28 : TestCaseConfigList)
    {
        FGTCTestCaseConfig local_72;
        local_72.LoopRounds = 1;
        local_72.bEnableLatency = local_28.bEnableLatency;
        if (local_72.bEnableLatency)
        {
            float32 local_74 = 50.0f;
            float32 local_76 = 50.0f;
            if (local_28.BaseLatency.Num() >= 1)
            {
                local_74 = local_28.BaseLatency[0];
            }
            if (local_28.BaseLatency.Num() >= 2)
            {
                local_76 = local_28.BaseLatency[1];
            }
            local_72.BaseLatency.SetValue(FVector2D(local_74, local_76));
        }
        TArray<FString> local_90;
        local_28.TestCasePath.ParseIntoArray(local_90, "/", true);
        FString local_94 = local_90[(local_90.Num() - 1)];
        FString local_98 = local_28.TestCasePath;
        local_72.GTCJsonAssetPath = (local_98 + ".json");
        local_14.Add(local_72);
    }
    FFPTime local_108 = FFPTime(-1);
    FCE_GameTestRequestStart local_110;
    local_110.GameTestId = FGuid::NewGuid().GetTypeHash();
    local_110.OutputFolder = OutputFolder;
    local_110.TestCaseList = local_14;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    FGTCInfo local_132;
    local_132.IsFinished = false;
    local_126.GTCMap.Add(local_110.GameTestId, local_132);
    return int(local_110.GameTestId);
}
bool IsTestFinished(const uint GameTestId)
{
    int local_12 = 0;
    bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
    ThrowIf(local_1, "IsTestFinished can only be called on server side.");
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    ThrowIf(!(local_4.IsValid()), "ECSWorld is null.");
    if (!(local_12))
    {
        return false;
    }
    FGTCInfo local_18;
    if (!(local_12.GTCMap.Find(GameTestId, local_18)))
    {
        return false;
    }
    return local_18.IsFinished;
}
TArray<FString> GetGameTestLogFiles(const uint GameTestId)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TArray<FString> __r; return __r;
}
TMap<uint, FGTCInfo> GetGameTestSummary()
{
    int local_10 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_10))
    {
        TMap<uint, FGTCInfo> local_32;
        return local_32;
    }
    return local_10.GTCMap;
}
}
