
namespace __INTENRAL_FCS_LevelEventVegenfulSpirit_NS
{
    const TECSComponentDerivedPtr<FCS_LevelEventVegenfulSpirit> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelEventVegenfulSpirit>();
    const FCS_LevelEventVegenfulSpirit DefaultValue = FCS_LevelEventVegenfulSpirit();

}
struct FCS_LevelEventVegenfulSpirit : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_VegenfulSpiritEntity;
    UPROPERTY()
    FString m_DisplayName;

    FCS_LevelEventVegenfulSpirit()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_LevelEventVegenfulSpirit(const FCS_LevelEventVegenfulSpirit &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_VegenfulSpiritEntity = Other.m_VegenfulSpiritEntity;
        this.m_DisplayName = Other.m_DisplayName;
        return;
    }
    FCS_LevelEventVegenfulSpirit opAssign(const FCS_LevelEventVegenfulSpirit &inout Other)
    {
        FCS_LevelEventVegenfulSpirit __r;
        this.SetVegenfulSpiritEntity(Other.GetVegenfulSpiritEntity());
        this.SetDisplayName(Other.GetDisplayName());
        return __r;
    }
    const FECSEntity GetVegenfulSpiritEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_VegenfulSpiritEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetVegenfulSpiritEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_VegenfulSpiritEntity = __Value;
        return;
    }
    FString GetDisplayName() const property
    {
        return this.m_DisplayName;
    }
    void SetDisplayName(const FString &inout __Value) property
    {
        if ((this.m_DisplayName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DisplayName = __Value;
        return;
    }
}

namespace ECSFunc_FCS_LevelEventVegenfulSpirit
{
UFUNCTION()
bool HasLevelEventVegenfulSpirit(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelEventVegenfulSpirit);
}
FCS_LevelEventVegenfulSpirit& AssignLevelEventVegenfulSpirit(const FECSWorldPtr &inout World, const FCS_LevelEventVegenfulSpirit &inout DefaultValue = FCS_LevelEventVegenfulSpirit())
{
    UScriptStruct local_6 = FCS_LevelEventVegenfulSpirit;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelEventVegenfulSpirit_BP(const FECSWorldPtr &inout World, const FCS_LevelEventVegenfulSpirit &inout DefaultValue = FCS_LevelEventVegenfulSpirit())
{
    ECSFunc_FCS_LevelEventVegenfulSpirit::AssignLevelEventVegenfulSpirit(World, DefaultValue);
    return;
}
FCS_LevelEventVegenfulSpirit& ModifyLevelEventVegenfulSpirit(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelEventVegenfulSpirit;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelEventVegenfulSpirit& ModifyOrAddLevelEventVegenfulSpirit(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelEventVegenfulSpirit;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelEventVegenfulSpirit& GetLevelEventVegenfulSpirit(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelEventVegenfulSpirit;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelEventVegenfulSpirit GetLevelEventVegenfulSpirit_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_LevelEventVegenfulSpirit& local_4 = ECSFunc_FCS_LevelEventVegenfulSpirit::GetLevelEventVegenfulSpirit(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_LevelEventVegenfulSpirit();
}
const FCS_LevelEventVegenfulSpirit GetDefaultedLevelEventVegenfulSpirit(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelEventVegenfulSpirit __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelEventVegenfulSpirit);
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
FCS_LevelEventVegenfulSpirit GetDefaultedLevelEventVegenfulSpirit_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_LevelEventVegenfulSpirit::GetDefaultedLevelEventVegenfulSpirit(World);
}
UFUNCTION()
bool RemoveLevelEventVegenfulSpirit(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelEventVegenfulSpirit);
}
}
void __MonitorLevelEventVegenfulSpiritLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelEventVegenfulSpirit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelEventVegenfulSpiritActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelEventVegenfulSpirit, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelEventVegenfulSpiritModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelEventVegenfulSpirit, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_LevelEventVegenfulSpirit &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_LevelEventVegenfulSpirit &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_LevelEventVegenfulSpirit &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_LevelEventVegenfulSpirit
{
int __IndexOf_VegenfulSpiritEntity()
{
    return 0;
}
int __IndexOf_DisplayName()
{
    return 1;
}
}
