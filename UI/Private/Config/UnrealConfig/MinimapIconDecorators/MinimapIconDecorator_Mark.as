

class UMinimapIconDecorator_Mark : UMinimapIconDecoratorBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> MarkIconWidgetClass;

    UMinimapIconDecorator_Mark()
    {
        super();
        return;
    }
    bool GetDecorator(const FEUIModelContext &inout Context, const FECSEntityId &inout EntityID, FMinimapIconDecoratorData &out DecoratorData) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
}

