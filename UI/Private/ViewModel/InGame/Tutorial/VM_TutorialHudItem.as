
namespace FVM_TutorialHudItem
{
    const int ModelId = 0;

}
struct FVM_TutorialHudItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_ItemIndex;
    UPROPERTY()
    int m_StepIndex;
    UPROPERTY()
    FText m_DisplayText;
    UPROPERTY()
    bool m_bIsProgress;
    UPROPERTY()
    bool m_bFinished;

    FVM_TutorialHudItem()
    {
        this.m_ItemIndex = 0;
        this.m_StepIndex = -1;
        this.m_bIsProgress = false;
        this.m_bFinished = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TutorialHudItem' by default constructor.");
        return;
    }
    FVM_TutorialHudItem(const FVM_TutorialHudItem &inout Other)
    {
        this.m_ItemIndex = 0;
        this.m_StepIndex = -1;
        this.m_bIsProgress = false;
        this.m_bFinished = false;
        this.m_ItemIndex = int(Other.m_ItemIndex);
        this.m_StepIndex = int(Other.m_StepIndex);
        this.m_DisplayText = Other.m_DisplayText;
        this.m_bIsProgress = Other.m_bIsProgress;
        this.m_bFinished = Other.m_bFinished;
        return;
    }
    FVM_TutorialHudItem(const int InItemIndex)
    {
        this.m_ItemIndex = 0;
        this.m_StepIndex = -1;
        this.m_bIsProgress = false;
        this.m_bFinished = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemIndex(InItemIndex);
        return;
    }
    FVM_TutorialHudItem opAssign(const FVM_TutorialHudItem &inout Other)
    {
        FVM_TutorialHudItem __r;
        this.m_ItemIndex = int(Other.m_ItemIndex);
        this.m_StepIndex = int(Other.m_StepIndex);
        this.m_DisplayText = Other.m_DisplayText;
        this.m_bIsProgress = Other.m_bIsProgress;
        this.m_bFinished = Other.m_bFinished;
        return __r;
    }
    int GetItemIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemIndex;
    }
    void SetItemIndex(const int __Value) property
    {
        if (this.m_ItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemIndex = __Value;
        return;
    }
    int GetStepIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_StepIndex;
    }
    void SetStepIndex(const int __Value) property
    {
        if (this.m_StepIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_StepIndex = __Value;
        return;
    }
    const FText GetDisplayText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_DisplayText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayText = __Value;
        return;
    }
    bool GetbIsProgress() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsProgress;
    }
    void SetbIsProgress(const bool __Value) property
    {
        if (!(this.m_bIsProgress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsProgress = __Value;
        return;
    }
    bool GetbFinished() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bFinished;
    }
    void SetbFinished(const bool __Value) property
    {
        if (!(this.m_bFinished) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bFinished = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TutorialHudItem
{
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHudItem> Self;

    __GeneratedProperties_FVM_TutorialHudItem()
    {
        return;
    }
}

namespace FVM_TutorialHudItem
{
FVM_TutorialHudItem& Create(const UObject ContextObject, const int ItemIndex)
{
    return FVM_TutorialHudItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemIndex);
}
FVM_TutorialHudItem CreateByManager(const UEUIManagerSubsystem Manager, const int ItemIndex)
{
    FVM_TutorialHudItem __r;
    TEUIModelRef<FVM_TutorialHudItem> local_6 = TEUIModelRef<FVM_TutorialHudItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TutorialHudItem::ModelId, 0, ItemIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsProgress";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bFinished";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TutorialHudItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TutorialHudItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TutorialHudItem;
}
FText __UIGetter_DisplayText(const FVM_TutorialHudItem &inout Model)
{
    return Model.GetDisplayText();
}
bool __UIGetter_bIsProgress(const FVM_TutorialHudItem &inout Model)
{
    return Model.GetbIsProgress();
}
bool __UIGetter_bFinished(const FVM_TutorialHudItem &inout Model)
{
    return Model.GetbFinished();
}
TEUIModelRef<FVM_TutorialHudItem> __UIGetter_Self(const FVM_TutorialHudItem &inout Model)
{
    return TEUIModelRef<FVM_TutorialHudItem>(Model);
}
int __IndexOf_ItemIndex()
{
    return 0;
}
int __IndexOf_StepIndex()
{
    return 1;
}
int __IndexOf_DisplayText()
{
    return 2;
}
int __IndexOf_bIsProgress()
{
    return 3;
}
int __IndexOf_bFinished()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_TutorialHudItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
