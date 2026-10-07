
const FConsoleVariable CVar_Debug_PresentationCameraSystem = FConsoleVariable();
namespace FAsPresentationCameraSystemUtils
{
    const FConsoleVariable CVar_Debug_EnablePresentationCameraSystem = FConsoleVariable();

}
class US_PresentationCameraSystem : UECSScriptSystem
{
    US_PresentationCameraSystem()
    {
        return;
    }
    void RemoveCameraTargetTag(const FECSEntity &inout Entity, const ECameraType CameraType) const
    {
        switch (int(CameraType))
        {
        case 2:
        {
            Remove local_6;
            local_6.opCall();
            return;
        }
        case 3:
        {
            Remove local_12;
            local_12.opCall();
            return;
        }
        case 1:
        {
            Remove local_16;
            local_16.opCall();
            return;
        }
        case 4:
        {
            Remove local_20;
            local_20.opCall();
            return;
        }
        }
        return;
    }
    void AssignCameraTargetTag(const FECSEntity &inout Entity, const ECameraType CameraType) const
    {
        switch (int(CameraType))
        {
        case 2:
        {
            FC_PresentationTopFixedCameraTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
            return;
        }
        case 3:
        {
            FC_PresentationTopSpringArmCameraTag local_14;
            Assign local_12;
            local_12.opCall(local_14);
            return;
        }
        case 1:
        {
            FC_PresentationTopLayerConduitCameraTag local_20;
            Assign local_18;
            local_18.opCall(local_20);
            return;
        }
        case 4:
        {
            FC_PresentationTopAnimatedCameraTag local_26;
            Assign local_24;
            local_24.opCall(local_26);
            return;
        }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_InitPresentationCameraContext(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        FC_PresentationCameraContext local_8;
        if (!(FAsPresentationCameraSystemUtils::CVar_Debug_EnablePresentationCameraSystem.GetBool()))
        {
            return;
        }
        if (!(LocalPlayer.PlayerEntity.IsValid()))
        {
            return;
        }
        if (!(local_8.bInit))
        {
            FC_InitPresentationCameraContextTag local_14;
            Assign local_12;
            local_12.opCall(local_14);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_InitLayerConduitCamera(const FECSEntity &inout ControllerEntity) const
    {
        FName local_82 = FName("LayerConduitCamera");
        FC_PresentationCameraContext local_6;
        FCameraEventData_PushLayerConduitCamera local_84;
        local_6.CameraParamsContext.GetPendingCameraEventDatas().Enqueue(FInstancedStruct::Make(local_84));
        local_6.bInit = true;
        Remove local_94;
        local_94.opCall();
        return;
    }
    UFUNCTION()
    void Job_HandleLogicCameraPendingData(const FECSEntity &inout ControllerEntity) const
    {
        int local_8 = 0;
        if (!(FAsPresentationCameraSystemUtils::CVar_Debug_EnablePresentationCameraSystem.GetBool()))
        {
            return;
        }
        ::PresentationCameraContextUtils::ProcessPendingCameraEventDatas(local_8.GetCameraParamsContext());
        Remove local_12;
        local_12.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_HandleCameraEvents(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_8 = 0;
        if (!(FAsPresentationCameraSystemUtils::CVar_Debug_EnablePresentationCameraSystem.GetBool()))
        {
            return;
        }
        if (!(LocalPlayer.PlayerEntity.IsValid()))
        {
            return;
        }
        ::PresentationCameraContextUtils::ProcessPendingCameraEventDatas(local_8.CameraParamsContext);
        return;
    }
    UFUNCTION()
    void ClientJob_SchedulePresentationCamera(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_24 = 0;
        int local_30 = 0;
        int local_54 = 0;
        if (!(FAsPresentationCameraSystemUtils::CVar_Debug_EnablePresentationCameraSystem.GetBool()))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            FECSWorldPtr local_8 = this.GetECSWorld();
            Has local_12;
            local_1 = local_12.opCall();
        }
        if (local_1)
        {
            return;
        }
        FECSEntity local_18 = FECSEntity(LocalPlayer.PlayerEntity);
        if (!(local_18.IsValid()))
        {
            return;
        }
        if (!(local_30.CameraParamsContext.GetbMarkContextChanged()) && !(local_24.GetCameraParamsContext().GetbMarkContextChanged()))
        {
            return;
        }
        FCameraPairIndex local_34;
        local_34 = PresentationCameraConstants::FCameraPairIndex_Invalid;
        bool local_13 = ::PresentationCameraContextUtils::GetWinnerCameraPairIndex(local_24.GetCameraParamsContext(), local_30.CameraParamsContext, local_34);
        if (!(local_34.IsValid()) || ((local_30.CurrentCameraInstanceData.CameraPairIndex == local_34)))
        {
            return;
        }
        if (local_30.CurrentCameraInstanceData.CameraPairIndex.IsValid() && (int(local_30.CurrentCameraInstanceData.CameraPairIndex.GetCameraType()) != int(local_34.GetCameraType())))
        {
            this.RemoveCameraTargetTag(local_18, ECameraType(local_30.CurrentCameraInstanceData.CameraPairIndex.GetCameraType()));
        }
        this.AssignCameraTargetTag(local_18, ECameraType(local_34.GetCameraType()));
        if (local_13)
        {
            local_30.SwitchToNewTopCamera(local_34, local_24.GetCameraParamsContext(), ECS::GetRuntimeInfo().Time, LocalPlayer);
        }
        else
        {
            local_30.SwitchToNewTopCamera(local_34, local_30.CameraParamsContext, ECS::GetRuntimeInfo().Time, LocalPlayer);
        }
        Has local_48;
        if (!(local_48.opCall()))
        {
            return;
        }
        ::PresentationCameraUtils::WriteToCameraResult(local_30.CurrentCameraInstanceData.CameraResult, local_54);
        return;
    }
    UFUNCTION()
    void ClientJob_DebugPresentationCamera(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_20 = 0;
        int local_60 = 0;
        if (!(CVar_Debug_PresentationCameraSystem.GetBool()))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            FECSWorldPtr local_8 = this.GetECSWorld();
            Has local_12;
            local_1 = local_12.opCall();
        }
        if (local_1)
        {
            return;
        }
        if (!(LocalPlayer.PlayerEntity.IsValid()))
        {
            return;
        }
        FECSEntity local_24 = FECSEntity(LocalPlayer.PlayerEntity);
        PrintToScreen(FString().Append("Blend : ").Append(this.DebugCameraBlendWeight(local_20.CurrentCameraInstanceData, ECS::GetRuntimeInfo().Time)), 0.0f, FLinearColor::Blue);
        FCameraPairIndex local_26;
        local_26.GetCameraName();
        ECameraType local_44 = local_26.GetCameraType();
        FString local_38 = FString();
        PrintToScreen(FString().Append("PresentationCamera Active ").Append(FAsPresentationCameraSystemUtils::CVar_Debug_EnablePresentationCameraSystem.GetBool()), 0.0f, FLinearColor::Yellow);
        Get local_50;
        const FC_Camera& local_52 = local_50.opCall();
        if (local_52)
        {
            PrintToScreen(FString().Append("LogicCamera : P: ").Append(local_52.GetPosition()).Append(" R: ").Append(local_52.GetRotation()).Append(" F: ").Append(local_52.GetFOV()), 0.0f, FLinearColor::Blue);
        }
        PrintToScreen(FString().Append("Presentation Stack:\n ").Append(local_20.CameraParamsContext.DebugStackString()), 0.0f, FLinearColor::Blue);
        if (local_60)
        {
            PrintToScreen(FString().Append("Logic Stack:\n ").Append(local_60.GetCameraParamsContext().DebugStackString()), 0.0f, FLinearColor::Red);
        }
        return;
    }
    FString DebugCameraBlendWeight(const FCameraInstancedData &inout CameraInstanceData, const FFPTime &inout WorldTime) const
    {
        int local_10 = 0;
        int local_74 = 0;
        int local_80 = 0;
        int local_86 = 0;
        if (int(CameraInstanceData.RunningCameraType) == 2)
        {
            FInstancedStruct::Get<FFixedCameraPresentation> local_8 = FInstancedStruct::Get<FFixedCameraPresentation>(CameraInstanceData.PresentationCamera);
            return FString().Append("BlendWeight: ").Append(FString::ApplyFormat(local_10.CameraRuntimeData.UpdateBlend(WorldTime), ".3f")).Append(" Duration ").Append(FString::ApplyFormat((FFPTime(local_10.CameraRuntimeData.Blend.EndTime) - local_10.CameraRuntimeData.Blend.StartTime), ".3f")).Append(" BlendType ").Append(FCameraBlendType(local_10.CameraRuntimeData.Blend.CameraBlendType).Type);
        }
        if (int(CameraInstanceData.RunningCameraType) == 3)
        {
            return FString().Append("BlendWeight: ").Append(FString::ApplyFormat(local_74.CameraRuntimeData.UpdateBlend(WorldTime), ".3f")).Append(" Duration ").Append(FString::ApplyFormat((FFPTime(local_74.CameraRuntimeData.Blend.EndTime) - local_74.CameraRuntimeData.Blend.StartTime), ".3f")).Append(" BlendType ").Append(FCameraBlendType(local_74.CameraRuntimeData.Blend.CameraBlendType).Type);
        }
        if (int(CameraInstanceData.RunningCameraType) == 4)
        {
            return FString().Append("BlendWeight: ").Append(FString::ApplyFormat(local_80.CameraRuntimeData.UpdateBlend(WorldTime), ".3f")).Append(" Duration ").Append(FString::ApplyFormat((FFPTime(local_80.CameraRuntimeData.Blend.EndTime) - local_80.CameraRuntimeData.Blend.StartTime), ".3f")).Append(" BlendType ").Append(FCameraBlendType(local_80.CameraRuntimeData.Blend.CameraBlendType).Type);
        }
        if (int(CameraInstanceData.RunningCameraType) == 1)
        {
            return FString().Append("BlendWeight: ").Append(FString::ApplyFormat(local_86.UpdateBlend(WorldTime), ".3f")).Append(" Duration ").Append(FString::ApplyFormat((FFPTime(local_86.Blend.EndTime) - local_86.Blend.StartTime), ".3f")).Append(" BlendType ").Append(FCameraBlendType(local_86.Blend.CameraBlendType).Type);
        }
        return FString().Append("BlendWeight: 1.0f Duration 0.0f BlendType None");
    }
    UFUNCTION()
    void ClientJob_OutputPresentationCamera(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_20 = 0;
        int local_34 = 0;
        if (!(FAsPresentationCameraSystemUtils::CVar_Debug_EnablePresentationCameraSystem.GetBool()))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            FECSWorldPtr local_8 = this.GetECSWorld();
            Has local_12;
            local_1 = local_12.opCall();
        }
        if (local_1)
        {
            return;
        }
        FECSEntity local_24 = FECSEntity(LocalPlayer.PlayerEntity);
        Has local_28;
        if (!(local_28.opCall()))
        {
            return;
        }
        ::PresentationCameraUtils::WriteToCameraComp(local_34, local_20.CurrentCameraInstanceData.CameraResult);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitPresentationCameraContext() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.ClientJob_InitPresentationCameraContext(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitLayerConduitCamera() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_InitLayerConduitCamera(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_InitLayerConduitCamera(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLogicCameraPendingData() const
    {
        const FECSEntity& local_36;
        int local_164 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_HandleLogicCameraPendingData(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_74.Iterator();
        for (; local_126.CanProceed;)
        {
            local_36 = local_126.Proceed();
            ++local_92;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_HandleLogicCameraPendingData(local_164);
        }
        local_2.UpdateCachedEntityCount(local_92);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleCameraEvents() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.ClientJob_HandleCameraEvents(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_SchedulePresentationCamera() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.ClientJob_SchedulePresentationCamera(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugPresentationCamera() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.ClientJob_DebugPresentationCamera(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OutputPresentationCamera() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.ClientJob_OutputPresentationCamera(local_12);
        return;
    }
}

