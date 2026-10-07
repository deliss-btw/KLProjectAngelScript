

struct FFireProjectileInAreaInstanceData
{
    UPROPERTY()
    float FireModeTickCurrentTime;
    UPROPERTY()
    int SobolSequenceIndex;
    UPROPERTY()
    FVector2D LastSobolValue;
    UPROPERTY()
    int JitterSeedCounter;


}

class UESMAction_FireProjectileInArea : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FFireProjectileConfig FireConfig;
    UPROPERTY()
    float32 OverrideLifeTime = 2.0f;
    UPROPERTY()
    float32 SpawnAreaRadius = 500.0f;
    UPROPERTY()
    float32 SpawnHeightOffset = 1000.0f;
    UPROPERTY()
    int SpawnCountPerBatch = 10;
    UPROPERTY()
    float32 FireInterval = 0.1f;
    UPROPERTY()
    bool bFireOnEnter = true;
    UPROPERTY()
    bool bEnableDirectionJitter = true;
    UPROPERTY()
    float32 MaxJitterAngle = 5.0f;
    UPROPERTY()
    bool bOverrideMovement = true;
    UPROPERTY()
    float32 InitSpeed = 1200.0f;
    UPROPERTY()
    float32 GravityScale = 1.5f;
    UPROPERTY()
    bool bPitchToMoveDir = true;
    UPROPERTY()
    bool bEnableWarningFX = false;
    UPROPERTY()
    TSoftClassPtr<AFXActor> WarningFXAsset;
    UPROPERTY()
    float32 WarningFXGroundTraceExtraDepth = 500.0f;
    UPROPERTY()
    float32 WarningFXHeightFromGround = 0.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FFireProjectileInAreaInstanceData);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
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
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("еЊєеџџй›Ёеј№: ").Append(this.FireConfig.ProjectilePrefab.GetAssetName()).Append("  R=").Append(this.SpawnAreaRadius).Append("  N=").Append(this.SpawnCountPerBatch).Append("/ж‰№  й—ґйљ”=").Append(this.FireInterval).Append("s");
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    bool GetDisableInstanceData_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    EESMActionExitPolicy GetExitPolicy_Implementation() const
    {
        return EESMActionExitPolicy(2);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FFireProjectileInAreaInstanceData& local_2 = this.ModifyInstanceData(Context);
        local_2.FireModeTickCurrentTime = 0.0;
        local_2.SobolSequenceIndex = 0;
        local_2.LastSobolValue = FVector2D(0.5, 0.5);
        local_2.JitterSeedCounter = 0;
        if (this.bFireOnEnter)
        {
            this.SpawnBatch(Context, Time);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FFireProjectileInAreaInstanceData& local_2 = this.ModifyInstanceData(Context);
        float local_4 = Time.ActionDeltaTime.ToSeconds();
        local_2.FireModeTickCurrentTime += local_4;
        while (local_2.FireModeTickCurrentTime >= this.FireInterval)
        {
            this.SpawnBatch(Context, Time);
            local_2.FireModeTickCurrentTime -= this.FireInterval;
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
    UFUNCTION()
    void Gizmos_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        return;
    }
    FFireProjectileInAreaInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FFireProjectileInAreaInstanceData __r;
        return __r;
    }
    FFireProjectileInAreaInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FFireProjectileInAreaInstanceData __r;
        return __r;
    }
    void SpawnBatch(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_1 = 0;
        for (; local_1 < this.SpawnCountPerBatch; )
        {
            this.TryFireOneProjectile(Context, Time);
            ++local_1;
        }
        return;
    }
    void TryFireOneProjectile(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        int local_142 = 0;
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
            return;
        }
        const FECSEntity& local_10 = Context.GetEntity();
        FFireProjectileInAreaInstanceData& local_12 = this.ModifyInstanceData(Context);
        FVector2D local_22 = ImportanceSampling::NextSobolCell2D(int(local_12.SobolSequenceIndex), 1, local_12.LastSobolValue);
        local_12.LastSobolValue = local_22;
        local_12.SobolSequenceIndex = (int(local_12.SobolSequenceIndex) + 1);
        FVector2D local_16 = ::FFireProjectileInAreaUtils::ConcentricDiskMapping(local_22.X, local_22.Y);
        FVector2D local_36 = (local_16 * this.SpawnAreaRadius);
        GetDefaulted local_46;
        FVector local_42 = local_46.opCall().GetPosition();
        FVector local_62 = FVector((local_42.X + local_36.X), (local_42.Y + local_36.Y), (local_42.Z + this.SpawnHeightOffset));
        float32 local_63 = 0.0f;
        float32 local_64 = 0.0f;
        if (this.bEnableDirectionJitter)
        {
            Get local_68;
            const FC_RandomSeed& local_70 = local_68.opCall();
            if (local_70)
            {
                int local_17_2 = int(local_12.JitterSeedCounter);
                local_64 = local_70.Rand(FC_ESM, Time.WorldTime, local_17_2) * 360.0f;
                int local_18 = int(local_12.JitterSeedCounter) + 1;
                local_12.JitterSeedCounter = local_18;
                local_63 = local_70.Rand(FC_ESM, Time.WorldTime, int(local_12.JitterSeedCounter)) * this.MaxJitterAngle;
                local_18 = int(local_12.JitterSeedCounter);
                local_18 = local_18 + 1;
                local_12.JitterSeedCounter = local_18;
            }
        }
        FRotator3f local_79 = FRotator3f(local_63 + -90.0f, local_64, 0.0f);
        FFPTime local_88;
        if (this.OverrideLifeTime > 0.0f)
        {
            local_88 = FFPTime(this.OverrideLifeTime);
        }
        else
        {
            local_88 = FFPTime(-1);
        }
        if (::FProjectileUtils::SpawnProjectileEvent(local_10, Time.WorldLastTime, this.FireConfig, local_88) < 0)
        {
            XError(ELog(5), FString().Append("FireProjectileInArea: Failed to spawn projectile, Path: '").Append((this.GetESMAsset().GetPathName(nullptr) + this.DebugGetPath())).Append("'"));
            return;
        }
        FECSWorldPtr local_112 = Context.GetECSWorld();
        FECSWorldPtr::PatchEvent(local_112);
        FCE_CharacterFireProjectile local_118;
        FFireProjectileData local_120 = local_118.FireConfig;
        local_120.SetPositionOffset(local_62);
        local_120.SetSpawnPositionOffsetType(EProjectileSpawnPositionOffsetType(3));
        local_120.SetSpawnRotationType(EProjectileSpawnRotationType(2));
        local_120.SetRotationOffset(local_79);
        if (this.bOverrideMovement)
        {
            FSimpleProjectileMovementConfigData local_130;
            local_130.SetInitSpeed(this.InitSpeed);
            local_130.SetGravityScale(this.GravityScale);
            local_130.SetbPitchToMoveDir(this.bPitchToMoveDir);
            local_142.SetData(local_130);
        }
        if (this.bEnableWarningFX && !(this.WarningFXAsset.IsNull()))
        {
            FFXConfig local_258;
            local_258.SetAsset(FSoftClassPath(this.WarningFXAsset.ToString()));
            local_258.SetbDetach(true);
            local_258.SetbUseWorldOriginAsBaseTransformSource(true);
            local_258.SetLocationOffset(local_62);
            local_258.SetLocationOffsetSpace(EFXOffsetSpace(2));
            FSpawnOnGroundConfig local_282;
            local_282.SetbSpawnOnGround(true);
            local_282.SetMaxTraceDownDist(this.SpawnHeightOffset + this.WarningFXGroundTraceExtraDepth);
            local_282.SetHeightFromGround(this.WarningFXHeightFromGround);
            local_258.SetSpawnOnGroundConfig(local_282);
            ECSFX::PlayFXInstant(local_10, local_258, Time.WorldLastTime, 1.0f, true, false);
        }
        return;
    }
}

namespace FFireProjectileInAreaUtils
{
FVector2D ConcentricDiskMapping(const float u, const float v)
{
    float local_14;
    float local_16;
    float local_4 = (2.0 * u) - 1.0;
    float local_6_2 = (2.0 * v) - 1.0;
    if ((local_4 == 0.0 && (local_6_2 == 0.0)))
    {
        return FVector2D::ZeroVector;
    }
    if ((local_4 * local_4) > (local_6_2 * local_6_2))
    {
        local_14 = local_4;
        local_16 = FMath::DegreesToRadians(45.0f) * (local_6_2 / local_4);
    }
    else
    {
        local_14 = local_6_2;
        local_16 = FMath::DegreesToRadians(90.0f) - (FMath::DegreesToRadians(45.0f) * (local_4 / local_6_2));
    }
    return FVector2D(local_14 * FMath::Cos(local_16), (local_14 * FMath::Sin(local_16)));
}
}
