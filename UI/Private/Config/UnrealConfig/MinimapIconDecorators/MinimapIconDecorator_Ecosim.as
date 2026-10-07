

class UMinimapIconDecorator_Ecosim : UMinimapIconDecoratorBase
{
    UPROPERTY()
    TSoftClassPtr<UUserWidget> EcosimIconWidgetClass;

    UMinimapIconDecorator_Ecosim()
    {
        super();
        return;
    }
    bool GetDecorator(const FEUIModelContext &inout Context, const FECSEntityId &inout EntityID, FMinimapIconDecoratorData &out DecoratorData) const
    {
        FECSEntity local_24 = FECSEntity(EntityID);
        return false;
    }
}

