

struct FBTDitherTeleportInstanceData
{
    UPROPERTY()
    float32 ElapsedTime = 0.0f;
    UPROPERTY()
    uint8 Phase = false;


}

class UBTTask_EcologyDitherTeleport : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_Vector TargetLocation = FAISmart_Vector(n"HomeLocation", EAISmartValue(0));
    UPROPERTY()
    bool bUseTargetDirection = false;
    UPROPERTY()
    bool bUseEntityDirection = false;
    UPROPERTY()
    FAISmart_Vector TargetDirection;
    UPROPERTY()
    FAISmart_EntityId DirectionEntity = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
    UPROPERTY()
    float32 DitherOutBlendDuration = 1.0f;
    UPROPERTY()
    float32 PostDitherOutDelay = 2.0f;
    UPROPERTY()
    float32 DitherInBlendDuration = 1.0f;
    UPROPERTY()
    float32 PostDitherInDelay = 1.0f;
    UPROPERTY()
    FName DitherRequestName = n"EcologyUnstuckDisappear";
    UPROPERTY()
    bool bKeepESM = true;
    UPROPERTY()
    bool bIncludeWeapon = false;

    default SetNodeName("Ecology Dither Teleport");


    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FBTDitherTeleportInstanceData;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FBTDitherTeleportInstanceData local_2;
        local_2.ElapsedTime = 0.0f;
        local_2.Phase = false;
        FECSEntity local_12 = FECSEntity(Context.PawnEntity);
        if (!(local_12.IsValid()))
        {
            return EBTNodeResult(1);
        }
        ::FDitherEffectUtils::RequestDitherEffect(local_12, this.DitherRequestName, this.DitherOutBlendDuration, true);
        this.RequestDitherForWeapons(local_12, this.DitherOutBlendDuration);
        return EBTNodeResult(3);
    }
    UFUNCTION()
    void TickTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        FBTDitherTeleportInstanceData local_2;
        local_2.ElapsedTime += DeltaSeconds;
        FECSEntity local_12 = FECSEntity(Context.PawnEntity);
        if (!(local_12.IsValid()))
        {
            this.FinishLatentTask(Context, EBTNodeResult(1));
            return;
        }
        if (int(local_2.Phase) == 0)
        {
            if (local_2.ElapsedTime >= this.PostDitherOutDelay)
            {
                FVector local_32 = this.TargetLocation.GetValue(Context.opImplConv());
                FRotator local_38 = FRotator(FRotator::ZeroRotator);
                if (this.bUseTargetDirection)
                {
                    bool local_45;
                    FVector local_44 = local_32;
                    local_45 = true;
                    if (this.bUseEntityDirection)
                    {
                        if (FECSEntity(this.DirectionEntity.GetValue(Context.opImplConv())).IsValid())
                        {
                            GetDefaulted local_60;
                            local_44 = local_60.opCall().GetPosition();
                        }
                        else
                        {
                            local_45 = false;
                        }
                    }
                    else
                    {
                        local_44 = this.TargetDirection.GetValue(Context.opImplConv());
                    }
                    if (local_45)
                    {
                        FVector local_24 = (local_44 - local_32);
                        local_24.Z = 0.0;
                        if (!(local_24.IsNearlyZero(9.999999747378752e-5)))
                        {
                            local_38 = FRotator::MakeFromX(local_24);
                        }
                    }
                }
                ::FEcologyUtils::TeleportEcologyCreatureToTransform(local_12, local_32, local_38, this.bKeepESM);
                ::FDitherEffectUtils::RemoveDitherEffect(local_12, this.DitherRequestName, this.DitherInBlendDuration);
                this.RemoveDitherForWeapons(local_12, this.DitherInBlendDuration);
                local_2.Phase = true;
                local_2.ElapsedTime = 0.0f;
            }
        }
        else
        {
            if (local_2.ElapsedTime >= this.PostDitherInDelay)
            {
                this.FinishLatentTask(Context, EBTNodeResult(0));
            }
        }
        return;
    }
    UFUNCTION()
    void OnTaskFinished_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const EBTNodeResult TaskResult) const
    {
        if (int(TaskResult) != 0)
        {
            FBTDitherTeleportInstanceData local_6;
            FECSEntity local_14 = FECSEntity(Context.PawnEntity);
            if (local_14.IsValid() && (int(local_6.Phase) == 0))
            {
                ::FDitherEffectUtils::RemoveDitherEffect(local_14, this.DitherRequestName, 0.0f);
                this.RemoveDitherForWeapons(local_14, 0.0f);
            }
        }
        return;
    }
    FBTDitherTeleportInstanceData GetInstanceData(const FBTNodeMemory &inout NodeMemory) const
    {
        FBTDitherTeleportInstanceData __r;
        return __r;
    }
    void RequestDitherForWeapons(const FECSEntity &inout PawnEntity, const float32 BlendDuration) const
    {
        int local_8 = 0;
        if (!(this.bIncludeWeapon))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        int local_10 = local_8.GetNumWeapons();
        int local_11 = 0;
        for (; local_11 < local_10; ++local_11)
        {
            FECSEntity local_16 = local_8.GetWeapon(local_11).GetWeaponEntity();
            if (local_16.IsValid())
            {
                ::FDitherEffectUtils::RequestDitherEffect(local_16, this.DitherRequestName, BlendDuration, true);
            }
        }
        return;
    }
    void RemoveDitherForWeapons(const FECSEntity &inout PawnEntity, const float32 BlendDuration) const
    {
        int local_8 = 0;
        if (!(this.bIncludeWeapon))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        int local_10 = local_8.GetNumWeapons();
        int local_11 = 0;
        for (; local_11 < local_10; ++local_11)
        {
            FECSEntity local_16 = local_8.GetWeapon(local_11).GetWeaponEntity();
            if (local_16.IsValid())
            {
                ::FDitherEffectUtils::RemoveDitherEffect(local_16, this.DitherRequestName, BlendDuration);
            }
        }
        return;
    }
}

