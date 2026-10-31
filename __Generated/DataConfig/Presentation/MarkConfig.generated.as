namespace __FMarkIconConfigFunctions
{
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FMarkIconConfig_GetIconWidget(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconWidget' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.IconWidget;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<UTexture2D> __FMarkIconConfig_GetIconTexture(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    TSoftObjectPtr<UTexture2D> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconTexture' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.IconTexture;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FMarkIconConfig_GetIconBrush(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconBrush' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.IconBrush;
    }
    return __r;
}
UFUNCTION()
FLinearColor __FMarkIconConfig_GetSelfColor(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SelfColor' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.SelfColor;
    }
    return __r;
}
UFUNCTION()
FLinearColor __FMarkIconConfig_GetTeammateColor(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TeammateColor' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.TeammateColor;
    }
    return __r;
}
UFUNCTION()
FMarkIconConfig CastToFMarkIconConfig(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    FMarkIconConfig __r;
    return __r;
}
}
namespace __FMarkPoolConfigFunctions
{
UFUNCTION()
int __FMarkPoolConfig_GetMaxNum(const TDataObjectPtr<FMarkPoolConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxNum' from a null 'FMarkPoolConfig' DataObject!");
        }
        FMarkPoolConfig defaultValue;
        return defaultValue.MaxNum;
    }
    return DataObject.Get().MaxNum;
}
UFUNCTION()
FMarkPoolConfig CastToFMarkPoolConfig(const TDataObjectPtr<FMarkPoolConfig> &inout DataObject)
{
    FMarkPoolConfig __r;
    return __r;
}
}
namespace __FMarkConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FMarkPoolConfig> __FMarkConfig_GetMarkPool(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MarkPool' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.GetMarkPool();
    }
    return GetMarkPool();
}
UFUNCTION()
TDataObjectPtr<FPresentationConfig> __FMarkConfig_GetPresentationConfig(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PresentationConfig' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.GetPresentationConfig();
    }
    return GetPresentationConfig();
}
UFUNCTION()
bool __FMarkConfig_GetbShowDistanceInNavigationBar(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowDistanceInNavigationBar' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.bShowDistanceInNavigationBar;
    }
    return local_1;
}
UFUNCTION()
bool __FMarkConfig_GetbShareWithTeammates(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShareWithTeammates' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.bShareWithTeammates;
    }
    return local_1;
}
UFUNCTION()
bool __FMarkConfig_GetbDisableManuallyRemove(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDisableManuallyRemove' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.bDisableManuallyRemove;
    }
    return local_1;
}
UFUNCTION()
bool __FMarkConfig_GetbRemoveWhenNoLongerGuidingTarget(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bRemoveWhenNoLongerGuidingTarget' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.bRemoveWhenNoLongerGuidingTarget;
    }
    return local_1;
}
UFUNCTION()
float32 __FMarkConfig_GetRemoveWhenCreaterApproachDistance(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RemoveWhenCreaterApproachDistance' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig defaultValue;
        return defaultValue.RemoveWhenCreaterApproachDistance;
    }
    return DataObject.Get().RemoveWhenCreaterApproachDistance;
}
UFUNCTION()
FMarkConfig CastToFMarkConfig(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    FMarkConfig __r;
    return __r;
}
}
