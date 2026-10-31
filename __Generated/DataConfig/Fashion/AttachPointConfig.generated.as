namespace __FAttachPointConfigFunctions
{
UFUNCTION()
EFashionSlotType __FAttachPointConfig_GetSlotType(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    int local_37 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotType' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig local_36;
        local_37 = int(local_36.SlotType);
        return EFashionSlotType(local_37);
    }
    return EFashionSlotType(local_37);
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
    return GetDisabledAvatars();
}
UFUNCTION()
EFashionDecoSocket __FAttachPointConfig_GetDecoSocket(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    int local_37 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoSocket' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig local_36;
        local_37 = int(local_36.DecoSocket);
        return EFashionDecoSocket(local_37);
    }
    return EFashionDecoSocket(local_37);
}
UFUNCTION()
FDecoAttachOffset __FAttachPointConfig_GetOffset(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    FDecoAttachOffset __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Offset' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig local_36;
        return local_36.Offset;
    }
    return __r;
}
UFUNCTION()
TArray<FAvatarDecoAttachOffsetOverride> __FAttachPointConfig_GetAvatarOffsetOverrides(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    TArray<FAvatarDecoAttachOffsetOverride> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarOffsetOverrides' from a null 'FAttachPointConfig' DataObject!");
        }
        FAttachPointConfig local_36;
        return local_36.AvatarOffsetOverrides;
    }
    return __r;
}
UFUNCTION()
FAttachPointConfig CastToFAttachPointConfig(const TDataObjectPtr<FAttachPointConfig> &inout DataObject)
{
    FAttachPointConfig __r;
    return __r;
}
}
