namespace __FItemTrunkConfigFunctions
{
UFUNCTION()
EItemTrunk __FItemTrunkConfig_GetTrunk(const TDataObjectPtr<FItemTrunkConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Trunk' from a null 'FItemTrunkConfig' DataObject!");
        }
        FItemTrunkConfig local_18;
        return local_18.Trunk;
    }
    return DataObject.Get().Trunk;
}
UFUNCTION()
FItemTrunkConfig CastToFItemTrunkConfig(const TDataObjectPtr<FItemTrunkConfig> &inout DataObject)
{
    FItemTrunkConfig __r;
    return __r;
}
}
