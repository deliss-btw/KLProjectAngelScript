

class USkillTransitCondition_SkillTargetEntityNum : USkillTransitComplexCondition
{
    UPROPERTY()
    int MinTargetNum = 1;
    UPROPERTY()
    int MaxTargetNum = 1;


    UFUNCTION()
    bool Evaluate_Implementation(const FECSEntity &inout Entity, const FC_SkillInstance &inout SkillInstance, const FFPTime &inout ContextTime) const
    {
        const USkillConfig local_14;
        TArray<FECSEntity> local_22;
        if ((SkillInstance.GetSkillConfig() == nullptr))
        {
            return false;
        }
        TSoftObjectPtr<USkillConfig> local_10 = SkillInstance.GetSkillConfig();
        local_14.GetSkillName();
        if (local_22.Num() >= this.MinTargetNum && (local_22.Num() <= this.MaxTargetNum))
        {
            return true;
        }
        return false;
    }
}

class USkillTransitCondition_SkillTargetPosDistance : USkillTransitComplexCondition
{
    UPROPERTY()
    float32 MinDistance = 0.0f;
    UPROPERTY()
    float32 MaxDistance = 0.0f;


    UFUNCTION()
    bool Evaluate_Implementation(const FECSEntity &inout Entity, const FC_SkillInstance &inout SkillInstance, const FFPTime &inout ContextTime) const
    {
        bool local_2 = false;
        bool local_1 = local_2;
        FVector local_14 = ::FTargetSelectUtils::GetSkillTargetPosition(Entity, local_1);
        if (local_1)
        {
            GetDefaulted local_20;
            float32 local_23 = float32(local_20.opCall().GetPosition().DistSquared(local_14));
            float32 local_15 = this.MinDistance * this.MinDistance;
            if (local_23 < local_15)
            {
                local_2 = false;
            }
            else
            {
                local_15 = this.MaxDistance;
                local_15 = local_15 * this.MaxDistance;
                local_2 = (local_23 <= local_15);
            }
            if (local_2)
            {
                return true;
            }
        }
        return false;
    }
}

class USkillTransitCondition_LockTargetDistance : USkillTransitComplexCondition
{
    UPROPERTY()
    float32 MinDistance = 0.0f;
    UPROPERTY()
    float32 MaxDistance = 0.0f;


    UFUNCTION()
    bool Evaluate_Implementation(const FECSEntity &inout Entity, const FC_SkillInstance &inout SkillInstance, const FFPTime &inout ContextTime) const
    {
        bool local_7;
        Get local_4;
        const FC_LockTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetTargetEntity().IsValid())
            {
                GetDefaulted local_12;
                GetDefaulted local_16;
                float32 local_19 = float32(local_12.opCall().GetPosition().DistSquared(local_16.opCall().GetPosition()));
                float32 local_8 = this.MinDistance * this.MinDistance;
                if (local_19 < local_8)
                {
                    local_7 = false;
                }
                else
                {
                    local_8 = this.MaxDistance;
                    local_8 = local_8 * this.MaxDistance;
                    local_7 = (local_19 <= local_8);
                }
                if (local_7)
                {
                    return true;
                }
            }
        }
        return false;
    }
}

