
namespace FVM_BattleBuildSelectListEntry
{
    const int ModelId = 0;

}
struct FVM_BattleBuildSelectListEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;

    FVM_BattleBuildSelectListEntry()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BattleBuildSelectListEntry' by default constructor.");
        return;
    }
    FVM_BattleBuildSelectListEntry(const FVM_BattleBuildSelectListEntry &inout Other)
    {
        this.m_ItemConfig = Other.m_ItemConfig;
        return;
    }
    FVM_BattleBuildSelectListEntry(const TDataObjectPtr<FItemConfig> &inout InItemConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemConfig(InItemConfig);
        return;
    }
    FVM_BattleBuildSelectListEntry& opAssign(const FVM_BattleBuildSelectListEntry &inout Other)
    {
        return Other.m_ItemConfig;
    }
    FSlateBrush GetItemIcon() const
    {
        if (this.GetItemConfig())
        {
            return this.GetItemConfig().opArrow().ItemIcon.LoadBrush();
        }
        return FSlateBrush();
    }
    FSlateBrush GetTypeIcon() const
    {
        return FSoftBrush().LoadBrush();
    }
    bool IsEmpty() const
    {
        return !(this.GetItemConfig());
    }
    bool IsSelected() const
    {
        TDataObjectPtr<FItemConfig> local_24;
        local_24 = ::FVMS_BattleBuildPage::Get(this.GetContext().Manager).GetSelectedItemConfig();
        FDataObjectPtr local_72;
        local_72;
        return (local_24 == local_72);
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_ItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BattleBuildSelectListEntry
{
    UPROPERTY()
    FSlateBrush ItemIcon;
    UPROPERTY()
    FSlateBrush TypeIcon;
    UPROPERTY()
    bool IsEmpty;
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_BattleBuildSelectListEntry> Self;


}

namespace FVM_BattleBuildSelectListEntry
{
FVM_BattleBuildSelectListEntry& Create(const UObject ContextObject, const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    return FVM_BattleBuildSelectListEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemConfig);
}
FVM_BattleBuildSelectListEntry CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    FVM_BattleBuildSelectListEntry __r;
    TEUIModelRef<FVM_BattleBuildSelectListEntry> local_6 = TEUIModelRef<FVM_BattleBuildSelectListEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BattleBuildSelectListEntry::ModelId, 0, ItemConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemConfig";
    local_14.TypeName = "TDataObjectPtr<FItemConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TypeIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEmpty";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BattleBuildSelectListEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BattleBuildSelectListEntry;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BattleBuildSelectListEntry;
}
TDataObjectPtr<FItemConfig> __UIGetter_ItemConfig(const FVM_BattleBuildSelectListEntry &inout Model)
{
    return Model.GetItemConfig();
}
FSlateBrush __UIGetter_ItemIcon(const FVM_BattleBuildSelectListEntry &inout Model)
{
    return Model.GetItemIcon();
}
FSlateBrush __UIGetter_TypeIcon(const FVM_BattleBuildSelectListEntry &inout Model)
{
    return Model.GetTypeIcon();
}
bool __UIGetter_IsEmpty(const FVM_BattleBuildSelectListEntry &inout Model)
{
    return Model.IsEmpty();
}
bool __UIGetter_IsSelected(const FVM_BattleBuildSelectListEntry &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_BattleBuildSelectListEntry> __UIGetter_Self(const FVM_BattleBuildSelectListEntry &inout Model)
{
    return TEUIModelRef<FVM_BattleBuildSelectListEntry>(Model);
}
int __IndexOf_ItemConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_BattleBuildSelectListEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
