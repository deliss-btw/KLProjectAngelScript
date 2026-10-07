

class UESMAnimInstance_Base : UKLAnimInstance
{
    UPROPERTY()
    UMirrorDataTable MirrorDataTable;
    UPROPERTY()
    UBlendSpace SteeringOffsetAO;
    UPROPERTY()
    bool bDebugTrigger;
    UPROPERTY()
    FECSEntity CurrentEntity;
    UPROPERTY()
    FESMAnimState UpperLayer;
    UPROPERTY()
    FESMAnimState MainLayer;
    UPROPERTY()
    float32 ExternalTransitDuration;
    UPROPERTY()
    EWeaponType CharacterWeaponType;
    UPROPERTY()
    bool NeedTransitWeaponType;
    UPROPERTY()
    float32 AttachMoveGait;
    UPROPERTY()
    float32 BeHitShakeTime;
    UPROPERTY()
    float32 BeHitShakeRatio;
    UPROPERTY()
    FName BeHitShakeBoneName;
    UPROPERTY()
    EHitShakeBodyType HitShakeBodyType;
    UPROPERTY()
    TArray<FBeShakeBodyInfo> BodyShakeData;
    UPROPERTY()
    FVector RelativeDesiredVelocity;
    UPROPERTY()
    float32 DesiredMoveAngleRelativeToBodySmoothed;
    UPROPERTY()
    float32 HDesiredMoveAngleRelativeToBodySmoothed;
    UPROPERTY()
    FC_AnimLeanParams AnimLeanParams;
    UPROPERTY()
    FC_AnimFloorInfo AnimFloorInfo;
    UPROPERTY()
    FC_AnimAimTargetControl AnimAimTargetControl;
    UPROPERTY()
    FC_AnimMoveParams AnimMoveParams;
    UPROPERTY()
    FC_AnimHeadControlData HeadControl;
    UPROPERTY()
    FC_FootIKControl FootIKControl;
    UPROPERTY()
    FC_LayeredBlendMask LayeredBlendMask;
    UPROPERTY()
    FC_LayeredBlendMask PreviewLayeredBlendMask;
    UPROPERTY()
    FC_AnimIdleHeadControl MountIdleHeadControl;
    UPROPERTY()
    FC_TuneESMBBFloatValue TuneESMBBFloatValue;
    UPROPERTY()
    FC_EstimatedSpeed EstimatedSpeed;
    UPROPERTY()
    FC_FloatInterpolation FloatInterpolation;
    UPROPERTY()
    FC_FootPlacement FootPlacement;
    UPROPERTY()
    FC_LookResolved LookResolved;
    UPROPERTY()
    FC_AnimResolved AnimResolved;
    UPROPERTY()
    FC_AnimAimPoseOutput AnimAimPoseOutput;
    UPROPERTY()
    FC_AimPoseConfig AimPoseConfig;
    UPROPERTY()
    float32 FootIKWeight;
    UPROPERTY()
    UBlendProfile ResolvedBlendMask;
    UPROPERTY()
    FC_AnimParamDynamicAdditiveConfig DynamicAdditiveAnimDataConfig;
    UPROPERTY()
    FC_AnimParamDynamicAdditive DynamicAdditiveAnimData;

    UESMAnimInstance_Base()
    {
        this.bDebugTrigger = false;
        this.ExternalTransitDuration = 0.2f;
        this.FootIKWeight = 1.0f;
        this.UpperLayer.SetLayer(n"UpperLayer");
        this.MainLayer.SetLayer(n"MainLayer");
        return;
    }
    void UpdataCharacterEntityBBData(const FFPTime &inout LocalTime)
    {
        return;
    }
    UFUNCTION()
    void BlueprintBeginPlay_Implementation()
    {
        return;
    }
    UFUNCTION()
    void BlueprintInitializeAnimation_Implementation()
    {
        this.BodyShakeData.SetNum(8);
        return;
    }
    void HandleFootPhase(const FC_CharacterAnimData &inout InterpolatedAnimData, const FFPTime &inout WorldTime)
    {
        return;
    }
    UFUNCTION()
    bool IsLocalPlayer_Implementation() const
    {
        if (this.Entity.IsValid())
        {
            FECSEntity local_6 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
            return (FECSEntity(this.Entity) == local_6);
        }
        return false;
    }
    UFUNCTION()
    void WhenUpdateMainAnimInstance_Implementation(const float32 DeltaTimeX)
    {
        int local_22 = 0;
        int local_28 = 0;
        bool local_119;
        if (this.Entity.IsValid())
        {
            if (DeltaTimeX != 0.0f)
            {
                this.CurrentEntity = this.Entity;
            }
            FFPTime local_6 = this.GetContextSampleTime();
            bool local_1 = !(this.GetbLogicUpdate());
            if (local_1)
            {
                Get local_10;
                const FC_InterpoTime& local_12 = local_10.opCall();
                if (local_12)
                {
                    local_6 = local_12.Time;
                }
            }
            if (local_6.opCmp(0.0) >= 0)
            {
                if (!(local_22))
                {
                    local_1 = false;
                }
                else
                {
                    local_1 = local_28;
                }
                if (local_1)
                {
                    FC_Transform local_52;
                    FC_CharacterAnimData local_72;
                    if (local_28.GetInterpoValue(local_6, local_72) && local_22.GetInterpoValue(local_6, local_52))
                    {
                        this.UpdateCharacterAnimData(local_6, local_72, local_52.ToFTransform());
                    }
                    this.HandleFootPhase(local_72, local_6);
                }
                Get local_100;
                const FC_CharacterWeapon& local_102 = local_100.opCall();
                if (local_102)
                {
                    EWeaponType local_103;
                    local_103 = this.CharacterWeaponType;
                    EWeaponType local_104 = local_102.GetCurrentWeaponType();
                    this.CharacterWeaponType = EWeaponType(local_104);
                    this.NeedTransitWeaponType = int(local_103) != int(local_102.GetCurrentWeaponType()) && (int(local_103) != 0);
                }
                Get local_110;
                const FC_AnimMoveParamsTempHistory& local_112 = local_110.opCall();
                if (local_112)
                {
                    FC_AnimMoveParamsTemp local_114;
                    if (local_112.GetInterpoValue(local_6, local_114))
                    {
                        this.DesiredMoveAngleRelativeToBodySmoothed = local_114.GetDesiredMoveAngleRelativeToBodySmoothed();
                    }
                    if (local_112.GetInterpoValue((local_6 - 0.2), local_114))
                    {
                        this.HDesiredMoveAngleRelativeToBodySmoothed = local_114.GetDesiredMoveAngleRelativeToBodySmoothed();
                    }
                }
                this.UpdateBeHitShakeData(local_6);
            }
            else
            {
            }
            if (DeltaTimeX > 0.0f)
            {
                this.UpdataCharacterEntityBBData(local_6);
            }
            this.UpdateAnimationVariant(EWeaponType(this.CharacterWeaponType), this.NeedTransitWeaponType);
        }
        if (this.GetWorld() == nullptr)
        {
            local_119 = false;
        }
        else
        {
            bool local_29;
            local_29 = !(this.GetWorld().IsGameWorld());
            local_29 = (local_29 == !(false));
            local_119 = local_29;
        }
        if (local_119)
        {
            this.LayeredBlendMask = this.PreviewLayeredBlendMask;
        }
        UBlendProfileStandalone local_134 = (Cast<UBlendProfileStandalone>(this.LayeredBlendMask.GetBlendMaskStandalonePath().ResolveObject()));
        this.ResolvedBlendMask = ULayeredBoneBlendLibraryExt::ResolveToBlendProfile_GameThread(local_134);
        this.UpdateDynamicAdditiveAnimData();
        return;
    }
    void HandleHitShake(const FC_AnimBeHitShake &inout AnimBeHitShake)
    {
        return;
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_18 = 0;
        int local_34 = 0;
        int local_50 = 0;
        int local_60 = 0;
        int local_82 = 0;
        int local_118 = 0;
        int local_136 = 0;
        int local_150 = 0;
        int local_162 = 0;
        int local_174 = 0;
        int local_182 = 0;
        int local_192 = 0;
        int local_232 = 0;
        int local_264 = 0;
        int local_296 = 0;
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.AnimLeanParams)))
        {
            FC_AnimLeanParams local_12;
            this.AnimLeanParams = local_12;
        }
        if (!(local_18) || !(local_18.GetInterpoValue(SampleTime, this.AnimFloorInfo)))
        {
            FC_AnimFloorInfo local_28;
            this.AnimFloorInfo = local_28;
        }
        if (!(local_34) || !(local_34.GetInterpoValue(SampleTime, this.AnimAimTargetControl)))
        {
            FC_AnimAimTargetControl local_44;
            this.AnimAimTargetControl = local_44;
        }
        if (!(local_50) || !(local_50.GetInterpoValue(SampleTime, this.AnimMoveParams)))
        {
            FC_AnimMoveParams local_54;
            this.AnimMoveParams = local_54;
        }
        if (!(local_60) || !(local_60.GetInterpoValue(SampleTime, this.HeadControl)))
        {
            FC_AnimHeadControlData local_76;
            this.HeadControl = local_76;
        }
        if (!(local_82) || !(local_82.GetInterpoValue(SampleTime, this.FootIKControl)))
        {
            FC_FootIKControl local_112;
            this.FootIKControl = local_112;
        }
        if (!(local_118) || !(local_118.GetInterpoValue(SampleTime, this.LayeredBlendMask)))
        {
            FC_LayeredBlendMask local_130;
            this.LayeredBlendMask = local_130;
        }
        if (!(local_136) || !(local_136.GetInterpoValue(SampleTime, this.MountIdleHeadControl)))
        {
            FC_AnimIdleHeadControl local_144;
            this.MountIdleHeadControl = local_144;
        }
        if (!(local_150) || !(local_150.GetInterpoValue(SampleTime, this.TuneESMBBFloatValue)))
        {
            FC_TuneESMBBFloatValue local_156;
            this.TuneESMBBFloatValue = local_156;
        }
        if (!(local_162) || !(local_162.GetInterpoValue(SampleTime, this.EstimatedSpeed)))
        {
            FC_EstimatedSpeed local_168;
            this.EstimatedSpeed = local_168;
        }
        if (!(local_174) || !(local_174.GetInterpoValue(SampleTime, this.FloatInterpolation)))
        {
            FC_FloatInterpolation local_176;
            this.FloatInterpolation = local_176;
        }
        if (!(local_182) || !(local_182.GetInterpoValue(SampleTime, this.FootPlacement)))
        {
            FC_FootPlacement local_186;
            this.FootPlacement = local_186;
        }
        if (!(local_192) || !(local_192.GetInterpoValue(SampleTime, this.AnimAimPoseOutput)))
        {
            FC_AnimAimPoseOutput local_226;
            this.AnimAimPoseOutput = local_226;
        }
        if (!(local_232) || !(local_232.GetInterpoValue(SampleTime, this.AimPoseConfig)))
        {
            FC_AimPoseConfig local_258;
            this.AimPoseConfig = local_258;
        }
        if (!(local_264) || !(local_264.GetInterpoValue(SampleTime, this.DynamicAdditiveAnimDataConfig)))
        {
            FC_AnimParamDynamicAdditiveConfig local_290;
            this.DynamicAdditiveAnimDataConfig = local_290;
        }
        if (!(local_296) || !(local_296.GetInterpoValue(SampleTime, this.DynamicAdditiveAnimData)))
        {
            FC_AnimParamDynamicAdditive local_322;
            this.DynamicAdditiveAnimData = local_322;
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncView_Implementation()
    {
        return;
    }
    float32 NormalizeCalculateElapsedTime(const FFPTime &inout ElapsedTime, const float32 MaxElapsedTime) const
    {
        if (ElapsedTime.opCmp(MaxElapsedTime) > 0 || (ElapsedTime.opCmp(0.0) < 0) || (MaxElapsedTime <= 0.0f))
        {
            return -1.0f;
        }
        return (float32(ElapsedTime.ToSeconds()) / MaxElapsedTime);
    }
    void UpdateCharacterAnimData(const FFPTime &inout LocalTime, const FC_CharacterAnimData &inout CharacterAnimData, const FTransform &inout InCharacterTransform)
    {
        float32 local_8;
        this.bDebugTrigger = false;
        APlayerController local_4 = ::FASCommonUtils::GetLocalPlayerController();
        if (local_4 != nullptr && local_4.WasInputKeyJustPressed(EKeys::Up))
        {
            this.bDebugTrigger = true;
        }
        if (this.Entity.MatchGameplayTag(GameplayTags::ESM_Ban_IK))
        {
            local_8 = 0.0f;
        }
        else
        {
            local_8 = 1.0f;
        }
        this.FootIKWeight = local_8;
        return;
    }
    void UpdateAnimationVariant(const EWeaponType WeaponType, const bool NeedTransit)
    {
        if (NeedTransit)
        {
            this.RequestInertial(this.ExternalTransitDuration);
        }
        Get local_6;
        const FC_AnimState& local_8 = local_6.opCall();
        if (local_8)
        {
            this.SetAnimVariantType(local_8.GetVariantType());
            return;
        }
        this.SetAnimVariantType(int(::AvatarAnimVariant::GetVariantType(this.CharacterWeaponType)));
        return;
    }
    float32 UpdateAdditiveBlendWeight(const float32 BlendValue)
    {
        int local_3 = BlendValue > 0.0f ? 1 : 0;
        return local_3;
    }
    void UpdateBeHitShakeData(const FFPTime &inout SampleTime)
    {
        const AActor local_30;
        UCapsuleComponent local_38;
        if (this.GetbLogicUpdate())
        {
            this.BeHitShakeRatio = 0.0f;
            this.BeHitShakeBoneName = NAME_None;
            this.BeHitShakeTime = 0.0f;
            return;
        }
        Get local_6;
        const FC_AnimBeHitShake& local_8 = local_6.opCall();
        if (local_8)
        {
            this.BeHitShakeRatio = local_8.BeHitShakeRatio;
            this.BeHitShakeBoneName = local_8.BeHitShakeBoneName;
            this.BeHitShakeTime = this.NormalizeCalculateElapsedTime((SampleTime - local_8.BeHitShakeStartTime), local_8.BeHitShakeDuration);
            if (!(this.BodyShakeData.IsEmpty()))
            {
                for (auto& local_26 : this.BodyShakeData)
                {
                    local_26.BeHitShakeTime = this.NormalizeCalculateElapsedTime((SampleTime - local_26.BeHitShakeStartTime), local_26.BeHitShakeDuration);
                    float32 local_11 = 1.0f;
                    local_26.BeHitShakeScale = 1.0f;
                    local_30 = this.Entity.GetActor();
                    if (local_30 != nullptr)
                    {
                        float32 local_31 = 1.0f;
                        local_38 = Cast<UCapsuleComponent>(local_30.GetRootComponent());
                        if (local_38 != nullptr)
                        {
                            float local_104 = 1.0 / local_38.GetRelativeTransform().GetScale3D().Size();
                            local_31 = float32(local_104);
                        }
                        local_11 = local_8.BeHitShakeRatio * local_31;
                        local_26.BeHitShakeScale = local_11;
                    }
                }
            }
        }
        return;
    }
    void UpdateDynamicAdditiveAnimData()
    {
        UAnimSequence local_68;
        if (this.DynamicAdditiveAnimDataConfig.GetConfigPtr())
        {
            this.DynamicAdditiveAnimData.SetTargetSequenceAsset(local_68);
            this.DynamicAdditiveAnimData.SetSourceSequenceAsset(local_68);
            if (this.DynamicAdditiveAnimData.GetTargetSequenceAsset() == nullptr || (this.DynamicAdditiveAnimData.GetSourceSequenceAsset() == nullptr))
            {
                this.DynamicAdditiveAnimData.SetTargetSequenceAsset(nullptr);
                this.DynamicAdditiveAnimData.SetSourceSequenceAsset(nullptr);
            }
            return;
        }
        this.DynamicAdditiveAnimData.SetTargetSequenceAsset(nullptr);
        this.DynamicAdditiveAnimData.SetSourceSequenceAsset(nullptr);
        return;
    }
    UFUNCTION()
    float32 GetStateDuration(const FName &inout StateName) const
    {
        int local_2 = 0;
        if (local_2)
        {
            return float32((local_2.GetStateDurationSeconds(StateName, this.UpdatedTime).ToSeconds()));
        }
        return 0.0f;
    }
    bool GetForceTransit(const FESMAnimState &inout AnimState) const
    {
        for (auto& local_16 : this.AnimLayerInfo)
        {
            if ((FName(local_16.Layer) == AnimState.GetLayer()))
            {
                return local_16.ForceTransit;
            }
        }
        return false;
    }
    UFUNCTION()
    void UpdateMainLayerBlendStackNode(const FAnimUpdateContext &in Context, const FAnimNodeReference &in Node) const
    {
        EAnimNodeReferenceConversionResult local_1 = EAnimNodeReferenceConversionResult(0);
        FBlendStackAnimNodeReference local_6 = BlendStackAnimNode::ConvertToBlendStackNode(Node, local_1);
        if (int(local_1) == 1)
        {
            local_6.UpdateBlendStack(Context, this.MainLayer, this.GetbLogicUpdate(), this.GetForceTransit(this.MainLayer));
        }
        return;
    }
    UFUNCTION()
    void UpdateUpperLayerBlendStackNode(const FAnimUpdateContext &in Context, const FAnimNodeReference &in Node) const
    {
        EAnimNodeReferenceConversionResult local_1 = EAnimNodeReferenceConversionResult(0);
        FBlendStackAnimNodeReference local_6 = BlendStackAnimNode::ConvertToBlendStackNode(Node, local_1);
        if (int(local_1) == 1)
        {
            local_6.UpdateBlendStack(Context, this.UpperLayer, this.GetbLogicUpdate(), this.GetForceTransit(this.UpperLayer));
        }
        return;
    }
    UFUNCTION()
    void UpdateLayeredBlendMask(const FAnimUpdateContext &in Context, const FAnimNodeReference &in Node) const
    {
        if (this.LayeredBlendMask.GetBlendWeight() <= 0.0f)
        {
            return;
        }
        if (this.ResolvedBlendMask == nullptr)
        {
            return;
        }
        EAnimNodeReferenceConversionResult local_7 = EAnimNodeReferenceConversionResult(0);
        FLayeredBoneBlendReference local_16 = LayeredBoneBlend::ConvertToLayeredBoneBlend(Node, local_7);
        if (int(local_7) != 1)
        {
            return;
        }
        LayeredBoneBlend::SetInertiaBlendTime(Context, local_16, this.LayeredBlendMask.GetBlendTime());
        LayeredBoneBlend::SetRootSpaceRotationBlend(Context, local_16, this.LayeredBlendMask.GetbIsRootSpaceBlend(), this.LayeredBlendMask.GetbIsMeshSpaceBlend());
        ULayeredBoneBlendLibraryExt::SetStandaloneBlendMask(Context, local_16, 0, this.ResolvedBlendMask);
        return;
    }
}

