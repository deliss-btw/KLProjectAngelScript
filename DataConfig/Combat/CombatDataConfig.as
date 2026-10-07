

struct FExecutionConfigDataObject : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int MaxExecutedNum = 4;
    UPROPERTY()
    FDataObjectPtr m_MessageHintConfig;
    UPROPERTY()
    float32 ExecutedDamageHPRatio = 0.2f;
    UPROPERTY()
    FBuffConfigRef ExecuteMonsterDebuff;
    UPROPERTY()
    FName ExecutedMonsterState = n"HitBreak_Executed";
    UPROPERTY()
    EExecutedPreType ExecutedPreType;
    UPROPERTY()
    FName ExecuterAnimKey = n"Execute_1";
    UPROPERTY()
    FBuffConfigRef ExecuteBuff;
    UPROPERTY()
    float32 ExecuteBuffDelayAddTime;
    UPROPERTY()
    float32 ExecuteBuffDistanceXY = 15000.0f;
    UPROPERTY()
    FName ExecuteInterruptAvatarTrigger = n"ExecuteTargetDead";
    UPROPERTY()
    TSoftClassPtr<AFXActor> ChaosKnotFX;
    UPROPERTY()
    TSoftClassPtr<AFXActor> ChaosKnotBreakFX;
    UPROPERTY()
    FName ChaosKnotSocket;
    UPROPERTY()
    FVector ChaosKnotOffset;
    UPROPERTY()
    FRotator ChaosKnotRotationOffset;
    UPROPERTY()
    TSoftClassPtr<AEnergyBallPrefab> BuffBallPrefab;
    UPROPERTY()
    int BuffBallNum;


    TDataObjectPtr<FMessageHintConfig> GetMessageHintConfig() const property
    {
        TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    void SetMessageHintConfig(const TDataObjectPtr<FMessageHintConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMessageHintConfig>> local_2;
        this.m_MessageHintConfig = local_2;
        return;
    }
}

