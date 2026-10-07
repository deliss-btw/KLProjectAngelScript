

struct FVM_BuffInfoConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> RoundBuffWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> NormalBuffWidgetClass;

    FVM_BuffInfoConfigDefault()
    {
        return;
    }
}

namespace __FVM_BuffInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BuffInfo> __ModelContainer_Require_FVM_BuffInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BuffInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BuffInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BuffInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BuffInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BuffInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
