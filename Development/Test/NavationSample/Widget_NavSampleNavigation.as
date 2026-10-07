
namespace UWidget_NavSampleIndex
{
    const int ViewID = 0;
}
namespace UWidget_NavSamplePageBase
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_NavSampleIndex : UEUIActivatableWidget
{
    UWidget_NavSampleIndex()
    {
        return;
    }
    UFUNCTION()
    void OpenSample01()
    {
        this.OpenSample(1);
        return;
    }
    UFUNCTION()
    void OpenSample02()
    {
        this.OpenSample(2);
        return;
    }
    UFUNCTION()
    void OpenSample03()
    {
        this.OpenSample(3);
        return;
    }
    UFUNCTION()
    void OpenSample04()
    {
        this.OpenSample(4);
        return;
    }
    UFUNCTION()
    void OpenSample05()
    {
        this.OpenSample(5);
        return;
    }
    UFUNCTION()
    void OpenSample06()
    {
        this.OpenSample(6);
        return;
    }
    UFUNCTION()
    void OpenSample07()
    {
        this.OpenSample(7);
        return;
    }
    UFUNCTION()
    void OpenSample08()
    {
        this.OpenSample(8);
        return;
    }
    UFUNCTION()
    void OpenSample09()
    {
        this.OpenSample(9);
        return;
    }
    void OpenSample(const int SampleIndex)
    {
        this.OpenNavigationPage(::NavSampleNavigationUtils::GetSampleWidgetClass(SampleIndex));
        return;
    }
    void OpenNavigationPage(const TSoftClassPtr<UEUIUserWidget> &inout PageWidgetClass)
    {
        if (!(PageWidgetClass.IsNull()))
        {
            this.OpenPage(PageWidgetClass);
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_NavSamplePageBase : UEUIActivatableWidget
{
    UPROPERTY()
    int SampleIndex = 1;
    UPROPERTY()
    FEUIActionBinding PreviousSampleActionBinding;
    UPROPERTY()
    FEUIActionBinding NextSampleActionBinding;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.PreviousSampleActionBinding.Register(this, n"OpenPreviousSample");
        this.NextSampleActionBinding.Register(this, n"OpenNextSample");
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        this.PreviousSampleActionBinding.UnRegister();
        this.NextSampleActionBinding.UnRegister();
        return;
    }
    UFUNCTION()
    void OpenPreviousSample()
    {
        if (this.SampleIndex <= 1)
        {
            this.OpenIndex();
            return;
        }
        this.OpenSample((this.SampleIndex - 1));
        return;
    }
    UFUNCTION()
    void OpenNextSample()
    {
        if (this.SampleIndex >= 9)
        {
            this.OpenIndex();
            return;
        }
        this.OpenSample((this.SampleIndex + 1));
        return;
    }
    void OpenIndex()
    {
        this.OpenNavigationPage(::NavSampleNavigationUtils::GetIndexWidgetClass());
        return;
    }
    void OpenSample(const int TargetSampleIndex)
    {
        this.OpenNavigationPage(::NavSampleNavigationUtils::GetSampleWidgetClass(TargetSampleIndex));
        return;
    }
    void OpenNavigationPage(const TSoftClassPtr<UEUIUserWidget> &inout PageWidgetClass)
    {
        if (!(PageWidgetClass.IsNull()))
        {
            this.OpenPage(PageWidgetClass);
            this.ClosePage(false);
        }
        return;
    }
}

namespace NavSampleNavigationUtils
{
TSoftClassPtr<UEUIUserWidget> GetIndexWidgetClass()
{
    return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_00_Index.UI_NavSample_00_Index");
}
TSoftClassPtr<UEUIUserWidget> GetSampleWidgetClass(const int SampleIndex)
{
    if (SampleIndex == 1)
    {
        return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_01_DefaultUENavigation.UI_NavSample_01_DefaultUENavigation");
    }
    if (SampleIndex == 2)
    {
        return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_02_ExplicitDirection.UI_NavSample_02_ExplicitDirection");
    }
    if (SampleIndex == 3)
    {
        return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_03_BoundaryAction.UI_NavSample_03_BoundaryAction");
    }
    if (SampleIndex == 4)
    {
        return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_04_BoundaryTarget.UI_NavSample_04_BoundaryTarget");
    }
    if (SampleIndex == 5)
    {
        return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_05_DomainVsNonDomain.UI_NavSample_05_DomainVsNonDomain");
    }
    if (SampleIndex == 6)
    {
        return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_06_FocusRoutingPolicy.UI_NavSample_06_FocusRoutingPolicy");
    }
    if (SampleIndex == 7)
    {
        return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_07_TransferReturn.UI_NavSample_07_TransferReturn");
    }
    if (SampleIndex == 8)
    {
        return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_08_ListNavigation.UI_NavSample_08_ListNavigation");
    }
    if (SampleIndex == 9)
    {
        return UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Test/UI/UMG/NavigationSample/UI_NavSample_09_NextPrevious.UI_NavSample_09_NextPrevious");
    }
    else
    {
        return TSoftClassPtr<UEUIUserWidget>();
    }
}
}
namespace UWidget_NavSampleIndex
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
namespace UWidget_NavSamplePageBase
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
