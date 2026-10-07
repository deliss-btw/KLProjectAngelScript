
namespace UWidget_BuffHoverDialogItem
{
    const int ViewID = 0;

}
class UWidget_BuffHoverDialogItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BuffHoverDialogItem> BuffHoverDialog;
    UPROPERTY()
    FGetEUIModelRef BuffHoverDialogDelegate;

    UWidget_BuffHoverDialogItem()
    {
        return;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount1() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount1() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount2() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount2() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount3() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount3() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount4() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount4() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount5() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount5() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount6() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount6() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount7() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount7() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount8() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount8() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount9() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount9() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef BuffHoverDialog_VM_StackCount10() const
    {
        FVM_BuffHoverDialogItem& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_StackCount10() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BuffHoverDialog.Initialize(this, FName("VM_BuffHoverDialogItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BuffHoverDialogDelegate.IsBound())
        {
            this.BuffHoverDialog.SetRef(this.BuffHoverDialogDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BuffHoverDialogItem
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
