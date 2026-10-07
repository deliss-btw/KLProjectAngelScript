
namespace FVM_EquipmentEditPage
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ConfirmEquip = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchShowCompare = FEUIModelCallbackSignature();

}
struct FVM_EquipmentEditPage : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EEquipSlotType m_EditingEquipSlot;
    UPROPERTY()
    TEUIModelRef<FMS_EditingAvatar> m_EditingAvatar;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_Equipment;
    UPROPERTY()
    TArray<FEUIModelRef> m_EquipmentSelectList;
    UPROPERTY()
    FEUIModelRef m_EquipmentSelectDetail;

    FVM_EquipmentEditPage()
    {
        this.m_EditingEquipSlot = EEquipSlotType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_EquipmentEditPage(const FVM_EquipmentEditPage &inout Other)
    {
        this.m_EditingEquipSlot = EEquipSlotType(0);
        this.m_EditingEquipSlot = Other.m_EditingEquipSlot;
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentSelectList = Other.m_EquipmentSelectList;
        this.m_EquipmentSelectDetail = Other.m_EquipmentSelectDetail;
        return;
    }
    FVM_EquipmentEditPage& opAssign(const FVM_EquipmentEditPage &inout Other)
    {
        this.m_EditingEquipSlot = Other.m_EditingEquipSlot;
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentSelectList = Other.m_EquipmentSelectList;
        return Other.m_EquipmentSelectDetail;
    }
    void Setup(const EEquipSlotType InEditingEquipSlot)
    {
        this.SetEditingEquipSlot(EEquipSlotType(InEditingEquipSlot));
        this.SetEditingAvatar(TEUIModelRef<FMS_EditingAvatar>(::FMS_EditingAvatar::Get(this.GetContext().Manager)));
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        bool local_3 = !(!(GetAvatarConfig()));
        return;
    }
    void PostConstruct()
    {
        ::FVM_AvatarSelectBar::RequireAvatarSelectBar(FEUIModelRef(this));
        return;
    }
    void BeginDestroy()
    {
        ::FVM_AvatarSelectBar::ReleaseAvatarSelectBar(FEUIModelRef(this));
        return;
    }
    void OnShouldUpdateEquipmentSelectDetail()
    {
        this.UpdateEquipmentSelectDetail();
        return;
    }
    void OnShouldUpdateEquipmentSelectList()
    {
        this.UpdateEquipmentSelectList();
        this.CancelCompare();
        return;
    }
    void OnAvatarEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        this.UpdateEquipmentSelectList();
        this.CancelCompare();
        return;
    }
    void OnPlayerInventoryChanged()
    {
        this.UpdateEquipmentSelectList();
        return;
    }
    void ConfirmEquip()
    {
        TEUIModelRef<FMS_EditingAvatar> local_6 = this.GetEditingAvatar();
        ::FEquipmentUtils::GS_RequestChangeEquipment(this.GetContext().GetLocalPlayer(), GetAvatarConfig(), ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetItemUid(this.GetEquipment()));
        return;
    }
    void SwitchShowCompare()
    {
        Get local_4;
        FVM_EquipmentSelectDetail& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbShowCompare(!(local_6.GetbShowCompare()));
        }
        return;
    }
    bool IsComparing() const
    {
        Get local_4;
        FVM_EquipmentSelectDetail& local_6 = local_4.opCall();
        if (local_6)
        {
            return local_6.ShouldDisplayCompare();
        }
        return false;
    }
    FText GetCompareButtonText() const
    {
        Get local_4;
        FVM_EquipmentSelectDetail& local_6 = local_4.opCall();
        if (local_6)
        {
            return local_6.GetCompareButtonText();
        }
        return FText();
    }
    bool CanEquip() const
    {
        return this.GetEquipment() && !((this.GetEquipment() == this.GetCurrentEquipment().opImplConv()));
    }
    TEUIModelRef<FM_Equipment> GetCurrentEquipment() const
    {
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_26 = GetAvatarConfig();
        return ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(::FEquipmentUtils::GetAvatarEquipmentUid(this.GetContext().GetLocalPlayer(), EEquipSlotType(1), local_26));
    }
    void UpdateEquipmentSelectList()
    {
        this.GetModify_EquipmentSelectList().Empty(0);
        TArray<TEUIModelRef<FM_ItemData>> local_6 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetAllItemsByType(EItemType(2));
        TEUIModelRef<FMS_EditingAvatar> local_12 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_36 = GetAvatarConfig();
        FMS_EquipmentDataCache& local_62 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager);
        TArray<TEUIModelRef<FM_Equipment>> local_66;
        for (auto& local_82 : local_6)
        {
            CastTo local_86;
            TDataObjectPtr<FEquipmentConfig> local_110 = local_86.opCall();
            if (local_110)
            {
                int64 local_136 = -1;
                if (::FMS_ItemDataCache::Get(this.GetContext().Manager).TryGetItemUid(local_82, local_136) && ::FEquipmentUtils::AvatarCanEquip(local_36, local_110))
                {
                    local_66.Add(local_62.GetEquipment(local_136));
                }
            }
        }
        for (auto& local_160 : local_66)
        {
            FVM_EquipmentSelectListItem& local_162 = ::FVM_EquipmentSelectListItem::Create(this.GetContext().Manager, local_62.GetItemUid(local_160));
            local_162.SetEquipmentEditPage(TEUIModelWeakRef<FVM_EquipmentEditPage>(this));
            this.GetModify_EquipmentSelectList().Add(FEUIModelRef(local_162));
        }
        return;
    }
    void UpdateEquipmentSelectDetail()
    {
        if (this.GetEquipment().IsValid())
        {
            Get local_8;
            bool local_4;
            local_4 = false;
            FVM_EquipmentSelectDetail& local_10 = local_8.opCall();
            if (local_10)
            {
                local_4 = local_10.GetbShowCompare();
            }
            TEUIModelRef<FMS_EditingAvatar> local_12 = this.GetEditingAvatar();
            TEUIModelRef<FM_Equipment> local_2 = this.GetEquipment();
            this.SetEquipmentSelectDetail(FEUIModelRef());
            local_8.opCall().SetbShowCompare(local_4);
            return;
        }
        this.SetEquipmentSelectDetail(FEUIModelRef());
        return;
    }
    void CancelCompare()
    {
        Get local_4;
        FVM_EquipmentSelectDetail& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbShowCompare(false);
        }
        return;
    }
    EEquipSlotType GetEditingEquipSlot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EditingEquipSlot;
    }
    void SetEditingEquipSlot(const EEquipSlotType __Value) property
    {
        if (int(this.m_EditingEquipSlot) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EditingEquipSlot = __Value;
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
    TEUIModelRef<FM_Equipment> GetEquipment() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Equipment;
    }
    void SetEquipment(const TEUIModelRef<FM_Equipment> &inout __Value) property
    {
        TEUIModelRef<FM_Equipment> local_2;
        local_2 = this.m_Equipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Equipment = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetEquipmentSelectList() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_EquipmentSelectList() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEquipmentSelectList(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipmentSelectList = __Value;
        return;
    }
    const FEUIModelRef GetEquipmentSelectDetail() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelRef GetModify_EquipmentSelectDetail() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetEquipmentSelectDetail(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EquipmentSelectDetail = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_InGame_Equipment_VM_EquipmentEditPage_139
{
    __Lambda_UI_Private_ViewModel_InGame_Equipment_VM_EquipmentEditPage_139()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_Equipment> &inout A, const TEUIModelRef<FM_Equipment> &inout B)
    {
        TDataObjectPtr<FEquipmentConfig> local_24 = GetEquipmentConfig();
        TDataObjectPtr<FEquipmentConfig> local_72 = GetEquipmentConfig();
        if (local_24.opArrow().Level != local_72.opArrow().Level)
        {
            return (local_24.opArrow().Level > local_72.opArrow().Level);
        }
        return (int(local_24.opArrow().Rarity) > int(local_72.opArrow().Rarity));
    }
}

struct __GeneratedProperties_FVM_EquipmentEditPage
{
    UPROPERTY()
    bool IsComparing;
    UPROPERTY()
    FText CompareButtonText;
    UPROPERTY()
    bool CanEquip;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentEditPage> Self;


}

namespace FVM_EquipmentEditPage
{
void GotoPage(const ULocalPlayer InLocalPlayer, const EEquipSlotType InEditingEquipSlot, const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
{
    FMS_EditingAvatar::Get(InLocalPlayer.GetWorld()).SetAvatarConfig(InAvatarConfig);
    FGameplayTag local_4 = FGameplayTag(GameplayTags::UI_Type_Avatar_Equipment);
    FEUIWidgetRef local_6 = FEUIWidget::FindWidget(InLocalPlayer, local_4);
    if (!(local_6))
    {
        local_6 = FEUIWidget::AddWidget(InLocalPlayer, local_4);
    }
    if (!(!(local_6)))
    {
        FEUIWidgetRef::GetViewModel local_14;
        local_14.opCall(NAME_None).Setup();
    }
    return;
}
FVM_EquipmentEditPage& Create(const UObject ContextObject)
{
    return FVM_EquipmentEditPage::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_EquipmentEditPage CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_EquipmentEditPage __r;
    TEUIModelRef<FVM_EquipmentEditPage> local_6 = TEUIModelRef<FVM_EquipmentEditPage>(EUIInternal::MakeModelWithManager(Manager, FVM_EquipmentEditPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_EquipmentEditPage;
}
void __OnShouldUpdateEquipmentSelectDetail(FVM_EquipmentEditPage &inout Model)
{
    Model.OnShouldUpdateEquipmentSelectDetail();
    return;
}
void __OnShouldUpdateEquipmentSelectList(FVM_EquipmentEditPage &inout Model)
{
    Model.OnShouldUpdateEquipmentSelectList();
    return;
}
void __OnAvatarEquipmentChanged(FVM_EquipmentEditPage &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnAvatarEquipmentChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
EEquipSlotType __UIGetter_EditingEquipSlot(const FVM_EquipmentEditPage &inout Model)
{
    return Model.GetEditingEquipSlot();
}
TArray<FEUIModelRef> __UIGetter_EquipmentSelectList(const FVM_EquipmentEditPage &inout Model)
{
    return Model.GetEquipmentSelectList();
}
FEUIModelRef __UIGetter_EquipmentSelectDetail(const FVM_EquipmentEditPage &inout Model)
{
    return Model.GetEquipmentSelectDetail();
}
bool __UIGetter_IsComparing(const FVM_EquipmentEditPage &inout Model)
{
    return Model.IsComparing();
}
FText __UIGetter_CompareButtonText(const FVM_EquipmentEditPage &inout Model)
{
    return Model.GetCompareButtonText();
}
bool __UIGetter_CanEquip(const FVM_EquipmentEditPage &inout Model)
{
    return Model.CanEquip();
}
TEUIModelRef<FVM_EquipmentEditPage> __UIGetter_Self(const FVM_EquipmentEditPage &inout Model)
{
    return TEUIModelRef<FVM_EquipmentEditPage>(Model);
}
int __IndexOf_EditingEquipSlot()
{
    return 0;
}
int __IndexOf_EditingAvatar()
{
    return 1;
}
int __IndexOf_Equipment()
{
    return 2;
}
int __IndexOf_EquipmentSelectList()
{
    return 3;
}
int __IndexOf_EquipmentSelectDetail()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_EquipmentEditPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
