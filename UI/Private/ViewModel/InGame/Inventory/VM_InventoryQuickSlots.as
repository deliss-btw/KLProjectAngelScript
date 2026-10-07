
namespace FVM_InventoryQuickSlotsFocus
{
    const int ModelId = 0;
}
namespace FVM_InventoryQuickSlots
{
    const int ModelId = 0;

}
struct FVM_InventoryQuickSlotsFocus : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> m_QuickSlot;

    FVM_InventoryQuickSlotsFocus()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InventoryQuickSlotsFocus' by default constructor.");
        return;
    }
    FVM_InventoryQuickSlotsFocus(const FVM_InventoryQuickSlotsFocus &inout Other)
    {
        this.m_QuickSlot = Other.m_QuickSlot;
        return;
    }
    FVM_InventoryQuickSlotsFocus(const TDataObjectPtr<FItemQuickSlotConfig> &inout InQuickSlot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetQuickSlot(InQuickSlot);
        return;
    }
    FVM_InventoryQuickSlotsFocus& opAssign(const FVM_InventoryQuickSlotsFocus &inout Other)
    {
        return Other.m_QuickSlot;
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
}

struct FVM_InventoryQuickSlots : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    UWidget m_HoverLimitationWidget;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlot> m_QuickSlot_ConsumableItem_Heal;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlot> m_QuickSlot_ConsumableItem_Attack_1;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlot> m_QuickSlot_ConsumableItem_Attack_2;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlot> m_QuickSlot_ConsumableItem_Support;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlot> m_QuickSlot_ConsumableItem_Deformation;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlot> m_QuickSlot_Mount;
    UPROPERTY()
    TEUIModelRef<FVM_ItemQuickSlot> m_QuickSlot_RemnantItem;
    UPROPERTY()
    bool m_bIsMountQuickSlotUnlocked;
    UPROPERTY()
    bool m_bIsHealQuickSlotUnlocked;

    FVM_InventoryQuickSlots()
    {
        this.m_HoverLimitationWidget = nullptr;
        this.m_bIsMountQuickSlotUnlocked = false;
        this.m_bIsHealQuickSlotUnlocked = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InventoryQuickSlots' by default constructor.");
        return;
    }
    FVM_InventoryQuickSlots(const FVM_InventoryQuickSlots &inout Other)
    {
        this.m_HoverLimitationWidget = nullptr;
        this.m_bIsMountQuickSlotUnlocked = false;
        this.m_bIsHealQuickSlotUnlocked = false;
        this.m_HoverLimitationWidget = Other.m_HoverLimitationWidget;
        this.m_QuickSlot_ConsumableItem_Heal = Other.m_QuickSlot_ConsumableItem_Heal;
        this.m_QuickSlot_ConsumableItem_Attack_1 = Other.m_QuickSlot_ConsumableItem_Attack_1;
        this.m_QuickSlot_ConsumableItem_Attack_2 = Other.m_QuickSlot_ConsumableItem_Attack_2;
        this.m_QuickSlot_ConsumableItem_Support = Other.m_QuickSlot_ConsumableItem_Support;
        this.m_QuickSlot_ConsumableItem_Deformation = Other.m_QuickSlot_ConsumableItem_Deformation;
        this.m_QuickSlot_Mount = Other.m_QuickSlot_Mount;
        this.m_QuickSlot_RemnantItem = Other.m_QuickSlot_RemnantItem;
        this.m_bIsMountQuickSlotUnlocked = Other.m_bIsMountQuickSlotUnlocked;
        this.m_bIsHealQuickSlotUnlocked = Other.m_bIsHealQuickSlotUnlocked;
        return;
    }
    FVM_InventoryQuickSlots(const UWidget InHoverLimitationWidget)
    {
        this.m_HoverLimitationWidget = nullptr;
        this.m_bIsMountQuickSlotUnlocked = false;
        this.m_bIsHealQuickSlotUnlocked = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetHoverLimitationWidget(InHoverLimitationWidget);
        return;
    }
    FVM_InventoryQuickSlots opAssign(const FVM_InventoryQuickSlots &inout Other)
    {
        FVM_InventoryQuickSlots __r;
        this.m_HoverLimitationWidget = Other.m_HoverLimitationWidget;
        this.m_QuickSlot_ConsumableItem_Heal = Other.m_QuickSlot_ConsumableItem_Heal;
        this.m_QuickSlot_ConsumableItem_Attack_1 = Other.m_QuickSlot_ConsumableItem_Attack_1;
        this.m_QuickSlot_ConsumableItem_Attack_2 = Other.m_QuickSlot_ConsumableItem_Attack_2;
        this.m_QuickSlot_ConsumableItem_Support = Other.m_QuickSlot_ConsumableItem_Support;
        this.m_QuickSlot_ConsumableItem_Deformation = Other.m_QuickSlot_ConsumableItem_Deformation;
        this.m_QuickSlot_Mount = Other.m_QuickSlot_Mount;
        this.m_QuickSlot_RemnantItem = Other.m_QuickSlot_RemnantItem;
        this.m_bIsMountQuickSlotUnlocked = Other.m_bIsMountQuickSlotUnlocked;
        this.m_bIsHealQuickSlotUnlocked = Other.m_bIsHealQuickSlotUnlocked;
        return __r;
    }
    void PostConstruct()
    {
        this.SetQuickSlot_ConsumableItem_Heal(TEUIModelRef<FVM_ItemQuickSlot>(::FVM_ItemQuickSlot::Create(this.GetContext().Manager, ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Heal"), this.GetHoverLimitationWidget())));
        this.SetQuickSlot_ConsumableItem_Attack_1(TEUIModelRef<FVM_ItemQuickSlot>(::FVM_ItemQuickSlot::Create(this.GetContext().Manager, ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Attack_1"), this.GetHoverLimitationWidget())));
        this.SetQuickSlot_ConsumableItem_Attack_2(TEUIModelRef<FVM_ItemQuickSlot>(::FVM_ItemQuickSlot::Create(this.GetContext().Manager, ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Attack_2"), this.GetHoverLimitationWidget())));
        this.SetQuickSlot_ConsumableItem_Support(TEUIModelRef<FVM_ItemQuickSlot>(::FVM_ItemQuickSlot::Create(this.GetContext().Manager, ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Support"), this.GetHoverLimitationWidget())));
        this.SetQuickSlot_ConsumableItem_Deformation(TEUIModelRef<FVM_ItemQuickSlot>(::FVM_ItemQuickSlot::Create(this.GetContext().Manager, ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Deformation"), this.GetHoverLimitationWidget())));
        this.SetQuickSlot_RemnantItem(TEUIModelRef<FVM_ItemQuickSlot>(::FVM_ItemQuickSlot::Create(this.GetContext().Manager, ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_TemporaryAbility"), this.GetHoverLimitationWidget())));
        this.SetQuickSlot_Mount(TEUIModelRef<FVM_ItemQuickSlot>(::FVM_ItemQuickSlot::Create(this.GetContext().Manager, ::InventoryUtils::GetQuickSlotConfigByName(n"Mount"), this.GetHoverLimitationWidget())));
        this.GetQuickSlot_Mount().opArrow().ChangeItemNumStyle(EItemViewModelNumStyle(1));
        this.RefreshMountQuickSlotUnlockState();
        this.RefreshHealQuickSlotUnlockState();
        return;
    }
    bool HasRemnantItem() const
    {
        return this.GetQuickSlot_RemnantItem().opArrow().GetItem().IsValid();
    }
    bool GetIsMountQuickSlotUnlock() const
    {
        return this.GetbIsMountQuickSlotUnlocked();
    }
    bool GetIsHealQuickSlotUnlock() const
    {
        return this.GetbIsHealQuickSlotUnlocked();
    }
    void OnSystemUnlockFromGS(const FMsg_SystemUnlockFromGS &inout Msg)
    {
        if (int(Msg.SystemModule) == 117)
        {
            this.RefreshMountQuickSlotUnlockState();
            return;
        }
        if (int(Msg.SystemModule) == 118)
        {
            this.RefreshHealQuickSlotUnlockState();
        }
        return;
    }
    void RefreshMountQuickSlotUnlockState()
    {
        this.SetbIsMountQuickSlotUnlocked(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(117), false));
        return;
    }
    void RefreshHealQuickSlotUnlockState()
    {
        this.SetbIsHealQuickSlotUnlocked(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(118), false));
        return;
    }
    UWidget GetHoverLimitationWidget() const property
    {
        this.TrackPropertyRead(0);
        return this.m_HoverLimitationWidget;
    }
    void SetHoverLimitationWidget(const UWidget __Value) property
    {
        if (this.m_HoverLimitationWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    TEUIModelRef<FVM_ItemQuickSlot> GetQuickSlot_ConsumableItem_Heal() const property
    {
        this.TrackPropertyRead(1);
        return this.m_QuickSlot_ConsumableItem_Heal;
    }
    void SetQuickSlot_ConsumableItem_Heal(const TEUIModelRef<FVM_ItemQuickSlot> &inout __Value) property
    {
        TEUIModelRef<FVM_ItemQuickSlot> local_2;
        local_2 = this.m_QuickSlot_ConsumableItem_Heal;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_QuickSlot_ConsumableItem_Heal = __Value;
        return;
    }
    TEUIModelRef<FVM_ItemQuickSlot> GetQuickSlot_ConsumableItem_Attack_1() const property
    {
        this.TrackPropertyRead(2);
        return this.m_QuickSlot_ConsumableItem_Attack_1;
    }
    void SetQuickSlot_ConsumableItem_Attack_1(const TEUIModelRef<FVM_ItemQuickSlot> &inout __Value) property
    {
        TEUIModelRef<FVM_ItemQuickSlot> local_2;
        local_2 = this.m_QuickSlot_ConsumableItem_Attack_1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_QuickSlot_ConsumableItem_Attack_1 = __Value;
        return;
    }
    TEUIModelRef<FVM_ItemQuickSlot> GetQuickSlot_ConsumableItem_Attack_2() const property
    {
        this.TrackPropertyRead(3);
        return this.m_QuickSlot_ConsumableItem_Attack_2;
    }
    void SetQuickSlot_ConsumableItem_Attack_2(const TEUIModelRef<FVM_ItemQuickSlot> &inout __Value) property
    {
        TEUIModelRef<FVM_ItemQuickSlot> local_2;
        local_2 = this.m_QuickSlot_ConsumableItem_Attack_2;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_QuickSlot_ConsumableItem_Attack_2 = __Value;
        return;
    }
    TEUIModelRef<FVM_ItemQuickSlot> GetQuickSlot_ConsumableItem_Support() const property
    {
        this.TrackPropertyRead(4);
        return this.m_QuickSlot_ConsumableItem_Support;
    }
    void SetQuickSlot_ConsumableItem_Support(const TEUIModelRef<FVM_ItemQuickSlot> &inout __Value) property
    {
        TEUIModelRef<FVM_ItemQuickSlot> local_2;
        local_2 = this.m_QuickSlot_ConsumableItem_Support;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_QuickSlot_ConsumableItem_Support = __Value;
        return;
    }
    TEUIModelRef<FVM_ItemQuickSlot> GetQuickSlot_ConsumableItem_Deformation() const property
    {
        this.TrackPropertyRead(5);
        return this.m_QuickSlot_ConsumableItem_Deformation;
    }
    void SetQuickSlot_ConsumableItem_Deformation(const TEUIModelRef<FVM_ItemQuickSlot> &inout __Value) property
    {
        TEUIModelRef<FVM_ItemQuickSlot> local_2;
        local_2 = this.m_QuickSlot_ConsumableItem_Deformation;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_QuickSlot_ConsumableItem_Deformation = __Value;
        return;
    }
    TEUIModelRef<FVM_ItemQuickSlot> GetQuickSlot_Mount() const property
    {
        this.TrackPropertyRead(6);
        return this.m_QuickSlot_Mount;
    }
    void SetQuickSlot_Mount(const TEUIModelRef<FVM_ItemQuickSlot> &inout __Value) property
    {
        TEUIModelRef<FVM_ItemQuickSlot> local_2;
        local_2 = this.m_QuickSlot_Mount;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_QuickSlot_Mount = __Value;
        return;
    }
    TEUIModelRef<FVM_ItemQuickSlot> GetQuickSlot_RemnantItem() const property
    {
        this.TrackPropertyRead(7);
        return this.m_QuickSlot_RemnantItem;
    }
    void SetQuickSlot_RemnantItem(const TEUIModelRef<FVM_ItemQuickSlot> &inout __Value) property
    {
        TEUIModelRef<FVM_ItemQuickSlot> local_2;
        local_2 = this.m_QuickSlot_RemnantItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_QuickSlot_RemnantItem = __Value;
        return;
    }
    bool GetbIsMountQuickSlotUnlocked() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bIsMountQuickSlotUnlocked;
    }
    void SetbIsMountQuickSlotUnlocked(const bool __Value) property
    {
        if (!(this.m_bIsMountQuickSlotUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bIsMountQuickSlotUnlocked = __Value;
        return;
    }
    bool GetbIsHealQuickSlotUnlocked() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bIsHealQuickSlotUnlocked;
    }
    void SetbIsHealQuickSlotUnlocked(const bool __Value) property
    {
        if (!(this.m_bIsHealQuickSlotUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bIsHealQuickSlotUnlocked = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_InventoryQuickSlotsFocus
{
    UPROPERTY()
    TEUIModelRef<FVM_InventoryQuickSlotsFocus> Self;

    __GeneratedProperties_FVM_InventoryQuickSlotsFocus()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_InventoryQuickSlots
{
    UPROPERTY()
    bool HasRemnantItem;
    UPROPERTY()
    bool IsMountQuickSlotUnlock;
    UPROPERTY()
    bool IsHealQuickSlotUnlock;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryQuickSlots> Self;


}

namespace FVM_InventoryQuickSlotsFocus
{
FVM_InventoryQuickSlotsFocus& Create(const UObject ContextObject, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot)
{
    return FVM_InventoryQuickSlotsFocus::CreateByManager(EUIInternal::GetContextManager(ContextObject), QuickSlot);
}
FVM_InventoryQuickSlotsFocus CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot)
{
    FVM_InventoryQuickSlotsFocus __r;
    TEUIModelRef<FVM_InventoryQuickSlotsFocus> local_6 = TEUIModelRef<FVM_InventoryQuickSlotsFocus>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InventoryQuickSlotsFocus::ModelId, 0, QuickSlot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryQuickSlotsFocus>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InventoryQuickSlotsFocus;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InventoryQuickSlotsFocus;
}
TEUIModelRef<FVM_InventoryQuickSlotsFocus> __UIGetter_Self(const FVM_InventoryQuickSlotsFocus &inout Model)
{
    return TEUIModelRef<FVM_InventoryQuickSlotsFocus>(Model);
}
int __IndexOf_QuickSlot()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_InventoryQuickSlotsFocus
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_InventoryQuickSlots
{
FVM_InventoryQuickSlots& Create(const UObject ContextObject, const UWidget HoverLimitationWidget)
{
    return FVM_InventoryQuickSlots::CreateByManager(EUIInternal::GetContextManager(ContextObject), HoverLimitationWidget);
}
FVM_InventoryQuickSlots CreateByManager(const UEUIManagerSubsystem Manager, const UWidget HoverLimitationWidget)
{
    FVM_InventoryQuickSlots __r;
    TEUIModelRef<FVM_InventoryQuickSlots> local_6 = TEUIModelRef<FVM_InventoryQuickSlots>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InventoryQuickSlots::ModelId, 0, HoverLimitationWidget));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "QuickSlot_ConsumableItem_Heal";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "QuickSlot_ConsumableItem_Attack_1";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "QuickSlot_ConsumableItem_Attack_2";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "QuickSlot_ConsumableItem_Support";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "QuickSlot_ConsumableItem_Deformation";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "QuickSlot_Mount";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "QuickSlot_RemnantItem";
    local_14.TypeName = "TEUIModelRef<FVM_ItemQuickSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRemnantItem";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMountQuickSlotUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsHealQuickSlotUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryQuickSlots>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InventoryQuickSlots;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnSystemUnlockFromGS";
    local_26.MessageTypeName = "Msg_SystemUnlockFromGS";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InventoryQuickSlots;
}
void __OnSystemUnlockFromGS(FVM_InventoryQuickSlots &inout Model, const FMsg_SystemUnlockFromGS &inout Message)
{
    Model.OnSystemUnlockFromGS(Message);
    return;
}
TEUIModelRef<FVM_ItemQuickSlot> __UIGetter_QuickSlot_ConsumableItem_Heal(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.GetQuickSlot_ConsumableItem_Heal();
}
TEUIModelRef<FVM_ItemQuickSlot> __UIGetter_QuickSlot_ConsumableItem_Attack_1(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.GetQuickSlot_ConsumableItem_Attack_1();
}
TEUIModelRef<FVM_ItemQuickSlot> __UIGetter_QuickSlot_ConsumableItem_Attack_2(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.GetQuickSlot_ConsumableItem_Attack_2();
}
TEUIModelRef<FVM_ItemQuickSlot> __UIGetter_QuickSlot_ConsumableItem_Support(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.GetQuickSlot_ConsumableItem_Support();
}
TEUIModelRef<FVM_ItemQuickSlot> __UIGetter_QuickSlot_ConsumableItem_Deformation(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.GetQuickSlot_ConsumableItem_Deformation();
}
TEUIModelRef<FVM_ItemQuickSlot> __UIGetter_QuickSlot_Mount(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.GetQuickSlot_Mount();
}
TEUIModelRef<FVM_ItemQuickSlot> __UIGetter_QuickSlot_RemnantItem(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.GetQuickSlot_RemnantItem();
}
bool __UIGetter_HasRemnantItem(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.HasRemnantItem();
}
bool __UIGetter_IsMountQuickSlotUnlock(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.GetIsMountQuickSlotUnlock();
}
bool __UIGetter_IsHealQuickSlotUnlock(const FVM_InventoryQuickSlots &inout Model)
{
    return Model.GetIsHealQuickSlotUnlock();
}
TEUIModelRef<FVM_InventoryQuickSlots> __UIGetter_Self(const FVM_InventoryQuickSlots &inout Model)
{
    return TEUIModelRef<FVM_InventoryQuickSlots>(Model);
}
int __IndexOf_HoverLimitationWidget()
{
    return 0;
}
int __IndexOf_QuickSlot_ConsumableItem_Heal()
{
    return 1;
}
int __IndexOf_QuickSlot_ConsumableItem_Attack_1()
{
    return 2;
}
int __IndexOf_QuickSlot_ConsumableItem_Attack_2()
{
    return 3;
}
int __IndexOf_QuickSlot_ConsumableItem_Support()
{
    return 4;
}
int __IndexOf_QuickSlot_ConsumableItem_Deformation()
{
    return 5;
}
int __IndexOf_QuickSlot_Mount()
{
    return 6;
}
int __IndexOf_QuickSlot_RemnantItem()
{
    return 7;
}
int __IndexOf_bIsMountQuickSlotUnlocked()
{
    return 8;
}
int __IndexOf_bIsHealQuickSlotUnlocked()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_InventoryQuickSlots
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
