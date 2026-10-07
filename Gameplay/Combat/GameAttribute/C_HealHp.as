
namespace __INTENRAL_FC_HealStatistic_NS
{
    const TECSComponentDerivedPtr<FC_HealStatistic> DerivedPtr = TECSComponentDerivedPtr<FC_HealStatistic>();
    const FC_HealStatistic DefaultValue = FC_HealStatistic();
}
namespace __INTENRAL_FCE_HealOtherEvent_NS
{
    const TECSEventDerivedPtr<FCE_HealOtherEvent> DerivedPtr = TECSEventDerivedPtr<FCE_HealOtherEvent>();
}
namespace __INTENRAL_FCE_HealedEvent_NS
{
    const TECSEventDerivedPtr<FCE_HealedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_HealedEvent>();

}
struct FCE_HealOtherEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity HealFromEntity;
    UPROPERTY()
    FECSEntity HealedEntity;
    UPROPERTY()
    EHealHPType HealHPType;
    UPROPERTY()
    float32 TotalHealHP;
    UPROPERTY()
    float32 RealHealHP;
    UPROPERTY()
    float32 OverHealHP;


}

struct FCE_HealedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity HealFromEntity;
    UPROPERTY()
    FECSEntity HealedEntity;
    UPROPERTY()
    EHealHPType HealHPType;
    UPROPERTY()
    float32 TotalHealHP;
    UPROPERTY()
    float32 RealHealHP;
    UPROPERTY()
    float32 OverHealHP;


}

struct FHealRecord
{
    UPROPERTY()
    FFPTime Time;
    UPROPERTY()
    float32 HealAmount;
    UPROPERTY()
    EHealHPType HealHPType;
    UPROPERTY()
    FECSEntity HealedEntity;


}

struct FC_HealStatistic : FECSComponent
{
    UPROPERTY()
    TArray<FHealRecord> HealRecords;

    FC_HealStatistic()
    {
        return;
    }
    float32 GetHealAmountInDuration(const FFPTime &inout CurrentTime, const float32 DurationSeconds) const
    {
        float32 local_1 = 0.0f;
        FFPTime local_10 = (CurrentTime - FFPTime(DurationSeconds));
        int local_14 = this.Num() - 1;
        for (; local_14 >= 0; --local_14)
        {
            if (FFPTime(this[local_14].Time).opCmp(local_10) >= 0)
            {
                local_1 = local_1 + this[local_14].HealAmount;
                continue;
            }
            break;
        }
        return local_1;
    }
    void AddRecord(const FFPTime &inout CurrentTime, const float32 HealAmount, const EHealHPType HealHPType, const FECSEntity &inout HealedEntity)
    {
        FFPTime local_8 = (CurrentTime - FFPTime(120.0));
        int local_9 = 0;
        int local_11 = 0;
        for (; local_11 < this.Num(); ++local_11)
        {
            if (FFPTime(this[local_11].Time).opCmp(local_8) < 0)
            {
                ++local_9;
                continue;
            }
            break;
        }
        if (local_9 > 0)
        {
            this.RemoveAt(0, local_9);
        }
        FHealRecord local_22;
        local_22.Time = CurrentTime;
        local_22.HealAmount = HealAmount;
        local_22.HealHPType = HealHPType;
        local_22.HealedEntity = HealedEntity;
        this.Add(local_22);
        return;
    }
}

namespace ECSFunc_FC_HealStatistic
{
UFUNCTION()
bool HasHealStatistic(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HealStatistic);
}
FC_HealStatistic& AssignHealStatistic(const FECSEntity &inout Entity, const FC_HealStatistic &inout DefaultValue = FC_HealStatistic())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HealStatistic, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHealStatistic_BP(const FECSEntity &inout Entity, const FC_HealStatistic &inout DefaultValue = FC_HealStatistic())
{
    ECSFunc_FC_HealStatistic::AssignHealStatistic(Entity, DefaultValue);
    return;
}
FC_HealStatistic& ModifyHealStatistic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HealStatistic));
    return local_12.GetComp();
}
FC_HealStatistic& ModifyOrAddHealStatistic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HealStatistic));
    return local_12.GetComp();
}
const FC_HealStatistic& GetHealStatistic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HealStatistic));
    return local_12.GetComp();
}
UFUNCTION()
FC_HealStatistic GetHealStatistic_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_HealStatistic __r;
    bValid = false;
    bValid = ECSFunc_FC_HealStatistic::GetHealStatistic(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_HealStatistic GetDefaultedHealStatistic(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HealStatistic __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HealStatistic);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_HealStatistic GetDefaultedHealStatistic_BP(const FECSEntity &inout Entity)
{
    FC_HealStatistic __r;
    return __r;
}
UFUNCTION()
bool RemoveHealStatistic(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HealStatistic);
}
}
FECSMonitorRuntimeView __GetMonitorHealStatisticOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HealStatistic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHealStatisticOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HealStatistic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHealStatisticOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HealStatistic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHealStatisticOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HealStatistic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHealStatisticOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HealStatistic, bFixedFrame, bMustHandleAll);
}
void __MonitorHealStatisticLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HealStatistic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHealStatisticActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HealStatistic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHealStatisticModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HealStatistic, bFixedFrame, Details);
    return;
}
