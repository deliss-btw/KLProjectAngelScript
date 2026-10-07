
namespace FVMS_PendingConfirmQueue
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ShowFullList = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HideFullList = FEUIModelCallbackSignature();

}
struct FVMS_PendingConfirmQueue : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_PendingCount;
    UPROPERTY()
    ESlateVisibility m_QueueVisibility;
    UPROPERTY()
    TArray<FEUIModelContainer> m_PendingItemArray;
    UPROPERTY()
    bool m_bExpanded;
    UPROPERTY()
    TEUIModelRef<FMS_PendingConfirmMessage> m_Model;
    UPROPERTY()
    FEUIWidgetRef m_OpenedFullMessagePage;

    FVMS_PendingConfirmQueue()
    {
        this.m_PendingCount = 0;
        this.m_QueueVisibility = ESlateVisibility(1);
        this.m_bExpanded = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_PendingConfirmQueue(const FVMS_PendingConfirmQueue &inout Other)
    {
        this.m_PendingCount = 0;
        this.m_QueueVisibility = ESlateVisibility(1);
        this.m_bExpanded = false;
        this.m_PendingCount = int(Other.m_PendingCount);
        this.m_QueueVisibility = Other.m_QueueVisibility;
        this.m_PendingItemArray = Other.m_PendingItemArray;
        this.m_bExpanded = Other.m_bExpanded;
        this.m_Model = Other.m_Model;
        this.m_OpenedFullMessagePage = Other.m_OpenedFullMessagePage;
        return;
    }
    FVMS_PendingConfirmQueue& opAssign(const FVMS_PendingConfirmQueue &inout Other)
    {
        this.m_PendingCount = int(Other.m_PendingCount);
        this.m_QueueVisibility = Other.m_QueueVisibility;
        this.m_PendingItemArray = Other.m_PendingItemArray;
        this.m_bExpanded = Other.m_bExpanded;
        this.m_Model = Other.m_Model;
        return Other.m_OpenedFullMessagePage;
    }
    void PostConstruct()
    {
        this.SetModel(TEUIModelRef<FMS_PendingConfirmMessage>(::FMS_PendingConfirmMessage::Get(this.GetContext().Manager)));
        return;
    }
    void OnModelChanged()
    {
        this.UpdatePendingItems();
        return;
    }
    void UpdatePendingItems()
    {
        int local_4 = 0;
        int local_144;
        TEUIModelRef<FMS_PendingConfirmMessage> local_2 = this.GetModel();
        this.GetModify_PendingItemArray().Reset(0);
        for (auto& local_22 : local_4)
        {
            FPendingConfirmBubbleData local_70;
            local_70.CommonPopupId = int(local_22.CommonPopupId);
            local_70.SenderPlayerInfo = local_22.Player.opArrow().GetBriefInfo();
            local_70.StartTime = local_22.StartTime;
            local_70.EndTime = local_22.EndTime;
            local_70.Config = local_22.Config;
            FEUIModelContainer::MakeCached local_128;
            this.GetModify_PendingItemArray().Add(local_128.opImplConv());
        }
        this.SetPendingCount(local_4.Num());
        if (this.GetPendingCount() > 1)
        {
            int local_145;
            local_145 = 4;
            local_144 = local_145;
        }
        else
        {
            int local_145;
            local_145 = 1;
            local_144 = local_145;
        }
        this.SetQueueVisibility(ESlateVisibility(local_144));
        return;
    }
    FText GetPendingCountText() const
    {
        return FText::Format(NSLOCTEXT("PendingConfirm", "PendingCountFormat", "еѕ…е¤„зђ†пј€{0}пј‰"), this.GetPendingCount());
    }
    void ToggleExpanded()
    {
        this.SetbExpanded(!(this.GetbExpanded()));
        return;
    }
    void Collapse()
    {
        this.SetbExpanded(false);
        return;
    }
    void ShowFullList()
    {
        Get local_4;
        ULocalPlayer local_6 = local_4.opCall().UEPlayerController.GetLocalPlayer();
        FEUIWidget::AddWidget(local_6, GameplayTags::UI_Type_PendingConfirmQueue);
        this.ToggleExpanded();
        return;
    }
    void HideFullList()
    {
        FEUIWidget::RemoveWidget(this.GetOpenedFullMessagePage());
        this.SetOpenedFullMessagePage(FEUIWidgetRef());
        this.SetbExpanded(false);
        return;
    }
    int GetPendingCount() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PendingCount;
    }
    void SetPendingCount(const int __Value) property
    {
        if (this.m_PendingCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PendingCount = __Value;
        return;
    }
    ESlateVisibility GetQueueVisibility() const property
    {
        this.TrackPropertyRead(1);
        return this.m_QueueVisibility;
    }
    void SetQueueVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_QueueVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_QueueVisibility = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetPendingItemArray() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_PendingItemArray() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPendingItemArray(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PendingItemArray = __Value;
        return;
    }
    bool GetbExpanded() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bExpanded;
    }
    void SetbExpanded(const bool __Value) property
    {
        if (!(this.m_bExpanded) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bExpanded = __Value;
        return;
    }
    TEUIModelRef<FMS_PendingConfirmMessage> GetModel() const property
    {
        this.TrackPropertyRead(4);
        return this.m_Model;
    }
    void SetModel(const TEUIModelRef<FMS_PendingConfirmMessage> &inout __Value) property
    {
        TEUIModelRef<FMS_PendingConfirmMessage> local_2;
        local_2 = this.m_Model;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Model = __Value;
        return;
    }
    const FEUIWidgetRef GetOpenedFullMessagePage() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIWidgetRef GetModify_OpenedFullMessagePage() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetOpenedFullMessagePage(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_OpenedFullMessagePage = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_PendingConfirmQueue
{
    UPROPERTY()
    FText PendingCountText;
    UPROPERTY()
    TEUIModelRef<FVMS_PendingConfirmQueue> Self;

    __GeneratedProperties_FVMS_PendingConfirmQueue()
    {
        return;
    }
}

namespace FVMS_PendingConfirmQueue
{
FVMS_PendingConfirmQueue& Get(const UObject ContextObject)
{
    return FVMS_PendingConfirmQueue::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PendingConfirmQueue GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_PendingConfirmQueue __r;
    TEUIModelRef<FVMS_PendingConfirmQueue> local_6 = TEUIModelRef<FVMS_PendingConfirmQueue>(EUIInternal::MakeModelWithManager(Manager, FVMS_PendingConfirmQueue::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVMS_PendingConfirmQueue;
}
void __OnModelChanged(FVMS_PendingConfirmQueue &inout Model)
{
    Model.OnModelChanged();
    return;
}
int __UIGetter_PendingCount(const FVMS_PendingConfirmQueue &inout Model)
{
    return Model.GetPendingCount();
}
ESlateVisibility __UIGetter_QueueVisibility(const FVMS_PendingConfirmQueue &inout Model)
{
    return Model.GetQueueVisibility();
}
TArray<FEUIModelContainer> __UIGetter_PendingItemArray(const FVMS_PendingConfirmQueue &inout Model)
{
    return Model.GetPendingItemArray();
}
bool __UIGetter_bExpanded(const FVMS_PendingConfirmQueue &inout Model)
{
    return Model.GetbExpanded();
}
FText __UIGetter_PendingCountText(const FVMS_PendingConfirmQueue &inout Model)
{
    return Model.GetPendingCountText();
}
TEUIModelRef<FVMS_PendingConfirmQueue> __UIGetter_Self(const FVMS_PendingConfirmQueue &inout Model)
{
    return TEUIModelRef<FVMS_PendingConfirmQueue>(Model);
}
int __IndexOf_PendingCount()
{
    return 0;
}
int __IndexOf_QueueVisibility()
{
    return 1;
}
int __IndexOf_PendingItemArray()
{
    return 2;
}
int __IndexOf_bExpanded()
{
    return 3;
}
int __IndexOf_Model()
{
    return 4;
}
int __IndexOf_OpenedFullMessagePage()
{
    return 5;
}
}
namespace __GeneratedProperties_FVMS_PendingConfirmQueue
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
