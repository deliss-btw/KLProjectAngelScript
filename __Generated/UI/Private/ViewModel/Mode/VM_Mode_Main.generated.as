

struct FConfigVM_Mode_Main : FConfigEUIModelBase
{
    UPROPERTY()
    FSoftBrush DefaultBG;

    FConfigVM_Mode_Main()
    {
        return;
    }
}

namespace __FVM_Mode_Main_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Mode_Main> __ModelContainer_Require_FVM_Mode_Main(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Mode_Main>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Mode_Main(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Mode_Main>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Mode_Main>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Mode_Main>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
