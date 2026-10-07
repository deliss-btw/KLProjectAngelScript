
namespace FVM_RoleItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelect = FEUIModelCallbackSignature();

}
struct FVM_RoleItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bIsSelected;
    UPROPERTY()
    bool m_bIsCurrent;
    UPROPERTY()
    int m_SelectedRoleIndex;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;

    FVM_RoleItem()
    {
        this.m_SelectedRoleIndex = 0;
        this.m_bIsSelected = false;
        this.m_bIsCurrent = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_RoleItem(const FVM_RoleItem &inout Other)
    {
        this.m_SelectedRoleIndex = 0;
        this.m_bIsSelected = false;
        this.m_bIsCurrent = false;
        this.m_bIsSelected = Other.m_bIsSelected;
        this.m_bIsCurrent = Other.m_bIsCurrent;
        this.m_SelectedRoleIndex = int(Other.m_SelectedRoleIndex);
        this.m_AvatarConfig = Other.m_AvatarConfig;
        return;
    }
    FVM_RoleItem& opAssign(const FVM_RoleItem &inout Other)
    {
        this.m_bIsSelected = Other.m_bIsSelected;
        this.m_bIsCurrent = Other.m_bIsCurrent;
        this.m_SelectedRoleIndex = int(Other.m_SelectedRoleIndex);
        return Other.m_AvatarConfig;
    }
    void OnSelect()
    {
        ::FVMS_ChangeRole::Get(this.GetContext().Manager).SelectRoleIndex(this.GetSelectedRoleIndex());
        return;
    }
    FText GetAvatarName() const
    {
        FText __return;
        if (this.GetAvatarConfig())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FSlateBrush GetAvatarIcon() const
    {
        FSlateBrush local_48;
        if (this.GetAvatarConfig())
        {
            return local_48;
        }
        return local_48;
    }
    FSlateBrush GetPlayerPowerIcon() const
    {
        FSlateBrush local_92;
        if (this.GetAvatarConfig())
        {
            FSlateBrush local_48;
            local_48.ResourceObject = local_92.ResourceObject;
            return local_48;
        }
        return local_92;
    }
    FSlateBrush GetPlayerTachie() const
    {
        FSlateBrush local_48;
        if (this.GetAvatarConfig())
        {
            return local_48;
        }
        return local_48;
    }
    FText GetPlayerIllustrate1() const
    {
        FText __return;
        if (this.GetAvatarConfig())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FText GetPlayerIllustrate2() const
    {
        int local_2 = 0;
        if (this.GetAvatarConfig())
        {
            return ::FASCommonUtils::GetWeaponTypeDisplayName(EWeaponType(local_2));
        }
        return FText();
    }
    ESlateVisibility bIsSelectedAsSlateVisibility() const
    {
        int local_2;
        if (this.bIsSelectedAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool bIsSelectedAsBool() const
    {
        return this.GetbIsSelected() || false;
    }
    ESlateVisibility bIsCurrentAsSlateVisibility() const
    {
        int local_2;
        if (this.bIsCurrentAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool bIsCurrentAsBool() const
    {
        return this.GetbIsCurrent() || false;
    }
    bool GetbIsSelected() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsSelected;
    }
    void SetbIsSelected(const bool __Value) property
    {
        if (!(this.m_bIsSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsSelected = __Value;
        return;
    }
    bool GetbIsCurrent() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsCurrent;
    }
    void SetbIsCurrent(const bool __Value) property
    {
        if (!(this.m_bIsCurrent) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsCurrent = __Value;
        return;
    }
    int GetSelectedRoleIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SelectedRoleIndex;
    }
    void SetSelectedRoleIndex(const int __Value) property
    {
        if (this.m_SelectedRoleIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedRoleIndex = __Value;
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AvatarConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_RoleItem
{
    UPROPERTY()
    FText AvatarName;
    UPROPERTY()
    FSlateBrush AvatarIcon;
    UPROPERTY()
    FSlateBrush PlayerPowerIcon;
    UPROPERTY()
    FSlateBrush PlayerTachie;
    UPROPERTY()
    FText PlayerIllustrate1;
    UPROPERTY()
    FText PlayerIllustrate2;
    UPROPERTY()
    TEUIModelRef<FVM_RoleItem> Self;

    __GeneratedProperties_FVM_RoleItem()
    {
        return;
    }
}

namespace FVM_RoleItem
{
FVM_RoleItem& Create(const UObject ContextObject)
{
    return FVM_RoleItem::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_RoleItem CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_RoleItem __r;
    TEUIModelRef<FVM_RoleItem> local_6 = TEUIModelRef<FVM_RoleItem>(EUIInternal::MakeModelWithManager(Manager, FVM_RoleItem::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsCurrent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerPowerIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerTachie";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerIllustrate1";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerIllustrate2";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_RoleItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_RoleItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_RoleItem;
}
bool __UIGetter_bIsSelected(const FVM_RoleItem &inout Model)
{
    return Model.GetbIsSelected();
}
bool __UIGetter_bIsCurrent(const FVM_RoleItem &inout Model)
{
    return Model.GetbIsCurrent();
}
FText __UIGetter_AvatarName(const FVM_RoleItem &inout Model)
{
    return Model.GetAvatarName();
}
FSlateBrush __UIGetter_AvatarIcon(const FVM_RoleItem &inout Model)
{
    return Model.GetAvatarIcon();
}
FSlateBrush __UIGetter_PlayerPowerIcon(const FVM_RoleItem &inout Model)
{
    return Model.GetPlayerPowerIcon();
}
FSlateBrush __UIGetter_PlayerTachie(const FVM_RoleItem &inout Model)
{
    return Model.GetPlayerTachie();
}
FText __UIGetter_PlayerIllustrate1(const FVM_RoleItem &inout Model)
{
    return Model.GetPlayerIllustrate1();
}
FText __UIGetter_PlayerIllustrate2(const FVM_RoleItem &inout Model)
{
    return Model.GetPlayerIllustrate2();
}
TEUIModelRef<FVM_RoleItem> __UIGetter_Self(const FVM_RoleItem &inout Model)
{
    return TEUIModelRef<FVM_RoleItem>(Model);
}
int __IndexOf_bIsSelected()
{
    return 0;
}
int __IndexOf_bIsCurrent()
{
    return 1;
}
int __IndexOf_SelectedRoleIndex()
{
    return 2;
}
int __IndexOf_AvatarConfig()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_RoleItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
