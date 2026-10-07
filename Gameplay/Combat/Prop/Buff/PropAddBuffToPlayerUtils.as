
namespace PropAddBuffToPlayerUtils
{
UFUNCTION()
void TriggerEntityAddBuffListByBuffTag(const FECSEntity &inout TriggerPlayer, const FECSEntity &inout BuffConfigSourceEntity, const bool bIncludeDefault, const TArray<FName> &inout BuffTagNames)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (BuffConfigSourceEntity)
    {
        FFPTime local_8 = FFPTime(-1);
        SendEvent local_6;
        FCE_PropAddBuffToPlayerEvent& local_12 = local_6.opCall(local_8);
        if (local_12)
        {
            local_12.TriggerPlayer = TriggerPlayer;
            local_12.BuffConfigSourceEntity = BuffConfigSourceEntity;
            local_12.bIncludeDefault = bIncludeDefault;
            local_12.BuffTagNames.Append(BuffTagNames);
        }
    }
    return;
}
}
