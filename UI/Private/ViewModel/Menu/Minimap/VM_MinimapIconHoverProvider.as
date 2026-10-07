
namespace FVM_MinimapIconDecorator
{
    const int ModelId = 0;
}
namespace FVM_MinimapIconHoverProvider
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ShowHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HideHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature CloseFixedHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetGuideTarget = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature MarkEntity = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature FastMarkEntity = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature MarkAndGuideEntity = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature CancelMarkAndGuideEntity = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature TeleportToEntity = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature RequestTeleportToEntityWithConfirm = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnPublicEventTeleportDialogCallback = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectIcon = FEUIModelCallbackSignature();

}
struct FVM_MinimapIconDecorator : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EMinimapIconDecoratorType m_DecoratorType;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> m_DecoratorWidgetClass;
    UPROPERTY()
    FEUIModelRef m_DecoratorWidgetModel;

    FVM_MinimapIconDecorator()
    {
        this.m_DecoratorType = EMinimapIconDecoratorType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MinimapIconDecorator' by default constructor.");
        return;
    }
    FVM_MinimapIconDecorator(const FVM_MinimapIconDecorator &inout Other)
    {
        this.m_DecoratorType = EMinimapIconDecoratorType(0);
        this.m_DecoratorType = Other.m_DecoratorType;
        this.m_DecoratorWidgetClass = Other.m_DecoratorWidgetClass;
        this.m_DecoratorWidgetModel = Other.m_DecoratorWidgetModel;
        return;
    }
    FVM_MinimapIconDecorator(const EMinimapIconDecoratorType InDecoratorType)
    {
        this.m_DecoratorType = EMinimapIconDecoratorType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDecoratorType(EMinimapIconDecoratorType(InDecoratorType));
        return;
    }
    FVM_MinimapIconDecorator& opAssign(const FVM_MinimapIconDecorator &inout Other)
    {
        this.m_DecoratorType = Other.m_DecoratorType;
        this.m_DecoratorWidgetClass = Other.m_DecoratorWidgetClass;
        return Other.m_DecoratorWidgetModel;
    }
    void Setup(const FMinimapIconDecoratorData &inout DecoratorData)
    {
        this.SetDecoratorWidgetClass(DecoratorData.DecoratorWidgetClass);
        this.SetDecoratorWidgetModel(DecoratorData.DecoratorWidgetModel);
        return;
    }
    EMinimapIconDecoratorType GetDecoratorType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DecoratorType;
    }
    void SetDecoratorType(const EMinimapIconDecoratorType __Value) property
    {
        if (int(this.m_DecoratorType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DecoratorType = __Value;
        return;
    }
    TSoftClassPtr<UUserWidget> GetDecoratorWidgetClass() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DecoratorWidgetClass;
    }
    void SetDecoratorWidgetClass(const TSoftClassPtr<UUserWidget> &inout __Value) property
    {
        if ((this.m_DecoratorWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DecoratorWidgetClass = __Value;
        return;
    }
    const FEUIModelRef GetDecoratorWidgetModel() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelRef GetModify_DecoratorWidgetModel() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDecoratorWidgetModel(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DecoratorWidgetModel = __Value;
        return;
    }
}

struct FVM_MinimapIconHoverProvider : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIcon> m_MinimapIcon;
    UPROPERTY()
    bool m_bAllowGuide;
    UPROPERTY()
    bool m_bAllowMark;
    UPROPERTY()
    bool m_bAllowTeleport;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_TooltipWidgetClass;
    UPROPERTY()
    FEUIModelContainer m_TooltipModels;
    UPROPERTY()
    bool m_MarkHoverTrigger;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;

    FVM_MinimapIconHoverProvider()
    {
        this.m_bAllowGuide = false;
        this.m_bAllowMark = false;
        this.m_bAllowTeleport = false;
        this.m_MarkHoverTrigger = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MinimapIconHoverProvider' by default constructor.");
        return;
    }
    FVM_MinimapIconHoverProvider(const FVM_MinimapIconHoverProvider &inout Other)
    {
        this.m_bAllowGuide = false;
        this.m_bAllowMark = false;
        this.m_bAllowTeleport = false;
        this.m_MarkHoverTrigger = false;
        this.m_MinimapIcon = Other.m_MinimapIcon;
        this.m_bAllowGuide = Other.m_bAllowGuide;
        this.m_bAllowMark = Other.m_bAllowMark;
        this.m_bAllowTeleport = Other.m_bAllowTeleport;
        this.m_TooltipWidgetClass = Other.m_TooltipWidgetClass;
        this.m_TooltipModels = Other.m_TooltipModels;
        this.m_MarkHoverTrigger = Other.m_MarkHoverTrigger;
        return;
    }
    FVM_MinimapIconHoverProvider(const TEUIModelRef<FVM_MinimapIcon> &inout InMinimapIcon)
    {
        this.m_bAllowGuide = false;
        this.m_bAllowMark = false;
        this.m_bAllowTeleport = false;
        this.m_MarkHoverTrigger = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMinimapIcon(InMinimapIcon);
        return;
    }
    FVM_MinimapIconHoverProvider opAssign(const FVM_MinimapIconHoverProvider &inout Other)
    {
        FVM_MinimapIconHoverProvider __r;
        this.m_MinimapIcon = Other.m_MinimapIcon;
        this.m_bAllowGuide = Other.m_bAllowGuide;
        this.m_bAllowMark = Other.m_bAllowMark;
        this.m_bAllowTeleport = Other.m_bAllowTeleport;
        this.m_TooltipWidgetClass = Other.m_TooltipWidgetClass;
        this.m_TooltipModels = Other.m_TooltipModels;
        this.m_MarkHoverTrigger = Other.m_MarkHoverTrigger;
        return __r;
    }
    void BeginDestroy()
    {
        ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetManager(), false);
        return;
    }
    void ShowHover(const bool bFixMode)
    {
        int local_50 = 0;
        if (!(this.GetMinimapIcon().opArrow().GetOwningIcon().IsValid()))
        {
            return;
        }
        if (this.GetHoverHandle())
        {
            ::CommonPopup::SetHoverClickClose(this.GetHoverHandle(), bFixMode, this.GetContext().Manager);
            return;
        }
        if (this.GetTooltipModels().IsEmpty())
        {
            FPresentationSpotDisplayModelData local_10;
            local_10.Spot = this.GetMinimapIcon().opArrow().GetSpot();
            local_10.SpotUsage = EPresentationSpotUsage(0);
            Make local_28;
            this.SetTooltipModels(local_28.opImplConv());
        }
        if (!(FEUIModelContainer::GetModel(this.GetTooltipModels()).opCall()))
        {
            TEUIModelWeakRef<FVM_MinimapIconHoverProvider> local_48 = TEUIModelWeakRef<FVM_MinimapIconHoverProvider>(this);
            this.GetModify_TooltipModels().AddModel(FEUIModelRef(local_50), false);
        }
        if (this.GetTooltipWidgetClass().IsNull())
        {
            FSpotViewAdapter local_70;
            TDataObjectPtr<FMinimapIconConfig> local_94 = ::GetMinimapIconConfig(this.GetMinimapIcon().opArrow().GetSpot().opArrow(), local_70);
            if (local_94)
            {
                if (int(local_94.opArrow().IconType) == 0)
                {
                    CastTo local_126;
                    this.SetTooltipWidgetClass(local_126.opCall().opArrow().CustomTooltipWidget);
                }
            }
            if (this.GetTooltipWidgetClass().IsNull())
            {
                this.SetTooltipWidgetClass(::MinimapUtils::GetMinimapGlobalConfig().DefaultTooltipWidgetClass);
            }
        }
        bool local_5 = false;
        TSoftClassPtr<UUserWidget> local_62 = this.GetTooltipWidgetClass();
        TWeakObjectPtr<UEUIUserWidget> local_4 = this.GetMinimapIcon().opArrow().GetOwningIcon();
        UEUIUserWidget local_154;
        this.SetHoverHandle(::CommonPopup::HoverCustom(local_154, local_62, this.GetTooltipModels(), bFixMode, true, ECommonHoverLayout(0), EEUILayoutLayer(0), local_5));
        FEUIModelContainer::GetModel(this.GetTooltipModels()).opCall().UpdateTooltipActions();
        return;
    }
    void HideHover()
    {
        ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetManager(), true);
        return;
    }
    void CloseFixedHover()
    {
        ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetManager(), false);
        return;
    }
    bool SetGuideTarget() const
    {
        if (!(this.GetbAllowGuide()))
        {
            return false;
        }
        if (::FGuidingPathUtils::ExistsAnyGuidingPath(this.GetContext().GetLocalPlayer()) && (::FGuidingPathUtils::GetGuidingPathTargetEntityID(this.GetContext().GetLocalPlayer()) == this.GetEntityID()))
        {
            ::FGuidingPathUtils::RequestGuidingPathCancel(this.GetContext().GetLocalPlayer());
        }
        else
        {
            if ((!((this.GetEntityID() == ENTITY_ID_NULL))))
            {
                ::FGuidingPathUtils::RequestGuidingPathToEntityID(this.GetEntityID(), this.GetContext().GetLocalPlayer());
            }
            else
            {
                if (this.GetMinimapIcon().opArrow().GetSpot().opArrow().GetTransform().Has3DPosition())
                {
                    ::FGuidingPathUtils::RequestGuidingPathToLocation(this.GetMinimapIcon().opArrow().GetSpot().opArrow().GetTransform().GetPosition(), this.GetContext().GetLocalPlayer());
                }
                else
                {
                    ::FGuidingPathUtils::RequestGuidingPathToLocation2D(this.GetMinimapIcon().opArrow().GetSpot().opArrow().GetTransform().GetPosition2D(), this.GetContext().GetLocalPlayer());
                }
            }
        }
        return true;
    }
    bool MarkEntity() const
    {
        int local_14 = 0;
        if (!(this.GetbAllowMark()) || !(this.GetMinimapIcon().opArrow().GetOwningIcon().IsValid()))
        {
            return false;
        }
        if (::MarkUtil::IsEntityMarkedBySelf(this.GetContext().GetLocalPlayer(), this.GetEntityID()) || ::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetEntityID()))
        {
            ::MarkUtil::RequestRemoveMark(this.GetContext().GetLocalPlayer(), this.GetEntityID());
        }
        else
        {
            FECSEntityId local_8 = this.GetEntityID();
            FEUIModelContainer local_36 = FEUIModelContainer(local_14);
            UMarkSettings local_16 = ::MarkUtil_Internal::GetMinimapMarkIconsSetting();
            TWeakObjectPtr<UEUIUserWidget> local_6;
            local_6 = this.GetMinimapIcon().opArrow().GetOwningIcon();
            UEUIUserWidget local_18;
            ::CommonPopup::HoverCustom(local_18, local_16.MinimapMarkDialog, local_36, false, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false);
        }
        return true;
    }
    void FastMarkEntity() const
    {
        if (!(this.GetbAllowMark()))
        {
            return;
        }
        if ((this.GetEntityID() == ENTITY_ID_NULL))
        {
            ::MarkUtil::RequestFastMarkPositionFromMinimap(this.GetContext().GetLocalPlayer(), this.GetMinimapIcon().opArrow().GetSpot().opArrow().GetTransform().GetPosition2D(), false);
            return;
        }
        if (::MarkUtil::IsEntityMarkedBySelf(this.GetContext().GetLocalPlayer(), this.GetEntityID()) || ::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetEntityID()))
        {
            ::MarkUtil::RequestRemoveMark(this.GetContext().GetLocalPlayer(), this.GetEntityID());
            return;
        }
        ::MarkUtil::RequestFastMarkEntityFromMinimap(this.GetContext().GetLocalPlayer(), this.GetEntityID());
        return;
    }
    bool MarkAndGuideEntity() const
    {
        if ((this.GetEntityID() == ENTITY_ID_NULL) && ::FMS_CrossDSMarkGuide::Get(this.GetManager()).TryRequestCrossDSMarkGuide(this.GetMinimapIcon().opArrow().GetSpot()))
        {
            return true;
        }
        this.FastMarkEntity();
        return this.SetGuideTarget();
    }
    bool CancelMarkAndGuideEntity() const
    {
        bool local_1 = false;
        if (this.GetbAllowGuide() && ::FGuidingPathUtils::ExistsAnyGuidingPath(this.GetContext().GetLocalPlayer()) && (::FGuidingPathUtils::GetGuidingPathTargetEntityID(this.GetContext().GetLocalPlayer()) == this.GetEntityID()))
        {
            ::FGuidingPathUtils::RequestGuidingPathCancel(this.GetContext().GetLocalPlayer());
            local_1 = true;
        }
        if (this.GetbAllowMark() && (::MarkUtil::IsEntityMarkedBySelf(this.GetContext().GetLocalPlayer(), this.GetEntityID()) || ::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetEntityID())))
        {
            ::MarkUtil::RequestRemoveMark(this.GetContext().GetLocalPlayer(), this.GetEntityID());
            local_1 = true;
        }
        return local_1;
    }
    bool TeleportToEntity() const
    {
        if (!(this.GetbAllowTeleport()))
        {
            return false;
        }
        FSpotViewAdapter local_14;
        TEUIModelRef<FM_PresentationData_Teleporter> local_16 = ::GetTeleporterData(this.GetMinimapIcon().opArrow().GetSpot().opArrow(), local_14);
        if (local_16)
        {
            ::FVM_TeleporterUtils::Get(this.GetManager()).RequestTeleportWithConfirm(local_16.opArrow().GetTeleporterConfig());
            return true;
        }
        if ((!((this.GetEntityID() == ENTITY_ID_NULL))))
        {
            if (!(::FGameConnectionUtils::UICheckTeleportAllowed(this.GetContext().GetLocalPlayerPawn(), true)))
            {
                return false;
            }
            ::FGameConnectionUtils::UICallMoveToWorldEvent(this.GetContext().GetLocalPlayer(), this.GetEntityID(), ELoadingScreenAction(1));
            return true;
        }
        bool local_27 = false;
        return local_27;
    }
    void RequestTeleportToEntityWithConfirm()
    {
        if (!(this.GetbAllowTeleport()) || (this.GetEntityID() == ENTITY_ID_NULL))
        {
            return;
        }
        if (!(::FGameConnectionUtils::UICheckTeleportAllowed(this.GetContext().GetLocalPlayerPawn(), true)))
        {
            return;
        }
        FDialogModelCallback local_34;
        local_34.Bind(this, FVM_MinimapIconHoverProvider::OnPublicEventTeleportDialogCallback);
        FText local_80 = FText();
        FText local_84 = FText();
        FDialogCallback local_66 = FDialogCallback(local_34);
        FText local_70 = NSLOCTEXT("MinimapIconDecorator", "TeleportToPublicEventConfirm", "жЇеђ¦зЎ®и®¤дј йЂЃи‡іиЇҐдЅЌзЅ®пјџ");
        FText local_74 = NSLOCTEXT("MinimapIconDecorator", "TeleportToPublicEventConfirmTitle", "жЏђз¤є");
        FCommonDialogParam local_76;
        ::CommonPopup::Dialog_Decision(local_74, local_70, local_66, local_84, local_80, local_76);
        return;
    }
    bool OnPublicEventTeleportDialogCallback(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            if (::FGameConnectionUtils::UICheckTeleportAllowed(this.GetContext().GetLocalPlayerPawn(), true))
            {
                ::FGameConnectionUtils::UICallMoveToWorldEvent(this.GetContext().GetLocalPlayer(), this.GetEntityID(), ELoadingScreenAction(1));
            }
        }
        return true;
    }
    void SelectIcon()
    {
        UEUIMinimap local_8;
        TWeakObjectPtr<UEUIMinimap> local_4 = this.GetMinimapIcon().opArrow().GetOwningMinimap();
        if (local_8 != nullptr)
        {
            TWeakObjectPtr<UEUIUserWidget> local_14 = this.GetMinimapIcon().opArrow().GetOwningIcon();
            UEUIUserWidget local_16;
            local_8.SetSelectedIconWidget(local_16);
        }
        return;
    }
    void OnAllowActionFlagsChanged()
    {
        FVM_MinimapIconTooltip& local_6 = FEUIModelContainer::GetModel(this.GetTooltipModels()).opCall();
        if (local_6)
        {
            local_6.UpdateTooltipActions();
        }
        return;
    }
    FECSEntityId GetEntityID() const property
    {
        return ::GetOwnerEntityId(this.GetMinimapIcon().opArrow().GetSpot().opArrow());
    }
    TEUIModelRef<FVM_MinimapIcon> GetMinimapIcon() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MinimapIcon;
    }
    void SetMinimapIcon(const TEUIModelRef<FVM_MinimapIcon> &inout __Value) property
    {
        TEUIModelRef<FVM_MinimapIcon> local_2;
        local_2 = this.m_MinimapIcon;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MinimapIcon = __Value;
        return;
    }
    bool GetbAllowGuide() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bAllowGuide;
    }
    void SetbAllowGuide(const bool __Value) property
    {
        if (!(this.m_bAllowGuide) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bAllowGuide = __Value;
        return;
    }
    bool GetbAllowMark() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bAllowMark;
    }
    void SetbAllowMark(const bool __Value) property
    {
        if (!(this.m_bAllowMark) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bAllowMark = __Value;
        return;
    }
    bool GetbAllowTeleport() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bAllowTeleport;
    }
    void SetbAllowTeleport(const bool __Value) property
    {
        if (!(this.m_bAllowTeleport) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bAllowTeleport = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetTooltipWidgetClass() const property
    {
        this.TrackPropertyRead(4);
        return this.m_TooltipWidgetClass;
    }
    void SetTooltipWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_TooltipWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TooltipWidgetClass = __Value;
        return;
    }
    const FEUIModelContainer GetTooltipModels() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIModelContainer GetModify_TooltipModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetTooltipModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TooltipModels = __Value;
        return;
    }
    bool GetMarkHoverTrigger() const property
    {
        this.TrackPropertyRead(6);
        return this.m_MarkHoverTrigger;
    }
    void SetMarkHoverTrigger(const bool __Value) property
    {
        if (!(this.m_MarkHoverTrigger) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MarkHoverTrigger = __Value;
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
}

struct __GeneratedProperties_FVM_MinimapIconDecorator
{
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIconDecorator> Self;

    __GeneratedProperties_FVM_MinimapIconDecorator()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapIconHoverProvider
{
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIconHoverProvider> Self;

    __GeneratedProperties_FVM_MinimapIconHoverProvider()
    {
        return;
    }
}

namespace FVM_MinimapIconDecorator
{
FVM_MinimapIconDecorator& Create(const UObject ContextObject, const EMinimapIconDecoratorType DecoratorType)
{
    return FVM_MinimapIconDecorator::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MinimapIconDecorator CreateByManager(const UEUIManagerSubsystem Manager, const EMinimapIconDecoratorType DecoratorType)
{
    FVM_MinimapIconDecorator __r;
    TEUIModelRef<FVM_MinimapIconDecorator> local_6 = TEUIModelRef<FVM_MinimapIconDecorator>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapIconDecorator::ModelId, 0, DecoratorType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DecoratorWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DecoratorWidgetModel";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapIconDecorator>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapIconDecorator;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapIconDecorator;
}
TSoftClassPtr<UUserWidget> __UIGetter_DecoratorWidgetClass(const FVM_MinimapIconDecorator &inout Model)
{
    return Model.GetDecoratorWidgetClass();
}
FEUIModelRef __UIGetter_DecoratorWidgetModel(const FVM_MinimapIconDecorator &inout Model)
{
    return Model.GetDecoratorWidgetModel();
}
TEUIModelRef<FVM_MinimapIconDecorator> __UIGetter_Self(const FVM_MinimapIconDecorator &inout Model)
{
    return TEUIModelRef<FVM_MinimapIconDecorator>(Model);
}
int __IndexOf_DecoratorType()
{
    return 0;
}
int __IndexOf_DecoratorWidgetClass()
{
    return 1;
}
int __IndexOf_DecoratorWidgetModel()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MinimapIconDecorator
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_MinimapIconHoverProvider
{
FVM_MinimapIconHoverProvider& Create(const UObject ContextObject, const TEUIModelRef<FVM_MinimapIcon> &inout MinimapIcon)
{
    return FVM_MinimapIconHoverProvider::CreateByManager(EUIInternal::GetContextManager(ContextObject), MinimapIcon);
}
FVM_MinimapIconHoverProvider CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_MinimapIcon> &inout MinimapIcon)
{
    FVM_MinimapIconHoverProvider __r;
    TEUIModelRef<FVM_MinimapIconHoverProvider> local_6 = TEUIModelRef<FVM_MinimapIconHoverProvider>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapIconHoverProvider::ModelId, 0, MinimapIcon));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bAllowGuide";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bAllowMark";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bAllowTeleport";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapIconHoverProvider>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapIconHoverProvider;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnAllowActionFlagsChanged";
    local_24.DirtyFlags.Set(FVM_MinimapIconHoverProvider::__IndexOf_bAllowTeleport());
    local_24.DirtyFlags.Set(FVM_MinimapIconHoverProvider::__IndexOf_bAllowMark());
    local_24.DirtyFlags.Set(FVM_MinimapIconHoverProvider::__IndexOf_bAllowGuide());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapIconHoverProvider;
}
void __OnAllowActionFlagsChanged(FVM_MinimapIconHoverProvider &inout Model)
{
    Model.OnAllowActionFlagsChanged();
    return;
}
bool __UIGetter_bAllowGuide(const FVM_MinimapIconHoverProvider &inout Model)
{
    return Model.GetbAllowGuide();
}
bool __UIGetter_bAllowMark(const FVM_MinimapIconHoverProvider &inout Model)
{
    return Model.GetbAllowMark();
}
bool __UIGetter_bAllowTeleport(const FVM_MinimapIconHoverProvider &inout Model)
{
    return Model.GetbAllowTeleport();
}
TEUIModelRef<FVM_MinimapIconHoverProvider> __UIGetter_Self(const FVM_MinimapIconHoverProvider &inout Model)
{
    return TEUIModelRef<FVM_MinimapIconHoverProvider>(Model);
}
int __IndexOf_MinimapIcon()
{
    return 0;
}
int __IndexOf_bAllowGuide()
{
    return 1;
}
int __IndexOf_bAllowMark()
{
    return 2;
}
int __IndexOf_bAllowTeleport()
{
    return 3;
}
int __IndexOf_TooltipWidgetClass()
{
    return 4;
}
int __IndexOf_TooltipModels()
{
    return 5;
}
int __IndexOf_MarkHoverTrigger()
{
    return 6;
}
int __IndexOf_HoverHandle()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_MinimapIconHoverProvider
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
