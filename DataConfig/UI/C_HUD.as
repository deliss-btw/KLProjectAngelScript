
enum EMotionType
{
    Single,
    Multi,
    FunctionProp,
}

enum EMotionShowType
{
    AlwaysShow,
    ShowAfterUnlock,
    AlwaysHide,
}

enum EEmojiType
{
    StaticEmoji,
    DynamicEmoji,
}


struct FEmojiData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EEmojiType EmojiType;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    UTexture2D EmojiIcon = nullptr;
    UPROPERTY()
    FSoftBrush EmojiIconObject;


}

struct FLevelHintData
{
    UPROPERTY()
    FText Name;
    UPROPERTY()
    UTexture2D HintImage = nullptr;
    UPROPERTY()
    FText HintContent;

    FLevelHintData()
    {
        return;
    }
}

struct FSimpleSpawnPropData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSubclassOf<AECSPrefab> Prefab;

    FSimpleSpawnPropData()
    {
        return;
    }
}

struct FMotionData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EMotionType MotionType;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FText LockSource;
    UPROPERTY()
    bool IsLock = false;
    UPROPERTY()
    EMotionShowType ShowType = EMotionShowType(0);
    UPROPERTY()
    int AnimIndex;
    UPROPERTY()
    EInteractionSocialTypeForESM AnimName;
    UPROPERTY()
    TSoftClassPtr<APropPrefabScriptBase> Prefab;
    UPROPERTY()
    FNameHandle_EntityBBVarInt PropNum;
    UPROPERTY()
    int MaxCount;
    UPROPERTY()
    FDataObjectPtr m_SelectParams;
    UPROPERTY()
    EEcosimAIV2ActionExpressionMeaning ActionExpressionMeaning;


    const TDataObjectPtr<FSkillTargetPositionSelectParams> GetSelectParams() const property
    {
        const TDataObjectPtr<FSkillTargetPositionSelectParams> __r;
        return __r;
    }
    void SetSelectParams(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FSkillTargetPositionSelectParams>> local_2;
        this.m_SelectParams = local_2;
        return;
    }
}

namespace FMotionData
{
TDataObjectPtr<FMotionData> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FMotionData>();
}
}
