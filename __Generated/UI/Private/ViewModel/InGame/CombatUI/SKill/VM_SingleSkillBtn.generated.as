
namespace __FVM_SingleSkillBtn_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SingleSkillBtn> __ModelContainer_Require_FVM_SingleSkillBtn(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SingleSkillBtn>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SingleSkillBtn(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SingleSkillBtn>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SingleSkillBtn>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SingleSkillBtn>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_SkillBtnSpecialCountItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SkillBtnSpecialCountItem> __ModelContainer_Require_FVM_SkillBtnSpecialCountItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SkillBtnSpecialCountItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SkillBtnSpecialCountItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SkillBtnSpecialCountItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SkillBtnSpecialCountItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_SkillBtnSpecialCounts_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SkillBtnSpecialCounts> __ModelContainer_Require_FVM_SkillBtnSpecialCounts(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SkillBtnSpecialCounts>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SkillBtnSpecialCounts(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SkillBtnSpecialCounts>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SkillBtnSpecialCounts>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SkillBtnSpecialCounts>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_NormalSkillBtn_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_NormalSkillBtn> __ModelContainer_Require_FVM_NormalSkillBtn(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_NormalSkillBtn>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_NormalSkillBtn(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_NormalSkillBtn>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_NormalSkillBtn>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_NormalSkillBtn>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_SpecialSkillBtn_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SpecialSkillBtn> __ModelContainer_Require_FVM_SpecialSkillBtn(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SpecialSkillBtn>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SpecialSkillBtn(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SpecialSkillBtn>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SpecialSkillBtn>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SpecialSkillBtn>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonSkillBtn_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonSkillBtn> __ModelContainer_Require_FVM_CommonSkillBtn(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonSkillBtn>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonSkillBtn(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonSkillBtn>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonSkillBtn>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonSkillBtn>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TSkillBtn_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TSkillBtn> __ModelContainer_Require_FVM_TSkillBtn(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TSkillBtn>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TSkillBtn(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TSkillBtn>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TSkillBtn>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TSkillBtn>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
