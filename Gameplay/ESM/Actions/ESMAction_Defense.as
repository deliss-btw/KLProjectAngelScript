

class UESMAction_DefenseZone : UESMBPBaseSpanAction
{
    UPROPERTY()
    TArray<FDefenseHitData> DefenseHitDatas;

    UESMAction_DefenseZone()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetDefenseHitDatas(this.DefenseHitDatas);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.DefenseHitDatas.Num() < 5)
        {
            FString local_8 = FString();
            Info.AddDataInvalidComment(EESMDataValidType(2), local_8.Append("DefenseZone Datas Error, DefenseHitDatas Num = ").Append(this.DefenseHitDatas.Num()).Append(", < ").Append(5));
        }
        return;
    }
}

class UESMAction_HitBoxPriorityHit : UESMBPBaseSpanAction
{
    UPROPERTY()
    FName HitBoxName;
    UPROPERTY()
    float32 XYAngleMax = 360.0f;
    UPROPERTY()
    float32 ZAngleMax = 360.0f;
    UPROPERTY()
    FVector HitBoxCenterOffset = FVector::ZeroVector;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        Has local_4;
        bool local_5 = !(local_4.opCall());
        local_8.SetHitBoxName(this.HitBoxName);
        local_8.SetXYAngleMax(this.XYAngleMax);
        local_8.SetZAngleMax(this.ZAngleMax);
        local_8.SetHitBoxCenterOffset(this.HitBoxCenterOffset);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

