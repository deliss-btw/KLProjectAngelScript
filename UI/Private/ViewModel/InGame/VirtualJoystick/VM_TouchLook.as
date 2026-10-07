
namespace FVM_TouchLook
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature HandleTouchStarted = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleTouchMoved = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HandleTouchEnded = FEUIModelCallbackSignature();

}
struct FVM_TouchLook : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FVector2D m_LookDelta;
    UPROPERTY()
    int m_ActiveTouchIndex;
    UPROPERTY()
    FVector2D m_LastTouchPos;
    UPROPERTY()
    FKey m_XAxis;
    UPROPERTY()
    FKey m_YAxis;
    UPROPERTY()
    float32 m_LookSensitivity;

    FVM_TouchLook()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_TouchLook(const FVM_TouchLook &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_TouchLook opAssign(const FVM_TouchLook &inout Other)
    {
        FVM_TouchLook __r;
        this.m_LookDelta = Other.m_LookDelta;
        this.m_ActiveTouchIndex = int(Other.m_ActiveTouchIndex);
        this.m_LastTouchPos = Other.m_LastTouchPos;
        this.m_XAxis = Other.m_XAxis;
        this.m_YAxis = Other.m_YAxis;
        this.m_LookSensitivity = Other.m_LookSensitivity;
        return __r;
    }
    void LoadConfig(const FConfigVM_TouchLook &inout InConfig)
    {
        this.SetYAxis(InConfig.YAxis);
        this.SetLookSensitivity(InConfig.LookSensitivity);
        this.SetXAxis(InConfig.XAxis);
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
        FVector2D local_10 = (ScreenPos - this.GetLastTouchPos());
        this.SetLastTouchPos(ScreenPos);
        float local_12 = -local_10.Y;
        FVector2D local_6 = FVector2D(local_10.X, local_12);
        float local_12_2 = this.GetLookSensitivity();
        this.SetLookDelta((local_6 * local_12_2));
        return;
    }
    void HandleTouchEnded(const int FingerIndex)
    {
        if (this.GetActiveTouchIndex() != FingerIndex)
        {
            return;
        }
        this.SetActiveTouchIndex(INDEX_NONE);
        this.SetLookDelta(FVector2D(0.0, 0.0));
        return;
    }
    const FVector2D GetLookDelta() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FVector2D GetModify_LookDelta() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLookDelta(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LookDelta = __Value;
        return;
    }
    int GetActiveTouchIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ActiveTouchIndex;
    }
    void SetActiveTouchIndex(const int __Value) property
    {
        if (this.m_ActiveTouchIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ActiveTouchIndex = __Value;
        return;
    }
    const FVector2D GetLastTouchPos() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FVector2D GetModify_LastTouchPos() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetLastTouchPos(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LastTouchPos = __Value;
        return;
    }
    const FKey GetXAxis() const property
    {
        const FKey __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FKey GetModify_XAxis() property
    {
        FKey __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetXAxis(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_XAxis = __Value;
        return;
    }
    const FKey GetYAxis() const property
    {
        const FKey __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FKey GetModify_YAxis() property
    {
        FKey __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetYAxis(const FKey &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_YAxis = __Value;
        return;
    }
    const float32 GetLookSensitivity() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_LookSensitivity() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetLookSensitivity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_LookSensitivity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TouchLook
{
    UPROPERTY()
    TEUIModelRef<FVM_TouchLook> Self;

    __GeneratedProperties_FVM_TouchLook()
    {
        return;
    }
}

namespace FVM_TouchLook
{
FVM_TouchLook& Create(const UObject ContextObject)
{
    return FVM_TouchLook::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TouchLook CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TouchLook __r;
    TEUIModelRef<FVM_TouchLook> local_6 = TEUIModelRef<FVM_TouchLook>(EUIInternal::MakeModelWithManager(Manager, FVM_TouchLook::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "LookDelta";
    local_14.TypeName = "FVector2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TouchLook>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TouchLook;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TouchLook;
}
FVector2D __UIGetter_LookDelta(const FVM_TouchLook &inout Model)
{
    return Model.GetLookDelta();
}
TEUIModelRef<FVM_TouchLook> __UIGetter_Self(const FVM_TouchLook &inout Model)
{
    return TEUIModelRef<FVM_TouchLook>(Model);
}
int __IndexOf_LookDelta()
{
    return 0;
}
int __IndexOf_ActiveTouchIndex()
{
    return 1;
}
int __IndexOf_LastTouchPos()
{
    return 2;
}
int __IndexOf_XAxis()
{
    return 3;
}
int __IndexOf_YAxis()
{
    return 4;
}
int __IndexOf_LookSensitivity()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_TouchLook
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
