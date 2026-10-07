
namespace FVM_Execute_QTE
{
    const int ModelId = 0;

}
struct FVM_Execute_QTE : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_QTE_Progress;
    UPROPERTY()
    FECSEntity m_ProgressTargetEntity;
    UPROPERTY()
    float32 m_HideOpacity;
    UPROPERTY()
    bool m_HasEnd;

    FVM_Execute_QTE()
    {
        this.m_QTE_Progress = 0.0f;
        this.m_HideOpacity = 1.0f;
        this.m_HasEnd = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Execute_QTE(const FVM_Execute_QTE &inout Other)
    {
        this.m_QTE_Progress = 0.0f;
        this.m_HideOpacity = 1.0f;
        this.m_HasEnd = false;
        this.m_QTE_Progress = Other.m_QTE_Progress;
        this.m_ProgressTargetEntity = Other.m_ProgressTargetEntity;
        this.m_HideOpacity = Other.m_HideOpacity;
        this.m_HasEnd = Other.m_HasEnd;
        return;
    }
    FVM_Execute_QTE opAssign(const FVM_Execute_QTE &inout Other)
    {
        FVM_Execute_QTE __r;
        this.m_QTE_Progress = Other.m_QTE_Progress;
        this.m_ProgressTargetEntity = Other.m_ProgressTargetEntity;
        this.m_HideOpacity = Other.m_HideOpacity;
        this.m_HasEnd = Other.m_HasEnd;
        return __r;
    }
    void Tick()
    {
        FECSEntity local_6 = this.GetContext().GetLocalPlayer();
        GetDefaulted local_10;
        TWeakObjectPtr<AECSPlayerController> local_12 = local_10.opCall().GetUEPlayerController();
        AECSPlayerController local_14;
        APlayerController local_2 = local_14;
        if (local_2 == nullptr)
        {
            return;
        }
        if (local_2.WasInputKeyJustPressed(EKeys::LeftMouseButton))
        {
            this.SetQTE_Progress((this.GetQTE_Progress() + 0.1f));
        }
        if (this.GetHasEnd() == false)
        {
            if (this.GetQTE_Progress() >= 1.0f)
            {
                this.SetHasEnd(true);
                this.SetHideOpacity(0.0f);
            }
        }
        return;
    }
    const float32 GetQTE_Progress() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_QTE_Progress() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetQTE_Progress(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_QTE_Progress = __Value;
        return;
    }
    const FECSEntity GetProgressTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_ProgressTargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetProgressTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ProgressTargetEntity = __Value;
        return;
    }
    const float32 GetHideOpacity() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_HideOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetHideOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_HideOpacity = __Value;
        return;
    }
    bool GetHasEnd() const property
    {
        this.TrackPropertyRead(3);
        return this.m_HasEnd;
    }
    void SetHasEnd(const bool __Value) property
    {
        if (!(this.m_HasEnd) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_HasEnd = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Execute_QTE
{
    UPROPERTY()
    TEUIModelRef<FVM_Execute_QTE> Self;

    __GeneratedProperties_FVM_Execute_QTE()
    {
        return;
    }
}

namespace FVM_Execute_QTE
{
FVM_Execute_QTE& Create(const UObject ContextObject)
{
    return FVM_Execute_QTE::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Execute_QTE CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Execute_QTE __r;
    TEUIModelRef<FVM_Execute_QTE> local_6 = TEUIModelRef<FVM_Execute_QTE>(EUIInternal::MakeModelWithManager(Manager, FVM_Execute_QTE::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "QTE_Progress";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressTargetEntity";
    local_14.TypeName = "FECSEntity";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HideOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Execute_QTE>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Execute_QTE;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Execute_QTE;
}
void __Tick(FVM_Execute_QTE &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_QTE_Progress(const FVM_Execute_QTE &inout Model)
{
    return Model.GetQTE_Progress();
}
FECSEntity __UIGetter_ProgressTargetEntity(const FVM_Execute_QTE &inout Model)
{
    return Model.GetProgressTargetEntity();
}
float32 __UIGetter_HideOpacity(const FVM_Execute_QTE &inout Model)
{
    return Model.GetHideOpacity();
}
TEUIModelRef<FVM_Execute_QTE> __UIGetter_Self(const FVM_Execute_QTE &inout Model)
{
    return TEUIModelRef<FVM_Execute_QTE>(Model);
}
int __IndexOf_QTE_Progress()
{
    return 0;
}
int __IndexOf_ProgressTargetEntity()
{
    return 1;
}
int __IndexOf_HideOpacity()
{
    return 2;
}
int __IndexOf_HasEnd()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_Execute_QTE
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
