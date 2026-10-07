

class UBTTask_SCtrlFinishCheck : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector InIsCombat;

    default SetNodeName("SCtrl Finish Check");

    UBTTask_SCtrlFinishCheck()
    {
        this.InIsCombat.SelectedKeyName = n"SCtrlIsCombat";
        this.InIsCombat.AddBoolFilter(this, n"SCtrlIsCombat");
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
            return this.ExecuteCheckCombat(local_4);
        }
        return this.ExecuteCheckNonCombat(local_4);
    }
    EBTNodeResult ExecuteCheckNonCombat(const FECSEntity &inout Entity) const
    {
        Has local_4;
        int local_6;
        FC_ScriptControl local_12;
        if (!(local_4.opCall()))
        {
            return EBTNodeResult(1);
        }
        if ((!(local_12.bEnabled) || (int(local_12.CurrentBehavior) == 0)))
        {
            return EBTNodeResult(1);
        }
        bool local_16 = this.CheckCurrentBehaviorFinished(Entity, ::ScriptControlUtils::GetCurrentBehaviorName(local_12), false);
        if (local_16)
        {
            local_6 = 0;
        }
        else
        {
            local_6 = 1;
        }
        return EBTNodeResult(local_6);
    }
    EBTNodeResult ExecuteCheckCombat(const FECSEntity &inout Entity) const
    {
        Has local_4;
        int local_6;
        FC_CombatScriptControl local_12;
        if (!(local_4.opCall()))
        {
            return EBTNodeResult(1);
        }
        if ((!(local_12.bEnabled) || (int(local_12.CurrentBehavior) == 0)))
        {
            return EBTNodeResult(1);
        }
        EScriptControlBehaviorName local_17 = local_12.CurrentActionBehavior;
        bool local_16 = this.CheckCurrentBehaviorFinished(Entity, EScriptControlBehaviorName(local_17), true);
        if (local_16)
        {
            local_6 = 0;
        }
        else
        {
            local_6 = 1;
        }
        return EBTNodeResult(local_6);
    }
    bool CheckCurrentBehaviorFinished(const FECSEntity &inout Entity, const EScriptControlBehaviorName BehaviorName, const bool bIsCombat) const
    {
        int local_1 = int(BehaviorName);
        if (local_1 <= 1)
        {
            if (local_1 != 1)
            {
            }
            else
            {
                return this.CheckEcologyMove(Entity, bIsCombat);
            }
        }
        return false;
    }
    bool CheckEcologyMove(const FECSEntity &inout Entity, const bool bIsCombat) const
    {
        FScriptControlBehaviorEntry local_54;
        int local_62 = 0;
        bool local_55 = false;
        bool local_56 = !(bIsCombat);
        if (local_56)
        {
            local_56 = ::ScriptControlUtils::GetCurrentEntry(local_62, local_54);
            local_55 = local_56;
        }
        else
        {
            FC_CombatScriptControl local_68;
            if (!(local_68.HasActiveSlot()))
            {
                local_56 = false;
            }
            else
            {
                local_56 = local_68.Slots[int(local_68.ActiveSlotIndex)].bHasCurrentAction;
            }
            if (local_56)
            {
                int local_69 = int(local_68.ActiveSlotIndex);
                local_55 = true;
            }
        }
        if (!(local_55))
        {
            return false;
        }
        GetDefaulted local_80;
        FVector local_76 = local_80.opCall().GetPosition();
        GetDefaulted local_98;
        float32 local_94 = local_98.opCall().AcceptanceRadius;
        GetDefaulted local_92;
        float32 local_87 = local_92.opCall().GetScaledRadius() + local_94;
        return (local_76.DistSquared2D(local_54.Params.Location) <= (local_87 * local_87));
    }
}

