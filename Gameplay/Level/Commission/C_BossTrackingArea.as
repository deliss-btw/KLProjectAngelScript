
namespace __INTENRAL_FCS_BossTrackingArea_NS
{
    const TECSComponentDerivedPtr<FCS_BossTrackingArea> DerivedPtr = TECSComponentDerivedPtr<FCS_BossTrackingArea>();
    const FCS_BossTrackingArea DefaultValue = FCS_BossTrackingArea();

}
struct FCS_BossTrackingArea : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bVisible;
    UPROPERTY()
    FVector2D m_WorldCenter;
    UPROPERTY()
    float32 m_Radius;

    FCS_BossTrackingArea()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_BossTrackingArea(const FCS_BossTrackingArea &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_BossTrackingArea opAssign(const FCS_BossTrackingArea &inout Other)
    {
        FCS_BossTrackingArea __r;
        this.SetbVisible(Other.GetbVisible());
        this.SetWorldCenter(Other.GetWorldCenter());
        this.SetRadius(Other.GetRadius());
        return __r;
    }
    bool GetbVisible() const property
    {
        return this.m_bVisible;
    }
    void SetbVisible(const bool __Value) property
    {
        if (!(this.m_bVisible) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bVisible = __Value;
        return;
    }
    const FVector2D GetWorldCenter() const property
    {
        const FVector2D __r;
        return __r;
    }
    FVector2D GetModify_WorldCenter() property
    {
        FVector2D __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetWorldCenter(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_WorldCenter = __Value;
        return;
    }
    float32 GetRadius() const property
    {
        return this.m_Radius;
    }
    void SetRadius(const float32 __Value) property
    {
        if (this.m_Radius == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Radius = __Value;
        return;
    }
}

namespace ECSFunc_FCS_BossTrackingArea
{
UFUNCTION()
bool HasBossTrackingArea(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_BossTrackingArea);
}
FCS_BossTrackingArea& AssignBossTrackingArea(const FECSWorldPtr &inout World, const FCS_BossTrackingArea &inout DefaultValue = FCS_BossTrackingArea())
{
    UScriptStruct local_6 = FCS_BossTrackingArea;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignBossTrackingArea_BP(const FECSWorldPtr &inout World, const FCS_BossTrackingArea &inout DefaultValue = FCS_BossTrackingArea())
{
    ECSFunc_FCS_BossTrackingArea::AssignBossTrackingArea(World, DefaultValue);
    return;
}
FCS_BossTrackingArea& ModifyBossTrackingArea(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossTrackingArea;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_BossTrackingArea& ModifyOrAddBossTrackingArea(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossTrackingArea;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_BossTrackingArea& GetBossTrackingArea(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_BossTrackingArea;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_BossTrackingArea GetBossTrackingArea_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_BossTrackingArea& local_4 = ECSFunc_FCS_BossTrackingArea::GetBossTrackingArea(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_BossTrackingArea();
}
const FCS_BossTrackingArea GetDefaultedBossTrackingArea(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_BossTrackingArea __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_BossTrackingArea);
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
FCS_BossTrackingArea GetDefaultedBossTrackingArea_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_BossTrackingArea::GetDefaultedBossTrackingArea(World);
}
UFUNCTION()
bool RemoveBossTrackingArea(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_BossTrackingArea);
}
}
void __MonitorBossTrackingAreaLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_BossTrackingArea, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossTrackingAreaActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_BossTrackingArea, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBossTrackingAreaModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_BossTrackingArea, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_BossTrackingArea &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_BossTrackingArea &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_BossTrackingArea &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_BossTrackingArea
{
int __IndexOf_bVisible()
{
    return 0;
}
int __IndexOf_WorldCenter()
{
    return 1;
}
int __IndexOf_Radius()
{
    return 2;
}
}
