

// NOTE: class defaults are not authored in this module: FMissionAction_OpenPage (default scalar field FMissionActionBase.ActionType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FMissionAction_OpenPage : FMissionActionBase
{
    FMissionActionBase _base_FMissionActionBase;
    UPROPERTY()
    FGameplayTag WidgetTag;

    FMissionAction_OpenPage()
    {
        this.__InitDefaults();
        return;
    }
    EMissionActionStatus TickAction_Implementation(const FMissionActionContext &inout Context)
    {
        if (!(this.WidgetTag.IsValid()))
        {
            XError(ELog(63), FString().Append("Widget tag is not set, OpenPage Action is invalid"));
            return EMissionActionStatus(4);
        }
        if (!(::ECSWorldLifetimePage::Open(this.WidgetTag, FEUIModelContainer()).IsValid()))
        {
            XError(ELog(64), FString().Append("Failed to open page, widget tag=").Append(this.WidgetTag));
        }
        return EMissionActionStatus(3);
    }
}

struct FMissionAction_OpenShop : FMissionActionBase
{
    FMissionActionBase _base_FMissionActionBase;
    UPROPERTY()
    TDataObjectPtr<FShopConfig> ShopConfig;

    FMissionAction_OpenShop()
    {
        this.__InitDefaults();
        return;
    }
    EMissionActionStatus TickAction_Implementation(const FMissionActionContext &inout Context)
    {
        if (!(this.ShopConfig.IsSet()))
        {
            XError(ELog(63), FString().Append("ShopConfig is not set, OpenShop Action failed."));
            return EMissionActionStatus(4);
        }
        if (::FASCommonUtils::GetLocalPlayerController() != nullptr)
        {
            if (!(::UScriptAsToCppModelFunctionRouter::Get().OnIsShopUnlocked.Execute(this.ShopConfig)))
            {
                FCommonTipsParam local_22;
                ::CommonPopup::WeakTips(NSLOCTEXT("Shop", "ShopNotUnlocked", "е•†еє—жњЄи§Јй”Ѓ"), local_22);
            }
            else
            {
                FShopPanelModelData local_46;
                local_46.ShopConfig = this.ShopConfig;
                Make local_84;
                ::ECSWorldLifetimePage::Open(GameplayTags::UI_Type_Shop, local_84.opImplConv());
            }
        }
        return EMissionActionStatus(3);
    }
}

struct FMissionAction_OpenRegionMap : FMissionActionBase
{
    FMissionActionBase _base_FMissionActionBase;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelInfoConfig;

    FMissionAction_OpenRegionMap()
    {
        this.__InitDefaults();
        return;
    }
    EMissionActionStatus TickAction_Implementation(const FMissionActionContext &inout Context)
    {
        if (!(this.LevelInfoConfig))
        {
            XError(ELog(63), FString().Append("LevelInfoConfig is not set, OpenRegionMap Action is invalid"));
            return EMissionActionStatus(4);
        }
        ::GuideUtils::OpenRegionMap(this.LevelInfoConfig);
        return EMissionActionStatus(3);
    }
}

