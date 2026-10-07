

struct FFireProjectileActionInstanceData
{
    UPROPERTY()
    FECSEntityId ProjectileEntity;
    UPROPERTY()
    float FireModeTickCurrentTime;
    UPROPERTY()
    FRotator3f LastFireRotation;


}

class UESMAction_FireProjectile : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FFireProjectileConfig FireConfig;
    UPROPERTY()
    bool bControlProjectileLifeTime = false;
    UPROPERTY()
    bool bControlProjectileLifeTimeElseWhere = false;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity SaveProjectileEntityToBBVar;
    UPROPERTY()
    float32 OverrideLifeTime = -1.0f;
    UPROPERTY()
    FProjectileFireModeConfig FireModeConfig;
    UPROPERTY()
    bool bAddRandomRotationOffset = false;
    UPROPERTY()
    FRotator3f RandomRotationOffsetMin;
    UPROPERTY()
    FRotator3f RandomRotationOffsetMax;
    UPROPERTY()
    bool bOverrideSimpleProjectileMovement = false;
    UPROPERTY()
    FSimpleProjectileMovementConfigData OverrideSimpleProjectileMovementData;
    UPROPERTY()
    bool bAutoCalcProjectileMovementToTarget = false;
    UPROPERTY()
    FProjectileMovementCalculationData AutoCalcProjectileMovementData;
    UPROPERTY()
    bool bMoveFollowParent = false;
    UPROPERTY()
    bool bMoveFollowParentRotation = true;
    UPROPERTY()
    bool bDirectionFollowParentRotation = true;
    UPROPERTY()
    bool bEnableFollowByTime = false;
    UPROPERTY()
    TArray<FTimeEnablePair> EnableFollowByTimeData;
    UPROPERTY()
    bool bHasCurveMove = false;
    UPROPERTY()
    UCurveVector MoveWithCurve;
    UPROPERTY()
    bool bRotateCurveByProjectileForward = false;
    UPROPERTY()
    bool bScaleCurveByLockTargetDistance = false;
    UPROPERTY()
    float32 CurveForwardMaxDistance = 500.0f;
    UPROPERTY()
    float32 MinScaleRatio = 0.5f;
    UPROPERTY()
    float32 MaxScaleRatio = 2.0f;
    UPROPERTY()
    bool bSetCurveMoveTotalTime = false;
    UPROPERTY()
    float32 CurveMoveTotalTime = 1.0f;
    UPROPERTY()
    bool bUseOwnerRotationAsCurveRotation = true;
    UPROPERTY()
    bool bHasCurveRotation = false;
    UPROPERTY()
    UCurveVector RotationCurve;
    UPROPERTY()
    float32 RotationCurveScale = 1.0f;
    UPROPERTY()
    bool bSetCurveRotationTotalTime = false;
    UPROPERTY()
    float32 CurveRotationTotalTime = 1.0f;
    UPROPERTY()
    bool bUseStateTimeAsCurveSampleTime = false;
    UPROPERTY()
    float32 DelaySampleTime = 0.0f;
    UPROPERTY()
    bool bKeepMoveAfterExit = false;
    UPROPERTY()
    bool bTrackTarget = false;
    UPROPERTY()
    EProjectileTrackType TrackType = EProjectileTrackType(0);
    UPROPERTY()
    bool bOverrideTrackTypeForAimShoot = false;
    UPROPERTY()
    EProjectileTrackType TrackTypeForAimShoot = EProjectileTrackType(0);
    UPROPERTY()
    bool bUseDefaultPosWhenNoTargetEntity = false;
    UPROPERTY()
    FVector DefaultPosOffset = FVector(500.0, 0.0, 0.0);
    UPROPERTY()
    FTrackTargetPosConfig TrackTargetPosConfig;
    UPROPERTY()
    FTrackTargetHistoryPosData TrackTargetHistoryPosConfig;
    UPROPERTY()
    EProjectileTrackTarget TrackTargetEntity = EProjectileTrackTarget(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TrackTargetEntityBBVar;
    UPROPERTY()
    ULockTargetConfig TrackSoftLockConfig;
    UPROPERTY()
    float32 TrackAimTraceLength = 1000.0f;
    UPROPERTY()
    FName TrackEntitySocket = NAME_None;
    UPROPERTY()
    bool bUseBBVarControlMovement = false;
    UPROPERTY()
    FNameHandle_EntityBBVarVector PositionBBVar;
    UPROPERTY()
    FNameHandle_EntityBBVarRotator RotationBBVar;
    UPROPERTY()
    FDataObjectPtr SelfCameraShakeConfigRef;
    UPROPERTY()
    bool bUseLegacyResourceManagement = true;
    UPROPERTY()
    EProjectileFireResourceType FireResourceType = EProjectileFireResourceType(0);
    UPROPERTY()
    float32 FireCostManipulateEnergy = 0.0f;
    UPROPERTY()
    float32 FireAccumulateHeatValue = 0.0f;
    UPROPERTY()
    bool bUseScalerResource = false;
    UPROPERTY()
    FScalerResourceConsumeConfig ScalerResourceConsumeConfig;
    UPROPERTY()
    UProjectileTimelineAsset TimelineAsset;
    UPROPERTY()
    FName TimelineInitState;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FFireProjectileActionInstanceData);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_8 = this.FireConfig.ProjectilePrefab.ToString();
        int local_13 = local_8.Find("/", ESearchCase(0), ESearchDir(1), -1);
        FString local_24;
        if (local_13 >= 0)
        {
            local_24 = local_8.Right(local_13 + 1);
        }
        else
        {
            local_24 = local_8;
        }
        FString local_4;
        if (this.FireConfig.PositionAttachRefName.Name.IsNone())
        {
            local_4 = "";
        }
        else
        {
            local_4 = FString().Append("<").Append(this.FireConfig.PositionAttachRefName.Name).Append("> ");
        }
        return FString().Append(local_4).Append("е­ђеј№: ").Append(this.FireConfig.ProjectilePrefab.GetAssetName());
    }
    UFUNCTION()
    EESMActionPredictPolicy GetPredictPolicy_Implementation() const
    {
        int local_2;
        if (this.FireConfig.bLocalPrediction)
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 2;
        }
        return EESMActionPredictPolicy(local_2);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return !((this.bControlProjectileLifeTime || (int(this.FireModeConfig.FireMode) == 1) || ((this.bHasCurveMove || this.bHasCurveRotation) && this.bUseStateTimeAsCurveSampleTime)));
    }
    UFUNCTION()
    bool GetDisableInstanceData_Implementation() const
    {
        return !((((this.bControlProjectileLifeTime || int(this.FireModeConfig.MultiProjectileFireMode) == 1 || (int(this.FireModeConfig.FireMode) == 1) || ((this.bHasCurveMove || this.bHasCurveRotation) && this.bUseStateTimeAsCurveSampleTime))) || this.bKeepMoveAfterExit));
    }
    UFUNCTION()
    EESMActionExitPolicy GetExitPolicy_Implementation() const
    {
        return EESMActionExitPolicy(2);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.FireConfig.bSpawnWithPredictPath)
        {
            ::FThrowUtils::TrySendThrowPredictPath(Context.GetEntity(), FThrowTargetInfo(this.FireConfig.ProjectileKey, Context.GetEntity().GetId()));
        }
        if (int(this.FireModeConfig.MultiProjectileFireMode) == 0)
        {
            this.TryFireProjectile(Context, Time);
            return;
        }
        if (int(this.FireModeConfig.MultiProjectileFireMode) == 1)
        {
            this.ModifyInstanceData(Context).LastFireRotation = this.FireConfig.RotationOffset;
            int local_15 = 0;
            for (; local_15 < this.FireModeConfig.FireNumPerInterval; )
            {
                this.TryFireProjectile(Context, Time);
                ++local_15;
            }
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (int(this.FireModeConfig.FireMode) == 1)
        {
            FFireProjectileActionInstanceData local_6;
            local_6 = this.ModifyInstanceData(Context);
            float local_8 = Time.ActionDeltaTime.ToSeconds();
            local_6.FireModeTickCurrentTime += local_8;
            if (local_6.FireModeTickCurrentTime >= this.FireModeConfig.FireInterval)
            {
                if (int(this.FireModeConfig.MultiProjectileFireMode) == 1)
                {
                    int local_13 = 0;
                    for (; local_13 < this.FireModeConfig.FireNumPerInterval; )
                    {
                        this.TryFireProjectile(Context, Time);
                        ++local_13;
                    }
                }
                else
                {
                    this.TryFireProjectile(Context, Time);
                }
                local_6.FireModeTickCurrentTime -= this.FireModeConfig.FireInterval;
            }
        }
        if (this.bControlProjectileLifeTime)
        {
            FFireProjectileActionInstanceData local_6;
            FECSEntity local_22 = FECSEntity(local_6.ProjectileEntity);
            if (local_22.IsValid() && ECS::IsAuthorityOrPrediction(local_22))
            {
                ModifyOrAdd local_30;
                FC_LifeTime& local_26 = local_30.opCall();
                if (local_26)
                {
                    FFPTime local_40 = (FFPTime(Time.WorldTime) + FFPTime(((Time.ActionDuration.ToSeconds() / Time.PlaySpeed) * (1.0 - (Time.ActionTime.ToSeconds() / Time.ActionDuration.ToSeconds())))));
                    FFPTime local_38_2 = (local_40 - local_26.GetSpawnTime());
                    local_26.SetLifeDuration(local_38_2);
                }
            }
        }
        if (this.bUseStateTimeAsCurveSampleTime)
        {
            FFireProjectileActionInstanceData local_6;
            FECSEntity local_18 = FECSEntity(local_6.ProjectileEntity);
            if (local_18.IsValid() && ECS::IsAuthorityOrPrediction(local_18))
            {
                if (this.bHasCurveMove)
                {
                    Modify local_44;
                    FC_CurveMovementOverride& local_46 = local_44.opCall();
                    if (local_46)
                    {
                        float32 local_11_3 = float32(Time.StateTime.ToSeconds());
                        local_46.SetSampleTime(local_11_3);
                    }
                }
                if (this.bHasCurveRotation)
                {
                    Modify local_50;
                    FC_CurveRotationOverride& local_52 = local_50.opCall();
                    if (local_52)
                    {
                        float local_32_2 = Time.StateTime.ToSeconds();
                        float32 local_11_4 = float32(local_32_2);
                        local_52.SetSampleTime(local_11_4);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_1 = !(this.bControlProjectileLifeTime) && !(this.bKeepMoveAfterExit);
        if (local_1)
        {
            return;
        }
        FECSEntity local_10;
        if (!(local_10.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            bool local_15;
            local_15 = ECS::GetRuntimeInfo().IsServer;
            if (local_15)
            {
                local_15 = true;
            }
            else
            {
                Has local_14;
                local_15 = local_14.opCall();
            }
            local_1 = local_15;
        }
        if (local_1)
        {
            if (this.bControlProjectileLifeTime)
            {
                ModifyOrAdd local_20;
                FC_LifeTime& local_22 = local_20.opCall();
                if (local_22)
                {
                    if (FFPTime(Time.ActionDuration).opCmp(0.0) <= 0)
                    {
                        local_22.SetCustomEndTime(Time.WorldTime);
                    }
                    else
                    {
                        FFPTime local_40 = (FFPTime(Time.WorldTime) + FFPTime(((Time.ActionDuration.ToSeconds() / Time.PlaySpeed) * (1.0 - (Time.ActionTime.ToSeconds() / Time.ActionDuration.ToSeconds())))));
                        FFPTime local_38_2 = (local_40 - local_22.GetSpawnTime());
                        local_22.SetLifeDuration(local_38_2);
                    }
                }
            }
            if (this.bKeepMoveAfterExit)
            {
                if (this.bHasCurveMove)
                {
                    Modify local_44;
                    FC_CurveMovementOverride& local_46 = local_44.opCall();
                    if (local_46)
                    {
                        local_46.SetKeepMoveAfterExit(true);
                    }
                }
                if (this.bHasCurveRotation)
                {
                    Modify local_50;
                    FC_CurveRotationOverride& local_52 = local_50.opCall();
                    if (local_52)
                    {
                        local_52.SetKeepMoveAfterExit(true);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Gizmos_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Preview_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        return;
    }
    UFUNCTION()
    void PreviewClear_Implementation(const FESMPreviewContext &inout Context)
    {
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
    UFUNCTION()
    TArray<FSoftObjectPath> CollectReferencedAsset_Implementation(const int CurrentVariantType) const
    {
        AECSPrefab local_18;
        TArray<FSoftObjectPath> local_4;
        int local_28 = 0;
        if ((!((this.FireConfig.ProjectilePrefab == nullptr))))
        {
            local_18 = this.FireConfig.ProjectilePrefab.Get().GetDefaultObject();
            if (local_18 == nullptr)
            {
                return local_4;
            }
            ::FProjectileUtils::CollectFXPaths(local_18, local_4);
            if (local_28)
            {
                UProjectileTimelineAsset local_30 = local_28.TimelineAssetRef.GetAsset();
                if (local_30 != nullptr)
                {
                    local_4.Append(local_30.TimelineConfigData.ReferencedAssets);
                }
            }
        }
        return local_4;
    }
    FFireProjectileActionInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FFireProjectileActionInstanceData __r;
        return __r;
    }
    FFireProjectileActionInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FFireProjectileActionInstanceData __r;
        return __r;
    }
    bool TryFireProjectile(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        int local_38 = 0;
        int local_60 = 0;
        int local_66 = 0;
        int local_130 = 0;
        int local_192 = 0;
        int local_212 = 0;
        int local_220 = 0;
        int local_226 = 0;
        int local_236 = 0;
        FVector local_268;
        int local_290 = 0;
        if (!(ECS::GetRuntimeInfo().IsClient))
        {
            local_7 = false;
        }
        else
        {
            Has local_6;
            local_7 = !(this.FireConfig.bLocalPrediction) || !(local_6.opCall());
        }
        if (local_7)
        {
            return false;
        }
        bool local_9 = true;
        bool local_8_2 = this.bUseLegacyResourceManagement;
        if (local_8_2)
        {
            Modify local_14;
            FC_ManipulateProp& local_16 = local_14.opCall();
            if (local_16)
            {
                Modify local_20;
                FC_ManipulateProp& local_22 = local_20.opCall();
                if (local_22)
                {
                    if (int(local_22.GetFireResourceType()) == 0)
                    {
                        if (this.FireCostManipulateEnergy > 0.0f)
                        {
                            local_16.SetEnergy((local_16.GetEnergy() - this.FireCostManipulateEnergy));
                        }
                    }
                    else
                    {
                        if (int(local_22.GetFireResourceType()) == 1)
                        {
                            if (this.FireAccumulateHeatValue > 0.0f && !(local_22.GetbIsOverHeat()))
                            {
                                local_22.SetHeatValue((local_22.GetHeatValue() + this.FireAccumulateHeatValue));
                                if (local_22.GetHeatValue() >= local_22.GetHeatValueMax())
                                {
                                    local_22.SetHeatValue(local_22.GetHeatValueMax());
                                    local_22.SetbIsOverHeat(true);
                                    local_16.SetbIsOverHeat(true);
                                }
                                local_16.SetHeatValue(local_22.GetHeatValue());
                                Remove local_32;
                                local_32.opCall();
                                local_38.TargetWorldTime = (ECS::GetContextTime() + FFPTime(local_22.GetStartOverHeatCoolDownTime()));
                            }
                        }
                    }
                }
            }
        }
        else
        {
            local_7 = this.bUseScalerResource;
            if (local_7)
            {
                Get local_50;
                const FC_PropManipulator& local_52 = local_50.opCall();
                if (local_52)
                {
                    const FECSEntity& local_54 = local_52.GetManipulatedPropEntity();
                    if (!(local_54))
                    {
                        local_8_2 = false;
                    }
                    else
                    {
                        local_8_2 = local_60;
                    }
                    if (!(local_8_2))
                    {
                        local_7 = false;
                    }
                    else
                    {
                        local_7 = local_66;
                    }
                    if (local_7)
                    {
                        if (!(::FScalerResourceUtils::DealConsumeScalerResource(local_54, local_60, local_66, this.ScalerResourceConsumeConfig)))
                        {
                            local_9 = false;
                        }
                    }
                }
            }
        }
        if (!(local_9))
        {
            return false;
        }
        if (this.FireConfig.bLocalPrediction && !(this.FireConfig.bInterpoBlendWithOwner))
        {
        }
        FFPTime local_70 = FFPTime();
        FFPTime local_70_2 = -1;
        if (this.bControlProjectileLifeTime)
        {
            if (FFPTime(Time.ActionDuration).opCmp(0.0) <= 0)
            {
            }
            else
            {
                float32 local_27_2 = Time.PlaySpeed;
            }
            local_70_2 = FFPTime((Time.ActionDuration.ToSeconds() / Time.PlaySpeed));
        }
        else
        {
            if (this.OverrideLifeTime > 0.0f)
            {
                local_70_2 = this.OverrideLifeTime;
            }
        }
        const FECSEntity& local_54_2 = Context.GetEntity();
        if (::FProjectileUtils::SpawnProjectileEvent(local_54_2, Time.WorldLastTime, this.FireConfig, local_70_2) < 0)
        {
            XError(ELog(5), FString().Append("Failed to spawn projectile, Path: '").Append((this.GetESMAsset().GetPathName(nullptr) + this.DebugGetPath())).Append("'"));
            return false;
        }
        FECSWorldPtr local_96 = Context.GetECSWorld();
        FECSWorldPtr::PatchEvent(local_96);
        FCE_CharacterFireProjectile local_102;
        FFireProjectileData local_104 = local_102.FireConfig;
        FECSEntity local_108 = local_102.ProjectileEntity;
        if (this.TimelineAsset != nullptr || !(this.TimelineInitState.IsNone()))
        {
            local_130.SetTimelineAsset(TSoftObjectPtr<UProjectileTimelineAsset>(this.TimelineAsset));
            local_130.SetInitState(this.TimelineInitState);
        }
        if (int(this.FireModeConfig.MultiProjectileFireMode) == 1)
        {
            FFireProjectileActionInstanceData& local_144 = this.ModifyInstanceData(Context);
            local_104.SetRotationOffset(local_144.LastFireRotation);
            FRotator3f local_147 = local_144.LastFireRotation;
            local_144.LastFireRotation = (local_147 + this.FireModeConfig.RotationOffsetPerFire);
        }
        if (this.bAddRandomRotationOffset)
        {
            float32 local_151;
            local_151 = 0.0f;
            Get local_156;
            const FC_RandomSeed& local_158 = local_156.opCall();
            if (local_158)
            {
                local_151 = local_158.Rand(FC_ESM, Time.WorldTime, 0);
            }
            local_104.SetRotationOffset((FRotator3f(local_104.GetRotationOffset()) + FQuat4f::FastLerp(this.RandomRotationOffsetMin.Quaternion(), this.RandomRotationOffsetMax.Quaternion(), local_151).Rotator()));
        }
        if (this.bOverrideSimpleProjectileMovement)
        {
            local_192.SetData(this.OverrideSimpleProjectileMovementData);
        }
        if (this.bAutoCalcProjectileMovementToTarget)
        {
            ::ProjectileAutoCalcMovementUtils::AutoCalcMovement(local_54_2, local_108, this.AutoCalcProjectileMovementData, this.FireConfig.RotationOffset);
        }
        if (this.bUseBBVarControlMovement)
        {
            local_212.SetBBOwner(local_54_2);
            local_212.SetPositionBBVar(this.PositionBBVar);
            local_212.SetRotationBBVar(this.RotationBBVar);
        }
        if (this.bMoveFollowParent)
        {
            GetDefaulted local_230;
            bool local_213;
            local_213 = true;
            if (this.bEnableFollowByTime && (this.EnableFollowByTimeData.Num() > 0))
            {
                local_220.SetTimeEnablePairs(this.EnableFollowByTimeData);
                local_220.SetReletiveParentEntity(local_54_2);
                local_220.SetbMoveFollowParentRotation(this.bMoveFollowParentRotation);
                local_220.SetbDirectionFollowParentRotation(this.bDirectionFollowParentRotation);
                if (!(this.EnableFollowByTimeData[0].GetbEnable()) || (this.EnableFollowByTimeData[0].GetTime() > 0.0f))
                {
                    local_213 = false;
                }
            }
            if (local_213)
            {
                local_226.SetReletiveParentEntity(local_54_2);
                local_226.SetbMoveFollowParentRotation(this.bMoveFollowParentRotation);
                local_226.SetbDirectionFollowParentRotation(this.bDirectionFollowParentRotation);
                local_226.SetLastParentPos(local_230.opCall().GetPosition());
                local_226.SetLastParentRot(local_230.opCall().GetRotation());
            }
        }
        if (this.bHasCurveMove)
        {
            GetDefaulted local_230;
            FCurveMovementConfigData& local_238 = local_236.GetData();
            local_238.SetMovementCurve(TSoftObjectPtr<UCurveVector>(this.MoveWithCurve));
            local_238.SetCurveValueType(ECurveMovementValueType(0));
            local_238.SetbRotateCurveByForwardDirection(this.bRotateCurveByProjectileForward);
            if (this.bSetCurveMoveTotalTime)
            {
                local_238.SetCurveTotalTime(this.CurveMoveTotalTime);
            }
            if (this.bScaleCurveByLockTargetDistance)
            {
                Get local_254;
                const FC_LockTarget& local_256 = local_254.opCall();
                if (local_256)
                {
                    float32 local_27_3 = float32(((FVector(local_256.GetLogicLockTargetPosition()) - FVector(local_230.opCall().GetPosition())).Size()));
                    if (local_27_3 > 0.0f)
                    {
                        local_238.SetbScaleHeight(false);
                        local_238.SetCurveScaleRatio(FMath::Clamp(local_27_3 / this.CurveForwardMaxDistance, this.MinScaleRatio, this.MaxScaleRatio));
                    }
                }
            }
            if (this.bUseOwnerRotationAsCurveRotation)
            {
                local_236.SetCurveRotationFollowEntity(local_54_2);
            }
            if (this.bUseStateTimeAsCurveSampleTime)
            {
                local_236.SetbUseCustomSampleTime(true);
                float local_42_3 = Time.StateLastTime.ToSeconds();
                local_236.SetSampleLastTime(float32(local_42_3));
                float local_72_2 = Time.StateLastTime.ToSeconds();
                local_236.SetSampleTime(float32(local_72_2));
                local_236.SetDelaySampleTime(this.DelaySampleTime);
                local_72_2 = Time.StateLastTime.ToSeconds();
                local_236.SetFirstSampleTime(float32(local_72_2));
                local_72_2 = Time.StateLastTime.ToSeconds();
                local_268 = this.MoveWithCurve.GetVectorValue(float32(local_72_2));
            }
            else
            {
                local_268 = this.MoveWithCurve.GetVectorValue(0.0f);
            }
            local_104.SetPositionOffset((FVector(local_104.GetPositionOffset()) + local_268));
            local_104.SetSpawnPositionOffsetType(EProjectileSpawnPositionOffsetType(1));
        }
        if (this.bHasCurveRotation)
        {
            float32 local_151;
            local_290.GetData().SetCurve(TSoftObjectPtr<UCurveVector>(this.RotationCurve));
            local_290.GetData().SetCurveScaleRatio(this.RotationCurveScale);
            if (this.bSetCurveRotationTotalTime)
            {
                local_290.GetData().SetCurveTotalTime(this.CurveRotationTotalTime);
            }
            FVector3f local_293;
            if (this.bUseStateTimeAsCurveSampleTime)
            {
                local_290.SetbUseCustomSampleTime(true);
                local_290.SetSampleLastTime(float32(Time.StateLastTime.ToSeconds()));
                local_290.SetSampleTime(float32(Time.StateLastTime.ToSeconds()));
                local_290.SetDelaySampleTime(this.DelaySampleTime);
                local_290.SetFirstSampleTime(float32(Time.StateLastTime.ToSeconds()));
                local_293 = FVector3f(this.RotationCurve.GetVectorValue(float32(Time.StateLastTime.ToSeconds())));
            }
            else
            {
                local_293 = FVector3f(this.RotationCurve.GetVectorValue(0.0f));
            }
            local_151 = local_293.Z;
            local_104.SetRotationOffset((local_104.GetRotationOffset().Quaternion() * FRotator3f(local_293.Y, local_151, local_293.X).Quaternion()).Rotator());
        }
        if (this.bTrackTarget)
        {
            this.SetTrackInfo(local_108, Context, Time);
        }
        if (!((FName(this.SaveProjectileEntityToBBVar.Name) == NAME_None)))
        {
            Context.GetEntity().SetBB_Entity(this.SaveProjectileEntityToBBVar, local_108);
        }
        if (this.bControlProjectileLifeTime || this.bUseStateTimeAsCurveSampleTime)
        {
            this.ModifyInstanceData(Context).ProjectileEntity = local_108.GetId();
        }
        if (this.SelfCameraShakeConfigRef.IsValid())
        {
            FCameraUtils::StartCameraShakeForEntity(Context.GetEntity(), Time.WorldTime, this.GetDataPathName(), this.SelfCameraShakeConfigRef, 1.0f, false);
        }
        return true;
    }
    void SetTrackInfo(const FECSEntity &inout ProjectileEntity, const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        EProjectileTrackType local_3 = this.TrackType;
        if (this.bOverrideTrackTypeForAimShoot)
        {
            if (this.FireConfig.bAutoSelectAimShoot)
            {
                if (local_2.GetBB_Bool(this.FireConfig.AimMark))
                {
                    local_3 = this.TrackTypeForAimShoot;
                }
            }
            else
            {
                if (this.FireConfig.bForShooting)
                {
                    local_3 = this.TrackTypeForAimShoot;
                }
            }
        }
        FTrackTargetParams local_42;
        local_42.TrackType = EProjectileTrackType(local_3);
        local_42.bUseDefaultPosWhenNoTargetEntity = this.bUseDefaultPosWhenNoTargetEntity;
        local_42.DefaultPosOffset = this.DefaultPosOffset;
        local_42.TrackTargetPosConfig = this.TrackTargetPosConfig;
        local_42.TrackTargetHistoryPosConfig = this.TrackTargetHistoryPosConfig;
        local_42.TrackTargetEntity = this.TrackTargetEntity;
        local_42.TrackTargetEntityBBVar = this.TrackTargetEntityBBVar;
        local_42.TrackSoftLockConfig = this.TrackSoftLockConfig;
        local_42.TrackAimTraceLength = this.TrackAimTraceLength;
        local_42.TrackEntitySocket = this.TrackEntitySocket;
        ::FMovementUtils::SetTrackInfo(ProjectileEntity, local_2, local_42, Time.WorldTime);
        return;
    }
    void CollectTimelinePreloadFXActors(const UProjectileTimelineAsset ProjectileTimelineAsset, TArray<TSoftClassPtr<AFXActor>> &inout OutPreloadFXActors) const
    {
        return;
    }
    void CollectProjectilePreloadFXActors(const AECSPrefab PrefabCDO, TArray<TSoftClassPtr<AFXActor>> &inout OutPreloadFXActors) const
    {
        UProjectileTimelineAsset local_2 = this.TimelineAsset;
        if ((local_2 == nullptr && (PrefabCDO != nullptr)))
        {
            AECSPrefab::GetComponentConfigValue local_8;
            const FC_ProjectileTimelineConfig& local_10 = local_8.opCall();
            if (local_10)
            {
                local_2 = local_10.TimelineAssetRef.GetAsset();
            }
        }
        this.CollectTimelinePreloadFXActors(local_2, OutPreloadFXActors);
        return;
    }
}

namespace ProjectileAutoCalcMovementUtils
{
void AutoCalcMovement(const FECSEntity &inout OwnerEntity, const FECSEntity &inout ProjectileEntity, const FProjectileMovementCalculationData &inout AutoCalcProjectileMovementData, const FRotator3f &inout AdditionalRotation)
{
    int local_54 = 0;
    int local_106 = 0;
    FECSEntity local_4 = OwnerEntity;
    FProjectileMovementCalculationRuntimeData local_96;
    local_96.SetConfig(AutoCalcProjectileMovementData);
    if (AutoCalcProjectileMovementData.GetbAddRotationOnResult())
    {
        local_96.SetAdditionalRotation(AdditionalRotation);
    }
    if (int(AutoCalcProjectileMovementData.GetTarget()) == 0)
    {
        if (local_106 && local_106.GetTargetEntity().IsValid())
        {
            local_96.SetTargetType(EProjectileMovementCalculationRuntimeTargetType(1));
            FLockPointInfo local_124;
            if (FLockTargetUtils::GetLogicLockTargetInfo(local_4, local_124))
            {
                local_96.SetTargetPosition(local_124.Position);
            }
            else
            {
                local_96.SetTargetPosition(local_106.GetLogicLockTargetPosition());
            }
        }
        else
        {
            local_96.SetTargetType(EProjectileMovementCalculationRuntimeTargetType(0));
        }
    }
    else
    {
        if (int(AutoCalcProjectileMovementData.GetTarget()) == 1)
        {
            Get local_128;
            const FC_SkillTargetPosition& local_130 = local_128.opCall();
            if (local_130)
            {
                local_96.SetTargetType(EProjectileMovementCalculationRuntimeTargetType(1));
                local_96.SetTargetPosition(local_130.GetTargetPosition());
            }
        }
        else
        {
            if (int(AutoCalcProjectileMovementData.GetTarget()) == 2)
            {
                FNameHandle_EntityBBVar local_134;
                local_134;
                if (local_4.HasEntityBB(local_134))
                {
                    if (local_4.GetBB_Entity(AutoCalcProjectileMovementData.GetAimAtEntityBBHandle()).IsValid())
                    {
                        local_96.SetTargetType(EProjectileMovementCalculationRuntimeTargetType(1));
                        GetDefaulted local_146;
                        local_96.SetTargetPosition((FVector(local_146.opCall().GetPosition()) + AutoCalcProjectileMovementData.GetAimAtEntityBBOffset()));
                    }
                }
            }
            else
            {
                if (int(AutoCalcProjectileMovementData.GetTarget()) == 3)
                {
                    local_96.SetTargetType(EProjectileMovementCalculationRuntimeTargetType(1));
                    local_96.SetTargetPosition(AutoCalcProjectileMovementData.GetWorldPosition());
                }
            }
        }
    }
    local_54.SetData(local_96);
    return;
}
}
