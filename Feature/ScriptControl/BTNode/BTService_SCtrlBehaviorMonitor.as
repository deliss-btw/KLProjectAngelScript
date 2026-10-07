

class UBTService_SCtrlBehaviorMonitor : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector OutNeedInterrupt;

    default SetNodeName("SCtrl Behavior Monitor");

    UBTService_SCtrlBehaviorMonitor()
    {
        this.OutNeedInterrupt.SelectedKeyName = n"SCtrlNeedInterrupt";
        this.OutNeedInterrupt.AddBoolFilter(this, n"SCtrlNeedInterrupt");
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        EScriptControlPreferBehavior local_6;
        EScriptControlCurrentBehavior local_7;
        int local_8;
        int local_9;
        if (!(FECSEntity(Context.PawnEntity).IsValid()))
        {
            return;
        }
        Has local_14;
        bool local_5 = local_14.opCall();
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            Get local_18;
            local_5 = local_18.opCall().bEnabled;
        }
        if (local_5)
        {
            FC_CombatScriptControl local_22;
            local_6 = local_22.PreferBehavior;
            local_7 = local_22.CurrentBehavior;
            local_8 = int(local_22.PreferEntryId);
            local_9 = int(local_22.CurrentEntryId);
        }
        else
        {
            bool local_19;
            Has local_30;
            local_19 = local_30.opCall();
            if (!(local_19))
            {
                local_19 = false;
            }
            else
            {
                Get local_34;
                local_19 = local_34.opCall().bEnabled;
            }
            if (local_19)
            {
                FC_ScriptControl local_36;
                local_6 = local_36.PreferBehavior;
                local_7 = local_36.CurrentBehavior;
                local_8 = int(local_36.PreferEntryId);
                local_9 = int(local_36.CurrentEntryId);
            }
            else
            {
                return;
            }
        }
        bool local_5_2 = ::ScriptControlSharedUtils::CalcIfNeedInterruptBehavior(EScriptControlPreferBehavior(local_6), EScriptControlCurrentBehavior(local_7));
        if (!(local_5_2) && (local_8 != local_9))
        {
            local_5_2 = true;
        }
        if (local_5_2)
        {
            Context.GetBlackboardComponent().SetValueAsBool(this.OutNeedInterrupt.SelectedKeyName, true);
        }
        return;
    }
}

