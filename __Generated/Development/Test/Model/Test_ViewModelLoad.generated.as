

struct FConfigVM_TestLoad0 : FConfigEUIModelBase
{
    UPROPERTY()
    int Value0;


}

struct FConfigVM_TestLoad1 : FConfigEUIModelBase
{
    UPROPERTY()
    int Value1;
    UPROPERTY()
    int Value1Config;


}

struct FConfigVM_TestLoad2 : FConfigEUIModelBase
{
    UPROPERTY()
    int Value2;


}

namespace __FVM_TestLoad0_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TestLoad0> __ModelContainer_Require_FVM_TestLoad0(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TestLoad0>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TestLoad0(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TestLoad0>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TestLoad0>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TestLoad0>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TestLoad1_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TestLoad1> __ModelContainer_Require_FVM_TestLoad1(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TestLoad1>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TestLoad1(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TestLoad1>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TestLoad1>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TestLoad1>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TestLoad2_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TestLoad2> __ModelContainer_Require_FVM_TestLoad2(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TestLoad2>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TestLoad2(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TestLoad2>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TestLoad2>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TestLoad2>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TestLoad3_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TestLoad3> __ModelContainer_Require_FVM_TestLoad3(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TestLoad3>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TestLoad3(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TestLoad3>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TestLoad3>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TestLoad3>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
