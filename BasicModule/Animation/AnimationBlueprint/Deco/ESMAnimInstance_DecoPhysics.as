

class UESMAnimInstance_DecoPhysics : UAnimInstance
{
    UPROPERTY()
    float32 RBANAlpha = 0.0f;
    bool bClothCollisionInitialized = false;


    UFUNCTION()
    void BlueprintUpdateAnimation_Implementation(const float32 DeltaTime)
    {
        if (!(this.bClothCollisionInitialized))
        {
            this.SetupClothCollision();
        }
        return;
    }
    void SetupClothCollision()
    {
        USkeletalMeshComponent local_2 = this.GetOwningComponent();
        if (local_2 == nullptr)
        {
            return;
        }
        USkeletalMeshComponent local_10 = (Cast<USkeletalMeshComponent>(local_2.GetAttachParent()));
        if (local_10 == nullptr)
        {
            return;
        }
        USkeletalMesh local_12 = local_10.GetSkeletalMeshAsset();
        if (local_12 == nullptr)
        {
            return;
        }
        UPhysicsAsset local_16 = local_12.GetPhysicsAsset();
        if (local_16 == nullptr)
        {
            return;
        }
        local_2.AddClothCollisionSource(local_10, local_16);
        this.bClothCollisionInitialized = true;
        this.ResetDynamics(ETeleportType(2));
        this.RBANAlpha = 1.0f;
        return;
    }
}

