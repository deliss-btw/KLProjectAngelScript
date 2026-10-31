namespace __FRewardSortTagPriorityConfigFunctions
{
UFUNCTION()
FName __FRewardSortTagPriorityConfig_GetTagKey(const TDataObjectPtr<FRewardSortTagPriorityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TagKey' from a null 'FRewardSortTagPriorityConfig' DataObject!");
        }
        FRewardSortTagPriorityConfig local_22;
        return local_22.TagKey;
    }
    return DataObject.Get().TagKey;
}
UFUNCTION()
int __FRewardSortTagPriorityConfig_GetPriority(const TDataObjectPtr<FRewardSortTagPriorityConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FRewardSortTagPriorityConfig' DataObject!");
        }
        FRewardSortTagPriorityConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
FText __FRewardSortTagPriorityConfig_GetDisplayText(const TDataObjectPtr<FRewardSortTagPriorityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayText' from a null 'FRewardSortTagPriorityConfig' DataObject!");
        }
        FRewardSortTagPriorityConfig local_22;
        return local_22.DisplayText;
    }
    return DataObject.Get().DisplayText;
}
UFUNCTION()
FRewardSortTagPriorityConfig CastToFRewardSortTagPriorityConfig(const TDataObjectPtr<FRewardSortTagPriorityConfig> &inout DataObject)
{
    FRewardSortTagPriorityConfig __r;
    return __r;
}
}
namespace __FRewardSortItemOverrideConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FItemConfig> __FRewardSortItemOverrideConfig_GetItemId(const TDataObjectPtr<FRewardSortItemOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemId' from a null 'FRewardSortItemOverrideConfig' DataObject!");
        }
        FRewardSortItemOverrideConfig local_40;
        return local_40.GetItemId();
    }
    return DataObject.Get().GetItemId();
}
UFUNCTION()
float32 __FRewardSortItemOverrideConfig_GetSortOrder(const TDataObjectPtr<FRewardSortItemOverrideConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SortOrder' from a null 'FRewardSortItemOverrideConfig' DataObject!");
        }
        FRewardSortItemOverrideConfig defaultValue;
        return defaultValue.SortOrder;
    }
    return DataObject.Get().SortOrder;
}
UFUNCTION()
int __FRewardSortItemOverrideConfig_GetSubOrder(const TDataObjectPtr<FRewardSortItemOverrideConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SubOrder' from a null 'FRewardSortItemOverrideConfig' DataObject!");
        }
        FRewardSortItemOverrideConfig defaultValue;
        return defaultValue.SubOrder;
    }
    return DataObject.Get().SubOrder;
}
UFUNCTION()
FRewardSortItemOverrideConfig CastToFRewardSortItemOverrideConfig(const TDataObjectPtr<FRewardSortItemOverrideConfig> &inout DataObject)
{
    FRewardSortItemOverrideConfig __r;
    return __r;
}
}
