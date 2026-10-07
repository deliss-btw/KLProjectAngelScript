

class UESMAction_ModifyVisualScale : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FVector TargetVisualScale = FVector(1.2, 1.2, 1.2);
    UPROPERTY()
    float32 BlendInTime = 0.0f;
    UPROPERTY()
    float32 BlendOutTime = 0.0f;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((int(Context.GetEntity().GetRegistryType())) != 0)
        {
            XError(ELog(5), "UESMAction_ModifyVisualScale only supports RegDefault entities.");
            return;
        }
        GetDefaulted local_16;
        FVector local_12(local_16.opCall().Scale);
        Get local_20;
        const FC_VisualScaleModifyBlendOut& local_22 = local_20.opCall();
        if (local_22)
        {
            if (local_22.GetBlendOutTime() <= 0.0f)
            {
                local_12 = local_22.GetTargetVisualScale();
            }
            else
            {
                float local_38 = FMath::Clamp((FFPTime(Time.WorldTime) - local_22.GetBlendOutStartTime()).ToSeconds(), 0.0, local_22.GetBlendOutTime());
                local_12 = FMath::Lerp(local_22.GetInitialVisualScale(), local_22.GetTargetVisualScale(), (float32(local_38) / local_22.GetBlendOutTime()));
            }
            Remove local_48;
            local_48.opCall();
        }
        else
        {
            Get local_52;
            FC_VisualScaleModifyBlendInAndHold local_54 = local_52.opCall();
            if (local_54)
            {
                if ((FVector(local_54.GetTargetVisualScale()) == this.TargetVisualScale))
                {
                    return;
                }
                if (local_54.GetBlendInTime() <= 0.0f)
                {
                    local_12 = local_54.GetTargetVisualScale();
                }
                else
                {
                    float local_38_2 = FMath::Clamp((FFPTime(Time.WorldTime) - local_54.GetBlendInStartTime()).ToSeconds(), 0.0, local_54.GetBlendInTime());
                    local_12 = FMath::Lerp(local_54.GetInitialVisualScale(), local_54.GetTargetVisualScale(), (float32(local_38_2) / local_54.GetBlendInTime()));
                }
            }
        }
        ModifyOrAdd local_58;
        FC_VisualScaleModifyBlendInAndHold local_54_2 = local_58.opCall();
        if (local_54_2)
        {
            local_54_2.SetInitialVisualScale(local_12);
            local_54_2.SetTargetVisualScale(this.TargetVisualScale);
            local_54_2.SetBlendInStartTime(Time.WorldTime);
            local_54_2.SetBlendInTime(this.BlendInTime);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((int(Context.GetEntity().GetRegistryType())) != 0)
        {
            XError(ELog(5), "UESMAction_ModifyVisualScale only supports RegDefault entities.");
            return;
        }
        GetDefaulted local_16;
        FVector local_12(local_16.opCall().Scale);
        FVector local_22 = this.TargetVisualScale;
        float32 local_23 = this.BlendOutTime;
        FFPTime local_34 = FFPTime((Time.WorldTime.ToSeconds() + this.BlendOutTime) + 0.5);
        Get local_38;
        FC_VisualScaleModifyBlendOut local_40 = local_38.opCall();
        if (local_40)
        {
            float32 local_62;
            Has local_46;
            bool local_4 = local_46.opCall();
            if (!(local_4) && (FVector(local_40.GetTargetVisualScale()) == local_12))
            {
                return;
            }
            if (local_40.GetBlendOutTime() <= 0.0f)
            {
                local_22 = local_40.GetTargetVisualScale();
            }
            else
            {
                float local_60 = (float32((FMath::Clamp((FFPTime(Time.WorldTime) - local_40.GetBlendOutStartTime()).ToSeconds(), 0.0, local_40.GetBlendOutTime()))) / local_40.GetBlendOutTime());
                local_22 = FMath::Lerp(local_40.GetInitialVisualScale(), local_40.GetTargetVisualScale(), local_60);
            }
            if (!(local_4))
            {
                float local_60_2 = (FFPTime(Time.WorldTime) - local_40.GetBlendOutStartTime()).ToSeconds();
                float32 local_55 = float32(local_60_2);
                if (local_40.GetBlendOutTime() > 0.0f)
                {
                    float32 local_24 = local_40.GetBlendOutTime() - local_55;
                    local_62 = FMath::Max(local_24, 0.0f);
                }
                else
                {
                    local_62 = 0.0f;
                }
                local_23 = local_62;
                local_34 = local_40.GetRemoveTime();
            }
        }
        else
        {
            float32 local_62;
            Get local_66;
            const FC_VisualScaleModifyBlendInAndHold& local_68 = local_66.opCall();
            if (local_68)
            {
                if (local_68.GetBlendInTime() <= 0.0f)
                {
                    local_22 = local_68.GetTargetVisualScale();
                }
                else
                {
                    float local_60_3 = local_68.GetBlendInTime();
                    FFPTime local_26_2 = (FFPTime(Time.WorldTime) - local_68.GetBlendInStartTime());
                    float local_28_2 = FMath::Clamp(local_26_2.ToSeconds(), 0.0, local_60_3);
                    float32 local_54 = float32(local_28_2);
                    local_62 = local_68.GetBlendInTime();
                    local_22 = FMath::Lerp(local_68.GetInitialVisualScale(), local_68.GetTargetVisualScale(), (local_54 / local_62));
                }
            }
        }
        Remove local_72;
        local_72.opCall();
        ModifyOrAdd local_76;
        FC_VisualScaleModifyBlendOut local_40_2 = local_76.opCall();
        if (local_40_2)
        {
            local_40_2.SetInitialVisualScale(local_22);
            local_40_2.SetTargetVisualScale(local_12);
            local_40_2.SetBlendOutStartTime(Time.WorldTime);
            local_40_2.SetRemoveTime(local_34);
            local_40_2.SetBlendOutTime(local_23);
        }
        return;
    }
}

