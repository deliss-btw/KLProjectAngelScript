
enum ETaskDataSource
{
    None,
    Commission,
}

namespace FM_Task
{
    const int ModelId = 0;

}
struct FM_Task : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    ETaskDataSource m_DataSource;
    UPROPERTY()
    TEUIModelRef<FM_Commission> m_Commission;

    FM_Task()
    {
        this.m_DataSource = ETaskDataSource(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_Task' by default constructor.");
        return;
    }
    FM_Task(const FM_Task &inout Other)
    {
        this.m_DataSource = ETaskDataSource(0);
        this.m_DataSource = Other.m_DataSource;
        this.m_Commission = Other.m_Commission;
        return;
    }
    FM_Task(const ETaskDataSource InDataSource, const TEUIModelRef<FM_Commission> &inout InCommission)
    {
        this.m_DataSource = ETaskDataSource(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDataSource(ETaskDataSource(InDataSource));
        this.SetCommission(InCommission);
        return;
    }
    FM_Task& opAssign(const FM_Task &inout Other)
    {
        this.m_DataSource = Other.m_DataSource;
        return Other.m_Commission;
    }
    FText GetGroupTitle() const
    {
        FText __return;
        int local_2 = int(this.GetDataSource());
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                __return = this.AccessCommissionConfig().opArrow().CommissionName;
            }
        }
        return FText();
    }
    FText GetGroupDesc() const
    {
        FText __return;
        int local_2 = int(this.GetDataSource());
        FText local_32;
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                local_32 = FText::AsNumber(this.AccessCommissionConfig().opArrow().CommissionStars, FNumberFormattingOptions::DefaultNoGrouping());
                __return = local_32;
            }
        }
        return local_32;
    }
    FText GetTaskTitle() const
    {
        return FText();
    }
    FText GetTaskDesc() const
    {
        FText __return;
        int local_2 = int(this.GetDataSource());
        FText local_24;
        FText local_20;
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                float local_6 = this.GetDistanceToCommissionTarget();
                if (local_6 >= 0.0)
                {
                    FNumberFormattingOptions local_15;
                    local_15.SetMaximumFractionalDigits(0);
                    local_20 = FText::AsNumber(local_6 / 100.0, local_15);
                    local_24 = FText::AsCultureInvariant("{0}m");
                    return FText::Format(local_24, local_20);
                }
                __return = local_20;
            }
        }
        return local_24;
    }
    FText GetTaskDetailShort() const
    {
        FText __return;
        int local_2 = int(this.GetDataSource());
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                __return = this.AccessCommissionConfig().opArrow().CommissionName;
            }
        }
        return FText();
    }
    FText GetTaskDetailLong() const
    {
        FText __return;
        int local_2 = int(this.GetDataSource());
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                __return = this.AccessCommissionConfig().opArrow().CommissionDetail;
            }
        }
        return FText();
    }
    int GetTaskTargetNum() const
    {
        int local_2 = int(this.GetDataSource());
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                return 1;
            }
        }
        return 0;
    }
    bool IsTaskTargetCompleted(const int TargetIndex) const
    {
        int local_2 = int(this.GetDataSource());
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                if (TargetIndex != 0)
                {
                    return false;
                }
                FECSWorldPtr local_6 = ECS::GetECSWorld();
                Get local_10;
                const FCS_CommissionFinish& local_12 = local_10.opCall();
                if (local_12)
                {
                    return local_12.GetbSuccess();
                }
                return false;
            }
        }
        return false;
    }
    FText GetTaskTargetDesc(const int TargetIndex) const
    {
        FText __return;
        int local_2 = int(this.GetDataSource());
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                if (TargetIndex == 0)
                {
                    FECSWorldPtr local_6 = ECS::GetECSWorld();
                    Get local_10;
                    const FCS_CommissionInfo& local_12 = local_10.opCall();
                    if (local_12)
                    {
                        return ::ObjectiveUtils::GetObjectiveDesc(local_12.CommissionTargetObjective, local_12.Progress.GetSuccessProgressValue(), 0);
                    }
                }
                __return = FText();
            }
        }
        return FText();
    }
    FText GetTaskTargetProgress(const int TargetIndex) const
    {
        FText __return;
        int local_2 = int(this.GetDataSource());
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                if (TargetIndex == 0)
                {
                    FECSWorldPtr local_6 = ECS::GetECSWorld();
                    Get local_10;
                    const FCS_CommissionInfo& local_12 = local_10.opCall();
                    if (local_12)
                    {
                        return ::ObjectiveUtils::GetObjectiveProgress(local_12.CommissionTargetObjective, local_12.Progress.GetSuccessProgressValue(), 0);
                    }
                }
                __return = FText();
            }
        }
        return FText();
    }
    bool IsCompleted() const
    {
        int local_2 = int(this.GetDataSource());
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                FECSWorldPtr local_6 = ECS::GetECSWorld();
                Get local_10;
                const FCS_CommissionFinish& local_12 = local_10.opCall();
                if (local_12)
                {
                    return local_12.GetbSuccess();
                }
                return false;
            }
        }
        return false;
    }
    float GetDistanceToCommissionTarget() const
    {
        FECSEntity local_4 = ::CommissionUtils::FindFirstCurrentCommissionTarget();
        if (local_4)
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            Get local_16;
            return ::FASCommonUtils::CalculateEntityDistance2D(local_4, local_16.opCall().GetPlayerPawnEntity(), true);
        }
        return -1.0;
    }
    TDataObjectPtr<FCommissionConfig> AccessCommissionConfig() const
    {
        return this.GetCommission().opArrow().GetCommissionConfig();
    }
    ETaskDataSource GetDataSource() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DataSource;
    }
    void SetDataSource(const ETaskDataSource __Value) property
    {
        if (int(this.m_DataSource) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DataSource = __Value;
        return;
    }
    TEUIModelRef<FM_Commission> GetCommission() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Commission;
    }
    void SetCommission(const TEUIModelRef<FM_Commission> &inout __Value) property
    {
        TEUIModelRef<FM_Commission> local_2;
        local_2 = this.m_Commission;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Commission = __Value;
        return;
    }
}

namespace FM_Task
{
FM_Task Create(const UObject ContextObject, const ETaskDataSource DataSource, const TEUIModelRef<FM_Commission> &inout Commission)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FM_Task __r; return __r;
}
FM_Task CreateByManager(const UEUIManagerSubsystem Manager, const ETaskDataSource DataSource, const TEUIModelRef<FM_Commission> &inout Commission)
{
    FM_Task __r;
    TEUIModelRef<FM_Task> local_6 = TEUIModelRef<FM_Task>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_Task::ModelId, 0, DataSource, Commission));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_Task;
}
int __IndexOf_DataSource()
{
    return 0;
}
int __IndexOf_Commission()
{
    return 1;
}
}
