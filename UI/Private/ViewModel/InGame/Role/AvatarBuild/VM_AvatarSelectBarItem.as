
namespace FVM_AvatarSelectBarItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectAvatar = FEUIModelCallbackSignature();

}
struct FVM_AvatarSelectBarItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    TEUIModelRef<FMS_EditingAvatar> m_EditingAvatar;

    FVM_AvatarSelectBarItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarSelectBarItem' by default constructor.");
        return;
    }
    FVM_AvatarSelectBarItem(const FVM_AvatarSelectBarItem &inout Other)
    {
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_EditingAvatar = Other.m_EditingAvatar;
        return;
    }
    FVM_AvatarSelectBarItem(const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarConfig(InAvatarConfig);
        this.SetEditingAvatar(TEUIModelRef<FMS_EditingAvatar>(::FMS_EditingAvatar::Get(this.GetContext().Manager)));
        return;
    }
    FVM_AvatarSelectBarItem& opAssign(const FVM_AvatarSelectBarItem &inout Other)
    {
        this.m_AvatarConfig = Other.m_AvatarConfig;
        return Other.m_EditingAvatar;
    }
    FSoftBrush GetAvatarIcon() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FSoftBrush __r; return __r;
    }
    bool IsSelected() const
    {
        TDataObjectPtr<FAvatarPrefabConfig> local_26;
        local_26 = this.GetAvatarConfig();
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        FDataObjectPtr local_74;
        local_74;
        return (local_26 == local_74);
    }
    void SelectAvatar()
    {
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        this.GetAvatarConfig().SetAvatarConfig();
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarConfig = __Value;
        return;
    }
    TEUIModelRef<FMS_EditingAvatar> GetEditingAvatar() const property
    {
        this.TrackPropertyRead(1);
        return this.m_EditingAvatar;
    }
    void SetEditingAvatar(const TEUIModelRef<FMS_EditingAvatar> &inout __Value) property
    {
        TEUIModelRef<FMS_EditingAvatar> local_2;
        local_2 = this.m_EditingAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EditingAvatar = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarSelectBarItem
{
    UPROPERTY()
    FSoftBrush AvatarIcon;
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarSelectBarItem> Self;


}

namespace FVM_AvatarSelectBarItem
{
FVM_AvatarSelectBarItem& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return FVM_AvatarSelectBarItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig);
}
FVM_AvatarSelectBarItem CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    FVM_AvatarSelectBarItem __r;
    TEUIModelRef<FVM_AvatarSelectBarItem> local_6 = TEUIModelRef<FVM_AvatarSelectBarItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarSelectBarItem::ModelId, 0, AvatarConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarConfig";
    local_14.TypeName = "TDataObjectPtr<FAvatarPrefabConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarSelectBarItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarSelectBarItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarSelectBarItem;
}
TDataObjectPtr<FAvatarPrefabConfig> __UIGetter_AvatarConfig(const FVM_AvatarSelectBarItem &inout Model)
{
    return Model.GetAvatarConfig();
}
FSoftBrush __UIGetter_AvatarIcon(const FVM_AvatarSelectBarItem &inout Model)
{
    return Model.GetAvatarIcon();
}
bool __UIGetter_IsSelected(const FVM_AvatarSelectBarItem &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_AvatarSelectBarItem> __UIGetter_Self(const FVM_AvatarSelectBarItem &inout Model)
{
    return TEUIModelRef<FVM_AvatarSelectBarItem>(Model);
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
int __IndexOf_EditingAvatar()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_AvatarSelectBarItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
