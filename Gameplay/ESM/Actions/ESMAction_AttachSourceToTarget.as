class UESMAction_AttachSourceToTarget : UESMBPBaseSpanAction
{
    UPROPERTY()
    FVector AttachLocationOffset;
    UPROPERTY()
    FRotator AttachRotationOffset;
    UPROPERTY()
    bool bUseDetachOffset = false;
    UPROPERTY()
    bool bUseRootRotationOffset = false;
    UPROPERTY()
    FVector DetachLocationOffset;
    UPROPERTY()
    FRotator DetachRotationOffset;
    UPROPERTY()
    uint8 ZeroOutRotationAxisWhenDetach = false;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_7;
        Get local_4;
        const FC_InteractionInfoForESM& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetTargetEntity().IsValid())
            {
                Get local_12;
                const FC_InteractionTargetConfig& local_14 = local_12.opCall();
                if (local_14)
                {
                    if (local_6.GetTargetPointAndBehaviorIndex().GetPointIndex() < 0)
                    {
                        local_7 = 0;
                    }
                    else
                    {
                        bool local_17 = (local_6.GetTargetPointAndBehaviorIndex().GetPointIndex() < local_14.InteractionPoints.Num());
                        local_7 = local_17;
                    }
                    if (local_7 != 0)
                    {
                        const FInteractionPoint& local_20 = local_14.InteractionPoints[local_6.GetTargetPointAndBehaviorIndex().GetPointIndex()];
                        FVector local_38 = (local_20.TransformOffset.GetLocation() + this.AttachLocationOffset);
                        FRotator local_56 = (local_20.TransformOffset.Rotator() + this.AttachRotationOffset);
                        ::FAttachmentUtils::EntityAttachToParent(Context.GetEntity(), local_6.GetTargetEntity(), Time.WorldTime, n"None", false, local_38, local_56, 0.0f, 0.0f, 0, FVector::ZeroVector, 0.0f, false);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        const FC_InteractionInfoForESM& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_7;
            local_7 = this.bUseDetachOffset;
            if (local_7 != 0)
            {
                ::FAttachmentUtils::EntityDetach(Context.GetEntity(), Time.WorldTime, this.DetachLocationOffset, this.DetachRotationOffset, this.bUseRootRotationOffset, uint8(this.ZeroOutRotationAxisWhenDetach), false);
                return;
            }
            if (local_6.GetTargetEntity().IsValid())
            {
                Get local_14;
                const FC_InteractionTargetConfig& local_16 = local_14.opCall();
                if (local_16)
                {
                    if (local_6.GetTargetPointAndBehaviorIndex().GetPointIndex() < 0)
                    {
                        local_7 = 0;
                    }
                    else
                    {
                        local_7 = (local_6.GetTargetPointAndBehaviorIndex().GetPointIndex() < local_16.InteractionPoints.Num());
                    }
                    if (local_7 != 0)
                    {
                        const FInteractionPoint& local_20 = local_16.InteractionPoints[local_6.GetTargetPointAndBehaviorIndex().GetPointIndex()];
                        FVector local_38 = (local_20.TransformOffset.GetLocation() + this.AttachLocationOffset);
                        FRotator local_56 = (local_20.TransformOffset.Rotator() + this.AttachRotationOffset);
                        ::FAttachmentUtils::EntityDetach(Context.GetEntity(), Time.WorldTime, local_38, local_56, false, uint8(0), false);
                    }
                }
                return;
            }
            ::FAttachmentUtils::EntityDetach(Context.GetEntity(), Time.WorldTime, FVector::ZeroVector, FRotator::ZeroRotator, false, uint8(0), false);
        }
        return;
    }
}

