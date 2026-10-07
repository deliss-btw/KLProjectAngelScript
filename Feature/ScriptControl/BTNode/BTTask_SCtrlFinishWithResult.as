

class UBTTask_SCtrlFinishWithResult : UBTTask_ECSScriptBase
{
    UPROPERTY()
    EScriptControlResult Result;
    UPROPERTY()
    FBlackboardKeySelector InIsCombat;
    UPROPERTY()
    FBlackboardKeySelector OutNeedInterrupt;

    default SetNodeName("SCtrl Finish With Result");

    UBTTask_SCtrlFinishWithResult()
    {
        this.Result = EScriptControlResult(0);
        this.InIsCombat.SelectedKeyName = n"SCtrlIsCombat";
        this.InIsCombat.AddBoolFilter(this, n"SCtrlIsCombat");
        this.OutNeedInterrupt.SelectedKeyName = n"SCtrlNeedInterrupt";
        this.OutNeedInterrupt.AddBoolFilter(this, n"SCtrlNeedInterrupt");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        bool local_5 = !(local_4.IsValid());
        if (local_5)
        {
            return EBTNodeResult(1);
        }
        bool local_5_2 = Context.GetBlackboardComponent().GetValueAsBool(this.InIsCombat.SelectedKeyName);
        if (local_5_2)
        {
            FC_CombatScriptControl local_20;
            Has local_14;
            if (!(local_14.opCall()))
            {
                return EBTNodeResult(1);
            }
            if (!(local_20.bEnabled) || (int(local_20.CurrentBehavior) == 0))
            {
                return EBTNodeResult(1);
            }
            ::CombatScriptControlUtils::FinishCurrentCombatBehavior(local_4, this.Result);
        }
        else
        {
            FC_ScriptControl local_36;
            Has local_30;
            if (!(local_30.opCall()))
            {
                return EBTNodeResult(1);
            }
            if (!(local_36.bEnabled) || (int(local_36.CurrentBehavior) == 0))
            {
                return EBTNodeResult(1);
            }
            ::ScriptControlUtils::FinishCurrentBehavior(local_4, this.Result);
        }
        Context.GetBlackboardComponent().SetValueAsBool(this.OutNeedInterrupt.SelectedKeyName, true);
        return EBTNodeResult(0);
    }
}

