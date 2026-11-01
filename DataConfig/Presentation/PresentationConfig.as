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
        GetGameplaySettings<UPresentationSpotSettings> local_54;
        switch (int(this.IconType))
        {
        case -2:
        {
            return FSoftBrush();
        }
        case -1:
        {
            return this.OverrideIcon;
        }
        default:
        {
            if (!(PresentationConfig))
            {
                local_52 = local_54;
                return local_52.NoConfigIcon;
            }
            else
            {
                FSoftBrush local_100;
                if (!(PresentationConfig.opArrow().Icons.Find(this.IconType, local_100)))
                {
                    local_52 = local_54;
                    return local_52.NoConfigIcon;
                }
                else
                {
                    return local_100;
                }
            }
        }
        }
    }
    FMargin GetIconPadding(const TDataObjectPtr<FPresentationConfig> &inout PresentationConfig) const
    {
        switch (int(this.IconType))
        {
        case -2:
        {
            return FMargin();
        }
        case -1:
        {
            return FMargin();
        }
        default:
        {
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
                    return local_12;
                }
            }
        }
        }
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
        TConstRawPtr<FSoftBrush> local_4 = this.Icons.Find(EPresentationIconType(0));
        if (local_4)
        {
            return local_4.Get();
        }
        TConstRawPtr<FSoftBrush> local_6 = this.Icons.Find(EPresentationIconType(1));
        if (local_6)
        {
            return local_6.Get();
        }
        return FSoftBrush();
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

