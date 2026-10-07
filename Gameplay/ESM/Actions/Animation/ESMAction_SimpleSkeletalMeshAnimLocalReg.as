

// NOTE: class defaults are not authored in this module: UESMAction_SimpleSkeletalMeshAnimLocalReg (default scalar field UESMAction.ActionFilterType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_SimpleSkeletalMeshAnimLocalReg : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FName MeshComponentName = NAME_None;
    UPROPERTY()
    UAnimSequence MeshAnim;
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
        USkeletalMeshComponent local_48;
        if (!((this.MeshAnim != nullptr)))
        {
            return;
        }
        bool local_4 = false;
        FECSEntity local_8 = FECSEntity(ENTITY_NULL);
        Get local_12;
        const FC_LocalToDefault& local_14 = local_12.opCall();
        if (local_14)
        {
            local_8 = FECSEntity(local_14.DefaultEntityId);
        }
        if (!(local_8.IsValid()))
        {
            return;
        }
        AGameActor local_24 = (Cast<AGameActor>(local_8.GetActor()));
        if (local_24 != nullptr)
        {
            TArray<USceneComponent> local_32 = local_24.GetCachedSceneComponentByLogicName(this.MeshComponentName);
            for (auto local_46 : local_32)
            {
                local_48 = Cast<USkeletalMeshComponent>(local_46);
                if (local_48 != nullptr)
                {
                    local_48.SetAnimationMode(EAnimationMode(1), false);
                    local_48.SetAnimation(this.MeshAnim);
                    bool local_4_2 = true;
                    break;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        USkeletalMeshComponent local_48;
        if (!((this.MeshAnim != nullptr)))
        {
            return;
        }
        bool local_4 = false;
        FECSEntity local_8 = FECSEntity(ENTITY_NULL);
        Get local_12;
        const FC_LocalToDefault& local_14 = local_12.opCall();
        if (local_14)
        {
            local_8 = FECSEntity(local_14.DefaultEntityId);
        }
        if (!(local_8.IsValid()))
        {
            return;
        }
        AGameActor local_24 = (Cast<AGameActor>(local_8.GetActor()));
        if (local_24 != nullptr)
        {
            TArray<USceneComponent> local_32 = local_24.GetCachedSceneComponentByLogicName(this.MeshComponentName);
            for (auto local_46 : local_32)
            {
                local_48 = Cast<USkeletalMeshComponent>(local_46);
                if (local_48 != nullptr)
                {
                    local_48.SetAnimation(nullptr);
                    bool local_4_2 = true;
                    break;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        USkeletalMeshComponent local_48;
        float local_58;
        if (!((this.MeshAnim != nullptr)))
        {
            return;
        }
        bool local_4 = false;
        FECSEntity local_8 = FECSEntity(ENTITY_NULL);
        Get local_12;
        const FC_LocalToDefault& local_14 = local_12.opCall();
        if (local_14)
        {
            local_8 = FECSEntity(local_14.DefaultEntityId);
        }
        if (!(local_8.IsValid()))
        {
            return;
        }
        AGameActor local_24 = (Cast<AGameActor>(local_8.GetActor()));
        if (local_24 != nullptr)
        {
            TArray<USceneComponent> local_32 = local_24.GetCachedSceneComponentByLogicName(this.MeshComponentName);
            for (auto local_46 : local_32)
            {
                local_48 = Cast<USkeletalMeshComponent>(local_46);
                if (local_48 != nullptr)
                {
                    if (this.bLoop)
                    {
                        local_58 = Time.ActionTime.ToSeconds() % this.MeshAnim.GetPlayLength();
                    }
                    else
                    {
                        local_58 = Time.ActionTime.ToSeconds();
                    }
                    local_48.SetPosition(float32(local_58));
                    bool local_4_2 = true;
                    break;
                }
            }
        }
        return;
    }
}

