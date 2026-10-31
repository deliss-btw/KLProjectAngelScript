namespace __FEmojiDataFunctions
{
UFUNCTION()
EEmojiType __FEmojiData_GetEmojiType(const TDataObjectPtr<FEmojiData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EmojiType' from a null 'FEmojiData' DataObject!");
        }
        FEmojiData local_68;
        return local_68.EmojiType;
    }
    return DataObject.Get().EmojiType;
}
UFUNCTION()
FText __FEmojiData_GetName(const TDataObjectPtr<FEmojiData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FEmojiData' DataObject!");
        }
        FEmojiData local_68;
        return local_68.Name;
    }
    return DataObject.Get().Name;
}
UFUNCTION()
UTexture2D __FEmojiData_GetEmojiIcon(const TDataObjectPtr<FEmojiData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EmojiIcon' from a null 'FEmojiData' DataObject!");
        }
        FEmojiData local_68;
        return local_68.EmojiIcon;
    }
    UTexture2D local_70;
    return local_70;
}
UFUNCTION()
FSoftBrush __FEmojiData_GetEmojiIconObject(const TDataObjectPtr<FEmojiData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EmojiIconObject' from a null 'FEmojiData' DataObject!");
        }
        FEmojiData local_68;
        return local_68.EmojiIconObject;
    }
    return DataObject.Get().EmojiIconObject;
}
UFUNCTION()
FEmojiData CastToFEmojiData(const TDataObjectPtr<FEmojiData> &inout DataObject)
{
    FEmojiData __r;
    return __r;
}
}
namespace __FSimpleSpawnPropDataFunctions
{
UFUNCTION()
TSubclassOf<AECSPrefab> __FSimpleSpawnPropData_GetPrefab(const TDataObjectPtr<FSimpleSpawnPropData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Prefab' from a null 'FSimpleSpawnPropData' DataObject!");
        }
        FSimpleSpawnPropData local_16;
        return local_16.Prefab;
    }
    return DataObject.Get().Prefab;
}
UFUNCTION()
FSimpleSpawnPropData CastToFSimpleSpawnPropData(const TDataObjectPtr<FSimpleSpawnPropData> &inout DataObject)
{
    FSimpleSpawnPropData __r;
    return __r;
}
}
namespace __FMotionDataFunctions
{
UFUNCTION()
EMotionType __FMotionData_GetMotionType(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MotionType' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.MotionType;
    }
    return DataObject.Get().MotionType;
}
UFUNCTION()
FText __FMotionData_GetName(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.Name;
    }
    return DataObject.Get().Name;
}
UFUNCTION()
FSoftBrush __FMotionData_GetIcon(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.Icon;
    }
    return DataObject.Get().Icon;
}
UFUNCTION()
FText __FMotionData_GetLockSource(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LockSource' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.LockSource;
    }
    return DataObject.Get().LockSource;
}
UFUNCTION()
bool __FMotionData_GetIsLock(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IsLock' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.IsLock;
    }
    return DataObject.Get().IsLock;
}
UFUNCTION()
EMotionShowType __FMotionData_GetShowType(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowType' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.ShowType;
    }
    return DataObject.Get().ShowType;
}
UFUNCTION()
int __FMotionData_GetAnimIndex(const TDataObjectPtr<FMotionData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AnimIndex' from a null 'FMotionData' DataObject!");
        }
        FMotionData defaultValue;
        return defaultValue.AnimIndex;
    }
    return DataObject.Get().AnimIndex;
}
UFUNCTION()
EInteractionSocialTypeForESM __FMotionData_GetAnimName(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AnimName' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.AnimName;
    }
    return DataObject.Get().AnimName;
}
UFUNCTION()
TSoftClassPtr<APropPrefabScriptBase> __FMotionData_GetPrefab(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Prefab' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.Prefab;
    }
    return DataObject.Get().Prefab;
}
UFUNCTION()
FNameHandle_EntityBBVarInt __FMotionData_GetPropNum(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PropNum' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.PropNum;
    }
    return DataObject.Get().PropNum;
}
UFUNCTION()
int __FMotionData_GetMaxCount(const TDataObjectPtr<FMotionData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxCount' from a null 'FMotionData' DataObject!");
        }
        FMotionData defaultValue;
        return defaultValue.MaxCount;
    }
    return DataObject.Get().MaxCount;
}
UFUNCTION()
TDataObjectPtr<FSkillTargetPositionSelectParams> __FMotionData_GetSelectParams(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SelectParams' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.GetSelectParams();
    }
    return DataObject.Get().GetSelectParams();
}
UFUNCTION()
EEcosimAIV2ActionExpressionMeaning __FMotionData_GetActionExpressionMeaning(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ActionExpressionMeaning' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.ActionExpressionMeaning;
    }
    return DataObject.Get().ActionExpressionMeaning;
}
UFUNCTION()
FMotionData CastToFMotionData(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    FMotionData __r;
    return __r;
}
}
