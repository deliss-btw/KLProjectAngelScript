
namespace FVM_MotionTab
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectCurrentTab = FEUIModelCallbackSignature();

}
struct FVM_MotionTab : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_MotionIndex;
    UPROPERTY()
    FText m_TabName;
    UPROPERTY()
    FLinearColor m_TabColor;

    FVM_MotionTab()
    {
        this.m_MotionIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MotionTab' by default constructor.");
        return;
    }
    FVM_MotionTab(const FVM_MotionTab &inout Other)
    {
        this.m_MotionIndex = 0;
        this.m_MotionIndex = int(Other.m_MotionIndex);
        this.m_TabName = Other.m_TabName;
        this.m_TabColor = Other.m_TabColor;
        return;
    }
    FVM_MotionTab(const int InMotionIndex)
    {
        this.m_MotionIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMotionIndex(InMotionIndex);
        return;
    }
    FVM_MotionTab& opAssign(const FVM_MotionTab &inout Other)
    {
        this.m_MotionIndex = int(Other.m_MotionIndex);
        this.m_TabName = Other.m_TabName;
        return Other.m_TabColor;
    }
    void SelectCurrentTab()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayer());
        ::FVMS_MotionPage::Get(this.GetContext().Manager).SetCurrentTab(this.GetMotionIndex());
        return;
    }
    int GetMotionIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MotionIndex;
    }
    void SetMotionIndex(const int __Value) property
    {
        if (this.m_MotionIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MotionIndex = __Value;
        return;
    }
    FText GetTabName() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_TabName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTabName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TabName = __Value;
        return;
    }
    const FLinearColor GetTabColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FLinearColor GetModify_TabColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTabColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TabColor = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MotionTab
{
    UPROPERTY()
    TEUIModelRef<FVM_MotionTab> Self;

    __GeneratedProperties_FVM_MotionTab()
    {
        return;
    }
}

namespace FVM_MotionTab
{
FVM_MotionTab& Create(const UObject ContextObject, const int MotionIndex)
{
    return FVM_MotionTab::CreateByManager(EUIInternal::GetContextManager(ContextObject), MotionIndex);
}
FVM_MotionTab CreateByManager(const UEUIManagerSubsystem Manager, const int MotionIndex)
{
    FVM_MotionTab __r;
    TEUIModelRef<FVM_MotionTab> local_6 = TEUIModelRef<FVM_MotionTab>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MotionTab::ModelId, 0, MotionIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TabName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TabColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MotionTab>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MotionTab;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MotionTab;
}
FText __UIGetter_TabName(const FVM_MotionTab &inout Model)
{
    return Model.GetTabName();
}
FLinearColor __UIGetter_TabColor(const FVM_MotionTab &inout Model)
{
    return Model.GetTabColor();
}
TEUIModelRef<FVM_MotionTab> __UIGetter_Self(const FVM_MotionTab &inout Model)
{
    return TEUIModelRef<FVM_MotionTab>(Model);
}
int __IndexOf_MotionIndex()
{
    return 0;
}
int __IndexOf_TabName()
{
    return 1;
}
int __IndexOf_TabColor()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MotionTab
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
