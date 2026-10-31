namespace __FCombatArealEffectConfigDataObject_AbilityEffectTriggerFunctions
{
UFUNCTION()
FCombatArealEffectConfigData_AbilityEffectTrigger __FCombatArealEffectConfigDataObject_AbilityEffectTrigger_GetData(const TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> &inout DataObject)
{
    FCombatArealEffectConfigData_AbilityEffectTrigger __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Data' from a null 'FCombatArealEffectConfigDataObject_AbilityEffectTrigger' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FCombatArealEffectConfigDataObject_AbilityEffectTrigger CastToFCombatArealEffectConfigDataObject_AbilityEffectTrigger(const TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> &inout DataObject)
{
    FCombatArealEffectConfigDataObject_AbilityEffectTrigger __r;
    return __r;
}
}
namespace __FCombatArealEffectConfigData_HitTestFunctions
{
UFUNCTION()
FCombatArealEffectData __FCombatArealEffectConfigData_HitTest_GetAreaData(const TDataObjectPtr<FCombatArealEffectConfigData_HitTest> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AreaData' from a null 'FCombatArealEffectConfigData_HitTest' DataObject!");
        }
        FCombatArealEffectConfigData_HitTest local_78;
        return local_78.AreaData;
    }
    return DataObject.Get().AreaData;
}
UFUNCTION()
FDataObjectPtr __FCombatArealEffectConfigData_HitTest_GetAttackData(const TDataObjectPtr<FCombatArealEffectConfigData_HitTest> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttackData' from a null 'FCombatArealEffectConfigData_HitTest' DataObject!");
        }
        FCombatArealEffectConfigData_HitTest local_78;
        return local_78.AttackData;
    }
    return DataObject.Get().AttackData;
}
UFUNCTION()
FName __FCombatArealEffectConfigData_HitTest_GetStrikeKey(const TDataObjectPtr<FCombatArealEffectConfigData_HitTest> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StrikeKey' from a null 'FCombatArealEffectConfigData_HitTest' DataObject!");
        }
        FCombatArealEffectConfigData_HitTest local_78;
        return local_78.StrikeKey;
    }
    return DataObject.Get().StrikeKey;
}
UFUNCTION()
FFPTime __FCombatArealEffectConfigData_HitTest_GetHitInterval(const TDataObjectPtr<FCombatArealEffectConfigData_HitTest> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitInterval' from a null 'FCombatArealEffectConfigData_HitTest' DataObject!");
        }
        FCombatArealEffectConfigData_HitTest local_78;
        return local_78.HitInterval;
    }
    return DataObject.Get().HitInterval;
}
UFUNCTION()
FDataObjectPtr __FCombatArealEffectConfigData_HitTest_GetHitDecalConfig(const TDataObjectPtr<FCombatArealEffectConfigData_HitTest> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitDecalConfig' from a null 'FCombatArealEffectConfigData_HitTest' DataObject!");
        }
        FCombatArealEffectConfigData_HitTest local_78;
        return local_78.HitDecalConfig;
    }
    return DataObject.Get().HitDecalConfig;
}
UFUNCTION()
FCombatArealEffectConfigData_HitTest CastToFCombatArealEffectConfigData_HitTest(const TDataObjectPtr<FCombatArealEffectConfigData_HitTest> &inout DataObject)
{
    FCombatArealEffectConfigData_HitTest __r;
    return __r;
}
}
namespace __FCombatArealEffectConfigDataObject_BuffFunctions
{
UFUNCTION()
FCombatArealEffectConfigData_Buff __FCombatArealEffectConfigDataObject_Buff_GetData(const TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> &inout DataObject)
{
    FCombatArealEffectConfigData_Buff __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Data' from a null 'FCombatArealEffectConfigDataObject_Buff' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FCombatArealEffectConfigDataObject_Buff CastToFCombatArealEffectConfigDataObject_Buff(const TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> &inout DataObject)
{
    FCombatArealEffectConfigDataObject_Buff __r;
    return __r;
}
}
