

class UESMAction_DitherEffect : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bIncludeAttachEntity = true;
    UPROPERTY()
    float32 BlendInDuration = 1.0f;
    UPROPERTY()
    float32 BlendOutDuration = 1.0f;
    UPROPERTY()
    bool bUseBBEntityAsDitherTarget = false;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_4 = Context.GetEntity();
        if (this.bUseBBEntityAsDitherTarget)
        {
            local_4 = Context.GetEntity().GetBB_Entity(this.TargetEntityBBVar);
            if (!(local_4.IsValid()))
            {
                XError(ELog(5), FString().Append("Invalid Dither Target Entity from BB for ESMAction: ").Append(this.GetPathName(nullptr)));
                return;
            }
        }
        ::FDitherEffectUtils::RequestDitherEffect(local_4, this.GetDataPathName(), this.BlendInDuration, this.bIncludeAttachEntity);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_4 = Context.GetEntity();
        if (this.bUseBBEntityAsDitherTarget)
        {
            local_4 = Context.GetEntity().GetBB_Entity(this.TargetEntityBBVar);
            if (!(local_4.IsValid()))
            {
                XError(ELog(5), FString().Append("Invalid Dither Target Entity from BB for ESMAction: ").Append(this.GetPathName(nullptr)));
                return;
            }
        }
        ::FDitherEffectUtils::RemoveDitherEffect(local_4, this.GetDataPathName(), this.BlendOutDuration);
        return;
    }
}

