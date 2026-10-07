
namespace FVM_MissionDetailInfo
{
    const int ModelId = 0;

}
struct FVM_MissionDetailInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> m_MissionConfig;
    UPROPERTY()
    TDataObjectPtr<FMissionPhaseConfig> m_CurrentPhaseConfig;
    UPROPERTY()
    FText m_CategoryText;
    UPROPERTY()
    FText m_RecommendLevelWarningText;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ObjectiveInfo>> m_ObjectiveInfos;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardInfo;
    UPROPERTY()
    FSoftBrush m_MissionIcon;

    FVM_MissionDetailInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MissionDetailInfo(const FVM_MissionDetailInfo &inout Other)
    {
        this.m_MissionConfig = Other.m_MissionConfig;
        this.m_CurrentPhaseConfig = Other.m_CurrentPhaseConfig;
        this.m_CategoryText = Other.m_CategoryText;
        this.m_RecommendLevelWarningText = Other.m_RecommendLevelWarningText;
        this.m_ObjectiveInfos = Other.m_ObjectiveInfos;
        this.m_RewardInfo = Other.m_RewardInfo;
        this.m_MissionIcon = Other.m_MissionIcon;
        return;
    }
    FVM_MissionDetailInfo& opAssign(const FVM_MissionDetailInfo &inout Other)
    {
        this.m_MissionConfig = Other.m_MissionConfig;
        this.m_CurrentPhaseConfig = Other.m_CurrentPhaseConfig;
        this.m_CategoryText = Other.m_CategoryText;
        this.m_RecommendLevelWarningText = Other.m_RecommendLevelWarningText;
        this.m_ObjectiveInfos = Other.m_ObjectiveInfos;
        this.m_RewardInfo = Other.m_RewardInfo;
        return Other.m_MissionIcon;
    }
    FText GetMissionTitle() const
    {
        if (this.GetMissionConfig())
        {
            return this.GetMissionConfig().opArrow().MissionTitle;
        }
        return FText();
    }
    FText GetMissionDescription() const
    {
        if (this.GetMissionConfig())
        {
            return this.GetMissionConfig().opArrow().MissionDescription;
        }
        return FText();
    }
    FText GetCurrentPhaseTitle() const
    {
        if (this.GetCurrentPhaseConfig())
        {
            return this.GetCurrentPhaseConfig().opArrow().MissionPhaseTitle;
        }
        return FText();
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetMissionRewardItems() const
    {
        if (this.GetRewardInfo())
        {
            TEUIModelRef<FVM_CommonRewardList> local_2 = this.GetRewardInfo();
            return GetRewards();
        }
        return TArray<TEUIModelRef<FVM_CommonRewardItem>>();
    }
    bool ShowRecommendLevelWarning() const
    {
        int local_5;
        if (!(this.GetMissionConfig()) || ((this.GetMissionConfig().opArrow().RecommendPlayerLevel <= 0)))
        {
            return false;
        }
        local_5 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
        return (local_5 < this.GetMissionConfig().opArrow().RecommendPlayerLevel);
    }
    TDataObjectPtr<FMissionConfig> GetCurrentMissionConfig() const
    {
        return this.GetMissionConfig();
    }
    void AssignMissionConfig(const TDataObjectPtr<FMissionConfig> &inout InMissionConfig, const FText &inout RecommendLevelWarningFormat)
    {
        bool local_4;
        const UMissionSettings local_10;
        int local_189 = 0;
        FMissionObjectiveInfo local_218;
        int local_272 = 0;
        this.SetMissionConfig(InMissionConfig);
        if (this.GetMissionConfig() && (this.GetMissionConfig().opArrow().RecommendPlayerLevel > 0))
        {
            this.SetRecommendLevelWarningText(FText::Format(RecommendLevelWarningFormat, this.GetMissionConfig().opArrow().RecommendPlayerLevel));
        }
        else
        {
            this.SetRecommendLevelWarningText(FText());
        }
        CastTo local_276;
        if (this.GetMissionConfig())
        {
            GetGameplaySettings<UMissionSettings> local_12;
            local_10 = local_12;
            if (local_10.MissionCategoryTextMap.Contains(this.GetMissionConfig().opArrow().MissionType))
            {
                this.SetCategoryText(local_10.MissionCategoryTextMap[this.GetMissionConfig().opArrow().MissionType]);
            }
            else
            {
                this.SetCategoryText(FText());
            }
            TDataObjectPtr<FRewardConfig> local_38 = this.GetMissionConfig().opArrow().GetMissionRewardConfig();
            if (local_38)
            {
                this.SetRewardInfo(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromRewardConfig(local_38))));
            }
            else
            {
                this.SetRewardInfo(TEUIModelRef<FVM_CommonRewardList>(nullptr));
            }
            FText local_76;
            if (this.GetMissionConfig().opArrow().RecommendPlayerLevel == 0)
            {
                local_76 = FText();
            }
            else
            {
                local_76 = FText::Format(RecommendLevelWarningFormat, this.GetMissionConfig().opArrow().RecommendPlayerLevel);
            }
            this.SetRecommendLevelWarningText(local_76);
            FMissionDetail local_188;
            if (::MissionUtils::TryFindMissionDetail(this.GetContext().GetLocalPlayer(), local_189, local_188, false))
            {
                this.SetCurrentPhaseConfig(local_188.GetActivePhaseConfig());
                this.GetModify_ObjectiveInfos().Empty(0);
                for (auto& local_212 : local_188.GetActiveObjectiveStatusMap())
                {
                    local_212;
                    TDataObjectPtr<FObjectiveConfig> local_242 = ::ObjectiveUtils::FindObjectiveConfig(local_218.GetObjectiveId());
                    local_4 = !(local_242);
                    if (local_4)
                    {
                        XError(ELog(16), FString().Append("Failed to find objective config for objective instance: ").Append(local_218.GetObjectiveId()));
                        continue;
                    }
                    int local_2 = local_272;
                    if (local_2 == 1)
                    {
                        continue;
                    }
                    if (local_276.opCall() && local_4)
                    {
                        continue;
                    }
                    TDataObjectPtr<FCommissionConfig> local_348;
                    FVM_ObjectiveInfo& local_350 = ::FVM_ObjectiveInfo::Create(this.GetContext().Manager, local_218.GetInstanceId(), local_242);
                    int local_1 = local_218.GetFailProgressValue();
                    local_2 = local_218.GetFinishProgressValue();
                    local_350.UpdateProgress(local_2, local_1);
                    if (::ObjectiveUtils::IsCommissionObjective(local_242, local_348))
                    {
                        int local_352 = 0;
                        local_350.UpdateTitle(local_2, local_352);
                    }
                    else
                    {
                        local_350.UpdateTitle(0, 0);
                    }
                    this.GetModify_ObjectiveInfos().Add(TEUIModelRef<FVM_ObjectiveInfo>(local_350));
                }
            }
            return;
        }
        this.SetRecommendLevelWarningText(local_76);
        TDataObjectPtr<FMissionPhaseConfig> local_378;
        this.SetCurrentPhaseConfig(local_378);
        this.GetModify_ObjectiveInfos().Empty(0);
        this.SetRewardInfo(TEUIModelRef<FVM_CommonRewardList>(nullptr));
        return;
    }
    const TDataObjectPtr<FMissionConfig> GetMissionConfig() const property
    {
        const TDataObjectPtr<FMissionConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FMissionConfig> GetModify_MissionConfig() property
    {
        TDataObjectPtr<FMissionConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMissionConfig(const TDataObjectPtr<FMissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MissionConfig = __Value;
        return;
    }
    const TDataObjectPtr<FMissionPhaseConfig> GetCurrentPhaseConfig() const property
    {
        const TDataObjectPtr<FMissionPhaseConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FMissionPhaseConfig> GetModify_CurrentPhaseConfig() property
    {
        TDataObjectPtr<FMissionPhaseConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCurrentPhaseConfig(const TDataObjectPtr<FMissionPhaseConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentPhaseConfig = __Value;
        return;
    }
    const FText GetCategoryText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_CategoryText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCategoryText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CategoryText = __Value;
        return;
    }
    const FText GetRecommendLevelWarningText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_RecommendLevelWarningText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRecommendLevelWarningText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RecommendLevelWarningText = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ObjectiveInfo>> GetObjectiveInfos() const property
    {
        const TArray<TEUIModelRef<FVM_ObjectiveInfo>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ObjectiveInfo>> GetModify_ObjectiveInfos() property
    {
        TArray<TEUIModelRef<FVM_ObjectiveInfo>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetObjectiveInfos(const TArray<TEUIModelRef<FVM_ObjectiveInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ObjectiveInfos = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetRewardInfo() const property
    {
        this.TrackPropertyRead(5);
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
        this.MarkPropertyDirty(5);
        this.m_RewardInfo = __Value;
        return;
    }
    const FSoftBrush GetMissionIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FSoftBrush GetModify_MissionIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetMissionIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MissionIcon = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MissionDetailInfo
{
    UPROPERTY()
    FText MissionTitle;
    UPROPERTY()
    FText MissionDescription;
    UPROPERTY()
    FText CurrentPhaseTitle;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> MissionRewardItems;
    UPROPERTY()
    bool ShowRecommendLevelWarning;
    UPROPERTY()
    TEUIModelRef<FVM_MissionDetailInfo> Self;


}

namespace FVM_MissionDetailInfo
{
FVM_MissionDetailInfo& Create(const UObject ContextObject)
{
    return FVM_MissionDetailInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MissionDetailInfo CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MissionDetailInfo __r;
    TEUIModelRef<FVM_MissionDetailInfo> local_6 = TEUIModelRef<FVM_MissionDetailInfo>(EUIInternal::MakeModelWithManager(Manager, FVM_MissionDetailInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CategoryText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RecommendLevelWarningText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ObjectiveInfos";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ObjectiveInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardInfo";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MissionIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MissionTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MissionDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentPhaseTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MissionRewardItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowRecommendLevelWarning";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MissionDetailInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MissionDetailInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MissionDetailInfo;
}
FText __UIGetter_CategoryText(const FVM_MissionDetailInfo &inout Model)
{
    return Model.GetCategoryText();
}
FText __UIGetter_RecommendLevelWarningText(const FVM_MissionDetailInfo &inout Model)
{
    return Model.GetRecommendLevelWarningText();
}
TArray<TEUIModelRef<FVM_ObjectiveInfo>> __UIGetter_ObjectiveInfos(const FVM_MissionDetailInfo &inout Model)
{
    return Model.GetObjectiveInfos();
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_RewardInfo(const FVM_MissionDetailInfo &inout Model)
{
    return Model.GetRewardInfo();
}
FSoftBrush __UIGetter_MissionIcon(const FVM_MissionDetailInfo &inout Model)
{
    return Model.GetMissionIcon();
}
FText __UIGetter_MissionTitle(const FVM_MissionDetailInfo &inout Model)
{
    return Model.GetMissionTitle();
}
FText __UIGetter_MissionDescription(const FVM_MissionDetailInfo &inout Model)
{
    return Model.GetMissionDescription();
}
FText __UIGetter_CurrentPhaseTitle(const FVM_MissionDetailInfo &inout Model)
{
    return Model.GetCurrentPhaseTitle();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_MissionRewardItems(const FVM_MissionDetailInfo &inout Model)
{
    return Model.GetMissionRewardItems();
}
bool __UIGetter_ShowRecommendLevelWarning(const FVM_MissionDetailInfo &inout Model)
{
    return Model.ShowRecommendLevelWarning();
}
TEUIModelRef<FVM_MissionDetailInfo> __UIGetter_Self(const FVM_MissionDetailInfo &inout Model)
{
    return TEUIModelRef<FVM_MissionDetailInfo>(Model);
}
int __IndexOf_MissionConfig()
{
    return 0;
}
int __IndexOf_CurrentPhaseConfig()
{
    return 1;
}
int __IndexOf_CategoryText()
{
    return 2;
}
int __IndexOf_RecommendLevelWarningText()
{
    return 3;
}
int __IndexOf_ObjectiveInfos()
{
    return 4;
}
int __IndexOf_RewardInfo()
{
    return 5;
}
int __IndexOf_MissionIcon()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_MissionDetailInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
