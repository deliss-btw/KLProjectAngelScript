namespace __FLoginCreatePlayerConfigFunctions
{
UFUNCTION()
EGenderType __FLoginCreatePlayerConfig_GetDefaultGender(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultGender' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.DefaultGender;
    }
    return DataObject.Get().DefaultGender;
}
UFUNCTION()
bool __FLoginCreatePlayerConfig_GetbForbidMaleSelect(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bForbidMaleSelect' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bForbidMaleSelect;
    }
    return DataObject.Get().bForbidMaleSelect;
}
UFUNCTION()
FText __FLoginCreatePlayerConfig_GetNotSelectTip(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NotSelectTip' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.NotSelectTip;
    }
    return DataObject.Get().NotSelectTip;
}
UFUNCTION()
FText __FLoginCreatePlayerConfig_GetSelectForbidTip(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SelectForbidTip' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.SelectForbidTip;
    }
    return DataObject.Get().SelectForbidTip;
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
    return DataObject.Get().GetMaleDefaultFashion();
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
    return DataObject.Get().GetFemaleDefaultFashion();
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
    return DataObject.Get().GetAvailableFace();
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
    return DataObject.Get().GetAvailableHair();
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
    return DataObject.Get().GetAvailableTop();
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
    return DataObject.Get().GetAvailableBottom();
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
    return DataObject.Get().GetAvailableSuit();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bGenderPhaseUseSelectFace' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bGenderPhaseUseSelectFace;
    }
    return DataObject.Get().bGenderPhaseUseSelectFace;
}
UFUNCTION()
bool __FLoginCreatePlayerConfig_GetbGenderPhaseUseSelectHair(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bGenderPhaseUseSelectHair' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bGenderPhaseUseSelectHair;
    }
    return DataObject.Get().bGenderPhaseUseSelectHair;
}
UFUNCTION()
bool __FLoginCreatePlayerConfig_GetbGenderPhaseUseSelectFashion(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bGenderPhaseUseSelectFashion' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bGenderPhaseUseSelectFashion;
    }
    return DataObject.Get().bGenderPhaseUseSelectFashion;
}
UFUNCTION()
bool __FLoginCreatePlayerConfig_GetbOpenPre(const TDataObjectPtr<FLoginCreatePlayerConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bOpenPre' from a null 'FLoginCreatePlayerConfig' DataObject!");
        }
        FLoginCreatePlayerConfig local_104;
        return local_104.bOpenPre;
    }
    return DataObject.Get().bOpenPre;
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
