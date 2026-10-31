namespace FInteractUIPageUtils
{
void OpenPageByInteractTarget(const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const FGameplayTag &inout WidgetTag, const TSoftClassPtr<UEUIUserWidget> &inout PageWidget)
{
    int local_6 = 0;
    int local_22 = 0;
    if (local_6.OpenedPage.IsLayoutLayerWidget())
    {
        XWarning(ELog(16), FString().Append("Page already opened on target ").Append(InteractTarget));
        return;
    }
    FECSWorldPtr local_16 = ECS::GetECSWorld();
    if (WidgetTag.IsValid())
    {
        Remove local_46;
        if ((WidgetTag == GameplayTags::UI_Type_SocialViewPage))
        {
            FVM_SocialViewPage::PrepareFromWorldInteract(local_22.UEPlayerController.GetLocalPlayer(), InteractTarget);
        }
        FEUIWidgetRef local_40 = ECSWorldLifetimePage::Open(WidgetTag, FEUIModelContainer(FVM_InteractTarget::Create(local_22.UEPlayerController.GetLocalPlayer(), InteractTarget)));
        if (!(local_40.IsValid()))
        {
            XError(ELog(16), FString().Append("Failed to open ui by interact, widget tag=").Append(WidgetTag));
            local_46.opCall();
            return;
        }
        local_6.OpenedPage = local_40;
        FEUIWidgetRef::GetViewModel local_52;
        FVM_ThreeChooseOne& local_48 = local_52.opCall(NAME_None);
        if (local_48)
        {
            local_48.SetupThreeChooseOneInfo(InteractTarget);
        }
    }
    else
    {
        Remove local_46;
        FEUIWidgetRef local_42 = ECSWorldLifetimePage::OpenByClass(PageWidget);
        if (!(local_42.IsValid()))
        {
            XError(ELog(16), FString().Append("Failed to open ui by interact, widget=").Append(PageWidget));
            local_46.opCall();
            return;
        }
        local_6.OpenedPage = local_42;
        local_6.OpenedPage.AppendViewModel(FEUIModelRef(FVM_InteractTarget::Create(local_22.UEPlayerController.GetLocalPlayer(), InteractTarget)), NAME_None);
    }
    local_6.InteractSourceControllerEntity = local_22.PlayerEntity;
    local_6.InteractTargetPointAndBehaviorIndex = InteractTargetPointAndBehaviorIndex;
    return;
}
void ClosePageByInteractTarget(const FECSEntity &inout InteractTarget)
{
    int local_6 = 0;
    int local_16 = 0;
    if (!(local_6))
    {
        return;
    }
    FECSWorldPtr local_10 = ECS::GetECSWorld();
    APlayerController local_18 = local_16.UEPlayerController;
    if ((!((local_18 != nullptr))))
    {
        return;
    }
    FEUIWidgetRef local_20 = local_6.OpenedPage;
    Remove local_24;
    local_24.opCall();
    ECSWorldLifetimePage::Close(local_20);
    return;
}
}
