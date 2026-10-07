
namespace __INTENRAL_FCS_ExitLevelOverride_NS
{
    const TECSComponentDerivedPtr<FCS_ExitLevelOverride> DerivedPtr = TECSComponentDerivedPtr<FCS_ExitLevelOverride>();
    const FCS_ExitLevelOverride DefaultValue = FCS_ExitLevelOverride();

}
struct FCS_ExitLevelOverride : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bCanExitLevel;

    FCS_ExitLevelOverride()
    {
        this.m_bCanExitLevel = false;
        this.__InitDirtyFlags();
        return;
    }
    FCS_ExitLevelOverride(const FCS_ExitLevelOverride &inout Other)
    {
        this.m_bCanExitLevel = false;
        this.__InitDirtyFlags();
        this.m_bCanExitLevel = Other.m_bCanExitLevel;
        return;
    }
    FCS_ExitLevelOverride opAssign(const FCS_ExitLevelOverride &inout Other)
    {
        FCS_ExitLevelOverride __r;
        this.SetbCanExitLevel(Other.GetbCanExitLevel());
        return __r;
    }
    bool GetbCanExitLevel() const property
    {
        return this.m_bCanExitLevel;
    }
    void SetbCanExitLevel(const bool __Value) property
    {
        if (!(this.m_bCanExitLevel) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bCanExitLevel = __Value;
        return;
    }
}

namespace ECSFunc_FCS_ExitLevelOverride
{
UFUNCTION()
bool HasExitLevelOverride(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ExitLevelOverride);
}
FCS_ExitLevelOverride& AssignExitLevelOverride(const FECSWorldPtr &inout World, const FCS_ExitLevelOverride &inout DefaultValue = FCS_ExitLevelOverride())
{
    UScriptStruct local_6 = FCS_ExitLevelOverride;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignExitLevelOverride_BP(const FECSWorldPtr &inout World, const FCS_ExitLevelOverride &inout DefaultValue = FCS_ExitLevelOverride())
{
    ECSFunc_FCS_ExitLevelOverride::AssignExitLevelOverride(World, DefaultValue);
    return;
}
FCS_ExitLevelOverride& ModifyExitLevelOverride(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ExitLevelOverride;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ExitLevelOverride& ModifyOrAddExitLevelOverride(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ExitLevelOverride;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ExitLevelOverride& GetExitLevelOverride(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ExitLevelOverride;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ExitLevelOverride GetExitLevelOverride_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_ExitLevelOverride& local_4 = ECSFunc_FCS_ExitLevelOverride::GetExitLevelOverride(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_ExitLevelOverride();
}
const FCS_ExitLevelOverride GetDefaultedExitLevelOverride(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ExitLevelOverride __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ExitLevelOverride);
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
FCS_ExitLevelOverride GetDefaultedExitLevelOverride_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_ExitLevelOverride::GetDefaultedExitLevelOverride(World);
}
UFUNCTION()
bool RemoveExitLevelOverride(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ExitLevelOverride);
}
}
void __MonitorExitLevelOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ExitLevelOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExitLevelOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ExitLevelOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorExitLevelOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ExitLevelOverride, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_ExitLevelOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_ExitLevelOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_ExitLevelOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_ExitLevelOverride
{
int __IndexOf_bCanExitLevel()
{
    return 0;
}
}
