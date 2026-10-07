
namespace __INTENRAL_FCS_TrainingInfo_NS
{
    const TECSComponentDerivedPtr<FCS_TrainingInfo> DerivedPtr = TECSComponentDerivedPtr<FCS_TrainingInfo>();
    const FCS_TrainingInfo DefaultValue = FCS_TrainingInfo();

}
struct FCS_TrainingInfo : FECSSingleton
{
    UPROPERTY()
    TDataObjectPtr<FTrainingInfoConfig> TrainingInfo;

    FCS_TrainingInfo()
    {
        return;
    }
}

namespace ECSFunc_FCS_TrainingInfo
{
UFUNCTION()
bool HasTrainingInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TrainingInfo);
}
FCS_TrainingInfo& AssignTrainingInfo(const FECSWorldPtr &inout World, const FCS_TrainingInfo &inout DefaultValue = FCS_TrainingInfo())
{
    UScriptStruct local_6 = FCS_TrainingInfo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTrainingInfo_BP(const FECSWorldPtr &inout World, const FCS_TrainingInfo &inout DefaultValue = FCS_TrainingInfo())
{
    ECSFunc_FCS_TrainingInfo::AssignTrainingInfo(World, DefaultValue);
    return;
}
FCS_TrainingInfo& ModifyTrainingInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TrainingInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TrainingInfo& ModifyOrAddTrainingInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TrainingInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TrainingInfo& GetTrainingInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TrainingInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TrainingInfo GetTrainingInfo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_TrainingInfo __r;
    bValid = false;
    bValid = ECSFunc_FCS_TrainingInfo::GetTrainingInfo(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_TrainingInfo GetDefaultedTrainingInfo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TrainingInfo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TrainingInfo);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_TrainingInfo GetDefaultedTrainingInfo_BP(const FECSWorldPtr &inout World)
{
    FCS_TrainingInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveTrainingInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TrainingInfo);
}
}
void __MonitorTrainingInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TrainingInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrainingInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TrainingInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTrainingInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TrainingInfo, bFixedFrame, Details);
    return;
}
