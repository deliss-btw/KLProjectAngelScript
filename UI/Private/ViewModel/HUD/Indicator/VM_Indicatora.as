
namespace FVM_Indicator
{
    const int ModelId = 0;

}
struct FVM_Indicator : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_IndicatorSpot;
    UPROPERTY()
    TEUIModelRef<FVM_SpotInfo> m_SpotInfo;
    UPROPERTY()
    TEUIModelRef<FVM_PresentationDisplayRule> m_DistanceTextDisplayRule;

    FVM_Indicator()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Indicator' by default constructor.");
        return;
    }
    FVM_Indicator(const FVM_Indicator &inout Other)
    {
        this.m_IndicatorSpot = Other.m_IndicatorSpot;
        this.m_SpotInfo = Other.m_SpotInfo;
        this.m_DistanceTextDisplayRule = Other.m_DistanceTextDisplayRule;
        return;
    }
    FVM_Indicator(const TEUIModelRef<FM_Spot> &inout InIndicatorSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndicatorSpot(InIndicatorSpot);
        return;
    }
    FVM_Indicator& opAssign(const FVM_Indicator &inout Other)
    {
        this.m_IndicatorSpot = Other.m_IndicatorSpot;
        this.m_SpotInfo = Other.m_SpotInfo;
        return Other.m_DistanceTextDisplayRule;
    }
    void PostConstruct()
    {
        this.SetSpotInfo(TEUIModelRef<FVM_SpotInfo>(::FVM_SpotInfo::Create(this.GetContext().Manager, this.GetIndicatorSpot(), EPresentationSpotUsage(1))));
        this.SetDistanceTextDisplayRule(TEUIModelRef<FVM_PresentationDisplayRule>(::FVM_PresentationDisplayRule::Create(this.GetContext().Manager, this.GetIndicatorSpot(), EPresentationDisplayRuleIndex(3))));
        return;
    }
    FVector GetIndicatorLocation() const
    {
        return ::PresentationSpotUtils::GetSpotLocation(this.GetIndicatorSpot());
    }
    FLinearColor GetIndicatorArrowColor() const
    {
        FSpotViewAdapter local_10;
        TDataObjectPtr<FIndicatorConfig> local_34 = ::GetIndicatorConfig(this.GetIndicatorSpot().opArrow(), local_10);
        if (local_34)
        {
            return local_34.opArrow().ArrowColor;
        }
        return FLinearColor::White;
    }
    float GetDistance() const
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        Get local_8;
        if (local_8.opCall())
        {
            if (this.GetIndicatorSpot().opArrow().GetTransform().Has3DPosition())
            {
                return ::PresentationSpotUtils::GetDistanceToPlayer(this.GetIndicatorSpot());
            }
        }
        return -1.0;
    }
    FText GetDistanceText() const
    {
        float local_2 = this.GetDistance();
        if (local_2 <= 0.0)
        {
            return FText();
        }
        FDistanceFormattingOptions local_12;
        return ::CommonPropertyConversions::DistanceToText(local_2, local_12);
    }
    bool ShouldShowDistance() const
    {
        return this.GetDistanceTextDisplayRule() && this.GetDistanceTextDisplayRule().opArrow().GetbMatchesDisplayRule();
    }
    bool IsTeammateIndicator() const
    {
        TEUIModelRef<FM_Player> local_4 = ::GetPlayer(this.GetIndicatorSpot().opArrow());
        if (local_4)
        {
            return ::FTeamUtils::IsInSameTeam(local_4.opArrow().GetPlayerEntity(), this.GetContext().GetLocalPlayer());
        }
        return false;
    }
    TEUIModelRef<FVM_TeammateInfo> GetTeammateInfo() const
    {
        if (!(this.IsTeammateIndicator()))
        {
            return TEUIModelRef<FVM_TeammateInfo>();
        }
        TEUIModelRef<FM_TeamMember> local_12 = ::FMS_LocalPlayerTeamData::Get(this.GetContext().Manager).GetTeamMemberInAnyTeam(::GetPlayer(this.GetIndicatorSpot().opArrow()));
        if (local_12.IsValid())
        {
            return TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(this.GetContext().Manager, local_12));
        }
        return TEUIModelRef<FVM_TeammateInfo>();
    }
    TEUIModelRef<FVM_Index> GetTeammateIndex() const
    {
        TEUIModelRef<FVM_TeammateInfo> local_2 = this.GetTeammateInfo();
        if (local_2)
        {
            return local_2.opArrow().GetIndex();
        }
        return TEUIModelRef<FVM_Index>();
    }
    FSoftBrush GetIndicatorIcon() const
    {
        FSpotViewAdapter local_10;
        TDataObjectPtr<FIndicatorConfig> local_34 = ::GetIndicatorConfig(this.GetIndicatorSpot().opArrow(), local_10);
        if (local_34)
        {
            FSpotViewAdapter local_70;
            return local_34.opArrow().Icon.GetIconBrush(::GetPresentationConfig(this.GetIndicatorSpot().opArrow(), local_70));
        }
        return FSoftBrush();
    }
    TEUIModelRef<FM_Spot> GetIndicatorSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_IndicatorSpot;
    }
    void SetIndicatorSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_IndicatorSpot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_IndicatorSpot = __Value;
        return;
    }
    TEUIModelRef<FVM_SpotInfo> GetSpotInfo() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SpotInfo;
    }
    void SetSpotInfo(const TEUIModelRef<FVM_SpotInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_SpotInfo> local_2;
        local_2 = this.m_SpotInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpotInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_PresentationDisplayRule> GetDistanceTextDisplayRule() const property
    {
        this.TrackPropertyRead(2);
        return this.m_DistanceTextDisplayRule;
    }
    void SetDistanceTextDisplayRule(const TEUIModelRef<FVM_PresentationDisplayRule> &inout __Value) property
    {
        TEUIModelRef<FVM_PresentationDisplayRule> local_2;
        local_2 = this.m_DistanceTextDisplayRule;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DistanceTextDisplayRule = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Indicator
{
    UPROPERTY()
    FLinearColor IndicatorArrowColor;
    UPROPERTY()
    float Distance;
    UPROPERTY()
    FText DistanceText;
    UPROPERTY()
    bool ShouldShowDistance;
    UPROPERTY()
    bool IsTeammateIndicator;
    UPROPERTY()
    TEUIModelRef<FVM_TeammateInfo> TeammateInfo;
    UPROPERTY()
    TEUIModelRef<FVM_Index> TeammateIndex;
    UPROPERTY()
    FSoftBrush IndicatorIcon;
    UPROPERTY()
    TEUIModelRef<FVM_Indicator> Self;


}

namespace FVM_Indicator
{
FVM_Indicator& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout IndicatorSpot)
{
    return FVM_Indicator::CreateByManager(EUIInternal::GetContextManager(ContextObject), IndicatorSpot);
}
FVM_Indicator CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout IndicatorSpot)
{
    FVM_Indicator __r;
    TEUIModelRef<FVM_Indicator> local_6 = TEUIModelRef<FVM_Indicator>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Indicator::ModelId, 0, IndicatorSpot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SpotInfo";
    local_14.TypeName = "TEUIModelRef<FVM_SpotInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IndicatorArrowColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Distance";
    local_14.TypeName = "double";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DistanceText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowDistance";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTeammateIndicator";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeammateInfo";
    local_14.TypeName = "TEUIModelRef<FVM_TeammateInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeammateIndex";
    local_14.TypeName = "TEUIModelRef<FVM_Index>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IndicatorIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Indicator>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Indicator;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Indicator;
}
TEUIModelRef<FVM_SpotInfo> __UIGetter_SpotInfo(const FVM_Indicator &inout Model)
{
    return Model.GetSpotInfo();
}
FLinearColor __UIGetter_IndicatorArrowColor(const FVM_Indicator &inout Model)
{
    return Model.GetIndicatorArrowColor();
}
float __UIGetter_Distance(const FVM_Indicator &inout Model)
{
    return Model.GetDistance();
}
FText __UIGetter_DistanceText(const FVM_Indicator &inout Model)
{
    return Model.GetDistanceText();
}
bool __UIGetter_ShouldShowDistance(const FVM_Indicator &inout Model)
{
    return Model.ShouldShowDistance();
}
bool __UIGetter_IsTeammateIndicator(const FVM_Indicator &inout Model)
{
    return Model.IsTeammateIndicator();
}
TEUIModelRef<FVM_TeammateInfo> __UIGetter_TeammateInfo(const FVM_Indicator &inout Model)
{
    return Model.GetTeammateInfo();
}
TEUIModelRef<FVM_Index> __UIGetter_TeammateIndex(const FVM_Indicator &inout Model)
{
    return Model.GetTeammateIndex();
}
FSoftBrush __UIGetter_IndicatorIcon(const FVM_Indicator &inout Model)
{
    return Model.GetIndicatorIcon();
}
TEUIModelRef<FVM_Indicator> __UIGetter_Self(const FVM_Indicator &inout Model)
{
    return TEUIModelRef<FVM_Indicator>(Model);
}
int __IndexOf_IndicatorSpot()
{
    return 0;
}
int __IndexOf_SpotInfo()
{
    return 1;
}
int __IndexOf_DistanceTextDisplayRule()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_Indicator
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
