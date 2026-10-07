

struct FESMAddBuffInstanceData
{
    UPROPERTY()
    FECSEntity BuffEntity;
    UPROPERTY()
    FECSEntity BuffOwnerEntity;

    FESMAddBuffInstanceData()
    {
        return;
    }
}

class UESMAction_AddBuff : UESMBPBaseSpanAction
{
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    float32 OverrideDuration = -1.0f;
    UPROPERTY()
    bool bRemoveOnExit = false;
    UPROPERTY()
    EESMActionTargetType TargetType = EESMActionTargetType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMAddBuffInstanceData);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FName local_10;
        if (this.bRemoveOnExit)
        {
            if (this.BuffConfig.IsValid())
            {
                local_10 = this.BuffConfig.GetBuffName();
            }
            else
            {
                local_10 = NAME_None;
            }
            return FString().Append("Keep Buffпј€дїќжЊЃBuffпј‰: ").Append(local_10);
        }
        FName local_8;
        if (this.BuffConfig.IsValid())
        {
            local_8 = this.BuffConfig.GetBuffName();
        }
        else
        {
            local_8 = NAME_None;
        }
        return FString().Append("Add Buffпј€ж·»еЉ Buffпј‰: ").Append(local_8);
    }
    UFUNCTION()
    bool GetDisableInstanceData_Implementation() const
    {
        bool local_31;
        if (this.bRemoveOnExit == false)
        {
            return true;
        }
        if (!(this.BuffConfig.IsValid()) == !(false))
        {
            local_31 = true;
        }
        else
        {
            TDataObjectPtr<FBuffConfig> local_30;
            local_31 = int(this.TargetType) == 0 && (local_30.opArrow().GetMaxBuffInstanceCount() <= 1);
        }
        if (local_31)
        {
            return true;
        }
        return false;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_2 = !(false);
        if (!(this.BuffConfig.IsValid()) == local_2)
        {
            return;
        }
        FECSEntity local_6;
        if (int(this.TargetType) == 0)
        {
            local_6 = Context.GetEntity();
        }
        else
        {
            if (int(this.TargetType) == 1)
            {
                Get local_14;
                const FC_InteractionInfoForESM& local_16 = local_14.opCall();
                if (local_16)
                {
                    if (local_16.GetTargetEntity().IsValid())
                    {
                        local_6 = local_16.GetTargetEntity();
                    }
                }
            }
            else
            {
                if (int(this.TargetType) == 2)
                {
                    Get local_20;
                    const FC_LockTarget& local_22 = local_20.opCall();
                    if (local_22)
                    {
                        local_6 = local_22.GetTargetEntity();
                    }
                }
                else
                {
                    if (int(this.TargetType) == 3)
                    {
                        FNameHandle_EntityBBVarEntity local_26;
                        local_26;
                        local_6 = Context.GetEntity().GetBB_Entity(local_26);
                    }
                }
            }
        }
        FECSEntity local_30 = FBuffUtils::AddBuff(local_6, this.BuffConfig, Time.WorldTime, Context.GetEntity(), (local_6 == Context.GetEntity()), this.OverrideDuration, 1, false);
        if (this.bRemoveOnExit)
        {
            TDataObjectPtr<FBuffConfig> local_62;
            if (int(this.TargetType) != 0 || (local_62.opArrow().GetMaxBuffInstanceCount() > 1))
            {
                FESMAddBuffInstanceData& local_64 = this.ModifyInstanceData(Context);
                local_64.BuffOwnerEntity = local_6;
                local_64.BuffEntity = local_30;
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_31;
        int local_32;
        const FESMAddBuffInstanceData& local_34;
        bool local_2 = !(false);
        if (!(this.BuffConfig.IsValid()) == local_2)
        {
            return;
        }
        if (this.bRemoveOnExit)
        {
            TDataObjectPtr<FBuffConfig> local_30;
            if (int(this.TargetType) == 0 && (local_30.opArrow().GetMaxBuffInstanceCount() <= 1))
            {
                if (Time.IsEnd())
                {
                    local_31 = 0;
                }
                else
                {
                    local_31 = 1;
                }
                FBuffUtils::RemoveBuff(Context.GetEntity(), this.BuffConfig, Time.WorldTime);
                return;
            }
            if (local_30.opArrow().GetMaxBuffInstanceCount() > 1)
            {
                if (Time.IsEnd())
                {
                    local_31 = 0;
                }
                else
                {
                    local_31 = 1;
                }
                FBuffUtils::RemoveBuff(local_34.BuffOwnerEntity, local_34.BuffEntity, Time.WorldTime, EBuffEndType(local_31));
                return;
            }
            if (Time.IsEnd())
            {
                local_32 = 0;
            }
            else
            {
                local_32 = 1;
            }
            FBuffUtils::RemoveBuff(local_34.BuffOwnerEntity, this.BuffConfig, Time.WorldTime, EBuffEndType(local_32));
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.BuffConfig.IsValid() == false)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "Not Valid Skill");
        }
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bRemoveOnExit) == !(false));
        return local_1;
    }
    FESMAddBuffInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMAddBuffInstanceData __r;
        return __r;
    }
    FESMAddBuffInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMAddBuffInstanceData __r;
        return __r;
    }
}

class UESMAction_RemoveBuff : UESMBPBaseSpanAction
{
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    bool ToLockTarget = false;
    UPROPERTY()
    bool RemoveBuffOnExit = false;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FName local_9;
        if (this.BuffConfig.IsValid())
        {
            local_9 = this.BuffConfig.GetBuffName();
        }
        else
        {
            local_9 = NAME_None;
        }
        return FString().Append("Remove Buff: ").Append(local_9);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.RemoveBuffOnExit))
        {
            FECSEntity local_6 = Context.GetEntity();
            if (this.ToLockTarget)
            {
                Get local_10;
                const FC_LockTarget& local_12 = local_10.opCall();
                if (local_12)
                {
                    local_6 = local_12.GetTargetEntity();
                }
            }
            FBuffUtils::RemoveBuff(local_6, this.BuffConfig, Time.WorldTime, EBuffEndType(0));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.RemoveBuffOnExit)
        {
            FECSEntity local_6 = Context.GetEntity();
            if (this.ToLockTarget)
            {
                Get local_10;
                const FC_LockTarget& local_12 = local_10.opCall();
                if (local_12)
                {
                    local_6 = local_12.GetTargetEntity();
                }
            }
            FBuffUtils::RemoveBuff(local_6, this.BuffConfig, Time.WorldTime, EBuffEndType(0));
        }
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.RemoveBuffOnExit) == !(false));
        return local_1;
    }
}

