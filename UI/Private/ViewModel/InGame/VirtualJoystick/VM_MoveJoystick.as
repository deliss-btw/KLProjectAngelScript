
namespace FVM_MoveJoystick
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature HandleTouchStarted = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleTouchMoved = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleTouchEnded = FEUIModelCallbackSignature();

}
struct FVM_MoveJoystick : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FVector2D m_ThumbOffset;
    UPROPERTY()
    FVector2D m_BasePosition;
    UPROPERTY()
    bool m_bIsActive;
    UPROPERTY()
    FVector2D m_MoveAxis;
    UPROPERTY()
    int m_ActiveTouchIndex;
    UPROPERTY()
    FVector2D m_StartTouchPos;
    UPROPERTY()
    FVirtualJoystickConfig m_Config;

    FVM_MoveJoystick()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_MoveJoystick(const FVM_MoveJoystick &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_MoveJoystick& opAssign(const FVM_MoveJoystick &inout Other)
    {
        this.m_ThumbOffset = Other.m_ThumbOffset;
        this.m_BasePosition = Other.m_BasePosition;
        this.m_bIsActive = Other.m_bIsActive;
        this.m_MoveAxis = Other.m_MoveAxis;
        this.m_ActiveTouchIndex = int(Other.m_ActiveTouchIndex);
        return Other.m_StartTouchPos;
    }
    void LoadConfig(const FConfigVM_MoveJoystick &inout InConfig)
    {
        this.SetConfig(InConfig.Config);
        return;
    }
    void PostConstruct()
    {
        return;
    }
    void HandleTouchStarted(const FVector2D &inout ScreenPos, const int FingerIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void HandleTouchMoved(const FVector2D &inout ScreenPos, const int FingerIndex)
    {
        if (this.GetActiveTouchIndex() != FingerIndex)
        {
            return;
        }
        this.UpdateThumbPosition(ScreenPos);
        return;
    }
    void HandleTouchEnded(const int FingerIndex)
    {
        if (this.GetActiveTouchIndex() != FingerIndex)
        {
            return;
        }
        this.SetActiveTouchIndex(INDEX_NONE);
        this.SetbIsActive(false);
        this.SetThumbOffset(FVector2D(0.0, 0.0));
        this.SetMoveAxis(FVector2D(0.0, 0.0));
        return;
    }
    void UpdateThumbPosition(const FVector2D &inout CurrentTouchPos)
    {
        FVector2D local_8 = (CurrentTouchPos - this.GetStartTouchPos());
        if (local_8.Size() > this.GetConfig().Radius)
        {
            local_8 = (local_8.GetSafeNormal(9.99999993922529e-9) * this.GetConfig().Radius);
        }
        this.SetThumbOffset(local_8);
        FVector2D local_18 = (local_8 / this.GetConfig().Radius);
        if (local_18.Size() < this.GetConfig().DeadZone)
        {
            this.SetMoveAxis(FVector2D(0.0, 0.0));
            return;
        }
        this.SetMoveAxis(((FVector2D(local_18.X, -local_18.Y).GetSafeNormal(9.99999993922529e-9)) * ((local_18.Size() - this.GetConfig().DeadZone) / (1.0f - this.GetConfig().DeadZone))));
        return;
    }
    const FVector2D GetThumbOffset() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FVector2D GetModify_ThumbOffset() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetThumbOffset(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ThumbOffset = __Value;
        return;
    }
    const FVector2D GetBasePosition() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVector2D GetModify_BasePosition() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetBasePosition(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_BasePosition = __Value;
        return;
    }
    bool GetbIsActive() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsActive;
    }
    void SetbIsActive(const bool __Value) property
    {
        if (!(this.m_bIsActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsActive = __Value;
        return;
    }
    const FVector2D GetMoveAxis() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FVector2D GetModify_MoveAxis() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetMoveAxis(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MoveAxis = __Value;
        return;
    }
    int GetActiveTouchIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_ActiveTouchIndex;
    }
    void SetActiveTouchIndex(const int __Value) property
    {
        if (this.m_ActiveTouchIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ActiveTouchIndex = __Value;
        return;
    }
    const FVector2D GetStartTouchPos() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FVector2D GetModify_StartTouchPos() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetStartTouchPos(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_StartTouchPos = __Value;
        return;
    }
    FVirtualJoystickConfig GetConfig() const property
    {
        FVirtualJoystickConfig __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FVirtualJoystickConfig GetModify_Config() property
    {
        FVirtualJoystickConfig __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetConfig(const FVirtualJoystickConfig &inout __Value) property
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

struct __GeneratedProperties_FVM_MoveJoystick
{
    UPROPERTY()
    TEUIModelRef<FVM_MoveJoystick> Self;

    __GeneratedProperties_FVM_MoveJoystick()
    {
        return;
    }
}

namespace FVM_MoveJoystick
{
FVM_MoveJoystick& Create(const UObject ContextObject)
{
    return FVM_MoveJoystick::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MoveJoystick CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MoveJoystick __r;
    TEUIModelRef<FVM_MoveJoystick> local_6 = TEUIModelRef<FVM_MoveJoystick>(EUIInternal::MakeModelWithManager(Manager, FVM_MoveJoystick::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ThumbOffset";
    local_14.TypeName = "FVector2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BasePosition";
    local_14.TypeName = "FVector2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsActive";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MoveAxis";
    local_14.TypeName = "FVector2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MoveJoystick>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MoveJoystick;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MoveJoystick;
}
FVector2D __UIGetter_ThumbOffset(const FVM_MoveJoystick &inout Model)
{
    return Model.GetThumbOffset();
}
FVector2D __UIGetter_BasePosition(const FVM_MoveJoystick &inout Model)
{
    return Model.GetBasePosition();
}
bool __UIGetter_bIsActive(const FVM_MoveJoystick &inout Model)
{
    return Model.GetbIsActive();
}
FVector2D __UIGetter_MoveAxis(const FVM_MoveJoystick &inout Model)
{
    return Model.GetMoveAxis();
}
TEUIModelRef<FVM_MoveJoystick> __UIGetter_Self(const FVM_MoveJoystick &inout Model)
{
    return TEUIModelRef<FVM_MoveJoystick>(Model);
}
int __IndexOf_ThumbOffset()
{
    return 0;
}
int __IndexOf_BasePosition()
{
    return 1;
}
int __IndexOf_bIsActive()
{
    return 2;
}
int __IndexOf_MoveAxis()
{
    return 3;
}
int __IndexOf_ActiveTouchIndex()
{
    return 4;
}
int __IndexOf_StartTouchPos()
{
    return 5;
}
int __IndexOf_Config()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_MoveJoystick
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
