

class UESMAction_WeaponAttach : UESMBPBaseSpanAction
{
    UPROPERTY()
    uint8 AttachPriority = false;
    UPROPERTY()
    EAttachmentSocket AttachSocket = EAttachmentSocket(0);
    UPROPERTY()
    bool bAttachProjectile = false;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity AttachToProjectileEntity;
    UPROPERTY()
    bool bAttachToProjectilePosition = false;
    UPROPERTY()
    bool bAttachToProjectileRotation = false;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        TArray<FAttachmentConfig> local_20;
        int local_72 = 0;
        int local_78 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        Has local_12;
        if (!(local_6.opCall()) || !(local_12.opCall()))
        {
            return;
        }
        if (local_20.Num() > int(this.AttachSocket))
        {
            const FAttachmentConfig& local_26 = local_20[int(this.AttachSocket)];
            FWeaponAttachData local_48;
            local_48.SetbAttachToSocket(true);
            local_48.SetAttachSocket(local_26.AttachSocket);
            local_48.SetAttachKey(this.GetAttachKey());
            int local_51 = this.AttachPriority;
            local_48.SetAttachPriority(uint8(local_51));
            local_48.SetAttachPositionOffset(local_26.LocationOffset);
            local_48.SetAttachRotationOffset(local_26.RotationOffset.Quaternion());
            local_48.SetWeaponAttachDataIndex(int(this.AttachSocket));
            if (this.bAttachProjectile)
            {
                FECSEntity local_64 = Context.GetEntity().GetBB_Entity(this.AttachToProjectileEntity);
                local_48.SetbAttachToEntityPosition(this.bAttachToProjectilePosition);
                local_48.SetbAttachToEntityRotation(this.bAttachToProjectileRotation);
                local_48.SetAttachEntityId(local_64.GetId());
            }
            if (local_72)
            {
                local_72.PushAttachData(local_48, Time.WorldTime);
            }
            if (int(this.AttachSocket) == 1)
            {
                if (local_78)
                {
                    int local_21 = local_78.GetIsAttachBackCounter();
                    int local_23 = local_78.GetIsAttachBackCounter();
                    local_51 = (local_23 + 1);
                    local_78.SetIsAttachBackCounter(uint8(local_51));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_20 = 0;
        int local_34 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        Has local_12;
        if (!(local_6.opCall()) || !(local_12.opCall()))
        {
            return;
        }
        if (local_20)
        {
            local_20.PopAttachData(this.GetDataPathName(), Time.WorldTime);
        }
        if (int(this.AttachSocket) == 1)
        {
            if (local_34)
            {
                int local_38 = local_34.GetIsAttachBackCounter();
                int local_36 = local_34.GetIsAttachBackCounter();
                local_34.SetIsAttachBackCounter(uint8((local_36 - 1)));
            }
        }
        return;
    }
    FName GetAttachKey() const
    {
        return this.GetDataPathName();
    }
}

