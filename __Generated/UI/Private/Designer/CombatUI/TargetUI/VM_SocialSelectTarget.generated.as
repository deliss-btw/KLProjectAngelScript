
namespace __FVMS_SocialSelectTarget_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_SocialSelectTarget> __ModelContainer_Require_FVMS_SocialSelectTarget(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_SocialSelectTarget>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_SocialSelectTarget(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_SocialSelectTarget>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_SocialSelectTarget>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_SocialSelectTarget>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
