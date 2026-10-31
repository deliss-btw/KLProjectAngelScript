namespace __FItemTrunkConfigFunctions
{
UFUNCTION()
EItemTrunk __FItemTrunkConfig_GetTrunk(const TDataObjectPtr<FItemTrunkConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Trunk' from a null 'FItemTrunkConfig' DataObject!");
        }
        FItemTrunkConfig local_18;
        local_19 = int(local_18.Trunk);
        return EItemTrunk(local_19);
    }
    return EItemTrunk(local_19);
}
UFUNCTION()
FItemTrunkConfig CastToFItemTrunkConfig(const TDataObjectPtr<FItemTrunkConfig> &inout DataObject)
{
    FItemTrunkConfig __r;
    return __r;
}
}
