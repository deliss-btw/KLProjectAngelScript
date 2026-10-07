
const FConsoleVariable CVar_Debug_PresentationCameraSystemLookAt = FConsoleVariable();
const FConsoleVariable CVar_Debug_PresentationCameraModifier = FConsoleVariable();

class US_PresentationCameraModificationSystem : UECSScriptSystem
{
    US_PresentationCameraModificationSystem()
    {
        return;
    }
    void ProcessPendingCameraModifierEventDatas(const FECSEntity &inout PlayerEntity, FPresentationCameraModificationParams &inout Params) const
    {
        for (auto& local_16 : Params.GetPendingCameraModifierEventDatas())
        {
            if (local_16.GetScriptStruct().IsChildOf(FCameraModifierEventData_PresentationCameraLookAtTarget))
            {
                FCameraModifierEventData_PresentationCameraLookAtTarget local_26;
                ::FPresentationCameraModificationUtils::ApplyPresentationCameraLookAtInner(Params.GetLookAtParams(), PlayerEntity, local_26.LookAtTargetEntity, local_26.LookAtSocketOffset, local_26.LookAtTargetSocketName, local_26.bContributeInput, local_26.LookAtConfig, local_26.RequestTime, local_26.bOverrideWorldDir, local_26.OverrideWorldDir);
                continue;
            }
            if (local_16.GetScriptStruct().IsChildOf(FCameraModifierEventData_PresentationCameraLookAtLocation))
            {
                FCameraModifierEventData_PresentationCameraLookAtLocation local_34;
                ::FPresentationCameraModificationUtils::ApplyPresentationCameraLookAtInner(Params.GetLookAtParams(), PlayerEntity, local_34.Location, local_34.LocationOffset, local_34.bContributeInput, local_34.LookAtConfig, local_34.RequestTime);
                continue;
            }
            if (local_16.GetScriptStruct().IsChildOf(FCameraModifierEventData_ClearPresentationCameraLookAt))
            {
                ::FPresentationCameraModificationUtils::ClearPresentationCameraLookAtInner(Params.GetLookAtParams());
                continue;
            }
            if (local_16.GetScriptStruct().IsChildOf(FCameraModifierEventData_StartPresentationModifier))
            {
                FCameraModifierEventData_StartPresentationModifier local_40;
                if (!(local_40.TargetEntity.IsValid()))
                {
                    continue;
                }
                ::FPresentationCameraModificationUtils::StartPresentationCameraModifierInner(local_40.TargetEntity, local_40.RequestTime, local_40.SourceIdentifier, local_40.ModifierConfig, local_40.OverrideEnterDuration);
                continue;
            }
            if (local_16.GetScriptStruct().IsChildOf(FCameraModifierEventData_StopPresentationModifier))
            {
                FCameraModifierEventData_StopPresentationModifier local_48;
                if (!(local_48.TargetEntity.IsValid()))
                {
                    continue;
                }
                ::FPresentationCameraModificationUtils::StopPresentationCameraModifierInner(local_48.TargetEntity, local_48.RequestTime, local_48.SourceIdentifier, local_48.ModifierConfig, local_48.OverrideExitDuration, local_48.bWarnIfNotExists);
            }
        }
        Params.GetPendingCameraModifierEventDatas().Empty(0);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleCameraModifierEvents(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_24 = 0;
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
        if (!(LocalPlayer.PlayerEntity.IsValid()))
        {
            return;
        }
        FECSEntity local_18 = FECSEntity(LocalPlayer.PlayerEntity);
        this.ProcessPendingCameraModifierEventDatas(local_18, local_24.Params);
        ::FPresentationCameraModificationUtils::ResolvePresentationCameraLookAt(local_18);
        return;
    }
    UFUNCTION()
    void Job_HandleLogicCameraModifierPendingData(const FECSEntity &inout ControllerEntity) const
    {
        int local_8 = 0;
        if (!(FAsPresentationCameraSystemUtils::CVar_Debug_EnablePresentationCameraSystem.GetBool()))
        {
            return;
        }
        this.ProcessPendingCameraModifierEventDatas(ControllerEntity, local_8.GetParams());
        Remove local_12;
        local_12.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_UpdatePresentationCameraModification_LookAt(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_12 = 0;
        int local_38 = 0;
        float32 local_39;
        int local_60 = 0;
        int local_64 = 0;
        if (!(FAsPresentationCameraSystemUtils::CVar_Debug_EnablePresentationCameraSystem.GetBool()))
        {
            return;
        }
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        if (!(local_12.LookAtParams.GetLookAtTargetConfigRef().IsValid()))
        {
            return;
        }
        if (local_12.LookAtParams.GetLookAtTargetEntity().IsValid())
        {
            local_12.LookAtParams.SetLocation(::FPresentationCameraModificationUtils::ComputePresentationLookAtTargetLocation(local_12.LookAtParams.GetLookAtTargetEntity(), local_12.LookAtParams.GetLocation(), FVector(local_12.LookAtParams.GetLookAtSocketOffset()), local_12.LookAtParams.GetLookAtTargetSocketName(), local_12.LookAtParams.GetbOverrideWorldDir(), FVector(local_12.LookAtParams.GetOverrideWorldDir())));
        }
        float local_44 = ECS::GetContextDeltaTime().ToSeconds();
        float32 local_45 = float32(local_44);
        FECSEntity local_50 = LocalPlayer.GetCameraViewTargetEntity();
        UCameraSettings local_62 = local_60.CameraSettings;
        const FCameraLookAtConfig& local_70 = FCameraUtils::GetLookAtConfig(local_64, local_62);
        const FCameraLookAtTargetConfig& local_72 = FCameraLookAtTargetConfig::GetConfig(local_12.LookAtParams.GetLookAtTargetConfigRef());
        if (local_72.GetbOverrideSmoothTargetPositionDuration())
        {
            local_39 = local_72.OverrideSmoothTargetPositionDuration;
        }
        else
        {
            local_39 = local_70.SmoothTargetPositionDuration;
        }
        float32 local_74 = FMathUtils::GetLerpT(local_39, local_45);
        FVector local_82(local_12.LookAtParams.GetLocation());
        if (local_38.GetbSnapToLookAtTarget() == false)
        {
            local_82 += FVector(local_12.LookAtParams.GetLocationOffset());
        }
        local_12.LookAtParams.SetSmoothedLocation(FMath::Lerp(local_12.LookAtParams.GetSmoothedLocation(), local_82, local_74));
        return;
    }
    void DebugPrintModifierList(const TArray<FTPCameraModifierInstance> &inout Modifiers, const FString &inout Label) const
    {
        int local_1 = 0;
        for (; local_1 < Modifiers.Num(); )
        {
            const FTPCameraModifierInstance& local_6 = Modifiers[local_1];
            FString local_16 = local_6.GetModifierConfig().GetDataName().ToString();
            PrintToScreen(FString().Append(" ").Append(Label).Append("   [").Append(local_1).Append("]  Config=").Append(local_16).Append(" "), 0.0f, FLinearColor::Green);
            ++local_1;
        }
        return;
    }
    void DebugPrintModifierList(const TInlineArray<FTPCameraModifierInstance, auto> &inout Modifiers, const FString &inout Label) const
    {
        int local_1 = 0;
        for (; local_1 < Modifiers.Num(); )
        {
            const FTPCameraModifierInstance& local_6 = Modifiers[local_1];
            FString local_16 = local_6.GetModifierConfig().GetDataName().ToString();
            PrintToScreen(FString().Append(" ").Append(Label).Append("   [").Append(local_1).Append("]  Config=").Append(local_16).Append(" "), 0.0f, FLinearColor::Green);
            ++local_1;
        }
        return;
    }
    void DebugPrintRuntimeModifierList(const TArray<FTPCameraModifierInstance> &inout Modifiers, const FString &inout Label) const
    {
        int local_1 = 0;
        for (; local_1 < Modifiers.Num(); )
        {
            const FTPCameraModifierInstance& local_6 = Modifiers[local_1];
            FString local_16 = local_6.GetModifierConfig().GetDataName().ToString();
            PrintToScreen(FString().Append(" ").Append(Label).Append("   [").Append(local_1).Append("] Config=").Append(local_16), 0.0f, FLinearColor::Blue);
            ++local_1;
        }
        PrintToScreen(FString().Append("  ").Append(Label).Append(": Count=").Append(Modifiers.Num()), 0.0f, FLinearColor::Blue);
        return;
    }
    UFUNCTION()
    void ClientJob_DebugPresentationCameraModification(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        bool local_1;
        int local_34 = 0;
        int local_50 = 0;
        Has local_70;
        Get local_74;
        Has local_86;
        Get local_90;
        if (!(CVar_Debug_PresentationCameraSystemLookAt.GetBool()) && !(CVar_Debug_PresentationCameraModifier.GetBool()))
        {
            return;
        }
        Has local_6;
        bool local_2 = local_6.opCall();
        if (local_2)
        {
            local_2 = true;
        }
        else
        {
            FECSWorldPtr local_8 = this.GetECSWorld();
            Has local_12;
            local_2 = local_12.opCall();
        }
        if (local_2)
        {
            return;
        }
        if (!(LocalPlayer.PlayerEntity.IsValid()))
        {
            return;
        }
        FECSEntity local_16 = FECSEntity(LocalPlayer.PlayerEntity);
        FECSEntity local_24 = LocalPlayer.GetCameraViewTargetEntity();
        if (CVar_Debug_PresentationCameraSystemLookAt.GetBool())
        {
            Has local_44;
            Has local_28;
            local_1 = local_28.opCall();
            if (local_1)
            {
                PrintToScreen(FString().Append("  LookAtResult: SmoothedLoc=").Append(local_34.LookAtParams.GetSmoothedLocation()).Append(" ContributeInput=").Append(local_34.LookAtParams.GetbContributeInput()).Append(" HasTarget=").Append(local_34.LookAtParams.GetLookAtTargetEntity().IsValid()).Append(" ReqTime=").Append(local_34.LookAtParams.GetRequestTime()), 0.0f, FLinearColor::White);
            }
            bool local_2_2 = local_44.opCall();
            if (local_2_2)
            {
                if (local_50.IsValid())
                {
                    PrintToScreen(FString().Append("  View: Valid=").Append(local_50.IsValid()).Append(" ReqTime=").Append(local_50.GetRequestTime()).Append(" Loc=").Append(local_50.GetLocation()).Append(" SmoothedLoc=").Append(local_50.GetSmoothedLocation()).Append(" ContributeInput=").Append(local_50.GetbContributeInput()), 0.0f, FLinearColor::Blue);
                }
                else
                {
                    PrintToScreen(FString().Append("  View: Invalid"), 0.0f, FLinearColor::Blue);
                }
            }
            Has local_54;
            local_1 = local_54.opCall();
            if (local_1)
            {
                if (local_50.IsValid())
                {
                    PrintToScreen(FString().Append("  Logic: Valid=").Append(local_50.IsValid()).Append(" ReqTime=").Append(local_50.GetRequestTime()).Append(" Loc=").Append(local_50.GetLocation()).Append(" SmoothedLoc=").Append(local_50.GetSmoothedLocation()).Append(" ContributeInput=").Append(local_50.GetbContributeInput()), 0.0f, FLinearColor::Red);
                }
                else
                {
                    PrintToScreen(FString().Append("  Logic: Invalid"), 0.0f, FLinearColor::Red);
                }
            }
            PrintToScreen(FString().Append("=== PresentationCamera LookAt Debug ==="), 0.0f, FLinearColor::Yellow);
        }
        if (CVar_Debug_PresentationCameraModifier.GetBool())
        {
            Has local_44;
            Has local_62;
            if (!(local_62.opCall()))
            {
                return;
            }
            local_1 = local_44.opCall();
            if (local_1)
            {
                FPresentationCameraModifierRuntimeData local_64;
                if (local_64.ActiveModifiers.Num() > 0)
                {
                    this.DebugPrintRuntimeModifierList(local_64.ActiveModifiers, "Result ActiveModifiers");
                }
            }
            if (local_24.IsValid())
            {
                local_1 = local_70.opCall();
                if (local_1)
                {
                    TArray<FTPCameraModifierInstance> local_78 = local_74.opCall().GetCopiedModifiers();
                    if (local_78.Num() > 0)
                    {
                        this.DebugPrintModifierList(local_78, "PlayerPawn LogicModifiers");
                    }
                }
                if (local_86.opCall() && (local_90.opCall().Modifiers.Num() > 0))
                {
                    this.DebugPrintModifierList(local_90.opCall().Modifiers, "PlayerPawn ViewModifiers");
                }
            }
            local_1 = local_70.opCall();
            if (local_1)
            {
                TArray<FTPCameraModifierInstance> local_82 = local_74.opCall().GetCopiedModifiers();
                if (local_82.Num() > 0)
                {
                    this.DebugPrintModifierList(local_82, "PlayerController LogicModifiers");
                }
            }
            if (local_86.opCall() && (local_90.opCall().Modifiers.Num() > 0))
            {
                this.DebugPrintModifierList(local_90.opCall().Modifiers, "PlayerController ViewModifiers");
            }
            PrintToScreen(FString().Append("=== PresentationCamera Modifier Debug ==="), 0.0f, FLinearColor::Yellow);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleCameraModifierEvents() const
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
        this.ClientJob_HandleCameraModifierEvents(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLogicCameraModifierPendingData() const
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
                this.Job_HandleLogicCameraModifierPendingData(local_36);
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
            this.Job_HandleLogicCameraModifierPendingData(local_164);
        }
        local_2.UpdateCachedEntityCount(local_92);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdatePresentationCameraModification_LookAt() const
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
        this.ClientJob_UpdatePresentationCameraModification_LookAt(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugPresentationCameraModification() const
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
        this.ClientJob_DebugPresentationCameraModification(local_12);
        return;
    }
}

