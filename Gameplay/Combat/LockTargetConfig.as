enum EMaxLockDistanceType
{
    Normal,
    NATIVE_MAX = 0,
    Boss,
    HugeBoss,
    Max,
}

struct FLockTargetConfigData
{
    UPROPERTY()
    FName Name;
    UPROPERTY()
    bool bEnableFanShapeSoftLockRangeSearch = true;
    UPROPERTY()
    float32 FindPointSmallestAngleRange = 90.0f;
    UPROPERTY()
    FRuntimeFloatCurve MinInputAngleXYCurveForDistance = FRuntimeCurveUtils::CreateLinear(0.0f, 360.0f, 100.0f, 360.0f);
    UPROPERTY()
    float32 MinZHeight = 9999.0f;
    UPROPERTY()
    TMap<EMaxLockDistanceType, float32> MaxLockDistanceConfig = {{EMaxLockDistanceType(0), 3000.0f}, {EMaxLockDistanceType(1), 3000.0f}, {EMaxLockDistanceType(2), 3000.0f}};
    UPROPERTY()
    FRuntimeFloatCurve MaxLockAngleCurveForDistance = FRuntimeCurveUtils::CreateLinear(0.0f, 60.0f, 100.0f, 60.0f);
    UPROPERTY()
    FRuntimeFloatCurve MaxLockDistanceReduceRatioForLockAngle = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 180.0f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve ScoreCurveForDistance = FRuntimeCurveUtils::CreateLinear(1000.0f, 100.0f, 3000.0f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve ScoreCurveForLockAngle = FRuntimeCurveUtils::CreateLinear(20.0f, 200.0f, 60.0f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve ScoreCurveForCameraAngle = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 60.0f, 1.0f);
    UPROPERTY()
    TMap<EMonsterRank, float32> AdditionalMultiplierForMonsterRank = {{EMonsterRank(0), 1.0f}, {EMonsterRank(1), 1.0f}, {EMonsterRank(2), 1.0f}, {EMonsterRank(3), 1.0f}};
    UPROPERTY()
    float32 NonCombatMultiplier = 0.5f;
    UPROPERTY()
    bool bShouldStrafe = true;
    UPROPERTY()
    float32 KeepDuration = 0.0f;
    UPROPERTY()
    float32 MinDetectBlockDistance = 500.0f;
    UPROPERTY()
    float32 AutoClearHardLockWhenBlock = 3.0f;
    UPROPERTY()
    bool AcceptPlayerSettingInputFirst = false;

    float32 GetMaxLockDistanceByType(const EMaxLockDistanceType MaxLockDistanceType) const
    {
        this.MaxLockDistanceConfig.Contains(MaxLockDistanceType);
        return this.MaxLockDistanceConfig[MaxLockDistanceType];
    }
    float32 GetQueryLockDistance() const
    {
        float32 local_1 = this.MaxLockDistanceConfig[EMaxLockDistanceType(0)];
        int local_6 = 0;
        for (; local_6 < 3; ++local_6)
        {
            int local_2 = local_6;
            if (this.MaxLockDistanceConfig[EMaxLockDistanceType(local_2)] > local_1)
            {
                local_1 = this.MaxLockDistanceConfig[EMaxLockDistanceType(local_2)];
            }
        }
        return local_1;
    }
    bool IsConditionMatchMaxLockDistance(const FECSEntity &inout FromEntity, const FECSEntity &inout LockEntity, FLockTargetOverrideInfo &inout OverrideInfo) const
    {
        float32 local_32;
        float32 local_33;
        GetDefaulted local_10;
        FVector local_6 = local_10.opCall().GetPosition();
        float local_20 = local_6.Distance(FVector(local_10.opCall().GetPosition()));
        float local_22 = 0.0;
        Get local_26;
        const FC_LockableConfig& local_28 = local_26.opCall();
        if (local_28)
        {
            if (OverrideInfo.bOverrideMaxLockDistance)
            {
                local_32 = OverrideInfo.MaxMaxLockDistance;
            }
            else
            {
                local_32 = this.GetMaxLockDistanceByType(local_28.GetMaxLockDistanceType());
            }
            local_22 = local_32;
            return (local_22 >= local_20);
        }
        Get local_38;
        const FC_MultiLockableConfig& local_40 = local_38.opCall();
        if (local_40)
        {
            if (OverrideInfo.bOverrideMaxLockDistance)
            {
                local_33 = OverrideInfo.MaxMaxLockDistance;
            }
            else
            {
                local_33 = this.GetMaxLockDistanceByType(local_40.GetMaxLockDistanceType());
            }
            local_22 = local_33;
            return (local_22 >= local_20);
        }
        return false;
    }
    float32 GetMaxLockDistanceByEntity(const FECSEntity &inout LockEntity) const
    {
        Get local_4;
        const FC_LockableConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            return this.GetMaxLockDistanceByType(local_6.GetMaxLockDistanceType());
        }
        Get local_14;
        const FC_MultiLockableConfig& local_16 = local_14.opCall();
        if (local_16)
        {
            return this.GetMaxLockDistanceByType(local_16.GetMaxLockDistanceType());
        }
        return 6000.0f;
    }
}

class ULockTargetConfig : UDataAsset
{
    UPROPERTY()
    FLockTargetConfigData Data;

    ULockTargetConfig()
    {
        return;
    }
}

