

class UFrontendSystemBehavior_CameraOverride : UFrontendSystemBehaviorBase
{
    UPROPERTY()
    FVector LookAtTargetOffset;
    UPROPERTY()
    FName LookAtTargetSocketName;
    UPROPERTY()
    FDataObjectPtr LookAtConfig;
    UPROPERTY()
    FDataObjectPtr CameraState;

    UFrontendSystemBehavior_CameraOverride()
    {
        super();
        return;
    }
    void OnEnter(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        FCameraOverrideParam local_176 = this.MakeParam(Context.PlayerEntity);
        FFrontendSystemCameraOverride local_266;
        local_266.SourceBehavior = this;
        local_266.OverrideParam = local_176;
        ModifyOrAdd local_270;
        local_270.opCall().OverrideParams.Add(local_266);
        FC_FrontendSystemCameraOverrideNeedUpdateTag local_278;
        Assign local_276;
        local_276.opCall(local_278);
        return;
    }
    void OnExit(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        int local_6 = 0;
        if (local_6)
        {
            FCameraOverrideParam local_184 = this.MakeParam(Context.PlayerEntity);
            int local_185 = 0;
            for (; local_185 < local_6.OverrideParams.Num(); ++local_185)
            {
                TWeakObjectPtr<UObject> local_189;
                local_189 = local_6.OverrideParams[local_185].SourceBehavior;
                if ((local_189 == this))
                {
                    local_6.OverrideParams.RemoveAt(local_185);
                    FC_FrontendSystemCameraOverrideNeedUpdateTag local_196;
                    Assign local_194;
                    local_194.opCall(local_196);
                    return;
                }
            }
            XError(ELog(52), FString().Append("Can't find override data for behavior ").Append(this));
        }
        return;
    }
    FCameraOverrideParam MakeParam(const FECSEntity &inout PlayerEntity) const
    {
        FCameraOverrideParam local_88;
        local_88.SetLayer(ECameraOverrideLayer(4));
        Get local_94;
        local_88.SetLookAtTargetEntity(local_94.opCall().GetCameraViewTargetEntity());
        local_88.SetLookAtTargetOffset(this.LookAtTargetOffset);
        local_88.SetLookAtTargetSocketName(this.LookAtTargetSocketName);
        local_88.SetLookAtConfig(this.LookAtConfig);
        local_88.SetCameraState(this.CameraState);
        return local_88;
    }
}

