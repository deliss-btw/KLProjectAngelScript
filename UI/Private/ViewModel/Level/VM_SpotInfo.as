
namespace FVM_SpotInfo
{
    const int ModelId = 0;

}
struct FVM_SpotInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    EPresentationSpotUsage m_SpotUsage;
    UPROPERTY()
    FSoftBrush m_SpotIcon;
    UPROPERTY()
    TMap<EPresentationSpotDecoractor, FEUIModelContainer> m_Decoractors;
    UPROPERTY()
    FSpotViewAdapter m_SpotViewAdapter;

    FVM_SpotInfo()
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SpotInfo' by default constructor.");
        return;
    }
    FVM_SpotInfo(const FVM_SpotInfo &inout Other)
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        this.m_SpotIcon = Other.m_SpotIcon;
        this.m_Decoractors = Other.m_Decoractors;
        return;
    }
    FVM_SpotInfo(const TEUIModelRef<FM_Spot> &inout InSpot, const EPresentationSpotUsage InSpotUsage)
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        this.SetSpotUsage(EPresentationSpotUsage(InSpotUsage));
        return;
    }
    FVM_SpotInfo& opAssign(const FVM_SpotInfo &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        this.m_SpotIcon = Other.m_SpotIcon;
        return Other.m_Decoractors;
    }
    FText GetSpotName() const
    {
        return ::GetSpotName(this.GetSpot().opArrow(), this.GetSpotViewAdapter());
    }
    FText GetSpotDescription() const
    {
        return ::GetSpotDescription(this.GetSpot().opArrow(), this.GetSpotViewAdapter());
    }
    FMargin GetSpotIconPadding() const
    {
        int local_1 = int(this.GetSpotUsage());
        return ::PresentationSpotDisplayUtils::GetSpotIconPadding(this.GetSpot());
    }
    bool HasGuideDecoractor() const
    {
        return this.GetDecoractors().Contains(EPresentationSpotDecoractor(0));
    }
    FEUIModelContainer GetGuideDecoractorModel() const
    {
        FEUIModelContainer __return;
        if (this.GetDecoractors().Find(EPresentationSpotDecoractor(0)))
        {
        }
        else
        {
            __return = FEUIModelContainer();
        }
        return __return;
    }
    bool HasMarkDecoractor() const
    {
        return this.GetDecoractors().Contains(EPresentationSpotDecoractor(1));
    }
    FEUIModelContainer GetMarkDecoractorModel() const
    {
        FEUIModelContainer __return;
        if (this.GetDecoractors().Find(EPresentationSpotDecoractor(1)))
        {
        }
        else
        {
            __return = FEUIModelContainer();
        }
        return __return;
    }
    bool HasMissionDecoractor() const
    {
        return this.GetDecoractors().Contains(EPresentationSpotDecoractor(2));
    }
    FEUIModelContainer GetMissionDecoractorModel() const
    {
        FEUIModelContainer __return;
        if (this.GetDecoractors().Find(EPresentationSpotDecoractor(2)))
        {
        }
        else
        {
            int local_8 = int(this.GetSpotUsage());
            __return = ::PresentationSpotDisplayUtils::CreateDecoractor(this.GetSpot());
        }
        return __return;
    }
    bool HasBossLowHPDecoractor() const
    {
        return this.GetDecoractors().Contains(EPresentationSpotDecoractor(3));
    }
    FEUIModelContainer GetBossLowHPDecoractorModel() const
    {
        FEUIModelContainer __return;
        if (this.GetDecoractors().Find(EPresentationSpotDecoractor(3)))
        {
        }
        else
        {
            __return = FEUIModelContainer();
        }
        return __return;
    }
    bool IsNPCSpot() const
    {
        FSpotViewAdapter local_10;
        TEUIModelRef<FM_Spot> local_2 = this.GetSpot();
        if (::GetPresentationConfig(local_2.opArrow(), local_10))
        {
            CastTo local_64;
            return !(!(local_64.opCall()));
        }
        return false;
    }
    bool IsMissionSpot() const
    {
        bool local_385;
        FSpotViewAdapter local_10;
        TEUIModelRef<FM_Spot> local_2 = this.GetSpot();
        TDataObjectPtr<FPresentationConfig> local_34 = ::GetPresentationConfig(local_2.opArrow(), local_10);
        if (local_34)
        {
            FSpotViewAdapter local_70;
            FMissionPresentationData local_168 = ::GetMissionData(this.GetSpot().opArrow(), local_70);
            if (local_168.MissionConfig)
            {
                TDataObjectPtr<FMissionPhaseConfig> local_288;
                TDataObjectPtr<FGuidePresentationConfig> local_312 = ::MissionUtils::GetGuidePresentationConfig(local_168.MissionConfig, local_288);
                if (!(local_312))
                {
                    local_385 = false;
                }
                else
                {
                    TDataObjectPtr<FPresentationConfig> local_58;
                    local_58 = local_312.opArrow().GetPresentationConfig();
                    local_385 = (local_58 == local_34.opImplConv());
                }
                if (local_385)
                {
                    return true;
                }
            }
        }
        return false;
    }
    bool ShouldShowLargeMissionIcon() const
    {
        return (this.IsNPCSpot() && this.HasMissionDecoractor()) || this.IsMissionSpot();
    }
    bool ShouldShowSmallMissionIcon() const
    {
        return !(this.IsNPCSpot()) && this.HasMissionDecoractor() && !(this.IsMissionSpot());
    }
    void PostConstruct()
    {
        int local_1 = int(this.GetSpotUsage());
        this.SetSpotViewAdapter(FSpotViewAdapter(::PresentationSpotDisplayUtils::GetDesiredSpotView(this.GetManager())));
        this.UpdateSpotIcon();
        this.UpdateDecoractors();
        return;
    }
    void OnSpotPresentationDataModified(const FMsg_SpotPresentationDataModified &inout Message)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void UpdateSpotIcon()
    {
        int local_1 = int(this.GetSpotUsage());
        this.SetSpotIcon(::PresentationSpotDisplayUtils::GetSpotIcon(this.GetSpot()));
        return;
    }
    void UpdateDecoractors()
    {
        FBitSet32 local_3 = ::GetDecoractorsBitSet(this.GetSpot().opArrow(), this.GetSpotViewAdapter());
        TArray<EPresentationSpotDecoractor> local_8;
        for (auto& local_28 : this.GetDecoractors())
        {
            EPresentationSpotDecoractor local_29 = local_28.GetKey();
            if (!(local_3.GetBit(int(local_29))))
            {
                local_8.Add(local_28.GetKey());
            }
        }
        auto local_36 = local_8.Iterator();
        for (; local_36.CanProceed;)
        {
            int& local_44 = int(local_36.Proceed());
        }
        int local_45 = 0;
        for (; local_45 < 4; ++local_45)
        {
            if (local_3.GetBit(local_45) && !(this.GetDecoractors().Contains(local_45)))
            {
                int local_48 = int(this.GetSpotUsage());
                EPresentationSpotDecoractor local_29_2 = local_45;
                this.GetModify_Decoractors().Add(local_29_2, ::PresentationSpotDisplayUtils::CreateDecoractor(this.GetSpot()));
            }
        }
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    EPresentationSpotUsage GetSpotUsage() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SpotUsage;
    }
    void SetSpotUsage(const EPresentationSpotUsage __Value) property
    {
        if (int(this.m_SpotUsage) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpotUsage = __Value;
        return;
    }
    FSoftBrush GetSpotIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_SpotIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSpotIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SpotIcon = __Value;
        return;
    }
    const TMap<EPresentationSpotDecoractor, FEUIModelContainer> GetDecoractors() const property
    {
        const TMap<EPresentationSpotDecoractor, FEUIModelContainer> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<EPresentationSpotDecoractor, FEUIModelContainer> GetModify_Decoractors() property
    {
        TMap<EPresentationSpotDecoractor, FEUIModelContainer> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDecoractors(const TMap<EPresentationSpotDecoractor, FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Decoractors = __Value;
        return;
    }
    const FSpotViewAdapter GetSpotViewAdapter() const property
    {
        const FSpotViewAdapter __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSpotViewAdapter GetModify_SpotViewAdapter() property
    {
        FSpotViewAdapter __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetSpotViewAdapter(const FSpotViewAdapter &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        return;
    }
}

struct __GeneratedProperties_FVM_SpotInfo
{
    UPROPERTY()
    FText SpotName;
    UPROPERTY()
    FText SpotDescription;
    UPROPERTY()
    FMargin SpotIconPadding;
    UPROPERTY()
    bool HasGuideDecoractor;
    UPROPERTY()
    FEUIModelContainer GuideDecoractorModel;
    UPROPERTY()
    bool HasMarkDecoractor;
    UPROPERTY()
    FEUIModelContainer MarkDecoractorModel;
    UPROPERTY()
    bool HasMissionDecoractor;
    UPROPERTY()
    FEUIModelContainer MissionDecoractorModel;
    UPROPERTY()
    bool HasBossLowHPDecoractor;
    UPROPERTY()
    FEUIModelContainer BossLowHPDecoractorModel;
    UPROPERTY()
    bool ShouldShowLargeMissionIcon;
    UPROPERTY()
    bool ShouldShowSmallMissionIcon;
    UPROPERTY()
    TEUIModelRef<FVM_SpotInfo> Self;


}

namespace FVM_SpotInfo
{
FVM_SpotInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    return FVM_SpotInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_SpotInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    FVM_SpotInfo __r;
    TEUIModelRef<FVM_SpotInfo> local_6 = TEUIModelRef<FVM_SpotInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SpotInfo::ModelId, 0, Spot, SpotUsage));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_SpotInfo;
}
void __OnSpotPresentationDataModified(FVM_SpotInfo &inout Model, const FMsg_SpotPresentationDataModified &inout Message)
{
    Model.OnSpotPresentationDataModified(Message);
    return;
}
FSoftBrush __UIGetter_SpotIcon(const FVM_SpotInfo &inout Model)
{
    return Model.GetSpotIcon();
}
FText __UIGetter_SpotName(const FVM_SpotInfo &inout Model)
{
    return Model.GetSpotName();
}
FText __UIGetter_SpotDescription(const FVM_SpotInfo &inout Model)
{
    return Model.GetSpotDescription();
}
FMargin __UIGetter_SpotIconPadding(const FVM_SpotInfo &inout Model)
{
    return Model.GetSpotIconPadding();
}
bool __UIGetter_HasGuideDecoractor(const FVM_SpotInfo &inout Model)
{
    return Model.HasGuideDecoractor();
}
FEUIModelContainer __UIGetter_GuideDecoractorModel(const FVM_SpotInfo &inout Model)
{
    return Model.GetGuideDecoractorModel();
}
bool __UIGetter_HasMarkDecoractor(const FVM_SpotInfo &inout Model)
{
    return Model.HasMarkDecoractor();
}
FEUIModelContainer __UIGetter_MarkDecoractorModel(const FVM_SpotInfo &inout Model)
{
    return Model.GetMarkDecoractorModel();
}
bool __UIGetter_HasMissionDecoractor(const FVM_SpotInfo &inout Model)
{
    return Model.HasMissionDecoractor();
}
FEUIModelContainer __UIGetter_MissionDecoractorModel(const FVM_SpotInfo &inout Model)
{
    return Model.GetMissionDecoractorModel();
}
bool __UIGetter_HasBossLowHPDecoractor(const FVM_SpotInfo &inout Model)
{
    return Model.HasBossLowHPDecoractor();
}
FEUIModelContainer __UIGetter_BossLowHPDecoractorModel(const FVM_SpotInfo &inout Model)
{
    return Model.GetBossLowHPDecoractorModel();
}
bool __UIGetter_ShouldShowLargeMissionIcon(const FVM_SpotInfo &inout Model)
{
    return Model.ShouldShowLargeMissionIcon();
}
bool __UIGetter_ShouldShowSmallMissionIcon(const FVM_SpotInfo &inout Model)
{
    return Model.ShouldShowSmallMissionIcon();
}
TEUIModelRef<FVM_SpotInfo> __UIGetter_Self(const FVM_SpotInfo &inout Model)
{
    return TEUIModelRef<FVM_SpotInfo>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_SpotUsage()
{
    return 1;
}
int __IndexOf_SpotIcon()
{
    return 2;
}
int __IndexOf_Decoractors()
{
    return 3;
}
int __IndexOf_SpotViewAdapter()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_SpotInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
