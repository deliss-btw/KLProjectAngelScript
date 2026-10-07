
namespace __FVM_CommonDropdownOption_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonDropdownOption> __ModelContainer_Require_FVM_CommonDropdownOption(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonDropdownOption>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonDropdownOption(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonDropdownOption>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonDropdownOption>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonDropdownOption>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonDropdownList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonDropdownList> __ModelContainer_Require_FVM_CommonDropdownList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonDropdownList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonDropdownList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonDropdownList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonDropdownList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonDropdownList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonDropdownButton_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonDropdownButton> __ModelContainer_Require_FVM_CommonDropdownButton(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonDropdownButton>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonDropdownButton(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonDropdownButton>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonDropdownButton>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonDropdownButton>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
