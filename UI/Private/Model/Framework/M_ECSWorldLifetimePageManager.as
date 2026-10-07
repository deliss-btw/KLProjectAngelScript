
namespace FMS_ECSWorldLifetimePageManager
{
    const int ModelId = 0;

}
struct FMS_ECSWorldLifetimePageManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<FEUIWidgetRef> OpenedPages;

    FMS_ECSWorldLifetimePageManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_ECSWorldLifetimePageManager(const FMS_ECSWorldLifetimePageManager &inout Other)
    {
        return;
    }
    FMS_ECSWorldLifetimePageManager opAssign(const FMS_ECSWorldLifetimePageManager &inout Other)
    {
        FMS_ECSWorldLifetimePageManager __r;
        return __r;
    }
    FEUIWidgetRef OpenPageByTag(const FGameplayTag &inout PageTag, const FEUIModelContainer &inout Models)
    {
        FEUIWidgetRef local_2 = FEUIWidget::AddWidgetWithModelContainer(this.GetContext().UELocalPlayer, PageTag, Models);
        if (local_2.IsValid())
        {
            this.OpenedPages.Add(local_2);
        }
        return local_2;
    }
    FEUIWidgetRef OpenPageByClass(const TSoftClassPtr<UEUIUserWidget> &inout PageClass)
    {
        FEUIWidgetRef local_2 = FEUIWidget::AddWidgetByClass(this.GetContext().UELocalPlayer, PageClass);
        if (local_2.IsValid())
        {
            this.OpenedPages.Add(local_2);
        }
        return local_2;
    }
    void ClosePage(const FEUIWidgetRef &inout PageRef)
    {
        FEUIWidget::RemoveWidget(PageRef);
        this.CompactOpenedPages();
        return;
    }
    void CloseAllPages()
    {
        int local_1 = 0;
        for (; local_1 < this.OpenedPages.Num(); )
        {
            FEUIWidget::RemoveWidget(this.OpenedPages[local_1]);
            ++local_1;
        }
        this.OpenedPages.Empty(0);
        return;
    }
    void CompactOpenedPages()
    {
        int local_4 = this.OpenedPages.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (!(this.OpenedPages[local_4].IsValid()))
            {
                this.OpenedPages.RemoveAt(local_4);
            }
        }
        return;
    }
    void OnECSWorldRequireCleanUp(const FMsg_ECSWorldRequireCleanUp &inout Msg)
    {
        this.CloseAllPages();
        return;
    }
    void BeginDestroy()
    {
        this.CloseAllPages();
        return;
    }
}

namespace FMS_ECSWorldLifetimePageManager
{
FMS_ECSWorldLifetimePageManager& Get(const UObject ContextObject)
{
    return FMS_ECSWorldLifetimePageManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_ECSWorldLifetimePageManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_ECSWorldLifetimePageManager __r;
    TEUIModelRef<FMS_ECSWorldLifetimePageManager> local_6 = TEUIModelRef<FMS_ECSWorldLifetimePageManager>(EUIInternal::MakeModelWithManager(Manager, FMS_ECSWorldLifetimePageManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnECSWorldRequireCleanUp";
    local_14.MessageTypeName = "Msg_ECSWorldRequireCleanUp";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_ECSWorldLifetimePageManager;
}
void __OnECSWorldRequireCleanUp(FMS_ECSWorldLifetimePageManager &inout Model, const FMsg_ECSWorldRequireCleanUp &inout Message)
{
    Model.OnECSWorldRequireCleanUp(Message);
    return;
}
}
