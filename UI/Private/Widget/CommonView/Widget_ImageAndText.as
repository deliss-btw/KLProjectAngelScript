
namespace UWidget_ImageAndText
{
    const int ViewID = 0;
}
namespace UWidget_ImageAndTitleAndDesc
{
    const int ViewID = 0;
}
namespace UWidget_TitleAndDesc
{
    const int ViewID = 0;
}
namespace UWidget_TitleAndDescWithBtn
{
    const int ViewID = 0;
}
namespace UWidget_ImageAndTitleAndDescAndAdditionalDesc
{
    const int ViewID = 0;
}
namespace UWidget_TitleAndDescAndStatus
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ImageAndText : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Image> Image;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Text> Text;
    UPROPERTY()
    FGetEUIModelRef ImageDelegate;
    UPROPERTY()
    FGetEUIModelRef TextDelegate;

    UWidget_ImageAndText()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Image.Initialize(this, FName("VM_Image"), EEUIWidgetRefModelCreationType(0), false);
        this.Text.Initialize(this, FName("VM_Text"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ImageDelegate.IsBound())
        {
            this.Image.SetRef(this.ImageDelegate.Execute());
        }
        if (this.TextDelegate.IsBound())
        {
            this.Text.SetRef(this.TextDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_ImageAndTitleAndDesc : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Image> Image;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TitleAndDesc> TitleAndDesc;
    UPROPERTY()
    FGetEUIModelRef ImageDelegate;
    UPROPERTY()
    FGetEUIModelRef TitleAndDescDelegate;

    UWidget_ImageAndTitleAndDesc()
    {
        return;
    }
    UFUNCTION()
    void TitleAndDesc_ExecuteOnClickGoTo() const
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
        this.Image.Initialize(this, FName("VM_Image"), EEUIWidgetRefModelCreationType(0), false);
        this.TitleAndDesc.Initialize(this, FName("VM_TitleAndDesc"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ImageDelegate.IsBound())
        {
            this.Image.SetRef(this.ImageDelegate.Execute());
        }
        if (this.TitleAndDescDelegate.IsBound())
        {
            this.TitleAndDesc.SetRef(this.TitleAndDescDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_TitleAndDesc : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TitleAndDesc> TitleAndDesc;
    UPROPERTY()
    FGetEUIModelRef TitleAndDescDelegate;

    UWidget_TitleAndDesc()
    {
        return;
    }
    UFUNCTION()
    void OnClickGoTo()
    {
        if (this.TitleAndDesc.IsValid())
        {
            OnClickGoTo();
        }
        return;
    }
    UFUNCTION()
    void TitleAndDesc_ExecuteOnClickGoTo() const
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
        this.TitleAndDesc.Initialize(this, FName("VM_TitleAndDesc"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TitleAndDescDelegate.IsBound())
        {
            this.TitleAndDesc.SetRef(this.TitleAndDescDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_TitleAndDescWithBtn : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TitleAndDesc> TitleAndDesc;
    UPROPERTY()
    FGetEUIModelRef TitleAndDescDelegate;

    UWidget_TitleAndDescWithBtn()
    {
        return;
    }
    UFUNCTION()
    void OnClickGoTo()
    {
        if (this.TitleAndDesc.IsValid())
        {
            OnClickGoTo();
        }
        return;
    }
    UFUNCTION()
    void TitleAndDesc_ExecuteOnClickGoTo() const
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
        this.TitleAndDesc.Initialize(this, FName("VM_TitleAndDesc"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TitleAndDescDelegate.IsBound())
        {
            this.TitleAndDesc.SetRef(this.TitleAndDescDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_ImageAndTitleAndDescAndAdditionalDesc : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Image> Image;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TitleAndDesc> TitleAndDesc;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Text> AdditionalDesc;
    UPROPERTY()
    FGetEUIModelRef ImageDelegate;
    UPROPERTY()
    FGetEUIModelRef TitleAndDescDelegate;
    UPROPERTY()
    FGetEUIModelRef AdditionalDescDelegate;

    UWidget_ImageAndTitleAndDescAndAdditionalDesc()
    {
        return;
    }
    UFUNCTION()
    void TitleAndDesc_ExecuteOnClickGoTo() const
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
        this.Image.Initialize(this, FName("VM_Image"), EEUIWidgetRefModelCreationType(0), false);
        this.TitleAndDesc.Initialize(this, FName("VM_TitleAndDesc"), EEUIWidgetRefModelCreationType(0), false);
        this.AdditionalDesc.Initialize(this, FName("VM_Text"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ImageDelegate.IsBound())
        {
            this.Image.SetRef(this.ImageDelegate.Execute());
        }
        if (this.TitleAndDescDelegate.IsBound())
        {
            this.TitleAndDesc.SetRef(this.TitleAndDescDelegate.Execute());
        }
        if (this.AdditionalDescDelegate.IsBound())
        {
            this.AdditionalDesc.SetRef(this.AdditionalDescDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_TitleAndDescAndStatus : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TitleAndDescAndStatus> TitleAndDescAndStatus;
    UPROPERTY()
    FText TitleName;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    FGetEUIModelRef TitleAndDescAndStatusDelegate;

    UWidget_TitleAndDescAndStatus()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.TitleAndDescAndStatus.IsValid())
        {
            this.TitleName = GetTitle();
            this.Desc = GetDesc();
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TitleAndDescAndStatus.Initialize(this, FName("VM_TitleAndDescAndStatus"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TitleAndDescAndStatusDelegate.IsBound())
        {
            this.TitleAndDescAndStatus.SetRef(this.TitleAndDescAndStatusDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ImageAndText
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
namespace UWidget_ImageAndTitleAndDesc
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
namespace UWidget_TitleAndDesc
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
namespace UWidget_TitleAndDescWithBtn
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
namespace UWidget_ImageAndTitleAndDescAndAdditionalDesc
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
namespace UWidget_TitleAndDescAndStatus
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
