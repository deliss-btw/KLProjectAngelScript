
enum EViewportSelectTeammateType
{
    All,
    Teammate,
    NonTeammate,
}

enum ESelectTargetQuickSelectType
{
    Self,
    Teammate1,
    Teammate2,
    Teammate3,
    Teammate4,
}


struct FSkillTargetPositionFXConfig
{
    UPROPERTY()
    FSoftClassPath Asset;
    UPROPERTY()
    FVector Scale = FVector::OneVector;
    UPROPERTY()
    FVector LocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FRotator RotationOffset = FRotator::ZeroRotator;
    UPROPERTY()
    TArray<FFXOverrideParam> OverrideParams;

    FSkillTargetPositionFXConfig()
    {
        return;
    }
    FFXConfig ToFXConfig() const
    {
        FFXConfig local_116;
        local_116.SetAsset(this);
        local_116.SetScale(this.Scale);
        local_116.SetOverrideParams(this.OverrideParams);
        local_116.SetbDetach(true);
        local_116.SetbUseWorldOriginAsBaseTransformSource(true);
        local_116.SetLocationOffsetSpace(EFXOffsetSpace(2));
        local_116.SetRotationOffsetSpace(EFXOffsetSpace(2));
        return local_116;
    }
}

struct FViewportSelectTargetParams : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> SelectUMG;
    UPROPERTY()
    uint8 TargetRelation = (2 != 0);
    UPROPERTY()
    EViewportSelectTeammateType TargetTeammateType = EViewportSelectTeammateType(0);
    UPROPERTY()
    bool bIgnoreObstacleOnViewPath = false;
    UPROPERTY()
    int TargetNum = 1;
    UPROPERTY()
    float32 HorizontalRatio = 0.6f;
    UPROPERTY()
    float32 VerticalRatio = 0.6f;
    UPROPERTY()
    float32 MinDistance = 0.0f;
    UPROPERTY()
    float32 MaxDistance = 1000.0f;
    UPROPERTY()
    FRuntimeFloatCurve DistanceWeight;
    UPROPERTY()
    FRuntimeFloatCurve AngleWeight;
    UPROPERTY()
    FRuntimeFloatCurve VerticalDistanceToCrosshairWeight = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 0.0f);
    UPROPERTY()
    FGameplayTagContainer IncludeTags;
    UPROPERTY()
    FGameplayTagContainer ExcludeTags;
    UPROPERTY()
    bool bNeedConfirm = false;
    UPROPERTY()
    FDataObjectPtr m_ConfirmInputContextConfig;
    UPROPERTY()
    FName ConfirmTriggerName;
    UPROPERTY()
    float32 ConfirmTriggerValidateTime = 0.2f;
    UPROPERTY()
    UESMInputTriggerAsset ConfirmInput = nullptr;
    UPROPERTY()
    TMap<UESMInputTriggerAsset, ESelectTargetQuickSelectType> QuickSelectInputs;
    UPROPERTY()
    float32 QuickSelectMaxDistance = -1.0f;
    UPROPERTY()
    FDataObjectPtr m_QuickSelectOutOfRangeMessageHint;


    const TDataObjectPtr<FEnhancedInputContextConfig> GetConfirmInputContextConfig() const property
    {
        const TDataObjectPtr<FEnhancedInputContextConfig> __r;
        return __r;
    }
    void SetConfirmInputContextConfig(const TDataObjectPtr<FEnhancedInputContextConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FEnhancedInputContextConfig>> local_2;
        this.m_ConfirmInputContextConfig = local_2;
        return;
    }
    const TDataObjectPtr<FMessageHintConfig> GetQuickSelectOutOfRangeMessageHint() const property
    {
        const TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    void SetQuickSelectOutOfRangeMessageHint(const TDataObjectPtr<FMessageHintConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMessageHintConfig>> local_2;
        this.m_QuickSelectOutOfRangeMessageHint = local_2;
        return;
    }
}

struct FSkillTargetPositionSelectParams : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 InitDistance = 300.0f;
    UPROPERTY()
    float32 MaxDistance = 1500.0f;
    UPROPERTY()
    float32 MinDistance = 0.0f;
    UPROPERTY()
    float32 InitAngle = 0.0f;
    UPROPERTY()
    float32 MaxAngle = 75.0f;
    UPROPERTY()
    float32 MinAngle = -75.0f;
    UPROPERTY()
    float32 DistanceSpeed = 100.0f;
    UPROPERTY()
    float32 AngleSpeed = 1.0f;
    UPROPERTY()
    float32 PreTraceHeight = 300.0f;
    UPROPERTY()
    float32 TraceDownFloorDistance = 800.0f;
    UPROPERTY()
    FDataObjectPtr CameraLookAtTargetConfig;
    UPROPERTY()
    FSkillTargetPositionFXConfig HintFxConfig;


}

