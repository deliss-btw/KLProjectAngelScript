
namespace __INTENRAL_FCE_ScriptControlBehaviorFinished_NS
{
    const TECSEventDerivedPtr<FCE_ScriptControlBehaviorFinished> DerivedPtr = TECSEventDerivedPtr<FCE_ScriptControlBehaviorFinished>();
}
namespace __INTENRAL_FCE_ScriptControlStateQueueFinished_NS
{
    const TECSEventDerivedPtr<FCE_ScriptControlStateQueueFinished> DerivedPtr = TECSEventDerivedPtr<FCE_ScriptControlStateQueueFinished>();
}
namespace __INTENRAL_FCE_ScriptControlActionQueueFinished_NS
{
    const TECSEventDerivedPtr<FCE_ScriptControlActionQueueFinished> DerivedPtr = TECSEventDerivedPtr<FCE_ScriptControlActionQueueFinished>();

}
struct FCE_ScriptControlBehaviorFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId EntityId;
    UPROPERTY()
    EScriptControlBehaviorName BehaviorName;
    UPROPERTY()
    EScriptControlBehaviorType BehaviorType;
    UPROPERTY()
    EScriptControlResult Result;
    UPROPERTY()
    FString Tag;
    UPROPERTY()
    int EntryId;
    UPROPERTY()
    EScriptControlSourceType SourceType;


}

struct FCE_ScriptControlStateQueueFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FString LastTag;

    FCE_ScriptControlStateQueueFinished()
    {
        return;
    }
}

struct FCE_ScriptControlActionQueueFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ScriptControlActionQueueFinished()
    {
        return;
    }
}

