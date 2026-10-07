
namespace FMS_MarkViewportDisplay
{
    const int ModelId = 0;

}
struct FMS_MarkViewportDisplay : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_SpotView> m_MarkSpotView;
    UPROPERTY()
    TSet<TEUIModelRef<FM_Spot>> m_PositionMarks;

    FMS_MarkViewportDisplay()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_MarkViewportDisplay(const FMS_MarkViewportDisplay &inout Other)
    {
        this.m_MarkSpotView = Other.m_MarkSpotView;
        this.m_PositionMarks = Other.m_PositionMarks;
        return;
    }
    FMS_MarkViewportDisplay& opAssign(const FMS_MarkViewportDisplay &inout Other)
    {
        this.m_MarkSpotView = Other.m_MarkSpotView;
        return Other.m_PositionMarks;
    }
    void PostConstruct()
    {
        this.SetMarkSpotView(TEUIModelRef<FM_SpotView>(::FM_SpotView::CreateDefault(this.GetManager(), EPresentationDataType(6))));
        return;
    }
    void OnMarkSpotAdded(const FMsg_InterestedSpotAdded &inout Msg)
    {
        if (!(Msg.Spot))
        {
            return;
        }
        TEUIModelRef<FM_PresentationData_Mark> local_14 = ::GetMarkData(Msg.Spot.opArrow(), FSpotViewAdapter(this.GetMarkSpotView()));
        if (local_14 && local_14.opArrow().GetbIsPositionMark())
        {
            this.GetModify_PositionMarks().Add(Msg.Spot);
        }
        return;
    }
    void OnMarkSpotRemoved(const FMsg_InterestedSpotRemoved &inout Msg)
    {
        return;
    }
    TEUIModelRef<FM_SpotView> GetMarkSpotView() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MarkSpotView;
    }
    void SetMarkSpotView(const TEUIModelRef<FM_SpotView> &inout __Value) property
    {
        TEUIModelRef<FM_SpotView> local_2;
        local_2 = this.m_MarkSpotView;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MarkSpotView = __Value;
        return;
    }
    const TSet<TEUIModelRef<FM_Spot>> GetPositionMarks() const property
    {
        const TSet<TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TSet<TEUIModelRef<FM_Spot>> GetModify_PositionMarks() property
    {
        TSet<TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPositionMarks(const TSet<TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PositionMarks = __Value;
        return;
    }
}

namespace FMS_MarkViewportDisplay
{
FMS_MarkViewportDisplay& Get(const UObject ContextObject)
{
    return FMS_MarkViewportDisplay::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_MarkViewportDisplay GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_MarkViewportDisplay __r;
    TEUIModelRef<FMS_MarkViewportDisplay> local_6 = TEUIModelRef<FMS_MarkViewportDisplay>(EUIInternal::MakeModelWithManager(Manager, FMS_MarkViewportDisplay::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FMS_MarkViewportDisplay;
}
void __OnMarkSpotAdded(FMS_MarkViewportDisplay &inout Model, const FMsg_InterestedSpotAdded &inout Message)
{
    Model.OnMarkSpotAdded(Message);
    return;
}
void __OnMarkSpotRemoved(FMS_MarkViewportDisplay &inout Model, const FMsg_InterestedSpotRemoved &inout Message)
{
    Model.OnMarkSpotRemoved(Message);
    return;
}
int __IndexOf_MarkSpotView()
{
    return 0;
}
int __IndexOf_PositionMarks()
{
    return 1;
}
}
