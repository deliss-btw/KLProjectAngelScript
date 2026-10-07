

struct FConfigVM_CameraModifier : FConfigEUIModelBase
{
    UPROPERTY()
    FPresentationCameraConfig CameraConfig;

    FConfigVM_CameraModifier()
    {
        return;
    }
}

namespace __FVM_CameraModifier_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CameraModifier> __ModelContainer_Require_FVM_CameraModifier(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CameraModifier>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CameraModifier(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CameraModifier>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CameraModifier>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CameraModifier>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
