

class UMinimapIconDecorator_Guide : UMinimapIconDecoratorBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> GuideTargetIconWidgetClass;

    UMinimapIconDecorator_Guide()
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

