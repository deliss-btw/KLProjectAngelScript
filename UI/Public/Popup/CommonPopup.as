
enum ECommonHoverLayout
{
    Right,
    Left,
    Top,
    Bottom,
}

enum ECommonHoverOutsideCloseMode
{
    None,
    BlockingCloseMask,
    PinnedPassThrough,
}

namespace FCommonHoverHandle
{
    const FCommonHoverHandle InvalidHandle = FCommonHoverHandle();
}
namespace CommonPopup
{
    const float32 InstantBlendSpeed = 100000f;

}
struct FDialogCallback
{
    UPROPERTY()
    FDialogModelCallback ModelCallback;
    UPROPERTY()
    FDialogDynamicCallback DynamicCallback;
    UPROPERTY()
    bool bBoundModelCallback;

    FDialogCallback(const FDialogModelCallback &inout InModelCallback)
    {
        this.bBoundModelCallback = true;
        return;
    }
    FDialogCallback(const FDialogDynamicCallback &inout InDynamicCallback)
    {
        this.DynamicCallback = InDynamicCallback;
        this.bBoundModelCallback = false;
        return;
    }
    bool Call(const FCommonDialogAnswer &inout Answer) const
    {
        if (this.bBoundModelCallback)
        {
            int local_2;
            local_2 = true;
            if (this.ExecuteIfBound(Answer, local_2))
            {
                return (local_2 != 0);
            }
        }
        else
        {
            if (this.DynamicCallback.IsBound())
            {
                return this.DynamicCallback.Execute(Answer);
            }
        }
        return true;
    }
}

struct FCommonDialogOption
{
    UPROPERTY()
    ECommonDialogAnswerType OptionType;
    UPROPERTY()
    FEUIInputAction OptionAction;
    UPROPERTY()
    FText OptionTextOverride;

    FCommonDialogOption(const ECommonDialogAnswerType InOptionType, const FEUIInputAction &inout InOptionAction, const FText &inout InOptionTextOverride = FText())
    {
        this.OptionType = InOptionType;
        this.OptionAction = InOptionAction;
        this.OptionTextOverride = InOptionTextOverride;
        return;
    }
}

struct FCommonDialogParam
{
    UPROPERTY()
    bool bIsForbidIgnored = false;


}

struct FCommonHoverHandle
{
    UPROPERTY()
    FEUIWidgetRef WidgetRef;

    FCommonHoverHandle()
    {
        return;
    }
    FCommonHoverHandle(const FEUIWidgetRef &inout InWidgetRef)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    int opCmp(const FCommonHoverHandle &inout Other) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        int __r; return __r;
    }
    bool opConv() const
    {
        return this.IsValid();
    }
    bool IsValid() const
    {
        return this.IsValid();
    }
}

struct FCommonHoverInfo
{
    UPROPERTY()
    FBox2D AnchorsViewportSpace;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> ContentWidget;
    UPROPERTY()
    FEUIModelContainer ContentModels;
    UPROPERTY()
    bool bClickClose;
    UPROPERTY()
    bool bPinned = false;
    UPROPERTY()
    ECommonHoverOutsideCloseMode OutsideCloseMode = ECommonHoverOutsideCloseMode(0);
    UPROPERTY()
    bool bFocusHover;
    UPROPERTY()
    ECommonHoverLayout HoverLayout = ECommonHoverLayout(0);
    UPROPERTY()
    EEUILayoutLayer TargetLayer = EEUILayoutLayer(0);
    UPROPERTY()
    FCommonHoverHandle ParentHoverHandle;
    UPROPERTY()
    FEUIWidgetRef CloseScopeInsideWidget;
    UPROPERTY()
    int StackRootKey = 0;
    UPROPERTY()
    FBox2D HoverLimitationViewportSpaceOverride;

    FCommonHoverInfo(const FBox2D &inout InAnchorsViewportSpace, const TSoftClassPtr<UUserWidget> &inout InContentWidget, const FEUIModelContainer &inout InContentModels = FEUIModelContainer())
    {
        this.ContentWidget = InContentWidget;
        this.ContentModels = InContentModels;
        this.bClickClose = false;
        this.bPinned = false;
        this.OutsideCloseMode = ECommonHoverOutsideCloseMode(0);
        this.bFocusHover = true;
        this.HoverLayout = ECommonHoverLayout(0);
        this.TargetLayer = EEUILayoutLayer(0);
        this.CloseScopeInsideWidget = FEUIWidgetRef();
        this.StackRootKey = 0;
        this.HoverLimitationViewportSpaceOverride.bIsValid = false;
        return;
    }
    FCommonHoverInfo& SetClickClose(const bool bInClickClose)
    {
        this.bClickClose = bInClickClose;
        if (bInClickClose)
        {
            this.OutsideCloseMode = ECommonHoverOutsideCloseMode(1);
        }
        else
        {
            if (int(this.OutsideCloseMode) == 1)
            {
                this.OutsideCloseMode = ECommonHoverOutsideCloseMode(0);
            }
        }
        return bInClickClose;
    }
    FCommonHoverInfo SetOutsideCloseMode(const ECommonHoverOutsideCloseMode InOutsideCloseMode)
    {
        FCommonHoverInfo __r;
        this.OutsideCloseMode = InOutsideCloseMode;
        this.bClickClose = (int(InOutsideCloseMode) == 1);
        return __r;
    }
    FCommonHoverInfo SetPinned(const bool bInPinned)
    {
        FCommonHoverInfo __r;
        this.bPinned = bInPinned;
        return __r;
    }
    FCommonHoverInfo SetFocusHover(const bool bInFocusHover)
    {
        FCommonHoverInfo __r;
        this.bFocusHover = bInFocusHover;
        return __r;
    }
    FCommonHoverInfo SetHoverLayout(const ECommonHoverLayout InHoverLayout)
    {
        FCommonHoverInfo __r;
        this.HoverLayout = InHoverLayout;
        return __r;
    }
    FCommonHoverInfo SetTargetLayer(const EEUILayoutLayer InTargetLayer)
    {
        FCommonHoverInfo __r;
        this.TargetLayer = InTargetLayer;
        return __r;
    }
    FCommonHoverInfo SetParentHoverHandle(const FCommonHoverHandle &inout InParentHoverHandle)
    {
        FCommonHoverInfo __r;
        return __r;
    }
    FCommonHoverInfo& SetCloseScopeInsideWidget(const FEUIWidgetRef &inout InCloseScopeInsideWidget)
    {
        return InCloseScopeInsideWidget;
    }
    FCommonHoverInfo SetStackRootKey(const int InStackRootKey)
    {
        FCommonHoverInfo __r;
        this.StackRootKey = InStackRootKey;
        return __r;
    }
    FCommonHoverInfo& SetHoverLimitationScreenSpaceOverride(const FBox2D &inout InHoverLimitationScreenSpaceOverride)
    {
        this.HoverLimitationViewportSpaceOverride.bIsValid = InHoverLimitationScreenSpaceOverride.bIsValid;
        bool local_1 = InHoverLimitationScreenSpaceOverride.bIsValid;
        if (local_1)
        {
            FGeometry local_18 = WidgetLayout::GetViewportWidgetGeometry(__GetWorldContext());
            this.HoverLimitationViewportSpaceOverride.Min = local_18.AbsoluteToLocal(InHoverLimitationScreenSpaceOverride.Min);
            this.HoverLimitationViewportSpaceOverride.Max = local_18.AbsoluteToLocal(InHoverLimitationScreenSpaceOverride.Max);
        }
        return local_1;
    }
    FCommonHoverInfo& SetHoverLimitationByWidget(const UWidget Widget)
    {
        FGeometry local_14 = Widget.GetTickSpaceGeometry();
        bool local_19 = local_14.GetLocalSize().IsZero();
        if (local_19)
        {
            XWarning(ELog(16), "Given widget is zero sized, geometry maybe not cached, try invoke this later, or hover will display in wrong position.");
        }
        else
        {
            FGeometry local_36 = WidgetLayout::GetViewportWidgetGeometry(__GetWorldContext());
            this.HoverLimitationViewportSpaceOverride.Min = local_36.AbsoluteToLocal(local_14.LocalToAbsolute(FVector2D::ZeroVector));
            this.HoverLimitationViewportSpaceOverride.Max = local_36.AbsoluteToLocal(local_14.LocalToAbsolute(local_14.GetLocalSize()));
            local_19 = true;
            this.HoverLimitationViewportSpaceOverride.bIsValid = local_19;
        }
        return local_19;
    }
    bool opConv() const
    {
        return this.bIsValid && !(this.ContentWidget.IsNull());
    }
    bool HasBlockingCloseMask() const
    {
        return (this.bClickClose || (int(this.OutsideCloseMode) == 1));
    }
    bool IsPinnedPassThrough() const
    {
        return (int(this.OutsideCloseMode) == 2);
    }
    bool BlocksSiblingHover() const
    {
        return this.bPinned;
    }
}

struct FMsg_CloseCommonHover : FEUIMessage
{
    FMsg_CloseCommonHover()
    {
        return;
    }
}

delegate bool FDialogDynamicCallback(const FCommonDialogAnswer &inout Answer);

namespace FCommonHoverInfo
{
FCommonHoverInfo MakeForWidget(const UWidget Widget, const TSoftClassPtr<UUserWidget> &inout ContentWidget, const FEUIModelContainer &inout ContentModels = FEUIModelContainer())
{
    FCommonHoverInfo __r;
    if (!(IsValid(Widget)))
    {
        XWarning(ELog(16), "Given widget is invalid, hover will not be displayed.");
    }
    else
    {
        FGeometry local_68 = Widget.GetTickSpaceGeometry();
        FCommonHoverInfo local_54 = FCommonHoverInfo::MakeForGeometry(local_68, ContentWidget, ContentModels);
        local_54.SetStackRootKey(FEUIWidget::GetWidgetLayoutRootKey(Widget));
    }
    return __r;
}
FCommonHoverInfo MakeForGeometry(const FGeometry &inout Geometry, const TSoftClassPtr<UUserWidget> &inout ContentWidget, const FEUIModelContainer &inout ContentModels = FEUIModelContainer())
{
    FCommonHoverInfo __r;
    bool local_5 = Geometry.GetLocalSize().IsZero();
    if (local_5)
    {
        XWarning(ELog(16), "Given geometry is zero sized, try invoke this later, or hover will display in wrong position.");
    }
    FGeometry local_22 = WidgetLayout::GetViewportWidgetGeometry(__GetWorldContext());
    FBox2D local_46;
    local_46.Min = local_22.AbsoluteToLocal(Geometry.LocalToAbsolute(FVector2D::ZeroVector));
    local_46.Max = local_22.AbsoluteToLocal(Geometry.LocalToAbsolute(Geometry.GetLocalSize()));
    local_46.bIsValid = true;
    FCommonHoverInfo local_102 = FCommonHoverInfo(local_46, ContentWidget, ContentModels);
    return __r;
}
FCommonHoverInfo MakeForPosition(const FVector2D &inout AbsolutePosition, const TSoftClassPtr<UUserWidget> &inout ContentWidget, const FEUIModelContainer &inout ContentModels = FEUIModelContainer())
{
    FCommonHoverInfo __r;
    FGeometry local_16 = WidgetLayout::GetViewportWidgetGeometry(__GetWorldContext());
    FBox2D local_40;
    local_40.Min = local_16.AbsoluteToLocal(AbsolutePosition);
    local_40.Max = local_40.Min;
    local_40.bIsValid = true;
    FCommonHoverInfo local_98 = FCommonHoverInfo(local_40, ContentWidget, ContentModels);
    return __r;
}
}
namespace CommonPopup
{
void Tips(const FText &inout Content, const FCommonTipsParam &inout ExtraParam = FCommonTipsParam())
{
    UScriptAsToCppModelFunctionRouter::Get().OnOpenTips.Execute(Content, ExtraParam);
    return;
}
void WeakTips(const FText &inout Content, const FCommonTipsParam &inout ExtraParam = FCommonTipsParam())
{
    UScriptAsToCppModelFunctionRouter::Get().OnOpenWeakTips.Execute(Content, ExtraParam);
    return;
}
void Banner(const FGameplayTag &inout PopupType, const FText &inout Title, const EBannerBGType BGType, const FSoftBrush &inout Icon, const FText &inout Tips = FText(), const bool bEnd = false, const float32 LifetimeOverride = 0, const EBannerWidgetType BannerType = EBannerWidgetType::Default, const int Priority = CommonPopupUtils::CommonPopupPriorityUnset)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void LevelUpBanner(const FText &inout Title, const FText &inout Tips = FText(), const float32 LifetimeOverride = 0, const int Priority = CommonPopupUtils::CommonPopupPriorityUnset)
{
    CommonPopup::Banner(GameplayTags::UI_Type_Commonpupop_Banner_Banner, Title, EBannerBGType(0), FSoftBrush(), Tips, false, LifetimeOverride, EBannerWidgetType(2), Priority);
    return;
}
void SystemUnlockBanner(const FText &inout Title, const FSoftBrush &inout Icon, const FText &inout Tips = FText(), const float32 LifetimeOverride = 0, const int Priority = CommonPopupUtils::CommonPopupPriorityUnset)
{
    CommonPopup::Banner(GameplayTags::UI_Type_Commonpupop_Banner_Banner, Title, EBannerBGType(0), Icon, Tips, false, LifetimeOverride, EBannerWidgetType(3), Priority);
    return;
}
void NewsTicker(const FText &inout Content, const FCommonHintParam &inout ExtraParam = FCommonHintParam(), const int Priority = CommonPopupUtils::CommonPopupPriorityUnset, const int RepeatCount = 1, const UObject WorldContext = nullptr)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void Loading(const FGameplayTag &inout PopupType, const float32 DisplayTime, const float32 FadeInTime = -1, const float32 FadeOutTime = -1)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void LargeHint(const FSoftBrush &inout Icon, const FText &inout Title, const FText &inout Content, const FCommonHintParam &inout ExtraParam = FCommonHintParam(), const int Priority = 0)
{
    float32 local_107;
    FCommonLargeSideHintData local_100;
    local_100._base_FCommonSideHintData = Icon;
    local_100.Title = Title;
    local_100.Content = Content;
    if (ExtraParam.LifetimeOverride > 0.0f)
    {
        local_107 = ExtraParam.LifetimeOverride;
    }
    else
    {
        local_107 = CommonPopupSettings::Get().DefaultLargeSideHintLifetime;
    }
    local_100.Lifetime = local_107;
    local_100.Priority = Priority;
    Make local_124;
    local_124;
    UCommonPopupSettings local_106 = CommonPopupSettings::Get();
    return;
}
void LargeHintWithAction(const FSoftBrush &inout Icon, const FText &inout Title, const FText &inout Content, const FInputActionListConstructParam &inout Actions, const FCommonHintParam &inout ExtraParam = FCommonHintParam(), const int Priority = 0)
{
    float32 local_111;
    FCommonLargeSideHintDataWithAction local_104;
    local_104._base_FCommonLargeSideHintData = Icon;
    local_104.Title = Title;
    local_104.Content = Content;
    if (ExtraParam.LifetimeOverride > 0.0f)
    {
        local_111 = ExtraParam.LifetimeOverride;
    }
    else
    {
        local_111 = CommonPopupSettings::Get().DefaultLargeSideHintLifetime;
    }
    local_104.Lifetime = local_111;
    local_104.Priority = Priority;
    Make local_128;
    local_128;
    UCommonPopupSettings local_110 = CommonPopupSettings::Get();
    return;
}
void LargeHintCustom(const TSoftClassPtr<UEUIUserWidget> &inout LargeSideHintWidget, const FEUIModelContainer &inout WidgetModels, const int Priority = 0)
{
    UScriptAsToCppModelFunctionRouter::Get().OnShowLargeHint.Execute(LargeSideHintWidget, WidgetModels);
    return;
}
void SmallHint(const FSoftBrush &inout Icon, const FText &inout Content, const FCommonHintParam &inout ExtraParam = FCommonHintParam(), const int Priority = 0)
{
    float32 local_103;
    FCommonSideHintData local_96;
    local_96.Icon = Icon;
    local_96.Content = Content;
    if (ExtraParam.LifetimeOverride > 0.0f)
    {
        local_103 = ExtraParam.LifetimeOverride;
    }
    else
    {
        local_103 = CommonPopupSettings::Get().DefaultSmallSideHintLifetime;
    }
    local_96.Lifetime = local_103;
    local_96.Priority = Priority;
    Make local_120;
    local_120;
    UCommonPopupSettings local_102 = CommonPopupSettings::Get();
    return;
}
void SmallHintCustom(const TSoftClassPtr<UEUIUserWidget> &inout SmallSideHintWidget, const FEUIModelContainer &inout WidgetModels, const int Priority = 0)
{
    UScriptAsToCppModelFunctionRouter::Get().OnShowSmallHint.Execute(SmallSideHintWidget, WidgetModels);
    return;
}
void Dialog(const FText &inout Title, const FText &inout Message, const TArray<FCommonDialogOption> &inout Options, const FDialogCallback &inout Callback, const FCommonDialogParam &inout ExtraParam = FCommonDialogParam())
{
    UScriptAsToCppModelFunctionRouter::Get().OnOpenCommonDialog.Execute(Title, Message, Options, Callback, ExtraParam);
    return;
}
void Dialog_Confirm(const FText &inout Title, const FText &inout Message, const FDialogCallback &inout Callback, const FText &inout ConfirmText = FText(), const FCommonDialogParam &inout ExtraParam = FCommonDialogParam())
{
    UCommonPopupSettings local_4 = CommonPopupSettings::Get();
    FEUIInputAction local_10;
    if (local_4.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_10))
    {
        TArray<FCommonDialogOption> local_16;
        local_16.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_10, ConfirmText));
        CommonPopup::Dialog(Title, Message, local_16, Callback, ExtraParam);
    }
    return;
}
void RewardDialog(const FCommonRewardDialogParam &inout Param)
{
    CommonPopup_Internal::OpenRewardDialog(Param);
    return;
}
void RewardDialog_Confirm(const FText &inout Title, const TArray<FRewardItemEntry> &inout Items, const FDialogCallback &inout Callback = FDialogCallback(), const FText &inout Description = FText(), const FText &inout RewardHint = FText(), const FText &inout ConfirmText = FText())
{
    FCommonRewardDialogParam local_62;
    local_62.Title = Title;
    local_62.Description = Description;
    local_62.RewardHint = RewardHint;
    local_62.Items = Items;
    CommonPopup::RewardDialog_BuildConfirm(local_62, ConfirmText);
    return;
}
void RewardDialog_Decision(const FText &inout Title, const TArray<FRewardItemEntry> &inout Items, const FDialogCallback &inout Callback, const FText &inout Description = FText(), const FText &inout RewardHint = FText(), const FText &inout ConfirmText = FText(), const FText &inout CancelText = FText())
{
    FCommonRewardDialogParam local_62;
    local_62.Title = Title;
    local_62.Description = Description;
    local_62.RewardHint = RewardHint;
    local_62.Items = Items;
    CommonPopup::RewardDialog_BuildDecision(local_62, ConfirmText, CancelText);
    return;
}
void RewardDialog_BuildConfirm(FCommonRewardDialogParam &inout Param, const FText &inout ConfirmText)
{
    UCommonPopupSettings local_4 = CommonPopupSettings::Get();
    FEUIInputAction local_10;
    if (local_4.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_10))
    {
        Param.Options.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_10, ConfirmText));
        CommonPopup::RewardDialog(Param);
    }
    return;
}
void RewardDialog_BuildDecision(FCommonRewardDialogParam &inout Param, const FText &inout ConfirmText, const FText &inout CancelText)
{
    UCommonPopupSettings local_4 = CommonPopupSettings::Get();
    FEUIInputAction local_10;
    FEUIInputAction local_16;
    if (!(!(local_4.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_10))) && local_4.CommonDialogAction.Find(ECommonDialogAnswerType(2), local_16))
    {
        Param.Options.Add(FCommonDialogOption(ECommonDialogAnswerType(2), local_16, CancelText));
        Param.Options.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_10, ConfirmText));
        CommonPopup::RewardDialog(Param);
    }
    return;
}
void Dialog_Decision(const FText &inout Title, const FText &inout Message, const FDialogCallback &inout Callback, const FText &inout ConfirmText = FText(), const FText &inout CancelText = FText(), const FCommonDialogParam &inout ExtraParam = FCommonDialogParam())
{
    UCommonPopupSettings local_4 = CommonPopupSettings::Get();
    FEUIInputAction local_10;
    FEUIInputAction local_16;
    if (!(!(local_4.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_10))) && local_4.CommonDialogAction.Find(ECommonDialogAnswerType(2), local_16))
    {
        TArray<FCommonDialogOption> local_24;
        local_24.Add(FCommonDialogOption(ECommonDialogAnswerType(2), local_16, CancelText));
        local_24.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_10, ConfirmText));
        CommonPopup::Dialog(Title, Message, local_24, Callback, ExtraParam);
    }
    return;
}
void Dialog_Decision(const ULocalPlayer LocalPlayer, const FText &inout Title, const FText &inout Message, const FDialogCallback &inout Callback, const FText &inout ConfirmText = FText(), const FText &inout CancelText = FText(), const FCommonDialogParam &inout ExtraParam = FCommonDialogParam())
{
    UCommonPopupSettings local_4 = CommonPopupSettings::Get();
    FEUIInputAction local_10;
    FEUIInputAction local_16;
    if (!(!(local_4.CommonDialogAction.Find(ECommonDialogAnswerType(1), local_10))) && local_4.CommonDialogAction.Find(ECommonDialogAnswerType(2), local_16))
    {
        TArray<FCommonDialogOption> local_24;
        local_24.Add(FCommonDialogOption(ECommonDialogAnswerType(2), local_16, CancelText));
        local_24.Add(FCommonDialogOption(ECommonDialogAnswerType(1), local_10, ConfirmText));
        CommonPopup_Internal::OpenDialogForLocalPlayer(LocalPlayer, Title, Message, local_24, Callback, ExtraParam);
    }
    return;
}
FCommonHoverHandle HoverCustom(const UWidget HoverForWidget, const TSoftClassPtr<UUserWidget> &inout HoverWidget, const FEUIModelContainer &inout Models = FEUIModelContainer(), const bool bClickClose = false, const bool bFocusHover = true, const ECommonHoverLayout HoverLayout = ECommonHoverLayout::Right, const EEUILayoutLayer TargetLayer = EEUILayoutLayer::Invalid, const bool bPinned = false)
{
    FCommonHoverHandle __r;
    FCommonHoverInfo local_52 = FCommonHoverInfo::MakeForWidget(HoverForWidget, HoverWidget, Models);
    if (!(!(!(local_52))))
    {
    }
    else
    {
        if (int(TargetLayer) == 0)
        {
            int local_109 = int(FEUIWidget::GetWidgetLayoutLayer(HoverForWidget));
        }
        else
        {
        }
        CommonPopup::HoverWithCustomHoverInfo(HoverForWidget, local_52.SetClickClose(bClickClose).SetPinned(bPinned).SetFocusHover(bFocusHover).SetHoverLayout().SetTargetLayer());
    }
    return __r;
}
FCommonHoverHandle HoverPinnedPassThrough(const UWidget HoverForWidget, const TSoftClassPtr<UUserWidget> &inout HoverWidget, const FEUIModelContainer &inout Models = FEUIModelContainer(), const bool bFocusHover = true, const ECommonHoverLayout HoverLayout = ECommonHoverLayout::Right, const EEUILayoutLayer TargetLayer = EEUILayoutLayer::Invalid)
{
    FCommonHoverHandle __r;
    FCommonHoverInfo local_52 = FCommonHoverInfo::MakeForWidget(HoverForWidget, HoverWidget, Models);
    if (!(!(!(local_52))))
    {
    }
    else
    {
        if (int(TargetLayer) == 0)
        {
            int local_109 = int(FEUIWidget::GetWidgetLayoutLayer(HoverForWidget));
        }
        else
        {
        }
        CommonPopup::HoverWithCustomHoverInfo(HoverForWidget, local_52.SetOutsideCloseMode(ECommonHoverOutsideCloseMode(2)).SetPinned(true).SetFocusHover(bFocusHover).SetHoverLayout().SetTargetLayer());
    }
    return __r;
}
FCommonHoverHandle HoverChildCustom(const FCommonHoverHandle &inout ParentHoverHandle, const UWidget HoverForWidget, const TSoftClassPtr<UUserWidget> &inout HoverWidget, const FEUIModelContainer &inout Models = FEUIModelContainer(), const bool bClickClose = false, const bool bFocusHover = true, const ECommonHoverLayout HoverLayout = ECommonHoverLayout::Right, const EEUILayoutLayer TargetLayer = EEUILayoutLayer::Invalid, const bool bPinned = false)
{
    FCommonHoverHandle __r;
    if (!(!(!(FCommonHoverInfo::MakeForWidget(HoverForWidget, HoverWidget, Models)))))
    {
    }
    else
    {
        if (int(TargetLayer) == 0)
        {
            int local_109 = int(FEUIWidget::GetWidgetLayoutLayer(HoverForWidget));
        }
        else
        {
        }
    }
    return __r;
}
FCommonHoverHandle HoverChildPinnedPassThrough(const FCommonHoverHandle &inout ParentHoverHandle, const UWidget HoverForWidget, const TSoftClassPtr<UUserWidget> &inout HoverWidget, const FEUIModelContainer &inout Models = FEUIModelContainer(), const bool bFocusHover = true, const ECommonHoverLayout HoverLayout = ECommonHoverLayout::Right, const EEUILayoutLayer TargetLayer = EEUILayoutLayer::Invalid)
{
    FCommonHoverHandle __r;
    if (!(!(!(FCommonHoverInfo::MakeForWidget(HoverForWidget, HoverWidget, Models)))))
    {
    }
    else
    {
        if (int(TargetLayer) == 0)
        {
            int local_109 = int(FEUIWidget::GetWidgetLayoutLayer(HoverForWidget));
        }
        else
        {
        }
    }
    return __r;
}
FCommonHoverHandle HoverCustom(const FGeometry &inout HoverForGeometry, const TSoftClassPtr<UUserWidget> &inout HoverWidget, const EEUILayoutLayer TargetLayer, const FEUIModelContainer &inout Models = FEUIModelContainer(), const bool bClickClose = false, const UObject Context = nullptr, const bool bFocusHover = true, const ECommonHoverLayout HoverLayout = ECommonHoverLayout::Right, const bool bPinned = false)
{
    FCommonHoverHandle __r;
    FCommonHoverInfo local_52 = FCommonHoverInfo::MakeForGeometry(HoverForGeometry, HoverWidget, Models);
    if (!(!(!(local_52))))
    {
    }
    else
    {
        CommonPopup::HoverWithCustomHoverInfo(Context, local_52.SetClickClose(bClickClose).SetPinned(bPinned).SetFocusHover(bFocusHover).SetHoverLayout().SetTargetLayer());
    }
    return __r;
}
FCommonHoverHandle HoverCustom(const FVector2D &inout HoverPosition, const TSoftClassPtr<UUserWidget> &inout HoverWidget, const EEUILayoutLayer TargetLayer, const FEUIModelContainer &inout Models = FEUIModelContainer(), const ECommonHoverLayout HoverLayout = ECommonHoverLayout::Right)
{
    FCommonHoverHandle __r;
    FCommonHoverInfo local_52 = FCommonHoverInfo::MakeForPosition(HoverPosition, HoverWidget, Models);
    if (!(!(!(local_52))))
    {
    }
    else
    {
        CommonPopup::HoverWithCustomHoverInfo(nullptr, local_52.SetHoverLayout(ECommonHoverLayout(HoverLayout)).SetTargetLayer());
    }
    return __r;
}
FCommonHoverHandle HoverWithCustomHoverInfo(const UObject ContextObject, const FCommonHoverInfo &inout HoverInfo)
{
    FCommonHoverHandle __r;
    if (!(!(!(HoverInfo))))
    {
    }
    else
    {
        FString local_6 = "None";
        if (IsValid(ContextObject))
        {
            local_6 = ContextObject.GetName();
        }
        FBox2D local_20 = HoverInfo.AnchorsViewportSpace;
        float local_23 = int(HoverInfo.HoverLayout);
        FString local_10 = HoverInfo.ContentWidget.GetAssetName();
        XLog(ELog(16), FString().Append("CommonHover Open: Widget=").Append(local_6).Append(" AnchorsMin=(").Append(local_20.Min.X).Append(", ").Append(local_20.Min.Y).Append(") AnchorsMax=(").Append(local_20.Max.X).Append(", ").Append(local_10).Append(") Layout=").Append(local_23).Append(" Content=").Append(local_10));
        FCommonHoverHandle local_34 = UScriptAsToCppModelFunctionRouter::Get().OnHoverCustom.Execute(HoverInfo, ContextObject);
    }
    return __r;
}
void SetHoverClickClose(const FCommonHoverHandle &inout Handle, const bool bClickClose, const UObject ContextObject = nullptr)
{
    if (!(Handle))
    {
        return;
    }
    FCommonHoverHandle local_56;
    UScriptAsToCppModelFunctionRouter::Get().OnGetHoverInfo.Execute(local_56, Handle);
    local_56.SetClickClose(bClickClose);
    UScriptAsToCppModelFunctionRouter local_4 = UScriptAsToCppModelFunctionRouter::Get();
    return;
}
void SetHover(const FCommonHoverHandle &inout Handle, const FEUIModelContainer &inout Models, const UObject ContextObject = nullptr)
{
    if (!(Handle))
    {
        return;
    }
    FCommonHoverInfo local_54;
    UObject local_110;
    UScriptAsToCppModelFunctionRouter::Get().OnGetHoverInfo.Execute(Handle, local_110);
    local_54.ContentModels = Models;
    UScriptAsToCppModelFunctionRouter::Get().OnSetHoverInfo.Execute(Handle, local_54, ContextObject);
    return;
}
void PinHoverPassThrough(const FCommonHoverHandle &inout Handle, const UObject ContextObject = nullptr)
{
    if (!(Handle))
    {
        return;
    }
    FCommonHoverHandle local_56;
    UScriptAsToCppModelFunctionRouter::Get().OnGetHoverInfo.Execute(local_56, Handle);
    local_56.SetOutsideCloseMode(ECommonHoverOutsideCloseMode(2));
    local_56.SetPinned(true);
    UScriptAsToCppModelFunctionRouter local_4 = UScriptAsToCppModelFunctionRouter::Get();
    return;
}
void SetHover(const FCommonHoverHandle &inout Handle, const UWidget HoverForWidget, const UObject ContextObject = nullptr)
{
    if (!(Handle) || !(IsValid(HoverForWidget)))
    {
        return;
    }
    FGeometry local_16 = HoverForWidget.GetTickSpaceGeometry();
    FGeometry local_32 = WidgetLayout::GetViewportWidgetGeometry(__GetWorldContext());
    FCommonHoverHandle local_100;
    UScriptAsToCppModelFunctionRouter::Get().OnGetHoverInfo.Execute(local_100, Handle);
    local_100.AnchorsViewportSpace.Min = local_32.AbsoluteToLocal(local_16.LocalToAbsolute(FVector2D::ZeroVector));
    local_100.AnchorsViewportSpace.Max = local_32.AbsoluteToLocal(local_16.LocalToAbsolute(local_16.GetLocalSize()));
    UScriptAsToCppModelFunctionRouter local_48 = UScriptAsToCppModelFunctionRouter::Get();
    return;
}
bool IsHoverDisplayed(const FCommonHoverHandle &inout Handle, const UObject ContextObject = nullptr)
{
    if (!(Handle))
    {
        return false;
    }
    return UScriptAsToCppModelFunctionRouter::Get().OnIsHoverDisplayed.Execute(Handle, ContextObject);
}
bool IsHoverClickClose(const FCommonHoverHandle &inout Handle, const UObject ContextObject = nullptr)
{
    if (!(Handle))
    {
        return false;
    }
    FCommonHoverInfo local_56 = UScriptAsToCppModelFunctionRouter::Get().OnGetHoverInfo.Execute(Handle, ContextObject);
    return local_56.HasBlockingCloseMask() || local_56.IsPinnedPassThrough() || local_56.BlocksSiblingHover();
}
bool HasAnyHover()
{
    return UScriptAsToCppModelFunctionRouter::Get().OnHasAnyHover.Execute();
}
void CloseAllHover()
{
    UScriptAsToCppModelFunctionRouter::Get().OnCloseAllHover.Execute();
    return;
}
void CloseHover(const FCommonHoverHandle &inout Handle, const UObject ContextObject, const bool bOnlyNotClickClose = true)
{
    if (!(Handle))
    {
        return;
    }
    if (bOnlyNotClickClose && CommonPopup::IsHoverClickClose(Handle, ContextObject))
    {
        return;
    }
    UScriptAsToCppModelFunctionRouter::Get().OnCloseHover.Execute(Handle, ContextObject);
    return;
}
void CloseHoverByContentWidget(const UEUIUserWidget ContentWidget)
{
    FEUIMessageBus::PublishOrPatchWithWidgetReferencedModels(EUIMessageBus).opCall(ContentWidget);
    return;
}
}
