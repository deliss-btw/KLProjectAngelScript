namespace __FClientConditionGroupFunctions
{
UFUNCTION()
TArray<FInstancedStruct> __FClientConditionGroup_GetConditions(const TDataObjectPtr<FClientConditionGroup> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Conditions' from a null 'FClientConditionGroup' DataObject!");
        }
        FClientConditionGroup local_18;
        return local_18.Conditions;
    }
    return DataObject.Get().Conditions;
}
UFUNCTION()
FClientConditionGroup CastToFClientConditionGroup(const TDataObjectPtr<FClientConditionGroup> &inout DataObject)
{
    FClientConditionGroup __r;
    return __r;
}
}
