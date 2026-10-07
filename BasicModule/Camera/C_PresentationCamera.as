
namespace PresentationCameraConstants
{
    const int DefaultPresentationStackCapacity = 8;
    const FCameraPairIndex FCameraPairIndex_Invalid = FCameraPairIndex();
    const FCameraHandle FCameraHandle_Invalid = FCameraHandle();
}
namespace __INTENRAL_FC_LogicCachePresentationCameraContext_NS
{
    const TECSComponentDerivedPtr<FC_LogicCachePresentationCameraContext> DerivedPtr = TECSComponentDerivedPtr<FC_LogicCachePresentationCameraContext>();
    const FC_LogicCachePresentationCameraContext DefaultValue = FC_LogicCachePresentationCameraContext();
}
namespace __INTENRAL_FC_PresentationCameraContext_NS
{
    const TECSComponentDerivedPtr<FC_PresentationCameraContext> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationCameraContext>();
    const FC_PresentationCameraContext DefaultValue = FC_PresentationCameraContext();
}
namespace __INTENRAL_FC_InitPresentationCameraContextTag_NS
{
    const TECSComponentDerivedPtr<FC_InitPresentationCameraContextTag> DerivedPtr = TECSComponentDerivedPtr<FC_InitPresentationCameraContextTag>();
    const FC_InitPresentationCameraContextTag DefaultValue = FC_InitPresentationCameraContextTag();
}
namespace __INTENRAL_FC_KillZoneCameraFreezeTag_NS
{
    const TECSComponentDerivedPtr<FC_KillZoneCameraFreezeTag> DerivedPtr = TECSComponentDerivedPtr<FC_KillZoneCameraFreezeTag>();
    const FC_KillZoneCameraFreezeTag DefaultValue = FC_KillZoneCameraFreezeTag();
}
namespace __INTENRAL_FC_LogicPresentationCameraEventChangeTag_NS
{
    const TECSComponentDerivedPtr<FC_LogicPresentationCameraEventChangeTag> DerivedPtr = TECSComponentDerivedPtr<FC_LogicPresentationCameraEventChangeTag>();
    const FC_LogicPresentationCameraEventChangeTag DefaultValue = FC_LogicPresentationCameraEventChangeTag();

}
struct FCameraHandle
{
    UPROPERTY()
    FName m_Name;

    FCameraHandle()
    {
        return;
    }
    FCameraHandle(const FName &inout InName)
    {
        this.SetName(InName);
        return;
    }
    bool IsValid() const
    {
        return (!((this.GetName() == NAME_None)));
    }
    bool opEquals(const FCameraHandle &inout Other) const
    {
        return (this.GetName() == Other.GetName());
    }
    uint Hash() const
    {
        return this.GetName().GetHash();
    }
    FName GetName() const property
    {
        return this;
    }
    void SetName(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FCameraPairIndex
{
    UPROPERTY()
    ECameraType m_CameraType;
    UPROPERTY()
    FName m_CameraName;

    FCameraPairIndex()
    {
        return;
    }
    FCameraPairIndex(const FName &inout InCameraName)
    {
        this.SetCameraName(InCameraName);
        return;
    }
    FCameraPairIndex(const ECameraType InCameraType, const FName &inout InCameraName)
    {
        this.SetCameraType(ECameraType(InCameraType));
        this.SetCameraName(InCameraName);
        return;
    }
    bool Equals(const FCameraPairIndex &inout Other) const
    {
        return (this.GetCameraName() == Other.GetCameraName());
    }
    bool opEquals(const FCameraPairIndex &inout Other) const
    {
        return this.Equals(Other);
    }
    uint Hash() const
    {
        return (HashCombine(0, this.GetCameraName().GetHash()));
    }
    bool IsValid() const
    {
        return (!((this == PresentationCameraConstants::FCameraPairIndex_Invalid)));
    }
    ECameraType GetCameraType() const property
    {
        return this.m_CameraType;
    }
    void SetCameraType(const ECameraType __Value) property
    {
        this.m_CameraType = __Value;
        return;
    }
    FName GetCameraName() const property
    {
        return this.m_CameraName;
    }
    void SetCameraName(const FName &inout __Value) property
    {
        this.m_CameraName = __Value;
        return;
    }
}

struct FCameraPairIndexStack
{
    UPROPERTY()
    TArray<FCameraPairIndex> m_CameraPairIndexes;

    FCameraPairIndexStack()
    {
        this.GetCameraPairIndexes().Reserve(8);
        return;
    }
    bool IsEmpty() const
    {
        return (this.GetCameraPairIndexes().Num() == 0);
    }
    void Push(const FCameraPairIndex &inout CameraPairIndex)
    {
        this.GetCameraPairIndexes().Add(CameraPairIndex);
        return;
    }
    FCameraPairIndex Pop()
    {
        if (this.IsEmpty())
        {
            return PresentationCameraConstants::FCameraPairIndex_Invalid;
        }
        FCameraPairIndex local_6;
        local_6 = this.GetCameraPairIndexes().Last(0);
        this.GetCameraPairIndexes().RemoveAt((this.GetCameraPairIndexes().Num() - 1));
        return local_6;
    }
    FCameraPairIndex GetTop() const
    {
        if (this.IsEmpty())
        {
            return PresentationCameraConstants::FCameraPairIndex_Invalid;
        }
        return this.GetCameraPairIndexes().Last(0);
    }
    bool Remove(const FCameraPairIndex &inout CameraPairIndex)
    {
        return (0 > 0);
    }
    const TArray<FCameraPairIndex> GetCameraPairIndexes() const property
    {
        const TArray<FCameraPairIndex> __r;
        return __r;
    }
    TArray<FCameraPairIndex> GetCameraPairIndexes() property
    {
        TArray<FCameraPairIndex> __r;
        return __r;
    }
    void SetCameraPairIndexes(const TArray<FCameraPairIndex> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FPresentationCameraParamsContext
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, FFixedCameraParams> m_FixedCameras;
    UPROPERTY()
    TMap<FName, FSpringArmCameraParams> m_SpringArmCameras;
    UPROPERTY()
    TMap<FName, FAnimatedCameraParams> m_AnimatedCameras;
    UPROPERTY()
    TArray<FCameraPairIndexStack> m_CameraLayeredStack;
    UPROPERTY()
    bool m_bMarkContextChanged;
    UPROPERTY()
    FCameraInstancedStructQueue m_PendingCameraEventDatas;

    FPresentationCameraParamsContext()
    {
        this.m_bMarkContextChanged = false;
        this.GetModify_CameraLayeredStack().SetNum(7);
        return;
    }
    FPresentationCameraParamsContext(const FPresentationCameraParamsContext &inout Other)
    {
        this.m_bMarkContextChanged = false;
        this.m_FixedCameras = Other.m_FixedCameras;
        this.m_SpringArmCameras = Other.m_SpringArmCameras;
        this.m_AnimatedCameras = Other.m_AnimatedCameras;
        this.m_CameraLayeredStack = Other.m_CameraLayeredStack;
        this.m_bMarkContextChanged = Other.m_bMarkContextChanged;
        this.m_PendingCameraEventDatas = Other.m_PendingCameraEventDatas;
        return;
    }
    FPresentationCameraParamsContext opAssign(const FPresentationCameraParamsContext &inout Other)
    {
        FPresentationCameraParamsContext __r;
        this.SetFixedCameras(Other.GetFixedCameras());
        this.SetSpringArmCameras(Other.GetSpringArmCameras());
        this.SetAnimatedCameras(Other.GetAnimatedCameras());
        this.SetCameraLayeredStack(Other.GetCameraLayeredStack());
        this.SetbMarkContextChanged(Other.GetbMarkContextChanged());
        this.SetPendingCameraEventDatas(Other.GetPendingCameraEventDatas());
        return __r;
    }
    FCameraPairIndex GetTopCameraPairIndex() const
    {
        FCameraPairIndex local_4;
        local_4 = PresentationCameraConstants::FCameraPairIndex_Invalid;
        int local_12 = this.GetCameraLayeredStack().Num() - 1;
        for (; local_12 >= 0; --local_12)
        {
            if (!(this.GetCameraLayeredStack()[local_12].IsEmpty()))
            {
                local_4 = this.GetCameraLayeredStack()[local_12].GetTop();
                break;
            }
        }
        return local_4;
    }
    FString DebugStackString() const
    {
        FString local_4 = "";
        int local_8 = this.GetCameraLayeredStack().Num() - 1;
        for (; local_8 >= 0; --local_8)
        {
            if (this.GetCameraLayeredStack()[local_8].IsEmpty())
            {
                continue;
            }
            local_4 += FString().Append("Layer ").Append(local_8).Append(": ");
            int local_16 = 0;
            for (; local_16 < this.GetCameraLayeredStack()[local_8].GetCameraPairIndexes().Num(); )
            {
                local_4 += FString().Append("N: ").Append(this.GetCameraLayeredStack()[local_8].GetCameraPairIndexes()[local_16].GetCameraName().ToString()).Append(" T: ").Append(int(this.GetCameraLayeredStack()[local_8].GetCameraPairIndexes()[local_16].GetCameraType())).Append(" 	");
                ++local_16;
            }
            local_4 += "\n";
        }
        return local_4;
    }
    const TMap<FName, FFixedCameraParams> GetFixedCameras() const property
    {
        const TMap<FName, FFixedCameraParams> __r;
        return __r;
    }
    TMap<FName, FFixedCameraParams> GetModify_FixedCameras() property
    {
        TMap<FName, FFixedCameraParams> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFixedCameras(const TMap<FName, FFixedCameraParams> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FixedCameras = __Value;
        return;
    }
    const TMap<FName, FSpringArmCameraParams> GetSpringArmCameras() const property
    {
        const TMap<FName, FSpringArmCameraParams> __r;
        return __r;
    }
    TMap<FName, FSpringArmCameraParams> GetModify_SpringArmCameras() property
    {
        TMap<FName, FSpringArmCameraParams> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetSpringArmCameras(const TMap<FName, FSpringArmCameraParams> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SpringArmCameras = __Value;
        return;
    }
    const TMap<FName, FAnimatedCameraParams> GetAnimatedCameras() const property
    {
        const TMap<FName, FAnimatedCameraParams> __r;
        return __r;
    }
    TMap<FName, FAnimatedCameraParams> GetModify_AnimatedCameras() property
    {
        TMap<FName, FAnimatedCameraParams> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAnimatedCameras(const TMap<FName, FAnimatedCameraParams> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AnimatedCameras = __Value;
        return;
    }
    const TArray<FCameraPairIndexStack> GetCameraLayeredStack() const property
    {
        const TArray<FCameraPairIndexStack> __r;
        return __r;
    }
    TArray<FCameraPairIndexStack> GetModify_CameraLayeredStack() property
    {
        TArray<FCameraPairIndexStack> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetCameraLayeredStack(const TArray<FCameraPairIndexStack> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_CameraLayeredStack = __Value;
        return;
    }
    bool GetbMarkContextChanged() const property
    {
        return this.m_bMarkContextChanged;
    }
    void SetbMarkContextChanged(const bool __Value) property
    {
        if (!(this.m_bMarkContextChanged) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bMarkContextChanged = __Value;
        return;
    }
    const FCameraInstancedStructQueue GetPendingCameraEventDatas() const property
    {
        const FCameraInstancedStructQueue __r;
        return __r;
    }
    FCameraInstancedStructQueue GetPendingCameraEventDatas() property
    {
        FCameraInstancedStructQueue __r;
        return __r;
    }
    void SetPendingCameraEventDatas(const FCameraInstancedStructQueue &inout __Value) property
    {
        this.m_PendingCameraEventDatas = __Value;
        return;
    }
}

struct FC_LogicCachePresentationCameraContext : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FPresentationCameraParamsContext m_CameraParamsContext;

    FC_LogicCachePresentationCameraContext()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LogicCachePresentationCameraContext(const FC_LogicCachePresentationCameraContext &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_CameraParamsContext = Other.m_CameraParamsContext;
        return;
    }
    FC_LogicCachePresentationCameraContext opAssign(const FC_LogicCachePresentationCameraContext &inout Other)
    {
        FC_LogicCachePresentationCameraContext __r;
        this.SetCameraParamsContext(Other.GetCameraParamsContext());
        return __r;
    }
    const FPresentationCameraParamsContext GetCameraParamsContext() const property
    {
        const FPresentationCameraParamsContext __r;
        return __r;
    }
    FPresentationCameraParamsContext GetCameraParamsContext() property
    {
        FPresentationCameraParamsContext __r;
        return __r;
    }
    void SetCameraParamsContext(const FPresentationCameraParamsContext &inout __Value) property
    {
        this.m_CameraParamsContext = __Value;
        return;
    }
}

struct FCameraInstancedData
{
    UPROPERTY()
    ECameraType RunningCameraType;
    UPROPERTY()
    FCameraPairIndex CameraPairIndex;
    UPROPERTY()
    EPresentationCameraLayer Layer;
    UPROPERTY()
    FFPTime EnterStackTime;
    UPROPERTY()
    FInstancedStruct PresentationCamera;
    UPROPERTY()
    FCameraResult CameraResult;


    FFixedCameraPresentation GetFixedCamera() const
    {
        FFixedCameraPresentation __r;
        return __r;
    }
    FSpringArmCameraPresentation GetSpringArmCamera() const
    {
        FSpringArmCameraPresentation __r;
        return __r;
    }
    FAnimatedCameraPresentation GetAnimatedCamera() const
    {
        FAnimatedCameraPresentation __r;
        return __r;
    }
    FLayerConduitCamera GetLayerConduitCamera() const
    {
        FLayerConduitCamera __r;
        return __r;
    }
}

struct FC_PresentationCameraContext : FECSComponent
{
    UPROPERTY()
    FPresentationCameraParamsContext CameraParamsContext;
    UPROPERTY()
    FLayerConduitCamera LayerConduitCamera;
    UPROPERTY()
    FCameraInstancedData LastCameraInstanceData;
    UPROPERTY()
    FCameraInstancedData CurrentCameraInstanceData;
    UPROPERTY()
    bool bInit = false;


    void SwitchToNewTopCamera(const FCameraPairIndex &inout WinnerCameraPairIndex, const FPresentationCameraParamsContext &inout WinnerParamsContext, const FFPTime &inout WorldTime, const FCS_LocalPlayer &inout LocalPlayer)
    {
        int local_664 = 0;
        int local_668 = 0;
        int local_676 = 0;
        int local_682 = 0;
        if (!(WinnerCameraPairIndex.IsValid()))
        {
            return;
        }
        FCameraBlendConfig local_78;
        switch (int(this.LastCameraInstanceData.RunningCameraType))
        {
        case 2:
        {
                Get local_86;
            local_78 = local_86.opCall().GetBlendConfig();
            if (!(local_86.opCall().CameraRuntimeData.IsFullyBlend(WorldTime)))
            {
                this.LastCameraInstanceData.RunningCameraType = ECameraType(ECameraType(0));
            }
            break;
        }
        case 3:
        {
                Get local_170;
            local_78 = FInstancedStruct::GetMutable(this.LastCameraInstanceData.PresentationCamera).opCall().GetBlendConfig();
            if (!(local_170.opCall().CameraRuntimeData.IsFullyBlend(WorldTime)))
            {
                this.LastCameraInstanceData.RunningCameraType = ECameraType(ECameraType(0));
            }
            break;
        }
        case 4:
        {
                Get local_174;
            local_78 = local_174.opCall().GetBlendConfig();
            if (!(local_174.opCall().CameraRuntimeData.IsFullyBlend(WorldTime)))
            {
                this.LastCameraInstanceData.RunningCameraType = ECameraType(ECameraType(0));
            }
            break;
        }
        case 1:
        {
                Get local_178;
            local_78 = local_178.opCall().GetBlendConfig();
            if (!(local_178.opCall().IsFullyBlend(WorldTime)))
            {
                this.LastCameraInstanceData.RunningCameraType = ECameraType(ECameraType(0));
            }
            break;
        }
        }
        this.CurrentCameraInstanceData.CameraPairIndex = WinnerCameraPairIndex;
        this.CurrentCameraInstanceData.RunningCameraType = ECameraType(WinnerCameraPairIndex.GetCameraType());
        switch (int(WinnerCameraPairIndex.GetCameraType()))
        {
        case 2:
        {
            FFixedCameraPresentation local_262;
            FName local_264 = WinnerCameraPairIndex.GetCameraName();
            this.CurrentCameraInstanceData.Layer = EPresentationCameraLayer(local_262.Params.GetLayer());
            this.CurrentCameraInstanceData.EnterStackTime = local_262.Params.StartTime;
            this.CurrentCameraInstanceData.PresentationCamera = FInstancedStruct::Make(local_262);
            break;
        }
        case 3:
        {
            FSpringArmCameraPresentation local_540;
            FName local_264_2 = WinnerCameraPairIndex.GetCameraName();
            this.CurrentCameraInstanceData.Layer = EPresentationCameraLayer(local_540.Params.GetLayer());
            this.CurrentCameraInstanceData.EnterStackTime = local_540.Params.StartTime;
            this.CurrentCameraInstanceData.PresentationCamera = FInstancedStruct::Make(local_540);
            break;
        }
        case 4:
        {
            FAnimatedCameraPresentation local_648;
            FName local_264_3 = WinnerCameraPairIndex.GetCameraName();
            this.CurrentCameraInstanceData.Layer = EPresentationCameraLayer(local_648.Params.GetLayer());
            this.CurrentCameraInstanceData.EnterStackTime = local_648.Params.StartTime;
            this.CurrentCameraInstanceData.PresentationCamera = FInstancedStruct::Make(local_648);
            break;
        }
        case 1:
        {
            this.CurrentCameraInstanceData.Layer = EPresentationCameraLayer(EPresentationCameraLayer(0));
            this.CurrentCameraInstanceData.EnterStackTime = 0.0;
            this.CurrentCameraInstanceData.PresentationCamera = FInstancedStruct::Make(this.LayerConduitCamera);
            break;
        }
        }
        bool local_1 = !(this.LastCameraInstanceData.CameraPairIndex.IsValid());
        if ((local_1 || (int(this.CurrentCameraInstanceData.Layer) > int(this.LastCameraInstanceData.Layer))))
        {
            bool local_657;
            local_657 = true;
        }
        else
        {
            bool local_657;
            local_657 = int(this.CurrentCameraInstanceData.Layer) == int(this.LastCameraInstanceData.Layer) && ((this.CurrentCameraInstanceData.EnterStackTime.opCmp(this.LastCameraInstanceData.EnterStackTime) > 0));
        }
        switch (int(this.CurrentCameraInstanceData.RunningCameraType))
        {
            bool local_657;
        case 2:
        {
            FInstancedStruct::GetMutable(this.CurrentCameraInstanceData.PresentationCamera);
            if (local_657)
            {
                local_664.SetBlendPhaseByConfig(ECameraBlendPhase(0), WorldTime);
            }
            else
            {
                local_664.SetBlendPhaseByParams(ECameraBlendPhase(0), WorldTime, local_78.BlendOutEasing, int(local_78.BlendOutDuration));
            }
            if (local_1)
            {
                local_664.CameraRuntimeData.ForceBlendFinish();
            }
            break;
        }
        case 3:
        {
            FInstancedStruct::GetMutable(this.CurrentCameraInstanceData.PresentationCamera);
            if (local_657)
            {
                ECS::GetContextDeltaTime();
            }
            else
            {
                int local_666 = int(local_78.BlendOutDuration);
                ECS::GetContextDeltaTime();
            }
            if (local_1)
            {
                local_668.CameraRuntimeData.ForceBlendFinish();
            }
            break;
        }
        case 4:
        {
            FInstancedStruct::GetMutable(this.CurrentCameraInstanceData.PresentationCamera);
            if (local_657)
            {
                local_676.SetBlendPhaseByConfig(ECameraBlendPhase(0), WorldTime);
            }
            else
            {
                local_676.SetBlendPhaseByParams(ECameraBlendPhase(0), WorldTime, local_78.BlendOutEasing, int(local_78.BlendOutDuration));
            }
            if (local_1)
            {
                local_676.CameraRuntimeData.ForceBlendFinish();
            }
            break;
        }
        case 1:
        {
            FInstancedStruct::GetMutable(this.CurrentCameraInstanceData.PresentationCamera);
            local_682.UpdateCameraConfig(WorldTime, LocalPlayer);
            if (local_657)
            {
                ECS::GetContextDeltaTime();
            }
            else
            {
                int local_666_2 = int(local_78.BlendOutDuration);
                ECS::GetContextDeltaTime();
            }
            if (local_1)
            {
                local_682.ForceBlendFinish();
            }
            break;
        }
        }
        return;
    }
    bool IsTopCameraValid() const
    {
        return this.CurrentCameraInstanceData.CameraPairIndex.IsValid();
    }
}

struct FC_InitPresentationCameraContextTag : FECSComponent
{
    FC_InitPresentationCameraContextTag()
    {
        return;
    }
}

struct FCameraEventData_PopPresentationCamera
{
    UPROPERTY()
    FCameraPairIndex PairIndex;
    UPROPERTY()
    FFPTime Time;

    FCameraEventData_PopPresentationCamera()
    {
        return;
    }
}

struct FC_KillZoneCameraFreezeTag : FECSComponent
{
    FC_KillZoneCameraFreezeTag()
    {
        return;
    }
}

struct FC_LogicPresentationCameraEventChangeTag : FECSComponent
{
    FC_LogicPresentationCameraEventChangeTag()
    {
        return;
    }
}

namespace ECSFunc_FC_LogicCachePresentationCameraContext
{
UFUNCTION()
bool HasLogicCachePresentationCameraContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraContext);
}
FC_LogicCachePresentationCameraContext& AssignLogicCachePresentationCameraContext(const FECSEntity &inout Entity, const FC_LogicCachePresentationCameraContext &inout DefaultValue = FC_LogicCachePresentationCameraContext())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraContext, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLogicCachePresentationCameraContext_BP(const FECSEntity &inout Entity, const FC_LogicCachePresentationCameraContext &inout DefaultValue = FC_LogicCachePresentationCameraContext())
{
    ECSFunc_FC_LogicCachePresentationCameraContext::AssignLogicCachePresentationCameraContext(Entity, DefaultValue);
    return;
}
FC_LogicCachePresentationCameraContext& ModifyLogicCachePresentationCameraContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraContext));
    return local_12.GetComp();
}
FC_LogicCachePresentationCameraContext& ModifyOrAddLogicCachePresentationCameraContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraContext));
    return local_12.GetComp();
}
const FC_LogicCachePresentationCameraContext& GetLogicCachePresentationCameraContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraContext));
    return local_12.GetComp();
}
UFUNCTION()
FC_LogicCachePresentationCameraContext GetLogicCachePresentationCameraContext_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LogicCachePresentationCameraContext& local_4 = ECSFunc_FC_LogicCachePresentationCameraContext::GetLogicCachePresentationCameraContext(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LogicCachePresentationCameraContext();
}
const FC_LogicCachePresentationCameraContext GetDefaultedLogicCachePresentationCameraContext(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LogicCachePresentationCameraContext __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraContext);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LogicCachePresentationCameraContext GetDefaultedLogicCachePresentationCameraContext_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LogicCachePresentationCameraContext::GetDefaultedLogicCachePresentationCameraContext(Entity);
}
UFUNCTION()
bool RemoveLogicCachePresentationCameraContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LogicCachePresentationCameraContext);
}
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraContextOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LogicCachePresentationCameraContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraContextOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LogicCachePresentationCameraContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraContextOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LogicCachePresentationCameraContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraContextOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LogicCachePresentationCameraContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicCachePresentationCameraContextOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LogicCachePresentationCameraContext, bFixedFrame, bMustHandleAll);
}
void __MonitorLogicCachePresentationCameraContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LogicCachePresentationCameraContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicCachePresentationCameraContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LogicCachePresentationCameraContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicCachePresentationCameraContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LogicCachePresentationCameraContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PresentationCameraContext
{
UFUNCTION()
bool HasPresentationCameraContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraContext);
}
FC_PresentationCameraContext& AssignPresentationCameraContext(const FECSEntity &inout Entity, const FC_PresentationCameraContext &inout DefaultValue = FC_PresentationCameraContext())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraContext, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationCameraContext_BP(const FECSEntity &inout Entity, const FC_PresentationCameraContext &inout DefaultValue = FC_PresentationCameraContext())
{
    ECSFunc_FC_PresentationCameraContext::AssignPresentationCameraContext(Entity, DefaultValue);
    return;
}
FC_PresentationCameraContext& ModifyPresentationCameraContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraContext));
    return local_12.GetComp();
}
FC_PresentationCameraContext& ModifyOrAddPresentationCameraContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraContext));
    return local_12.GetComp();
}
const FC_PresentationCameraContext& GetPresentationCameraContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraContext));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationCameraContext GetPresentationCameraContext_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PresentationCameraContext __r;
    bValid = false;
    bValid = ECSFunc_FC_PresentationCameraContext::GetPresentationCameraContext(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PresentationCameraContext GetDefaultedPresentationCameraContext(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationCameraContext __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraContext);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_PresentationCameraContext GetDefaultedPresentationCameraContext_BP(const FECSEntity &inout Entity)
{
    FC_PresentationCameraContext __r;
    return __r;
}
UFUNCTION()
bool RemovePresentationCameraContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationCameraContext);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraContextOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationCameraContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraContextOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationCameraContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraContextOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationCameraContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraContextOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationCameraContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationCameraContextOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationCameraContext, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationCameraContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationCameraContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationCameraContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationCameraContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationCameraContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationCameraContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InitPresentationCameraContextTag
{
UFUNCTION()
bool HasInitPresentationCameraContextTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InitPresentationCameraContextTag);
}
FC_InitPresentationCameraContextTag& AssignInitPresentationCameraContextTag(const FECSEntity &inout Entity, const FC_InitPresentationCameraContextTag &inout DefaultValue = FC_InitPresentationCameraContextTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InitPresentationCameraContextTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInitPresentationCameraContextTag_BP(const FECSEntity &inout Entity, const FC_InitPresentationCameraContextTag &inout DefaultValue = FC_InitPresentationCameraContextTag())
{
    ECSFunc_FC_InitPresentationCameraContextTag::AssignInitPresentationCameraContextTag(Entity, DefaultValue);
    return;
}
FC_InitPresentationCameraContextTag& ModifyInitPresentationCameraContextTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InitPresentationCameraContextTag));
    return local_12.GetComp();
}
FC_InitPresentationCameraContextTag& ModifyOrAddInitPresentationCameraContextTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InitPresentationCameraContextTag));
    return local_12.GetComp();
}
const FC_InitPresentationCameraContextTag& GetInitPresentationCameraContextTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InitPresentationCameraContextTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_InitPresentationCameraContextTag GetInitPresentationCameraContextTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_InitPresentationCameraContextTag& local_4 = ECSFunc_FC_InitPresentationCameraContextTag::GetInitPresentationCameraContextTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_InitPresentationCameraContextTag();
}
const FC_InitPresentationCameraContextTag GetDefaultedInitPresentationCameraContextTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InitPresentationCameraContextTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InitPresentationCameraContextTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_InitPresentationCameraContextTag GetDefaultedInitPresentationCameraContextTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_InitPresentationCameraContextTag::GetDefaultedInitPresentationCameraContextTag(Entity);
}
UFUNCTION()
bool RemoveInitPresentationCameraContextTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InitPresentationCameraContextTag);
}
}
FECSMonitorRuntimeView __GetMonitorInitPresentationCameraContextTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InitPresentationCameraContextTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitPresentationCameraContextTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InitPresentationCameraContextTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitPresentationCameraContextTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InitPresentationCameraContextTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitPresentationCameraContextTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InitPresentationCameraContextTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInitPresentationCameraContextTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InitPresentationCameraContextTag, bFixedFrame, bMustHandleAll);
}
void __MonitorInitPresentationCameraContextTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InitPresentationCameraContextTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInitPresentationCameraContextTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InitPresentationCameraContextTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInitPresentationCameraContextTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InitPresentationCameraContextTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_KillZoneCameraFreezeTag
{
UFUNCTION()
bool HasKillZoneCameraFreezeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_KillZoneCameraFreezeTag);
}
FC_KillZoneCameraFreezeTag& AssignKillZoneCameraFreezeTag(const FECSEntity &inout Entity, const FC_KillZoneCameraFreezeTag &inout DefaultValue = FC_KillZoneCameraFreezeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_KillZoneCameraFreezeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignKillZoneCameraFreezeTag_BP(const FECSEntity &inout Entity, const FC_KillZoneCameraFreezeTag &inout DefaultValue = FC_KillZoneCameraFreezeTag())
{
    ECSFunc_FC_KillZoneCameraFreezeTag::AssignKillZoneCameraFreezeTag(Entity, DefaultValue);
    return;
}
FC_KillZoneCameraFreezeTag& ModifyKillZoneCameraFreezeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_KillZoneCameraFreezeTag));
    return local_12.GetComp();
}
FC_KillZoneCameraFreezeTag& ModifyOrAddKillZoneCameraFreezeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_KillZoneCameraFreezeTag));
    return local_12.GetComp();
}
const FC_KillZoneCameraFreezeTag& GetKillZoneCameraFreezeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_KillZoneCameraFreezeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_KillZoneCameraFreezeTag GetKillZoneCameraFreezeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_KillZoneCameraFreezeTag& local_4 = ECSFunc_FC_KillZoneCameraFreezeTag::GetKillZoneCameraFreezeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_KillZoneCameraFreezeTag();
}
const FC_KillZoneCameraFreezeTag GetDefaultedKillZoneCameraFreezeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_KillZoneCameraFreezeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_KillZoneCameraFreezeTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_KillZoneCameraFreezeTag GetDefaultedKillZoneCameraFreezeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_KillZoneCameraFreezeTag::GetDefaultedKillZoneCameraFreezeTag(Entity);
}
UFUNCTION()
bool RemoveKillZoneCameraFreezeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_KillZoneCameraFreezeTag);
}
}
FECSMonitorRuntimeView __GetMonitorKillZoneCameraFreezeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_KillZoneCameraFreezeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorKillZoneCameraFreezeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_KillZoneCameraFreezeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorKillZoneCameraFreezeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_KillZoneCameraFreezeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorKillZoneCameraFreezeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_KillZoneCameraFreezeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorKillZoneCameraFreezeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_KillZoneCameraFreezeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorKillZoneCameraFreezeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_KillZoneCameraFreezeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorKillZoneCameraFreezeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_KillZoneCameraFreezeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorKillZoneCameraFreezeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_KillZoneCameraFreezeTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LogicPresentationCameraEventChangeTag
{
UFUNCTION()
bool HasLogicPresentationCameraEventChangeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraEventChangeTag);
}
FC_LogicPresentationCameraEventChangeTag& AssignLogicPresentationCameraEventChangeTag(const FECSEntity &inout Entity, const FC_LogicPresentationCameraEventChangeTag &inout DefaultValue = FC_LogicPresentationCameraEventChangeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraEventChangeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLogicPresentationCameraEventChangeTag_BP(const FECSEntity &inout Entity, const FC_LogicPresentationCameraEventChangeTag &inout DefaultValue = FC_LogicPresentationCameraEventChangeTag())
{
    ECSFunc_FC_LogicPresentationCameraEventChangeTag::AssignLogicPresentationCameraEventChangeTag(Entity, DefaultValue);
    return;
}
FC_LogicPresentationCameraEventChangeTag& ModifyLogicPresentationCameraEventChangeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraEventChangeTag));
    return local_12.GetComp();
}
FC_LogicPresentationCameraEventChangeTag& ModifyOrAddLogicPresentationCameraEventChangeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraEventChangeTag));
    return local_12.GetComp();
}
const FC_LogicPresentationCameraEventChangeTag& GetLogicPresentationCameraEventChangeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraEventChangeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LogicPresentationCameraEventChangeTag GetLogicPresentationCameraEventChangeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LogicPresentationCameraEventChangeTag& local_4 = ECSFunc_FC_LogicPresentationCameraEventChangeTag::GetLogicPresentationCameraEventChangeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LogicPresentationCameraEventChangeTag();
}
const FC_LogicPresentationCameraEventChangeTag GetDefaultedLogicPresentationCameraEventChangeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LogicPresentationCameraEventChangeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraEventChangeTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LogicPresentationCameraEventChangeTag GetDefaultedLogicPresentationCameraEventChangeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LogicPresentationCameraEventChangeTag::GetDefaultedLogicPresentationCameraEventChangeTag(Entity);
}
UFUNCTION()
bool RemoveLogicPresentationCameraEventChangeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LogicPresentationCameraEventChangeTag);
}
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraEventChangeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LogicPresentationCameraEventChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraEventChangeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LogicPresentationCameraEventChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraEventChangeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LogicPresentationCameraEventChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraEventChangeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LogicPresentationCameraEventChangeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicPresentationCameraEventChangeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LogicPresentationCameraEventChangeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLogicPresentationCameraEventChangeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LogicPresentationCameraEventChangeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicPresentationCameraEventChangeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LogicPresentationCameraEventChangeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicPresentationCameraEventChangeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LogicPresentationCameraEventChangeTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FPresentationCameraParamsContext &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FPresentationCameraParamsContext &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPresentationCameraParamsContext
{
int __IndexOf_FixedCameras()
{
    return 0;
}
int __IndexOf_SpringArmCameras()
{
    return 1;
}
int __IndexOf_AnimatedCameras()
{
    return 2;
}
int __IndexOf_CameraLayeredStack()
{
    return 3;
}
int __IndexOf_bMarkContextChanged()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LogicCachePresentationCameraContext &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LogicCachePresentationCameraContext &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LogicCachePresentationCameraContext &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LogicCachePresentationCameraContext
{
int __IndexOf_CameraParamsContext()
{
    return 0;
}
}
