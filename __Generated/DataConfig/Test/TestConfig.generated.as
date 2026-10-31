namespace __FTestConfigFunctions
{
UFUNCTION()
FText __FTestConfig_GetServerText(const TDataObjectPtr<FTestConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ServerText' from a null 'FTestConfig' DataObject!");
        }
        FTestConfig local_68;
        return local_68.ServerText;
    }
    return __r;
}
UFUNCTION()
FInstancedPropertyBag __FTestConfig_GetMyBag(const TDataObjectPtr<FTestConfig> &inout DataObject)
{
    FInstancedPropertyBag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MyBag' from a null 'FTestConfig' DataObject!");
        }
        FTestConfig local_68;
        return local_68.MyBag;
    }
    return __r;
}
UFUNCTION()
FText __FTestConfig_GetClientText(const TDataObjectPtr<FTestConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ClientText' from a null 'FTestConfig' DataObject!");
        }
        FTestConfig local_68;
        return local_68.ClientText;
    }
    return __r;
}
UFUNCTION()
ETestEnumType __FTestConfig_GetTestType(const TDataObjectPtr<FTestConfig> &inout DataObject)
{
    int local_69 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TestType' from a null 'FTestConfig' DataObject!");
        }
        FTestConfig local_68;
        local_69 = int(local_68.TestType);
        return ETestEnumType(local_69);
    }
    return ETestEnumType(local_69);
}
UFUNCTION()
FTestStruct __FTestConfig_GetTestStruct(const TDataObjectPtr<FTestConfig> &inout DataObject)
{
    FTestStruct __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TestStruct' from a null 'FTestConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TArray<FTestItemParam> __FTestConfig_GetItemParamList(const TDataObjectPtr<FTestConfig> &inout DataObject)
{
    TArray<FTestItemParam> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemParamList' from a null 'FTestConfig' DataObject!");
        }
        FTestConfig local_68;
        return local_68.ItemParamList;
    }
    return __r;
}
UFUNCTION()
FTestConfig CastToFTestConfig(const TDataObjectPtr<FTestConfig> &inout DataObject)
{
    FTestConfig __r;
    return __r;
}
}
namespace __FTestFatherConfigFunctions
{
UFUNCTION()
FText __FTestFatherConfig_GetServerText(const TDataObjectPtr<FTestFatherConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ServerText' from a null 'FTestFatherConfig' DataObject!");
        }
        FTestFatherConfig local_44;
        return local_44.ServerText;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FTestConfig> __FTestFatherConfig_GetTestConfigItem(const TDataObjectPtr<FTestFatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TestConfigItem' from a null 'FTestFatherConfig' DataObject!");
        }
        FTestFatherConfig local_44;
        return local_44.GetTestConfigItem();
    }
    return GetTestConfigItem();
}
UFUNCTION()
FTestFatherConfig CastToFTestFatherConfig(const TDataObjectPtr<FTestFatherConfig> &inout DataObject)
{
    FTestFatherConfig __r;
    return __r;
}
}
