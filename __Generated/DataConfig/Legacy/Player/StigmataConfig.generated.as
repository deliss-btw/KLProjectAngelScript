namespace __FStigmataAddHealLimitConfigFunctions
{
UFUNCTION()
int __FStigmataAddHealLimitConfig_GetValue(const TDataObjectPtr<FStigmataAddHealLimitConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Value' from a null 'FStigmataAddHealLimitConfig' DataObject!");
        }
        FStigmataAddHealLimitConfig defaultValue;
        return defaultValue.Value;
    }
    return DataObject.Get().Value;
}
UFUNCTION()
FStigmataAddHealLimitConfig CastToFStigmataAddHealLimitConfig(const TDataObjectPtr<FStigmataAddHealLimitConfig> &inout DataObject)
{
    FStigmataAddHealLimitConfig __r;
    return __r;
}
}
namespace __FStigmataConfigFunctions
{
UFUNCTION()
FText __FStigmataConfig_GetName(const TDataObjectPtr<FStigmataConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FStigmataConfig' DataObject!");
        }
        FStigmataConfig local_108;
        return local_108.Name;
    }
    return __r;
}
UFUNCTION()
FText __FStigmataConfig_GetInstructions(const TDataObjectPtr<FStigmataConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Instructions' from a null 'FStigmataConfig' DataObject!");
        }
        FStigmataConfig local_108;
        return local_108.Instructions;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FStigmataConfig_GetNodeIcon(const TDataObjectPtr<FStigmataConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NodeIcon' from a null 'FStigmataConfig' DataObject!");
        }
        FStigmataConfig local_108;
        return local_108.NodeIcon;
    }
    return __r;
}
UFUNCTION()
EStigmataType __FStigmataConfig_GetNodeType(const TDataObjectPtr<FStigmataConfig> &inout DataObject)
{
    int local_109 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NodeType' from a null 'FStigmataConfig' DataObject!");
        }
        FStigmataConfig local_108;
        local_109 = int(local_108.NodeType);
        return EStigmataType(local_109);
    }
    return EStigmataType(local_109);
}
UFUNCTION()
TDataObjectPtr<FDataObject> __FStigmataConfig_GetNodeEffect(const TDataObjectPtr<FStigmataConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NodeEffect' from a null 'FStigmataConfig' DataObject!");
        }
        FStigmataConfig local_108;
        return local_108.GetNodeEffect();
    }
    return GetNodeEffect();
}
UFUNCTION()
FStigmataConfig CastToFStigmataConfig(const TDataObjectPtr<FStigmataConfig> &inout DataObject)
{
    FStigmataConfig __r;
    return __r;
}
}
