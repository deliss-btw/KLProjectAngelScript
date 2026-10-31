struct FAICommand_RequireNewTargetData
{
    FAICommand_RequireNewTargetData()
    {
        return;
    }
}

struct FAICommand_RequireNewTarget : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;
    UPROPERTY()
    FGameplayTagContainer IncludeGameplayTags;
    UPROPERTY()
    FGameplayTagContainer ExcludeGameplayTags;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;

    FAICommand_RequireNewTarget()
    {
        this.__InitDefaults();
        return;
    }
    const UScriptStruct GetInstanceDataType_Implementation() const
    {
        UScriptStruct local_2 = FAICommand_RequireNewTargetData;
        return local_2;
    }
    FAICommand_RequireNewTargetData GetInstanceData(const FAICommandParams &inout Params) const
    {
        FAICommand_RequireNewTargetData __r;
        return __r;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        FC_AINeedUpdateAITargetingTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
}

class UBTService_RequireNewTarget : UBTService_AICommandScript
{
    UPROPERTY()
    FAICommand_RequireNewTarget AICommand;

    UBTService_RequireNewTarget()
    {
        return;
    }
}

