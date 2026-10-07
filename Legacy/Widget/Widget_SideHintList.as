

class UWidget_SideHintList : UASUserWidget
{
    UPROPERTY()
    TArray<UWidget_SideHint_Old> AllSideHints;
    UPROPERTY()
    UVerticalBox AllHintBox;
    UPROPERTY()
    TSubclassOf<UWidget_SideHint_Old> UI_SideHint_BPClass;
    int DefaultMaxSideHintNum = 3;


    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void ShowSideHint(const FString &inout Content, const ESideHintType HintType, const FECSEntity &inout HintTarget, const int ShowCount = 0)
    {
        if (this.AllSideHints.Num() >= this.DefaultMaxSideHintNum)
        {
            this.AllSideHints[0].RemoveSelf();
        }
        UWidget_SideHint_Old local_6 = (Cast<UWidget_SideHint_Old>(WidgetBlueprint::CreateWidget(__GetWorldContext(), this.UI_SideHint_BPClass, this.GetOwningPlayer())));
        local_6.AddToViewport(0);
        local_6.ShowSideHint(Content, ESideHintType(HintType), HintTarget, ShowCount);
        local_6.UI_SideHintList = this;
        this.AllHintBox.AddChildToVerticalBox(local_6);
        this.AllSideHints.Add(local_6);
        return;
    }
}

