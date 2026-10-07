
namespace FVM_PositionMarkList
{
    const int ModelId = 0;

}
struct FVM_PositionMarkList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MarkSpotIcon>> m_PositionMarks;
    UPROPERTY()
    TEUIModelRef<FMS_MarkViewportDisplay> m_MarkViewportDisplay;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MarkSpotIcon>> PendingPositionMarks;

    FVM_PositionMarkList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_PositionMarkList(const FVM_PositionMarkList &inout Other)
    {
        this.m_PositionMarks = Other.m_PositionMarks;
        this.m_MarkViewportDisplay = Other.m_MarkViewportDisplay;
        return;
    }
    FVM_PositionMarkList& opAssign(const FVM_PositionMarkList &inout Other)
    {
        this.m_PositionMarks = Other.m_PositionMarks;
        return Other.m_MarkViewportDisplay;
    }
    void PostConstruct()
    {
        this.SetMarkViewportDisplay(TEUIModelRef<FMS_MarkViewportDisplay>(::FMS_MarkViewportDisplay::Get(this.GetContext().Manager)));
        return;
    }
    void OnPositionMarksChanged()
    {
        this.PendingPositionMarks.Reset(0);
        this.PendingPositionMarks.Reserve(this.GetMarkViewportDisplay().opArrow().GetPositionMarks().Num());
        for (auto& local_24 : this.GetMarkViewportDisplay().opArrow().GetPositionMarks())
        {
            this.PendingPositionMarks.Add(TEUIModelRef<FVM_MarkSpotIcon>(::FVM_MarkSpotIcon::Create(this.GetContext().Manager, local_24)));
        }
        this.SortPositionMarks(this.PendingPositionMarks);
        this.CommitPositionMarksIfChanged(this.PendingPositionMarks);
        return;
    }
    void Tick()
    {
        if (this.GetPositionMarks().Num() <= 1)
        {
            return;
        }
        this.PendingPositionMarks.Reset(0);
        this.PendingPositionMarks.Reserve(this.GetPositionMarks().Num());
        for (auto& local_18 : this.GetPositionMarks())
        {
            this.PendingPositionMarks.Add(local_18);
        }
        this.SortPositionMarks(this.PendingPositionMarks);
        this.CommitPositionMarksIfChanged(this.PendingPositionMarks);
        return;
    }
    void SortPositionMarks(TArray<TEUIModelRef<FVM_MarkSpotIcon>> &inout Marks) const
    {
        FVector local_6(FCameraUtils::GetCameraParam(this.GetContext().GetLocalPlayerPawn()).FinalPosition);
        return;
    }
    void CommitPositionMarksIfChanged(const TArray<TEUIModelRef<FVM_MarkSpotIcon>> &inout NextMarks)
    {
        TArray<TEUIModelRef<FVM_MarkSpotIcon>> local_4;
        local_4 = this.GetPositionMarks();
        if ((local_4 == NextMarks))
        {
            return;
        }
        this.GetModify_PositionMarks() = NextMarks;
        return;
    }
    const TArray<TEUIModelRef<FVM_MarkSpotIcon>> GetPositionMarks() const property
    {
        const TArray<TEUIModelRef<FVM_MarkSpotIcon>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_MarkSpotIcon>> GetModify_PositionMarks() property
    {
        TArray<TEUIModelRef<FVM_MarkSpotIcon>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPositionMarks(const TArray<TEUIModelRef<FVM_MarkSpotIcon>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PositionMarks = __Value;
        return;
    }
    TEUIModelRef<FMS_MarkViewportDisplay> GetMarkViewportDisplay() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MarkViewportDisplay;
    }
    void SetMarkViewportDisplay(const TEUIModelRef<FMS_MarkViewportDisplay> &inout __Value) property
    {
        TEUIModelRef<FMS_MarkViewportDisplay> local_2;
        local_2 = this.m_MarkViewportDisplay;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MarkViewportDisplay = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_HUD_Mark_VM_PositionMarkList_54
{
    UPROPERTY()
    FVector __CameraLocation;

    __Lambda_UI_Private_ViewModel_HUD_Mark_VM_PositionMarkList_54()
    {
        return;
    }
    __Lambda_UI_Private_ViewModel_HUD_Mark_VM_PositionMarkList_54(const FVector &inout _InCameraLocation)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FVector GetCameraLocation() property
    {
        FVector __r;
        return __r;
    }
    bool opCall(const TEUIModelRef<FVM_MarkSpotIcon> &inout A, const TEUIModelRef<FVM_MarkSpotIcon> &inout B)
    {
        return ::PresentationSpotUtils::CompareDistance(this.GetCameraLocation(), A.opArrow().GetSpot(), B.opArrow().GetSpot(), false);
    }
}

struct __GeneratedProperties_FVM_PositionMarkList
{
    UPROPERTY()
    TEUIModelRef<FVM_PositionMarkList> Self;

    __GeneratedProperties_FVM_PositionMarkList()
    {
        return;
    }
}

namespace FVM_PositionMarkList
{
FVM_PositionMarkList& Create(const UObject ContextObject)
{
    return FVM_PositionMarkList::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PositionMarkList CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_PositionMarkList __r;
    TEUIModelRef<FVM_PositionMarkList> local_6 = TEUIModelRef<FVM_PositionMarkList>(EUIInternal::MakeModelWithManager(Manager, FVM_PositionMarkList::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_PositionMarkList;
}
void __OnPositionMarksChanged(FVM_PositionMarkList &inout Model)
{
    Model.OnPositionMarksChanged();
    return;
}
void __Tick(FVM_PositionMarkList &inout Model)
{
    Model.Tick();
    return;
}
TArray<TEUIModelRef<FVM_MarkSpotIcon>> __UIGetter_PositionMarks(const FVM_PositionMarkList &inout Model)
{
    return Model.GetPositionMarks();
}
TEUIModelRef<FVM_PositionMarkList> __UIGetter_Self(const FVM_PositionMarkList &inout Model)
{
    return TEUIModelRef<FVM_PositionMarkList>(Model);
}
int __IndexOf_PositionMarks()
{
    return 0;
}
int __IndexOf_MarkViewportDisplay()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_PositionMarkList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
