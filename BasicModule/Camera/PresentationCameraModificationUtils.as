
namespace FPresentationCameraModificationUtils
{
FFPTime GetCurrentRequestTime(const FECSEntity &inout Entity)
{
    if (ECS::GetRuntimeInfo().IsServer || ECS::IsFixedFrameJob())
    {
        return FECSWorldPtr::Get<FCS_FixedTime>(Entity.GetWorld()).opCall().Time;
    }
    return ECS::GetRuntimeInfo().Time;
}
void EnqueueModifierEventData(const FECSEntity &inout PlayerEntity, const FInstancedStruct &inout EventData)
{
    int local_32 = 0;
    int local_46 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return;
    }
    FECSEntity local_12;
    Has local_16;
    bool local_1 = local_16.opCall();
    if (local_1)
    {
        local_12 = PlayerEntity;
    }
    else
    {
        Has local_20;
        bool local_1_2 = local_20.opCall();
        if (local_1_2)
        {
            Get local_24;
            local_12 = local_24.opCall().GetPlayerEntity();
        }
    }
    if (!(local_12.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerController is invalid"));
        return;
    }
    if (ECS::GetRuntimeInfo().IsServer || ECS::IsFixedFrameJob())
    {
        local_32.GetParams().GetPendingCameraModifierEventDatas().Add(EventData);
        FC_LogicPresentationCameraModificationEventChangeTag local_40;
        Assign local_38;
        local_38.opCall(local_40);
    }
    else
    {
        local_46.Params.GetPendingCameraModifierEventDatas().Add(EventData);
    }
    return;
}
UFUNCTION()
void ApplyPresentationCameraLookAtTarget(const FECSEntity &inout PlayerEntity, const FECSEntity &inout LookAtTargetEntity, const FVector &inout LookAtSocketOffset, const FName &inout LookAtTargetSocketName, const bool bContributeToInput, const TDataObjectPtr<FCameraLookAtTargetConfig> &inout LookAtConfig, const bool bOverrideWorldDir = false, const FVector &inout OverrideWorldDir = FVector::ZeroVector)
{
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return;
    }
    FCameraModifierEventData_PresentationCameraLookAtTarget local_54;
    local_54.LookAtTargetEntity = LookAtTargetEntity;
    local_54.LookAtSocketOffset = LookAtSocketOffset;
    local_54.LookAtTargetSocketName = LookAtTargetSocketName;
    local_54.bContributeInput = bContributeToInput;
    local_54.LookAtConfig = LookAtConfig;
    local_54.bOverrideWorldDir = bOverrideWorldDir;
    local_54.OverrideWorldDir = OverrideWorldDir;
    local_54.RequestTime = FPresentationCameraModificationUtils::GetCurrentRequestTime(PlayerEntity);
    FPresentationCameraModificationUtils::EnqueueModifierEventData(PlayerEntity, FInstancedStruct::Make(local_54));
    return;
}
UFUNCTION()
void ApplyPresentationCameraLookAt(const FECSEntity &inout PlayerEntity, const FVector &inout Location, const FVector &inout LocationOffset, const bool bContributeToInput, const TDataObjectPtr<FCameraLookAtTargetConfig> &inout LookAtConfig)
{
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return;
    }
    FCameraModifierEventData_PresentationCameraLookAtLocation local_48;
    local_48.Location = Location;
    local_48.LocationOffset = LocationOffset;
    local_48.bContributeInput = bContributeToInput;
    local_48.LookAtConfig = LookAtConfig;
    local_48.RequestTime = FPresentationCameraModificationUtils::GetCurrentRequestTime(PlayerEntity);
    FPresentationCameraModificationUtils::EnqueueModifierEventData(PlayerEntity, FInstancedStruct::Make(local_48));
    return;
}
UFUNCTION()
void ClearPresentationCameraLookAt(const FECSEntity &inout PlayerEntity)
{
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return;
    }
    FCameraModifierEventData_ClearPresentationCameraLookAt local_8;
    FPresentationCameraModificationUtils::EnqueueModifierEventData(PlayerEntity, FInstancedStruct::Make(local_8));
    return;
}
UFUNCTION()
void ApplyPresentationCameraModifier(const FECSEntity &inout PlayerEntity, const FName &inout SourceIdentifier, const FTPCameraModifierConfigRef &inout ModifierConfigRef, const float32 OverrideEnterDuration = -1.0f)
{
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return;
    }
    FCameraModifierEventData_StartPresentationModifier local_42;
    local_42.TargetEntity = PlayerEntity;
    local_42.SourceIdentifier = SourceIdentifier;
    local_42.ModifierConfig = ModifierConfigRef;
    local_42.OverrideEnterDuration = OverrideEnterDuration;
    local_42.RequestTime = FPresentationCameraModificationUtils::GetCurrentRequestTime(PlayerEntity);
    FPresentationCameraModificationUtils::EnqueueModifierEventData(PlayerEntity, FInstancedStruct::Make(local_42));
    return;
}
UFUNCTION()
void ClearPresentationCameraModifier(const FECSEntity &inout PlayerEntity, const FName &inout SourceIdentifier, const FTPCameraModifierConfigRef &inout ModifierConfigRef, const float32 OverrideExitDuration = -1.0f, const bool bWarnIfNotExists = true)
{
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return;
    }
    FCameraModifierEventData_StopPresentationModifier local_42;
    local_42.TargetEntity = PlayerEntity;
    local_42.SourceIdentifier = SourceIdentifier;
    local_42.ModifierConfig = ModifierConfigRef;
    local_42.OverrideExitDuration = OverrideExitDuration;
    local_42.bWarnIfNotExists = bWarnIfNotExists;
    local_42.RequestTime = FPresentationCameraModificationUtils::GetCurrentRequestTime(PlayerEntity);
    FPresentationCameraModificationUtils::EnqueueModifierEventData(PlayerEntity, FInstancedStruct::Make(local_42));
    return;
}
void StartPresentationCameraModifierInner(const FECSEntity &inout TargetEntity, const FFPTime &inout RequestTime, const FName &inout SourceIdentifier, const FTPCameraModifierConfigRef &inout ModifierConfigRef, const float32 OverrideEnterDuration)
{
    FCameraUtils::StartPresentationModifier(TargetEntity, RequestTime, SourceIdentifier, ModifierConfigRef, OverrideEnterDuration);
    return;
}
void StopPresentationCameraModifierInner(const FECSEntity &inout TargetEntity, const FFPTime &inout RequestTime, const FName &inout SourceIdentifier, const FTPCameraModifierConfigRef &inout ModifierConfigRef, const float32 OverrideExitDuration, const bool bWarnIfNotExists)
{
    FCameraUtils::StopPresentationModifier(TargetEntity, RequestTime, SourceIdentifier, ModifierConfigRef, OverrideExitDuration, bWarnIfNotExists);
    return;
}
void ClearPresentationCameraLookAtInner(FPresentationCameraLookAtParams &inout OutLookAtParams)
{
    OutLookAtParams.SetValid(false);
    return;
}
void ResolvePresentationCameraLookAt(const FECSEntity &inout PlayerEntity)
{
    int local_30 = 0;
    int local_32 = 0;
    int local_44 = 0;
    bool local_1 = false;
    bool local_3 = false;
    Has local_8;
    bool local_2 = local_8.opCall();
    if (local_2)
    {
        Get local_12;
        local_1 = local_12.opCall().GetParams().GetLookAtParams().IsValid();
    }
    Has local_16;
    bool local_2_2 = local_16.opCall();
    if (local_2_2)
    {
        Get local_20;
        local_3 = local_20.opCall().Params.GetLookAtParams().IsValid();
    }
    if (!(local_1) && !(local_3))
    {
        Remove local_26;
        local_26.opCall();
        return;
    }
    bool local_27 = false;
    if (local_1 && local_3)
    {
        local_27 = (local_30.opCmp(local_32) >= 0);
    }
    else
    {
        local_27 = local_1;
    }
    Has local_38;
    bool local_2_3 = local_38.opCall();
    if (local_27)
    {
        Get local_12;
        local_44.LookAtParams.CopyFrom(local_12.opCall().GetParams().GetLookAtParams());
    }
    else
    {
        Get local_20;
        local_44.LookAtParams.CopyFrom(local_20.opCall().Params.GetLookAtParams());
    }
    if (!(local_2_3))
    {
        local_44.LookAtParams.SetSmoothedLocation(local_44.LookAtParams.GetLocation());
    }
    return;
}
FRotator3f CalculatePresentationLookAtDirectionWithState(const FVector &inout PawnPosition, const FVector &inout CameraLookAtLocation, const FTPCameraStateParams &inout StateParams, const FRotator3f &inout FinalDir, const FRotator3f &inout BaseDirForPitchProtection, const FCameraLookAtConfig &inout LookAtConfig, const bool bDisableLookAtOriginOffset = false)
{
    FVector local_6 = PawnPosition;
    FVector3f local_9 = FVector3f(FVector3f::ZeroVector);
    if (!(bDisableLookAtOriginOffset))
    {
        float32 local_13;
        float32 local_14 = StateParams.GetTargetOffset().X;
        local_13 = (StateParams.GetArmLength() - StateParams.GetSocketOffset().X) - local_14;
        FVector3f local_20 = FinalDir.Vector();
        local_14 = 0.0f;
        float32 local_11 = -local_13;
        local_9 = (local_20.GetSafeNormal(1e-8f, FVector3f::ZeroVector) * local_11);
        local_6 += FVector(local_9);
    }
    FVector3f local_17 = FVector3f((CameraLookAtLocation - local_6));
    if (local_17.SizeSquared2D() < FMath::Square(LookAtConfig.MinDistanceProtectionForPitch))
    {
        float32 local_13;
        local_13 = local_17.Z;
        if ((local_17.X == 0.0f && ((local_17.Y == 0.0f))))
        {
            float32 local_11_2 = LookAtConfig.MinDistanceProtectionForPitch;
            local_17 = (BaseDirForPitchProtection.Vector() * local_11_2);
        }
        else
        {
            local_17 = (local_17.GetSafeNormal(1e-8f, FVector3f::ZeroVector) * LookAtConfig.MinDistanceProtectionForPitch);
        }
    }
    FRotator3f local_40;
    if (LookAtConfig.LookAtYawOffsetRadiusRatio != 1.0f)
    {
        float32 local_11_4 = 1.0f;
        float32 local_14_2 = local_11_4 - LookAtConfig.LookAtYawOffsetRadiusRatio;
        FVector3f local_20_2 = (local_17 + (local_9 * local_14_2));
        local_11_4 = local_17.ToOrientationRotator().Pitch;
        local_14_2 = local_20_2.ToOrientationRotator().Yaw;
    }
    else
    {
        local_40 = local_17.ToOrientationRotator();
    }
    return local_40;
}
float32 SmoothLookAtYawPresentation(const float32 DeltaTime, const float32 InOutLookAtDirYaw, const float32 CurCamDirYaw, const float32 YawVelocity, const float32 YawTolerance, const float32 YawToleranceHard, const FCameraBlendSpeed &inout LookAtYawSpeed, float32 &inout OutYawVelocity)
{
    float32 local_1 = InOutLookAtDirYaw;
    float32 local_2 = CurCamDirYaw;
    float32 local_4 = FRotator3f::NormalizeAxis((local_1 - local_2));
    if (YawToleranceHard >= 0.0f && (FMath::Abs(local_4) > YawToleranceHard))
    {
        float32 local_3 = FMath::Sign(local_4) * YawToleranceHard;
        local_2 = local_1 - local_3;
        local_3 = FMath::Sign(local_4);
        local_3 = local_3 * FMath::Min(YawTolerance, YawToleranceHard);
        local_1 = local_1 - local_3;
    }
    else
    {
        if (FMath::Abs(local_4) > YawTolerance)
        {
            local_1 = local_1 - (FMath::Sign(local_4) * YawTolerance);
        }
        else
        {
            local_1 = local_2;
        }
    }
    return LookAtYawSpeed.SmoothOutDegree(DeltaTime, local_1, local_2, YawVelocity, OutYawVelocity);
}
void ApplyPresentationSpringArmLookAtSmooth(const FVector &inout Position, const FC_PresentationCameraLookAt &inout PresentationLookAt, FPresentationCameraLookAtRuntimeData &inout LookAtMod, const FTPCameraStateParams &inout StateParams, FCS_TPCameraParam &inout CameraParam, const float32 DeltaTime, const FC_TPCameraLookAtTweaks &inout LookAtTweak, const FCameraLookAtConfig &inout LookAtConfig, const FCameraLookAtTargetConfig &inout LookAtTargetConfig, const FECSEntity &inout PlayerPawnEntity, float32 &inout OutLookAtArmLengthRatio, float32 &inout OutPitchRelatedFollowHeightOffset)
{
    float32 local_18;
    float32 local_28;
    float32 local_31;
    FRotator3f local_10;
    if (LookAtMod.bHasBaseDir)
    {
        local_10 = LookAtMod.BaseDir;
    }
    else
    {
        local_10 = FRotator3f(CameraParam.InputDir);
    }
    FRotator3f local_3 = FPresentationCameraModificationUtils::CalculatePresentationLookAtDirectionWithState(Position, PresentationLookAt.LookAtParams.GetSmoothedLocation(), StateParams, local_10, local_10, LookAtConfig, LookAtTweak.GetbDisableLookAtOriginOffset());
    FRotator3f local_13;
    if (LookAtMod.bHasBaseDir)
    {
        local_13 = LookAtMod.BaseDir;
    }
    else
    {
        local_13 = FRotator3f(CameraParam.InputDir);
    }
    LookAtMod.bHasBaseDir = true;
    float32 local_17 = 1.0f;
    float32 local_19 = 1.0f;
    FCameraBlendSpeed local_23 = FCameraBlendSpeed(LookAtConfig.LookAtYawSpeed);
    FCameraBlendSpeed local_27 = FCameraBlendSpeed(LookAtConfig.LookAtPitchSpeed);
    if (LookAtTargetConfig.GetbOverrideLockYawTolerance())
    {
        local_18 = LookAtTargetConfig.OverrideYawTolerance;
    }
    else
    {
        local_18 = LookAtConfig.LookAtYawTolerance;
    }
    if (LookAtTargetConfig.GetbOverrideLockYawToleranceHard())
    {
        local_28 = LookAtTargetConfig.OverrideYawToleranceHard;
    }
    else
    {
        local_28 = LookAtConfig.LookAtYawToleranceHard;
    }
    if (LookAtConfig.bUseLookAtYawToleranceDistanceCurve)
    {
        local_31 = LookAtConfig.LookAtYawToleranceDistanceCurve.GetFloatValue(float32(Position.Distance(PresentationLookAt.LookAtParams.GetSmoothedLocation())), 0.0f);
        local_18 = local_18 * local_31;
        if (local_28 >= 0.0f)
        {
            local_28 = local_28 * local_31;
        }
    }
    if (LookAtTweak.GetbSnapToLookAtTarget())
    {
        local_18 = 0.0f;
    }
    if (LookAtTweak.GetbOverrideLookAtYawSpeed())
    {
        local_23 = LookAtTweak.LookAtYawSpeed;
    }
    if (LookAtTweak.GetbOverrideLookAtPitchSpeed())
    {
        local_27 = LookAtTweak.LookAtPitchSpeed;
    }
    if (LookAtTweak.GetbUseCustomLookAtYaw())
    {
        if (LookAtTweak.GetbCustomLookAtYawAdditive())
        {
            float32 local_29 = local_3.Yaw + LookAtTweak.CustomLookAtYaw;
        }
        else
        {
            FRotator local_72;
            Has local_46;
            bool local_4 = local_46.opCall();
            if (local_4)
            {
                Get local_50;
                local_72 = local_50.opCall().GetRotation().Rotator();
            }
            else
            {
                Get local_60;
                local_72 = local_60.opCall().GetRotation().Rotator();
            }
            float local_34_2 = local_72.Yaw;
            float32 local_29_2 = LookAtTweak.CustomLookAtYaw;
            local_34_2 = local_34_2 + local_29_2;
            float32 local_35_2 = float32(local_34_2);
        }
    }
    float32 local_30 = LookAtMod.DirVelocity.Yaw;
    float32 local_35_3 = LookAtMod.DirVelocity.Yaw;
    float32 local_29_3 = local_13.Yaw;
    LookAtMod.BaseDir.Yaw = FPresentationCameraModificationUtils::SmoothLookAtYawPresentation(DeltaTime, local_3.Yaw, local_29_3, local_35_3, local_18, local_28, local_23, local_30);
    LookAtMod.DirVelocity.Yaw = local_30;
    local_31 = local_3.Pitch;
    if (!(LookAtTweak.GetbSnapToLookAtTarget()) == !(false))
    {
        if (LookAtConfig.bUseLockAtPitchMappingCurve)
        {
            local_17 = LookAtConfig.LookAtArmLengthRatioPitchMappingCurve.GetFloatValue(local_31, 0.0f);
            local_19 = LookAtConfig.LookAtPitchRelatedHeightOffsetCurve.GetFloatValue(local_31, 0.0f);
            float32 local_76 = LookAtConfig.LookAtPitchMappingCurve.GetFloatValue(local_31, 0.0f);
        }
        local_35_3 = PresentationLookAt.LookAtParams.GetPitchCompensation();
        float32 local_76_2 = local_3.Pitch;
        float32 local_75_2 = local_76_2 + local_35_3;
    }
    if (LookAtTweak.GetbUseCustomLookAtPitch())
    {
        if (LookAtTweak.GetbCustomLookAtPitchAdditive())
        {
            local_35_3 = LookAtTweak.CustomLookAtPitch;
            float32 local_76_3 = local_3.Pitch + local_35_3;
        }
        else
        {
            local_35_3 = LookAtTweak.CustomLookAtPitch;
        }
    }
    float32 local_78 = LookAtMod.DirVelocity.Pitch;
    local_35_3 = LookAtMod.DirVelocity.Pitch;
    float32 local_76_4 = local_13.Pitch;
    LookAtMod.BaseDir.Pitch = local_27.SmoothOut(DeltaTime, local_3.Pitch, local_76_4, local_35_3, local_78);
    LookAtMod.DirVelocity.Pitch = local_78;
    LookAtMod.BaseDir.Roll = 0.0f;
    OutLookAtArmLengthRatio = local_17;
    OutPitchRelatedFollowHeightOffset = local_19;
    return;
}
void ApplyPresentationCameraLookAtInner(FPresentationCameraLookAtParams &inout OutLookAtParams, const FECSEntity &inout PlayerEntity, const FECSEntity &inout LookAtTargetEntity, const FVector &inout LookAtSocketOffset, const FName &inout LookAtTargetSocketName, const bool bContributeToInput, const TDataObjectPtr<FCameraLookAtTargetConfig> &inout LookAtConfig, const FFPTime &inout RequestTime, const bool bOverrideWorldDir = false, const FVector &inout OverrideWorldDir = FVector::ZeroVector)
{
    OutLookAtParams.SetLookAtTargetEntity(LookAtTargetEntity);
    OutLookAtParams.SetLookAtSocketOffset(FVector3f(LookAtSocketOffset));
    OutLookAtParams.SetLookAtTargetSocketName(LookAtTargetSocketName);
    OutLookAtParams.SetbContributeInput(bContributeToInput);
    OutLookAtParams.SetLookAtTargetConfigRef(LookAtConfig.opImplConv());
    OutLookAtParams.SetbOverrideWorldDir(bOverrideWorldDir);
    OutLookAtParams.SetOverrideWorldDir(FVector3f(OverrideWorldDir));
    FVector local_40 = FPresentationCameraModificationUtils::ComputePresentationLookAtTargetLocation(LookAtTargetEntity, FVector::ZeroVector, LookAtSocketOffset, LookAtTargetSocketName, bOverrideWorldDir, OverrideWorldDir);
    OutLookAtParams.SetLocation(local_40);
    OutLookAtParams.SetSmoothedLocation(local_40);
    OutLookAtParams.SetRequestTime(RequestTime);
    OutLookAtParams.SetValid(true);
    return;
}
void ApplyPresentationCameraLookAtInner(FPresentationCameraLookAtParams &inout OutLookAtParams, const FECSEntity &inout PlayerEntity, const FVector &inout Location, const FVector &inout LocationOffset, const bool bContributeToInput, const TDataObjectPtr<FCameraLookAtTargetConfig> &inout LookAtConfig, const FFPTime &inout RequestTime)
{
    OutLookAtParams.SetLookAtTargetEntity(FECSEntity());
    OutLookAtParams.SetLocation(Location);
    OutLookAtParams.SetLocationOffset(FVector3f(LocationOffset));
    OutLookAtParams.SetSmoothedLocation((Location + LocationOffset));
    OutLookAtParams.SetbContributeInput(bContributeToInput);
    OutLookAtParams.SetLookAtTargetConfigRef(LookAtConfig.opImplConv());
    OutLookAtParams.SetRequestTime(RequestTime);
    OutLookAtParams.SetValid(true);
    return;
}
FVector ComputePresentationLookAtTargetLocation(const FECSEntity &inout LookAtTargetEntity, const FVector &inout LookAtTargetLocation, const FVector &inout LookAtTargetOffset, const FName &inout LookAtTargetSocketName, const bool bOverrideWorldDir = false, const FVector &inout OverrideWorldDir = FVector::ZeroVector)
{
    AActor local_22;
    FVector local_6 = LookAtTargetLocation;
    bool local_8 = false;
    bool local_7 = local_8;
    if (LookAtTargetEntity.IsValid())
    {
        if (!(!(LookAtTargetSocketName.IsNone())))
        {
            local_8 = false;
        }
        else
        {
            Has local_12;
            local_8 = local_12.opCall();
        }
        if (local_8)
        {
            AActor local_20;
            local_22 = local_20;
            if (local_22 != nullptr && local_22.DoesSocketExist(LookAtTargetSocketName))
            {
                FTransform local_76 = local_22.GetSocketTransform(LookAtTargetSocketName, ERelativeTransformSpace(0));
                if (bOverrideWorldDir)
                {
                    local_6 = (local_76.GetLocation() + OverrideWorldDir.Rotation().RotateVector(LookAtTargetOffset));
                }
                else
                {
                    local_6 = local_76.TransformPosition(LookAtTargetOffset);
                }
                local_7 = true;
            }
        }
        if (!(local_7))
        {
            Get local_104;
            const FC_Transform& local_106 = local_104.opCall();
            if (local_106)
            {
                if (bOverrideWorldDir)
                {
                    local_6 = (local_106.ToFTransform().GetLocation() + OverrideWorldDir.Rotation().RotateVector(LookAtTargetOffset));
                }
                else
                {
                    local_6 = local_106.ToFTransform().TransformPosition(LookAtTargetOffset);
                }
            }
        }
    }
    return local_6;
}
}
