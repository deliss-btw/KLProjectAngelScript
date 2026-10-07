
namespace AutoTest::AsyncUtils
{
FString CallServerFunction(const FJsonObjectWrapper &inout ExecParamJson)
{
    FString local_4;
    int local_26 = 0;
    FJsonObjectConverter::UStructToJsonObjectString(ExecParamJson, local_4, 0, 0, 0, false);
    ThrowIf(!(AutoTest::CommonUtils::GetLocalAvatarEntity().IsValid()), "AvatarEntity is invalid.");
    FFPTime local_24 = FFPTime(-1);
    local_26.JobId = FGuid::NewGuid().ToString();
    local_26.ExecParamJsonStr = local_4;
    return local_26.JobId;
}
FJsonObjectWrapper GetJobResult(const FString &inout JobId)
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    bool local_5 = !(local_12);
    ThrowIf(local_5, "FCS_AutoTestJobPool is null.");
    FString local_16;
    bool local_5_2 = local_12.JobMap.Find(JobId, local_16);
    if (!(local_5_2))
    {
        return FJsonObjectWrapper();
    }
    FJsonObjectWrapper local_34;
    ThrowIf(!(FJsonObjectConverter::JsonObjectStringToUStruct(local_16, local_34, 0, 0)), "ResultJson deserialize failed.");
    return local_34;
}
FJsonObjectWrapper GetJobPool()
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    bool local_5 = !(local_12);
    ThrowIf(local_5, "FCS_AutoTestJobPool is null.");
    FString local_16;
    FJsonObjectConverter::UStructToJsonObjectString(local_12, local_16, 0, 0, 0, false);
    FJsonObjectWrapper local_28;
    ThrowIf(!(FJsonObjectConverter::JsonObjectStringToUStruct(local_16, local_28, 0, 0)), "ResultJson deserialize failed.");
    return local_28;
}
void ClearJobPool()
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    bool local_5 = !(local_12);
    ThrowIf(local_5, "FCS_AutoTestJobPool is null.");
    local_12.JobMap.Empty(0);
    return;
}
}
