
namespace FVM_MarkViewportDisplay
{
    const int ModelId = 0;

}
struct FVM_MarkViewportDisplay : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FECSEntity> m_AllMarks;
    UPROPERTY()
    bool m_bNeedRefreshMark;

    FVM_MarkViewportDisplay()
    {
        this.m_bNeedRefreshMark = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MarkViewportDisplay(const FVM_MarkViewportDisplay &inout Other)
    {
        this.m_bNeedRefreshMark = true;
        this.m_AllMarks = Other.m_AllMarks;
        this.m_bNeedRefreshMark = Other.m_bNeedRefreshMark;
        return;
    }
    FVM_MarkViewportDisplay opAssign(const FVM_MarkViewportDisplay &inout Other)
    {
        FVM_MarkViewportDisplay __r;
        this.m_AllMarks = Other.m_AllMarks;
        this.m_bNeedRefreshMark = Other.m_bNeedRefreshMark;
        return __r;
    }
    void Tick()
    {
        if (this.GetbNeedRefreshMark())
        {
            this.SetAllMarks(::MarkUtil::GetAllVisibleMarks(this.GetContext().GetLocalPlayer(), true));
            this.SetbNeedRefreshMark(false);
        }
        return;
    }
    void OnMarkUpdate(const FCE_NotifyUI_RefreshVisibleMarks &inout Event)
    {
        this.SetbNeedRefreshMark(true);
        return;
    }
    const TArray<FECSEntity> GetAllMarks() const property
    {
        const TArray<FECSEntity> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FECSEntity> GetModify_AllMarks() property
    {
        TArray<FECSEntity> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAllMarks(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AllMarks = __Value;
        return;
    }
    bool GetbNeedRefreshMark() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bNeedRefreshMark;
    }
    void SetbNeedRefreshMark(const bool __Value) property
    {
        if (!(this.m_bNeedRefreshMark) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bNeedRefreshMark = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MarkViewportDisplay
{
    UPROPERTY()
    TEUIModelRef<FVM_MarkViewportDisplay> Self;

    __GeneratedProperties_FVM_MarkViewportDisplay()
    {
        return;
    }
}

namespace FVM_MarkViewportDisplay
{
FVM_MarkViewportDisplay& Create(const UObject ContextObject)
{
    return FVM_MarkViewportDisplay::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MarkViewportDisplay CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MarkViewportDisplay __r;
    TEUIModelRef<FVM_MarkViewportDisplay> local_6 = TEUIModelRef<FVM_MarkViewportDisplay>(EUIInternal::MakeModelWithManager(Manager, FVM_MarkViewportDisplay::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AllMarks";
    local_14.TypeName = "TArray<FECSEntity>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MarkViewportDisplay>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MarkViewportDisplay;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__OnMarkUpdate";
    local_22.EventType = FCE_NotifyUI_RefreshVisibleMarks;
    Result.EventFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MarkViewportDisplay;
}
void __Tick(FVM_MarkViewportDisplay &inout Model)
{
    Model.Tick();
    return;
}
void __OnMarkUpdate(FVM_MarkViewportDisplay &inout Model, const FCE_NotifyUI_RefreshVisibleMarks &inout Event)
{
    Model.OnMarkUpdate(Event);
    return;
}
TArray<FECSEntity> __UIGetter_AllMarks(const FVM_MarkViewportDisplay &inout Model)
{
    return Model.GetAllMarks();
}
TEUIModelRef<FVM_MarkViewportDisplay> __UIGetter_Self(const FVM_MarkViewportDisplay &inout Model)
{
    return TEUIModelRef<FVM_MarkViewportDisplay>(Model);
}
int __IndexOf_AllMarks()
{
    return 0;
}
int __IndexOf_bNeedRefreshMark()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_MarkViewportDisplay
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
