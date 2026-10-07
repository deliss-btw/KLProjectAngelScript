
enum EECOEntityType
{
    Ground,
    CanFly,
    Teleport,
}


struct FECOData
{
    UPROPERTY()
    EECOEntityType EntityType;
    UPROPERTY()
    float32 MoveSpeed = 500.0f;
    UPROPERTY()
    FString PathName;
    UPROPERTY()
    bool bIsHolding = false;


}

struct FECOHoldPosition
{
    UPROPERTY()
    float32 m_HoldTime = 5.0f;
    UPROPERTY()
    FVector m_HoldLocation;


    float32 GetHoldTime() const property
    {
        return this.m_HoldTime;
    }
    void SetHoldTime(const float32 __Value) property
    {
        this.m_HoldTime = __Value;
        return;
    }
    const FVector GetHoldLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetHoldLocation() property
    {
        FVector __r;
        return __r;
    }
    void SetHoldLocation(const FVector &inout __Value) property
    {
        this.m_HoldLocation = __Value;
        return;
    }
}

class AECOActor : AGameActor
{
    UPROPERTY()
    FECOData ActorEcoData;
    UPROPERTY()
    USplineComponent MoveSpline;
    UPROPERTY()
    bool bIsMoving = false;
    UPROPERTY()
    TArray<FECOHoldPosition> HoldPositions;
    UPROPERTY()
    bool bIsHidden = false;


    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnFinishMove_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnECOMoveReset_Implementation()
    {
        return;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        XLog(ELog(0), "BeginPlay Called");
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const float32 DeltaSeconds)
    {
        XLog(ELog(0), "Tick Called");
        return;
    }
    UFUNCTION()
    void SetIsMoving(const bool bMoving)
    {
        this.bIsMoving = bMoving;
        return;
    }
    UFUNCTION()
    void SetHide(const bool bHide)
    {
        if (!(bHide) != !(this.bIsHidden))
        {
            this.bIsHidden = bHide;
            this.SetActorHiddenInGame(this.bIsHidden);
        }
        return;
    }
    UFUNCTION()
    void SetPathName(const FString &inout PName)
    {
        this.ActorEcoData.PathName = PName;
        return;
    }
    UFUNCTION()
    void SetIsHolding(const bool holding)
    {
        this.ActorEcoData.bIsHolding = holding;
        return;
    }
    void OnFinishMove()
    {
        __Evt_Execute(this, n"OnFinishMove");
        return;
    }
    void OnECOMoveReset()
    {
        __Evt_Execute(this, n"OnECOMoveReset");
        return;
    }
}

