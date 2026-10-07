

class UBTTask_GetSCtrlInfo : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector OutBehaviorType;
    UPROPERTY()
    FBlackboardKeySelector OutTargetLocation;
    UPROPERTY()
    FBlackboardKeySelector OutTargetDirection;
    UPROPERTY()
    FBlackboardKeySelector OutTargetEntityId;
    UPROPERTY()
    FBlackboardKeySelector OutEntryId;
    UPROPERTY()
    FBlackboardKeySelector OutMoveStance;
    UPROPERTY()
    FAISmart_GameplayTag DynamicBTreeInjectTag;
    UPROPERTY()
    FBlackboardKeySelector OutIsCombat;

    default SetNodeName("Get SCtrl Info");

    UBTTask_GetSCtrlInfo()
    {
        this.OutBehaviorType.SelectedKeyName = n"SCtrlBehaviorType";
        this.OutBehaviorType.AddIntFilter(this, n"SCtrlBehaviorType");
        this.OutTargetLocation.SelectedKeyName = n"SCtrlTargetLocation";
        this.OutTargetLocation.AddVectorFilter(this, n"SCtrlTargetLocation");
        this.OutTargetDirection.SelectedKeyName = n"SCtrlTargetDirection";
        this.OutTargetDirection.AddVectorFilter(this, n"SCtrlTargetDirection");
        this.OutTargetEntityId.SelectedKeyName = n"SCtrlTargetEntityId";
        this.OutTargetEntityId.AddEntityIdFilter(this, n"SCtrlTargetEntityId");
        this.OutEntryId.SelectedKeyName = n"SCtrlEntryId";
        this.OutEntryId.AddIntFilter(this, n"SCtrlEntryId");
        this.OutMoveStance.SelectedKeyName = n"SCtrlMoveStance";
        this.OutMoveStance.AddIntFilter(this, n"SCtrlMoveStance");
        this.OutIsCombat.SelectedKeyName = n"SCtrlIsCombat";
        this.OutIsCombat.AddBoolFilter(this, n"SCtrlIsCombat");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            return EBTNodeResult(1);
        }
        Has local_12;
        bool local_5 = local_12.opCall();
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            FECSEntity::Get<FC_CombatScriptControl> local_16;
            local_5 = local_16.opCall().bEnabled;
        }
        Context.GetBlackboardComponent().SetValueAsBool(this.OutIsCombat.SelectedKeyName, local_5);
        if (local_5)
        {
            return this.ExecuteTaskCombat(Context, local_4);
        }
        return this.ExecuteTaskNonCombat(Context, local_4);
    }
    EBTNodeResult ExecuteTaskNonCombat(const FAIBehaviorTreeContext &inout Context, const FECSEntity &inout Entity) const
    {
        Has local_4;
        FC_ScriptControl local_12;
        if (!(local_4.opCall()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_12.bEnabled))
        {
            return EBTNodeResult(1);
        }
        UBlackboardComponent local_14 = Context.GetBlackboardComponent();
        if (int(local_12.PreferBehavior) == 0)
        {
            FC_ScriptControl local_26;
            local_26.CurrentBehavior = EScriptControlCurrentBehavior(0);
            local_26.CurrentEntryId = 0;
            local_14.SetValueAsInt(this.OutBehaviorType.SelectedKeyName, 0);
            return EBTNodeResult(0);
        }
        if (!(local_12.HasActiveSlot()))
        {
            return EBTNodeResult(1);
        }
        const FScriptControlQueueSlot& local_30 = local_12.Slots[int(local_12.ActiveSlotIndex)];
        FScriptControlBehaviorEntry local_84;
        if (int(local_12.PreferBehavior) == 2)
        {
            FC_ScriptControl local_26;
            if (!(local_30.bHasCurrentAction))
            {
                return EBTNodeResult(1);
            }
            local_26.CurrentBehavior = EScriptControlCurrentBehavior(2);
            local_26.CurrentEntryId = int(local_84.EntryId);
        }
        else
        {
            FC_ScriptControl local_26;
            if (int(local_12.PreferBehavior) == 1)
            {
                bool local_85_3 = local_30.GetCurrentState(local_84);
                if (!(local_85_3))
                {
                    return EBTNodeResult(1);
                }
                local_26.CurrentBehavior = EScriptControlCurrentBehavior(1);
                local_26.CurrentEntryId = int(local_84.EntryId);
            }
        }
        this.WriteBBFromEntry(Context, local_14, local_84);
        return EBTNodeResult(0);
    }
    EBTNodeResult ExecuteTaskCombat(const FAIBehaviorTreeContext &inout Context, const FECSEntity &inout Entity) const
    {
        FC_CombatScriptControl local_6;
        FC_CombatScriptControl local_20;
        UBlackboardComponent local_8 = Context.GetBlackboardComponent();
        if (int(local_6.PreferBehavior) == 0)
        {
            local_20.CurrentBehavior = EScriptControlCurrentBehavior(0);
            local_20.CurrentEntryId = 0;
            local_8.SetValueAsInt(this.OutBehaviorType.SelectedKeyName, 0);
            return EBTNodeResult(0);
        }
        if (!(local_6.HasActiveSlot()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_6.Slots[int(local_6.ActiveSlotIndex)].bHasCurrentAction))
        {
            return EBTNodeResult(1);
        }
        FScriptControlBehaviorEntry local_78;
        local_20.CurrentBehavior = EScriptControlCurrentBehavior(2);
        local_20.CurrentEntryId = int(local_78.EntryId);
        this.WriteBBFromEntry(Context, local_8, local_78);
        return EBTNodeResult(0);
    }
    void WriteBBFromEntry(const FAIBehaviorTreeContext &inout Context, const UBlackboardComponent BB, const FScriptControlBehaviorEntry &inout Entry) const
    {
        BB.SetValueAsInt(this.OutBehaviorType.SelectedKeyName, int(Entry.BehaviorName));
        BB.SetValueAsVector(this.OutTargetLocation.SelectedKeyName, Entry.Params.Location);
        BB.SetValueAsVector(this.OutTargetDirection.SelectedKeyName, Entry.Params.Direction);
        BB.SetValueAsEntityId(this.OutTargetEntityId.SelectedKeyName, Entry.Params.TargetEntityId);
        BB.SetValueAsInt(this.OutEntryId.SelectedKeyName, int(Entry.EntryId));
        this.UnpackBehaviorSpecificKeys(Context, BB, Entry);
        return;
    }
    void UnpackBehaviorSpecificKeys(const FAIBehaviorTreeContext &inout Context, const UBlackboardComponent BB, const FScriptControlBehaviorEntry &inout Entry) const
    {
        switch (int(Entry.BehaviorName))
        {
        case 1:
        {
            BB.SetValueAsInt(this.OutMoveStance.SelectedKeyName, int(Entry.Params.MoveStance));
            return;
        }
        case 2:
        {
            this.InjectDynamicBTree(Context, Entry);
            return;
        }
        case 3:
        {
            return;
        }
        }
        return;
    }
    void InjectDynamicBTree(const FAIBehaviorTreeContext &inout Context, const FScriptControlBehaviorEntry &inout Entry) const
    {
        TDataObjectPtr<FScriptControlESMSkillConfig> local_2;
        UBehaviorTree local_16;
        if (!(local_2.IsSet()))
        {
            return;
        }
        FSoftObjectPath local_12;
        Ecology::SyncLoadObject(local_12);
        if (local_16 == nullptr)
        {
            XLog(ELog(30), FString().Append("ScriptControl: Dynamic BehaviorTree asset is not loaded into memory! Dynamic inject skipped."));
            return;
        }
        FECSWorldPtr local_24 = ECS::GetECSWorld();
        ModifyOrAdd local_28;
        local_28.opCall().AddAICommandSource(local_16);
        FGameplayTag local_32 = this.DynamicBTreeInjectTag.GetValue(Context.opImplConv());
        Context.GetOwnerComponent().SetDynamicSubtree(local_32, local_16);
        return;
    }
}

