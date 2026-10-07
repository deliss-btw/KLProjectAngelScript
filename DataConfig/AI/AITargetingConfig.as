

struct FAILockPointRatingConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 MaxZDistance = 9999.0f;
    UPROPERTY()
    FRuntimeFloatCurve ScoreCurveByDistanceXY = FRuntimeCurveUtils::CreateLinear(0.0f, 100.0f, 3000.0f, 0.0f);
    UPROPERTY()
    FRuntimeFloatCurve ScoreCurveByDistanceZ = FRuntimeCurveUtils::CreateLinear(0.0f, 100.0f, 1000.0f, 0.0f);
    UPROPERTY()
    float32 WeightXY = 1.0f;
    UPROPERTY()
    float32 WeightZ = 1.0f;


}

struct FAITargetingConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FDataObjectPtr m_DefaultTargetingQueryConfig;
    UPROPERTY()
    FDataObjectPtr m_LockPointRatingConfig;

    FAITargetingConfig()
    {
        return;
    }
    const TDataObjectPtr<FAITargetingQueryConfig> GetDefaultTargetingQueryConfig() const property
    {
        const TDataObjectPtr<FAITargetingQueryConfig> __r;
        return __r;
    }
    void SetDefaultTargetingQueryConfig(const TDataObjectPtr<FAITargetingQueryConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAITargetingQueryConfig>> local_2;
        this.m_DefaultTargetingQueryConfig = local_2;
        return;
    }
    const TDataObjectPtr<FAILockPointRatingConfig> GetLockPointRatingConfig() const property
    {
        const TDataObjectPtr<FAILockPointRatingConfig> __r;
        return __r;
    }
    void SetLockPointRatingConfig(const TDataObjectPtr<FAILockPointRatingConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAILockPointRatingConfig>> local_2;
        this.m_LockPointRatingConfig = local_2;
        return;
    }
}

