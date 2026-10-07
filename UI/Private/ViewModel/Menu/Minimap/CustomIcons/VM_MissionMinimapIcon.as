
namespace FVM_MissionMinimapIcon
{
    const int ModelId = 0;

}
struct FVM_MissionMinimapIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    FText m_CategoryText;
    UPROPERTY()
    FText m_ToolTipTitle;
    UPROPERTY()
    FText m_ToolTipDesc;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardInfo;

    FVM_MissionMinimapIcon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MissionMinimapIcon' by default constructor.");
        return;
    }
    FVM_MissionMinimapIcon(const FVM_MissionMinimapIcon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_CategoryText = Other.m_CategoryText;
        this.m_ToolTipTitle = Other.m_ToolTipTitle;
        this.m_ToolTipDesc = Other.m_ToolTipDesc;
        this.m_RewardInfo = Other.m_RewardInfo;
        return;
    }
    FVM_MissionMinimapIcon(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_MissionMinimapIcon& opAssign(const FVM_MissionMinimapIcon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_CategoryText = Other.m_CategoryText;
        this.m_ToolTipTitle = Other.m_ToolTipTitle;
        this.m_ToolTipDesc = Other.m_ToolTipDesc;
        return Other.m_RewardInfo;
    }
    void PostConstruct()
    {
        FSpotViewAdapter local_10;
        int local_110 = 0;
        const UMissionSettings local_114;
        ::GetMissionData(this.GetSpot().opArrow(), local_10);
        if (local_110)
        {
            GetGameplaySettings<UMissionSettings> local_116;
            local_114 = local_116;
            if (local_114.MissionCategoryTextMap.Contains(local_110.opArrow().MissionType))
            {
                this.SetCategoryText(local_114.MissionCategoryTextMap[local_110.opArrow().MissionType]);
            }
            this.SetToolTipTitle(local_110.opArrow().MissionTitle);
            this.SetToolTipDesc(local_110.opArrow().MissionDescription);
            TDataObjectPtr<FRewardConfig> local_142 = local_110.opArrow().GetMissionRewardConfig();
            if (local_142)
            {
                this.SetRewardInfo(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromRewardConfig(local_142))));
            }
        }
        return;
    }
    bool HasAnyReward() const
    {
        bool local_7;
        if (this.GetRewardInfo())
        {
            TEUIModelRef<FVM_CommonRewardList> local_2 = this.GetRewardInfo();
            local_7 = (GetRewards().Num() > 0);
        }
        else
        {
            local_7 = false;
        }
        return local_7;
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
    const FText GetCategoryText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_CategoryText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCategoryText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CategoryText = __Value;
        return;
    }
    const FText GetToolTipTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_ToolTipTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetToolTipTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ToolTipTitle = __Value;
        return;
    }
    const FText GetToolTipDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_ToolTipDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetToolTipDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ToolTipDesc = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetRewardInfo() const property
    {
        this.TrackPropertyRead(4);
        return this.m_RewardInfo;
    }
    void SetRewardInfo(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_RewardInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RewardInfo = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MissionMinimapIcon
{
    UPROPERTY()
    bool HasAnyReward;
    UPROPERTY()
    TEUIModelRef<FVM_MissionMinimapIcon> Self;


}

namespace FVM_MissionMinimapIcon
{
FVM_MissionMinimapIcon& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_MissionMinimapIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_MissionMinimapIcon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_MissionMinimapIcon __r;
    TEUIModelRef<FVM_MissionMinimapIcon> local_6 = TEUIModelRef<FVM_MissionMinimapIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MissionMinimapIcon::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CategoryText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToolTipTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToolTipDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardInfo";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAnyReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MissionMinimapIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MissionMinimapIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MissionMinimapIcon;
}
FText __UIGetter_CategoryText(const FVM_MissionMinimapIcon &inout Model)
{
    return Model.GetCategoryText();
}
FText __UIGetter_ToolTipTitle(const FVM_MissionMinimapIcon &inout Model)
{
    return Model.GetToolTipTitle();
}
FText __UIGetter_ToolTipDesc(const FVM_MissionMinimapIcon &inout Model)
{
    return Model.GetToolTipDesc();
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_RewardInfo(const FVM_MissionMinimapIcon &inout Model)
{
    return Model.GetRewardInfo();
}
bool __UIGetter_HasAnyReward(const FVM_MissionMinimapIcon &inout Model)
{
    return Model.HasAnyReward();
}
TEUIModelRef<FVM_MissionMinimapIcon> __UIGetter_Self(const FVM_MissionMinimapIcon &inout Model)
{
    return TEUIModelRef<FVM_MissionMinimapIcon>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_CategoryText()
{
    return 1;
}
int __IndexOf_ToolTipTitle()
{
    return 2;
}
int __IndexOf_ToolTipDesc()
{
    return 3;
}
int __IndexOf_RewardInfo()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_MissionMinimapIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
