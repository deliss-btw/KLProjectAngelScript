namespace __FAttachPointConfigFunctions
{
UFUNCTION()
EFashionSlotType __FAttachPointConfig_GetSlotType(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotType' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig local_36;
        return local_36.SlotType;
    }
    return DataObject.Get().SlotType;
}
UFUNCTION()
int __FAttachPointConfig_GetMaxSlotCount(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxSlotCount' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig defaultValue;
        return defaultValue.MaxSlotCount;
    }
    return DataObject.Get().MaxSlotCount;
}
UFUNCTION()
TArray<TDataObjectPtr<FAvatarPrefabConfig>> __FAttachPointConfig_GetDisabledAvatars(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisabledAvatars' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig local_36;
        return local_36.GetDisabledAvatars();
    }
    return DataObject.Get().GetDisabledAvatars();
}
UFUNCTION()
EFashionDecoSocket __FAttachPointConfig_GetDecoSocket(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoSocket' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig local_36;
        return local_36.DecoSocket;
    }
    return DataObject.Get().DecoSocket;
}
UFUNCTION()
FDecoAttachOffset __FAttachPointConfig_GetOffset(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Offset' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig local_36;
        return local_36.Offset;
    }
    return DataObject.Get().Offset;
}
UFUNCTION()
TArray<FAvatarDecoAttachOffsetOverride> __FAttachPointConfig_GetAvatarOffsetOverrides(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarOffsetOverrides' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig local_36;
        return local_36.AvatarOffsetOverrides;
    }
    return DataObject.Get().AvatarOffsetOverrides;
}
UFUNCTION()
FAttachPointConfig CastToFAttachPointConfig(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    FAttachPointConfig __r;
    return __r;
}
}
