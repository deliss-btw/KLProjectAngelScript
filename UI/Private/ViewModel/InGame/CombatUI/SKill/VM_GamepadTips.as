
namespace FVM_GamepadTips
{
    const int ModelId = 0;

}
struct FVM_GamepadTips : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bGamepadLeftShoulderPress;
    UPROPERTY()
    bool m_bHasGuidingTarget;
    UPROPERTY()
    ESlateVisibility m_ChatKeyVisible;
    UPROPERTY()
    ESlateVisibility m_InventoryKeyVisible;
    UPROPERTY()
    ESlateVisibility m_MotionKeyVisible;

    FVM_GamepadTips()
    {
        this.m_bGamepadLeftShoulderPress = false;
        this.m_bHasGuidingTarget = false;
        this.m_ChatKeyVisible = ESlateVisibility(1);
        this.m_InventoryKeyVisible = ESlateVisibility(1);
        this.m_MotionKeyVisible = ESlateVisibility(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_GamepadTips(const FVM_GamepadTips &inout Other)
    {
        this.m_bGamepadLeftShoulderPress = false;
        this.m_bHasGuidingTarget = false;
        this.m_ChatKeyVisible = ESlateVisibility(1);
        this.m_InventoryKeyVisible = ESlateVisibility(1);
        this.m_MotionKeyVisible = ESlateVisibility(1);
        this.m_bGamepadLeftShoulderPress = Other.m_bGamepadLeftShoulderPress;
        this.m_bHasGuidingTarget = Other.m_bHasGuidingTarget;
        this.m_ChatKeyVisible = Other.m_ChatKeyVisible;
        this.m_InventoryKeyVisible = Other.m_InventoryKeyVisible;
        this.m_MotionKeyVisible = Other.m_MotionKeyVisible;
        return;
    }
    FVM_GamepadTips opAssign(const FVM_GamepadTips &inout Other)
    {
        FVM_GamepadTips __r;
        this.m_bGamepadLeftShoulderPress = Other.m_bGamepadLeftShoulderPress;
        this.m_bHasGuidingTarget = Other.m_bHasGuidingTarget;
        this.m_ChatKeyVisible = Other.m_ChatKeyVisible;
        this.m_InventoryKeyVisible = Other.m_InventoryKeyVisible;
        this.m_MotionKeyVisible = Other.m_MotionKeyVisible;
        return __r;
    }
    void UpdateHasGuidingTarget()
    {
        bool local_1;
        if (!(!(this.GetbGamepadLeftShoulderPress())))
        {
            local_1 = false;
        }
        else
        {
            local_1 = this.GetContext().GetLocalPlayer();
        }
        local_1 = local_1 && ::FGuidingPathUtils::ExistsAnyGuidingPath(this.GetContext().GetLocalPlayer());
        this.SetbHasGuidingTarget(local_1);
        return;
    }
    void UpdateSystemKeyVisibility()
    {
        int local_4;
        FMS_SystemControl& local_2 = ::FMS_SystemControl::Get(this.GetContext().Manager);
        if (local_2.IsWidgetLocked(GameplayTags::UI_Type_ChatMain))
        {
            int local_5;
            local_5 = 1;
            local_4 = local_5;
        }
        else
        {
            int local_5;
            local_5 = 0;
            local_4 = local_5;
        }
        this.SetChatKeyVisible(ESlateVisibility(local_4));
        if (local_2.IsWidgetLocked(GameplayTags::UI_Type_Inventory))
        {
            int local_5;
            local_5 = 1;
            local_4 = local_5;
        }
        else
        {
            int local_5;
            local_5 = 0;
            local_4 = local_5;
        }
        this.SetInventoryKeyVisible(ESlateVisibility(local_4));
        if (local_2.IsWidgetLocked(GameplayTags::UI_Type_Motion))
        {
            int local_5;
            local_5 = 1;
            local_4 = local_5;
        }
        else
        {
            int local_5;
            local_5 = 0;
            local_4 = local_5;
        }
        this.SetMotionKeyVisible(ESlateVisibility(local_4));
        return;
    }
    bool GetbGamepadLeftShoulderPress() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bGamepadLeftShoulderPress;
    }
    void SetbGamepadLeftShoulderPress(const bool __Value) property
    {
        if (!(this.m_bGamepadLeftShoulderPress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bGamepadLeftShoulderPress = __Value;
        return;
    }
    bool GetbHasGuidingTarget() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bHasGuidingTarget;
    }
    void SetbHasGuidingTarget(const bool __Value) property
    {
        if (!(this.m_bHasGuidingTarget) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bHasGuidingTarget = __Value;
        return;
    }
    ESlateVisibility GetChatKeyVisible() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ChatKeyVisible;
    }
    void SetChatKeyVisible(const ESlateVisibility __Value) property
    {
        if (int(this.m_ChatKeyVisible) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ChatKeyVisible = __Value;
        return;
    }
    ESlateVisibility GetInventoryKeyVisible() const property
    {
        this.TrackPropertyRead(3);
        return this.m_InventoryKeyVisible;
    }
    void SetInventoryKeyVisible(const ESlateVisibility __Value) property
    {
        if (int(this.m_InventoryKeyVisible) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_InventoryKeyVisible = __Value;
        return;
    }
    ESlateVisibility GetMotionKeyVisible() const property
    {
        this.TrackPropertyRead(4);
        return this.m_MotionKeyVisible;
    }
    void SetMotionKeyVisible(const ESlateVisibility __Value) property
    {
        if (int(this.m_MotionKeyVisible) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_MotionKeyVisible = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_GamepadTips
{
    UPROPERTY()
    TEUIModelRef<FVM_GamepadTips> Self;

    __GeneratedProperties_FVM_GamepadTips()
    {
        return;
    }
}

namespace FVM_GamepadTips
{
FVM_GamepadTips& Create(const UObject ContextObject)
{
    return FVM_GamepadTips::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_GamepadTips CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_GamepadTips __r;
    TEUIModelRef<FVM_GamepadTips> local_6 = TEUIModelRef<FVM_GamepadTips>(EUIInternal::MakeModelWithManager(Manager, FVM_GamepadTips::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bGamepadLeftShoulderPress";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasGuidingTarget";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ChatKeyVisible";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InventoryKeyVisible";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MotionKeyVisible";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GamepadTips>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GamepadTips;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "UpdateHasGuidingTarget";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "UpdateSystemKeyVisibility";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GamepadTips;
}
bool __UIGetter_bGamepadLeftShoulderPress(const FVM_GamepadTips &inout Model)
{
    return Model.GetbGamepadLeftShoulderPress();
}
bool __UIGetter_bHasGuidingTarget(const FVM_GamepadTips &inout Model)
{
    return Model.GetbHasGuidingTarget();
}
ESlateVisibility __UIGetter_ChatKeyVisible(const FVM_GamepadTips &inout Model)
{
    return Model.GetChatKeyVisible();
}
ESlateVisibility __UIGetter_InventoryKeyVisible(const FVM_GamepadTips &inout Model)
{
    return Model.GetInventoryKeyVisible();
}
ESlateVisibility __UIGetter_MotionKeyVisible(const FVM_GamepadTips &inout Model)
{
    return Model.GetMotionKeyVisible();
}
TEUIModelRef<FVM_GamepadTips> __UIGetter_Self(const FVM_GamepadTips &inout Model)
{
    return TEUIModelRef<FVM_GamepadTips>(Model);
}
int __IndexOf_bGamepadLeftShoulderPress()
{
    return 0;
}
int __IndexOf_bHasGuidingTarget()
{
    return 1;
}
int __IndexOf_ChatKeyVisible()
{
    return 2;
}
int __IndexOf_InventoryKeyVisible()
{
    return 3;
}
int __IndexOf_MotionKeyVisible()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_GamepadTips
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
