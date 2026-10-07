

// NOTE: class defaults are not authored in this module: UESMAction_CameraShake (default scalar field UESMAction.NetSimulateMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_CameraShake : UESMBPBaseInstantAction
{
    UPROPERTY()
    FDataObjectPtr ConfigRef;
    UPROPERTY()
    bool bForSelfOnly = true;
    UPROPERTY()
    FVector3f SourcePositionOffset;


    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("з›ёжњєйњ‡еЉЁ: ").Append(this.ConfigRef.GetDataName());
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(3);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    void ViewDo_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Gizmos_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        FVector local_48 = 0.ToFTransform().TransformPosition(FVector(this.SourcePositionOffset));
        if (this.ConfigRef.IsValid())
        {
            FTPCameraShakeConfig local_52;
            TDataObjectPtr<FTPCameraShakeConfig> local_76 = TDataObjectPtr<FTPCameraShakeConfig>(this.ConfigRef);
            DebugDraw::DrawDebugSphere(Context.GetWorld(), local_48, 30.0f, 12, FColor::Red, true, -1.0f, uint8(0), 0.0f);
            DebugDraw::DrawDebugSphere(Context.GetWorld(), local_48, local_52.DistanceDecayInnerRadius, 12, FColor::Orange, true, -1.0f, uint8(0), 0.0f);
            DebugDraw::DrawDebugSphere(Context.GetWorld(), local_48, local_52.DistanceDecayOuterRadius, 12, FColor::Yellow, true, -1.0f, uint8(0), 0.0f);
        }
        return;
    }
}

struct FESSpanCameraShakeMrInstanceData
{
    FESSpanCameraShakeMrInstanceData()
    {
        return;
    }
}

class UESMAction_SpanCameraShake : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FDataObjectPtr ConfigRef;
    UPROPERTY()
    FVector3f SourcePositionOffset;
    UPROPERTY()
    bool bForSelfOnly = true;
    UPROPERTY()
    bool bAlignShakeTime = false;
    UPROPERTY()
    bool bAlignShakeTimeNormalized = false;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESSpanCameraShakeMrInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        if (this.bAlignShakeTimeNormalized)
        {
            return (int(InType) == 1);
        }
        return (int(InType) != 0);
    }
    UFUNCTION()
    bool NeedTick_Implementation() const
    {
        return this.bAlignShakeTime;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_1;
        float32 local_2;
        if (this.bAlignShakeTimeNormalized && ((FFPTime(Time.ActionDuration).opCmp(0.0) > 0)))
        {
            local_1 = float32((FFPTime(Time.ActionLastTime) / Time.ActionDuration));
            float32 local_10 = Time.ActionDuration;
            local_2 = Time.PlaySpeed / local_10;
        }
        else
        {
            local_1 = Time.ActionLastTime;
            local_2 = Time.PlaySpeed;
        }
        FCameraUtils::ManipulateCameraShakeTimeInternal(this.GetDataPathName(), Time.WorldLastTime, local_1, local_2);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    const FESSpanCameraShakeMrInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESSpanCameraShakeMrInstanceData __r;
        return __r;
    }
    FESSpanCameraShakeMrInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESSpanCameraShakeMrInstanceData __r;
        return __r;
    }
}

