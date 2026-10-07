

UCLASS(Abstract)
class UWidget_MarkViewportDisplayIcon : UUserWidget
{
    UPROPERTY()
    FECSEntity MarkEntity;
    UPROPERTY()
    UContentWidget MarkIconProxy;
    UPROPERTY()
    FSlateColor MarkColor;
    UPROPERTY()
    FEUIWidgetHolder MarkIconWidgetHolder;
    UPROPERTY()
    TEUIModelRef<FVM_MarkViewportDisplayIcon> MarkIconModel;

    UWidget_MarkViewportDisplayIcon()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.UpdateColorAndOpacity();
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        this.MarkIconWidgetHolder = FEUIWidgetHolder();
        return;
    }
    UFUNCTION()
    void SetMarkEntity(const FECSEntity &inout Entity)
    {
        this.MarkEntity = Entity;
        this.CreateMarkIconWidget();
        this.UpdateColorAndOpacity();
        return;
    }
    void CreateMarkIconWidget()
    {
        this.MarkIconModel = TEUIModelRef<FVM_MarkViewportDisplayIcon>(::FVM_MarkViewportDisplayIcon::Create(this, this.MarkEntity));
        TSoftClassPtr<UEUIUserWidget> local_22 = this.MarkIconModel.opArrow().GetMarkIconWidget();
        TSoftClassPtr<UEUIUserWidget> local_12;
        if (local_12.IsNull())
        {
            return;
        }
        this.MarkIconWidgetHolder = FEUIWidget::CreateWidget(this.GetOwningLocalPlayer(), local_12, this.MarkIconModel.opArrow().GetMarkIcon());
        this.MarkIconProxy.SetContent(this.MarkIconWidgetHolder.RequireWidget());
        return;
    }
    void UpdateColorAndOpacity()
    {
        if (!((this.MarkEntity == ENTITY_NULL)) && !((::MarkUtil::GetMarkedEntity(this.MarkEntity) == ENTITY_NULL)) && ::MarkUtil::IsMarkVisible(::FASCommonUtils::GetLocalPlayerProxy(), this.MarkEntity.GetId()))
        {
            this.SetRenderOpacity(1.0f);
            if (this.MarkIconModel)
            {
                this.MarkColor = FSlateColor(this.MarkIconModel.opArrow().GetBackgroundColor());
            }
            return;
        }
        this.SetRenderOpacity(0.0f);
        return;
    }
}

