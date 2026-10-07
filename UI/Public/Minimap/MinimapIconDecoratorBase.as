
enum EMinimapIconDecoratorType
{
    Mark,
    Ecosim,
    GuidingPath,
    MAX,
}


struct FMinimapIconDecoratorTooltip
{
    UPROPERTY()
    FText Tooltip;
    UPROPERTY()
    FText Detail;

    FMinimapIconDecoratorTooltip()
    {
        return;
    }
    FMinimapIconDecoratorTooltip(const FText &inout InTooltip, const FText &inout InDetail)
    {
        this.Detail = InDetail;
        return;
    }
}

struct FMinimapIconDecoratorData
{
    UPROPERTY()
    TSoftClassPtr<UUserWidget> DecoratorWidgetClass;
    UPROPERTY()
    FEUIModelRef DecoratorWidgetModel;
    UPROPERTY()
    TArray<FMinimapIconDecoratorTooltip> Tooltips;

    FMinimapIconDecoratorData()
    {
        return;
    }
}

UCLASS(Abstract)
class UMinimapIconDecoratorBase : UObject
{
    UPROPERTY()
    EHorizontalAlignment HorizontalAlignment = EHorizontalAlignment(3);
    UPROPERTY()
    EVerticalAlignment VerticalAlignment = EVerticalAlignment(1);
    UPROPERTY()
    FMargin Padding;
    UPROPERTY()
    int ZOrder = 0;


    bool GetDecorator(const FEUIModelContext &inout Context, const FECSEntityId &inout EntityID, FMinimapIconDecoratorData &out DecoratorData) const
    {
        return false;
    }
}

