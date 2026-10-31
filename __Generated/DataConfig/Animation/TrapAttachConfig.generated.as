namespace __FTrapAttachOffsetRowFunctions
{
UFUNCTION()
FName __FTrapAttachOffsetRow_GetRootBoneName(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RootBoneName' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.RootBoneName;
    }
    return __r;
}
UFUNCTION()
FName __FTrapAttachOffsetRow_GetPelvisBoneName(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PelvisBoneName' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.PelvisBoneName;
    }
    return __r;
}
UFUNCTION()
FVector __FTrapAttachOffsetRow_GetTopMOffset(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TopMOffset' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.TopMOffset;
    }
    return __r;
}
UFUNCTION()
FVector __FTrapAttachOffsetRow_GetBaseOffset(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseOffset' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.BaseOffset;
    }
    return __r;
}
UFUNCTION()
float32 __FTrapAttachOffsetRow_GetOuterRadius(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OuterRadius' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow defaultValue;
        return defaultValue.OuterRadius;
    }
    return DataObject.Get().OuterRadius;
}
UFUNCTION()
float32 __FTrapAttachOffsetRow_GetOuterHeight(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OuterHeight' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow defaultValue;
        return defaultValue.OuterHeight;
    }
    return DataObject.Get().OuterHeight;
}
UFUNCTION()
float32 __FTrapAttachOffsetRow_GetAngleOffset(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AngleOffset' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow defaultValue;
        return defaultValue.AngleOffset;
    }
    return DataObject.Get().AngleOffset;
}
UFUNCTION()
FVector __FTrapAttachOffsetRow_GetFrontLOffset(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FrontLOffset' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.FrontLOffset;
    }
    return __r;
}
UFUNCTION()
FVector __FTrapAttachOffsetRow_GetFrontMOffset(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FrontMOffset' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.FrontMOffset;
    }
    return __r;
}
UFUNCTION()
FVector __FTrapAttachOffsetRow_GetFrontROffset(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FrontROffset' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.FrontROffset;
    }
    return __r;
}
UFUNCTION()
FVector __FTrapAttachOffsetRow_GetBackLOffset(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BackLOffset' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.BackLOffset;
    }
    return __r;
}
UFUNCTION()
FVector __FTrapAttachOffsetRow_GetBackMOffset(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BackMOffset' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.BackMOffset;
    }
    return __r;
}
UFUNCTION()
FVector __FTrapAttachOffsetRow_GetBackROffset(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BackROffset' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow local_72;
        return local_72.BackROffset;
    }
    return __r;
}
UFUNCTION()
float32 __FTrapAttachOffsetRow_GetUpperLayerBlendRatio(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UpperLayerBlendRatio' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow defaultValue;
        return defaultValue.UpperLayerBlendRatio;
    }
    return DataObject.Get().UpperLayerBlendRatio;
}
UFUNCTION()
float32 __FTrapAttachOffsetRow_GetHalfLayerRadiusScale(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HalfLayerRadiusScale' from a null 'FTrapAttachOffsetRow' DataObject!");
        }
        FTrapAttachOffsetRow defaultValue;
        return defaultValue.HalfLayerRadiusScale;
    }
    return DataObject.Get().HalfLayerRadiusScale;
}
UFUNCTION()
FTrapAttachOffsetRow CastToFTrapAttachOffsetRow(const TDataObjectPtr<FTrapAttachOffsetRow> &inout DataObject)
{
    FTrapAttachOffsetRow __r;
    return __r;
}
}
