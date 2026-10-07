

// NOTE: class defaults are not authored in this module: UESMAction_TriggerInteract (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FESMKeepInteractInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    uint64 UniqueId;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex TargetPointAndBehaviorIndex;


}

struct FESMKeepInteractViewInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    uint64 UniqueId;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex TargetPointAndBehaviorIndex;


}

class UESMAction_KeepInteract : UESMBPBaseSpanTickAction
{
    UESMAction_KeepInteract()
    {
        return;
    }
    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMKeepInteractInstanceData);
    }
    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMKeepInteractViewInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(3);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_76 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Get local_6;
        const FC_InteractionInfoForESM& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.GetTargetEntity().IsValid();
            const FInteractionPointAndBehaviorIndex& local_12 = local_8.GetTargetPointAndBehaviorIndex();
            ::FInteractUtils::AddInteractingSourceEntityToTarget(local_2, local_8.GetTargetEntity(), local_12);
            FDataObjectPtr local_38 = ::FInteractUtils::GetInteractionPointTypeRowHandleFromEntity(local_8.GetTargetEntity(), local_12.GetPointIndex());
            local_38.IsValid();
            UInteractionBehaviorBase local_66 = ::FInteractUtils::GetInteractionBehaviorInRow(local_38, local_12.GetBehaviorIndex());
            Has local_70;
            bool local_9 = local_70.opCall();
            if (local_66 != nullptr)
            {
                local_76.AddInteractionBehaviorStatus(local_66);
            }
            local_66.BeginKeepInteract(local_2, local_8.GetTargetEntity(), local_12);
            FESMKeepInteractInstanceData& local_78 = this.ModifyInstanceData(Context);
            local_78.TargetEntity = local_8.GetTargetEntity();
            local_78.UniqueId = local_38.GetUniqueID();
            local_78.TargetPointAndBehaviorIndex = local_12;
        }
        FC_InteractKeepingTag local_86;
        Assign local_84;
        local_84.opCall(local_86);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        FESMKeepInteractInstanceData local_4;
        FInteractionPointAndBehaviorIndex local_6 = local_4.TargetPointAndBehaviorIndex;
        FDataObjectPtr local_30;
        Get local_34;
        const FC_InteractionInfoForESM& local_36 = local_34.opCall();
        if (local_36)
        {
            if ((FECSEntity(local_36.GetTargetEntity()) == local_4.TargetEntity))
            {
                int local_43 = local_36.GetTargetPointAndBehaviorIndex().GetBehaviorIndex();
                int local_44 = local_6.GetBehaviorIndex();
                int local_44_2 = local_36.GetTargetPointAndBehaviorIndex().GetPointIndex();
                int local_43_2 = local_6.GetPointIndex();
                local_30 = ::FInteractUtils::GetInteractionPointTypeRowHandleFromEntity(local_36.GetTargetEntity(), local_6.GetPointIndex());
                if (local_30.IsValid())
                {
                    int64 local_70 = local_30.GetUniqueID();
                    int64 local_72 = local_4.UniqueId;
                }
            }
            else
            {
                GetDefaulted local_76;
                (FECSEntity(local_76.opCall().GetTargetEntity()) == local_4.TargetEntity);
            }
        }
        if (!(local_30.IsValid()))
        {
            local_30 = ::FInteractUtils::GetInteractionPointTypeRowHandle(local_4.UniqueId);
        }
        ::FInteractUtils::GetInteractionBehaviorInRow(local_30, local_6.GetBehaviorIndex()).EndKeepInteract(local_2, local_4.TargetEntity, local_6);
        ::FInteractUtils::RemoveInteractingSourceEntityFromTarget(local_2, local_4.TargetEntity, -1, -1);
        Remove local_84;
        local_84.opCall();
        return;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.TryBeginKeepInteractPresentation(Context)))
        {
            FC_DelayKeepInteractPresentationTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            if (this.TryBeginKeepInteractPresentation(Context))
            {
                Remove local_10;
                local_10.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FESMKeepInteractViewInstanceData& local_2 = this.GetViewInstanceData(Context);
        FInteractionPointAndBehaviorIndex local_4 = local_2.TargetPointAndBehaviorIndex;
        UInteractionBehaviorBase local_60 = ::FInteractUtils::GetInteractionBehaviorInRow(::FInteractUtils::GetInteractionPointTypeRowHandle(local_2.UniqueId), local_4.GetBehaviorIndex());
        if (local_60 != nullptr)
        {
            local_60.EndKeepInteractPresentation(Context.GetEntity(), local_2.TargetEntity, local_4);
        }
        Remove local_66;
        local_66.opCall();
        return;
    }
    FESMKeepInteractInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMKeepInteractInstanceData __r;
        return __r;
    }
    FESMKeepInteractInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMKeepInteractInstanceData __r;
        return __r;
    }
    const FESMKeepInteractViewInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMKeepInteractViewInstanceData __r;
        return __r;
    }
    FESMKeepInteractViewInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMKeepInteractViewInstanceData __r;
        return __r;
    }
    bool TryBeginKeepInteractPresentation(const FESMViewContext &inout Context) const
    {
        FECSEntity local_4 = Context.GetEntity();
        Get local_8;
        const FC_InteractionInfoForESM& local_10 = local_8.opCall();
        if (local_10)
        {
            Has local_16;
            if (!(local_16.opCall()))
            {
                return false;
            }
            FDataObjectPtr local_42 = ::FInteractUtils::GetInteractionPointTypeRowHandleFromEntity(local_10.GetTargetEntity(), local_10.GetTargetPointAndBehaviorIndex().GetPointIndex());
            if (local_42.IsValid())
            {
                UInteractionBehaviorBase local_70 = ::FInteractUtils::GetInteractionBehaviorInRow(local_42, local_10.GetTargetPointAndBehaviorIndex().GetBehaviorIndex());
                if (local_70 != nullptr)
                {
                    local_70.BeginKeepInteractPresentation(local_4, local_10.GetTargetEntity(), local_10.GetTargetPointAndBehaviorIndex());
                    FESMKeepInteractViewInstanceData& local_72 = this.ModifyViewInstanceData(Context);
                    local_72.TargetEntity = local_10.GetTargetEntity();
                    local_72.UniqueId = local_42.GetUniqueID();
                    local_72.TargetPointAndBehaviorIndex = local_10.GetTargetPointAndBehaviorIndex();
                    return true;
                }
            }
        }
        return false;
    }
}

class UESMAction_TriggerInteract : UESMBPBaseInstantAction
{
    UESMAction_TriggerInteract()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(3);
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Get local_6;
        const FC_InteractionInfoForESM& local_8 = local_6.opCall();
        if (local_8)
        {
            ::FInteractUtils::ExecuteInteractSuccessAction(local_2, local_8.GetTargetEntity(), local_8.GetTargetPointAndBehaviorIndex());
        }
        return;
    }
}

class UESMAction_EnableInteractProgress : UESMBPBaseSpanAction
{
    UESMAction_EnableInteractProgress()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        FC_EnableInteractProgressTag local_8;
        Assign local_6;
        local_6.opCall(local_8);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Remove local_6;
        local_6.opCall();
        return;
    }
}

class UESMAction_AddInteractProgress : UESMBPBaseInstantAction
{
    UPROPERTY()
    FESMBBVar_Float ProgressValueToAdd;

    UESMAction_AddInteractProgress()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

class UESMAction_AccountExclusivePropClientDisableInteract : UESMBPBaseSpanAction
{
    UESMAction_AccountExclusivePropClientDisableInteract()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_AccountExclusivePropClientDisableInteract& local_6 = local_4.opCall();
        if (local_6)
        {
            ++local_6.Count;
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_AccountExclusivePropClientDisableInteract& local_6 = local_4.opCall();
        if (local_6)
        {
            --local_6.Count;
            if (int(local_6.Count) <= 0)
            {
                Remove local_14;
                local_14.opCall();
            }
        }
        return;
    }
}

