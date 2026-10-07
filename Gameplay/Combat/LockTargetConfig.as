
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
    bool bEnableFanShapeSoftLockRangeSearch;
    UPROPERTY()
    float32 FindPointSmallestAngleRange;
    UPROPERTY()
    FRuntimeFloatCurve MinInputAngleXYCurveForDistance;
    UPROPERTY()
    float32 MinZHeight;
    UPROPERTY()
    TMap<EMaxLockDistanceType, float32> MaxLockDistanceConfig;
    UPROPERTY()
    FRuntimeFloatCurve MaxLockAngleCurveForDistance;
    UPROPERTY()
    FRuntimeFloatCurve MaxLockDistanceReduceRatioForLockAngle;
    UPROPERTY()
    FRuntimeFloatCurve ScoreCurveForDistance;
    UPROPERTY()
    FRuntimeFloatCurve ScoreCurveForLockAngle;
    UPROPERTY()
    FRuntimeFloatCurve ScoreCurveForCameraAngle;
    UPROPERTY()
    TMap<EMonsterRank, float32> AdditionalMultiplierForMonsterRank;
    UPROPERTY()
    float32 NonCombatMultiplier;
    UPROPERTY()
    bool bShouldStrafe;
    UPROPERTY()
    float32 KeepDuration;
    UPROPERTY()
    float32 MinDetectBlockDistance;
    UPROPERTY()
    float32 AutoClearHardLockWhenBlock;
    UPROPERTY()
    bool AcceptPlayerSettingInputFirst;

    FLockTargetConfigData()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
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

