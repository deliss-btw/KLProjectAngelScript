

class UESMAnimInstance_Prop_Weapon : UAnimInstance
{
    UPROPERTY()
    int WeaponState;
    UPROPERTY()
    USkeletalMeshComponent MasterSKMC;

    UESMAnimInstance_Prop_Weapon()
    {
        return;
    }
    UFUNCTION()
    void BlueprintUpdateAnimation_Implementation(const float32 DeltaTimeX)
    {
        AFXActor local_10;
        AGameCharacterActor local_16;
        if (this.MasterSKMC == nullptr)
        {
            local_10 = (Cast<AFXActor>(this.GetOwningActor()));
            if (local_10 != nullptr)
            {
                local_16 = (Cast<AGameCharacterActor>(local_10.OwnerEntity.GetActor()));
                if (local_16 != nullptr)
                {
                    this.MasterSKMC = local_16.ViewMesh;
                }
            }
        }
        FECSEntity local_20 = ECS::GetEntity(this.GetOwningActor(), false);
        if (!(local_20.IsValid()))
        {
            return;
        }
        FNameHandle_EntityBBVar local_30;
        local_30;
        if (local_20.HasEntityBB(local_30))
        {
            FNameHandle_EntityBBVarInt local_34;
            local_34;
            this.WeaponState = local_20.GetBB_Int(local_34);
        }
        return;
    }
}

