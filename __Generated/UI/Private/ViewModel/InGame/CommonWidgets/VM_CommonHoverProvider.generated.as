

struct FConfigVM_CommonHoverProvider : FConfigEUIModelBase
{
    UPROPERTY()
    bool bFocusHover = true;
    UPROPERTY()
    bool bClickForExecute = false;
    UPROPERTY()
    FGameplayTag SubPageTag;
    UPROPERTY()
    ECommonHoverLayout HoverLayout = ECommonHoverLayout(0);
    UPROPERTY()
    bool bIsForbidHover = false;
    UPROPERTY()
    bool bClickOpenPinnedPassThrough = false;
    UPROPERTY()
    bool bResponsibleForClick = true;


}

namespace __FVM_CommonHoverProvider_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonHoverProvider> __ModelContainer_Require_FVM_CommonHoverProvider(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonHoverProvider>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonHoverProvider(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonHoverProvider>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonHoverProvider>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonHoverProvider>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
