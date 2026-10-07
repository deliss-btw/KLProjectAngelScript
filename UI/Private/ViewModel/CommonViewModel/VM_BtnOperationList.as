
namespace FVM_BtnOperationList
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnHoverBegin = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnHoverEnd = FEUIModelCallbackSignature();

}
struct FVM_BtnOperationList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_BtnOperationItem>> m_BtnList;
    UPROPERTY()
    bool m_bIsHovering;

    FVM_BtnOperationList()
    {
        this.m_bIsHovering = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BtnOperationList' by default constructor.");
        return;
    }
    FVM_BtnOperationList(const FVM_BtnOperationList &inout Other)
    {
        this.m_bIsHovering = false;
        this.m_BtnList = Other.m_BtnList;
        this.m_bIsHovering = Other.m_bIsHovering;
        return;
    }
    FVM_BtnOperationList(const TArray<TEUIModelRef<FVM_BtnOperationItem>> &inout InBtnList)
    {
        this.m_bIsHovering = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetBtnList(InBtnList);
        return;
    }
    FVM_BtnOperationList opAssign(const FVM_BtnOperationList &inout Other)
    {
        FVM_BtnOperationList __r;
        this.m_BtnList = Other.m_BtnList;
        this.m_bIsHovering = Other.m_bIsHovering;
        return __r;
    }
    void OnHoverBegin()
    {
        this.SetbIsHovering(true);
        return;
    }
    void OnHoverEnd()
    {
        this.SetbIsHovering(false);
        return;
    }
    const TArray<TEUIModelRef<FVM_BtnOperationItem>> GetBtnList() const property
    {
        const TArray<TEUIModelRef<FVM_BtnOperationItem>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_BtnOperationItem>> GetModify_BtnList() property
    {
        TArray<TEUIModelRef<FVM_BtnOperationItem>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetBtnList(const TArray<TEUIModelRef<FVM_BtnOperationItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BtnList = __Value;
        return;
    }
    bool GetbIsHovering() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsHovering;
    }
    void SetbIsHovering(const bool __Value) property
    {
        if (!(this.m_bIsHovering) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsHovering = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BtnOperationList
{
    UPROPERTY()
    TEUIModelRef<FVM_BtnOperationList> Self;

    __GeneratedProperties_FVM_BtnOperationList()
    {
        return;
    }
}

namespace FVM_BtnOperationList
{
FVM_BtnOperationList& Create(const UObject ContextObject, const TArray<TEUIModelRef<FVM_BtnOperationItem>> &inout BtnList)
{
    return FVM_BtnOperationList::CreateByManager(EUIInternal::GetContextManager(ContextObject), BtnList);
}
FVM_BtnOperationList CreateByManager(const UEUIManagerSubsystem Manager, const TArray<TEUIModelRef<FVM_BtnOperationItem>> &inout BtnList)
{
    FVM_BtnOperationList __r;
    TEUIModelRef<FVM_BtnOperationList> local_6 = TEUIModelRef<FVM_BtnOperationList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BtnOperationList::ModelId, 0, BtnList));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BtnList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_BtnOperationItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BtnOperationList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BtnOperationList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BtnOperationList;
}
TArray<TEUIModelRef<FVM_BtnOperationItem>> __UIGetter_BtnList(const FVM_BtnOperationList &inout Model)
{
    return Model.GetBtnList();
}
TEUIModelRef<FVM_BtnOperationList> __UIGetter_Self(const FVM_BtnOperationList &inout Model)
{
    return TEUIModelRef<FVM_BtnOperationList>(Model);
}
int __IndexOf_BtnList()
{
    return 0;
}
int __IndexOf_bIsHovering()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_BtnOperationList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
