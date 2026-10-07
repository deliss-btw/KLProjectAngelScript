
namespace FVMS_ItemInfo
{
    const int ModelId = 0;

}
struct FVMS_ItemInfo : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    ESlateVisibility m_Visibility_MountUsing;
    UPROPERTY()
    int m_HealItemNum;
    UPROPERTY()
    int m_CombatItemNum;
    UPROPERTY()
    ESlateVisibility m_TempObjButtonVisible;
    UPROPERTY()
    FEUIModelRef m_VM_HealItemButton;
    UPROPERTY()
    FEUIModelRef m_VM_CombatItemButton_1;
    UPROPERTY()
    FEUIModelRef m_VM_CombatItemButton_2;
    UPROPERTY()
    FEUIModelRef m_VM_CombatItemButton_Temp;
    UPROPERTY()
    FEUIModelRef m_VM_LinkSkillButton;
    UPROPERTY()
    FECSEntity m_AvatarEntity;
    UPROPERTY()
    bool m_bItemSet;

    FVMS_ItemInfo()
    {
        this.m_TempObjButtonVisible = ESlateVisibility(0);
        this.m_Visibility_MountUsing = ESlateVisibility(2);
        this.m_HealItemNum = 1;
        this.m_CombatItemNum = 1;
        this.m_bItemSet = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_ItemInfo(const FVMS_ItemInfo &inout Other)
    {
        this.m_TempObjButtonVisible = ESlateVisibility(0);
        this.m_Visibility_MountUsing = ESlateVisibility(2);
        this.m_HealItemNum = 1;
        this.m_CombatItemNum = 1;
        this.m_bItemSet = false;
        this.m_Visibility_MountUsing = Other.m_Visibility_MountUsing;
        this.m_HealItemNum = int(Other.m_HealItemNum);
        this.m_CombatItemNum = int(Other.m_CombatItemNum);
        this.m_TempObjButtonVisible = Other.m_TempObjButtonVisible;
        this.m_VM_HealItemButton = Other.m_VM_HealItemButton;
        this.m_VM_CombatItemButton_1 = Other.m_VM_CombatItemButton_1;
        this.m_VM_CombatItemButton_2 = Other.m_VM_CombatItemButton_2;
        this.m_VM_CombatItemButton_Temp = Other.m_VM_CombatItemButton_Temp;
        this.m_VM_LinkSkillButton = Other.m_VM_LinkSkillButton;
        this.m_AvatarEntity = Other.m_AvatarEntity;
        this.m_bItemSet = Other.m_bItemSet;
        return;
    }
    FVMS_ItemInfo opAssign(const FVMS_ItemInfo &inout Other)
    {
        FVMS_ItemInfo __r;
        this.m_Visibility_MountUsing = Other.m_Visibility_MountUsing;
        this.m_HealItemNum = int(Other.m_HealItemNum);
        this.m_CombatItemNum = int(Other.m_CombatItemNum);
        this.m_TempObjButtonVisible = Other.m_TempObjButtonVisible;
        this.m_VM_HealItemButton = Other.m_VM_HealItemButton;
        this.m_VM_CombatItemButton_1 = Other.m_VM_CombatItemButton_1;
        this.m_VM_CombatItemButton_2 = Other.m_VM_CombatItemButton_2;
        this.m_VM_CombatItemButton_Temp = Other.m_VM_CombatItemButton_Temp;
        this.m_VM_LinkSkillButton = Other.m_VM_LinkSkillButton;
        this.m_AvatarEntity = Other.m_AvatarEntity;
        this.m_bItemSet = Other.m_bItemSet;
        return __r;
    }
    void PostConstruct()
    {
        this.SetVM_LinkSkillButton(FEUIModelRef());
        Get local_6;
        local_6.opCall().SetSkillProgressType(ESkillProgressType(0));
        this.SetVM_HealItemButton(FEUIModelRef());
        local_6.opCall().SetSkillProgressType(ESkillProgressType(3));
        this.SetVM_CombatItemButton_1(FEUIModelRef());
        local_6.opCall().SetSkillProgressType(ESkillProgressType(3));
        this.SetVM_CombatItemButton_2(FEUIModelRef());
        local_6.opCall().SetSkillProgressType(ESkillProgressType(3));
        this.SetVM_CombatItemButton_Temp(FEUIModelRef());
        local_6.opCall().SetSkillProgressType(ESkillProgressType(3));
        return;
    }
    void Tick()
    {
        if (UICommonUtil::CVar_UI_DebugEnableNewItemBtns.GetBool())
        {
            return;
        }
        this.SetAvatarEntity(::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn()));
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        if ((FECSEntity(this.GetAvatarEntity()) == ENTITY_NULL))
        {
            return;
        }
        Has local_18;
        bool local_1 = local_18.opCall();
        if (local_1)
        {
            this.SetVisibility_MountUsing(ESlateVisibility(0));
        }
        else
        {
            this.SetVisibility_MountUsing(ESlateVisibility(2));
        }
        if (!(this.GetbItemSet()))
        {
            this.RefreshItemConfig();
        }
        return;
    }
    void OnQuickSlotChanged(const FCE_NotifyQuickSlotItemChanged &inout Event)
    {
        this.RefreshItemConfig();
        return;
    }
    void OnQuickSlotInit(const FCE_ItemQuickSlotInit &inout Event)
    {
        this.RefreshItemConfig();
        return;
    }
    void OnInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshItemConfig();
        return;
    }
    void RefreshItemConfig()
    {
        FECSEntity local_12 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_12.IsValid()))
        {
            return;
        }
        ::InventoryUtils::GetQuickSlotItemByName(local_12, n"ConsumableItem_Heal");
        CastTo local_42;
        TDataObjectPtr<FCombatItemConfig> local_66 = local_42.opCall();
        if (local_66)
        {
            CastTo local_96;
            int local_121 = ::InventoryUtils::GetInventoryItemNumber(local_12, local_96.opCall());
            this.SetupConsumableItemSkillButton(TEUIModelRef<FVM_SkillButton>(this.GetVM_HealItemButton()), local_66, local_121);
            this.SetHealItemNum(local_121);
        }
        else
        {
            this.SetConsumableItemSkillButtonToEmpty(TEUIModelRef<FVM_SkillButton>(this.GetVM_HealItemButton()));
        }
        ::InventoryUtils::GetQuickSlotItemByName(local_12, n"ConsumableItem_Attack_1");
        TDataObjectPtr<FCombatItemConfig> local_90 = local_42.opCall();
        if (local_90)
        {
            CastTo local_96;
            int local_14 = ::InventoryUtils::GetInventoryItemNumber(local_12, local_96.opCall());
            this.SetupConsumableItemSkillButton(TEUIModelRef<FVM_SkillButton>(this.GetVM_CombatItemButton_1()), local_90, local_14);
            this.SetCombatItemNum(local_14);
        }
        else
        {
            this.SetConsumableItemSkillButtonToEmpty(TEUIModelRef<FVM_SkillButton>(this.GetVM_CombatItemButton_1()));
        }
        ::InventoryUtils::GetQuickSlotItemByName(local_12, n"ConsumableItem_Attack_2");
        TDataObjectPtr<FCombatItemConfig> local_66_2 = local_42.opCall();
        if (local_66_2)
        {
            CastTo local_96;
            int local_91 = ::InventoryUtils::GetInventoryItemNumber(local_12, local_96.opCall());
            this.SetupConsumableItemSkillButton(TEUIModelRef<FVM_SkillButton>(this.GetVM_CombatItemButton_2()), local_66_2, local_91);
            this.SetCombatItemNum(local_91);
        }
        else
        {
            this.SetConsumableItemSkillButtonToEmpty(TEUIModelRef<FVM_SkillButton>(this.GetVM_CombatItemButton_2()));
        }
        ::InventoryUtils::GetQuickSlotItemByName(local_12, n"ConsumableItem_Support");
        TDataObjectPtr<FCombatItemConfig> local_90_2 = local_42.opCall();
        if (local_90_2)
        {
            Get local_128;
            local_128.opCall().SetSkillConfig(local_90_2.opArrow().ItemSkillConfig);
        }
        ::InventoryUtils::GetQuickSlotItemByName(local_12, n"ConsumableItem_TemporaryAbility");
        TDataObjectPtr<FCombatItemConfig> local_66_3 = local_42.opCall();
        if (local_66_3)
        {
            CastTo local_96;
            int local_14_2 = ::InventoryUtils::GetInventoryItemNumber(local_12, local_96.opCall());
            if (local_14_2 == 0)
            {
                this.SetTemporasryItemButtonVisibility(false);
            }
            else
            {
                this.SetTemporasryItemButtonVisibility(true);
                this.SetupConsumableItemSkillButton(TEUIModelRef<FVM_SkillButton>(this.GetVM_CombatItemButton_Temp()), local_66_3, local_14_2);
            }
        }
        else
        {
            this.SetTemporasryItemButtonVisibility(false);
            this.SetConsumableItemSkillButtonToEmpty(TEUIModelRef<FVM_SkillButton>(this.GetVM_CombatItemButton_Temp()));
        }
        return;
    }
    void SetupConsumableItemSkillButton(const TEUIModelRef<FVM_SkillButton> &inout VM_SkillButton, const TDataObjectPtr<FCombatItemConfig> &inout Config, const int ItemNumber)
    {
        this.SetbItemSet(true);
        Config.opArrow().ItemSkillConfig.SetSkillConfig();
        3.SetSkillButtonType();
        Config.SetConsumableItem();
        ItemNumber.SetUsableTime();
        return;
    }
    void SetConsumableItemSkillButtonToEmpty(const TEUIModelRef<FVM_SkillButton> &inout VM_SkillButton)
    {
        nullptr.SetSkillConfig();
        3.SetSkillButtonType();
        TDataObjectPtr<FCombatItemConfig> local_26;
        local_26.SetConsumableItem();
        0.SetUsableTime();
        return;
    }
    void SetTemporasryItemButtonVisibility(const bool Visible)
    {
        if (Visible)
        {
            this.SetTempObjButtonVisible(ESlateVisibility(0));
            return;
        }
        this.SetTempObjButtonVisible(ESlateVisibility(2));
        return;
    }
    ESlateVisibility GetVisibility_MountUsing() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Visibility_MountUsing;
    }
    void SetVisibility_MountUsing(const ESlateVisibility __Value) property
    {
        if (int(this.m_Visibility_MountUsing) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Visibility_MountUsing = __Value;
        return;
    }
    int GetHealItemNum() const property
    {
        this.TrackPropertyRead(1);
        return this.m_HealItemNum;
    }
    void SetHealItemNum(const int __Value) property
    {
        if (this.m_HealItemNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HealItemNum = __Value;
        return;
    }
    int GetCombatItemNum() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CombatItemNum;
    }
    void SetCombatItemNum(const int __Value) property
    {
        if (this.m_CombatItemNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CombatItemNum = __Value;
        return;
    }
    ESlateVisibility GetTempObjButtonVisible() const property
    {
        this.TrackPropertyRead(3);
        return this.m_TempObjButtonVisible;
    }
    void SetTempObjButtonVisible(const ESlateVisibility __Value) property
    {
        if (int(this.m_TempObjButtonVisible) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TempObjButtonVisible = __Value;
        return;
    }
    const FEUIModelRef GetVM_HealItemButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelRef GetModify_VM_HealItemButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetVM_HealItemButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_VM_HealItemButton = __Value;
        return;
    }
    const FEUIModelRef GetVM_CombatItemButton_1() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIModelRef GetModify_VM_CombatItemButton_1() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetVM_CombatItemButton_1(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_VM_CombatItemButton_1 = __Value;
        return;
    }
    const FEUIModelRef GetVM_CombatItemButton_2() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIModelRef GetModify_VM_CombatItemButton_2() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetVM_CombatItemButton_2(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_VM_CombatItemButton_2 = __Value;
        return;
    }
    const FEUIModelRef GetVM_CombatItemButton_Temp() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEUIModelRef GetModify_VM_CombatItemButton_Temp() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetVM_CombatItemButton_Temp(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_VM_CombatItemButton_Temp = __Value;
        return;
    }
    const FEUIModelRef GetVM_LinkSkillButton() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FEUIModelRef GetModify_VM_LinkSkillButton() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetVM_LinkSkillButton(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_VM_LinkSkillButton = __Value;
        return;
    }
    const FECSEntity GetAvatarEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FECSEntity GetModify_AvatarEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetAvatarEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_AvatarEntity = __Value;
        return;
    }
    bool GetbItemSet() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bItemSet;
    }
    void SetbItemSet(const bool __Value) property
    {
        if (!(this.m_bItemSet) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bItemSet = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_ItemInfo
{
    UPROPERTY()
    TEUIModelRef<FVMS_ItemInfo> Self;

    __GeneratedProperties_FVMS_ItemInfo()
    {
        return;
    }
}

namespace FVMS_ItemInfo
{
FVMS_ItemInfo& Get(const UObject ContextObject)
{
    return FVMS_ItemInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_ItemInfo GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_ItemInfo __r;
    TEUIModelRef<FVMS_ItemInfo> local_6 = TEUIModelRef<FVMS_ItemInfo>(EUIInternal::MakeModelWithManager(Manager, FVMS_ItemInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Visibility_MountUsing";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TempObjButtonVisible";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_HealItemButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_CombatItemButton_1";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_CombatItemButton_2";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_CombatItemButton_Temp";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_LinkSkillButton";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_ItemInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_ItemInfo;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__OnQuickSlotChanged";
    local_22.EventType = FCE_NotifyQuickSlotItemChanged;
    Result.EventFunctions.Add(local_22);
    local_22.FunctionName = "__OnQuickSlotInit";
    local_22.EventType = FCE_ItemQuickSlotInit;
    Result.EventFunctions.Add(local_22);
    FEUIModelMsgHandleDefine local_32;
    local_32.FunctionName = "__OnInventoryChanged";
    local_32.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_32.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_32);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_ItemInfo;
}
void __Tick(FVMS_ItemInfo &inout Model)
{
    Model.Tick();
    return;
}
void __OnQuickSlotChanged(FVMS_ItemInfo &inout Model, const FCE_NotifyQuickSlotItemChanged &inout Event)
{
    Model.OnQuickSlotChanged(Event);
    return;
}
void __OnQuickSlotInit(FVMS_ItemInfo &inout Model, const FCE_ItemQuickSlotInit &inout Event)
{
    Model.OnQuickSlotInit(Event);
    return;
}
void __OnInventoryChanged(FVMS_ItemInfo &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnInventoryChanged(Message);
    return;
}
ESlateVisibility __UIGetter_Visibility_MountUsing(const FVMS_ItemInfo &inout Model)
{
    return Model.GetVisibility_MountUsing();
}
ESlateVisibility __UIGetter_TempObjButtonVisible(const FVMS_ItemInfo &inout Model)
{
    return Model.GetTempObjButtonVisible();
}
FEUIModelRef __UIGetter_VM_HealItemButton(const FVMS_ItemInfo &inout Model)
{
    return Model.GetVM_HealItemButton();
}
FEUIModelRef __UIGetter_VM_CombatItemButton_1(const FVMS_ItemInfo &inout Model)
{
    return Model.GetVM_CombatItemButton_1();
}
FEUIModelRef __UIGetter_VM_CombatItemButton_2(const FVMS_ItemInfo &inout Model)
{
    return Model.GetVM_CombatItemButton_2();
}
FEUIModelRef __UIGetter_VM_CombatItemButton_Temp(const FVMS_ItemInfo &inout Model)
{
    return Model.GetVM_CombatItemButton_Temp();
}
FEUIModelRef __UIGetter_VM_LinkSkillButton(const FVMS_ItemInfo &inout Model)
{
    return Model.GetVM_LinkSkillButton();
}
TEUIModelRef<FVMS_ItemInfo> __UIGetter_Self(const FVMS_ItemInfo &inout Model)
{
    return TEUIModelRef<FVMS_ItemInfo>(Model);
}
int __IndexOf_Visibility_MountUsing()
{
    return 0;
}
int __IndexOf_HealItemNum()
{
    return 1;
}
int __IndexOf_CombatItemNum()
{
    return 2;
}
int __IndexOf_TempObjButtonVisible()
{
    return 3;
}
int __IndexOf_VM_HealItemButton()
{
    return 4;
}
int __IndexOf_VM_CombatItemButton_1()
{
    return 5;
}
int __IndexOf_VM_CombatItemButton_2()
{
    return 6;
}
int __IndexOf_VM_CombatItemButton_Temp()
{
    return 7;
}
int __IndexOf_VM_LinkSkillButton()
{
    return 8;
}
int __IndexOf_AvatarEntity()
{
    return 9;
}
int __IndexOf_bItemSet()
{
    return 10;
}
}
namespace __GeneratedProperties_FVMS_ItemInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
