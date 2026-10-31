namespace __FLoginCreatePlayerConfigFunctions
{
UFUNCTION()
EGenderType __FLoginCreatePlayerConfig_GetDefaultGender(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    int local_105 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultGender' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        local_105 = int(local_104.DefaultGender);
        return EGenderType(local_105);
    }
    return EGenderType(local_105);
}
UFUNCTION()
bool __FLoginCreatePlayerConfig_GetbForbidMaleSelect(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bForbidMaleSelect' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bForbidMaleSelect;
    }
    return local_1;
}
UFUNCTION()
FText __FLoginCreatePlayerConfig_GetNotSelectTip(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NotSelectTip' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.NotSelectTip;
    }
    return __r;
}
UFUNCTION()
FText __FLoginCreatePlayerConfig_GetSelectForbidTip(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SelectForbidTip' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.SelectForbidTip;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FCharacterDefaultFashionConfig> __FLoginCreatePlayerConfig_GetMaleDefaultFashion(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaleDefaultFashion' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.GetMaleDefaultFashion();
    }
    return GetMaleDefaultFashion();
}
UFUNCTION()
TDataObjectPtr<FCharacterDefaultFashionConfig> __FLoginCreatePlayerConfig_GetFemaleDefaultFashion(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FemaleDefaultFashion' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.GetFemaleDefaultFashion();
    }
    return GetFemaleDefaultFashion();
}
UFUNCTION()
TArray<TDataObjectPtr<FFacePresetConfig>> __FLoginCreatePlayerConfig_GetAvailableFace(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvailableFace' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.GetAvailableFace();
    }
    return GetAvailableFace();
}
UFUNCTION()
int __FLoginCreatePlayerConfig_GetDefaultFaceIndex(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultFaceIndex' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig defaultValue;
        return defaultValue.DefaultFaceIndex;
    }
    return DataObject.Get().DefaultFaceIndex;
}
UFUNCTION()
TArray<TDataObjectPtr<FFashionConfig>> __FLoginCreatePlayerConfig_GetAvailableHair(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvailableHair' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.GetAvailableHair();
    }
    return GetAvailableHair();
}
UFUNCTION()
int __FLoginCreatePlayerConfig_GetDefaultHairIndex(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultHairIndex' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig defaultValue;
        return defaultValue.DefaultHairIndex;
    }
    return DataObject.Get().DefaultHairIndex;
}
UFUNCTION()
TArray<TDataObjectPtr<FFashionConfig>> __FLoginCreatePlayerConfig_GetAvailableTop(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvailableTop' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.GetAvailableTop();
    }
    return GetAvailableTop();
}
UFUNCTION()
int __FLoginCreatePlayerConfig_GetDefaultTopIndex(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultTopIndex' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig defaultValue;
        return defaultValue.DefaultTopIndex;
    }
    return DataObject.Get().DefaultTopIndex;
}
UFUNCTION()
TArray<TDataObjectPtr<FFashionConfig>> __FLoginCreatePlayerConfig_GetAvailableBottom(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvailableBottom' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.GetAvailableBottom();
    }
    return GetAvailableBottom();
}
UFUNCTION()
int __FLoginCreatePlayerConfig_GetDefaultBottomIndex(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultBottomIndex' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig defaultValue;
        return defaultValue.DefaultBottomIndex;
    }
    return DataObject.Get().DefaultBottomIndex;
}
UFUNCTION()
TArray<TDataObjectPtr<FFashionConfig>> __FLoginCreatePlayerConfig_GetAvailableSuit(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvailableSuit' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.GetAvailableSuit();
    }
    return GetAvailableSuit();
}
UFUNCTION()
int __FLoginCreatePlayerConfig_GetDefaultSuitIndex(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultSuitIndex' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig defaultValue;
        return defaultValue.DefaultSuitIndex;
    }
    return DataObject.Get().DefaultSuitIndex;
}
UFUNCTION()
bool __FLoginCreatePlayerConfig_GetbGenderPhaseUseSelectFace(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bGenderPhaseUseSelectFace' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bGenderPhaseUseSelectFace;
    }
    return local_1;
}
UFUNCTION()
bool __FLoginCreatePlayerConfig_GetbGenderPhaseUseSelectHair(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bGenderPhaseUseSelectHair' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bGenderPhaseUseSelectHair;
    }
    return local_1;
}
UFUNCTION()
bool __FLoginCreatePlayerConfig_GetbGenderPhaseUseSelectFashion(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bGenderPhaseUseSelectFashion' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bGenderPhaseUseSelectFashion;
    }
    return local_1;
}
UFUNCTION()
bool __FLoginCreatePlayerConfig_GetbOpenPre(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bOpenPre' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bOpenPre;
    }
    return local_1;
}
UFUNCTION()
float32 __FLoginCreatePlayerConfig_GetMaskTime(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaskTime' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig defaultValue;
        return defaultValue.MaskTime;
    }
    return DataObject.Get().MaskTime;
}
UFUNCTION()
float32 __FLoginCreatePlayerConfig_GetMaskFadeOutTime(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaskFadeOutTime' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig defaultValue;
        return defaultValue.MaskFadeOutTime;
    }
    return DataObject.Get().MaskFadeOutTime;
}
UFUNCTION()
FLoginCreatePlayerConfig CastToFLoginCreatePlayerConfig(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    FLoginCreatePlayerConfig __r;
    return __r;
}
}
