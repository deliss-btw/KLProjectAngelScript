
enum EFashionRarity
{
    RarityD,
    RarityC,
    RarityB,
    RarityA,
    RarityS,
}

enum EFashionSurfaceType
{
    None,
    Metal,
    Cloth,
    Leather,
    Bone,
}

enum EFashionShowType
{
    DefaultShow,
    DefaultHide,
}

enum EFashionSlotType
{
    None,
    Hair,
    Top,
    Bottom,
    Suit,
    BathrobeTop,
    BathrobeBottom,
    HairDeco = 101,
    HeadDeco,
    FaceDeco,
    EarDeco,
    NeckDeco,
    ShoulderDeco,
    WaistDeco,
    BackDeco,
    Mount = 201,
    MountDeco,
}

enum EFashionDecoSocket
{
    None,
    Hair,
    Head,
    Face,
    Ear_L,
    Ear_R,
    Neck,
    Shoulder_L,
    Shoulder_R,
    Hand_L,
    Hand_R,
    Waist,
    Hip,
    Back,
    Max,
}

enum EBodyType
{
    All,
    Male_Std,
    Female_Std,
}

enum EMountSeatType
{
    Single,
    Double,
}


struct FFashionDisplayIconByBody
{
    UPROPERTY()
    TMap<EBodyType, FSoftBrush> BodyIcons;

    FFashionDisplayIconByBody()
    {
        return;
    }
}

struct FFashionConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    bool bDefaultUnlock = false;
    UPROPERTY()
    FDataObjectPtr m_UnlockCondition;
    UPROPERTY()
    FText UnlockDesOverride;
    UPROPERTY()
    EFashionSlotType SlotType = EFashionSlotType(0);
    UPROPERTY()
    EBodyType BodyType = EBodyType(0);
    UPROPERTY()
    TArray<FDataObjectPtr> m_AvatarTypes;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FText Des;
    UPROPERTY()
    EFashionRarity Rarity = EFashionRarity(0);
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    EFashionShowType ShowType = EFashionShowType(0);
    UPROPERTY()
    TMap<EBodyType, TSoftObjectPtr<USkeletalMesh>> MeshAssets;
    UPROPERTY()
    TMap<EBodyType, TSoftClassPtr<UAnimInstance>> AnimBlueprints;
    UPROPERTY()
    TMap<EBodyType, FName> DyeConfigs;
    UPROPERTY()
    TMap<EDisplayItemIconType, FFashionDisplayIconByBody> DisplayIcons;


    const TDataObjectPtr<FServerConditionConfigBase> GetUnlockCondition() const property
    {
        const TDataObjectPtr<FServerConditionConfigBase> __r;
        return __r;
    }
    void SetUnlockCondition(const TDataObjectPtr<FServerConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FServerConditionConfigBase>> local_2;
        this.m_UnlockCondition = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FAvatarPrefabConfig>> GetAvatarTypes() const property
    {
        const TArray<TDataObjectPtr<FAvatarPrefabConfig>> __r;
        return __r;
    }
    void SetAvatarTypes(const TArray<TDataObjectPtr<FAvatarPrefabConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FAvatarPrefabConfig>>> local_2;
        this.m_AvatarTypes = local_2;
        return;
    }
}

struct FClothFashionConfig : FFashionConfig
{
    FFashionConfig _base_FFashionConfig;
    UPROPERTY()
    float32 HeelHeight = 0.0f;
    UPROPERTY()
    float32 GroundOffset = 0.0f;
    UPROPERTY()
    TSoftObjectPtr<UObject> ClothAssetOverride;
    UPROPERTY()
    TSoftObjectPtr<UObject> KawaiiAssetOverride;
    UPROPERTY()
    bool bHideHair = false;
    UPROPERTY()
    float32 LocomotionStrideScale = 1.0f;
    UPROPERTY()
    TSoftObjectPtr<UObject> FootstepSoundOverride;
    UPROPERTY()
    EFashionSurfaceType SurfaceMaterialType = EFashionSurfaceType(0);


}

struct FFloat3
{
    UPROPERTY()
    float32 X = 0.0f;
    UPROPERTY()
    float32 Y = 0.0f;
    UPROPERTY()
    float32 Z = 0.0f;


}

struct FDecoFashionConfig : FFashionConfig
{
    FFashionConfig _base_FFashionConfig;
    UPROPERTY()
    FDataObjectPtr m_AttachPoint;
    UPROPERTY()
    FFloat3 DefaultAttachOffset;
    UPROPERTY()
    FFloat3 DefaultAttachRotation;
    UPROPERTY()
    float32 DefaultAttachScale = 1.0f;
    UPROPERTY()
    bool bAllowedWithBathrobe = false;


    const TDataObjectPtr<FAttachPointConfig> GetAttachPoint() const property
    {
        const TDataObjectPtr<FAttachPointConfig> __r;
        return __r;
    }
    void SetAttachPoint(const TDataObjectPtr<FAttachPointConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAttachPointConfig>> local_2;
        this.m_AttachPoint = local_2;
        return;
    }
}

struct FMountFashionConfig : FFashionConfig
{
    FFashionConfig _base_FFashionConfig;
    UPROPERTY()
    EMountSeatType SeatType = EMountSeatType(0);
    UPROPERTY()
    TSoftClassPtr<ACharacterPrefab> MountPrefab;
    UPROPERTY()
    TSoftClassPtr<AActor> ShowcaseActor;


}

namespace FFashionConfig
{
TDataObjectPtr<FFashionConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FFashionConfig>();
}
bool IsPlayerFashionSlot(const EFashionSlotType SlotType)
{
    int local_1 = int(SlotType);
    return (local_1 >= 201);
}
}
