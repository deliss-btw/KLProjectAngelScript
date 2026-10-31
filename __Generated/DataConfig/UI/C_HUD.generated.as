namespace __FEmojiDataFunctions
{
UFUNCTION()
EEmojiType __FEmojiData_GetEmojiType(const TDataObjectPtr<FEmojiData> &inout DataObject)
{
    int local_69 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EmojiType' from a null 'FEmojiData' DataObject!");
        }
        FEmojiData local_68;
        local_69 = int(local_68.EmojiType);
        return EEmojiType(local_69);
    }
    return EEmojiType(local_69);
}
UFUNCTION()
FText __FEmojiData_GetName(const TDataObjectPtr<FEmojiData> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FEmojiData' DataObject!");
        }
        FEmojiData local_68;
        return local_68.Name;
    }
    return __r;
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
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EmojiIconObject' from a null 'FEmojiData' DataObject!");
        }
        FEmojiData local_68;
        return local_68.EmojiIconObject;
    }
    return __r;
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
    TSubclassOf<AECSPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Prefab' from a null 'FSimpleSpawnPropData' DataObject!");
        }
        FSimpleSpawnPropData local_16;
        return local_16.Prefab;
    }
    return __r;
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
    int local_121 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MotionType' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        local_121 = int(local_120.MotionType);
        return EMotionType(local_121);
    }
    return EMotionType(local_121);
}
UFUNCTION()
FText __FMotionData_GetName(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.Name;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FMotionData_GetIcon(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.Icon;
    }
    return __r;
}
UFUNCTION()
FText __FMotionData_GetLockSource(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LockSource' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.LockSource;
    }
    return __r;
}
UFUNCTION()
bool __FMotionData_GetIsLock(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IsLock' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.IsLock;
    }
    return local_1;
}
UFUNCTION()
EMotionShowType __FMotionData_GetShowType(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    int local_121 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowType' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        local_121 = int(local_120.ShowType);
        return EMotionShowType(local_121);
    }
    return EMotionShowType(local_121);
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
    int local_121 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AnimName' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        local_121 = int(local_120.AnimName);
        return EInteractionSocialTypeForESM(local_121);
    }
    return EInteractionSocialTypeForESM(local_121);
}
UFUNCTION()
TSoftClassPtr<APropPrefabScriptBase> __FMotionData_GetPrefab(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    TSoftClassPtr<APropPrefabScriptBase> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Prefab' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.Prefab;
    }
    return __r;
}
UFUNCTION()
FNameHandle_EntityBBVarInt __FMotionData_GetPropNum(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    FNameHandle_EntityBBVarInt __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PropNum' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        return local_120.PropNum;
    }
    return __r;
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
    return GetSelectParams();
}
UFUNCTION()
EEcosimAIV2ActionExpressionMeaning __FMotionData_GetActionExpressionMeaning(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    int local_121 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ActionExpressionMeaning' from a null 'FMotionData' DataObject!");
        }
        FMotionData local_120;
        local_121 = int(local_120.ActionExpressionMeaning);
        return EEcosimAIV2ActionExpressionMeaning(local_121);
    }
    return EEcosimAIV2ActionExpressionMeaning(local_121);
}
UFUNCTION()
FMotionData CastToFMotionData(const TDataObjectPtr<FMotionData> &inout DataObject)
{
    FMotionData __r;
    return __r;
}
}
