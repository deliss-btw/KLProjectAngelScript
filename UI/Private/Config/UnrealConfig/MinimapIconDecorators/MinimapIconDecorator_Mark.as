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
        FECSEntity local_20 = Context.GetLocalPlayer();
        TDataObjectPtr<FMarkConfig> local_44 = ::MarkUtil::GetVisibleMarkConfig(local_20, EntityID);
        if (local_44)
        {
            TDataObjectPtr<FPresentationConfig> local_94 = local_44.opArrow().GetPresentationConfig();
            DecoratorData.DecoratorWidgetClass = this.MarkIconWidgetClass;
            DecoratorData.DecoratorWidgetModel = ::FVM_MarkIcon::Create(Context.Manager, local_94, ::MarkUtil::IsEntityMarkedBySelf(Context.GetLocalPlayer(), EntityID));
            return true;
        }
        return false;
    }
}

