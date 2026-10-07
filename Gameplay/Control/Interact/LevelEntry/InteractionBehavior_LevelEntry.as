

UCLASS(Abstract)
class UInteractionBehavior_LevelEntry : UInteractionBehaviorBase
{
    default InteractType = EInteractType(17);

    UInteractionBehavior_LevelEntry()
    {
        super();
        return;
    }
    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        if (!(0))
        {
            return false;
        }
        Has local_12;
        if (local_12.opCall())
        {
            return false;
        }
        return Super::CheckBehaviorConditions(InteractSource, InteractTarget);
    }
    void ExecuteBeginAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bPresentationOnly = false)
    {
        int local_6 = 0;
        int local_27 = 0;
        bool local_7 = !(local_6.DungeonConfig.IsSet());
        if (local_7)
        {
            return;
        }
        Super::ExecuteBeginAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex, bPresentationOnly);
        if (0 != 2)
        {
            local_7 = false;
        }
        else
        {
            local_7 = ECS::GetRuntimeInfo().IsClient;
        }
        if (local_7)
        {
            FCS_FixedTime local_22;
            ECS::GetECSWorld().IsValid();
            if (!(local_22.bFirstTimeTick))
            {
                return;
            }
            UGameClientConnectionSubsystem local_26 = ::UGameClientConnectionSubsystem::Get();
            if (local_26 != nullptr)
            {
                local_26.SendStartDungeonReq(local_27);
            }
        }
        return;
    }
    void BeginKeepInteractPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Super::BeginKeepInteractPresentation(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        FC_LevelEntryInteractPresentationTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
    void EndKeepInteractPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Super::EndKeepInteractPresentation(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        Remove local_4;
        local_4.opCall();
        return;
    }
}

