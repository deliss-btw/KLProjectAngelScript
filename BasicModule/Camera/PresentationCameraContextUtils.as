
namespace PresentationCameraContextUtils
{
void PushFixedCamera(FPresentationCameraParamsContext &inout CameraParamsContext, const FFixedCameraParams &inout FixedCameraParams, const EPresentationCameraLayer Layer, const FName &inout CameraName)
{
    if (CameraParamsContext.GetFixedCameras().Contains(CameraName))
    {
        XWarning(ELog(10), FString().Append("PushFixedCamera: ").Append(CameraName).Append(" already exists. So Ingore"));
        return;
    }
    FCameraPairIndex local_12;
    local_12.SetCameraType(ECameraType(2));
    local_12.SetCameraName(CameraName);
    CameraParamsContext.GetModify_CameraLayeredStack()[int(Layer)].Push(local_12);
    CameraParamsContext.GetModify_FixedCameras().Add(CameraName, FixedCameraParams);
    return;
}
void PushSpringArmCamera(FPresentationCameraParamsContext &inout CameraParamsContext, const FSpringArmCameraParams &inout SpringArmCameraParams, const EPresentationCameraLayer Layer, const FName &inout CameraName)
{
    if (CameraParamsContext.GetSpringArmCameras().Contains(CameraName))
    {
        XWarning(ELog(10), FString().Append("PushSpringArmCamera: ").Append(CameraName).Append(" already exists. So Ingore"));
        return;
    }
    FCameraPairIndex local_12;
    local_12.SetCameraType(ECameraType(3));
    local_12.SetCameraName(CameraName);
    CameraParamsContext.GetModify_CameraLayeredStack()[int(Layer)].Push(local_12);
    CameraParamsContext.GetModify_SpringArmCameras().Add(CameraName, SpringArmCameraParams);
    return;
}
void PushAnimatedCamera(FPresentationCameraParamsContext &inout CameraParamsContext, const FAnimatedCameraParams &inout AnimatedCameraParams, const EPresentationCameraLayer Layer, const FName &inout CameraName)
{
    if (CameraParamsContext.GetAnimatedCameras().Contains(CameraName))
    {
        XWarning(ELog(10), FString().Append("PushAnimatedCamera: ").Append(CameraName).Append(" already exists. So Ingore"));
        return;
    }
    FCameraPairIndex local_12;
    local_12.SetCameraType(ECameraType(4));
    local_12.SetCameraName(CameraName);
    CameraParamsContext.GetModify_CameraLayeredStack()[int(Layer)].Push(local_12);
    CameraParamsContext.GetModify_AnimatedCameras().Add(CameraName, AnimatedCameraParams);
    return;
}
void PushLayerConduitCamera(FC_PresentationCameraContext &inout PresentationCameraContext, const EPresentationCameraLayer CameraLayer, const FName &inout CameraName, const FLayerConduitCamera &inout InLayerConduitCamera)
{
    FCameraPairIndex local_4;
    local_4.SetCameraType(ECameraType(1));
    local_4.SetCameraName(CameraName);
    PresentationCameraContext.GetModify_CameraLayeredStack()[local_4].Push();
    PresentationCameraContext.SetbMarkContextChanged(true);
    return;
}
void PopCamera(FPresentationCameraParamsContext &inout CameraParamsContext, const FName &inout CameraName)
{
    // body not fully recovered вЂ” stub [unresolved-operand]
}
void ProcessPendingCameraEventDatas(FPresentationCameraParamsContext &inout CameraParamsContext)
{
    int local_18 = 0;
    int local_28 = 0;
    int local_34 = 0;
    int local_40 = 0;
    FCameraInstancedStructQueue& local_2 = CameraParamsContext.GetPendingCameraEventDatas();
    if (local_2.IsEmpty())
    {
        return;
    }
    while (!(local_2.IsEmpty()))
    {
        FInstancedStruct local_8;
        local_2.Dequeue(local_8);
        if (local_8.GetScriptStruct().IsChildOf(FCameraEventData_PushFixedCamera))
        {
            PresentationCameraContextUtils::PushFixedCamera(CameraParamsContext, local_18.Params, local_18.Params.GetLayer(), local_18.Params.GetCameraName());
        }
        else
        {
            if (local_8.GetScriptStruct().IsChildOf(FCameraEventData_PushSpringArmCamera))
            {
                PresentationCameraContextUtils::PushSpringArmCamera(CameraParamsContext, local_28.Params, local_28.Params.GetLayer(), local_28.Params.GetCameraName());
            }
            else
            {
                if (local_8.GetScriptStruct().IsChildOf(FCameraEventData_PushAnimatedCamera))
                {
                    PresentationCameraContextUtils::PushAnimatedCamera(CameraParamsContext, local_34.Params, local_34.Params.GetLayer(), local_34.Params.GetCameraName());
                }
                else
                {
                    if (local_8.GetScriptStruct().IsChildOf(FCameraEventData_PopPresentationCamera))
                    {
                        PresentationCameraContextUtils::PopCamera(CameraParamsContext, local_40.PairIndex.GetCameraName());
                    }
                }
            }
        }
    }
    CameraParamsContext.SetbMarkContextChanged(true);
    return;
}
int GetTopCameraLayer(const FPresentationCameraParamsContext &inout Context)
{
    int local_4 = Context.GetCameraLayeredStack().Num() - 1;
    for (; local_4 >= 0; --local_4)
    {
        if (!(Context.GetCameraLayeredStack()[local_4].IsEmpty()))
        {
            return local_4;
        }
    }
    return -1;
}
FFPTime GetCameraStartTime(const FPresentationCameraParamsContext &inout Context, const FCameraPairIndex &inout PairIndex)
{
    if (int(PairIndex.GetCameraType()) == 2 && Context.GetFixedCameras().Contains(PairIndex.GetCameraName()))
    {
        return Context.GetFixedCameras()[PairIndex.GetCameraName()].StartTime;
    }
    if (int(PairIndex.GetCameraType()) == 3 && Context.GetSpringArmCameras().Contains(PairIndex.GetCameraName()))
    {
        return Context.GetSpringArmCameras()[PairIndex.GetCameraName()].StartTime;
    }
    if (int(PairIndex.GetCameraType()) == 4 && Context.GetAnimatedCameras().Contains(PairIndex.GetCameraName()))
    {
        return Context.GetAnimatedCameras()[PairIndex.GetCameraName()].StartTime;
    }
    return FFPTime();
}
bool GetWinnerCameraPairIndex(const FPresentationCameraParamsContext &inout LogicContext, const FPresentationCameraParamsContext &inout ViewContext, FCameraPairIndex &inout OutWinnerCameraPairIndex)
{
    FCameraPairIndex local_8 = LogicContext.GetTopCameraPairIndex();
    FCameraPairIndex local_4 = ViewContext.GetTopCameraPairIndex();
    bool local_14 = local_8.IsValid();
    bool local_13 = local_4.IsValid();
    if (!(local_14) && !(local_13))
    {
        OutWinnerCameraPairIndex = PresentationCameraConstants::FCameraPairIndex_Invalid;
        return false;
    }
    if (local_14 && !(local_13))
    {
        OutWinnerCameraPairIndex = local_8;
        return true;
    }
    bool local_16 = !(local_14);
    if (local_16 && local_13)
    {
        OutWinnerCameraPairIndex = local_4;
        return false;
    }
    int local_18 = PresentationCameraContextUtils::GetTopCameraLayer(LogicContext);
    int local_17 = PresentationCameraContextUtils::GetTopCameraLayer(ViewContext);
    if (local_18 > local_17)
    {
        OutWinnerCameraPairIndex = local_8;
        return true;
    }
    if (local_17 > local_18)
    {
        OutWinnerCameraPairIndex = local_4;
        return false;
    }
    FFPTime local_24 = PresentationCameraContextUtils::GetCameraStartTime(LogicContext, local_8);
    FFPTime local_22 = PresentationCameraContextUtils::GetCameraStartTime(ViewContext, local_4);
    bool local_15 = (local_24.opCmp(local_22) >= 0);
    if (local_15)
    {
    }
    else
    {
    }
    return local_15;
}
}
