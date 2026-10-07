

class UASWaitForESMSkillTriggerWrapper : UECSAsyncActionBase
{
    UPROPERTY()
    FASWaitForESMSkillTrigger Action;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    TArray<FName> TriggerNames;
    UPROPERTY()
    FECSAsyncActionDelegate OnTriggerResponded;

    UASWaitForESMSkillTriggerWrapper()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASWaitForESMSkillTrigger;
    }
}

namespace FECSAsyncActionFactory_ASWaitForESMSkillTrigger
{
UASWaitForESMSkillTriggerWrapper MakeWrapper(const FASWaitForESMSkillTrigger &inout ActionData)
{
    return UASWaitForESMSkillTriggerWrapper.GetDefaultObject();
}
UFUNCTION()
UASWaitForESMSkillTriggerWrapper Init_FECSEntity_USkillConfig(const FECSEntity &inout InEntity, const USkillConfig InSkillConfig)
{
    FASWaitForESMSkillTrigger local_18;
    local_18.Init(InEntity, InSkillConfig);
    return FECSAsyncActionFactory_ASWaitForESMSkillTrigger::MakeWrapper(local_18);
}
}
