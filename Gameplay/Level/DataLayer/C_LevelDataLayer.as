
namespace __INTENRAL_FCS_LevelActiveDataLayers_NS
{
    const TECSComponentDerivedPtr<FCS_LevelActiveDataLayers> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelActiveDataLayers>();
    const FCS_LevelActiveDataLayers DefaultValue = FCS_LevelActiveDataLayers();
}
namespace __INTENRAL_FCS_ServerPendingUpdateLevelGroupsTag_NS
{
    const TECSComponentDerivedPtr<FCS_ServerPendingUpdateLevelGroupsTag> DerivedPtr = TECSComponentDerivedPtr<FCS_ServerPendingUpdateLevelGroupsTag>();
    const FCS_ServerPendingUpdateLevelGroupsTag DefaultValue = FCS_ServerPendingUpdateLevelGroupsTag();
}
namespace __INTENRAL_FCS_LevelActiveDataLayersClientModifyFlag_NS
{
    const TECSComponentDerivedPtr<FCS_LevelActiveDataLayersClientModifyFlag> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelActiveDataLayersClientModifyFlag>();
    const FCS_LevelActiveDataLayersClientModifyFlag DefaultValue = FCS_LevelActiveDataLayersClientModifyFlag();
}
namespace __INTENRAL_FCS_ClientPendingUpdateLevelGroupsTag_NS
{
    const TECSComponentDerivedPtr<FCS_ClientPendingUpdateLevelGroupsTag> DerivedPtr = TECSComponentDerivedPtr<FCS_ClientPendingUpdateLevelGroupsTag>();
    const FCS_ClientPendingUpdateLevelGroupsTag DefaultValue = FCS_ClientPendingUpdateLevelGroupsTag();
}
namespace __INTENRAL_FCS_TestMonitor_NS
{
    const TECSComponentDerivedPtr<FCS_TestMonitor> DerivedPtr = TECSComponentDerivedPtr<FCS_TestMonitor>();
    const FCS_TestMonitor DefaultValue = FCS_TestMonitor();

}
struct FCS_LevelActiveDataLayers : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FName> m_ActiveDataLayers;
    UPROPERTY()
    TArray<FName> m_EffectiveActiveDataLayers;
    UPROPERTY()
    uint m_ModifyFlag;

    FCS_LevelActiveDataLayers()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_LevelActiveDataLayers(const FCS_LevelActiveDataLayers &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_LevelActiveDataLayers opAssign(const FCS_LevelActiveDataLayers &inout Other)
    {
        FCS_LevelActiveDataLayers __r;
        this.SetActiveDataLayers(Other.GetActiveDataLayers());
        this.SetEffectiveActiveDataLayers(Other.GetEffectiveActiveDataLayers());
        this.SetModifyFlag(Other.GetModifyFlag());
        return __r;
    }
    TArray<FName> GetActiveDataLayers() const property
    {
        TArray<FName> __r;
        return __r;
    }
    TArray<FName> GetModify_ActiveDataLayers() property
    {
        TArray<FName> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetActiveDataLayers(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActiveDataLayers = __Value;
        return;
    }
    const TArray<FName> GetEffectiveActiveDataLayers() const property
    {
        const TArray<FName> __r;
        return __r;
    }
    TArray<FName> GetModify_EffectiveActiveDataLayers() property
    {
        TArray<FName> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetEffectiveActiveDataLayers(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EffectiveActiveDataLayers = __Value;
        return;
    }
    uint GetModifyFlag() const property
    {
        return this.m_ModifyFlag;
    }
    void SetModifyFlag(const uint __Value) property
    {
        if (this.m_ModifyFlag == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ModifyFlag = __Value;
        return;
    }
}

struct FCS_ServerPendingUpdateLevelGroupsTag : FECSSingleton
{
    FCS_ServerPendingUpdateLevelGroupsTag()
    {
        return;
    }
}

struct FCS_LevelActiveDataLayersClientModifyFlag : FECSSingleton
{
    UPROPERTY()
    uint ModifyFlag = 0;


}

struct FCS_ClientPendingUpdateLevelGroupsTag : FECSSingleton
{
    FCS_ClientPendingUpdateLevelGroupsTag()
    {
        return;
    }
}

struct FCS_TestMonitor : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Value;

    FCS_TestMonitor()
    {
        this.m_Value = 0;
        this.__InitDirtyFlags();
        return;
    }
    FCS_TestMonitor(const FCS_TestMonitor &inout Other)
    {
        this.m_Value = 0;
        this.__InitDirtyFlags();
        this.m_Value = int(Other.m_Value);
        return;
    }
    FCS_TestMonitor opAssign(const FCS_TestMonitor &inout Other)
    {
        int local_1 = 0;
        FCS_TestMonitor __r;
        this.SetValue(local_1);
        return __r;
    }
    int GetValue() const property
    {
        return this.m_Value;
    }
    void SetValue(const int __Value) property
    {
        if (this.m_Value == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Value = __Value;
        return;
    }
}

namespace ECSFunc_FCS_LevelActiveDataLayers
{
UFUNCTION()
bool HasLevelActiveDataLayers(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelActiveDataLayers);
}
FCS_LevelActiveDataLayers& AssignLevelActiveDataLayers(const FECSWorldPtr &inout World, const FCS_LevelActiveDataLayers &inout DefaultValue = FCS_LevelActiveDataLayers())
{
    UScriptStruct local_6 = FCS_LevelActiveDataLayers;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelActiveDataLayers_BP(const FECSWorldPtr &inout World, const FCS_LevelActiveDataLayers &inout DefaultValue = FCS_LevelActiveDataLayers())
{
    ECSFunc_FCS_LevelActiveDataLayers::AssignLevelActiveDataLayers(World, DefaultValue);
    return;
}
FCS_LevelActiveDataLayers& ModifyLevelActiveDataLayers(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelActiveDataLayers;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelActiveDataLayers& ModifyOrAddLevelActiveDataLayers(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelActiveDataLayers;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelActiveDataLayers& GetLevelActiveDataLayers(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelActiveDataLayers;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelActiveDataLayers GetLevelActiveDataLayers_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_LevelActiveDataLayers& local_4 = ECSFunc_FCS_LevelActiveDataLayers::GetLevelActiveDataLayers(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_LevelActiveDataLayers();
}
const FCS_LevelActiveDataLayers GetDefaultedLevelActiveDataLayers(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelActiveDataLayers __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelActiveDataLayers);
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
FCS_LevelActiveDataLayers GetDefaultedLevelActiveDataLayers_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_LevelActiveDataLayers::GetDefaultedLevelActiveDataLayers(World);
}
UFUNCTION()
bool RemoveLevelActiveDataLayers(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelActiveDataLayers);
}
}
void __MonitorLevelActiveDataLayersLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelActiveDataLayers, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelActiveDataLayersActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelActiveDataLayers, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelActiveDataLayersModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelActiveDataLayers, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_ServerPendingUpdateLevelGroupsTag
{
UFUNCTION()
bool HasServerPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ServerPendingUpdateLevelGroupsTag);
}
FCS_ServerPendingUpdateLevelGroupsTag& AssignServerPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World, const FCS_ServerPendingUpdateLevelGroupsTag &inout DefaultValue = FCS_ServerPendingUpdateLevelGroupsTag())
{
    UScriptStruct local_6 = FCS_ServerPendingUpdateLevelGroupsTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignServerPendingUpdateLevelGroupsTag_BP(const FECSWorldPtr &inout World, const FCS_ServerPendingUpdateLevelGroupsTag &inout DefaultValue = FCS_ServerPendingUpdateLevelGroupsTag())
{
    ECSFunc_FCS_ServerPendingUpdateLevelGroupsTag::AssignServerPendingUpdateLevelGroupsTag(World, DefaultValue);
    return;
}
FCS_ServerPendingUpdateLevelGroupsTag& ModifyServerPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerPendingUpdateLevelGroupsTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ServerPendingUpdateLevelGroupsTag& ModifyOrAddServerPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerPendingUpdateLevelGroupsTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ServerPendingUpdateLevelGroupsTag& GetServerPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ServerPendingUpdateLevelGroupsTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ServerPendingUpdateLevelGroupsTag GetServerPendingUpdateLevelGroupsTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_ServerPendingUpdateLevelGroupsTag& local_4 = ECSFunc_FCS_ServerPendingUpdateLevelGroupsTag::GetServerPendingUpdateLevelGroupsTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_ServerPendingUpdateLevelGroupsTag();
}
const FCS_ServerPendingUpdateLevelGroupsTag GetDefaultedServerPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ServerPendingUpdateLevelGroupsTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ServerPendingUpdateLevelGroupsTag);
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
FCS_ServerPendingUpdateLevelGroupsTag GetDefaultedServerPendingUpdateLevelGroupsTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_ServerPendingUpdateLevelGroupsTag::GetDefaultedServerPendingUpdateLevelGroupsTag(World);
}
UFUNCTION()
bool RemoveServerPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ServerPendingUpdateLevelGroupsTag);
}
}
void __MonitorServerPendingUpdateLevelGroupsTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ServerPendingUpdateLevelGroupsTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorServerPendingUpdateLevelGroupsTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ServerPendingUpdateLevelGroupsTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorServerPendingUpdateLevelGroupsTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ServerPendingUpdateLevelGroupsTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_LevelActiveDataLayersClientModifyFlag
{
UFUNCTION()
bool HasLevelActiveDataLayersClientModifyFlag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelActiveDataLayersClientModifyFlag);
}
FCS_LevelActiveDataLayersClientModifyFlag& AssignLevelActiveDataLayersClientModifyFlag(const FECSWorldPtr &inout World, const FCS_LevelActiveDataLayersClientModifyFlag &inout DefaultValue = FCS_LevelActiveDataLayersClientModifyFlag())
{
    UScriptStruct local_6 = FCS_LevelActiveDataLayersClientModifyFlag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelActiveDataLayersClientModifyFlag_BP(const FECSWorldPtr &inout World, const FCS_LevelActiveDataLayersClientModifyFlag &inout DefaultValue = FCS_LevelActiveDataLayersClientModifyFlag())
{
    ECSFunc_FCS_LevelActiveDataLayersClientModifyFlag::AssignLevelActiveDataLayersClientModifyFlag(World, DefaultValue);
    return;
}
FCS_LevelActiveDataLayersClientModifyFlag& ModifyLevelActiveDataLayersClientModifyFlag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelActiveDataLayersClientModifyFlag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelActiveDataLayersClientModifyFlag& ModifyOrAddLevelActiveDataLayersClientModifyFlag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelActiveDataLayersClientModifyFlag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelActiveDataLayersClientModifyFlag& GetLevelActiveDataLayersClientModifyFlag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelActiveDataLayersClientModifyFlag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelActiveDataLayersClientModifyFlag GetLevelActiveDataLayersClientModifyFlag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_LevelActiveDataLayersClientModifyFlag& local_4 = ECSFunc_FCS_LevelActiveDataLayersClientModifyFlag::GetLevelActiveDataLayersClientModifyFlag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_LevelActiveDataLayersClientModifyFlag();
}
const FCS_LevelActiveDataLayersClientModifyFlag GetDefaultedLevelActiveDataLayersClientModifyFlag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelActiveDataLayersClientModifyFlag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelActiveDataLayersClientModifyFlag);
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
FCS_LevelActiveDataLayersClientModifyFlag GetDefaultedLevelActiveDataLayersClientModifyFlag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_LevelActiveDataLayersClientModifyFlag::GetDefaultedLevelActiveDataLayersClientModifyFlag(World);
}
UFUNCTION()
bool RemoveLevelActiveDataLayersClientModifyFlag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelActiveDataLayersClientModifyFlag);
}
}
void __MonitorLevelActiveDataLayersClientModifyFlagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelActiveDataLayersClientModifyFlag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelActiveDataLayersClientModifyFlagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelActiveDataLayersClientModifyFlag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelActiveDataLayersClientModifyFlagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelActiveDataLayersClientModifyFlag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_ClientPendingUpdateLevelGroupsTag
{
UFUNCTION()
bool HasClientPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ClientPendingUpdateLevelGroupsTag);
}
FCS_ClientPendingUpdateLevelGroupsTag& AssignClientPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World, const FCS_ClientPendingUpdateLevelGroupsTag &inout DefaultValue = FCS_ClientPendingUpdateLevelGroupsTag())
{
    UScriptStruct local_6 = FCS_ClientPendingUpdateLevelGroupsTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignClientPendingUpdateLevelGroupsTag_BP(const FECSWorldPtr &inout World, const FCS_ClientPendingUpdateLevelGroupsTag &inout DefaultValue = FCS_ClientPendingUpdateLevelGroupsTag())
{
    ECSFunc_FCS_ClientPendingUpdateLevelGroupsTag::AssignClientPendingUpdateLevelGroupsTag(World, DefaultValue);
    return;
}
FCS_ClientPendingUpdateLevelGroupsTag& ModifyClientPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ClientPendingUpdateLevelGroupsTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ClientPendingUpdateLevelGroupsTag& ModifyOrAddClientPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ClientPendingUpdateLevelGroupsTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ClientPendingUpdateLevelGroupsTag& GetClientPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ClientPendingUpdateLevelGroupsTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ClientPendingUpdateLevelGroupsTag GetClientPendingUpdateLevelGroupsTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_ClientPendingUpdateLevelGroupsTag& local_4 = ECSFunc_FCS_ClientPendingUpdateLevelGroupsTag::GetClientPendingUpdateLevelGroupsTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_ClientPendingUpdateLevelGroupsTag();
}
const FCS_ClientPendingUpdateLevelGroupsTag GetDefaultedClientPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ClientPendingUpdateLevelGroupsTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ClientPendingUpdateLevelGroupsTag);
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
FCS_ClientPendingUpdateLevelGroupsTag GetDefaultedClientPendingUpdateLevelGroupsTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_ClientPendingUpdateLevelGroupsTag::GetDefaultedClientPendingUpdateLevelGroupsTag(World);
}
UFUNCTION()
bool RemoveClientPendingUpdateLevelGroupsTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ClientPendingUpdateLevelGroupsTag);
}
}
void __MonitorClientPendingUpdateLevelGroupsTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ClientPendingUpdateLevelGroupsTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorClientPendingUpdateLevelGroupsTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ClientPendingUpdateLevelGroupsTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorClientPendingUpdateLevelGroupsTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ClientPendingUpdateLevelGroupsTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TestMonitor
{
UFUNCTION()
bool HasTestMonitor(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TestMonitor);
}
FCS_TestMonitor& AssignTestMonitor(const FECSWorldPtr &inout World, const FCS_TestMonitor &inout DefaultValue = FCS_TestMonitor())
{
    UScriptStruct local_6 = FCS_TestMonitor;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTestMonitor_BP(const FECSWorldPtr &inout World, const FCS_TestMonitor &inout DefaultValue = FCS_TestMonitor())
{
    ECSFunc_FCS_TestMonitor::AssignTestMonitor(World, DefaultValue);
    return;
}
FCS_TestMonitor& ModifyTestMonitor(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TestMonitor& ModifyOrAddTestMonitor(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TestMonitor& GetTestMonitor(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TestMonitor;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TestMonitor GetTestMonitor_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_TestMonitor& local_4 = ECSFunc_FCS_TestMonitor::GetTestMonitor(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_TestMonitor();
}
const FCS_TestMonitor GetDefaultedTestMonitor(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TestMonitor __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TestMonitor);
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
FCS_TestMonitor GetDefaultedTestMonitor_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_TestMonitor::GetDefaultedTestMonitor(World);
}
UFUNCTION()
bool RemoveTestMonitor(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TestMonitor);
}
}
void __MonitorTestMonitorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TestMonitor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TestMonitor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTestMonitorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TestMonitor, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_LevelActiveDataLayers &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_LevelActiveDataLayers &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_LevelActiveDataLayers &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_LevelActiveDataLayers
{
int __IndexOf_ActiveDataLayers()
{
    return 0;
}
int __IndexOf_EffectiveActiveDataLayers()
{
    return 1;
}
int __IndexOf_ModifyFlag()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_TestMonitor &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_TestMonitor &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_TestMonitor &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_TestMonitor
{
int __IndexOf_Value()
{
    return 0;
}
}
