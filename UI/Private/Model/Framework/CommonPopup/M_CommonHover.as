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
        if (!(Handle.IsValid()) || (this.GetClosingHovers().IndexOfByKey(Handle) != INDEX_NONE))
        {
            return;
        }
        this.CloseActiveChild(Handle, this.GetHoverStackRootKey(Handle));
        this.RemoveDisplayedHover(Handle);
        this.UntrackHover(Handle);
        return;
    }
    void CloseHoverSingle(const FCommonHoverHandle &inout Handle)
    {
        int local_1 = this.GetDisplayingHovers().IndexOfByKey(Handle);
        if (local_1 != INDEX_NONE)
        {
            this.GetModify_ClosingHovers().Add(Handle);
            FEUIWidget::RemoveWidget(this.GetDisplayingHovers()[local_1].WidgetRef);
            this.RemoveClosingHover(Handle);
            this.RemoveDisplayedHover(Handle);
        }
        this.UntrackHover(Handle);
        return;
    }
    FCommonHoverInfo GetHover(const FCommonHoverHandle &inout Handle) const
    {
        FCommonHoverInfo __r;
        if (Handle)
        {
            int local_2 = this.GetDisplayingHovers().IndexOfByKey(Handle);
            if (local_2 != INDEX_NONE)
            {
                FVM_CommonHover& local_10 = FEUIWidgetRef::GetViewModel(this.GetDisplayingHovers()[local_2].WidgetRef).opCall(NAME_None);
                if (local_10)
                {
                    FCommonHoverInfo local_62;
                    local_62.AnchorsViewportSpace = local_10.GetAnchorsViewportSpace();
                    local_62.ContentWidget = local_10.GetContentWidget();
                    local_62.ContentModels = local_10.GetContentModels();
                    local_62.bClickClose = local_10.GetbClickClose();
                    local_62.OutsideCloseMode = local_10.GetOutsideCloseMode();
                    bool local_1 = local_10.GetbFocusHover();
                    local_62.bFocusHover = local_1;
                    local_62.HoverLayout = local_10.GetHoverLayout();
                    local_62.CloseScopeInsideWidget = local_10.GetCloseScopeInsideWidget();
                    int local_3 = this.FindHoverNodeIndex(Handle);
                    if (local_3 == INDEX_NONE)
                    {
                        local_1 = false;
                    }
                    else
                    {
                        local_1 = this.GetHoverNodes()[local_3].bPinned;
                    }
                    local_62.bPinned = local_1;
                    local_62.HoverLimitationViewportSpaceOverride = local_10.GetHoverLimitationViewportSpaceOverride();
                }
                else
                {
                }
            }
        }
        return __r;
    }
    void SetHover(const FCommonHoverHandle &inout Handle, const FCommonHoverInfo &inout InHoverInfo)
    {
        if (Handle)
        {
            FVM_CommonHover& local_8 = FEUIWidgetRef::GetViewModel(Handle.WidgetRef).opCall(NAME_None);
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
        this.ClearRootActiveHover(Handle);
        TArray<FCommonHoverHandle> local_4;
        for (auto& local_20 : this.GetModify_HoverNodes())
        {
            FCommonHoverHandle local_22;
            if (local_22.opCmp(Handle) == 0)
            {
                this.SyncDisplayedChildToHoverModel(local_20.Handle, FCommonHoverHandle::InvalidHandle);
                if (local_20.bPendingWeakClose)
                {
                    local_4.Add(local_20.Handle);
                }
            }
        }
        int local_23 = this.FindHoverNodeIndex(Handle);
        if (local_23 != INDEX_NONE)
        {
            this.GetModify_HoverNodes().RemoveAt(local_23);
        }
        for (auto& local_38 : local_4)
        {
            this.TryClosePendingWeakHover(local_38);
        }
        return;
    }
    void MarkPendingWeakClose(const FCommonHoverHandle &inout Handle)
    {
        int local_1 = this.FindHoverNodeIndex(Handle);
        if (local_1 == INDEX_NONE)
        {
            return;
        }
        this.GetModify_HoverNodes()[local_1].bPendingWeakClose = true;
        return;
    }
    void ClearPendingWeakClose(const FCommonHoverHandle &inout Handle)
    {
        int local_1 = this.FindHoverNodeIndex(Handle);
        if (local_1 == INDEX_NONE)
        {
            return;
        }
        this.GetModify_HoverNodes()[local_1].bPendingWeakClose = false;
        return;
    }
    void TryClosePendingWeakHover(const FCommonHoverHandle &inout Handle)
    {
        int local_1 = this.FindHoverNodeIndex(Handle);
        if (local_1 == INDEX_NONE || !(this.GetHoverNodes()[local_1].bPendingWeakClose))
        {
            return;
        }
        if (!(this.IsHoverDisplayed(Handle)))
        {
            this.ClearPendingWeakClose(Handle);
            return;
        }
        if (this.IsHoverStackCloseProtected(Handle))
        {
            this.ClearPendingWeakClose(Handle);
            return;
        }
        if (this.HasDisplayedActiveChild(Handle))
        {
            return;
        }
        this.ClearPendingWeakClose(Handle);
        this.CloseHoverSubtree(Handle);
        return;
    }
    void RemoveDisplayedHover(const FCommonHoverHandle &inout Handle)
    {
        int local_1 = this.GetDisplayingHovers().IndexOfByKey(Handle);
        if (local_1 != INDEX_NONE)
        {
            this.GetModify_DisplayingHovers().RemoveAt(local_1);
        }
        return;
    }
    void RemoveClosingHover(const FCommonHoverHandle &inout Handle)
    {
        int local_1 = this.GetClosingHovers().IndexOfByKey(Handle);
        if (local_1 != INDEX_NONE)
        {
            this.GetModify_ClosingHovers().RemoveAt(local_1);
        }
        return;
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
        if (!(Handle.IsValid()) || (OutHandles.IndexOfByKey(Handle) != INDEX_NONE))
        {
            return;
        }
        for (auto& local_18 : this.GetHoverNodes())
        {
            FCommonHoverHandle local_20;
            if (local_20.opCmp(Handle) == 0)
            {
                this.CollectHoverSubtree(local_18.Handle, OutHandles);
            }
        }
        OutHandles.Add(Handle);
        return;
    }
    void SetActiveChild(const FCommonHoverHandle &inout ParentHandle, const int StackRootKey, const FCommonHoverHandle &inout ChildHandle)
    {
        if (!(ParentHandle.IsValid()))
        {
            this.SetRootActiveHover(StackRootKey, ChildHandle);
            return;
        }
        if (this.FindHoverNodeIndex(ParentHandle) != INDEX_NONE)
        {
            this.SyncDisplayedChildToHoverModel(ParentHandle, ChildHandle);
        }
        return;
    }
    void SyncDisplayedChildToHoverModel(const FCommonHoverHandle &inout HoverHandle, const FCommonHoverHandle &inout ChildHandle)
    {
        FVM_CommonHover& local_6 = FEUIWidgetRef::GetViewModel(HoverHandle.WidgetRef).opCall(NAME_None);
        if (local_6)
        {
            local_6.SetDisplayedChildHoverHandle(ChildHandle);
        }
        return;
    }
    FCommonHoverHandle GetActiveChild(const FCommonHoverHandle &inout ParentHandle, const int StackRootKey) const
    {
        FCommonHoverHandle __r;
        if (!(ParentHandle.IsValid()))
        {
            FCommonHoverHandle local_4 = this.GetRootActiveHover(StackRootKey);
        }
        else
        {
            if (this.FindHoverNodeIndex(ParentHandle) != INDEX_NONE)
            {
            }
            else
            {
            }
        }
        return __r;
    }
    bool BlocksSiblingHover(const FCommonHoverHandle &inout Handle) const
    {
        int local_1 = this.FindHoverNodeIndex(Handle);
        if (local_1 == INDEX_NONE)
        {
            return false;
        }
        if (this.GetHoverNodes()[local_1].bPinned)
        {
            return true;
        }
        FCommonHoverHandle local_6;
        return local_6.IsValid() && this.BlocksSiblingHover(local_6);
    }
    bool IsHoverStackCloseProtected(const FCommonHoverHandle &inout Handle) const
    {
        FCommonHoverHandle local_2;
        int local_5 = 0;
        for (; local_5 < this.GetHoverNodes().Num(); ++local_5)
        {
            FCommonHoverInfo local_112 = this.GetHover(local_2);
            if (local_112.HasBlockingCloseMask() || local_112.IsPinnedPassThrough() || local_112.BlocksSiblingHover())
            {
                return true;
            }
            int local_7 = this.FindHoverNodeIndex(local_2);
            if (local_7 == INDEX_NONE || !(this.GetHoverNodes()[local_7].ActiveChildHandle.IsValid()))
            {
                return false;
            }
        }
        return false;
    }
    bool HasDisplayedActiveChild(const FCommonHoverHandle &inout Handle) const
    {
        if (this.FindHoverNodeIndex(Handle) == INDEX_NONE)
        {
            return false;
        }
        FCommonHoverHandle local_6;
        return local_6.IsValid() && this.IsHoverDisplayed(local_6);
    }
    void SetHoverPinned(const FCommonHoverHandle &inout Handle, const bool bPinned)
    {
        int local_1 = this.FindHoverNodeIndex(Handle);
        if (local_1 != INDEX_NONE)
        {
            if (!(this.GetHoverNodes()[local_1].bPinned) != !(bPinned))
            {
                this.GetModify_HoverNodes()[local_1].bPinned = bPinned;
            }
        }
        return;
    }
    bool IsHoverDisplayed(const FCommonHoverHandle &inout Handle) const
    {
        return Handle.IsValid() && (this.GetDisplayingHovers().IndexOfByKey(Handle) != INDEX_NONE);
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
        int local_4;
        int local_1 = this.FindHoverNodeIndex(Handle);
        int local_2 = INDEX_NONE;
        if (local_1 != local_2)
        {
            local_4 = this.GetHoverNodes()[local_1].StackRootKey;
        }
        else
        {
            local_4 = 0;
        }
        return local_4;
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
        FCommonHoverHandle __r;
        if (WidgetRootKey == 0)
        {
        }
        else
        {
            __Lambda_UI_Private_Model_Framework_CommonPopup_M_CommonHover_628 local_4;
            if (this.GetHoverNodes().IndexOfByPredicate(local_4) != INDEX_NONE)
            {
            }
            else
            {
            }
        }
        return __r;
    }
    FCommonHoverHandle GetRootActiveHover(const int StackRootKey) const
    {
        FCommonHoverHandle __r;
        if (this.FindRootNodeIndex(StackRootKey) != INDEX_NONE)
        {
        }
        else
        {
        }
        return __r;
    }
    void SetRootActiveHover(const int StackRootKey, const FCommonHoverHandle &inout Handle)
    {
        if (this.FindRootNodeIndex(StackRootKey) != INDEX_NONE)
        {
            return;
        }
        FCommonHoverRootNode local_8;
        local_8.StackRootKey = StackRootKey;
        this.GetModify_RootHoverNodes().Add(local_8);
        return;
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
FMS_CommonHoverManager& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_CommonHoverManager>(EUIInternal::MakeModelWithManager(Manager, FMS_CommonHoverManager::ModelId)).Get();
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
