
namespace UWidget_DebugKeyState
{
    const int ViewID = 0;

}
class UWidget_DebugKeyState : UEUIUserWidget
{
    UPROPERTY()
    UTextBlock KeyW;
    UPROPERTY()
    UTextBlock KeyA;
    UPROPERTY()
    UTextBlock KeyS;
    UPROPERTY()
    UTextBlock KeyD;
    UPROPERTY()
    UTextBlock KeyShift;
    UPROPERTY()
    UTextBlock KeyTab;
    UPROPERTY()
    UTextBlock KeySpace;
    UPROPERTY()
    UTextBlock KeyX;
    UPROPERTY()
    UTextBlock KeyQ;
    UPROPERTY()
    UTextBlock KeyE;
    UPROPERTY()
    UTextBlock KeyR;
    UPROPERTY()
    UTextBlock KeyG;
    UPROPERTY()
    UTextBlock KeyT;
    UPROPERTY()
    UTextBlock KeyF;
    UPROPERTY()
    UTextBlock ML;
    UPROPERTY()
    UTextBlock MM;
    UPROPERTY()
    UTextBlock MR;
    UPROPERTY()
    UTextBlock Key1;
    UPROPERTY()
    UTextBlock Key2;
    UPROPERTY()
    UTextBlock Key3;
    UPROPERTY()
    UTextBlock Key4;

    UWidget_DebugKeyState()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        float local_8;
        float local_10;
        APlayerController local_2 = this.GetOwningPlayer();
        if ((!((local_2 != nullptr))))
        {
            return;
        }
        if (local_2.IsInputKeyDown(EKeys::W))
        {
            local_8 = 0.3;
        }
        else
        {
            local_8 = 0.1;
        }
        this.KeyW.SetOpacity(float32(local_8));
        if (local_2.IsInputKeyDown(EKeys::A))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyA.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::S))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyS.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::D))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyD.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::LeftShift))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyShift.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::Tab))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyTab.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::SpaceBar))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeySpace.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::X))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyX.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::Q))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyQ.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::E))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyE.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::R))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyR.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::G))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyG.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::T))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyT.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::F))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.KeyF.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::LeftMouseButton))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.ML.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::MiddleMouseButton))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.MM.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::RightMouseButton))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.MR.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::One))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.Key1.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::Two))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.Key2.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::Three))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.Key3.SetOpacity(float32(local_10));
        if (local_2.IsInputKeyDown(EKeys::Four))
        {
            local_10 = 0.3;
        }
        else
        {
            local_10 = 0.1;
        }
        this.Key4.SetOpacity(float32(local_10));
        return;
    }
}

namespace UWidget_DebugKeyState
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
