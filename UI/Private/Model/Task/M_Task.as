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
        switch (int(this.GetDataSource()))
        {
        case 1:
        {
            return this.AccessCommissionConfig().opArrow().CommissionName;
        }
        }
        return FText();
    }
    FText GetGroupDesc() const
    {
        switch (int(this.GetDataSource()))
        {
        case 1:
        {
            return FText::AsNumber(this.AccessCommissionConfig().opArrow().CommissionStars, FNumberFormattingOptions::DefaultNoGrouping());
        }
        }
        return FText();
    }
    FText GetTaskTitle() const
    {
        return FText();
    }
    FText GetTaskDesc() const
    {
        ETaskDataSource local_1 = this.GetDataSource();
        FText local_24;
        FText local_20;
        switch (int(local_1))
        {
        case 1:
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
            return local_20;
        }
        }
        return local_24;
    }
    FText GetTaskDetailShort() const
    {
        switch (int(this.GetDataSource()))
        {
        case 1:
        {
            return this.AccessCommissionConfig().opArrow().CommissionName;
        }
        }
        return FText();
    }
    FText GetTaskDetailLong() const
    {
        switch (int(this.GetDataSource()))
        {
        case 1:
        {
            return this.AccessCommissionConfig().opArrow().CommissionDetail;
        }
        }
        return FText();
    }
    int GetTaskTargetNum() const
    {
        int local_2 = int(this.GetDataSource());
        switch (local_2)
        {
        case 1:
        {
            return 1;
        }
        default:
        {
            local_2 = 0;
        }
        }
        return local_2;
    }
    bool IsTaskTargetCompleted(const int TargetIndex) const
    {
        switch (int(this.GetDataSource()))
        {
        case 1:
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
        switch (int(this.GetDataSource()))
        {
        case 1:
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
            return FText();
        }
        }
        return FText();
    }
    FText GetTaskTargetProgress(const int TargetIndex) const
    {
        switch (int(this.GetDataSource()))
        {
        case 1:
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
            return FText();
        }
        }
        return FText();
    }
    bool IsCompleted() const
    {
        switch (int(this.GetDataSource()))
        {
        case 1:
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
FM_Task& Create(const UObject ContextObject, const ETaskDataSource DataSource, const TEUIModelRef<FM_Commission> &inout Commission)
{
    return FM_Task::CreateByManager(EUIInternal::GetContextManager(ContextObject), ETaskDataSource(DataSource), Commission);
}
FM_Task& CreateByManager(const UEUIManagerSubsystem Manager, const ETaskDataSource DataSource, const TEUIModelRef<FM_Commission> &inout Commission)
{
    return TEUIModelRef<FM_Task>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_Task::ModelId, 0, DataSource, Commission)).Get();
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
