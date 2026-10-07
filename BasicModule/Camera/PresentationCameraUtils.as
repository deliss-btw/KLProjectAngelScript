
enum EPresentationCameraType
{
    Fixed,
    SpringArm,
    Animated,
}

const FConsoleVariable CVar_AutoGeneratePresentationCameraName = FConsoleVariable();

struct FPresentationCameraConfig
{
    UPROPERTY()
    EPresentationCameraType CameraType;
    UPROPERTY()
    FName CameraName;
    UPROPERTY()
    TDataObjectPtr<FFixedCameraConfig> FixedCameraConfig;
    UPROPERTY()
    TDataObjectPtr<FTPCameraStateConfig> SpringArmCameraConfig;
    UPROPERTY()
    TDataObjectPtr<FAnimCameraData> AnimatedCameraConfig;
    UPROPERTY()
    FAnimatedCameraParamsInput AnimatedCameraParamsInput;


    bool IsValid() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
}

namespace PresentationCameraUtils
{
FName ResolveCameraName(const FName &inout ExplicitName, const FName &inout ConfigDataName)
{
    if (!((ExplicitName == NAME_None)))
    {
        return ExplicitName;
    }
    if (CVar_AutoGeneratePresentationCameraName.GetBool() && !((ConfigDataName == NAME_None)))
    {
        return ConfigDataName;
    }
    return NAME_None;
}
UFUNCTION()
void PopPresentationCameraByHandle(const FECSEntity &inout PlayerEntity, const FCameraHandle &inout Handle, const bool bClearLookAt = false)
{
    PresentationCameraUtils::PopPresentationCamera(PlayerEntity, Handle.GetName(), bClearLookAt);
    return;
}
UFUNCTION()
void PopPresentationCamera(const FECSEntity &inout PlayerEntity, const FName &inout CameraName, const bool bClearLookAt = false)
{
    int local_32 = 0;
    int local_54 = 0;
    if ((CameraName == NAME_None))
    {
        XWarning(ELog(22), FString().Append("PopPresentationCamera: CameraName is None"));
        return;
    }
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return;
    }
    PlayerEntity.IsValid();
    PlayerEntity.GetWorld().IsValid();
    if (!(FASCommonUtils::GetUniquePlayerEntity(PlayerEntity).IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerController is invalid"));
        return;
    }
    if (ECS::GetRuntimeInfo().IsServer || ECS::IsFixedFrameJob())
    {
        FECSWorldPtr local_10 = PlayerEntity.GetWorld();
        Get local_26;
        FFPTime local_22 = FFPTime(local_26.opCall().Time);
        FCameraEventData_PopPresentationCamera local_38;
        local_38.PairIndex.SetCameraName(CameraName);
        local_38.Time = local_22;
        local_32.GetCameraParamsContext().GetPendingCameraEventDatas().Enqueue(FInstancedStruct::Make(local_38));
        FC_LogicPresentationCameraEventChangeTag local_48;
        Assign local_46;
        local_46.opCall(local_48);
    }
    else
    {
        FFPTime local_22_2 = FFPTime(ECS::GetRuntimeInfo().Time);
        FCameraEventData_PopPresentationCamera local_38;
        local_38.PairIndex.SetCameraName(CameraName);
        local_38.Time = local_22_2;
        local_54.CameraParamsContext.GetPendingCameraEventDatas().Enqueue(FInstancedStruct::Make(local_38));
    }
    if (bClearLookAt)
    {
        FPresentationCameraModificationUtils::ClearPresentationCameraLookAt(PlayerEntity);
    }
    return;
}
UFUNCTION()
FCameraHandle PushPresentationFixedCamera(const FECSEntity &inout PlayerEntity, const FName &inout CameraName, const EPresentationCameraLayer Layer, const TDataObjectPtr<FFixedCameraConfig> &inout CameraConfig, const FECSEntity &inout FollowTarget)
{
    FName local_7;
    int local_40 = 0;
    int local_114 = 0;
    if (CameraConfig)
    {
        local_7 = CameraConfig.GetDataName();
    }
    else
    {
        local_7 = NAME_None;
    }
    FName local_5 = PresentationCameraUtils::ResolveCameraName(CameraName, local_7);
    if ((local_5 == NAME_None))
    {
        XWarning(ELog(22), FString().Append("PushPresentationFixedCamera: CameraName is None"));
        return PresentationCameraConstants::FCameraHandle_Invalid;
    }
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return PresentationCameraConstants::FCameraHandle_Invalid;
    }
    FECSEntity local_20 = FASCommonUtils::GetUniquePlayerEntity(PlayerEntity);
    if (!(local_20.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerController is invalid"));
        return PresentationCameraConstants::FCameraHandle_Invalid;
    }
    if (ECS::GetRuntimeInfo().IsServer || ECS::IsFixedFrameJob())
    {
        FECSWorldPtr local_30 = PlayerEntity.GetWorld();
        Get local_34;
        FFPTime local_28 = FFPTime(local_34.opCall().Time);
        FCameraEventData_PushFixedCamera local_74;
        local_74.Params.CameraConfig = CameraConfig;
        local_74.Params.FollowTarget = FollowTarget;
        local_74.Params.StartTime = local_28;
        local_74.Params.SetCameraName(local_5);
        local_74.Params.SetLayer(EPresentationCameraLayer(Layer));
        local_40.GetCameraParamsContext().GetPendingCameraEventDatas().Enqueue(FInstancedStruct::Make(local_74));
        FC_LogicPresentationCameraEventChangeTag local_108;
        Assign local_106;
        local_106.opCall(local_108);
    }
    else
    {
        FFPTime local_28_2 = FFPTime(ECS::GetRuntimeInfo().Time);
        FCameraEventData_PushFixedCamera local_74;
        local_74.Params.CameraConfig = CameraConfig;
        local_74.Params.FollowTarget = FollowTarget;
        local_74.Params.StartTime = local_28_2;
        local_74.Params.SetCameraName(local_5);
        local_74.Params.SetLayer(EPresentationCameraLayer(Layer));
        local_114.CameraParamsContext.GetPendingCameraEventDatas().Enqueue(FInstancedStruct::Make(local_74));
    }
    return FCameraHandle(local_5);
}
UFUNCTION()
FCameraHandle PushPresentationSpringArmCamera(const FECSEntity &inout PlayerEntity, const FName &inout CameraName, const EPresentationCameraLayer Layer, const TDataObjectPtr<FTPCameraStateConfig> &inout CameraConfig)
{
    FName local_7;
    int local_40 = 0;
    int local_110 = 0;
    if (CameraConfig)
    {
        local_7 = CameraConfig.GetDataName();
    }
    else
    {
        local_7 = NAME_None;
    }
    FName local_5 = PresentationCameraUtils::ResolveCameraName(CameraName, local_7);
    if ((local_5 == NAME_None))
    {
        XWarning(ELog(22), FString().Append("PushPresentationSpringArmCamera: CameraName is None"));
        return PresentationCameraConstants::FCameraHandle_Invalid;
    }
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return PresentationCameraConstants::FCameraHandle_Invalid;
    }
    FECSEntity local_20 = FASCommonUtils::GetUniquePlayerEntity(PlayerEntity);
    if (!(local_20.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerController is invalid"));
        return PresentationCameraConstants::FCameraHandle_Invalid;
    }
    if (ECS::GetRuntimeInfo().IsServer || ECS::IsFixedFrameJob())
    {
        FECSWorldPtr local_30 = PlayerEntity.GetWorld();
        Get local_34;
        FFPTime local_28 = FFPTime(local_34.opCall().Time);
        FCameraEventData_PushSpringArmCamera local_70;
        local_70.Params.CameraConfig = CameraConfig;
        local_70.Params.StartTime = local_28;
        local_70.Params.SetCameraName(local_5);
        local_70.Params.SetLayer(EPresentationCameraLayer(Layer));
        local_40.GetCameraParamsContext().GetPendingCameraEventDatas().Enqueue(FInstancedStruct::Make(local_70));
        FC_LogicPresentationCameraEventChangeTag local_104;
        Assign local_102;
        local_102.opCall(local_104);
    }
    else
    {
        FFPTime local_28_2 = FFPTime(ECS::GetRuntimeInfo().Time);
        FCameraEventData_PushSpringArmCamera local_70;
        local_70.Params.CameraConfig = CameraConfig;
        local_70.Params.StartTime = local_28_2;
        local_70.Params.SetCameraName(local_5);
        local_70.Params.SetLayer(EPresentationCameraLayer(Layer));
        local_110.CameraParamsContext.GetPendingCameraEventDatas().Enqueue(FInstancedStruct::Make(local_70));
    }
    return FCameraHandle(local_5);
}
UFUNCTION()
FCameraHandle PushPresentationAnimatedCamera(const FECSEntity &inout PlayerEntity, const FName &inout CameraName, const EPresentationCameraLayer Layer, const TDataObjectPtr<FAnimCameraData> &inout CameraConfig, const FAnimatedCameraParamsInput &inout ParamsInput)
{
    FName local_7;
    int local_40 = 0;
    int local_116 = 0;
    if (CameraConfig)
    {
        local_7 = CameraConfig.GetDataName();
    }
    else
    {
        local_7 = NAME_None;
    }
    FName local_5 = PresentationCameraUtils::ResolveCameraName(CameraName, local_7);
    if ((local_5 == NAME_None))
    {
        XWarning(ELog(22), FString().Append("PushPresentationAnimatedCamera: CameraName is None"));
        return PresentationCameraConstants::FCameraHandle_Invalid;
    }
    if (!(PlayerEntity.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerEntity is invalid"));
        return PresentationCameraConstants::FCameraHandle_Invalid;
    }
    FECSEntity local_20 = FASCommonUtils::GetUniquePlayerEntity(PlayerEntity);
    if (!(local_20.IsValid()))
    {
        XLog(ELog(22), FString().Append("PlayerController is invalid"));
        return PresentationCameraConstants::FCameraHandle_Invalid;
    }
    if (ECS::GetRuntimeInfo().IsServer || ECS::IsFixedFrameJob())
    {
        FECSWorldPtr local_30 = PlayerEntity.GetWorld();
        Get local_34;
        FFPTime local_28 = FFPTime(local_34.opCall().Time);
        FCameraEventData_PushAnimatedCamera local_76;
        local_76.Params.CopyFromParamsInput(ParamsInput);
        local_76.Params.CameraConfig = CameraConfig;
        local_76.Params.SetLayer(EPresentationCameraLayer(Layer));
        local_76.Params.SetCameraName(local_5);
        local_76.Params.StartTime = local_28;
        local_40.GetCameraParamsContext().GetPendingCameraEventDatas().Enqueue(FInstancedStruct::Make(local_76));
        FC_LogicPresentationCameraEventChangeTag local_110;
        Assign local_108;
        local_108.opCall(local_110);
    }
    else
    {
        FFPTime local_28_2 = FFPTime(ECS::GetRuntimeInfo().Time);
        FCameraEventData_PushAnimatedCamera local_76;
        local_76.Params.CopyFromParamsInput(ParamsInput);
        local_76.Params.CameraConfig = CameraConfig;
        local_76.Params.SetLayer(EPresentationCameraLayer(Layer));
        local_76.Params.SetCameraName(local_5);
        local_76.Params.StartTime = local_28_2;
        local_116.CameraParamsContext.GetPendingCameraEventDatas().Enqueue(FInstancedStruct::Make(local_76));
    }
    return FCameraHandle(local_5);
}
FCameraHandle PushPresentationCameraByConfig(const FECSEntity &inout PlayerEntity, const FName &inout CameraName, const EPresentationCameraLayer Layer, const FPresentationCameraConfig &inout CameraConfig, const FECSEntity &inout FixedCameraFollowTarget)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FCameraHandle __r; return __r;
}
void GenericLerp(const FCameraResult &inout A, const FCameraResult &inout B, FCameraResult &inout Out, const float32 WeightToB)
{
    Out.Position = FMath::Lerp(WeightToB, B.Position, A);
    FQuat4f local_20 = FQuat4f::Slerp(A.Rotation.Quaternion(), B.Rotation.Quaternion(), WeightToB);
    Out.Rotation = local_20.Rotator();
    float32 local_24 = FMath::Lerp(A.FOV, Out.Rotation, WeightToB);
    return;
}
void WriteToCameraResult(FCameraResult &inout CameraResult, const FC_Camera &inout Camera)
{
    CameraResult = FVector3f(Camera.GetPosition());
    CameraResult.Rotation = FRotator3f(Camera.GetRotation());
    float32 local_7 = Camera.GetFOV();
    return;
}
void WriteToCameraComp(FC_Camera &inout Camera, const FCameraResult &inout CameraResult)
{
    Camera.SetPosition(FVector(CameraResult.Position));
    Camera.SetRotation(FRotator(CameraResult.Rotation));
    Camera.SetFOV(CameraResult.FOV);
    return;
}
}
