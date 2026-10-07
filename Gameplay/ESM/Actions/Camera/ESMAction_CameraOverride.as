

class UESMAction_CameraLookAtTarget : UESMBPBaseSpanAction
{
    UPROPERTY()
    ECameraOverrideLayer CameraOverrideLayer = ECameraOverrideLayer(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity LookAtTargetEntityBBVar;
    UPROPERTY()
    FVector LookAtTargetOffset;
    UPROPERTY()
    FName LookAtTargetSocketName;
    UPROPERTY()
    FDataObjectPtr LookAtConfig;
    UPROPERTY()
    FDataObjectPtr CameraState;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        FNameHandle_EntityBBVarEntity local_14;
        local_14;
        FECSEntity local_18 = Context.GetEntity().GetBB_Entity(local_14);
        FCameraOverrideParam local_106;
        local_106.SetLayer(this.CameraOverrideLayer);
        local_106.SetLookAtTargetEntity(local_18);
        local_106.SetLookAtTargetOffset(this.LookAtTargetOffset);
        local_106.SetLookAtTargetSocketName(this.LookAtTargetSocketName);
        local_106.SetLookAtConfig(this.LookAtConfig);
        local_106.SetCameraState(this.CameraState);
        ::FCameraOverrideUtils::AddLocalCameraOverrideLayer(Context.GetEntity(), local_106);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        ::FCameraOverrideUtils::RemoveLocalCameraOverrideLayer(Context.GetEntity(), this.CameraOverrideLayer);
        return;
    }
}

