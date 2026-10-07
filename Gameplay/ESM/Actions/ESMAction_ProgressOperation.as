
enum EProgressOperationEntityType
{
    Self,
    FromBlackBoard,
}


class UESMAction_StartProgressOperation : UESMBPBaseInstantAction
{
    UPROPERTY()
    TDataObjectPtr<FProgressOperationConfig> Config;
    UPROPERTY()
    EProgressOperationEntityType InitiatorEntityType = EProgressOperationEntityType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity InitiatorEntityBBVar;
    UPROPERTY()
    EProgressOperationEntityType TargetEntityType = EProgressOperationEntityType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    bool bJoinWhenTargetInOperation = true;
    UPROPERTY()
    bool bLocalPrediction = false;


    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_10 = this.GetEntityByType(Context, this.InitiatorEntityType);
        FECSEntity local_4 = this.GetEntityByType(Context, this.TargetEntityType);
        if (this.bJoinWhenTargetInOperation)
        {
            Get local_20;
            const FC_ProgressOperationTarget& local_22 = local_20.opCall();
            if (local_22)
            {
                ::FProgressOperationUtils::JoinProgressOperation(local_22.GetOperationEntity(), local_10);
                return;
            }
        }
        ::FProgressOperationUtils::StartProgressOperation(local_10, local_4, this.Config, this.bLocalPrediction);
        return;
    }
    FECSEntity GetEntityByType(const FESMContext &inout Context, const EProgressOperationEntityType Type) const
    {
        FECSEntity __return;
        int local_1 = int(Type);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
            }
            else
            {
                FNameHandle_EntityBBVarEntity local_10;
                __return = Context.GetEntity();
                local_10;
                FECSEntity local_14 = Context.GetEntity().GetBB_Entity(local_10);
                if (local_14.IsValid())
                {
                    return local_14;
                }
            }
        }
        return ENTITY_NULL;
    }
}

class UESMAction_BreakProgressOperation : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bBreakOnActionEnd = true;
    UPROPERTY()
    EProgressOperationEntityType MemberEntityType = EProgressOperationEntityType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity MemberEntityBBVar;


    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return !(this.bBreakOnActionEnd);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.bBreakOnActionEnd))
        {
            this.DoBreak(Context);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bBreakOnActionEnd)
        {
            this.DoBreak(Context);
        }
        return;
    }
    void DoBreak(const FESMContext &inout Context) const
    {
        int local_18 = 0;
        if (this.GetEntityByType(Context, this.MemberEntityType).IsValid())
        {
            if (local_18)
            {
                ::FProgressOperationUtils::BreakProgressOperation(local_18.GetOperationEntity());
            }
        }
        return;
    }
    FECSEntity GetEntityByType(const FESMContext &inout Context, const EProgressOperationEntityType Type) const
    {
        FECSEntity __return;
        int local_1 = int(Type);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
            }
            else
            {
                FNameHandle_EntityBBVarEntity local_10;
                __return = Context.GetEntity();
                local_10;
                FECSEntity local_14 = Context.GetEntity().GetBB_Entity(local_10);
                if (local_14.IsValid())
                {
                    return local_14;
                }
            }
        }
        return ENTITY_NULL;
    }
}

class UESMAction_LeaveProgressOperation : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bLeaveOnActionEnd = true;
    UPROPERTY()
    EProgressOperationEntityType MemberEntityType = EProgressOperationEntityType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity MemberEntityBBVar;


    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return !(this.bLeaveOnActionEnd);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.bLeaveOnActionEnd))
        {
            this.DoLeave(Context);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bLeaveOnActionEnd)
        {
            this.DoLeave(Context);
        }
        return;
    }
    void DoLeave(const FESMContext &inout Context) const
    {
        int local_18 = 0;
        FECSEntity local_10 = this.GetEntityByType(Context, this.MemberEntityType);
        if (local_10.IsValid())
        {
            if (local_18)
            {
                ::FProgressOperationUtils::LeaveProgressOperation(local_18.GetOperationEntity(), local_10);
            }
        }
        return;
    }
    FECSEntity GetEntityByType(const FESMContext &inout Context, const EProgressOperationEntityType Type) const
    {
        FECSEntity __return;
        int local_1 = int(Type);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
            }
            else
            {
                FNameHandle_EntityBBVarEntity local_10;
                __return = Context.GetEntity();
                local_10;
                FECSEntity local_14 = Context.GetEntity().GetBB_Entity(local_10);
                if (local_14.IsValid())
                {
                    return local_14;
                }
            }
        }
        return ENTITY_NULL;
    }
}

