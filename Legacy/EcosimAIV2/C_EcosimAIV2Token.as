
namespace __INTENRAL_FCS_EcosimAIV2TokenByTarget_NS
{
    const TECSComponentDerivedPtr<FCS_EcosimAIV2TokenByTarget> DerivedPtr = TECSComponentDerivedPtr<FCS_EcosimAIV2TokenByTarget>();
    const FCS_EcosimAIV2TokenByTarget DefaultValue = FCS_EcosimAIV2TokenByTarget();

}
struct FEcosimAIV2TokenByTargetKey
{
    UPROPERTY()
    FName RowName;
    UPROPERTY()
    FECSEntity TargetEntity;

    FEcosimAIV2TokenByTargetKey()
    {
        return;
    }
    uint Hash() const
    {
        int local_1 = this.TargetEntity.GetIdValue();
        return HashCombine(this.GetHash());
    }
}

struct FAITokenByTarget
{
    UPROPERTY()
    TDataObjectPtr<FAITokenByTargetConfig> Config;
    UPROPERTY()
    float RecoverTokenElapsedTimeCount;
    UPROPERTY()
    int CurrentConsumedTokenNum;
    UPROPERTY()
    FFPTime LastConsumedTime;
    UPROPERTY()
    TArray<float> ParallelRecoverTimers;


}

struct FCS_EcosimAIV2TokenByTarget : FECSSingleton
{
    UPROPERTY()
    TMap<FEcosimAIV2TokenByTargetKey, FAITokenByTarget> DataMap;

    FCS_EcosimAIV2TokenByTarget()
    {
        return;
    }
}

namespace ECSFunc_FCS_EcosimAIV2TokenByTarget
{
UFUNCTION()
bool HasEcosimAIV2TokenByTarget(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcosimAIV2TokenByTarget);
}
FCS_EcosimAIV2TokenByTarget& AssignEcosimAIV2TokenByTarget(const FECSWorldPtr &inout World, const FCS_EcosimAIV2TokenByTarget &inout DefaultValue = FCS_EcosimAIV2TokenByTarget())
{
    UScriptStruct local_6 = FCS_EcosimAIV2TokenByTarget;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2TokenByTarget_BP(const FECSWorldPtr &inout World, const FCS_EcosimAIV2TokenByTarget &inout DefaultValue = FCS_EcosimAIV2TokenByTarget())
{
    ECSFunc_FCS_EcosimAIV2TokenByTarget::AssignEcosimAIV2TokenByTarget(World, DefaultValue);
    return;
}
FCS_EcosimAIV2TokenByTarget& ModifyEcosimAIV2TokenByTarget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2TokenByTarget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcosimAIV2TokenByTarget& ModifyOrAddEcosimAIV2TokenByTarget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2TokenByTarget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcosimAIV2TokenByTarget& GetEcosimAIV2TokenByTarget(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2TokenByTarget;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcosimAIV2TokenByTarget GetEcosimAIV2TokenByTarget_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcosimAIV2TokenByTarget __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcosimAIV2TokenByTarget::GetEcosimAIV2TokenByTarget(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcosimAIV2TokenByTarget GetDefaultedEcosimAIV2TokenByTarget(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcosimAIV2TokenByTarget __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcosimAIV2TokenByTarget);
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
FCS_EcosimAIV2TokenByTarget GetDefaultedEcosimAIV2TokenByTarget_BP(const FECSWorldPtr &inout World)
{
    FCS_EcosimAIV2TokenByTarget __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2TokenByTarget(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcosimAIV2TokenByTarget);
}
}
void __MonitorEcosimAIV2TokenByTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcosimAIV2TokenByTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TokenByTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcosimAIV2TokenByTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TokenByTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcosimAIV2TokenByTarget, bFixedFrame, Details);
    return;
}
