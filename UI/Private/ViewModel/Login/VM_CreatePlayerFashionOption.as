
enum ECreatePlayerFashionItemType
{
    Face,
    Fashion,
}

namespace FVM_CreatePlayerFashionOption
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature HandleClicked = FEUIModelCallbackSignature();

}
struct FVM_CreatePlayerFashionOption : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    ECreatePlayerFashionItemType m_ItemType;
    UPROPERTY()
    EFashionSlotType m_SlotType;
    UPROPERTY()
    uint m_DataId;
    UPROPERTY()
    int m_ItemIndex;
    UPROPERTY()
    FEUIModelWeakRef m_OwnerCreatePlayer;

    FVM_CreatePlayerFashionOption()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CreatePlayerFashionOption(const FVM_CreatePlayerFashionOption &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_CreatePlayerFashionOption& opAssign(const FVM_CreatePlayerFashionOption &inout Other)
    {
        this.m_ItemType = Other.m_ItemType;
        this.m_SlotType = Other.m_SlotType;
        this.m_DataId = int(Other.m_DataId);
        this.m_ItemIndex = int(Other.m_ItemIndex);
        return Other.m_OwnerCreatePlayer;
    }
    void Setup(FVM_CreatePlayer &inout InOwner, const ECreatePlayerFashionItemType InItemType, const EFashionSlotType InSlotType, const uint InDataId, const int InItemIndex = INDEX_NONE)
    {
        FEUIModelRef local_4;
        this.SetOwnerCreatePlayer(FEUIModelWeakRef(local_4));
        this.SetItemType(ECreatePlayerFashionItemType(InItemType));
        this.SetSlotType(EFashionSlotType(InSlotType));
        this.SetDataId(InDataId);
        this.SetItemIndex(InItemIndex);
        return;
    }
    void HandleClicked()
    {
        bool local_5;
        if (!(this.GetOwnerCreatePlayer().AsRef().IsValid()))
        {
            local_5 = false;
        }
        else
        {
            FEUIModelRef::IsA local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            Get local_16;
            local_16.opCall().OnFashionOptionClicked(this);
        }
        return;
    }
    ECreatePlayerFashionItemType GetItemType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemType;
    }
    void SetItemType(const ECreatePlayerFashionItemType __Value) property
    {
        if (int(this.m_ItemType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemType = __Value;
        return;
    }
    EFashionSlotType GetSlotType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SlotType;
    }
    void SetSlotType(const EFashionSlotType __Value) property
    {
        if (int(this.m_SlotType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SlotType = __Value;
        return;
    }
    uint GetDataId() const property
    {
        this.TrackPropertyRead(2);
        return this.m_DataId;
    }
    void SetDataId(const uint __Value) property
    {
        if (this.m_DataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DataId = __Value;
        return;
    }
    int GetItemIndex() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ItemIndex;
    }
    void SetItemIndex(const int __Value) property
    {
        if (this.m_ItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ItemIndex = __Value;
        return;
    }
    const FEUIModelWeakRef GetOwnerCreatePlayer() const property
    {
        const FEUIModelWeakRef __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelWeakRef GetModify_OwnerCreatePlayer() property
    {
        FEUIModelWeakRef __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetOwnerCreatePlayer(const FEUIModelWeakRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_OwnerCreatePlayer = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CreatePlayerFashionOption
{
    UPROPERTY()
    TEUIModelRef<FVM_CreatePlayerFashionOption> Self;

    __GeneratedProperties_FVM_CreatePlayerFashionOption()
    {
        return;
    }
}

namespace FVM_CreatePlayerFashionOption
{
FVM_CreatePlayerFashionOption& Create(const UObject ContextObject)
{
    return FVM_CreatePlayerFashionOption::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CreatePlayerFashionOption CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CreatePlayerFashionOption __r;
    TEUIModelRef<FVM_CreatePlayerFashionOption> local_6 = TEUIModelRef<FVM_CreatePlayerFashionOption>(EUIInternal::MakeModelWithManager(Manager, FVM_CreatePlayerFashionOption::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemType";
    local_14.TypeName = "ECreatePlayerFashionItemType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SlotType";
    local_14.TypeName = "EFashionSlotType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CreatePlayerFashionOption>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CreatePlayerFashionOption;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CreatePlayerFashionOption;
}
ECreatePlayerFashionItemType __UIGetter_ItemType(const FVM_CreatePlayerFashionOption &inout Model)
{
    return Model.GetItemType();
}
EFashionSlotType __UIGetter_SlotType(const FVM_CreatePlayerFashionOption &inout Model)
{
    return Model.GetSlotType();
}
TEUIModelRef<FVM_CreatePlayerFashionOption> __UIGetter_Self(const FVM_CreatePlayerFashionOption &inout Model)
{
    return TEUIModelRef<FVM_CreatePlayerFashionOption>(Model);
}
int __IndexOf_ItemType()
{
    return 0;
}
int __IndexOf_SlotType()
{
    return 1;
}
int __IndexOf_DataId()
{
    return 2;
}
int __IndexOf_ItemIndex()
{
    return 3;
}
int __IndexOf_OwnerCreatePlayer()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_CreatePlayerFashionOption
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
