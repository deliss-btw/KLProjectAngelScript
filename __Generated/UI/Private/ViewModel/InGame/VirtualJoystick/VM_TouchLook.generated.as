

struct FConfigVM_TouchLook : FConfigEUIModelBase
{
    UPROPERTY()
    FKey YAxis;
    UPROPERTY()
    float32 LookSensitivity = 1.5f;
    UPROPERTY()
    FKey XAxis;


}

namespace __FVM_TouchLook_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TouchLook> __ModelContainer_Require_FVM_TouchLook(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TouchLook>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TouchLook(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TouchLook>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TouchLook>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TouchLook>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
