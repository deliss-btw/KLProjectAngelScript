

class UESMAnimInstance_MonsterBipedRiderOfDoom : UESMAnimInstance_MonsterBipedBase
{
    UPROPERTY()
    FC_AnimRiderHandIK RiderHandIKControl;
    UPROPERTY()
    FVector RiderHandIKSocketLocation = FVector::ZeroVector;
    UPROPERTY()
    bool bRiderHandIKHasSocketLocation = false;
    UPROPERTY()
    FName RiderHandIKSocketName = NAME_None;
    UPROPERTY()
    float32 TailDynamicAlpha = 1.0f;


    UFUNCTION()
    void WhenUpdateMainAnimInstance_Implementation(const float32 DeltaTimeX)
    {
        Super::WhenUpdateMainAnimInstance_Implementation(DeltaTimeX);
        if (this.GetbLogicUpdate())
        {
            return;
        }
        this.UpdateRiderHandIKData();
        return;
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        Super::EntitySync_SyncHistory_Implementation(SampleTime);
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.RiderHandIKControl)))
        {
            FC_AnimRiderHandIK local_12;
            this.RiderHandIKControl = local_12;
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncView_Implementation()
    {
        Super::EntitySync_SyncView_Implementation();
        return;
    }
    UFUNCTION()
    void EntitySync_SyncLogic_Implementation()
    {
        Super::EntitySync_SyncLogic_Implementation();
        return;
    }
    void UpdateRiderHandIKData()
    {
        AActor local_30;
        this.bRiderHandIKHasSocketLocation = false;
        if (this.RiderHandIKSocketName.IsNone())
        {
            return;
        }
        if (Super::IsESMEditorPreview())
        {
            return;
        }
        FNameHandle_EntityBBVarEntity local_12;
        local_12;
        Has local_20;
        if (!(this.Entity.GetBB_Entity(local_12).IsValid()) || !(local_20.opCall()))
        {
            return;
        }
        if (local_30 == nullptr)
        {
            return;
        }
        USkeletalMeshComponent local_36 = Cast<USkeletalMeshComponent>(local_30.GetComponentByClass(USkeletalMeshComponent));
        if (local_36 == nullptr)
        {
            return;
        }
        if (local_36.DoesSocketExist(this.RiderHandIKSocketName))
        {
            FTransform local_88 = local_36.GetSocketTransform(this.RiderHandIKSocketName, ERelativeTransformSpace(0));
            this.RiderHandIKSocketLocation = local_88.GetLocation();
            this.bRiderHandIKHasSocketLocation = true;
        }
        return;
    }
}

