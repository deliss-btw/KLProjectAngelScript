
namespace FVM_AvatarEquipmentItem
{
    const int ModelId = 0;

}
struct FVM_AvatarEquipmentItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    uint64 m_EquipmentUid;
    UPROPERTY()
    TEUIModelRef<FVM_ComposableItem> m_ComposableItemVM;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_Equipment;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_EquipmentInfo;

    FVM_AvatarEquipmentItem()
    {
        this.m_EquipmentUid = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarEquipmentItem' by default constructor.");
        return;
    }
    FVM_AvatarEquipmentItem(const FVM_AvatarEquipmentItem &inout Other)
    {
        this.m_EquipmentUid = 0;
        this.m_EquipmentUid = Other.m_EquipmentUid;
        this.m_ComposableItemVM = Other.m_ComposableItemVM;
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        return;
    }
    FVM_AvatarEquipmentItem(const uint64 InEquipmentUid)
    {
        this.m_EquipmentUid = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipmentUid(InEquipmentUid);
        return;
    }
    FVM_AvatarEquipmentItem& opAssign(const FVM_AvatarEquipmentItem &inout Other)
    {
        this.m_EquipmentUid = Other.m_EquipmentUid;
        this.m_ComposableItemVM = Other.m_ComposableItemVM;
        this.m_Equipment = Other.m_Equipment;
        return Other.m_EquipmentInfo;
    }
    void PostConstruct()
    {
        int local_67 = 0;
        TEUIModelRef<FM_ItemData> local_6 = ::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(this.GetEquipmentUid());
        this.SetComposableItemVM(TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, local_6, EItemDisplayScenario(4))));
        this.SetEquipment(::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(this.GetEquipmentUid()));
        TEUIModelRef<FM_Equipment> local_12 = this.GetEquipment();
        TEUIModelRef<FVM_EquipmentInfo> local_14 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, local_12));
        this.SetEquipmentInfo(local_14);
        TEUIModelRef<FVM_EquipmentInfo> local_14_2 = this.GetEquipmentInfo();
        local_12.GetEquipment();
        TDataObjectPtr<FEquipmentConfig> local_38 = GetEquipmentConfig();
        if (local_38)
        {
            TEUIModelRef<FVM_RedDot> local_66;
            if (local_67 == 2)
            {
                local_66 = TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Weapon_NewWeapon, this.GetEquipmentUid())));
            }
            else
            {
                if (local_67 == 7)
                {
                    local_66 = TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Talisman_NewTalisman, this.GetEquipmentUid())));
                }
            }
            if (local_66.IsValid())
            {
                TEUIModelRef<FVM_ComposableItem> local_10 = this.GetComposableItemVM();
            }
        }
        return;
    }
    void OnFMsg_AvatarEquipBatchDecomposeStateChange(const FMsg_AvatarEquipBatchDecomposeStateChange &inout Msg)
    {
        if (this.GetComposableItemVM().IsValid())
        {
            TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItemVM();
            ::ComposableItemUtility::SetItemMaskEnable(false);
            TEUIModelRef<FVM_ComposableItem> local_2_2 = this.GetComposableItemVM();
            ::ComposableItemUtility::SetItemEquipMarkIsCheckableSelected(false);
            bool local_3 = this.GetEquipment().IsValid();
            if (!(local_3))
            {
                local_3 = false;
            }
            else
            {
                TEUIModelRef<FM_Equipment> local_6 = this.GetEquipment();
                local_3 = ::FEquipmentUtils::CanDecompose(GetEquipmentConfig());
            }
            TEUIModelRef<FVM_ComposableItem> local_2_3 = this.GetComposableItemVM();
            if (!(::ComposableItemUtility::IsItemEquipped()) && local_3)
            {
                if (Msg.bBatchDecompose)
                {
                }
                else
                {
                }
                TEUIModelRef<FVM_ComposableItem> local_2_4 = this.GetComposableItemVM();
                return;
            }
            if (!(Msg.bBatchDecompose) == !(true))
            {
                TEUIModelRef<FVM_ComposableItem> local_2_5 = this.GetComposableItemVM();
                ::ComposableItemUtility::SetItemMaskEnable(true);
            }
        }
        return;
    }
    uint64 GetEquipmentUid() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EquipmentUid;
    }
    void SetEquipmentUid(const uint64 __Value) property
    {
        if (this.m_EquipmentUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EquipmentUid = __Value;
        return;
    }
    TEUIModelRef<FVM_ComposableItem> GetComposableItemVM() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ComposableItemVM;
    }
    void SetComposableItemVM(const TEUIModelRef<FVM_ComposableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_ComposableItem> local_2;
        local_2 = this.m_ComposableItemVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ComposableItemVM = __Value;
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
    TEUIModelRef<FVM_EquipmentInfo> GetEquipmentInfo() const property
    {
        this.TrackPropertyRead(3);
        return this.m_EquipmentInfo;
    }
    void SetEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_EquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipmentInfo = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarEquipmentItem
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItem> Self;

    __GeneratedProperties_FVM_AvatarEquipmentItem()
    {
        return;
    }
}

namespace FVM_AvatarEquipmentItem
{
FVM_AvatarEquipmentItem& Create(const UObject ContextObject, const uint64 EquipmentUid)
{
    return FVM_AvatarEquipmentItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), EquipmentUid);
}
FVM_AvatarEquipmentItem CreateByManager(const UEUIManagerSubsystem Manager, const uint64 EquipmentUid)
{
    FVM_AvatarEquipmentItem __r;
    TEUIModelRef<FVM_AvatarEquipmentItem> local_6 = TEUIModelRef<FVM_AvatarEquipmentItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipmentItem::ModelId, 0, EquipmentUid));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ComposableItemVM";
    local_14.TypeName = "TEUIModelRef<FVM_ComposableItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipmentItem;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnFMsg_AvatarEquipBatchDecomposeStateChange";
    local_26.MessageTypeName = "Msg_AvatarEquipBatchDecomposeStateChange";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipmentItem;
}
void __OnFMsg_AvatarEquipBatchDecomposeStateChange(FVM_AvatarEquipmentItem &inout Model, const FMsg_AvatarEquipBatchDecomposeStateChange &inout Message)
{
    Model.OnFMsg_AvatarEquipBatchDecomposeStateChange(Message);
    return;
}
TEUIModelRef<FVM_ComposableItem> __UIGetter_ComposableItemVM(const FVM_AvatarEquipmentItem &inout Model)
{
    return Model.GetComposableItemVM();
}
TEUIModelRef<FVM_AvatarEquipmentItem> __UIGetter_Self(const FVM_AvatarEquipmentItem &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipmentItem>(Model);
}
int __IndexOf_EquipmentUid()
{
    return 0;
}
int __IndexOf_ComposableItemVM()
{
    return 1;
}
int __IndexOf_Equipment()
{
    return 2;
}
int __IndexOf_EquipmentInfo()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipmentItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
