

class UESMAction_Mount : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 InheritSpeedPctFromMount = 1.0f;
    UPROPERTY()
    bool NeedBlend = false;
    UPROPERTY()
    float32 BlendDuration = 0.2f;
    UPROPERTY()
    FGameplayTag TagFlagIsPrivateMount;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(3);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        local_4.opCall().SetbNeedBlendInView(this.NeedBlend);
        bool local_6 = false;
        if (this.TagFlagIsPrivateMount.IsValid() && Context.GetEnterTransitTags().HasTag(this.TagFlagIsPrivateMount))
        {
            local_6 = true;
        }
        if (local_6)
        {
        }
        else
        {
            GetDefaulted local_12;
            local_12.opCall().GetTargetEntity().IsValid();
        }
        ::FMountUtils::BeginMountAsDriver(Context.GetEntity(), Time.WorldTime, local_6);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FVector local_6(FVector::ZeroVector);
        GetDefaulted local_14;
        if (FECSEntity(local_14.opCall().GetMountEntity()).IsValid())
        {
            Get local_20;
            FC_Rigidbody local_22 = local_20.opCall();
            if (local_22)
            {
                local_6 = local_22.GetVelocity();
            }
        }
        ::FMountUtils::EndMountAsDriver(Context.GetEntity(), Time.WorldTime);
        Modify local_26;
        FC_Rigidbody local_22_2 = local_26.opCall();
        if (local_22_2)
        {
            local_22_2.SetVelocity((local_6 * this.InheritSpeedPctFromMount));
        }
        return;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.NeedBlend)
        {
            FC_ViewTransformAttachmentPresentation local_8;
            local_8.BlendDuration = this.BlendDuration;
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
}

