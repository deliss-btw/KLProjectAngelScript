

struct FVMS_TeamPanelConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    FBuffConfigRef ExecuteBuffRef;

    FVMS_TeamPanelConfigDefault()
    {
        return;
    }
}

namespace __FVMS_TeamPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_TeamPanel> __ModelContainer_Require_FVMS_TeamPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_TeamPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_TeamPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_TeamPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_TeamPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_TeamPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
