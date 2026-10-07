
enum ECommonHoverCloseReason
{
    HoverOnly,
    FocusLoss,
    Explicit,
    OwnerDestroy,
}

namespace FMS_CommonHoverManager
{
    const int ModelId = 0;

}
struct FCommonHoverNode
{
    UPROPERTY()
    FCommonHoverHandle Handle;
    UPROPERTY()
    FCommonHoverHandle ParentHandle;
    UPROPERTY()
    FCommonHoverHandle ActiveChildHandle;
    UPROPERTY()
    bool bPinned = false;
    UPROPERTY()
    int StackRootKey = 0;
    UPROPERTY()
    int WidgetRootKey = 0;
    UPROPERTY()
    bool bPendingWeakClose = false;


}

struct FCommonHoverRootNode
{
    UPROPERTY()
    int StackRootKey = 0;
    UPROPERTY()
    FCommonHoverHandle ActiveHover;


}

struct FMS_CommonHoverManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<FCommonHoverHandle> m_DisplayingHovers;
    UPROPERTY()
    TArray<FCommonHoverNode> m_HoverNodes;
    UPROPERTY()
    TArray<FCommonHoverRootNode> m_RootHoverNodes;
    UPROPERTY()
    TArray<FCommonHoverHandle> m_ClosingHovers;

    FMS_CommonHoverManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommonHoverManager(const FMS_CommonHoverManager &inout Other)
    {
        this.m_DisplayingHovers = Other.m_DisplayingHovers;
        this.m_HoverNodes = Other.m_HoverNodes;
        this.m_RootHoverNodes = Other.m_RootHoverNodes;
        this.m_ClosingHovers = Other.m_ClosingHovers;
        return;
    }
    FMS_CommonHoverManager& opAssign(const FMS_CommonHoverManager &inout Other)
    {
        this.m_DisplayingHovers = Other.m_DisplayingHovers;
        this.m_HoverNodes = Other.m_HoverNodes;
        this.m_RootHoverNodes = Other.m_RootHoverNodes;
        return Other.m_ClosingHovers;
    }
    FCommonHoverHandle OpenHover(const FCommonHoverInfo &inout InHoverInfo)
    {
        FCommonHoverHandle __r;
        this.CleanupInvalidHovers();
        FCommonHoverHandle local_4 = this.ResolveParentHoverHandle(InHoverInfo);
        if (local_4.IsValid() && !(this.IsHoverDisplayed(local_4)))
        {
        }
        else
        {
            int local_8 = this.ResolveStackRootKey(InHoverInfo, local_4);
            FCommonHoverHandle local_2 = this.GetActiveChild(local_4, local_8);
            if (!(local_4.IsValid()) && local_2.IsValid() && this.BlocksSiblingHover(local_2))
            {
            }
            else
            {
                if (local_4.IsValid() && local_2.IsValid() && this.BlocksSiblingHover(local_2) && !(InHoverInfo.BlocksSiblingHover()))
                {
                }
                else
                {
                    this.CloseActiveChild(local_4, local_8);
                    FCommonHoverHandle local_10 = this.OpenHoverWidget(InHoverInfo, local_4);
                    this.TrackHover(local_10, local_4, local_8, this.GetHoverWidgetRootKey(local_10), InHoverInfo.bPinned);
                }
            }
        }
        return __r;
    }
    FCommonHoverHandle OpenHoverWidget(const FCommonHoverInfo &inout InHoverInfo, const FCommonHoverHandle &inout ParentHandle)
    {
        FCommonHoverHandle __r;
        FVM_CommonHover& local_2 = ::FVM_CommonHover::Create(this.GetContext().Manager);
        local_2.SetAnchorsViewportSpace(InHoverInfo.AnchorsViewportSpace);
        local_2.SetContentWidget(InHoverInfo.ContentWidget);
        local_2.SetContentModels(InHoverInfo.ContentModels);
        local_2.SetbClickClose(InHoverInfo.bClickClose);
        local_2.SetOutsideCloseMode(InHoverInfo.OutsideCloseMode);
        local_2.SetbFocusHover(InHoverInfo.bFocusHover);
        local_2.SetHoverLayout(InHoverInfo.HoverLayout);
        local_2.SetParentHoverHandle(ParentHandle);
        local_2.SetCloseScopeInsideWidget(InHoverInfo.CloseScopeInsideWidget);
        local_2.SetHoverLimitationViewportSpaceOverride(InHoverInfo.HoverLimitationViewportSpaceOverride);
        FEUIWidgetRef local_12 = FEUIWidget::AddWidgetWithLayerOverride(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_CommonHover, InHoverInfo.TargetLayer, FEUIModelRef(local_2));
        this.GetModify_DisplayingHovers().Add(FCommonHoverHandle(local_12));
        local_2.SetHoverHandle(this.GetDisplayingHovers().Last(0));
        return __r;
    }
    void CloseHover(const FCommonHoverHandle &inout Handle)
    {
        this.CloseHoverSubtree(Handle);
        return;
    }
    bool ShouldKeepHoverForCloseReason(const FCommonHoverHandle &inout Handle, const ECommonHoverCloseReason Reason)
    {
        if (!(Handle.IsValid()))
        {
            return false;
        }
        if (int(Reason) == 2 || (int(Reason) == 3))
        {
            return false;
        }
        if (this.IsHoverStackCloseProtected(Handle))
        {
            this.ClearPendingWeakClose(Handle);
            return true;
        }
        bool local_4 = (int(Reason) == 0) && this.HasDisplayedActiveChild(Handle);
        if (local_4)
        {
            this.MarkPendingWeakClose(Handle);
        }
        return local_4;
    }
    void HandleHoverWidgetUnbound(const FCommonHoverHandle &inout Handle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void CloseHoverSingle(const FCommonHoverHandle &inout Handle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FCommonHoverInfo GetHover(const FCommonHoverHandle &inout Handle) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FCommonHoverInfo __r; return __r;
    }
    void SetHover(const FCommonHoverHandle &inout Handle, const FCommonHoverInfo &inout InHoverInfo)
    {
        if (Handle)
        {
            FEUIWidgetRef::GetViewModel local_6;
            FVM_CommonHover& local_8 = local_6.opCall(NAME_None);
            if (local_8)
            {
                local_8.SetAnchorsViewportSpace(InHoverInfo.AnchorsViewportSpace);
                local_8.SetContentWidget(InHoverInfo.ContentWidget);
                local_8.SetContentModels(InHoverInfo.ContentModels);
                local_8.SetbClickClose(InHoverInfo.bClickClose);
                local_8.SetOutsideCloseMode(InHoverInfo.OutsideCloseMode);
                local_8.SetbFocusHover(InHoverInfo.bFocusHover);
                local_8.SetHoverLayout(InHoverInfo.HoverLayout);
                local_8.SetParentHoverHandle(InHoverInfo.ParentHoverHandle);
                local_8.SetCloseScopeInsideWidget(InHoverInfo.CloseScopeInsideWidget);
                local_8.SetHoverLimitationViewportSpaceOverride(InHoverInfo.HoverLimitationViewportSpaceOverride);
                this.SetHoverPinned(Handle, InHoverInfo.bPinned);
            }
        }
        return;
    }
    void CloseAllHover()
    {
        TArray<FCommonHoverHandle> local_4;
        for (auto local_20 : this.GetDisplayingHovers())
        {
            this.CollectHoverSubtree(local_20, local_4);
        }
        for (auto local_20 : local_4)
        {
            this.CloseHoverSingle(local_20);
        }
        this.GetModify_DisplayingHovers().Empty(0);
        this.GetModify_HoverNodes().Empty(0);
        this.GetModify_ClosingHovers().Empty(0);
        this.GetModify_RootHoverNodes().Empty(0);
        return;
    }
    void CleanupInvalidHovers()
    {
        int local_4 = this.GetDisplayingHovers().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (!(this.GetDisplayingHovers()[local_4].WidgetRef.IsValid()))
            {
                this.UntrackHover(this.GetDisplayingHovers()[local_4]);
                this.GetModify_DisplayingHovers().RemoveAt(local_4);
            }
        }
        int local_3 = this.GetHoverNodes().Num() - 1;
        for (; local_3 >= 0; --local_3)
        {
            if (!(this.IsHoverDisplayed(this.GetHoverNodes()[local_3].Handle)))
            {
                this.UntrackHover(this.GetHoverNodes()[local_3].Handle);
            }
        }
        return;
    }
    void TrackHover(const FCommonHoverHandle &inout Handle, const FCommonHoverHandle &inout ParentHandle, const int StackRootKey, const int WidgetRootKey, const bool bPinned)
    {
        if (!(Handle.IsValid()))
        {
            return;
        }
        FCommonHoverNode local_12;
        local_12.bPinned = bPinned;
        local_12.StackRootKey = StackRootKey;
        local_12.WidgetRootKey = WidgetRootKey;
        local_12.bPendingWeakClose = false;
        this.GetModify_HoverNodes().Add(local_12);
        this.SetActiveChild(ParentHandle, StackRootKey, Handle);
        return;
    }
    void UntrackHover(const FCommonHoverHandle &inout Handle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void MarkPendingWeakClose(const FCommonHoverHandle &inout Handle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ClearPendingWeakClose(const FCommonHoverHandle &inout Handle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void TryClosePendingWeakHover(const FCommonHoverHandle &inout Handle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RemoveDisplayedHover(const FCommonHoverHandle &inout Handle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RemoveClosingHover(const FCommonHoverHandle &inout Handle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void CloseActiveChild(const FCommonHoverHandle &inout ParentHandle, const int StackRootKey)
    {
        FCommonHoverHandle local_4 = this.GetActiveChild(ParentHandle, StackRootKey);
        if (local_4.IsValid())
        {
            this.CloseHoverSubtree(local_4);
        }
        return;
    }
    void CloseHoverSubtree(const FCommonHoverHandle &inout Handle)
    {
        if (!(Handle.IsValid()))
        {
            return;
        }
        TArray<FCommonHoverHandle> local_6;
        this.CollectHoverSubtree(Handle, local_6);
        for (auto& local_20 : local_6)
        {
            this.CloseHoverSingle(local_20);
        }
        return;
    }
    void CollectHoverSubtree(const FCommonHoverHandle &inout Handle, TArray<FCommonHoverHandle> &inout OutHandles) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SetActiveChild(const FCommonHoverHandle &inout ParentHandle, const int StackRootKey, const FCommonHoverHandle &inout ChildHandle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SyncDisplayedChildToHoverModel(const FCommonHoverHandle &inout HoverHandle, const FCommonHoverHandle &inout ChildHandle)
    {
        FEUIWidgetRef::GetViewModel local_4;
        FVM_CommonHover& local_6 = local_4.opCall(NAME_None);
        if (local_6)
        {
            local_6.SetDisplayedChildHoverHandle(ChildHandle);
        }
        return;
    }
    FCommonHoverHandle GetActiveChild(const FCommonHoverHandle &inout ParentHandle, const int StackRootKey) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FCommonHoverHandle __r; return __r;
    }
    bool BlocksSiblingHover(const FCommonHoverHandle &inout Handle) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    bool IsHoverStackCloseProtected(const FCommonHoverHandle &inout Handle) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    bool HasDisplayedActiveChild(const FCommonHoverHandle &inout Handle) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    void SetHoverPinned(const FCommonHoverHandle &inout Handle, const bool bPinned)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    bool IsHoverDisplayed(const FCommonHoverHandle &inout Handle) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    int ResolveStackRootKey(const FCommonHoverInfo &inout InHoverInfo, const FCommonHoverHandle &inout ParentHandle) const
    {
        if (ParentHandle.IsValid())
        {
            return this.GetHoverStackRootKey(ParentHandle);
        }
        return int(InHoverInfo.StackRootKey);
    }
    FCommonHoverHandle ResolveParentHoverHandle(const FCommonHoverInfo &inout InHoverInfo) const
    {
        FCommonHoverHandle __r;
        if (InHoverInfo.ParentHoverHandle.IsValid())
        {
        }
        else
        {
        }
        return __r;
    }
    int GetHoverStackRootKey(const FCommonHoverHandle &inout Handle) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    int GetHoverWidgetRootKey(const FCommonHoverHandle &inout Handle) const
    {
        if (!(Handle.IsValid()))
        {
            return 0;
        }
        return FEUIWidget::GetWidgetLayoutRootKey(Handle.WidgetRef.RequireWidget());
    }
    FCommonHoverHandle FindHoverByWidgetRootKey(const int WidgetRootKey) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FCommonHoverHandle __r; return __r;
    }
    FCommonHoverHandle GetRootActiveHover(const int StackRootKey) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FCommonHoverHandle __r; return __r;
    }
    void SetRootActiveHover(const int StackRootKey, const FCommonHoverHandle &inout Handle)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ClearRootActiveHover(const FCommonHoverHandle &inout Handle)
    {
        int local_4 = this.GetRootHoverNodes().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FCommonHoverHandle local_8;
            if (local_8.opCmp(Handle) == 0)
            {
                this.GetModify_RootHoverNodes().RemoveAt(local_4);
            }
        }
        return;
    }
    int FindHoverNodeIndex(const FCommonHoverHandle &inout Handle) const
    {
        __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_666 local_2;
        return this.GetHoverNodes().IndexOfByPredicate(local_2);
    }
    int FindRootNodeIndex(const int StackRootKey) const
    {
        __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_671 local_2;
        return this.GetRootHoverNodes().IndexOfByPredicate(local_2);
    }
    const TArray<FCommonHoverHandle> GetDisplayingHovers() const property
    {
        const TArray<FCommonHoverHandle> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FCommonHoverHandle> GetModify_DisplayingHovers() property
    {
        TArray<FCommonHoverHandle> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDisplayingHovers(const TArray<FCommonHoverHandle> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DisplayingHovers = __Value;
        return;
    }
    const TArray<FCommonHoverNode> GetHoverNodes() const property
    {
        const TArray<FCommonHoverNode> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FCommonHoverNode> GetModify_HoverNodes() property
    {
        TArray<FCommonHoverNode> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHoverNodes(const TArray<FCommonHoverNode> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HoverNodes = __Value;
        return;
    }
    const TArray<FCommonHoverRootNode> GetRootHoverNodes() const property
    {
        const TArray<FCommonHoverRootNode> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FCommonHoverRootNode> GetModify_RootHoverNodes() property
    {
        TArray<FCommonHoverRootNode> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRootHoverNodes(const TArray<FCommonHoverRootNode> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RootHoverNodes = __Value;
        return;
    }
    const TArray<FCommonHoverHandle> GetClosingHovers() const property
    {
        const TArray<FCommonHoverHandle> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FCommonHoverHandle> GetModify_ClosingHovers() property
    {
        TArray<FCommonHoverHandle> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetClosingHovers(const TArray<FCommonHoverHandle> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ClosingHovers = __Value;
        return;
    }
}

struct __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_628
{
    UPROPERTY()
    int __WidgetRootKey;

    __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_628(const int _InWidgetRootKey)
    {
        this.__WidgetRootKey = _InWidgetRootKey;
        return;
    }
    int GetWidgetRootKey() property
    {
        int __r;
        return __r;
    }
    bool opCall(const FCommonHoverNode &inout Node)
    {
        return (Node.WidgetRootKey == this.GetWidgetRootKey());
    }
}

struct __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_666
{
    UPROPERTY()
    FCommonHoverHandle __Handle;

    __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_666()
    {
        return;
    }
    __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_666(const FCommonHoverHandle &inout _InHandle)
    {
        return;
    }
    FCommonHoverHandle GetHandle() property
    {
        FCommonHoverHandle __r;
        return __r;
    }
    bool opCall(const FCommonHoverNode &inout Node)
    {
        FCommonHoverHandle local_2;
        return (local_2.opCmp(this.GetHandle()) == 0);
    }
}

struct __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_671
{
    UPROPERTY()
    int __StackRootKey;

    __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_671(const int _InStackRootKey)
    {
        this.__StackRootKey = _InStackRootKey;
        return;
    }
    int GetStackRootKey() property
    {
        int __r;
        return __r;
    }
    bool opCall(const FCommonHoverRootNode &inout Node)
    {
        return (Node.StackRootKey == this.GetStackRootKey());
    }
}

namespace FMS_CommonHoverManager
{
FMS_CommonHoverManager& Get(const UObject ContextObject)
{
    return FMS_CommonHoverManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommonHoverManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CommonHoverManager __r;
    TEUIModelRef<FMS_CommonHoverManager> local_6 = TEUIModelRef<FMS_CommonHoverManager>(EUIInternal::MakeModelWithManager(Manager, FMS_CommonHoverManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommonHoverManager;
}
int __IndexOf_DisplayingHovers()
{
    return 0;
}
int __IndexOf_HoverNodes()
{
    return 1;
}
int __IndexOf_RootHoverNodes()
{
    return 2;
}
int __IndexOf_ClosingHovers()
{
    return 3;
}
}
