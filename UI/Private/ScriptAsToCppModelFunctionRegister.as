

class UScriptAsToCppModelFunctionRegister : UAsToCppModelFunctionRegister
{
    UPROPERTY()
    UScriptAsToCppModelFunctionRouter Router;

    UScriptAsToCppModelFunctionRegister()
    {
        return;
    }
    UFUNCTION()
    void OnInitialize_Implementation()
    {
        this.Router = ::UScriptAsToCppModelFunctionRouter::Get();
        this.Router.OnIsSystemUnlock.BindUFunction(this, n"IsSystemUnlock");
        this.Router.OnIsShopUnlocked.BindUFunction(this, n"IsShopUnlocked");
        this.Router.OnHasItem.BindUFunction(this, n"HasItem");
        this.Router.OnGetItemNumToReachInventoryAndBankLimit.BindUFunction(this, n"GetItemNumToReachInventoryAndBankLimit");
        this.Router.OnGetGetTotalItemNum.BindUFunction(this, n"GetGetTotalItemNum");
        this.Router.OnGetItemNum.BindUFunction(this, n"GetItemNum");
        this.Router.OnShowLargeHint.BindUFunction(this, n"ShowLargeHint");
        this.Router.OnShowSmallHint.BindUFunction(this, n"ShowSmallHint");
        this.Router.OnOpenTips.BindUFunction(this, n"OpenTips");
        this.Router.OnOpenWeakTips.BindUFunction(this, n"OpenWeakTips");
        this.Router.OnOpenCommonDialog.BindUFunction(this, n"OpenCommonDialog");
        this.Router.OnHoverCustom.BindUFunction(this, n"HoverCustom");
        this.Router.OnGetHoverInfo.BindUFunction(this, n"GetHoverInfo");
        this.Router.OnSetHoverInfo.BindUFunction(this, n"SetHoverInfo");
        this.Router.OnIsHoverDisplayed.BindUFunction(this, n"IsHoverDisplayed");
        this.Router.OnHasAnyHover.BindUFunction(this, n"HasAnyHover");
        this.Router.OnCloseAllHover.BindUFunction(this, n"CloseAllHover");
        this.Router.OnCloseHover.BindUFunction(this, n"CloseHover");
        this.Router.OnRequestStartCommission.BindUFunction(this, n"RequestStartCommission");
        this.Router.OnIsEntityMinimapIconVisibleByLocalPlayer.BindUFunction(this, n"IsEntityMinimapIconVisibleByLocalPlayer");
        this.Router.OnFindRegisteredEntityMinimapIconHandle.BindUFunction(this, n"FindRegisteredEntityMinimapIconHandle");
        this.Router.OnOpenECSWorldLifetimePageByTag.BindUFunction(this, n"OpenECSWorldLifetimePageByTag");
        this.Router.OnOpenECSWorldLifetimePageByClass.BindUFunction(this, n"OpenECSWorldLifetimePageByClass");
        this.Router.OnCloseECSWorldLifetimePage.BindUFunction(this, n"CloseECSWorldLifetimePage");
        this.Router.OnCloseAllECSWorldLifetimePages.BindUFunction(this, n"CloseAllECSWorldLifetimePages");
        return;
    }
    UFUNCTION()
    bool IsSystemUnlock(const TDataObjectPtr<FSystemControlConfig> &inout SystemControlConfig, const bool bShowTips = true)
    {
        return ::FMS_SystemControl::Get(::FASCommonUtils::GetLocalPlayerController()).IsSystemUnlock(SystemControlConfig, bShowTips);
    }
    UFUNCTION()
    bool IsShopUnlocked(const TDataObjectPtr<FShopConfig> &inout ShopConfig)
    {
        return ::FMS_ShopGoodsData::Get(this).IsShopUnlocked(ShopConfig);
    }
    UFUNCTION()
    bool HasItem(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
    {
        return ::FMS_PlayerInventory::Get(::FASCommonUtils::GetLocalPlayerController()).HasItem(ItemConfig);
    }
    UFUNCTION()
    int GetItemNumToReachInventoryAndBankLimit(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
    {
        return ::FMS_PlayerInventory::Get(::FASCommonUtils::GetLocalPlayerController()).GetItemNumToReachInventoryAndBankLimit(ItemConfig);
    }
    UFUNCTION()
    int GetGetTotalItemNum(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
    {
        return ::FMS_PlayerInventory::Get(::FASCommonUtils::GetLocalPlayerController()).GetTotalItemNum(ItemConfig);
    }
    UFUNCTION()
    int GetItemNum(const uint64 ItemUid)
    {
        TEUIModelRef<FM_ItemData> local_4 = ::FMS_PlayerInventory::Get(::FASCommonUtils::GetLocalPlayerController()).FindItemDataByUid(ItemUid);
        if (local_4)
        {
            return local_4.opArrow().GetNum();
        }
        return 0;
    }
    UFUNCTION()
    void ShowLargeHint(const TSoftClassPtr<UEUIUserWidget> &inout LargeSideHintWidget, const FEUIModelContainer &inout WidgetModels, const int Priority)
    {
        TEUIModelRef<FM_CommonSideHintManager> local_6 = ::FMS_CommonSideHintManagerAccessor::Get(ECS::GetUEWorld()).GetLargeSideHintManager();
        TEUIModelRef<FM_CommonSideHintManager> local_4;
        if (local_4)
        {
            ::CommonPopup_Internal::ShowSideHint(local_4, LargeSideHintWidget, WidgetModels, Priority);
        }
        return;
    }
    UFUNCTION()
    void ShowSmallHint(const TSoftClassPtr<UEUIUserWidget> &inout SmallSideHintWidget, const FEUIModelContainer &inout WidgetModels, const int Priority)
    {
        TEUIModelRef<FM_CommonSideHintManager> local_6 = ::FMS_CommonSideHintManagerAccessor::Get(ECS::GetUEWorld()).GetSmallSideHintManager();
        TEUIModelRef<FM_CommonSideHintManager> local_4;
        if (local_4)
        {
            ::CommonPopup_Internal::ShowSideHint(local_4, SmallSideHintWidget, WidgetModels, Priority);
        }
        return;
    }
    UFUNCTION()
    void OpenTips(const FText &inout Content, const FCommonTipsParam &inout ExtraParam)
    {
        ::CommonPopup_Internal::OpenTips(Content, ExtraParam, ECommonTipsType(0), FEUIModelContainer(), nullptr);
        return;
    }
    UFUNCTION()
    void OpenWeakTips(const FText &inout Content, const FCommonTipsParam &inout ExtraParam)
    {
        ::CommonPopup_Internal::OpenTips(Content, ExtraParam, ECommonTipsType(1), FEUIModelContainer(), nullptr);
        return;
    }
    UFUNCTION()
    void OpenCommonDialog(const FText &inout Title, const FText &inout Message, const TArray<FCommonDialogOption> &inout Options, const FDialogCallback &inout Callback, const FCommonDialogParam &inout ExtraParam)
    {
        ::CommonPopup_Internal::OpenDialog(Title, Message, Options, Callback, ExtraParam);
        return;
    }
    UFUNCTION()
    FCommonHoverHandle HoverCustom(const FCommonHoverInfo &inout HoverInfo, const UObject ContextObject)
    {
        FCommonHoverHandle __r;
        ::CommonPopup_Internal::HoverCustom(HoverInfo, ContextObject);
        return __r;
    }
    UFUNCTION()
    FCommonHoverInfo GetHoverInfo(const FCommonHoverHandle &inout Handle, const UObject ContextObject = nullptr)
    {
        FCommonHoverInfo __r;
        ::CommonPopup_Internal::GetHoverInfo(Handle, ContextObject);
        return __r;
    }
    UFUNCTION()
    void SetHoverInfo(const FCommonHoverHandle &inout Handle, const FCommonHoverInfo &inout HoverInfo, const UObject ContextObject = nullptr)
    {
        ::CommonPopup_Internal::SetHoverInfo(Handle, HoverInfo, ContextObject);
        return;
    }
    UFUNCTION()
    bool IsHoverDisplayed(const FCommonHoverHandle &inout Handle, const UObject ContextObject = nullptr)
    {
        return ::CommonPopup_Internal::IsHoverDisplayed(Handle, ContextObject);
    }
    UFUNCTION()
    bool HasAnyHover()
    {
        FMS_CommonHoverManager& local_4 = ::FMS_CommonHoverManager::Get(ECS::GetUEWorld());
        if (local_4)
        {
            return !(local_4.GetDisplayingHovers().IsEmpty());
        }
        return false;
    }
    UFUNCTION()
    void CloseAllHover()
    {
        FMS_CommonHoverManager& local_4 = ::FMS_CommonHoverManager::Get(ECS::GetUEWorld());
        if (local_4)
        {
            local_4.CloseAllHover();
        }
        return;
    }
    UFUNCTION()
    void CloseHover(const FCommonHoverHandle &inout Handle, const UObject ContextObject)
    {
        if ((!((ContextObject != nullptr))))
        {
            return;
        }
        FMS_CommonHoverManager& local_4 = ::FMS_CommonHoverManager::Get(ContextObject);
        if (local_4)
        {
            local_4.CloseHover(Handle);
        }
        return;
    }
    UFUNCTION()
    bool RequestStartCommission(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
    {
        FMS_CommissionData& local_4 = ::FMS_CommissionData::Get(::FASCommonUtils::GetLocalPlayerController());
        if (local_4)
        {
            TEUIModelRef<FM_Commission> local_8 = local_4.FindFirstCommissionsByConfig(CommissionConfig);
            if (local_8.IsValid())
            {
                local_4.GS_RequestStartCommission(local_8);
                return true;
            }
        }
        return false;
    }
    UFUNCTION()
    bool IsEntityMinimapIconVisibleByLocalPlayer(const FECSEntityId &inout EntityID)
    {
        return ::MinimapUtils_Internal::IsEntityMinimapIconVisibleByLocalPlayer(EntityID);
    }
    UFUNCTION()
    FMinimapIconHandle FindRegisteredEntityMinimapIconHandle(const FECSEntityId &inout EntityID)
    {
        APlayerController local_4 = ::FASCommonUtils::GetLocalPlayerController();
        TEUIModelRef<FM_Spot> local_6 = ::PresentationSpotUtils::GetEntitySpot(local_4, EntityID);
        if (local_6)
        {
            FMinimapIconHandle local_12;
            if (::FMS_PresentationSpotMinimapIconManager::Get(local_4).GetSpotIconHandles().Find(local_6, local_12))
            {
                return local_12;
            }
        }
        return local_12;
    }
    UFUNCTION()
    FEUIWidgetRef OpenECSWorldLifetimePageByTag(const FGameplayTag &inout PageTag, const FEUIModelContainer &inout Models)
    {
        return ::FMS_ECSWorldLifetimePageManager::Get(::FASCommonUtils::GetLocalPlayerController()).OpenPageByTag(PageTag, Models);
    }
    UFUNCTION()
    FEUIWidgetRef OpenECSWorldLifetimePageByClass(const TSoftClassPtr<UEUIUserWidget> &inout PageClass)
    {
        return ::FMS_ECSWorldLifetimePageManager::Get(::FASCommonUtils::GetLocalPlayerController()).OpenPageByClass(PageClass);
    }
    UFUNCTION()
    void CloseECSWorldLifetimePage(const FEUIWidgetRef &inout Page)
    {
        ::FMS_ECSWorldLifetimePageManager::Get(::FASCommonUtils::GetLocalPlayerController()).ClosePage(Page);
        return;
    }
    UFUNCTION()
    void CloseAllECSWorldLifetimePages()
    {
        ::FMS_ECSWorldLifetimePageManager::Get(::FASCommonUtils::GetLocalPlayerController()).CloseAllPages();
        return;
    }
}

namespace CommonPopup_Internal
{
FGameplayTag GetTipsPopupType(const ECommonTipsType Type)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FGameplayTag __r; return __r;
}
bool IsSameTipsContentPendingOrDisplaying(FCS_CommonTipsManager &inout Manager, const ECommonTipsType Type, const FText &inout Content)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
FEUIWidgetRef CreateTipsWidget(const ULocalPlayer LocalPlayer, const ECommonTipsType Type, const FText &inout Content, const FEUIModelContainer &inout TypeSpecificModels)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FEUIWidgetRef __r; return __r;
}
void OpenTips(const FText &inout Content, const FCommonTipsParam &inout ExtraParam, const ECommonTipsType Type, const FEUIModelContainer &inout TypeSpecificModels = FEUIModelContainer(), const ULocalPlayer FallbackLocalPlayer = nullptr)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void OpenTipsWithoutECSWorld(const ULocalPlayer LocalPlayer, const FText &inout Content, const FCommonTipsParam &inout ExtraParam, const ECommonTipsType Type, const FEUIModelContainer &inout TypeSpecificModels = FEUIModelContainer())
{
    if ((!((LocalPlayer != nullptr))))
    {
        return;
    }
    UCommonPopupSettings local_6 = CommonPopupSettings::Get();
    FCommonTipsSettings local_10;
    if (!(local_6.TipsSettings.Find(Type, local_10)))
    {
        XError(ELog(16), FString().Append("No tips settings found for type: ").Append(Type));
        return;
    }
    FVM_CommonTips& local_18 = FVM_CommonTips::Create(LocalPlayer, Content);
    float32 local_19 = ExtraParam.LifetimeOverride;
    if (local_19 <= 0.0f)
    {
        local_19 = local_10.DefaultTipsLifetime;
    }
    local_18.SetbEnableAutoCloseByLifetime(true);
    local_18.SetAutoCloseLifetimeSeconds(local_19);
    FEUIModelContainer local_34 = TypeSpecificModels;
    local_34.AddModel(FEUIModelRef(local_18), false);
    FEUIWidget::AddWidgetWithModelContainer(LocalPlayer, local_10.WidgetTag, local_34);
    return;
}
void CloseTipsByViewRef(const FEUIWidgetRef &inout ViewRef)
{
    UPage_CommonTips local_6 = (Cast<UPage_CommonTips>(ViewRef.RequireWidget()));
    if (local_6 != nullptr)
    {
        local_6.CloseCommonTips();
    }
    else
    {
        FEUIWidget::RemoveWidget(ViewRef);
    }
    return;
}
void OpenDialog(const FText &inout Title, const FText &inout Message, const TArray<FCommonDialogOption> &inout Options, const FDialogCallback &inout Callback, const FCommonDialogParam &inout ExtraParam)
{
    APlayerController local_2 = FASCommonUtils::GetLocalPlayerController();
    if (local_2 != nullptr)
    {
        ULocalPlayer local_8 = local_2.GetLocalPlayer();
        FVM_CommonDialog& local_12 = FVM_CommonDialog::Create(local_8, Title, Message, Options, Callback);
        local_12.SetbIsForbidIgnored(ExtraParam.bIsForbidIgnored);
        FEUIWidget::AddWidgetByClass(local_8, CommonPopupSettings::Get().CommonDialogWidget, FEUIModelRef(local_12));
    }
    return;
}
void OpenDialogForLocalPlayer(const ULocalPlayer LocalPlayer, const FText &inout Title, const FText &inout Message, const TArray<FCommonDialogOption> &inout Options, const FDialogCallback &inout Callback, const FCommonDialogParam &inout ExtraParam = FCommonDialogParam())
{
    if (LocalPlayer != nullptr)
    {
        FEUIWidget::AddWidgetByClass(LocalPlayer, CommonPopupSettings::Get().CommonDialogWidget, FEUIModelRef(FVM_CommonDialog::Create(LocalPlayer, Title, Message, Options, Callback)));
    }
    return;
}
void OpenRewardDialog(const FCommonRewardDialogParam &inout Param)
{
    int local_16 = 0;
    APlayerController local_2 = FASCommonUtils::GetLocalPlayerController();
    if (local_2 != nullptr)
    {
        ULocalPlayer local_8 = local_2.GetLocalPlayer();
        TEUIModelRef<FVM_CommonRewardList> local_14 = TEUIModelRef<FVM_CommonRewardList>(FVM_CommonRewardList::Create(local_8, Param.Items));
        local_16.SetRewardHintText(Param.RewardHint);
        TSoftClassPtr<UEUIUserWidget> local_28;
        if (Param.WidgetClassOverride.IsNull())
        {
            local_28 = CommonPopupSettings::Get().CommonRewardDialogWidget;
        }
        else
        {
            local_28 = Param.WidgetClassOverride;
        }
        FEUIWidget::AddWidgetByClass(local_8, local_28, FEUIModelRef(local_16));
    }
    return;
}
FCommonHoverHandle HoverCustom(const FCommonHoverInfo &inout HoverInfo, const UObject ContextObject = nullptr)
{
    UObject local_6;
    FCommonHoverHandle __r;
    if (ContextObject != nullptr)
    {
    }
    else
    {
        local_6 = Cast<UObject>(ECS::GetUEWorld());
    }
    FMS_CommonHoverManager& local_8 = FMS_CommonHoverManager::Get(local_6);
    local_8.OpenHover(HoverInfo);
    return __r;
}
FCommonHoverInfo GetHoverInfo(const FCommonHoverHandle &inout Handle, const UObject ContextObject = nullptr)
{
    UObject local_6;
    FCommonHoverInfo __r;
    if (ContextObject != nullptr)
    {
    }
    else
    {
        local_6 = Cast<UObject>(ECS::GetUEWorld());
    }
    FMS_CommonHoverManager& local_8 = FMS_CommonHoverManager::Get(local_6);
    if (local_8)
    {
        FCommonHoverInfo local_62 = local_8.GetHover(Handle);
    }
    else
    {
    }
    return __r;
}
void SetHoverInfo(const FCommonHoverHandle &inout Handle, const FCommonHoverInfo &inout HoverInfo, const UObject ContextObject = nullptr)
{
    UObject local_6;
    if (ContextObject != nullptr)
    {
    }
    else
    {
        local_6 = Cast<UObject>(ECS::GetUEWorld());
    }
    FMS_CommonHoverManager& local_8 = FMS_CommonHoverManager::Get(local_6);
    if (local_8)
    {
        local_8.SetHover(Handle, HoverInfo);
    }
    return;
}
bool IsHoverDisplayed(const FCommonHoverHandle &inout Handle, const UObject ContextObject = nullptr)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
void ShowSideHint(const TEUIModelRef<FM_CommonSideHintManager> &inout SideHintManager, const TSoftClassPtr<UEUIUserWidget> &inout SideHintWidget, const FEUIModelContainer &inout WidgetModels, const int Priority = 0)
{
    FEUIDynamicWidgetData local_24;
    local_24.WidgetClass = SideHintWidget;
    local_24.ModelContainer = WidgetModels;
    SideHintManager.opArrow().ShowSideHint(local_24, Priority);
    return;
}
}
namespace MinimapUtils_Internal
{
bool IsEntityMinimapIconVisibleByLocalPlayer(const FECSEntityId &inout EntityID)
{
    TEUIModelRef<FM_Spot> local_4 = PresentationSpotUtils::GetEntitySpot(FASCommonUtils::GetLocalPlayerController(), EntityID);
    if (local_4)
    {
        FSpotViewAdapter local_16;
        return GetMinimapIconConfig(local_4.opArrow(), local_16).IsSet();
    }
    return false;
}
}
