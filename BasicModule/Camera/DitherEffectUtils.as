namespace FDitherEffectUtils
{
void RequestDitherEffect(const FECSEntity &inout Entity, const FName &inout RequestName, const float32 BlendDuration, const bool bIncludeAttachEntity)
{
    int local_6 = 0;
    int local_8 = local_6.GetDitherRequestIndex(RequestName);
    if (local_8 == INDEX_NONE)
    {
        FDitherRequest local_20;
        local_6.GetModify_Requests().Add(local_20);
        local_8 = local_6.GetRequests().Num() - 1;
    }
    FDitherRequest& local_24 = local_6.GetModify_Requests()[local_8];
    local_24.SetRequestName(RequestName);
    local_24.SetStartValue(0.0f);
    local_24.SetTargetValue(1.0f);
    local_24.SetBlendDuration(BlendDuration);
    local_24.SetStartTime(Entity.GetWorld().GetFixedTime().Time);
    local_24.SetbIncludeAttachEntity(bIncludeAttachEntity);
    return;
}
void RemoveDitherEffect(const FECSEntity &inout Entity, const FName &inout RequestName, const float32 BlendDuration)
{
    Modify local_4;
    FC_SyncDitherRequests& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_9 = local_6.GetDitherRequestIndex(RequestName);
        if (local_9 != INDEX_NONE)
        {
            FDitherRequest& local_12 = local_6.GetModify_Requests()[local_9];
            local_12.SetStartValue(local_12.GetCurrentDitherValue(Entity.GetWorld().GetFixedTime().Time));
            local_12.SetTargetValue(0.0f);
            local_12.SetBlendDuration(BlendDuration);
            local_12.SetStartTime(Entity.GetWorld().GetFixedTime().Time);
        }
    }
    return;
}
void RequestDitherAppearEffect(const FECSEntity &inout Entity, const FName &inout RequestName, const float32 BlendDuration)
{
    int local_6 = 0;
    int local_8 = local_6.GetDitherRequestIndex(RequestName);
    if (local_8 == INDEX_NONE)
    {
        FDitherRequest local_20;
        local_6.GetModify_Requests().Add(local_20);
        local_8 = local_6.GetRequests().Num() - 1;
    }
    FDitherRequest& local_24 = local_6.GetModify_Requests()[local_8];
    local_24.SetRequestName(RequestName);
    local_24.SetStartValue(1.0f);
    local_24.SetTargetValue(0.0f);
    local_24.SetBlendDuration(BlendDuration);
    local_24.SetStartTime(Entity.GetWorld().GetFixedTime().Time);
    local_24.SetbIncludeAttachEntity(true);
    return;
}
}
