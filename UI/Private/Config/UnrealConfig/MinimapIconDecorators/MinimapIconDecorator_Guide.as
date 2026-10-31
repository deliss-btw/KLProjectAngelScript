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
        if ((EntityID == ENTITY_ID_NULL))
        {
            return false;
        }
        FECSEntity local_22 = Context.GetLocalPlayer();
        if ((::FGuidingPathUtils::GetGuidingPathTargetEntityID(local_22) == EntityID))
        {
            DecoratorData.DecoratorWidgetClass = this.GuideTargetIconWidgetClass;
            DecoratorData.DecoratorWidgetModel = ::FVM_GuideTargetIcon::Create(Context.Manager, 0);
            return true;
        }
        FECSEntity local_22_2 = Context.GetLocalPlayer();
        Has local_46;
        for (auto& local_42 : ::FTeamUtils::GetTeammates(local_22_2))
        {
            if (!(local_46.opCall()))
            {
                continue;
            }
            if ((::FGuidingPathUtils::GetGuidingPathTargetEntityID(local_42) == EntityID))
            {
                DecoratorData.DecoratorWidgetClass = this.GuideTargetIconWidgetClass;
                DecoratorData.DecoratorWidgetModel = ::FVM_GuideTargetIcon::Create(Context.Manager, 1);
                return true;
            }
        }
        return false;
    }
}

