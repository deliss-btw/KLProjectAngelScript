
enum EScriptControlSourceType
{
    LBP,
    Cutscene,
}

enum EScriptControlBehaviorType
{
    State,
    Action,
}

enum EScriptControlResult
{
    Success,
    Failed,
    Interrupted,
    Manual,
}

enum EScriptControlPreferBehavior
{
    PB_None,
    PB_State,
    PB_Action,
}

enum EScriptControlCurrentBehavior
{
    CB_None,
    CB_ExecutingState,
    CB_ExecutingAction,
}

enum EScriptControlBehaviorName
{
    None,
    EcologyMove,
    TriggerESMSkill,
    TriggerESMEcology,
}


struct FScriptControlEcologyMoveParams
{
    UPROPERTY()
    FString Tag;
    UPROPERTY()
    FVector Location = FVector::ZeroVector;
    UPROPERTY()
    FVector Direction = FVector::ZeroVector;
    UPROPERTY()
    ECreatureMoveStance MoveStance = ECreatureMoveStance(0);


}

struct FScriptControlTriggerESMParams
{
    UPROPERTY()
    FString Tag;
    UPROPERTY()
    TDataObjectPtr<FScriptControlESMSkillConfig> SkillConfig;
    UPROPERTY()
    FName ESMNameCondition;
    UPROPERTY()
    FECSEntityId TargetEntityId;
    UPROPERTY()
    FVector Location = FVector::ZeroVector;
    UPROPERTY()
    FVector Direction = FVector::ZeroVector;

    FScriptControlTriggerESMParams()
    {
        return;
    }
}

struct FScriptControlESMSkillParams
{
    UPROPERTY()
    FString Tag;
    UPROPERTY()
    TDataObjectPtr<FScriptControlESMSkillConfig> SkillConfig;
    UPROPERTY()
    FECSEntityId TargetEntityId;
    UPROPERTY()
    FVector Location = FVector::ZeroVector;
    UPROPERTY()
    FVector Direction = FVector::ZeroVector;

    FScriptControlESMSkillParams()
    {
        return;
    }
}

struct FScriptControlESMEcologyBehaviorParams
{
    UPROPERTY()
    FString Tag;
    UPROPERTY()
    FName ESMNameCondition;
    UPROPERTY()
    FECSEntityId TargetEntityId;
    UPROPERTY()
    FVector Location = FVector::ZeroVector;
    UPROPERTY()
    FVector Direction = FVector::ZeroVector;

    FScriptControlESMEcologyBehaviorParams()
    {
        return;
    }
}

struct FScriptControlBehaviorParams
{
    UPROPERTY()
    FString Tag;
    UPROPERTY()
    FECSEntityId TargetEntityId;
    UPROPERTY()
    FVector Location = FVector::ZeroVector;
    UPROPERTY()
    FVector Direction = FVector::ZeroVector;
    UPROPERTY()
    ECreatureMoveStance MoveStance = ECreatureMoveStance(0);
    UPROPERTY()
    TDataObjectPtr<FScriptControlESMSkillConfig> ESMSkillConfig;
    UPROPERTY()
    FName NameParam;
    UPROPERTY()
    int IntParam = 0;
    UPROPERTY()
    float32 FloatParam = 0.0f;
    UPROPERTY()
    bool BoolParam = false;


}

struct FScriptControlBehaviorEntry
{
    UPROPERTY()
    EScriptControlBehaviorName BehaviorName;
    UPROPERTY()
    EScriptControlBehaviorType Type;
    UPROPERTY()
    FScriptControlBehaviorParams Params;
    UPROPERTY()
    int EntryId = 0;


}

struct FScriptControlQueueSlot
{
    UPROPERTY()
    EScriptControlSourceType SourceType;
    UPROPERTY()
    int Priority = 50;
    UPROPERTY()
    TArray<FScriptControlBehaviorEntry> StateQueue;
    UPROPERTY()
    int CurrentStateIndex = 0;
    UPROPERTY()
    TArray<FScriptControlBehaviorEntry> ActionQueue;
    UPROPERTY()
    FScriptControlBehaviorEntry CurrentAction;
    UPROPERTY()
    bool bHasCurrentAction = false;


    bool HasPendingState() const
    {
        return (this.CurrentStateIndex < this.StateQueue.Num());
    }
    bool HasPendingAction() const
    {
        return this.bHasCurrentAction || (this.ActionQueue.Num() > 0);
    }
    bool HasPendingBehavior() const
    {
        return this.HasPendingAction() || this.HasPendingState();
    }
    bool GetCurrentState(FScriptControlBehaviorEntry &inout OutEntry) const
    {
        if (this.CurrentStateIndex < this.StateQueue.Num())
        {
            int local_2 = this.CurrentStateIndex;
            return true;
        }
        return false;
    }
    bool AdvanceStateIndex()
    {
        if (this.CurrentStateIndex < this.StateQueue.Num())
        {
            ++this.CurrentStateIndex;
            return !(this.HasPendingState());
        }
        return true;
    }
    bool DequeueAction()
    {
        if (this.ActionQueue.Num() > 0)
        {
            this.ActionQueue.RemoveAt(0);
            this.bHasCurrentAction = true;
            return true;
        }
        return false;
    }
    bool DiscardCurrentAction()
    {
        this.bHasCurrentAction = false;
        return (this.ActionQueue.Num() == 0);
    }
    void ClearStateQueue()
    {
        this.StateQueue.Reset(0);
        this.CurrentStateIndex = 0;
        return;
    }
    void ClearActionQueue()
    {
        this.ActionQueue.Reset(0);
        this.bHasCurrentAction = false;
        return;
    }
    void ClearAll()
    {
        this.ClearStateQueue();
        this.ClearActionQueue();
        return;
    }
    int PushState(const EScriptControlBehaviorName BehaviorName, const FScriptControlBehaviorParams &inout Params, int &inout NextEntryId)
    {
        FScriptControlBehaviorEntry local_54;
        local_54.BehaviorName = BehaviorName;
        local_54.Type = EScriptControlBehaviorType(0);
        local_54.EntryId = NextEntryId;
        ++NextEntryId;
        this.StateQueue.Add(local_54);
        return int(local_54.EntryId);
    }
    int PushAction(const EScriptControlBehaviorName BehaviorName, const FScriptControlBehaviorParams &inout Params, int &inout NextEntryId, const bool bInsertFront)
    {
        FScriptControlBehaviorEntry local_54;
        local_54.BehaviorName = BehaviorName;
        local_54.Type = EScriptControlBehaviorType(1);
        local_54.EntryId = NextEntryId;
        ++NextEntryId;
        if (bInsertFront)
        {
            this.ActionQueue.Insert(local_54, 0);
        }
        else
        {
            this.ActionQueue.Add(local_54);
        }
        return int(local_54.EntryId);
    }
    void RestartStateQueue()
    {
        this.CurrentStateIndex = 0;
        return;
    }
}

namespace ScriptControlSourceConfig
{
int GetPriority(const EScriptControlSourceType Source)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    int __r; return __r;
}
}
namespace ScriptControlParamPacker
{
FScriptControlBehaviorParams PackEcologyMove(const FScriptControlEcologyMoveParams &inout In)
{
    FScriptControlBehaviorParams local_50;
    FScriptControlBehaviorParams __r;
    local_50.Tag = In.Tag;
    local_50.Location = In.Location;
    local_50.Direction = In.Direction;
    local_50.MoveStance = In.MoveStance;
    return __r;
}
FScriptControlBehaviorParams PackTriggerESM(const FScriptControlTriggerESMParams &inout In)
{
    FScriptControlBehaviorParams local_50;
    FScriptControlBehaviorParams __r;
    local_50.Tag = In.Tag;
    local_50.ESMSkillConfig = In.SkillConfig;
    local_50.NameParam = In.ESMNameCondition;
    local_50.TargetEntityId = In.TargetEntityId;
    local_50.Location = In.Location;
    local_50.Direction = In.Direction;
    return __r;
}
FScriptControlBehaviorParams PackESMSkill(const FScriptControlESMSkillParams &inout In)
{
    FScriptControlBehaviorParams local_50;
    FScriptControlBehaviorParams __r;
    local_50.Tag = In.Tag;
    local_50.ESMSkillConfig = In.SkillConfig;
    local_50.TargetEntityId = In.TargetEntityId;
    local_50.Location = In.Location;
    local_50.Direction = In.Direction;
    return __r;
}
FScriptControlBehaviorParams PackESMEcologyBehavior(const FScriptControlESMEcologyBehaviorParams &inout In)
{
    FScriptControlBehaviorParams local_50;
    FScriptControlBehaviorParams __r;
    local_50.Tag = In.Tag;
    local_50.NameParam = In.ESMNameCondition;
    local_50.TargetEntityId = In.TargetEntityId;
    local_50.Location = In.Location;
    local_50.Direction = In.Direction;
    return __r;
}
FScriptControlEcologyMoveParams UnpackEcologyMove(const FScriptControlBehaviorParams &inout In)
{
    FScriptControlEcologyMoveParams local_18;
    FScriptControlEcologyMoveParams __r;
    local_18.Tag = In.Tag;
    local_18.Location = In.Location;
    local_18.Direction = In.Direction;
    local_18.MoveStance = In.MoveStance;
    return __r;
}
FScriptControlTriggerESMParams UnpackTriggerESM(const FScriptControlBehaviorParams &inout In)
{
    FScriptControlTriggerESMParams local_44;
    FScriptControlTriggerESMParams __r;
    local_44.Tag = In.Tag;
    local_44.SkillConfig = In.ESMSkillConfig;
    local_44.ESMNameCondition = In.NameParam;
    local_44.TargetEntityId = In.TargetEntityId;
    local_44.Location = In.Location;
    local_44.Direction = In.Direction;
    return __r;
}
}
