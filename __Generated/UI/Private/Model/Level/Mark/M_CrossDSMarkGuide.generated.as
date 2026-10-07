
namespace __FVM_CrossDSMarkGuideDialogHelper_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper> __ModelContainer_Require_FVM_CrossDSMarkGuideDialogHelper(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CrossDSMarkGuideDialogHelper(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CrossDSMarkGuideDialogHelper>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
