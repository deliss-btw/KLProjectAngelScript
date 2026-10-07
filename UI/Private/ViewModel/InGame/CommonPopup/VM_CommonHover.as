
namespace FVM_CommonHoverContent
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature CloseHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature PinHoverPassThrough = FEUIModelCallbackSignature();
}
namespace FVM_CommonHover
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature CloseHover = FEUIModelCallbackSignature();

// NOTE: class defaults are not authored in this module: FVM_CommonHover (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

}
struct FVM_CommonHoverContent : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;
    UPROPERTY()
    FCommonHoverHandle m_ParentHoverHandle;
    UPROPERTY()
    bool m_bChainNavigationEnterRequested;

    FVM_CommonHoverContent()
    {
        this.m_bChainNavigationEnterRequested = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonHoverContent' by default constructor.");
        return;
    }
    FVM_CommonHoverContent(const FVM_CommonHoverContent &inout Other)
    {
        this.m_bChainNavigationEnterRequested = false;
        this.m_bChainNavigationEnterRequested = Other.m_bChainNavigationEnterRequested;
        return;
    }
    FVM_CommonHoverContent(const FCommonHoverHandle &inout InHoverHandle, const FCommonHoverHandle &inout InParentHoverHandle)
    {
        this.m_bChainNavigationEnterRequested = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetHoverHandle(InHoverHandle);
        this.SetParentHoverHandle(InParentHoverHandle);
        return;
    }
    FVM_CommonHoverContent opAssign(const FVM_CommonHoverContent &inout Other)
    {
        FVM_CommonHoverContent __r;
        this.m_bChainNavigationEnterRequested = Other.m_bChainNavigationEnterRequested;
        return __r;
    }
    void HandleMsgCloseCommonHover(const FMsg_CloseCommonHover &inout Msg)
    {
        this.CloseHover();
        return;
    }
    void CloseHover()
    {
        ::FMS_CommonHoverManager::Get(this.GetContext().Manager).CloseHover(this.GetHoverHandle());
        return;
    }
    void PinHoverPassThrough()
    {
        ::CommonPopup::PinHoverPassThrough(this.GetHoverHandle(), this.GetManager());
        return;
    }
    void RequestEnterByChainNavigation()
    {
        this.SetbChainNavigationEnterRequested(true);
        return;
    }
    void ClearEnterByChainNavigationRequest()
    {
        this.SetbChainNavigationEnterRequested(false);
        return;
    }
    const FCommonHoverHandle GetHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FCommonHoverHandle GetModify_HoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FCommonHoverHandle GetParentHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FCommonHoverHandle GetModify_ParentHoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetParentHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    bool GetbChainNavigationEnterRequested() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bChainNavigationEnterRequested;
    }
    void SetbChainNavigationEnterRequested(const bool __Value) property
    {
        if (!(this.m_bChainNavigationEnterRequested) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bChainNavigationEnterRequested = __Value;
        return;
    }
}

struct FVM_CommonHover : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> m_ContentWidget;
    UPROPERTY()
    FEUIModelContainer m_ContentModels;
    UPROPERTY()
    FBox2D m_AnchorsViewportSpace;
    UPROPERTY()
    bool m_bClickClose;
    UPROPERTY()
    ECommonHoverOutsideCloseMode m_OutsideCloseMode;
    UPROPERTY()
    bool m_bFocusHover;
    UPROPERTY()
    ECommonHoverLayout m_HoverLayout;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;
    UPROPERTY()
    FCommonHoverHandle m_ParentHoverHandle;
    UPROPERTY()
    FEUIWidgetRef m_CloseScopeInsideWidget;
    UPROPERTY()
    FBox2D m_HoverLimitationViewportSpaceOverride;
    UPROPERTY()
    bool m_bOwnerWidgetBound;
    UPROPERTY()
    FCommonHoverHandle m_DisplayedChildHoverHandle;
    UPROPERTY()
    FEUICloseScopeHandle PinnedCloseScopeHandle;
    UPROPERTY()
    bool bHandlingPinnedCloseRequest;

    FVM_CommonHover()
    {
        this.m_bClickClose = false;
        this.m_OutsideCloseMode = ECommonHoverOutsideCloseMode(0);
        this.m_bFocusHover = true;
        this.m_HoverLayout = ECommonHoverLayout(0);
        this.m_bOwnerWidgetBound = false;
        this.bHandlingPinnedCloseRequest = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
        }
        else
        {
        }
        this.__InitDefaults();
        return;
    }
    FVM_CommonHover(const FVM_CommonHover &inout Other)
    {
        this.m_bClickClose = false;
        this.m_OutsideCloseMode = ECommonHoverOutsideCloseMode(0);
        this.m_bFocusHover = true;
        this.m_HoverLayout = ECommonHoverLayout(0);
        this.m_bOwnerWidgetBound = false;
        this.bHandlingPinnedCloseRequest = false;
        this.m_ContentWidget = Other.m_ContentWidget;
        this.m_ContentModels = Other.m_ContentModels;
        this.m_AnchorsViewportSpace = Other.m_AnchorsViewportSpace;
        this.m_bClickClose = Other.m_bClickClose;
        this.m_OutsideCloseMode = Other.m_OutsideCloseMode;
        this.m_bFocusHover = Other.m_bFocusHover;
        this.m_HoverLayout = Other.m_HoverLayout;
        this.m_CloseScopeInsideWidget = Other.m_CloseScopeInsideWidget;
        this.m_HoverLimitationViewportSpaceOverride = Other.m_HoverLimitationViewportSpaceOverride;
        this.m_bOwnerWidgetBound = Other.m_bOwnerWidgetBound;
        this.__InitDefaults();
        return;
    }
    FVM_CommonHover opAssign(const FVM_CommonHover &inout Other)
    {
        FVM_CommonHover __r;
        this.m_ContentWidget = Other.m_ContentWidget;
        this.m_ContentModels = Other.m_ContentModels;
        this.m_AnchorsViewportSpace = Other.m_AnchorsViewportSpace;
        this.m_bClickClose = Other.m_bClickClose;
        this.m_OutsideCloseMode = Other.m_OutsideCloseMode;
        this.m_bFocusHover = Other.m_bFocusHover;
        this.m_HoverLayout = Other.m_HoverLayout;
        this.m_CloseScopeInsideWidget = Other.m_CloseScopeInsideWidget;
        this.m_HoverLimitationViewportSpaceOverride = Other.m_HoverLimitationViewportSpaceOverride;
        this.m_bOwnerWidgetBound = Other.m_bOwnerWidgetBound;
        return __r;
    }
    void OnOwnerWidgetBind_Implementation()
    {
        this.SetbOwnerWidgetBound(true);
        return;
    }
    void OnOwnerWidgetUnbind_Implementation()
    {
        this.SetbOwnerWidgetBound(false);
        this.UnregisterPinnedCloseScopeOnly();
        ::FMS_CommonHoverManager::Get(this.GetContext().Manager).HandleHoverWidgetUnbound(this.GetHoverHandle());
        return;
    }
    void CloseHover()
    {
        ::FMS_CommonHoverManager::Get(this.GetContext().Manager).CloseHover(this.GetHoverHandle());
        return;
    }
    void CloseHoverFromCloseScope()
    {
        if (this.bHandlingPinnedCloseRequest)
        {
            return;
        }
        this.bHandlingPinnedCloseRequest = true;
        ::FMS_CommonHoverManager::Get(this.GetContext().Manager).CloseHover(this.GetHoverHandle());
        this.bHandlingPinnedCloseRequest = false;
        return;
    }
    void AddModelToContentModels()
    {
        FVM_CommonHoverContent& local_6 = FEUIModelContainer::GetModel(this.GetContentModels()).opCall();
        if (local_6)
        {
            local_6.SetHoverHandle(this.GetHoverHandle());
            local_6.SetParentHoverHandle(this.GetParentHoverHandle());
            return;
        }
        FEUIModelRef local_10;
        this.GetModify_ContentModels().AddModel(local_10, false);
        return;
    }
    bool SupportsChainNavigation() const
    {
        return (int(this.GetOutsideCloseMode())) == 2 || this.GetParentHoverHandle().IsValid() || !(this.GetbFocusHover());
    }
    void RequestContentEnterByChainNavigation()
    {
        FVM_CommonHoverContent& local_6 = FEUIModelContainer::GetModel(this.GetContentModels()).opCall();
        if (local_6)
        {
            local_6.RequestEnterByChainNavigation();
            return;
        }
        FEUIModelRef local_10;
        this.GetModify_ContentModels().AddModel(local_10, false);
        FVM_CommonHoverContent& local_6_2 = FEUIModelContainer::GetModel(this.GetContentModels()).opCall();
        if (local_6_2)
        {
            local_6_2.RequestEnterByChainNavigation();
        }
        return;
    }
    void CancelContentEnterByChainNavigation()
    {
        FVM_CommonHoverContent& local_6 = FEUIModelContainer::GetModel(this.GetContentModels()).opCall();
        if (local_6)
        {
            local_6.ClearEnterByChainNavigationRequest();
        }
        return;
    }
    void SyncPinnedCloseScope()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void UnregisterPinnedCloseScopeOnly()
    {
        if (!(this.PinnedCloseScopeHandle.IsValid()))
        {
            return;
        }
        FEUICloseScope::Unregister(this.GetOwnerWidget(), this.PinnedCloseScopeHandle);
        this.PinnedCloseScopeHandle = FEUICloseScopeHandle();
        return;
    }
    ESlateVisibility bClickCloseAsSlateVisibility() const
    {
        int local_2;
        if (this.bClickCloseAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool bClickCloseAsBool() const
    {
        return this.GetbClickClose() || false;
    }
    TSoftClassPtr<UUserWidget> GetContentWidget() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ContentWidget;
    }
    void SetContentWidget(const TSoftClassPtr<UUserWidget> &inout __Value) property
    {
        if ((this.m_ContentWidget == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ContentWidget = __Value;
        return;
    }
    const FEUIModelContainer GetContentModels() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelContainer GetModify_ContentModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetContentModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ContentModels = __Value;
        return;
    }
    const FBox2D GetAnchorsViewportSpace() const property
    {
        const FBox2D __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FBox2D GetModify_AnchorsViewportSpace() property
    {
        FBox2D __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAnchorsViewportSpace(const FBox2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AnchorsViewportSpace = __Value;
        return;
    }
    bool GetbClickClose() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bClickClose;
    }
    void SetbClickClose(const bool __Value) property
    {
        if (!(this.m_bClickClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bClickClose = __Value;
        return;
    }
    ECommonHoverOutsideCloseMode GetOutsideCloseMode() const property
    {
        this.TrackPropertyRead(4);
        return this.m_OutsideCloseMode;
    }
    void SetOutsideCloseMode(const ECommonHoverOutsideCloseMode __Value) property
    {
        if (int(this.m_OutsideCloseMode) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_OutsideCloseMode = __Value;
        return;
    }
    bool GetbFocusHover() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bFocusHover;
    }
    void SetbFocusHover(const bool __Value) property
    {
        if (!(this.m_bFocusHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bFocusHover = __Value;
        return;
    }
    ECommonHoverLayout GetHoverLayout() const property
    {
        this.TrackPropertyRead(6);
        return this.m_HoverLayout;
    }
    void SetHoverLayout(const ECommonHoverLayout __Value) property
    {
        if (int(this.m_HoverLayout) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_HoverLayout = __Value;
        return;
    }
    const FCommonHoverHandle GetHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FCommonHoverHandle GetModify_HoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        return;
    }
    const FCommonHoverHandle GetParentHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FCommonHoverHandle GetModify_ParentHoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetParentHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        return;
    }
    const FEUIWidgetRef GetCloseScopeInsideWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FEUIWidgetRef GetModify_CloseScopeInsideWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetCloseScopeInsideWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CloseScopeInsideWidget = __Value;
        return;
    }
    const FBox2D GetHoverLimitationViewportSpaceOverride() const property
    {
        const FBox2D __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FBox2D GetModify_HoverLimitationViewportSpaceOverride() property
    {
        FBox2D __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetHoverLimitationViewportSpaceOverride(const FBox2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_HoverLimitationViewportSpaceOverride = __Value;
        return;
    }
    bool GetbOwnerWidgetBound() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bOwnerWidgetBound;
    }
    void SetbOwnerWidgetBound(const bool __Value) property
    {
        if (!(this.m_bOwnerWidgetBound) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bOwnerWidgetBound = __Value;
        return;
    }
    const FCommonHoverHandle GetDisplayedChildHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FCommonHoverHandle GetModify_DisplayedChildHoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetDisplayedChildHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        return;
    }
}

struct __GeneratedProperties_FVM_CommonHoverContent
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonHoverContent> Self;

    __GeneratedProperties_FVM_CommonHoverContent()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_CommonHover
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonHover> Self;

    __GeneratedProperties_FVM_CommonHover()
    {
        return;
    }
}

namespace FVM_CommonHoverContent
{
FVM_CommonHoverContent& Create(const UObject ContextObject, const FCommonHoverHandle &inout HoverHandle, const FCommonHoverHandle &inout ParentHoverHandle)
{
    return FVM_CommonHoverContent::CreateByManager(EUIInternal::GetContextManager(ContextObject), HoverHandle, ParentHoverHandle);
}
FVM_CommonHoverContent CreateByManager(const UEUIManagerSubsystem Manager, const FCommonHoverHandle &inout HoverHandle, const FCommonHoverHandle &inout ParentHoverHandle)
{
    FVM_CommonHoverContent __r;
    TEUIModelRef<FVM_CommonHoverContent> local_6 = TEUIModelRef<FVM_CommonHoverContent>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonHoverContent::ModelId, 0, HoverHandle, ParentHoverHandle));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonHoverContent>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonHoverContent;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__HandleMsgCloseCommonHover";
    local_26.MessageTypeName = "Msg_CloseCommonHover";
    local_26.SourcePropertyModelRefs = FBitSet64(-1);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonHoverContent;
}
void __HandleMsgCloseCommonHover(FVM_CommonHoverContent &inout Model, const FMsg_CloseCommonHover &inout Message)
{
    Model.HandleMsgCloseCommonHover(Message);
    return;
}
TEUIModelRef<FVM_CommonHoverContent> __UIGetter_Self(const FVM_CommonHoverContent &inout Model)
{
    return TEUIModelRef<FVM_CommonHoverContent>(Model);
}
int __IndexOf_HoverHandle()
{
    return 0;
}
int __IndexOf_ParentHoverHandle()
{
    return 1;
}
int __IndexOf_bChainNavigationEnterRequested()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommonHoverContent
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonHover
{
FVM_CommonHover& Create(const UObject ContextObject)
{
    return FVM_CommonHover::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonHover CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonHover __r;
    TEUIModelRef<FVM_CommonHover> local_6 = TEUIModelRef<FVM_CommonHover>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonHover::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ContentWidget";
    local_14.TypeName = "TSoftClassPtr<UUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContentModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bClickClose";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonHover>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonHover;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__AddModelToContentModels";
    local_24.DirtyFlags.Set(FVM_CommonHover::__IndexOf_ParentHoverHandle());
    local_24.DirtyFlags.Set(FVM_CommonHover::__IndexOf_HoverHandle());
    local_24.DirtyFlags.Set(FVM_CommonHover::__IndexOf_ContentModels());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelEffectDefine local_28;
    local_28.FunctionName = "SyncPinnedCloseScope";
    Result.EffectFunctions.Add(local_28);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonHover;
}
void __AddModelToContentModels(FVM_CommonHover &inout Model)
{
    Model.AddModelToContentModels();
    return;
}
TSoftClassPtr<UUserWidget> __UIGetter_ContentWidget(const FVM_CommonHover &inout Model)
{
    return Model.GetContentWidget();
}
FEUIModelContainer __UIGetter_ContentModels(const FVM_CommonHover &inout Model)
{
    return Model.GetContentModels();
}
bool __UIGetter_bClickClose(const FVM_CommonHover &inout Model)
{
    return Model.GetbClickClose();
}
TEUIModelRef<FVM_CommonHover> __UIGetter_Self(const FVM_CommonHover &inout Model)
{
    return TEUIModelRef<FVM_CommonHover>(Model);
}
int __IndexOf_ContentWidget()
{
    return 0;
}
int __IndexOf_ContentModels()
{
    return 1;
}
int __IndexOf_AnchorsViewportSpace()
{
    return 2;
}
int __IndexOf_bClickClose()
{
    return 3;
}
int __IndexOf_OutsideCloseMode()
{
    return 4;
}
int __IndexOf_bFocusHover()
{
    return 5;
}
int __IndexOf_HoverLayout()
{
    return 6;
}
int __IndexOf_HoverHandle()
{
    return 7;
}
int __IndexOf_ParentHoverHandle()
{
    return 8;
}
int __IndexOf_CloseScopeInsideWidget()
{
    return 9;
}
int __IndexOf_HoverLimitationViewportSpaceOverride()
{
    return 10;
}
int __IndexOf_bOwnerWidgetBound()
{
    return 11;
}
int __IndexOf_DisplayedChildHoverHandle()
{
    return 12;
}
}
namespace __GeneratedProperties_FVM_CommonHover
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
