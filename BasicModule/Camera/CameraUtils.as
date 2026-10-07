
namespace ScriptCameraUtils
{
void CameraFreezeAndLookAtFollowTarget(const FECSEntity &inout PlayerPawnEntity, const FName &inout LookAtSocketName, const FVector &inout LookAtSocketOffset, const TDataObjectPtr<FCameraLookAtTargetConfig> &inout LookAtConfig)
{
    int local_162 = 0;
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FFPTime local_8 = FFPTime(-1);
        SendEvent local_6;
        FCE_CameraFreezeAndLookAtFollowTarget& local_12 = local_6.opCall(local_8);
        if (local_12)
        {
            local_12.LookAtSocketName = LookAtSocketName;
            local_12.LookAtSocketOffset = LookAtSocketOffset;
            local_12.LookAtConfig = LookAtConfig;
        }
        return;
    }
    FC_FreezeCameraFollowTarget local_42;
    local_42.bFreezeYawInLookAt = true;
    local_42.bPendingRecordFreeze = true;
    FCameraOverrideParam local_130;
    local_130.SetLayer(ECameraOverrideLayer(5));
    local_130.SetLookAtTargetEntity(PlayerPawnEntity);
    local_130.SetLookAtTargetOffset(LookAtSocketOffset);
    local_130.SetLookAtTargetSocketName(LookAtSocketName);
    local_130.SetLookAtConfig(LookAtConfig.opImplConv());
    FCameraOverrideUtils::AddLocalCameraOverrideLayer(PlayerPawnEntity, local_130);
    local_162.SetbSnapToLookAtTarget(true);
    local_162.SetbDisableLookAtOriginOffset(true);
    return;
}
void CameraUnfreezeAndLookAtFollowTarget(const FECSEntity &inout PlayerPawnEntity)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        SendEvent local_6;
        local_6.opCall(FFPTime(-1));
        return;
    }
    Remove local_14;
    local_14.opCall();
    FECSWorldPtr local_16 = PlayerPawnEntity.GetWorld();
    Assign local_20;
    local_20.opCall(FCS_TPCameraTeleportToTargetTag());
    FCameraOverrideUtils::RemoveLocalCameraOverrideLayer(PlayerPawnEntity, ECameraOverrideLayer(5));
    Remove local_26;
    local_26.opCall();
    return;
}
}
