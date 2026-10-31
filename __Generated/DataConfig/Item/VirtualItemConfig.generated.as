namespace __FVirtualItemConfigFunctions
{
UFUNCTION()
EVirtualItemType __FVirtualItemConfig_GetVirtualType(const TDataObjectPtr<FVirtualItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'VirtualType' from a null 'FVirtualItemConfig' DataObject!");
        }
        FVirtualItemConfig local_188;
        return local_188.VirtualType;
    }
    return DataObject.Get().VirtualType;
}
UFUNCTION()
FVirtualItemConfig CastToFVirtualItemConfig(const TDataObjectPtr<FVirtualItemConfig> &inout DataObject)
{
    FVirtualItemConfig __r;
    return __r;
}
}
