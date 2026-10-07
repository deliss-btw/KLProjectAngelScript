
namespace FVMS_CurrentRole
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelectMain = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectSub = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarBuildPage = FEUIModelCallbackSignature();

}
struct FVMS_CurrentRole : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_MainAvatarConfig;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_SubAvatarConfig;
    UPROPERTY()
    int m_SlotIndex;
    UPROPERTY()
    bool m_bChangeRoleClicked;

    FVMS_CurrentRole()
    {
        this.m_SlotIndex = 0;
        this.m_bChangeRoleClicked = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_CurrentRole(const FVMS_CurrentRole &inout Other)
    {
        this.m_SlotIndex = 0;
        this.m_bChangeRoleClicked = false;
        this.m_MainAvatarConfig = Other.m_MainAvatarConfig;
        this.m_SubAvatarConfig = Other.m_SubAvatarConfig;
        this.m_SlotIndex = int(Other.m_SlotIndex);
        this.m_bChangeRoleClicked = Other.m_bChangeRoleClicked;
        return;
    }
    FVMS_CurrentRole opAssign(const FVMS_CurrentRole &inout Other)
    {
        FVMS_CurrentRole __r;
        this.m_MainAvatarConfig = Other.m_MainAvatarConfig;
        this.m_SubAvatarConfig = Other.m_SubAvatarConfig;
        this.m_SlotIndex = int(Other.m_SlotIndex);
        this.m_bChangeRoleClicked = Other.m_bChangeRoleClicked;
        return __r;
    }
    void PostConstruct()
    {
        this.RefreshRoleInfo();
        return;
    }
    void RefreshRoleInfo()
    {
        UDataTable local_20;
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        const FC_PlayerController& local_10 = local_8.opCall();
        if (local_10)
        {
            FECSWorldUIRef::GetDefaulted<FCS_AvatarConfigTable> local_16 = FECSWorldUIRef::GetDefaulted<FCS_AvatarConfigTable>(this.GetContext().World);
            if (local_20 != nullptr && (local_10.GetAllPlayerPawnEntities().Num() > 1))
            {
                FName local_692;
                local_20.FindRow(::GetPrefabAvatarName(local_10.GetAllPlayerPawnEntities()[0]), local_692);
                this.SetMainAvatarConfig(TDataObjectPtr<FAvatarPrefabConfig>());
                local_20.FindRow(::GetPrefabAvatarName(local_10.GetAllPlayerPawnEntities()[1]), local_692);
                this.SetSubAvatarConfig(TDataObjectPtr<FAvatarPrefabConfig>());
            }
        }
        this.SetbChangeRoleClicked(false);
        return;
    }
    void OnSelectMain()
    {
        this.SetSlotIndex(0);
        this.SetbChangeRoleClicked(true);
        return;
    }
    void OnSelectSub()
    {
        this.SetSlotIndex(1);
        this.SetbChangeRoleClicked(true);
        return;
    }
    FText GetMainAvatarName() const
    {
        FText __return;
        if (this.GetMainAvatarConfig())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FSlateBrush GetMainAvatarIcon() const
    {
        if (this.GetMainAvatarConfig())
        {
            return this.GetMainAvatarConfig().opArrow().AvatarIcon.LoadBrush();
        }
        return FSlateBrush();
    }
    FSlateBrush GetMainPlayerPowerIcon() const
    {
        FSlateBrush local_92;
        if (this.GetMainAvatarConfig())
        {
            FSlateBrush local_48;
            local_48.ResourceObject = local_92.ResourceObject;
            return local_48;
        }
        return local_92;
    }
    FSlateBrush GetMainPlayerTachie() const
    {
        FSlateBrush local_48;
        if (this.GetMainAvatarConfig())
        {
            return local_48;
        }
        return local_48;
    }
    FSlateBrush GetMainPlayerTachieBack() const
    {
        FSlateBrush local_48;
        if (this.GetMainAvatarConfig())
        {
            return local_48;
        }
        return local_48;
    }
    FSlateBrush GetMainPlayerClassIcon() const
    {
        FSlateBrush local_92;
        if (this.GetMainAvatarConfig())
        {
            FSlateBrush local_48;
            local_48.ResourceObject = local_92.ResourceObject;
            return local_48;
        }
        return local_92;
    }
    FText GetMainPlayerIllustrate1() const
    {
        FText __return;
        if (this.GetMainAvatarConfig())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FText GetMainPlayerIllustrate2() const
    {
        int local_2 = 0;
        if (this.GetMainAvatarConfig())
        {
            return ::FASCommonUtils::GetWeaponTypeDisplayName(EWeaponType(local_2));
        }
        return FText();
    }
    FText GetSubAvatarName() const
    {
        FText __return;
        if (this.GetSubAvatarConfig())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FSlateBrush GetSubAvatarIcon() const
    {
        if (this.GetSubAvatarConfig())
        {
            return this.GetSubAvatarConfig().opArrow().AvatarIcon.LoadBrush();
        }
        return FSlateBrush();
    }
    FSlateBrush GetSubPlayerPowerIcon() const
    {
        FSlateBrush local_92;
        if (this.GetSubAvatarConfig())
        {
            FSlateBrush local_48;
            local_48.ResourceObject = local_92.ResourceObject;
            return local_48;
        }
        return local_92;
    }
    FSlateBrush GetSubPlayerTachie() const
    {
        FSlateBrush local_48;
        if (this.GetSubAvatarConfig())
        {
            return local_48;
        }
        return local_48;
    }
    FSlateBrush GetSubPlayerTachieBack() const
    {
        FSlateBrush local_48;
        if (this.GetSubAvatarConfig())
        {
            return local_48;
        }
        return local_48;
    }
    FSlateBrush GetSubPlayerClassIcon() const
    {
        FSlateBrush local_92;
        if (this.GetSubAvatarConfig())
        {
            FSlateBrush local_48;
            local_48.ResourceObject = local_92.ResourceObject;
            return local_48;
        }
        return local_92;
    }
    FText GetSubPlayerIllustrate1() const
    {
        FText __return;
        if (this.GetSubAvatarConfig())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FText GetSubPlayerIllustrate2() const
    {
        int local_2 = 0;
        if (this.GetSubAvatarConfig())
        {
            return ::FASCommonUtils::GetWeaponTypeDisplayName(EWeaponType(local_2));
        }
        return FText();
    }
    FText GetHealthInfo() const
    {
        return FText::Format(NSLOCTEXT("HealthInfo", "з”џе‘Ѕпјљ{0}"), FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::HPMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue()));
    }
    FText GetStaminaInfo() const
    {
        return FText::Format(NSLOCTEXT("StaminaInfo", "дЅ“еЉ›пјљ{0}"), FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), Attribute::StaminaMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue()));
    }
    int GetCurrentLevel() const
    {
        return ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
    }
    FText GetEXPText() const
    {
        FM_LocalPlayerLevel& local_2 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager);
        return FText::Format(NSLOCTEXT("EXPFormat", "з»ЏйЄЊеЂјпјљ{0}/{1}"), local_2.GetCurrentExp(), local_2.GetUpgradeExp());
    }
    void GotoAvatarBuildPage()
    {
        ::FVM_AvatarBuildPage::GotoPage(this.GetContext().UELocalPlayer, this.GetMainAvatarConfig());
        return;
    }
    const TDataObjectPtr<FAvatarPrefabConfig> GetMainAvatarConfig() const property
    {
        const TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_MainAvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMainAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MainAvatarConfig = __Value;
        return;
    }
    const TDataObjectPtr<FAvatarPrefabConfig> GetSubAvatarConfig() const property
    {
        const TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_SubAvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSubAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SubAvatarConfig = __Value;
        return;
    }
    int GetSlotIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SlotIndex;
    }
    void SetSlotIndex(const int __Value) property
    {
        if (this.m_SlotIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SlotIndex = __Value;
        return;
    }
    bool GetbChangeRoleClicked() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bChangeRoleClicked;
    }
    void SetbChangeRoleClicked(const bool __Value) property
    {
        if (!(this.m_bChangeRoleClicked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bChangeRoleClicked = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_CurrentRole
{
    UPROPERTY()
    FText MainAvatarName;
    UPROPERTY()
    FSlateBrush MainAvatarIcon;
    UPROPERTY()
    FSlateBrush MainPlayerPowerIcon;
    UPROPERTY()
    FSlateBrush MainPlayerTachie;
    UPROPERTY()
    FSlateBrush MainPlayerTachieBack;
    UPROPERTY()
    FSlateBrush MainPlayerClassIcon;
    UPROPERTY()
    FText MainPlayerIllustrate1;
    UPROPERTY()
    FText MainPlayerIllustrate2;
    UPROPERTY()
    FText SubAvatarName;
    UPROPERTY()
    FSlateBrush SubAvatarIcon;
    UPROPERTY()
    FSlateBrush SubPlayerPowerIcon;
    UPROPERTY()
    FSlateBrush SubPlayerTachie;
    UPROPERTY()
    FSlateBrush SubPlayerTachieBack;
    UPROPERTY()
    FSlateBrush SubPlayerClassIcon;
    UPROPERTY()
    FText SubPlayerIllustrate1;
    UPROPERTY()
    FText SubPlayerIllustrate2;
    UPROPERTY()
    FText HealthInfo;
    UPROPERTY()
    FText StaminaInfo;
    UPROPERTY()
    int CurrentLevel;
    UPROPERTY()
    FText EXPText;
    UPROPERTY()
    TEUIModelRef<FVMS_CurrentRole> Self;


}

namespace FVMS_CurrentRole
{
FVMS_CurrentRole& Get(const UObject ContextObject)
{
    return FVMS_CurrentRole::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_CurrentRole GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_CurrentRole __r;
    TEUIModelRef<FVMS_CurrentRole> local_6 = TEUIModelRef<FVMS_CurrentRole>(EUIInternal::MakeModelWithManager(Manager, FVMS_CurrentRole::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MainAvatarName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainAvatarIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainPlayerPowerIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainPlayerTachie";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainPlayerTachieBack";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainPlayerClassIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainPlayerIllustrate1";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainPlayerIllustrate2";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubAvatarName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubAvatarIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubPlayerPowerIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubPlayerTachie";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubPlayerTachieBack";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubPlayerClassIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubPlayerIllustrate1";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubPlayerIllustrate2";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HealthInfo";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StaminaInfo";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EXPText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_CurrentRole>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_CurrentRole;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_CurrentRole;
}
FText __UIGetter_MainAvatarName(const FVMS_CurrentRole &inout Model)
{
    return Model.GetMainAvatarName();
}
FSlateBrush __UIGetter_MainAvatarIcon(const FVMS_CurrentRole &inout Model)
{
    return Model.GetMainAvatarIcon();
}
FSlateBrush __UIGetter_MainPlayerPowerIcon(const FVMS_CurrentRole &inout Model)
{
    return Model.GetMainPlayerPowerIcon();
}
FSlateBrush __UIGetter_MainPlayerTachie(const FVMS_CurrentRole &inout Model)
{
    return Model.GetMainPlayerTachie();
}
FSlateBrush __UIGetter_MainPlayerTachieBack(const FVMS_CurrentRole &inout Model)
{
    return Model.GetMainPlayerTachieBack();
}
FSlateBrush __UIGetter_MainPlayerClassIcon(const FVMS_CurrentRole &inout Model)
{
    return Model.GetMainPlayerClassIcon();
}
FText __UIGetter_MainPlayerIllustrate1(const FVMS_CurrentRole &inout Model)
{
    return Model.GetMainPlayerIllustrate1();
}
FText __UIGetter_MainPlayerIllustrate2(const FVMS_CurrentRole &inout Model)
{
    return Model.GetMainPlayerIllustrate2();
}
FText __UIGetter_SubAvatarName(const FVMS_CurrentRole &inout Model)
{
    return Model.GetSubAvatarName();
}
FSlateBrush __UIGetter_SubAvatarIcon(const FVMS_CurrentRole &inout Model)
{
    return Model.GetSubAvatarIcon();
}
FSlateBrush __UIGetter_SubPlayerPowerIcon(const FVMS_CurrentRole &inout Model)
{
    return Model.GetSubPlayerPowerIcon();
}
FSlateBrush __UIGetter_SubPlayerTachie(const FVMS_CurrentRole &inout Model)
{
    return Model.GetSubPlayerTachie();
}
FSlateBrush __UIGetter_SubPlayerTachieBack(const FVMS_CurrentRole &inout Model)
{
    return Model.GetSubPlayerTachieBack();
}
FSlateBrush __UIGetter_SubPlayerClassIcon(const FVMS_CurrentRole &inout Model)
{
    return Model.GetSubPlayerClassIcon();
}
FText __UIGetter_SubPlayerIllustrate1(const FVMS_CurrentRole &inout Model)
{
    return Model.GetSubPlayerIllustrate1();
}
FText __UIGetter_SubPlayerIllustrate2(const FVMS_CurrentRole &inout Model)
{
    return Model.GetSubPlayerIllustrate2();
}
FText __UIGetter_HealthInfo(const FVMS_CurrentRole &inout Model)
{
    return Model.GetHealthInfo();
}
FText __UIGetter_StaminaInfo(const FVMS_CurrentRole &inout Model)
{
    return Model.GetStaminaInfo();
}
int __UIGetter_CurrentLevel(const FVMS_CurrentRole &inout Model)
{
    return Model.GetCurrentLevel();
}
FText __UIGetter_EXPText(const FVMS_CurrentRole &inout Model)
{
    return Model.GetEXPText();
}
TEUIModelRef<FVMS_CurrentRole> __UIGetter_Self(const FVMS_CurrentRole &inout Model)
{
    return TEUIModelRef<FVMS_CurrentRole>(Model);
}
int __IndexOf_MainAvatarConfig()
{
    return 0;
}
int __IndexOf_SubAvatarConfig()
{
    return 1;
}
int __IndexOf_SlotIndex()
{
    return 2;
}
int __IndexOf_bChangeRoleClicked()
{
    return 3;
}
}
namespace __GeneratedProperties_FVMS_CurrentRole
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
