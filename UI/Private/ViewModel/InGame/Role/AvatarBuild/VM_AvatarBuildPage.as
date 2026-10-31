namespace FVM_AvatarBuildPage
{
    const int ModelId = 0;

}
struct FVM_AvatarBuildPage : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_EditingAvatar> m_EditingAvatar;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarAttributeList> m_AvatarAttributeList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TraitInfo>> m_AvatarTraitList;
    UPROPERTY()
    FEUIModelRef m_EditingPlayerAvatar;
    UPROPERTY()
    FEUIModelRef m_AvatarEquipment;

    FVM_AvatarBuildPage()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarBuildPage(const FVM_AvatarBuildPage &inout Other)
    {
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_AvatarAttributeList = Other.m_AvatarAttributeList;
        this.m_AvatarTraitList = Other.m_AvatarTraitList;
        this.m_EditingPlayerAvatar = Other.m_EditingPlayerAvatar;
        this.m_AvatarEquipment = Other.m_AvatarEquipment;
        return;
    }
    FVM_AvatarBuildPage& opAssign(const FVM_AvatarBuildPage &inout Other)
    {
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_AvatarAttributeList = Other.m_AvatarAttributeList;
        this.m_AvatarTraitList = Other.m_AvatarTraitList;
        this.m_EditingPlayerAvatar = Other.m_EditingPlayerAvatar;
        return Other.m_AvatarEquipment;
    }
    void PostConstruct()
    {
        this.SetEditingAvatar(TEUIModelRef<FMS_EditingAvatar>(::FMS_EditingAvatar::Get(this.GetContext().Manager)));
        bool local_3 = !(!(this.GetEditingAvatar().Get().GetAvatarConfig()));
        ::FVM_AvatarSelectBar::RequireAvatarSelectBar(FEUIModelRef(this));
        return;
    }
    void BeginDestroy()
    {
        ::FVM_AvatarSelectBar::ReleaseAvatarSelectBar(FEUIModelRef(this));
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const
    {
        return this.GetEditingAvatar().Get().GetAvatarConfig();
    }
    void OnAvatarConfigChanged()
    {
        this.SetAvatarAttributeList(TEUIModelRef<FVM_AvatarAttributeList>(::FVM_AvatarAttributeList::Create(this.GetContext().Manager, this.GetAvatarConfig())));
        this.UpdateAvatarTraitList();
        this.SetEditingPlayerAvatar(FEUIModelRef(::FVM_PlayerAvatar::Create(this.GetContext().Manager, this.GetAvatarConfig())));
        TDataObjectPtr<FAvatarPrefabConfig> local_24 = this.GetAvatarConfig();
        TEUIModelRef<FM_Avatar> local_56 = ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).FindAvatar(local_24);
        if (!(local_56))
        {
            local_56 = TEUIModelRef<FM_Avatar>(::FM_Avatar::Create(this.GetContext().Manager, local_24));
        }
        this.SetAvatarEquipment(FEUIModelRef(::FVM_AvatarEquipment::Create(this.GetContext().Manager, EEquipSlotType(1), local_56)));
        return;
    }
    void OnEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        this.UpdateAvatarTraitList();
        return;
    }
    void UpdateAvatarTraitList()
    {
        this.GetModify_AvatarTraitList().Empty(0);
        int64 local_36 = ::FEquipmentUtils::GetAvatarEquipmentUid(this.GetContext().GetLocalPlayer(), EEquipSlotType(1), this.GetAvatarConfig());
        if (local_36 != 0)
        {
            TEUIModelRef<FM_Equipment> local_40 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_36);
            for (auto& local_56 : local_40.Get().GetEquipmentTraits())
            {
                this.GetModify_AvatarTraitList().Add(TEUIModelRef<FVM_TraitInfo>(::FVM_TraitInfo::Create(this.GetContext().Manager, local_56)));
            }
        }
        return;
    }
    TEUIModelRef<FMS_EditingAvatar> GetEditingAvatar() const property
    {
        this.TrackPropertyRead(0);
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
        this.MarkPropertyDirty(0);
        this.m_EditingAvatar = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarAttributeList> GetAvatarAttributeList() const property
    {
        this.TrackPropertyRead(1);
        return this.m_AvatarAttributeList;
    }
    void SetAvatarAttributeList(const TEUIModelRef<FVM_AvatarAttributeList> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarAttributeList> local_2;
        local_2 = this.m_AvatarAttributeList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AvatarAttributeList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TraitInfo>> GetAvatarTraitList() const property
    {
        const TArray<TEUIModelRef<FVM_TraitInfo>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TraitInfo>> GetModify_AvatarTraitList() property
    {
        TArray<TEUIModelRef<FVM_TraitInfo>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAvatarTraitList(const TArray<TEUIModelRef<FVM_TraitInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AvatarTraitList = __Value;
        return;
    }
    const FEUIModelRef GetEditingPlayerAvatar() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelRef GetModify_EditingPlayerAvatar() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEditingPlayerAvatar(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EditingPlayerAvatar = __Value;
        return;
    }
    FEUIModelRef GetAvatarEquipment() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelRef GetModify_AvatarEquipment() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetAvatarEquipment(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_AvatarEquipment = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarBuildPage
{
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> AvatarConfig;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarBuildPage> Self;

    __GeneratedProperties_FVM_AvatarBuildPage()
    {
        return;
    }
}

namespace FVM_AvatarBuildPage
{
void GotoPage(const ULocalPlayer InLocalPlayer, const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
{
    FMS_EditingAvatar::Get(InLocalPlayer.GetWorld()).SetAvatarConfig(InAvatarConfig);
    FGameplayTag local_4 = FGameplayTag(GameplayTags::UI_Type_Avatar_Build);
    if (!(FEUIWidget::FindWidget(InLocalPlayer, local_4)))
    {
        FEUIWidget::AddWidget(InLocalPlayer, local_4);
    }
    return;
}
FVM_AvatarBuildPage& Create(const UObject ContextObject)
{
    return FVM_AvatarBuildPage::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarBuildPage& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_AvatarBuildPage>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarBuildPage::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarAttributeList";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarAttributeList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarTraitList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TraitInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EditingPlayerAvatar";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarEquipment";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarConfig";
    local_14.TypeName = "TDataObjectPtr<FAvatarPrefabConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarBuildPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarBuildPage;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(5);
    local_22.AddRefPropertyDirty(0, 0, FMS_EditingAvatar::__IndexOf_AvatarConfig());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("EditingAvatar");
    int local_2_2 = FMS_EditingAvatar::ModelId;
    int local_2_3 = local_22.GetMappingDirtyOffset(0);
    local_30.RelatedDirtyMask.SetBit(FMS_EditingAvatar::__IndexOf_AvatarConfig(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__OnAvatarConfigChanged";
    local_40.DirtyFlags.Set(FVM_AvatarBuildPage::__IndexOf_EditingAvatar());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    FEUIModelMonitorDefine local_50;
    local_50.FunctionName = "__OnEquipmentChanged";
    local_50.ComponentType = FC_DSPlayerAvatarInfo;
    Result.MonitorFunctions.Add(local_50);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarBuildPage;
}
void __OnAvatarConfigChanged(FVM_AvatarBuildPage &inout Model)
{
    Model.OnAvatarConfigChanged();
    return;
}
void __OnEquipmentChanged(FVM_AvatarBuildPage &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnEquipmentChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    __MonitorDSPlayerAvatarInfoLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorDSPlayerAvatarInfoModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
}
TEUIModelRef<FVM_AvatarAttributeList> __UIGetter_AvatarAttributeList(const FVM_AvatarBuildPage &inout Model)
{
    return Model.GetAvatarAttributeList();
}
TArray<TEUIModelRef<FVM_TraitInfo>> __UIGetter_AvatarTraitList(const FVM_AvatarBuildPage &inout Model)
{
    return Model.GetAvatarTraitList();
}
FEUIModelRef __UIGetter_EditingPlayerAvatar(const FVM_AvatarBuildPage &inout Model)
{
    return Model.GetEditingPlayerAvatar();
}
FEUIModelRef __UIGetter_AvatarEquipment(const FVM_AvatarBuildPage &inout Model)
{
    return Model.GetAvatarEquipment();
}
TDataObjectPtr<FAvatarPrefabConfig> __UIGetter_AvatarConfig(const FVM_AvatarBuildPage &inout Model)
{
    return Model.GetAvatarConfig();
}
TEUIModelRef<FVM_AvatarBuildPage> __UIGetter_Self(const FVM_AvatarBuildPage &inout Model)
{
    return TEUIModelRef<FVM_AvatarBuildPage>(Model);
}
int __IndexOf_EditingAvatar()
{
    return 0;
}
int __IndexOf_AvatarAttributeList()
{
    return 1;
}
int __IndexOf_AvatarTraitList()
{
    return 2;
}
int __IndexOf_EditingPlayerAvatar()
{
    return 3;
}
int __IndexOf_AvatarEquipment()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_AvatarBuildPage
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_AvatarBuildPage.Get();
}
}
