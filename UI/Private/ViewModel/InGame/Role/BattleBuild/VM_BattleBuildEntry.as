
namespace FVM_BattleBuildEntry
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenBattleBuild = FEUIModelCallbackSignature();

}
struct FVM_BattleBuildEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> m_QuickSlot;
    UPROPERTY()
    TEUIModelRef<FItemQuickSlotModel> m_ItemQuickSlotModel;
    UPROPERTY()
    FGameplayTag m_BattleBuildPageWidget;
    UPROPERTY()
    ULocalPlayer m_LocalPlayer;

    FVM_BattleBuildEntry()
    {
        this.m_LocalPlayer = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_BattleBuildEntry(const FVM_BattleBuildEntry &inout Other)
    {
        this.m_LocalPlayer = nullptr;
        this.m_QuickSlot = Other.m_QuickSlot;
        this.m_ItemQuickSlotModel = Other.m_ItemQuickSlotModel;
        this.m_BattleBuildPageWidget = Other.m_BattleBuildPageWidget;
        this.m_LocalPlayer = Other.m_LocalPlayer;
        return;
    }
    FVM_BattleBuildEntry opAssign(const FVM_BattleBuildEntry &inout Other)
    {
        FVM_BattleBuildEntry __r;
        this.m_QuickSlot = Other.m_QuickSlot;
        this.m_ItemQuickSlotModel = Other.m_ItemQuickSlotModel;
        this.m_BattleBuildPageWidget = Other.m_BattleBuildPageWidget;
        this.m_LocalPlayer = Other.m_LocalPlayer;
        return __r;
    }
    void LoadConfig(const FConfigVM_BattleBuildEntry &inout InConfig)
    {
        this.SetQuickSlot(InConfig.QuickSlot);
        return;
    }
    void PostConstruct()
    {
        this.SetBattleBuildPageWidget(GameplayTags::UI_Type_Avatar_BattleBuild);
        Get local_4;
        this.SetLocalPlayer(local_4.opCall().UEPlayerController.GetLocalPlayer());
        return;
    }
    void PostLoad()
    {
        this.SetItemQuickSlotModel(TEUIModelRef<FItemQuickSlotModel>(::FItemQuickSlotModel::Create(this.GetContext().Manager, this.GetQuickSlot())));
        return;
    }
    FSlateBrush GetItemIcon() const
    {
        TEUIModelRef<FItemQuickSlotModel> local_2 = this.GetItemQuickSlotModel();
        FSlateBrush local_48;
        local_48.GetItemIcon();
        return local_48;
    }
    FSlateBrush GetTypeIcon() const
    {
        return FSoftBrush().LoadBrush();
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const
    {
        TEUIModelRef<FItemQuickSlotModel> local_2 = this.GetItemQuickSlotModel();
        TDataObjectPtr<FItemConfig> local_26;
        local_26.GetItemConfig();
        return local_26;
    }
    TDataObjectPtr<FItemQuickSlotConfig> GetQuickSlotConfig() const
    {
        TEUIModelRef<FItemQuickSlotModel> local_2 = this.GetItemQuickSlotModel();
        return GetQuickSlot();
    }
    int GetSelectStyleIndex() const
    {
        TDataObjectPtr<FItemQuickSlotConfig> local_24;
        local_24 = this.GetQuickSlot();
        FDataObjectPtr local_72;
        local_72;
        if ((local_24 == local_72))
        {
            return 1;
        }
        return 0;
    }
    bool IsEmpty() const
    {
        return !(this.GetItemConfig());
    }
    void OpenBattleBuild() const
    {
        if (!(this.GetQuickSlot()))
        {
            return;
        }
        UEUIManagerSubsystem local_4 = this.GetManager();
        FEUIWidget::AddWidget(this.GetLocalPlayer(), GameplayTags::UI_Type_InventoryQuickSlotAssembly, FEUIModelRef());
        return;
    }
    const TDataObjectPtr<FItemQuickSlotConfig> GetQuickSlot() const property
    {
        const TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemQuickSlotConfig> GetModify_QuickSlot() property
    {
        TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetQuickSlot(const TDataObjectPtr<FItemQuickSlotConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_QuickSlot = __Value;
        return;
    }
    TEUIModelRef<FItemQuickSlotModel> GetItemQuickSlotModel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ItemQuickSlotModel;
    }
    void SetItemQuickSlotModel(const TEUIModelRef<FItemQuickSlotModel> &inout __Value) property
    {
        TEUIModelRef<FItemQuickSlotModel> local_2;
        local_2 = this.m_ItemQuickSlotModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemQuickSlotModel = __Value;
        return;
    }
    const FGameplayTag GetBattleBuildPageWidget() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FGameplayTag GetModify_BattleBuildPageWidget() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetBattleBuildPageWidget(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BattleBuildPageWidget = __Value;
        return;
    }
    ULocalPlayer GetLocalPlayer() const property
    {
        this.TrackPropertyRead(3);
        return this.m_LocalPlayer;
    }
    void SetLocalPlayer(const ULocalPlayer __Value) property
    {
        if (this.m_LocalPlayer == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        return;
    }
}

struct __GeneratedProperties_FVM_BattleBuildEntry
{
    UPROPERTY()
    FSlateBrush ItemIcon;
    UPROPERTY()
    FSlateBrush TypeIcon;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ItemConfig;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> QuickSlotConfig;
    UPROPERTY()
    int SelectStyleIndex;
    UPROPERTY()
    bool IsEmpty;
    UPROPERTY()
    TEUIModelRef<FVM_BattleBuildEntry> Self;


}

namespace FVM_BattleBuildEntry
{
FVM_BattleBuildEntry& Create(const UObject ContextObject)
{
    return FVM_BattleBuildEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_BattleBuildEntry CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_BattleBuildEntry __r;
    TEUIModelRef<FVM_BattleBuildEntry> local_6 = TEUIModelRef<FVM_BattleBuildEntry>(EUIInternal::MakeModelWithManager(Manager, FVM_BattleBuildEntry::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
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
    local_14.PropertyName = "ItemConfig";
    local_14.TypeName = "TDataObjectPtr<FItemConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "QuickSlotConfig";
    local_14.TypeName = "TDataObjectPtr<FItemQuickSlotConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectStyleIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEmpty";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BattleBuildEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BattleBuildEntry;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BattleBuildEntry;
}
FSlateBrush __UIGetter_ItemIcon(const FVM_BattleBuildEntry &inout Model)
{
    return Model.GetItemIcon();
}
FSlateBrush __UIGetter_TypeIcon(const FVM_BattleBuildEntry &inout Model)
{
    return Model.GetTypeIcon();
}
TDataObjectPtr<FItemConfig> __UIGetter_ItemConfig(const FVM_BattleBuildEntry &inout Model)
{
    return Model.GetItemConfig();
}
TDataObjectPtr<FItemQuickSlotConfig> __UIGetter_QuickSlotConfig(const FVM_BattleBuildEntry &inout Model)
{
    return Model.GetQuickSlotConfig();
}
int __UIGetter_SelectStyleIndex(const FVM_BattleBuildEntry &inout Model)
{
    return Model.GetSelectStyleIndex();
}
bool __UIGetter_IsEmpty(const FVM_BattleBuildEntry &inout Model)
{
    return Model.IsEmpty();
}
TEUIModelRef<FVM_BattleBuildEntry> __UIGetter_Self(const FVM_BattleBuildEntry &inout Model)
{
    return TEUIModelRef<FVM_BattleBuildEntry>(Model);
}
int __IndexOf_QuickSlot()
{
    return 0;
}
int __IndexOf_ItemQuickSlotModel()
{
    return 1;
}
int __IndexOf_BattleBuildPageWidget()
{
    return 2;
}
int __IndexOf_LocalPlayer()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_BattleBuildEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
