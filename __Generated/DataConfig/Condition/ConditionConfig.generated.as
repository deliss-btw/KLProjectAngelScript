namespace __FConditionConfigFunctions
{
UFUNCTION()
ECondCmpType __FConditionConfig_GetCmpType(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CmpType' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig local_54;
        return local_54.CmpType;
    }
    return DataObject.Get().CmpType;
}
UFUNCTION()
int __FConditionConfig_GetCmpValue(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CmpValue' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig defaultValue;
        return defaultValue.CmpValue;
    }
    return DataObject.Get().CmpValue;
}
UFUNCTION()
FString __FConditionConfig_GetParam1(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Param1' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig local_54;
        return local_54.Param1;
    }
    return DataObject.Get().Param1;
}
UFUNCTION()
FString __FConditionConfig_GetParam2(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Param2' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig local_54;
        return local_54.Param2;
    }
    return DataObject.Get().Param2;
}
UFUNCTION()
FString __FConditionConfig_GetParam3(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Param3' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig local_54;
        return local_54.Param3;
    }
    return DataObject.Get().Param3;
}
UFUNCTION()
FString __FConditionConfig_GetParam4(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Param4' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig local_54;
        return local_54.Param4;
    }
    return DataObject.Get().Param4;
}
UFUNCTION()
ECondType __FConditionConfig_GetCondType(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CondType' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig local_54;
        return local_54.CondType;
    }
    return DataObject.Get().CondType;
}
UFUNCTION()
TArray<TDataObjectPtr<FDataObject>> __FConditionConfig_GetRefData(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RefData' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig local_54;
        return local_54.GetRefData();
    }
    return DataObject.Get().GetRefData();
}
UFUNCTION()
FText __FConditionConfig_GetConditionErrorCode(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConditionErrorCode' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig local_54;
        return local_54.ConditionErrorCode;
    }
    return DataObject.Get().ConditionErrorCode;
}
UFUNCTION()
FText __FConditionConfig_GetNote(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Note' from a null 'FConditionConfig' DataObject!");
        }
        FConditionConfig local_54;
        return local_54.Note;
    }
    return DataObject.Get().Note;
}
UFUNCTION()
FConditionConfig CastToFConditionConfig(const TDataObjectPtr<FConditionConfig> &inout DataObject)
{
    FConditionConfig __r;
    return __r;
}
}
namespace __FGsConditionGroupConfigFunctions
{
UFUNCTION()
ECondGroupLogicType __FGsConditionGroupConfig_GetLogicType(const TDataObjectPtr<FGsConditionGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LogicType' from a null 'FGsConditionGroupConfig' DataObject!");
        }
        FGsConditionGroupConfig local_26;
        return local_26.LogicType;
    }
    return DataObject.Get().LogicType;
}
UFUNCTION()
TArray<TDataObjectPtr<FConditionConfig>> __FGsConditionGroupConfig_GetCondVec(const TDataObjectPtr<FGsConditionGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CondVec' from a null 'FGsConditionGroupConfig' DataObject!");
        }
        FGsConditionGroupConfig local_26;
        return local_26.GetCondVec();
    }
    return DataObject.Get().GetCondVec();
}
UFUNCTION()
FGsConditionGroupConfig CastToFGsConditionGroupConfig(const TDataObjectPtr<FGsConditionGroupConfig> &inout DataObject)
{
    FGsConditionGroupConfig __r;
    return __r;
}
}
