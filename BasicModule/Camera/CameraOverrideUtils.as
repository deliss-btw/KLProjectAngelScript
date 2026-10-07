
namespace FCameraOverrideUtils
{
void AddLocalCameraOverrideLayer(const FECSEntity &inout Entity, const FCameraOverrideParam &inout CameraOverrideParam)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void RemoveLocalCameraOverrideLayer(const FECSEntity &inout Entity, const ECameraOverrideLayer Layer)
{
    Modify local_4;
    FC_CameraOverrides& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_8 = 0;
        while (local_8 < 0)
        {
            if (int(local_6.LocalCameraOverrides[local_8].GetLayer()) == int(Layer))
            {
                local_6.LocalCameraOverrides.RemoveAt(local_8);
                break;
            }
            ++local_8;
        }
        local_6.MergeCameraOverrides();
        if (local_6.CameraOverridesIndex.Num() == 0)
        {
            Remove local_16;
            local_16.opCall();
        }
    }
    return;
}
void AddSyncCameraOverrideLayer(const FECSEntity &inout Entity, const FCameraOverrideParam &inout CameraOverrideParam)
{
    int local_12 = 0;
    Has local_4;
    local_4.opCall();
    if (!(Entity.IsActive()))
    {
        return;
    }
    local_12.ModifyOrAddCameraOverrideParam(CameraOverrideParam.GetLayer()) = CameraOverrideParam;
    return;
}
void RemoveSyncCameraOverrideLayer(const FECSEntity &inout Entity, const ECameraOverrideLayer Layer)
{
    Has local_4;
    local_4.opCall();
    Modify local_10;
    FC_SyncCameraOverride& local_12 = local_10.opCall();
    if (local_12)
    {
        local_12.RemoveCameraOverrideParam(ECameraOverrideLayer(Layer));
        if (local_12.GetCameraOverrideParams().Num() == 0)
        {
            Remove local_18;
            local_18.opCall();
        }
    }
    return;
}
void AddSyncCameraOverrideLayer(const ECameraOverrideLayer Layer, const FECSEntity &inout ViewTargetEntity, const FECSEntity &inout LookAtTargetEntity, const FVector &inout LookAtTargetOffset, const FName &inout LookAtTargetSocketName, const TDataObjectPtr<FCameraLookAtTargetConfig> &inout LookAtConfig, const TDataObjectPtr<FTPCameraStateConfig> &inout CameraState)
{
    FCameraOverrideParam local_88;
    local_88.SetLayer(ECameraOverrideLayer(Layer));
    local_88.SetLookAtTargetEntity(LookAtTargetEntity);
    local_88.SetLookAtTargetOffset(LookAtTargetOffset);
    local_88.SetLookAtTargetSocketName(LookAtTargetSocketName);
    if (LookAtConfig.IsSet())
    {
        local_88.SetLookAtConfig(LookAtConfig.opImplConv());
    }
    if (CameraState.IsSet())
    {
        local_88.SetCameraState(CameraState.opImplConv());
    }
    FCameraOverrideUtils::AddSyncCameraOverrideLayer(ViewTargetEntity, local_88);
    return;
}
}
