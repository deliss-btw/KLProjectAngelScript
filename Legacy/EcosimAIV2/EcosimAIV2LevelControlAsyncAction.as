

// NOTE: class defaults are not authored in this module: FASECSDelayActionTest (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

namespace FLevelControlNPCUtils
{
class UAsyncLevelAction_Base : ULevelAsyncActionBase
{
    FECSEntity Entity;

    UAsyncLevelAction_Base()
    {
        return;
    }
    UFUNCTION()
    void OnActivate_Implementation() const
    {
        ModifyOrAdd local_4;
        FC_EcosimAIV2LevelControlEvents& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.OnComplete = this.OnComplete;
            local_6.OnFailed = this.OnFailed;
            local_6.OnCancel = this.OnCancel;
        }
        return;
    }
}

class UAsyncLevelAction_NPCMoveToLocation : UAsyncLevelAction_Base
{
    FVector SpecifiedLocation;
    bool bRun = true;
    bool bMoveUseRoadGraph = false;
    bool bSprint = false;


    UFUNCTION()
    void OnActivate_Implementation() const
    {
        Super::OnActivate_Implementation();
        ModifyOrAdd local_4;
        FC_EcologyKnowledge& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_12;
            int local_11;
            local_6.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlMove")), true);
            local_6.SetVector(FEcologyKnowledgeKey(FName("MoveToSpecifiedLocation")), this.SpecifiedLocation);
            local_12 = 0;
            local_11 = local_12;
            if (this.bSprint)
            {
                local_12 = 2;
                local_11 = local_12;
            }
            else
            {
                if (this.bRun)
                {
                    local_12 = 1;
                    local_11 = local_12;
                }
            }
            if (this.bSprint)
            {
                local_12 = 1;
            }
            else
            {
                local_12 = 0;
            }
            int64 local_18 = local_11;
            local_6.SetInt(FEcologyKnowledgeKey(FName("MoveSpeedType")), local_18);
            local_18 = local_12;
            local_6.SetInt(FEcologyKnowledgeKey(FName("MoveSimulateType")), local_18);
            local_6.SetBool(FEcologyKnowledgeKey(FName("bMoveUseRoadGraph")), this.bMoveUseRoadGraph);
        }
        return;
    }
}

class UAsyncLevelAction_NPCTriggerESM : UAsyncLevelAction_Base
{
    FName ESMTriggerName;

    UAsyncLevelAction_NPCTriggerESM()
    {
        super();
        return;
    }
    UFUNCTION()
    void OnActivate_Implementation() const
    {
        Super::OnActivate_Implementation();
        ModifyOrAdd local_4;
        FC_EcologyKnowledge& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlESMTrigger")), true);
            local_6.SetSpecifier(FEcologyKnowledgeKey(FName("ESMTriggerName")), this.ESMTriggerName);
        }
        return;
    }
}

class UAsyncLevelAction_NPCPlayAction : UAsyncLevelAction_Base
{
    FVector LookAtLocation;

    UAsyncLevelAction_NPCPlayAction()
    {
        super();
        return;
    }
    UFUNCTION()
    void OnActivate_Implementation() const
    {
        Super::OnActivate_Implementation();
        ModifyOrAdd local_4;
        FC_EcologyKnowledge& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetBool(FEcologyKnowledgeKey(FName("bMoveToSpecifiedLocation")), true);
            local_6.SetVector(FEcologyKnowledgeKey(FName("MoveToSpecifiedLocation")), this.LookAtLocation);
        }
        return;
    }
}

class UAsyncLevelAction_NPCChangePose : UAsyncLevelAction_Base
{
    FName EntityBB_EnumName;
    FName EntityBB_TriggerName;
    uint8 EntityBB_EnumValue;

    UAsyncLevelAction_NPCChangePose()
    {
        super();
        return;
    }
    UFUNCTION()
    void OnActivate_Implementation() const
    {
        Super::OnActivate_Implementation();
        FFPTime local_2 = FFPTime(1);
        ECS::GetContextTime();
        FFPTime local_2_2 = ECS::GetContextTime();
        FNameHandle_EntityBBVarEnum local_12;
        local_12;
        this.OnComplete.Broadcast();
        return;
    }
}

class UAsyncLevelAction_NPCLookAtLocation : UAsyncLevelAction_Base
{
    FVector LookAtLocation;

    UAsyncLevelAction_NPCLookAtLocation()
    {
        super();
        return;
    }
    UFUNCTION()
    void OnActivate_Implementation() const
    {
        Super::OnActivate_Implementation();
        ModifyOrAdd local_4;
        FC_EcologyKnowledge& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetBool(FEcologyKnowledgeKey(FName("bMoveToSpecifiedLocation")), true);
            local_6.SetVector(FEcologyKnowledgeKey(FName("MoveToSpecifiedLocation")), this.LookAtLocation);
            this.OnComplete.Broadcast();
        }
        return;
    }
}

class UAsyncLevelAction_NPCInteractTarget : UAsyncLevelAction_Base
{
    int InteractPointIndex;
    int InteractBehaviorIndex;
    FECSEntity InteractTargetEntity;
    FGameplayTagContainer SuccessWhenMatchAnyGameplayTags;
    float32 TimeOutTime = -1.0f;
    bool bRun;


    UFUNCTION()
    void OnActivate_Implementation() const
    {
        int local_20;
        int local_21;
        Super::OnActivate_Implementation();
        ModifyOrAdd local_4;
        FC_EcologyKnowledge& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlInteract")), true);
            local_6.SetEntityId(FEcologyKnowledgeKey(FName("InteractTargetEntity")), this.InteractTargetEntity.GetId());
            int64 local_14 = this.InteractPointIndex;
            local_6.SetInt(FEcologyKnowledgeKey(FName("InteractPointIndex")), local_14);
            local_14 = this.InteractBehaviorIndex;
            local_6.SetInt(FEcologyKnowledgeKey(FName("InteractBehaviorIndex")), local_14);
            local_6.SetFloat(FEcologyKnowledgeKey(FName("InteractTimeCount")), this.TimeOutTime);
            if (this.bRun)
            {
                local_21 = 1;
                local_20 = local_21;
            }
            else
            {
                local_21 = 0;
                local_20 = local_21;
            }
            local_14 = local_20;
            local_6.SetInt(FEcologyKnowledgeKey(FName("MoveSpeedType")), local_14);
            FC_EcologyKnowledge::SetStruct(local_6).opCall(FEcologyKnowledgeKey(FName("SuccessWhenMatchAnyGameplayTags")), this.SuccessWhenMatchAnyGameplayTags);
        }
        return;
    }
}

}
struct FASECSDelayActionTest : FECSAsyncAction
{
    FECSAsyncAction _base_FECSAsyncAction;
    UPROPERTY()
    float32 DelayTime;
    UPROPERTY()
    float32 DelayTime1;
    UPROPERTY()
    float32 OPDelayTime;
    UPROPERTY()
    FECSAsyncActionDelegate OnDelayFinished;
    UPROPERTY()
    FECSAsyncActionDelegate OnDelayFinished1;

    FASECSDelayActionTest()
    {
        this.DelayTime = 3.0f;
        this.DelayTime1 = 3.0f;
        this.OPDelayTime = 3.0f;
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        this.OPDelayTime = 0.0f;
        return;
    }
    bool IsTickable_Implementation()
    {
        return false;
    }
    void Tick_Implementation(const float32 DeltaTime)
    {
        this.OPDelayTime += DeltaTime;
        if (this.OPDelayTime >= this.DelayTime)
        {
            this.OnDelayFinished.Broadcast();
            this.MarkFinished();
        }
        return;
    }
    void Init(const float32 InDelayTime)
    {
        this.DelayTime = InDelayTime;
        return;
    }
}

namespace FLevelControlNPCUtils
{
UFUNCTION()
void LevelControlNPC_SetControlEnable(const FECSEntity &inout Entity, const bool bEnable)
{
    ModifyOrAdd local_4;
    FC_EcologyKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControl")), bEnable);
    }
    return;
}
UFUNCTION()
void LevelControlNPC_SetTraceLiveRange(const FECSEntity &inout Entity, const bool bEnable, const FECSEntity &inout TraceTargetEntity, const float32 EnterRange, const float32 ExitRange)
{
    ModifyOrAdd local_4;
    FC_EcologyKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        if (bEnable)
        {
            local_6.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlTrace")), true);
            local_6.SetFloat(FEcologyKnowledgeKey(FName("NPCTraceLiveEnterRange")), EnterRange);
            local_6.SetFloat(FEcologyKnowledgeKey(FName("NPCTraceLiveExitRange")), ExitRange);
            local_6.SetEntityId(FEcologyKnowledgeKey(FName("NPCTraceLiveEntity")), TraceTargetEntity.GetId());
            return;
        }
        local_6.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlTrace")), false);
    }
    return;
}
UFUNCTION()
FLevelControlNPCUtils::UAsyncLevelAction_NPCTriggerESM LevelControlNPC_TriggerESM(const FECSEntity &inout Entity, const FName &inout ESMTriggerName)
{
    FLevelControlNPCUtils::UAsyncLevelAction_NPCTriggerESM local_6 = NewObject(nullptr, FLevelControlNPCUtils::UAsyncLevelAction_NPCTriggerESM, NAME_None, false);
    local_6.Entity = Entity;
    local_6.ESMTriggerName = ESMTriggerName;
    return local_6;
}
UFUNCTION()
FLevelControlNPCUtils::UAsyncLevelAction_NPCMoveToLocation LevelControlNPC_MoveToLocation(const FECSEntity &inout Entity, const FVector &inout SpecifiedLocation, const bool bRun = true, const bool bMoveUseRoadGraph = false, const bool bSprint = false)
{
    FLevelControlNPCUtils::UAsyncLevelAction_NPCMoveToLocation local_6 = NewObject(nullptr, FLevelControlNPCUtils::UAsyncLevelAction_NPCMoveToLocation, NAME_None, false);
    local_6.Entity = Entity;
    local_6.SpecifiedLocation = SpecifiedLocation;
    local_6.bRun = bRun;
    local_6.bMoveUseRoadGraph = bMoveUseRoadGraph;
    local_6.bSprint = bSprint;
    return local_6;
}
UFUNCTION()
void LevelControlNPC_LookAtLocation(const FECSEntity &inout Entity, const FECSEntity &inout TargetEntity, const FVector &inout LookAtLocation, const bool bEnableLookAtTarget)
{
    ModifyOrAdd local_4;
    FC_EcologyKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        if (bEnableLookAtTarget)
        {
            local_6.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlLookAtLocation")), true);
            if (TargetEntity.IsValid())
            {
                local_6.SetEntityId(FEcologyKnowledgeKey(FName("LookatTargetEntity")), TargetEntity.GetId());
                local_6.SetBool(FEcologyKnowledgeKey(FName("bLookAtEntity")), true);
            }
            else
            {
                local_6.SetVector(FEcologyKnowledgeKey(FName("LookatTargetLocation")), LookAtLocation);
                local_6.SetBool(FEcologyKnowledgeKey(FName("bLookAtLocation")), false);
            }
            return;
        }
        local_6.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControlLookAtLocation")), false);
    }
    return;
}
UFUNCTION()
FLevelControlNPCUtils::UAsyncLevelAction_NPCInteractTarget LevelControlNPC_InteractTarget(const FECSEntity &inout Entity, const FECSEntity &inout InteractTargetEntity, const TSoftClassPtr<UInteractionBehaviorBase> &inout InteractBehaviorClass, const int InteractPointIndex, const int InteractBehaviorIndex, const FGameplayTagContainer &inout SuccessWhenMatchAnyGameplayTags, const bool bRun = true, const float32 TimeOutTime = -1)
{
    FLevelControlNPCUtils::UAsyncLevelAction_NPCInteractTarget local_6 = NewObject(nullptr, FLevelControlNPCUtils::UAsyncLevelAction_NPCInteractTarget, NAME_None, false);
    local_6.Entity = Entity;
    local_6.InteractTargetEntity = InteractTargetEntity;
    local_6.SuccessWhenMatchAnyGameplayTags = SuccessWhenMatchAnyGameplayTags;
    local_6.TimeOutTime = TimeOutTime;
    local_6.bRun = bRun;
    if (InteractBehaviorClass.IsValid())
    {
        FInteractionPointAndBehaviorIndex local_8;
        bool local_11 = FInteractUtils::GetInteractionPointAndBehaviorIndexByBehaviorClass(InteractTargetEntity, InteractBehaviorClass.Get(), local_8, (1 != 0));
        if (local_11)
        {
            local_6.InteractPointIndex = local_8.GetPointIndex();
            local_6.InteractBehaviorIndex = local_8.GetBehaviorIndex();
        }
    }
    else
    {
        local_6.InteractPointIndex = InteractPointIndex;
        local_6.InteractBehaviorIndex = InteractBehaviorIndex;
    }
    return local_6;
}
UFUNCTION()
FLevelControlNPCUtils::UAsyncLevelAction_NPCTriggerESM LevelControlNPC_MountQuit(const FECSEntity &inout Entity)
{
    FLevelControlNPCUtils::UAsyncLevelAction_NPCTriggerESM local_6 = NewObject(nullptr, FLevelControlNPCUtils::UAsyncLevelAction_NPCTriggerESM, NAME_None, false);
    local_6.Entity = Entity;
    local_6.ESMTriggerName = n"EndMountTrigger";
    return local_6;
}
UFUNCTION()
FLevelControlNPCUtils::UAsyncLevelAction_NPCChangePose LevelControlNPC_ChangeMainPose(const FECSEntity &inout Entity, const EEcosimAIHumanityMainPose MainPose)
{
    FLevelControlNPCUtils::UAsyncLevelAction_NPCChangePose local_6 = NewObject(nullptr, FLevelControlNPCUtils::UAsyncLevelAction_NPCChangePose, NAME_None, false);
    local_6.Entity = Entity;
    local_6.EntityBB_TriggerName = n"HumanityMainPoseTrigger";
    local_6.EntityBB_EnumName = n"eHumanityMainPose";
    local_6.EntityBB_EnumValue = (int(MainPose) != 0);
    return local_6;
}
UFUNCTION()
FLevelControlNPCUtils::UAsyncLevelAction_NPCChangePose LevelControlNPC_ChangeMainStance(const FECSEntity &inout Entity, const EEcosimAIHumanityMainStance MainStance)
{
    FLevelControlNPCUtils::UAsyncLevelAction_NPCChangePose local_6 = NewObject(nullptr, FLevelControlNPCUtils::UAsyncLevelAction_NPCChangePose, NAME_None, false);
    local_6.Entity = Entity;
    local_6.EntityBB_TriggerName = n"HumanityMainStanceTrigger";
    local_6.EntityBB_EnumName = n"eHumanityMainStance";
    local_6.EntityBB_EnumValue = (int(MainStance) != 0);
    return local_6;
}
UFUNCTION()
FLevelControlNPCUtils::UAsyncLevelAction_NPCPlayAction LevelControlNPC_PlayUpperAction(const FECSEntity &inout Entity, const EEcosimAIHumanityUpperAction UpperAction)
{
    FLevelControlNPCUtils::UAsyncLevelAction_NPCPlayAction local_6 = NewObject(nullptr, FLevelControlNPCUtils::UAsyncLevelAction_NPCPlayAction, NAME_None, false);
    local_6.Entity = Entity;
    return local_6;
}
UFUNCTION()
FLevelControlNPCUtils::UAsyncLevelAction_NPCPlayAction LevelControlNPC_PlayHeadAction(const FECSEntity &inout Entity, const EEcosimAIHumanityHeadAction HeadAction)
{
    FLevelControlNPCUtils::UAsyncLevelAction_NPCPlayAction local_6 = NewObject(nullptr, FLevelControlNPCUtils::UAsyncLevelAction_NPCPlayAction, NAME_None, false);
    local_6.Entity = Entity;
    return local_6;
}
}
