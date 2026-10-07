

class UScriptAsToCppModelFunctionRouter : UAsToCppModelFunctionRouter
{
    UPROPERTY()
    FAsToCpp_IsSystemUnlockedDelegate OnIsSystemUnlock;
    UPROPERTY()
    FAsToCpp_IsShopUnlockedDelegate OnIsShopUnlocked;
    UPROPERTY()
    FAsToCpp_HasItemDelegate OnHasItem;
    UPROPERTY()
    FAsToCpp_ItemNumDelegate OnGetItemNumToReachInventoryAndBankLimit;
    UPROPERTY()
    FAsToCpp_ItemNumDelegate OnGetGetTotalItemNum;
    UPROPERTY()
    FAsToCpp_ItemUidToNumDelegate OnGetItemNum;
    UPROPERTY()
    FAsToCpp_ShowSideHintDelegate OnShowLargeHint;
    UPROPERTY()
    FAsToCpp_ShowSideHintDelegate OnShowSmallHint;
    UPROPERTY()
    FAsToCpp_OpenTipsDelegate OnOpenTips;
    UPROPERTY()
    FAsToCpp_OpenTipsDelegate OnOpenWeakTips;
    UPROPERTY()
    FAsToCpp_OpenCommonDialogDelegate OnOpenCommonDialog;
    UPROPERTY()
    FAsToCpp_HoverCustomDelegate OnHoverCustom;
    UPROPERTY()
    FAsToCpp_GetHoverInfoDelegate OnGetHoverInfo;
    UPROPERTY()
    FAsToCpp_SetHoverInfoDelegate OnSetHoverInfo;
    UPROPERTY()
    FAsToCpp_IsHoverDisplayedDelegate OnIsHoverDisplayed;
    UPROPERTY()
    FAsToCpp_HasAnyHoverDelegate OnHasAnyHover;
    UPROPERTY()
    FAsToCpp_SimpleDelegate OnCloseAllHover;
    UPROPERTY()
    FAsToCpp_CloseHoverDelegate OnCloseHover;
    UPROPERTY()
    FAsToCpp_RequestStartCommissionDelegate OnRequestStartCommission;
    UPROPERTY()
    FAsToCpp_IsEntityMinimapIconVisibleByLocalPlayerDelegate OnIsEntityMinimapIconVisibleByLocalPlayer;
    UPROPERTY()
    FAsToCpp_FindRegisteredEntityMinimapIconHandle OnFindRegisteredEntityMinimapIconHandle;
    UPROPERTY()
    FAsToCpp_OpenECSWorldLifetimePageByTagDelegate OnOpenECSWorldLifetimePageByTag;
    UPROPERTY()
    FAsToCpp_OpenECSWorldLifetimePageByClassDelegate OnOpenECSWorldLifetimePageByClass;
    UPROPERTY()
    FAsToCpp_CloseECSWorldLifetimePageDelegate OnCloseECSWorldLifetimePage;
    UPROPERTY()
    FAsToCpp_SimpleDelegate OnCloseAllECSWorldLifetimePages;

    UScriptAsToCppModelFunctionRouter()
    {
        return;
    }
}

delegate void FAsToCpp_SimpleDelegate();

delegate bool FAsToCpp_IsSystemUnlockedDelegate(const TDataObjectPtr<FSystemControlConfig> &inout SystemControlConfig, const bool bShowTips = true);

delegate bool FAsToCpp_IsShopUnlockedDelegate(const TDataObjectPtr<FShopConfig> &inout ShopConfig);

delegate bool FAsToCpp_HasItemDelegate(const TDataObjectPtr<FItemConfig> &inout ItemConfig);

delegate int FAsToCpp_ItemNumDelegate(const TDataObjectPtr<FItemConfig> &inout ItemConfig);

delegate int FAsToCpp_ItemUidToNumDelegate(const uint64 ItemUid);

delegate void FAsToCpp_ShowSideHintDelegate(const TSoftClassPtr<UEUIUserWidget> &inout SideHintWidget, const FEUIModelContainer &inout WidgetModels, const int32 Priority);

delegate void FAsToCpp_OpenTipsDelegate(const FText &inout Content, const FCommonTipsParam &inout ExtraParam);

delegate void FAsToCpp_OpenCommonDialogDelegate(const FText &inout Title, const FText &inout Message, const TArray<FCommonDialogOption> &inout Options, const FDialogCallback &inout Callback, const FCommonDialogParam &inout ExtraParam);

delegate FCommonHoverHandle FAsToCpp_HoverCustomDelegate(const FCommonHoverInfo &inout HoverInfo, const UObject ContextObject);

delegate FCommonHoverInfo FAsToCpp_GetHoverInfoDelegate(const FCommonHoverHandle &inout Handle, const UObject ContextObject);

delegate void FAsToCpp_SetHoverInfoDelegate(const FCommonHoverHandle &inout Handle, const FCommonHoverInfo &inout HoverInfo, const UObject ContextObject);

delegate bool FAsToCpp_IsHoverDisplayedDelegate(const FCommonHoverHandle &inout Handle, const UObject ContextObject);

delegate bool FAsToCpp_HasAnyHoverDelegate();

delegate void FAsToCpp_CloseHoverDelegate(const FCommonHoverHandle &inout Handle, const UObject ContextObject);

delegate bool FAsToCpp_RequestStartCommissionDelegate(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig);

delegate bool FAsToCpp_IsEntityMinimapIconVisibleByLocalPlayerDelegate(const FECSEntityId &inout EntityID);

delegate FMinimapIconHandle FAsToCpp_FindRegisteredEntityMinimapIconHandle(const FECSEntityId &inout EntityID);

delegate FEUIWidgetRef FAsToCpp_OpenECSWorldLifetimePageByTagDelegate(const FGameplayTag &inout PageTag, const FEUIModelContainer &inout Models);

delegate FEUIWidgetRef FAsToCpp_OpenECSWorldLifetimePageByClassDelegate(const TSoftClassPtr<UEUIUserWidget> &inout PageClass);

delegate void FAsToCpp_CloseECSWorldLifetimePageDelegate(const FEUIWidgetRef &inout Page);

