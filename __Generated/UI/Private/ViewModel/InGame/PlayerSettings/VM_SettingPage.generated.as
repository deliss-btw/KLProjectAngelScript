

struct FVMS_SettingPageConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    UCameraSettings CameraSettings;

    FVMS_SettingPageConfigDefault()
    {
        return;
    }
}

struct FOnSettingsChanged : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FOnSettingsChanged()
    {
        FEUIModelEvent local_22 = FEUIModelEvent("", "");
        return;
    }
    void Broadcast() const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast();
        return;
    }
}

namespace __FVM_SettingSystemMainState_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SettingSystemMainState> __ModelContainer_Require_FVM_SettingSystemMainState(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SettingSystemMainState>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SettingSystemMainState(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SettingSystemMainState>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SettingSystemMainState>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SettingSystemMainState>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVMS_SettingPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_SettingPage> __ModelContainer_Require_FVMS_SettingPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_SettingPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_SettingPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_SettingPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_SettingPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_SettingPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
