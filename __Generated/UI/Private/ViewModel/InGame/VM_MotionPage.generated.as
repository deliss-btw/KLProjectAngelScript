

struct FVMS_MotionPageConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    UDataTable MotionDataTable;

    FVMS_MotionPageConfigDefault()
    {
        return;
    }
}

namespace __FVMS_MotionPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_MotionPage> __ModelContainer_Require_FVMS_MotionPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_MotionPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_MotionPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_MotionPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_MotionPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_MotionPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
