
namespace __FVM_AvatarWardrobeSlotItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarWardrobeSlotItem> __ModelContainer_Require_FVM_AvatarWardrobeSlotItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarWardrobeSlotItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarWardrobeSlotItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarWardrobeSlotItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarWardrobeSlotItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarWardrobeFashionOption_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarWardrobeFashionOption> __ModelContainer_Require_FVM_AvatarWardrobeFashionOption(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarWardrobeFashionOption>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarWardrobeFashionOption(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarWardrobeFashionOption>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarWardrobeFashionOption>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarWardrobeFashionOption>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarMainWardrobe_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarMainWardrobe> __ModelContainer_Require_FVM_AvatarMainWardrobe(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarMainWardrobe>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarMainWardrobe(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarMainWardrobe>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarMainWardrobe>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarMainWardrobe>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarWardrobeEntrance_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarWardrobeEntrance> __ModelContainer_Require_FVM_AvatarWardrobeEntrance(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarWardrobeEntrance>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarWardrobeEntrance(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarWardrobeEntrance>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarWardrobeEntrance>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarWardrobeEntrance>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
