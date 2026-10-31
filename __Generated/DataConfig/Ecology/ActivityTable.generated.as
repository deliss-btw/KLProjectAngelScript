namespace __FEcologyActivityDefinitionRowFunctions
{
UFUNCTION()
TDataObjectPtr<FEcologyCreatureDefinitionRow> __FEcologyActivityDefinitionRow_GetCreature(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Creature' from a null 'FEcologyActivityDefinitionRow' DataObject!");
        }
        FEcologyActivityDefinitionRow local_122;
        return local_122.GetCreature();
    }
    return DataObject.Get().GetCreature();
}
UFUNCTION()
TDataObjectPtr<FEcologyResourceDefinitionRow> __FEcologyActivityDefinitionRow_GetResource(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Resource' from a null 'FEcologyActivityDefinitionRow' DataObject!");
        }
        FEcologyActivityDefinitionRow local_122;
        return local_122.GetResource();
    }
    return DataObject.Get().GetResource();
}
UFUNCTION()
FName __FEcologyActivityDefinitionRow_GetBehavior(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Behavior' from a null 'FEcologyActivityDefinitionRow' DataObject!");
        }
        FEcologyActivityDefinitionRow local_122;
        return local_122.Behavior;
    }
    return DataObject.Get().Behavior;
}
UFUNCTION()
TObjectPtr<UEcologyBehaviorDefine> __FEcologyActivityDefinitionRow_GetBehaviorDefine(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BehaviorDefine' from a null 'FEcologyActivityDefinitionRow' DataObject!");
        }
        FEcologyActivityDefinitionRow local_122;
        return local_122.BehaviorDefine;
    }
    return DataObject.Get().BehaviorDefine;
}
UFUNCTION()
bool __FEcologyActivityDefinitionRow_GetbIsDefaultBehavior(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsDefaultBehavior' from a null 'FEcologyActivityDefinitionRow' DataObject!");
        }
        FEcologyActivityDefinitionRow local_122;
        return local_122.bIsDefaultBehavior;
    }
    return DataObject.Get().bIsDefaultBehavior;
}
UFUNCTION()
bool __FEcologyActivityDefinitionRow_GetbCanUseWithoutSlot(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCanUseWithoutSlot' from a null 'FEcologyActivityDefinitionRow' DataObject!");
        }
        FEcologyActivityDefinitionRow local_122;
        return local_122.bCanUseWithoutSlot;
    }
    return DataObject.Get().bCanUseWithoutSlot;
}
UFUNCTION()
FGameplayTag __FEcologyActivityDefinitionRow_GetGameplayTagForResourceSlot(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameplayTagForResourceSlot' from a null 'FEcologyActivityDefinitionRow' DataObject!");
        }
        FEcologyActivityDefinitionRow local_122;
        return local_122.GameplayTagForResourceSlot;
    }
    return DataObject.Get().GameplayTagForResourceSlot;
}
UFUNCTION()
FEcologyDOTCondition __FEcologyActivityDefinitionRow_GetDOTCondition(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    FEcologyDOTCondition __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DOTCondition' from a null 'FEcologyActivityDefinitionRow' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FEcologyUserCondition __FEcologyActivityDefinitionRow_GetUserCondition(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    FEcologyUserCondition __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UserCondition' from a null 'FEcologyActivityDefinitionRow' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FEcologyActivityDefinitionRow CastToFEcologyActivityDefinitionRow(const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout DataObject)
{
    FEcologyActivityDefinitionRow __r;
    return __r;
}
}
