
const FConsoleVariable CVar_Camera_DebugLookAtTarget = FConsoleVariable();
const FConsoleVariable CVar_Camera_DebugCameraAffector = FConsoleVariable();
const FConsoleVariable CVar_Camera_ForegroundDitherParam_StartK = FConsoleVariable();
const FConsoleVariable CVar_Camera_ForegroundDitherParam_StartB = FConsoleVariable();
const FConsoleVariable CVar_Camera_ForegroundDitherParam_EndK = FConsoleVariable();
const FConsoleVariable CVar_Camera_ForegroundDitherParam_EndB = FConsoleVariable();
const FConsoleVariable CVar_Camera_ForegroundDitherParam_MinOpacity = FConsoleVariable();
const FName CameraAffectorSourceIdentifier = n"CameraAffector";

struct FCameraAdditionalInputModifierConfig
{
    UPROPERTY()
    TArray<FDataObjectPtr> ModifierConfigs;

    FCameraAdditionalInputModifierConfig()
    {
        return;
    }
}

class US_TPCameraSystemAS : UECSScriptSystem
{
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> CameraAdditionalInput = nullptr;
    UPROPERTY()
    TMap<ECameraAdditionalInputModifierCategory, FCameraAdditionalInputModifierConfig> CameraAdditionalInputModifiers;

    US_TPCameraSystemAS()
    {
        return;
    }
    UFUNCTION()
    void InitTPCameraParamOnEnterDS() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Assign local_6;
        local_6.opCall(FCS_NeedInitTPCameraTag());
        return;
    }
    UFUNCTION()
    void ClientJob_PollCVarAndSendEvent(const FECSEntity &inout Entity) const
    {
        FCS_CameraAdditionalInputCVarState local_4;
        int local_2 = CameraOptions::CVar_Camera_AdditionalInputModifierIndex.GetInt();
        FECSWorldPtr local_6 = this.GetECSWorld();
        if (local_2 == int(local_4.LastSentModifierIndex))
        {
            return;
        }
        local_4.LastSentModifierIndex = local_2;
        ::FASCommonUtils::GetUniquePlayerEntity(Entity);
        FFPTime local_26 = FFPTime(-1);
        FCE_SetAdditionalInputModifierIndexNotify local_28;
        local_28.DesiredIndex = local_2;
        return;
    }
    UFUNCTION()
    void ClearCameraModifierOnReconnect(const FECSEntity &inout PlayerEntity, const FC_PlayerPendingLogin &inout PendingLogin) const
    {
        if (!(PendingLogin.bIsReconnect))
        {
            return;
        }
        Modify local_6;
        FC_TPCameraModifier& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.ClearTransientModifiers();
        }
        Get local_12;
        const FC_PlayerController& local_14 = local_12.opCall();
        if (local_14)
        {
            for (auto& local_28 : local_14.GetAllPlayerPawnEntities())
            {
                local_28;
                FC_TPCameraModifier& local_8_2 = local_6.opCall();
                if (local_8_2)
                {
                    local_8_2.ClearTransientModifiers();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleSetAdditionalInputModifierIndex(const FCE_SetAdditionalInputModifierIndexNotify &inout Event) const
    {
        0.SetDesiredModifierIndex(int(Event.DesiredIndex));
        return;
    }
    UFUNCTION()
    void Job_HandleTPCameraSystemASLockInput(const FECSEntity &inout Entity, const FC_Input &inout Input, const FCS_FixedTime &inout FixedTime, FC_ESMTrigger &inout ESMTrigger) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ClientJob_HandleCameraFreezeAndLookAtFollowTarget(const FCE_CameraFreezeAndLookAtFollowTarget &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        ::ScriptCameraUtils::CameraFreezeAndLookAtFollowTarget(LocalPlayer.GetCameraViewTargetEntity(), Event.LookAtSocketName, Event.LookAtSocketOffset, Event.LookAtConfig);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleCameraUnFreezeAndLookAtFollowTarget(const FCE_CameraUnFreezeAndLookAtFollowTarget &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        ::ScriptCameraUtils::CameraUnfreezeAndLookAtFollowTarget(LocalPlayer.GetCameraViewTargetEntity());
        return;
    }
    UFUNCTION()
    void Job_ApplyLockTargetOrAim(const FECSEntity &inout Entity, const FC_CharacterPoseState &inout CharacterPose) const
    {
        int local_6 = 0;
        int local_50 = 0;
        int local_52 = 0;
        int local_88 = 0;
        FECSEntity local_10 = Entity;
        Get local_14;
        if (local_14.opCall())
        {
            GetDefaulted local_22;
            FECSEntity local_26 = local_22.opCall().GetCameraViewTargetEntity();
            if (local_26.IsValid())
            {
                local_10 = local_26;
            }
        }
        if (FLockTargetUtils::ShouldLockCameraLookAt(local_6, CharacterPose))
        {
            float32 local_81;
            float32 local_58;
            float32 local_57;
            float32 local_55;
            int local_31;
            local_31 = local_6.GetLockPointIndex();
            FVector local_38 = local_6.GetPresentationLockTargetPosition();
            FVector local_44 = local_38;
            if (local_50)
            {
            }
            else
            {
            }
            const FCameraLookAtTargetConfig& local_54 = FCameraLookAtTargetConfig::GetConfig(local_52);
            local_55 = 0.0f;
            local_57 = 0.0f;
            local_58 = 1.0f;
            GetDefaulted local_62;
            FLockPointModifyConfig local_68 = local_62.opCall().GetModifyItem(local_31);
            if (local_68.GetbValidConfig())
            {
                local_55 = local_68.GetStableHeightTargetOffset();
                local_57 = local_68.GetLockPointHeightOffset();
                float32 local_56 = local_68.GetStableHeightTargetMinMaxRatio();
                local_58 = FMath::Max(0.0f, local_56);
                local_38.Z += local_57;
            }
            local_81 = local_54.LockViewPitchCompensation;
            if (local_54.GetbStableVerticalForCamera())
            {
                float32 local_103;
                float32 local_56_2 = FCollisionUtils::GetCollisionHeight(local_6.GetTargetEntity());
                float32 local_76 = local_56_2 * 0.5f;
                float local_78_2 = local_88.GetPosition().Z - local_76;
                float local_92 = (local_78_2 + local_54.StableHeightMin) + local_55;
                float local_94;
                float local_96 = local_78_2 + local_54.StableHeightMax;
                local_94 = local_96 + local_55;
                if (local_58 != 1.0f)
                {
                    float local_98 = local_92 + local_94;
                    local_96 = local_98 * 0.5;
                    float local_100 = 0.5;
                    local_98 = (local_94 - local_92) * local_100;
                    local_100 = local_58;
                    local_92 = local_96 - (local_98 * local_100);
                    local_100 = local_98 * local_58;
                    local_94 = local_96 + local_100;
                }
                float local_80 = FMathUtils::InverseLerp(local_38.Z, local_92, local_94);
                float32 local_89 = local_54.StableHeightTargetOffset;
                float local_100_2 = local_89;
                float local_98_2 = local_78_2 + local_100_2;
                local_100_2 = local_98_2 + local_55;
                if (local_80 <= 0.0)
                {
                    local_38.Z = local_100_2;
                }
                else
                {
                    if (local_80 < 1.0)
                    {
                        local_38.Z = FMath::Lerp(local_100_2, local_94, local_80);
                    }
                }
                local_103 = local_54.LockHeightOffset;
                if (local_54.GetbCompensationByHorizontalDistance() || local_54.GetbCompensationByOffsetPitch())
                {
                    local_81 = 0.0f;
                    FVector3f local_131 = FVector3f((FVector(local_88.GetPosition()) - FTransformUtils::GetLocation(Entity, FFPTime(-1))));
                    local_89 = local_131.Size2D();
                    if (local_54.GetbCompensationByHorizontalDistance())
                    {
                        if (local_54.LockTargetHeightOffsetByDistance.GetNumKeys() > 0)
                        {
                            local_103 = local_54.LockTargetHeightOffsetByDistance.GetFloatValue(local_89, 0.0f);
                        }
                        if (local_54.LockViewPitchCompensationByDistance.GetNumKeys() > 0)
                        {
                            local_56_2 = local_54.LockViewPitchCompensationByDistance.GetFloatValue(local_89, 0.0f);
                            local_81 = local_81 + local_56_2;
                        }
                    }
                    if (local_54.GetbCompensationByOffsetPitch() && (local_54.LockViewPitchCompensationByOffsetPitch.GetNumKeys() > 0))
                    {
                        local_56_2 = FMath::RadiansToDegrees(FMath::Atan2(local_131.Z, local_89));
                        local_81 = local_81 + local_54.LockViewPitchCompensationByOffsetPitch.GetFloatValue(local_56_2, 0.0f);
                    }
                }
                local_38.Z = (local_38.Z + local_103);
                if (CVar_Camera_DebugLookAtTarget.GetBool())
                {
                    local_98_2 = local_88.GetPosition().Y;
                    FVector local_110 = FVector(local_88.GetPosition().X, local_98_2, local_92);
                    FVector local_128 = FVector(local_88.GetPosition().X, local_88.GetPosition().Y, local_94);
                    FECSDebugDraw::DrawDebugBox(n"Camera", local_110, FVector(100.0, 100.0, 0.0), FQuat::Identity, FColor(uint8(255), uint8(0), uint8(0), uint8(128)), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                    FECSDebugDraw::DrawDebugBox(n"Camera", local_128, FVector(100.0, 100.0, 0.0), FQuat::Identity, FColor(uint8(125), uint8(255), uint8(125), uint8(128)), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                }
            }
            if (CVar_Camera_DebugLookAtTarget.GetBool())
            {
                FECSDebugDraw::SetDebugKeyEnable(n"Camera", true);
                FECSDebugDraw::DrawDebugSphere(n"Camera", local_6.GetPresentationLockTargetPosition(), 25.0f, 16, FColor(uint8(0), uint8(255), uint8(0), uint8(128)), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                FECSDebugDraw::DrawDebugSphere(n"Camera", local_38, 25.0f, 16, FColor(uint8(255), uint8(0), uint8(0), uint8(128)), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
            }
            FVector3f local_121 = FVector3f((local_38 - local_44));
            FCameraUtils::UpdateCameraLookAt(local_10, local_44, local_121, local_81, local_52);
            if ((!((local_10 == Entity))))
            {
                FCameraUtils::UpdateCameraLookAt(Entity, local_44, local_121, local_81, local_52);
            }
        }
        else
        {
            FCameraUtils::ClearCameraLookAt(local_10);
            if (!((local_10 == Entity)))
            {
                FCameraUtils::ClearCameraLookAt(Entity);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickDitherParam(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        float32 local_11;
        local_11 = FCameraUtils::GetCameraParam(LocalPlayer.GetCameraViewTargetEntity()).StateParams.GetArmLength();
        float32 local_12 = (CVar_Camera_ForegroundDitherParam_StartK.GetFloat() * local_11) + CVar_Camera_ForegroundDitherParam_StartB.GetFloat();
        float32 local_13 = FMath::Max(((CVar_Camera_ForegroundDitherParam_EndK.GetFloat() * local_11) + CVar_Camera_ForegroundDitherParam_EndB.GetFloat()), local_12);
        GameVisualCue::GameVisualCue_OverrideMaterialForegroundDitherParam(__GetWorldContext(), local_12, local_13, CVar_Camera_ForegroundDitherParam_MinOpacity.GetFloat());
        return;
    }
    UFUNCTION()
    void Monitor_AffectorOffOnDeath(const FECSEntity &inout Entity, const FC_DeathTag &inout DeathTag) const
    {
        Modify local_4;
        FC_CameraAffector& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbActive(false);
        }
        return;
    }
    UFUNCTION()
    void Monitor_AffectorOnOnRevive(const FECSEntity &inout Entity, const FC_DeathTag &inout DeathTag) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Modify local_6;
        FC_CameraAffector& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetbActive(true);
        }
        return;
    }
    UFUNCTION()
    void Job_TickCameraAffector(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_CameraAffector &inout Affector) const
    {
        int local_166 = 0;
        int local_206 = 0;
        TDataObjectPtr<FTPCameraModifierConfig> local_244;
        FFPTime local_2 = FFPTime(ECS::GetContextTime());
        bool local_5 = !(Affector.GetbActive());
        bool local_6 = !(false);
        if (local_5 == local_6)
        {
            return;
        }
        FECSRuntimeQuery local_92 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(Entity, Transform.GetPosition(), (Affector.GetMaxRadius() + 1000.0f), EECSQueryRegsitryType(1), false);
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        if (!(CVar_Camera_DebugCameraAffector.GetBool()))
        {
            local_5 = false;
        }
        else
        {
            local_5 = ECS::GetRuntimeInfo().IsServer;
        }
        if (local_5)
        {
            FECSDebugDraw::SetDebugKeyEnable(n"Camera", true);
            if (Affector.GetConfig().GetAffectorLevelCount() > 0)
            {
                FECSDebugDraw::DrawDebugSphere(n"Camera", Transform.GetPosition(), Affector.GetConfig().GetRadius0(), 16, FColor(uint8(0), uint8(255), uint8(0), uint8(255)), FColor::Transparent, 0.15f, uint8(0), 0.0f);
            }
            if (Affector.GetConfig().GetAffectorLevelCount() > 1)
            {
                FECSDebugDraw::DrawDebugSphere(n"Camera", Transform.GetPosition(), Affector.GetConfig().GetRadius1(), 16, FColor(uint8(0), uint8(255), uint8(0), uint8(128)), FColor::Transparent, 0.15f, uint8(0), 0.0f);
            }
            if (Affector.GetConfig().GetAffectorLevelCount() > 2)
            {
                FECSDebugDraw::DrawDebugSphere(n"Camera", Transform.GetPosition(), Affector.GetConfig().GetRadius2(), 16, FColor(uint8(0), uint8(255), uint8(0), uint8(64)), FColor::Transparent, 0.15f, uint8(0), 0.0f);
            }
        }
        TArray<FECSEntity> local_114;
        FName local_118 = ::GetCameraAffectorSounceIdentifierForEntity(Entity);
        FECSRuntimeQueryIterator local_140 = local_92.Iterator();
        for (; local_140.CanProceed;)
        {
            const FECSEntity& local_164 = local_140.Proceed();
            if ((local_164 == Entity))
            {
                continue;
            }
            float32 local_50 = FVector3f((FVector(local_166.GetPosition()) - Transform.GetPosition())).SizeSquared();
            if (local_50 > FMath::Square(Affector.GetMaxRadius()))
            {
                continue;
            }
            FECSEntity local_192 = FECSEntity(local_164);
            FECSEntity local_200 = ::FASCommonUtils::GetUniquePlayerEntity(local_192);
            if (!((local_200 == local_192)))
            {
                if (local_114.Contains(local_200))
                {
                    continue;
                }
                local_114.Add(local_200);
                local_192 = local_200;
            }
            const FDataObjectPtr& local_208 = Affector.GetAffectorItem().GetConfigByDistanceSQ(local_50);
            local_206.SetLastUpdateTime(local_2);
            int local_101 = local_206.GetModifiersFromSource().IndexOfByKey(Entity.GetId());
            if (!(local_208.IsValid()))
            {
                const FCameraAffectorItem& local_212 = Affector.GetAffectorItem();
                FString local_216 = FString().Append("Radius0=").Append(local_212.GetRadius0()).Append(", Config0=").Append(local_212.GetConfig0().GetDataName());
                if (local_212.GetAffectorLevelCount() > 1)
                {
                    local_216 += FString().Append(", Radius1=").Append(local_212.GetRadius1()).Append(", Config1=").Append(local_212.GetConfig1().GetDataName());
                }
                if (local_212.GetAffectorLevelCount() > 2)
                {
                    local_216 += FString().Append(", Radius2=").Append(local_212.GetRadius2()).Append(", Config2=").Append(local_212.GetConfig2().GetDataName());
                }
                if (local_101 != -1)
                {
                    local_244 = TDataObjectPtr<FTPCameraModifierConfig>(local_206.GetModifiers()[local_101]);
                    FCameraUtils::StopModifier(local_192, local_2, local_118, local_244, -1.0f, true);
                    local_206.GetModify_Modifiers().RemoveAtSwap(local_101);
                    local_206.GetModify_ModifiersFromSource().RemoveAtSwap(local_101);
                    local_206.GetModify_ModifiersUpdateTime().RemoveAtSwap(local_101);
                }
                continue;
            }
            if (local_101 != -1)
            {
                FDataObjectPtr local_268 = FDataObjectPtr(local_206.GetModifiers()[local_101]);
                if ((!((local_268.GetDataName() == local_208.GetDataName()))))
                {
                    FCameraUtils::StopModifier(local_192, local_2, local_118, local_244, -1.0f, true);
                    FCameraUtils::StartModifier(local_192, local_2, local_118, TDataObjectPtr<FTPCameraModifierConfig>(local_208), -1.0f);
                    local_206.GetModify_Modifiers()[local_101] = local_208;
                }
                local_206.GetModify_ModifiersUpdateTime()[local_101] = local_2;
                continue;
            }
            local_206.GetModify_Modifiers().Add(local_208);
            local_206.GetModify_ModifiersFromSource().Add(Entity.GetId());
            local_206.GetModify_ModifiersUpdateTime().Add(local_2);
            FCameraUtils::StartModifier(local_192, local_2, local_118, TDataObjectPtr<FTPCameraModifierConfig>(local_208), -1.0f);
        }
        return;
    }
    UFUNCTION()
    void Job_TickRemoveCameraAffected(const FECSEntity &inout Entity, FC_CameraAffected &inout CameraAffected) const
    {
        FFPTime local_2 = FFPTime(ECS::GetContextTime());
        int local_5 = 0;
        for (; local_5 < CameraAffected.GetModifiers().Num(); ++local_5)
        {
            if (FFPTime(CameraAffected.GetModifiersUpdateTime()[local_5]).opCmp(local_2) >= 0)
            {
                continue;
            }
            FCameraUtils::StopModifier(Entity, local_2, ::GetCameraAffectorSounceIdentifierForEntity(FECSEntity(CameraAffected.GetModify_ModifiersFromSource()[local_5])), TDataObjectPtr<FTPCameraModifierConfig>(CameraAffected.GetModifiers()[local_5]), -1.0f, true);
            CameraAffected.GetModify_Modifiers().RemoveAtSwap(local_5);
            CameraAffected.GetModify_ModifiersFromSource().RemoveAtSwap(local_5);
            CameraAffected.GetModify_ModifiersUpdateTime().RemoveAtSwap(local_5);
            --local_5;
        }
        if (CameraAffected.GetModifiers().Num() == 0)
        {
            Remove local_46;
            local_46.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnInactiveClearCamera(const FECSEntity &inout Entity, const FC_LocalControlledTag &inout LocalControlledTag) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        FCameraUtils::ClearCameraLookAt(Entity);
        Remove local_6;
        local_6.opCall();
        Get local_10;
        const FC_ControlledByPlayer& local_12 = local_10.opCall();
        if (local_12)
        {
            if (local_12.GetPlayerEntity().IsValid())
            {
                FC_FrontendSystemCameraOverrideNeedUpdateTag local_18;
                Assign local_16;
                local_16.opCall(local_18);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_SetCameraPose(const FCE_ServerToClientSetCameraPose &inout Event) const
    {
        if (Event.bTeleportToTarget)
        {
            FECSWorldPtr local_4 = this.GetECSWorld();
            Assign local_8;
            local_8.opCall(FCS_TPCameraTeleportToTargetTag());
        }
        if (Event.bSetRotation)
        {
            FECSWorldPtr local_4_2 = this.GetECSWorld();
            Modify local_14;
            FCS_InputLocal& local_16 = local_14.opCall();
            if (local_16)
            {
                local_16.ViewDir = Event.Rotation;
                local_16.ViewDir.Roll = 0.0;
            }
        }
        return;
    }
    UFUNCTION()
    void Run_InitTPCameraParamOnEnterDS() const
    {
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        this.InitTPCameraParamOnEnterDS();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PollCVarAndSendEvent() const
    {
        const FECSEntity& local_40;
        int local_164 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_9 = 0;
        int local_8 = local_9;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_2.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_PollCVarAndSendEvent(local_40);
            }
            local_2.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        Exclude(local_78).opCall();
        bool local_7 = local_2.BeginViewCacheBuild();
        int local_18 = local_2.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_78.Iterator();
        for (; local_126.CanProceed;)
        {
            local_40 = local_126.Proceed();
            ++local_92;
            if (local_7)
            {
                local_2.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_PollCVarAndSendEvent(local_164);
        }
        local_2.UpdateCachedEntityCount(local_92);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClearCameraModifierOnReconnect() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
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
                this.ClearCameraModifierOnReconnect(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClearCameraModifierOnReconnect(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleSetAdditionalInputModifierIndex() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SetAdditionalInputModifierIndexNotify> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SetAdditionalInputModifierIndexNotify& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_SetAdditionalInputModifierIndexNotify, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleSetAdditionalInputModifierIndex(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleTPCameraSystemASLockInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_192 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_HandleTPCameraSystemASLockInput(local_40, local_42, local_6, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_ESMTrigger> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_94.Iterator();
        for (; local_154.CanProceed;)
        {
            local_40 = local_154.Proceed();
            ++local_120;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HandleTPCameraSystemASLockInput(local_192, local_42, local_6, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_ESMTrigger>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_120);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleCameraFreezeAndLookAtFollowTarget() const
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
        TECSEventConstIterator<FCE_CameraFreezeAndLookAtFollowTarget> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_CameraFreezeAndLookAtFollowTarget& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_HandleCameraFreezeAndLookAtFollowTarget(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleCameraUnFreezeAndLookAtFollowTarget() const
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
        TECSEventConstIterator<FCE_CameraUnFreezeAndLookAtFollowTarget> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_CameraUnFreezeAndLookAtFollowTarget& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_HandleCameraUnFreezeAndLookAtFollowTarget(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ApplyLockTargetOrAim() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_170 = 0;
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
                this.Job_ApplyLockTargetOrAim(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ApplyLockTargetOrAim(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickDitherParam() const
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
        this.ClientJob_TickDitherParam(local_12);
        return;
    }
    UFUNCTION()
    void Run_Monitor_AffectorOffOnDeath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AffectorOffOnDeath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AffectorOnOnRevive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathTagOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AffectorOnOnRevive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCameraAffector() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.15))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.Job_TickCameraAffector(local_42, local_44, local_50);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_92.Iterator();
        for (; local_140.CanProceed;)
        {
            local_42 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_TickCameraAffector(local_178, local_44, local_50);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickRemoveCameraAffected() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.15))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.Job_TickRemoveCameraAffected(local_42, local_44);
                local_52.opCall(local_44);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_42 = local_138.Proceed();
            ++local_104;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_TickRemoveCameraAffected(local_176, local_44);
            local_52.opCall(local_44);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInactiveClearCamera() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorLocalControlledTagOnInactiveView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnInactiveClearCamera(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_SetCameraPose() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerToClientSetCameraPose> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerToClientSetCameraPose& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_SetCameraPose(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

FName GetCameraAffectorSounceIdentifierForEntity(const FECSEntity &inout Entity)
{
    return FName(CameraAffectorSourceIdentifier, Entity.GetIdValue());
}
