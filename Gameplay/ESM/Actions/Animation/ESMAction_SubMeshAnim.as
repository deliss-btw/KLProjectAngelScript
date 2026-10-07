

class UESMAction_SubMeshAnim : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FName MeshComponentName = NAME_None;
    UPROPERTY()
    UAnimSequence SubMeshAnim;
    UPROPERTY()
    bool bSlotMode = false;
    UPROPERTY()
    FName SlotName = NAME_None;
    UPROPERTY()
    bool bLoop = true;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        USkeletalMeshComponent local_24;
        if (this.SubMeshAnim == nullptr)
        {
            return;
        }
        if (this.bSlotMode)
        {
            FSubMeshSlotAnim local_14;
            local_14.Anim = this.SubMeshAnim;
            local_14.bLoop = this.bLoop;
            local_10.SubMeshSlotAnims.Add(this.SlotName, local_14);
            return;
        }
        AActor local_18 = Context.GetEntity().GetMutableActor();
        if (local_18 != nullptr)
        {
            local_24 = (Cast<USkeletalMeshComponent>(local_18.FindComponentByName(this.MeshComponentName)));
            if (local_24 != nullptr)
            {
                local_24.SetAnimationMode(EAnimationMode(1), false);
                local_24.SetAnimation(this.SubMeshAnim);
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        USkeletalMeshComponent local_20;
        if (this.SubMeshAnim == nullptr)
        {
            return;
        }
        if (this.bSlotMode)
        {
            return;
        }
        AActor local_14 = Context.GetEntity().GetMutableActor();
        if (local_14 != nullptr)
        {
            local_20 = (Cast<USkeletalMeshComponent>(local_14.FindComponentByName(this.MeshComponentName)));
            if (local_20 != nullptr)
            {
                local_20.SetAnimation(nullptr);
            }
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        USkeletalMeshComponent local_32;
        float local_34;
        if (this.SubMeshAnim == nullptr)
        {
            return;
        }
        if (this.bSlotMode)
        {
            float local_20;
            FSubMeshSlotAnim& local_12 = local_10.SubMeshSlotAnims.FindOrAdd(this.SlotName);
            if (this.bLoop)
            {
                local_20 = Time.ActionTime.ToSeconds() % this.SubMeshAnim.GetPlayLength();
            }
            else
            {
                local_20 = Time.ActionTime.ToSeconds();
            }
            local_12.Seconds += float32(local_20);
            return;
        }
        AActor local_26 = Context.GetEntity().GetMutableActor();
        if (local_26 != nullptr)
        {
            float local_20;
            local_32 = (Cast<USkeletalMeshComponent>(local_26.FindComponentByName(this.MeshComponentName)));
            if (local_32 != nullptr)
            {
                if (this.bLoop)
                {
                    local_20 = Time.ActionTime.ToSeconds();
                    local_34 = local_20 % this.SubMeshAnim.GetPlayLength();
                }
                else
                {
                    local_34 = Time.ActionTime.ToSeconds();
                }
                local_32.SetPosition(float32(local_34));
            }
        }
        return;
    }
}

