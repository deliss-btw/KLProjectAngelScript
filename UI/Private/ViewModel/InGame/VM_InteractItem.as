
namespace FVM_InteractItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnButtonClicked = FEUIModelCallbackSignature();

}
struct FVM_InteractItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_DisplayText;
    UPROPERTY()
    FName m_GroupName;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    bool m_bSetVisibility;
    UPROPERTY()
    ESlateVisibility m_Visibility;
    UPROPERTY()
    FUIInteractAbilityGroup m_AbilityGroup;

    FVM_InteractItem()
    {
        this.m_Index = 0;
        this.m_bSetVisibility = false;
        this.m_Visibility = ESlateVisibility(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InteractItem' by default constructor.");
        return;
    }
    FVM_InteractItem(const FVM_InteractItem &inout Other)
    {
        this.m_Index = 0;
        this.m_bSetVisibility = false;
        this.m_Visibility = ESlateVisibility(0);
        this.m_DisplayText = Other.m_DisplayText;
        this.m_GroupName = Other.m_GroupName;
        this.m_Index = int(Other.m_Index);
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_bSetVisibility = Other.m_bSetVisibility;
        this.m_Visibility = Other.m_Visibility;
        return;
    }
    FVM_InteractItem(const FName &inout InGroupName, const int InIndex, const FECSEntity &inout InTargetEntity, const bool InbSetVisibility)
    {
        this.m_Index = 0;
        this.m_bSetVisibility = false;
        this.m_Visibility = ESlateVisibility(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetGroupName(InGroupName);
        this.SetIndex(InIndex);
        this.SetTargetEntity(InTargetEntity);
        this.SetbSetVisibility(InbSetVisibility);
        return;
    }
    FVM_InteractItem opAssign(const FVM_InteractItem &inout Other)
    {
        FVM_InteractItem __r;
        this.m_DisplayText = Other.m_DisplayText;
        this.m_GroupName = Other.m_GroupName;
        this.m_Index = int(Other.m_Index);
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_bSetVisibility = Other.m_bSetVisibility;
        this.m_Visibility = Other.m_Visibility;
        return __r;
    }
    void PostConstruct()
    {
        this.SetAbilityGroup(::UIInteractAbilityConfig::GetUIInteractAbilityGroup(this.GetGroupName()));
        this.SetDisplayText(this.GetAbilityGroup().GroupItems[this.GetIndex()].DisplayText);
        return;
    }
    void OnButtonClicked()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        FECSEntity local_12 = FECSEntity(this.GetContext().GetLocalPlayer());
        ::FInteractUtils::LocallyTriggerUIInteractAbility(local_4, this.GetAbilityGroup().GroupItems[this.GetIndex()]);
        return;
    }
    void Tick()
    {
        bool local_8;
        if (!(this.GetbSetVisibility()))
        {
            local_8 = false;
        }
        else
        {
            FNameHandle_EntityBBVar local_6;
            local_6;
            local_8 = this.GetTargetEntity().HasEntityBB(local_6);
        }
        if (local_8)
        {
            FNameHandle_EntityBBVarInt local_12;
            local_12;
            if (this.GetTargetEntity().GetBB_Int(local_12) == 0)
            {
                this.SetVisibility(ESlateVisibility(0));
                return;
            }
            this.SetVisibility(ESlateVisibility(1));
        }
        return;
    }
    const FText GetDisplayText() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_DisplayText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDisplayText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DisplayText = __Value;
        return;
    }
    const FName GetGroupName() const property
    {
        const FName __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FName GetModify_GroupName() property
    {
        FName __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetGroupName(const FName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_GroupName = __Value;
        return;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Index = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TargetEntity = __Value;
        return;
    }
    bool GetbSetVisibility() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bSetVisibility;
    }
    void SetbSetVisibility(const bool __Value) property
    {
        if (!(this.m_bSetVisibility) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bSetVisibility = __Value;
        return;
    }
    ESlateVisibility GetVisibility() const property
    {
        this.TrackPropertyRead(5);
        return this.m_Visibility;
    }
    void SetVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_Visibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Visibility = __Value;
        return;
    }
    const FUIInteractAbilityGroup GetAbilityGroup() const property
    {
        const FUIInteractAbilityGroup __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FUIInteractAbilityGroup GetModify_AbilityGroup() property
    {
        FUIInteractAbilityGroup __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetAbilityGroup(const FUIInteractAbilityGroup &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        return;
    }
}

struct __GeneratedProperties_FVM_InteractItem
{
    UPROPERTY()
    TEUIModelRef<FVM_InteractItem> Self;

    __GeneratedProperties_FVM_InteractItem()
    {
        return;
    }
}

namespace FVM_InteractItem
{
FVM_InteractItem& Create(const UObject ContextObject, const FName &inout GroupName, const int Index, const FECSEntity &inout TargetEntity, const bool bSetVisibility)
{
    return FVM_InteractItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), GroupName, Index, TargetEntity, bSetVisibility);
}
FVM_InteractItem CreateByManager(const UEUIManagerSubsystem Manager, const FName &inout GroupName, const int Index, const FECSEntity &inout TargetEntity, const bool bSetVisibility)
{
    FVM_InteractItem __r;
    TEUIModelRef<FVM_InteractItem> local_6 = TEUIModelRef<FVM_InteractItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InteractItem::ModelId, 0, GroupName, Index, TargetEntity, bSetVisibility));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InteractItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InteractItem;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InteractItem;
}
void __Tick(FVM_InteractItem &inout Model)
{
    Model.Tick();
    return;
}
FText __UIGetter_DisplayText(const FVM_InteractItem &inout Model)
{
    return Model.GetDisplayText();
}
ESlateVisibility __UIGetter_Visibility(const FVM_InteractItem &inout Model)
{
    return Model.GetVisibility();
}
TEUIModelRef<FVM_InteractItem> __UIGetter_Self(const FVM_InteractItem &inout Model)
{
    return TEUIModelRef<FVM_InteractItem>(Model);
}
int __IndexOf_DisplayText()
{
    return 0;
}
int __IndexOf_GroupName()
{
    return 1;
}
int __IndexOf_Index()
{
    return 2;
}
int __IndexOf_TargetEntity()
{
    return 3;
}
int __IndexOf_bSetVisibility()
{
    return 4;
}
int __IndexOf_Visibility()
{
    return 5;
}
int __IndexOf_AbilityGroup()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_InteractItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
