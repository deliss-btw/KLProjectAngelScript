
namespace __FVM_Weather_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Weather> __ModelContainer_Require_FVM_Weather(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Weather>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Weather(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Weather>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Weather>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Weather>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVMS_CurrentWeather_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_CurrentWeather> __ModelContainer_Require_FVMS_CurrentWeather(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_CurrentWeather>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_CurrentWeather(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_CurrentWeather>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_CurrentWeather>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_CurrentWeather>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
