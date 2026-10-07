
namespace FVM_HeadsUpDisplayItem_Basic
{
    const int ModelId = 0;

}
struct FVM_HeadsUpDisplayItem_Basic : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_SpotInfo> m_SpotInfo;
    UPROPERTY()
    ESlateVisibility m_IsLevelVisible;
    UPROPERTY()
    FText m_PVXLevelText;

    FVM_HeadsUpDisplayItem_Basic()
    {
        this.m_IsLevelVisible = ESlateVisibility(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_HeadsUpDisplayItem_Basic' by default constructor.");
        return;
    }
    FVM_HeadsUpDisplayItem_Basic(const FVM_HeadsUpDisplayItem_Basic &inout Other)
    {
        this.m_IsLevelVisible = ESlateVisibility(1);
        this.m_Spot = Other.m_Spot;
        this.m_SpotInfo = Other.m_SpotInfo;
        this.m_IsLevelVisible = Other.m_IsLevelVisible;
        this.m_PVXLevelText = Other.m_PVXLevelText;
        return;
    }
    FVM_HeadsUpDisplayItem_Basic(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        this.m_IsLevelVisible = ESlateVisibility(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_HeadsUpDisplayItem_Basic& opAssign(const FVM_HeadsUpDisplayItem_Basic &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_SpotInfo = Other.m_SpotInfo;
        this.m_IsLevelVisible = Other.m_IsLevelVisible;
        return Other.m_PVXLevelText;
    }
    void PostConstruct()
    {
        this.SetSpotInfo(TEUIModelRef<FVM_SpotInfo>(::FVM_SpotInfo::Create(this.GetContext().Manager, this.GetSpot(), EPresentationSpotUsage(3))));
        this.RefreshPVXLevel();
        return;
    }
    bool IsTeamMember() const
    {
        TEUIModelRef<FM_Player> local_4 = ::GetPlayer(this.GetSpot().opArrow());
        if (local_4)
        {
            return ::FMS_LocalPlayerTeamData::Get(this.GetManager()).IsAnyTeamMember(local_4);
        }
        return false;
    }
    bool IsCaptain() const
    {
        TEUIModelRef<FM_Player> local_4 = ::GetPlayer(this.GetSpot().opArrow());
        if (local_4)
        {
            TEUIModelRef<FM_TeamMember> local_12 = ::FMS_LocalPlayerTeamData::Get(this.GetManager()).GetTeamMemberInAnyTeam(local_4);
            if (local_12)
            {
                return local_12.opArrow().IsCaptain();
            }
        }
        return false;
    }
    TEUIModelRef<FVM_TeammateInfo> GetTeammateInfo() const
    {
        TEUIModelRef<FM_Player> local_4 = ::GetPlayer(this.GetSpot().opArrow());
        if (local_4)
        {
            TEUIModelRef<FM_TeamMember> local_12 = ::FMS_LocalPlayerTeamData::Get(this.GetManager()).GetTeamMemberInAnyTeam(local_4);
            if (local_12)
            {
                return TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(this.GetManager(), local_12));
            }
        }
        return TEUIModelRef<FVM_TeammateInfo>();
    }
    TEUIModelRef<FVM_Index> GetTeamMemberIndex() const
    {
        TEUIModelRef<FM_Player> local_4 = ::GetPlayer(this.GetSpot().opArrow());
        if (local_4)
        {
            TEUIModelRef<FM_TeamMember> local_12 = ::FMS_LocalPlayerTeamData::Get(this.GetManager()).GetTeamMemberInAnyTeam(local_4);
            if (local_12)
            {
                return TEUIModelRef<FVM_Index>(::FVM_Index::Create(this.GetManager(), local_12.opArrow().GetMemberIndex()));
            }
        }
        return TEUIModelRef<FVM_Index>();
    }
    FText GetDisplayName() const
    {
        TEUIModelRef<FM_Player> local_4 = ::GetPlayer(this.GetSpot().opArrow());
        if (local_4)
        {
            return FText::FromString(local_4.opArrow().GetNickName());
        }
        FSpotViewAdapter local_24;
        return ::GetSpotName(this.GetSpot().opArrow(), local_24);
    }
    int GetRelationIndex() const
    {
        FSpotViewAdapter local_10;
        TEUIModelRef<FM_Spot> local_2 = this.GetSpot();
        TDataObjectPtr<FHeadsUpDisplayConfig> local_34 = ::GetHeadsUpDisplayConfig(local_2.opArrow(), local_10);
        if (local_34)
        {
            return int(local_34.opArrow().RelationType);
        }
        return 0;
    }
    FText GetLevel() const
    {
        return this.GetPVXLevelText();
    }
    void HandlePVXProgressChanged(const FCS_PVX_ProgressData &inout ProgressData)
    {
        this.RefreshPVXLevel();
        return;
    }
    void RefreshPVXLevel()
    {
        int local_9;
        int local_34 = 0;
        GetDefaulted local_4;
        if (int(local_4.opCall().GetGameModeType()) == 1)
        {
            int local_10;
            local_10 = 4;
            local_9 = local_10;
        }
        else
        {
            int local_10;
            local_10 = 1;
            local_9 = local_10;
        }
        this.SetIsLevelVisible(ESlateVisibility(local_9));
        FText local_44;
        if (::GetPlayer(this.GetSpot().opArrow()))
        {
            FECSEntity local_20 = FECSEntity(::GetOwnerEntityId(this.GetSpot().opArrow()));
            if (local_20)
            {
                if (local_34.Contains(local_20))
                {
                    FNumberFormattingOptions local_40;
                    local_44 = FText::AsNumber(local_34[local_20].GetLevel(), local_40);
                    this.SetPVXLevelText(FText::Format(INVTEXT("Lv.{0} "), local_44));
                    return;
                }
            }
        }
        this.SetPVXLevelText(local_44);
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
    ESlateVisibility GetIsLevelVisible() const property
    {
        this.TrackPropertyRead(2);
        return this.m_IsLevelVisible;
    }
    void SetIsLevelVisible(const ESlateVisibility __Value) property
    {
        if (int(this.m_IsLevelVisible) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_IsLevelVisible = __Value;
        return;
    }
    const FText GetPVXLevelText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_PVXLevelText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPVXLevelText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PVXLevelText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_HeadsUpDisplayItem_Basic
{
    UPROPERTY()
    bool IsTeamMember;
    UPROPERTY()
    bool IsCaptain;
    UPROPERTY()
    TEUIModelRef<FVM_TeammateInfo> TeammateInfo;
    UPROPERTY()
    TEUIModelRef<FVM_Index> TeamMemberIndex;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    int RelationIndex;
    UPROPERTY()
    FText Level;
    UPROPERTY()
    TEUIModelRef<FVM_HeadsUpDisplayItem_Basic> Self;


}

namespace FVM_HeadsUpDisplayItem_Basic
{
FVM_HeadsUpDisplayItem_Basic& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_HeadsUpDisplayItem_Basic::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_HeadsUpDisplayItem_Basic CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_HeadsUpDisplayItem_Basic __r;
    TEUIModelRef<FVM_HeadsUpDisplayItem_Basic> local_6 = TEUIModelRef<FVM_HeadsUpDisplayItem_Basic>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_HeadsUpDisplayItem_Basic::ModelId, 0, Spot));
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
    local_14.PropertyName = "IsLevelVisible";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTeamMember";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCaptain";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeammateInfo";
    local_14.TypeName = "TEUIModelRef<FVM_TeammateInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamMemberIndex";
    local_14.TypeName = "TEUIModelRef<FVM_Index>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RelationIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Level";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HeadsUpDisplayItem_Basic>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HeadsUpDisplayItem_Basic;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__HandlePVXProgressChanged";
    local_26.ComponentType = FCS_PVX_ProgressData;
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HeadsUpDisplayItem_Basic;
}
void __HandlePVXProgressChanged(FVM_HeadsUpDisplayItem_Basic &inout Model, const FECSEntity &inout Entity, const FCS_PVX_ProgressData &inout Component)
{
    Get local_4;
    Model.HandlePVXProgressChanged(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TEUIModelRef<FVM_SpotInfo> __UIGetter_SpotInfo(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return Model.GetSpotInfo();
}
ESlateVisibility __UIGetter_IsLevelVisible(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return Model.GetIsLevelVisible();
}
bool __UIGetter_IsTeamMember(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return Model.IsTeamMember();
}
bool __UIGetter_IsCaptain(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return Model.IsCaptain();
}
TEUIModelRef<FVM_TeammateInfo> __UIGetter_TeammateInfo(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return Model.GetTeammateInfo();
}
TEUIModelRef<FVM_Index> __UIGetter_TeamMemberIndex(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return Model.GetTeamMemberIndex();
}
FText __UIGetter_DisplayName(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return Model.GetDisplayName();
}
int __UIGetter_RelationIndex(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return Model.GetRelationIndex();
}
FText __UIGetter_Level(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return Model.GetLevel();
}
TEUIModelRef<FVM_HeadsUpDisplayItem_Basic> __UIGetter_Self(const FVM_HeadsUpDisplayItem_Basic &inout Model)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Basic>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_SpotInfo()
{
    return 1;
}
int __IndexOf_IsLevelVisible()
{
    return 2;
}
int __IndexOf_PVXLevelText()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_HeadsUpDisplayItem_Basic
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
