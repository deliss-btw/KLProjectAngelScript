namespace __FCharacterDefaultFashionConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FAvatarPrefabConfig> __FCharacterDefaultFashionConfig_GetAvatar(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Avatar' from a null 'FCharacterDefaultFashionConfig' DataObject!");
        }
        FCharacterDefaultFashionConfig local_186;
        return local_186.GetAvatar();
    }
    return GetAvatar();
}
UFUNCTION()
EBodyType __FCharacterDefaultFashionConfig_GetBodyType(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DataObject)
{
    int local_187 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BodyType' from a null 'FCharacterDefaultFashionConfig' DataObject!");
        }
        FCharacterDefaultFashionConfig local_186;
        local_187 = int(local_186.BodyType);
        return EBodyType(local_187);
    }
    return EBodyType(local_187);
}
UFUNCTION()
TDataObjectPtr<FFashionConfig> __FCharacterDefaultFashionConfig_GetInitHair(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitHair' from a null 'FCharacterDefaultFashionConfig' DataObject!");
        }
        FCharacterDefaultFashionConfig local_186;
        return local_186.GetInitHair();
    }
    return GetInitHair();
}
UFUNCTION()
TDataObjectPtr<FFashionConfig> __FCharacterDefaultFashionConfig_GetInitTop(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitTop' from a null 'FCharacterDefaultFashionConfig' DataObject!");
        }
        FCharacterDefaultFashionConfig local_186;
        return local_186.GetInitTop();
    }
    return GetInitTop();
}
UFUNCTION()
TDataObjectPtr<FFashionConfig> __FCharacterDefaultFashionConfig_GetInitBottom(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitBottom' from a null 'FCharacterDefaultFashionConfig' DataObject!");
        }
        FCharacterDefaultFashionConfig local_186;
        return local_186.GetInitBottom();
    }
    return GetInitBottom();
}
UFUNCTION()
TDataObjectPtr<FFashionConfig> __FCharacterDefaultFashionConfig_GetInitSuit(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitSuit' from a null 'FCharacterDefaultFashionConfig' DataObject!");
        }
        FCharacterDefaultFashionConfig local_186;
        return local_186.GetInitSuit();
    }
    return GetInitSuit();
}
UFUNCTION()
TDataObjectPtr<FFashionConfig> __FCharacterDefaultFashionConfig_GetInitBathrobeTop(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitBathrobeTop' from a null 'FCharacterDefaultFashionConfig' DataObject!");
        }
        FCharacterDefaultFashionConfig local_186;
        return local_186.GetInitBathrobeTop();
    }
    return GetInitBathrobeTop();
}
UFUNCTION()
TDataObjectPtr<FFashionConfig> __FCharacterDefaultFashionConfig_GetInitBathrobeBottom(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitBathrobeBottom' from a null 'FCharacterDefaultFashionConfig' DataObject!");
        }
        FCharacterDefaultFashionConfig local_186;
        return local_186.GetInitBathrobeBottom();
    }
    return GetInitBathrobeBottom();
}
UFUNCTION()
FCharacterDefaultFashionConfig CastToFCharacterDefaultFashionConfig(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout DataObject)
{
    FCharacterDefaultFashionConfig __r;
    return __r;
}
}
