

class UWidget_QTE_Result : UASUserWidget
{
    UPROPERTY()
    UWidgetAnimation StartAnim;
    UPROPERTY()
    UEUIInputActionWidget IAWidget_InputHint;
    UPROPERTY()
    FEUIInputActionDataRow InputActionRow;
    UPROPERTY()
    float32 DestroyTime = 2.0f;
    float32 CurrentTime = 0.0f;


    UFUNCTION()
    void Construct_Implementation()
    {
        this.PlayAnimation(this.StartAnim, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        if (this.IAWidget_InputHint != nullptr)
        {
            this.IAWidget_InputHint.SetInputTableRowAction(this.InputActionRow);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.CurrentTime += InDeltaTime;
        if (this.CurrentTime >= this.DestroyTime)
        {
            this.RemoveFromParent();
        }
        return;
    }
}

