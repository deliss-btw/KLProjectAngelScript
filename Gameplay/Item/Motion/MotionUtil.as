
namespace MotionUtil
{
UFUNCTION()
bool IsMotionLocked(const FECSEntity &inout Entity, const TDataObjectPtr<FMotionData> &inout MotionData)
{
    if (!(MotionData))
    {
        return false;
    }
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    Get local_14;
    const FC_MotionUnlock& local_16 = local_14.opCall();
    if (local_16)
    {
        if (local_16.GetUnlockedMotionData().Contains(MotionData))
        {
            return false;
        }
    }
    return MotionData.opArrow().IsLock;
}
void UnlockMotion(const FECSEntity &inout Entity, const TDataObjectPtr<FMotionData> &inout MotionData)
{
    if (!(!(!(MotionData))))
    {
        return;
    }
    FECSEntity local_6 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    ModifyOrAdd local_14;
    FC_MotionUnlock& local_16 = local_14.opCall();
    if (local_16)
    {
        local_16.GetModify_UnlockedMotionData().AddUnique(MotionData);
        if (ECS::GetRuntimeInfo().IsClient)
        {
            SendEvent local_20;
            local_20.opCall(FFPTime(-1));
            TArray<FTextArgument> local_28;
            FDataObjectPtr local_58 = MotionData.opImplConv();
            Make local_34;
            local_28.Add(local_34.opImplConv());
            MessageHintUtils::ShowMessageHint(local_6, InventoryUtils::GetGlobalItemSettings().MotionUnlockHint, local_28);
        }
    }
    return;
}
}
