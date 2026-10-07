

class UESMAnimInstance_Prop : UKLAnimInstance
{
    UPROPERTY()
    FESMAnimState UpperLayer;
    UPROPERTY()
    FESMAnimState MainLayer;

    UESMAnimInstance_Prop()
    {
        this.UpperLayer.SetLayer(n"UpperLayer");
        this.MainLayer.SetLayer(n"MainLayer");
        return;
    }
    void UpdataCharacterESMBBData()
    {
        return;
    }
    UFUNCTION()
    void WhenUpdateMainAnimInstance_Implementation(const float32 DeltaTimeX)
    {
        if ((int(this.GetOwningActor().GetWorld().GetNetMode())) != 1)
        {
            this.UpdateCharacterAnimData();
            this.UpdataCharacterESMBBData();
        }
        return;
    }
    float32 NormalizeCalculateElapsedTime(const FFPTime &inout ElapsedTime, const float32 MaxElapsedTime) const
    {
        if (ElapsedTime.opCmp(MaxElapsedTime) > 0 || (ElapsedTime.opCmp(0.0) < 0) || (MaxElapsedTime <= 0.0f))
        {
            return -1.0f;
        }
        return (float32(ElapsedTime.ToSeconds()) / MaxElapsedTime);
    }
    void UpdateCharacterAnimData()
    {
        return;
    }
    void UpdateAnimationVariant(const EWeaponType WeaponType, const bool NeedTransit)
    {
        return;
    }
    UFUNCTION()
    float32 GetStateDuration(const FName &inout StateName) const
    {
        int local_2 = 0;
        if (local_2)
        {
            return float32((local_2.GetStateDurationSeconds(StateName, this.UpdatedTime).ToSeconds()));
        }
        return 0.0f;
    }
    bool GetForceTransit(const FESMAnimState &inout AnimState) const
    {
        for (auto& local_16 : this.AnimLayerInfo)
        {
            if ((FName(local_16.Layer) == AnimState.GetLayer()))
            {
                return local_16.ForceTransit;
            }
        }
        return false;
    }
    UFUNCTION()
    void UpdateMainLayerBlendStackNode(const FAnimUpdateContext &in Context, const FAnimNodeReference &in Node) const
    {
        EAnimNodeReferenceConversionResult local_1 = EAnimNodeReferenceConversionResult(0);
        FBlendStackAnimNodeReference local_6 = BlendStackAnimNode::ConvertToBlendStackNode(Node, local_1);
        if (int(local_1) == 1)
        {
            local_6.UpdateBlendStack(Context, this.MainLayer, this.GetbLogicUpdate(), this.GetForceTransit(this.MainLayer));
        }
        return;
    }
}

