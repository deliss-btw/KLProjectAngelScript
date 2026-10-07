
namespace UPage_TestEUICanvas
{
    const int ViewID = 0;

}
struct FTestEUICanvasStruct
{
    UPROPERTY()
    FText Text;
    UPROPERTY()
    FSlateBrush Brush;

    FTestEUICanvasStruct()
    {
        return;
    }
}

class UTestEUICanvasClass : UObject
{
    UTestEUICanvasClass()
    {
        return;
    }
    UFUNCTION()
    FText GetText() const
    {
        return FText::FromString("Test");
    }
}

class UPage_TestEUICanvas : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TestEUICanvas> Test;
    UPROPERTY()
    FDataObjectPtr MarkConfigHandle;
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> MarkConfigPtr;
    UPROPERTY()
    UTestEUICanvasClass TestClass;
    UPROPERTY()
    UTestEUICanvasClass TestClass1;
    UPROPERTY()
    FTestEUICanvasStruct TestEUICanvasStruct;
    UPROPERTY()
    bool bTestBool;
    UPROPERTY()
    FConfigVM_TestEUICanvas TestConfig;
    UPROPERTY()
    FGetEUIModelRef TestDelegate;

    UPage_TestEUICanvas()
    {
        return;
    }
    UFUNCTION()
    FTestEUICanvasStruct GetTestEUICanvasStruct() const
    {
        FTestEUICanvasStruct __r;
        return __r;
    }
    UFUNCTION()
    bool GetTestBool() const
    {
        return true;
    }
    UFUNCTION()
    void Test_Add() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Test_Remove() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Test_TestSideHint() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Test_TestSmallSideHint() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Test_TestSideHintWithAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Test_TestLargeBuffSideHint() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Test_TestSmallBuffSideHint() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Test_OnAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Test.Initialize(this, FName("VM_TestEUICanvas"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TestDelegate.IsBound())
        {
            this.Test.SetRef(this.TestDelegate.Execute());
        }
        return;
    }
}

namespace UPage_TestEUICanvas_Conversions
{
UFUNCTION()
FText IntToText(const int Value)
{
    return FText::FromString(FString().Append(Value));
}
}
namespace UPage_TestEUICanvas
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
