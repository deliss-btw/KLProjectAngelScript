
enum EPresentationIconType
{
    NormalIcon,
    SimplifiedIcon,
    NoIcon = 254,
    Override,
}

enum EPresentationSpotOffsetType
{
    NoOffset,
    UseAnchor,
    UseSocket,
}

enum EPresentationSpotAnchorType
{
    Top,
    Bottom,
    Center,
}

namespace FPresentationSpotOffset
{
    const FPresentationSpotOffset DefaultNoOffset = FPresentationSpotOffset();
    const FPresentationSpotOffset DefaultAnchorTop = FPresentationSpotOffset();

}
struct FPresentationIcon
{
    UPROPERTY()
    EPresentationIconType IconType;
    UPROPERTY()
    FSoftBrush OverrideIcon;


    FSoftBrush GetIconBrush(const TDataObjectPtr<FPresentationConfig> &inout PresentationConfig) const
    {
        const UPresentationSpotSettings local_52;
        FSoftBrush __return;
        int local_2 = int(this.IconType);
        if (local_2 <= -1)
        {
            if (local_2 != -2)
            {
                if (local_2 != -1)
                {
                }
            }
            else
            {
                __return = FSoftBrush();
                __return = this.OverrideIcon;
            }
        }
        if (!(PresentationConfig))
        {
            GetGameplaySettings<UPresentationSpotSettings> local_54;
            local_52 = local_54;
            return local_52.NoConfigIcon;
        }
        else
        {
            GetGameplaySettings<UPresentationSpotSettings> local_54;
            FSoftBrush local_100;
            if (!(PresentationConfig.opArrow().Icons.Find(this.IconType, local_100)))
            {
                local_52 = local_54;
                return local_52.NoConfigIcon;
            }
            else
            {
                __return = local_100;
            }
        }
        return __return;
    }
    FMargin GetIconPadding(const TDataObjectPtr<FPresentationConfig> &inout PresentationConfig) const
    {
        FMargin __return;
        int local_2 = int(this.IconType);
        if (local_2 <= -1)
        {
            if (local_2 != -2)
            {
                if (local_2 != -1)
                {
                }
            }
            else
            {
                __return = FMargin();
                __return = FMargin();
            }
        }
        if (!(PresentationConfig))
        {
            return FMargin();
        }
        else
        {
            FMargin local_12;
            if (!(PresentationConfig.opArrow().IconsPadding.Find(this.IconType, local_12)))
            {
                return FMargin();
            }
            else
            {
                __return = local_12;
            }
        }
        return __return;
    }
}

struct FPresentationSpotOffset
{
    UPROPERTY()
    EPresentationSpotOffsetType OffsetType;
    UPROPERTY()
    EPresentationSpotAnchorType AnchorType;
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    FVector3f AdditionalOffset;
    UPROPERTY()
    float32 AdditionalZOffset = 0.0f;

    FPresentationSpotOffset(const EPresentationSpotAnchorType InAnchorType, const FVector3f &inout InAdditionalOffset = FVector3f::ZeroVector)
    {
        this.OffsetType = EPresentationSpotOffsetType(1);
        this.AnchorType = InAnchorType;
        this.AdditionalOffset = InAdditionalOffset;
        return;
    }
    FPresentationSpotOffset(const FName &inout InSocketName, const FVector3f &inout InAdditionalOffset = FVector3f::ZeroVector)
    {
        this.OffsetType = EPresentationSpotOffsetType(2);
        this.SocketName = InSocketName;
        this.AdditionalOffset = InAdditionalOffset;
        return;
    }
}

struct FPresentationConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FGameplayTag SpotType;
    UPROPERTY()
    TMap<EPresentationIconType, FSoftBrush> Icons;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    FPresentationSpotOffset SpotOffset;
    UPROPERTY()
    bool bSupportMark = true;
    UPROPERTY()
    TMap<EPresentationIconType, FMargin> IconsPadding;
    UPROPERTY()
    FDataObjectPtr m_DropReward;
    UPROPERTY()
    FText TextReward;


    FSoftBrush GetDefaultIcon() const
    {
        FSoftBrush __return;
        if (this.Icons.Find(EPresentationIconType(0)))
        {
        }
        else
        {
            if (this.Icons.Find(EPresentationIconType(1)))
            {
            }
            else
            {
                __return = FSoftBrush();
            }
        }
        return __return;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetDropReward() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    void SetDropReward(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemConfigBase>> local_2;
        this.m_DropReward = local_2;
        return;
    }
}

