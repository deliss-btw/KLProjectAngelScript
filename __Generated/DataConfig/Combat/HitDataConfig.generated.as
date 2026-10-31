namespace __FAttackIgnoreTargetConditionFunctions
{
UFUNCTION()
TArray<FBuffConfigRef> __FAttackIgnoreTargetCondition_GetIgnoreByBuff(const TDataObjectPtr<FAttackIgnoreTargetCondition> &inout DataObject)
{
    TArray<FBuffConfigRef> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IgnoreByBuff' from a null 'FAttackIgnoreTargetCondition' DataObject!");
        }
        FAttackIgnoreTargetCondition local_18;
        return local_18.IgnoreByBuff;
    }
    return __r;
}
UFUNCTION()
FAttackIgnoreTargetCondition CastToFAttackIgnoreTargetCondition(const TDataObjectPtr<FAttackIgnoreTargetCondition> &inout DataObject)
{
    FAttackIgnoreTargetCondition __r;
    return __r;
}
}
