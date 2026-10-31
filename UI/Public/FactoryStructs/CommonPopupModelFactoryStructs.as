struct FCommonSideHintData
{
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FSoftBrush SpecialBgImage;
    UPROPERTY()
    FText Content;
    UPROPERTY()
    FFPTime Lifetime;
    UPROPERTY()
    int Priority = 0;

}

struct FCommonLargeSideHintData : FCommonSideHintData
{
    FCommonSideHintData _base_FCommonSideHintData;
    UPROPERTY()
    FText Title;

    FCommonLargeSideHintData()
    {
        return;
    }
}

struct FCommonLargeSideHintDataWithAction : FCommonLargeSideHintData
{
    FCommonLargeSideHintData _base_FCommonLargeSideHintData;
    UPROPERTY()
    FInputActionListConstructParam InputActionList;

    FCommonLargeSideHintDataWithAction()
    {
        return;
    }
}

