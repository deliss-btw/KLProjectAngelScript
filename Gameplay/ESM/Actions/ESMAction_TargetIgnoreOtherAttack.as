

struct FESMTargetIgnoreOtherAttackInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;

    FESMTargetIgnoreOtherAttackInstanceData()
    {
        return;
    }
}

class UESMAction_TargetIgnoreOtherAttack : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;

    UESMAction_TargetIgnoreOtherAttack()
    {
        return;
    }
    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMTargetIgnoreOtherAttackInstanceData);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.IdentifyName = UESMAction_TargetIgnoreOtherAttack.opArrow().GetFName();
        OutParam.bExclusive = true;
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_13;
        FNameHandle_EntityBBVarEntity local_8;
        local_8;
        FECSEntity local_12 = Context.GetEntity().GetBB_Entity(local_8);
        if (!(local_12.IsValid()))
        {
            local_13 = false;
        }
        else
        {
            Has local_18;
            local_13 = local_18.opCall();
        }
        if (local_13)
        {
            this.ModifyInstanceData(Context).TargetEntity = local_12;
            FC_OnlyAcceptSpecificEntityAttack local_30;
            Assign local_24;
            local_24.opCall(local_30).SetAcceptedEntity(Context.GetEntity());
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_5;
        FECSEntity local_4;
        if (!(local_4.IsValid()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            Get local_16;
            const FC_OnlyAcceptSpecificEntityAttack& local_18 = local_16.opCall();
            if (local_18)
            {
                if ((FECSEntity(local_18.GetAcceptedEntity()) == Context.GetEntity()))
                {
                    Remove local_26;
                    local_26.opCall();
                }
            }
        }
        return;
    }
    FESMTargetIgnoreOtherAttackInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMTargetIgnoreOtherAttackInstanceData __r;
        return __r;
    }
    FESMTargetIgnoreOtherAttackInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMTargetIgnoreOtherAttackInstanceData __r;
        return __r;
    }
}

