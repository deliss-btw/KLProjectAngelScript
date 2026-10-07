

struct FGuideDataSourceConfig
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> m_FromMission;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> m_FromCommission;
    UPROPERTY()
    TDataObjectPtr<FObjectiveSingleConfig> m_ObjectiveConfig;
    UPROPERTY()
    int m_GuideIndex;

    FGuideDataSourceConfig()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGuideDataSourceConfig(const FGuideDataSourceConfig &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGuideDataSourceConfig(const TDataObjectPtr<FObjectiveSingleConfig> &inout InObjectiveConfig, const int InGuideIndex = 0)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGuideDataSourceConfig opAssign(const FGuideDataSourceConfig &inout Other)
    {
        FGuideDataSourceConfig __r;
        this.SetFromMission(Other.GetFromMission());
        this.SetFromCommission(Other.GetFromCommission());
        this.SetObjectiveConfig(Other.GetObjectiveConfig());
        this.SetGuideIndex(Other.GetGuideIndex());
        return __r;
    }
    bool TryGetData(FInstancedStruct &out Data) const
    {
        TArray<FInstancedStruct> local_18;
        FInstancedStruct local_4;
        Data = local_4;
        if (!(this.GetObjectiveConfig()))
        {
            XError(ELog(62), FString().Append("ObjectiveConfig is not set for data source ").Append(this.ToString()));
            return false;
        }
        if (this.GetGuideIndex() < 0 || (this.GetGuideIndex() >= local_18.Num()))
        {
            XError(ELog(62), FString().Append("GuideIndex ").Append(this.GetGuideIndex()).Append(" out of range for objective ").Append(this.GetObjectiveConfig().GetDataName()).Append(" (list size: ").Append(local_18.Num()).Append(")"));
            return false;
        }
        Data = local_18[this.GetGuideIndex()];
        return true;
    }
    FString ToString() const
    {
        if (!(this.GetObjectiveConfig()))
        {
            return FString().Append("ObjectiveConfig is not set");
        }
        return FString().Append(this.GetObjectiveConfig().GetDataName()).Append("[").Append(this.GetGuideIndex()).Append("]");
    }
    const TDataObjectPtr<FMissionConfig> GetFromMission() const property
    {
        const TDataObjectPtr<FMissionConfig> __r;
        return __r;
    }
    TDataObjectPtr<FMissionConfig> GetModify_FromMission() property
    {
        TDataObjectPtr<FMissionConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFromMission(const TDataObjectPtr<FMissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FromMission = __Value;
        return;
    }
    const TDataObjectPtr<FCommissionConfig> GetFromCommission() const property
    {
        const TDataObjectPtr<FCommissionConfig> __r;
        return __r;
    }
    TDataObjectPtr<FCommissionConfig> GetModify_FromCommission() property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetFromCommission(const TDataObjectPtr<FCommissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_FromCommission = __Value;
        return;
    }
    const TDataObjectPtr<FObjectiveSingleConfig> GetObjectiveConfig() const property
    {
        const TDataObjectPtr<FObjectiveSingleConfig> __r;
        return __r;
    }
    TDataObjectPtr<FObjectiveSingleConfig> GetModify_ObjectiveConfig() property
    {
        TDataObjectPtr<FObjectiveSingleConfig> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetObjectiveConfig(const TDataObjectPtr<FObjectiveSingleConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ObjectiveConfig = __Value;
        return;
    }
    int GetGuideIndex() const property
    {
        return this.m_GuideIndex;
    }
    void SetGuideIndex(const int __Value) property
    {
        if (this.m_GuideIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_GuideIndex = __Value;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FGuideDataSourceConfig &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FGuideDataSourceConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FGuideDataSourceConfig
{
int __IndexOf_FromMission()
{
    return 0;
}
int __IndexOf_FromCommission()
{
    return 1;
}
int __IndexOf_ObjectiveConfig()
{
    return 2;
}
int __IndexOf_GuideIndex()
{
    return 3;
}
}
