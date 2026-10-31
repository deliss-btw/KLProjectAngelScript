namespace __FVirtualItemConfigFunctions
{
UFUNCTION()
EVirtualItemType __FVirtualItemConfig_GetVirtualType(const TDataObjectPtr<FVirtualItemConfig> &inout DataObject)
{
    int local_189 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'VirtualType' from a null 'FVirtualItemConfig' DataObject!");
        }
        FVirtualItemConfig local_188;
        local_189 = int(local_188.VirtualType);
        return EVirtualItemType(local_189);
    }
    return EVirtualItemType(local_189);
}
UFUNCTION()
FVirtualItemConfig CastToFVirtualItemConfig(const TDataObjectPtr<FVirtualItemConfig> &inout DataObject)
{
    FVirtualItemConfig __r;
    return __r;
}
}
