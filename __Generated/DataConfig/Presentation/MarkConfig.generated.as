namespace __FMarkIconConfigFunctions
{
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FMarkIconConfig_GetIconWidget(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconWidget' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.IconWidget;
    }
    return DataObject.Get().IconWidget;
}
UFUNCTION()
TSoftObjectPtr<UTexture2D> __FMarkIconConfig_GetIconTexture(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconTexture' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.IconTexture;
    }
    return DataObject.Get().IconTexture;
}
UFUNCTION()
FSoftBrush __FMarkIconConfig_GetIconBrush(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconBrush' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.IconBrush;
    }
    return DataObject.Get().IconBrush;
}
UFUNCTION()
FLinearColor __FMarkIconConfig_GetSelfColor(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SelfColor' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.SelfColor;
    }
    return DataObject.Get().SelfColor;
}
UFUNCTION()
FLinearColor __FMarkIconConfig_GetTeammateColor(const TDataObjectPtr<FMarkIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TeammateColor' from a null 'FMarkIconConfig' DataObject!");
        }
        FMarkIconConfig local_88;
        return local_88.TeammateColor;
    }
    return DataObject.Get().TeammateColor;
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
    return DataObject.Get().GetMarkPool();
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
    return DataObject.Get().GetPresentationConfig();
}
UFUNCTION()
bool __FMarkConfig_GetbShowDistanceInNavigationBar(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowDistanceInNavigationBar' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.bShowDistanceInNavigationBar;
    }
    return DataObject.Get().bShowDistanceInNavigationBar;
}
UFUNCTION()
bool __FMarkConfig_GetbShareWithTeammates(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShareWithTeammates' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.bShareWithTeammates;
    }
    return DataObject.Get().bShareWithTeammates;
}
UFUNCTION()
bool __FMarkConfig_GetbDisableManuallyRemove(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDisableManuallyRemove' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.bDisableManuallyRemove;
    }
    return DataObject.Get().bDisableManuallyRemove;
}
UFUNCTION()
bool __FMarkConfig_GetbRemoveWhenNoLongerGuidingTarget(const TDataObjectPtr<FMarkConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bRemoveWhenNoLongerGuidingTarget' from a null 'FMarkConfig' DataObject!");
        }
        FMarkConfig local_64;
        return local_64.bRemoveWhenNoLongerGuidingTarget;
    }
    return DataObject.Get().bRemoveWhenNoLongerGuidingTarget;
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
