

struct FVMS_CustomWheelConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    TArray<TDataObjectPtr<FCustomWheelOptionConfig>> OptionConfigs;

    FVMS_CustomWheelConfigDefault()
    {
        return;
    }
}

namespace __FVM_CustomWheelOptionButton_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CustomWheelOptionButton> __ModelContainer_Require_FVM_CustomWheelOptionButton(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CustomWheelOptionButton>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CustomWheelOptionButton(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CustomWheelOptionButton>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CustomWheelOptionButton>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CustomWheelOptionButton>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVMS_CustomWheel_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_CustomWheel> __ModelContainer_Require_FVMS_CustomWheel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_CustomWheel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_CustomWheel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_CustomWheel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_CustomWheel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_CustomWheel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
