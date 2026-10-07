
const FString PlayerControlledPrefix = FString();
namespace __INTENRAL_FC_GameModeDamageCoefficient_NS
{
    const TECSComponentDerivedPtr<FC_GameModeDamageCoefficient> DerivedPtr = TECSComponentDerivedPtr<FC_GameModeDamageCoefficient>();
    const FC_GameModeDamageCoefficient DefaultValue = FC_GameModeDamageCoefficient();
}
namespace __INTENRAL_FCS_GameModeDamageCoefficientCache_NS
{
    const TECSComponentDerivedPtr<FCS_GameModeDamageCoefficientCache> DerivedPtr = TECSComponentDerivedPtr<FCS_GameModeDamageCoefficientCache>();
    const FCS_GameModeDamageCoefficientCache DefaultValue = FCS_GameModeDamageCoefficientCache();

}
struct FC_GameModeDamageCoefficient : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EGameModeDamageCoefficientEntity m_EnumType;

    FC_GameModeDamageCoefficient()
    {
        this.m_EnumType = EGameModeDamageCoefficientEntity(0);
        this.__InitDirtyFlags();
        return;
    }
    FC_GameModeDamageCoefficient(const FC_GameModeDamageCoefficient &inout Other)
    {
        this.m_EnumType = EGameModeDamageCoefficientEntity(0);
        this.__InitDirtyFlags();
        this.m_EnumType = Other.m_EnumType;
        return;
    }
    FC_GameModeDamageCoefficient opAssign(const FC_GameModeDamageCoefficient &inout Other)
    {
        FC_GameModeDamageCoefficient __r;
        this.SetEnumType(Other.GetEnumType());
        return __r;
    }
    EGameModeDamageCoefficientEntity GetEnumType() const property
    {
        return this.m_EnumType;
    }
    void SetEnumType(const EGameModeDamageCoefficientEntity __Value) property
    {
        if (int(this.m_EnumType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_EnumType = __Value;
        return;
    }
}

struct FCS_GameModeDamageCoefficientCache : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<int, float32> m_CacheMap;
    UPROPERTY()
    bool m_bInitialized;

    FCS_GameModeDamageCoefficientCache()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_GameModeDamageCoefficientCache(const FCS_GameModeDamageCoefficientCache &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_GameModeDamageCoefficientCache opAssign(const FCS_GameModeDamageCoefficientCache &inout Other)
    {
        FCS_GameModeDamageCoefficientCache __r;
        this.SetCacheMap(Other.GetCacheMap());
        this.SetbInitialized(Other.GetbInitialized());
        return __r;
    }
    int MakeKey(const EGameModeDamageCoefficientEntity Attacker, const EGameModeDamageCoefficientEntity Taker) const
    {
        int local_1 = int(Taker) * 11;
        int local_2 = int(Attacker);
        local_1 = local_1 + local_2;
        return local_1;
    }
    bool GetCachedCoefficient(const EGameModeDamageCoefficientEntity Attacker, const EGameModeDamageCoefficientEntity Taker, float32 &inout OutCoefficient) const
    {
        int local_2 = this.MakeKey(EGameModeDamageCoefficientEntity(Attacker), EGameModeDamageCoefficientEntity(Taker));
        if (this.GetCacheMap().Contains(local_2))
        {
            OutCoefficient = int(this.GetCacheMap()[local_2]);
            return true;
        }
        return false;
    }
    void InitializeFromDataTable(const FDataTablePtr &inout DamageCoefficientTable)
    {
        const FGameModeDamageCoefficientRow& local_82;
        this.GetModify_CacheMap().Empty(0);
        FDataTableIterator local_6 = FDataTableIterator(DamageCoefficientTable);
        for (; local_6; )
        {
            TDataObjectPtr<FGameModeDamageCoefficientRow> local_80 = TDataObjectPtr<FGameModeDamageCoefficientRow>(local_6.GetDataPtr());
            if (int(local_82.Taker) == 0)
            {
            }
            else
            {
                int local_85 = 1;
                for (; local_85 < 11; )
                {
                    int local_83 = local_85;
                    this.GetModify_CacheMap().Add(this.MakeKey(EGameModeDamageCoefficientEntity(local_83), EGameModeDamageCoefficientEntity(local_82.Taker)), local_82.GetByEntity(EGameModeDamageCoefficientEntity(local_83)));
                    ++local_85;
                }
            }
            local_6.opPreInc();
        }
        this.SetbInitialized(true);
        return;
    }
    const TMap<int, float32> GetCacheMap() const property
    {
        const TMap<int, float32> __r;
        return __r;
    }
    TMap<int, float32> GetModify_CacheMap() property
    {
        TMap<int, float32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetCacheMap(const TMap<int, float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CacheMap = __Value;
        return;
    }
    bool GetbInitialized() const property
    {
        return this.m_bInitialized;
    }
    void SetbInitialized(const bool __Value) property
    {
        if (!(this.m_bInitialized) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bInitialized = __Value;
        return;
    }
}

namespace GameModeDamageCoefficient
{
EGameModeDamageCoefficientEntity GetCoefficientType(const FECSEntity &inout Entity, const FCS_GameMode &inout GameMode)
{
    Has local_4;
    bool local_5;
    int local_14 = 0;
    FName local_66;
    Has local_154;
    if (!(local_4.opCall()))
    {
        if (GetAvatarConfig(Entity))
        {
            FAvatarPrefabConfig local_64;
            local_66 = local_64.GetDataName();
            local_14.SetEnumType(EGameModeDamageCoefficientEntity(GameModeDamageCoefficient::GetCoefficientTypeByName(local_66)));
        }
        else
        {
            if (GetMonsterConfig(Entity))
            {
                if ((int(GameMode.GetGameModeType())) != 0)
                {
                    const FMonsterPrefabConfig& local_118;
                    TDataObjectPtr<FGameModeOverrideMonsterConfig> local_146;
                    if (!(local_118.GetGameModeOverride().Find(GameMode.GetGameModeType(), local_146)))
                    {
                        local_5 = false;
                    }
                    else
                    {
                        local_5 = local_146;
                    }
                    if (local_5)
                    {
                        local_66.GetDataName();
                        FName local_149 = local_66;
                        local_5 = local_154.opCall();
                        if (local_5)
                        {
                            local_149 = FName((FString(PlayerControlledPrefix) + local_149.ToString()));
                        }
                        local_14.SetEnumType(EGameModeDamageCoefficientEntity(GameModeDamageCoefficient::GetCoefficientTypeByName(local_149)));
                    }
                    else
                    {
                        if (local_118.GetPVPOverride())
                        {
                            FPVPOverrideMonsterConfig local_168;
                            FName local_149_2 = FName(local_168.GetDataName());
                            if (local_154.opCall())
                            {
                                local_149_2 = FName((FString(PlayerControlledPrefix) + local_149_2.ToString()));
                            }
                            local_14.SetEnumType(EGameModeDamageCoefficientEntity(GameModeDamageCoefficient::GetCoefficientTypeByName(local_149_2)));
                        }
                    }
                    if ((int(local_14.GetEnumType())) == 0)
                    {
                        local_14.SetEnumType(EGameModeDamageCoefficientEntity(EGameModeDamageCoefficientEntity(10)));
                    }
                }
            }
        }
    }
    Get local_172;
    return local_172.opCall().GetEnumType();
}
EGameModeDamageCoefficientEntity GetCoefficientTypeByName(const FName &inout InName)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    EGameModeDamageCoefficientEntity __r; return __r;
}
FDataTablePtr GetDamageCoefficientTable()
{
    int local_14 = 0;
    const UECSGameModeSettingsBase local_34;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        if (local_14.GameModeFlowSettings.IsValid())
        {
            Get local_18;
            FDataTablePtr local_28 = FDataTablePtr(local_18.opCall().DamageCoefficientDataTable);
            if (!(local_28.IsNull()))
            {
                return local_28;
            }
        }
    }
    local_34 = UECSGameModeSettingsBase::Get(ECS::GetUEWorld());
    UAS_GameModeSettingsPVX local_38 = (Cast<UAS_GameModeSettingsPVX>(local_34));
    if (local_38 != nullptr)
    {
        return local_38.DamageCoefficientDataTable;
    }
    UAS_GameModeSettingsPVP local_42 = (Cast<UAS_GameModeSettingsPVP>(local_34));
    if (local_42 != nullptr)
    {
        return local_42.DamageCoefficientDataTable;
    }
    return FDataTablePtr();
}
float32 GetCoefficient(const FECSEntity &inout Attacker, const FECSEntity &inout Taker)
{
    int local_32 = 0;
    int local_52 = 0;
    if (!(Attacker.IsValid()) || !(Taker.IsValid()))
    {
        return 1.0f;
    }
    FDataTablePtr local_14 = GameModeDamageCoefficient::GetDamageCoefficientTable();
    if (local_14.IsNull())
    {
        return 1.0f;
    }
    FECSWorldPtr local_26 = Attacker.GetWorld();
    EGameModeDamageCoefficientEntity local_34 = GameModeDamageCoefficient::GetCoefficientType(Attacker, local_32);
    EGameModeDamageCoefficientEntity local_33 = GameModeDamageCoefficient::GetCoefficientType(Taker, local_32);
    if (((int(local_34)) == 0 || (int(local_33) == 0)))
    {
        return 1.0f;
    }
    FECSWorldPtr local_26_2 = Taker.GetWorld();
    Has local_42;
    if (!(local_42.opCall()))
    {
        FECSWorldPtr local_26_3 = Taker.GetWorld();
        Modify local_46;
        local_46.opCall().InitializeFromDataTable(local_14);
    }
    FECSWorldPtr local_26_4 = Taker.GetWorld();
    float32 local_53 = 1.0f;
    if (local_52.GetCachedCoefficient(EGameModeDamageCoefficientEntity(local_34), EGameModeDamageCoefficientEntity(local_33), local_53))
    {
        return local_53;
    }
    return 1.0f;
}
}
namespace ECSFunc_FC_GameModeDamageCoefficient
{
UFUNCTION()
bool HasGameModeDamageCoefficient(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameModeDamageCoefficient);
}
FC_GameModeDamageCoefficient& AssignGameModeDamageCoefficient(const FECSEntity &inout Entity, const FC_GameModeDamageCoefficient &inout DefaultValue = FC_GameModeDamageCoefficient())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameModeDamageCoefficient, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameModeDamageCoefficient_BP(const FECSEntity &inout Entity, const FC_GameModeDamageCoefficient &inout DefaultValue = FC_GameModeDamageCoefficient())
{
    ECSFunc_FC_GameModeDamageCoefficient::AssignGameModeDamageCoefficient(Entity, DefaultValue);
    return;
}
FC_GameModeDamageCoefficient& ModifyGameModeDamageCoefficient(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameModeDamageCoefficient));
    return local_12.GetComp();
}
FC_GameModeDamageCoefficient& ModifyOrAddGameModeDamageCoefficient(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameModeDamageCoefficient));
    return local_12.GetComp();
}
const FC_GameModeDamageCoefficient& GetGameModeDamageCoefficient(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameModeDamageCoefficient));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameModeDamageCoefficient GetGameModeDamageCoefficient_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GameModeDamageCoefficient& local_4 = ECSFunc_FC_GameModeDamageCoefficient::GetGameModeDamageCoefficient(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GameModeDamageCoefficient();
}
const FC_GameModeDamageCoefficient GetDefaultedGameModeDamageCoefficient(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameModeDamageCoefficient __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameModeDamageCoefficient);
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
FC_GameModeDamageCoefficient GetDefaultedGameModeDamageCoefficient_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GameModeDamageCoefficient::GetDefaultedGameModeDamageCoefficient(Entity);
}
UFUNCTION()
bool RemoveGameModeDamageCoefficient(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameModeDamageCoefficient);
}
}
FECSMonitorRuntimeView __GetMonitorGameModeDamageCoefficientOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameModeDamageCoefficient, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameModeDamageCoefficientOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameModeDamageCoefficient, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameModeDamageCoefficientOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameModeDamageCoefficient, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameModeDamageCoefficientOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameModeDamageCoefficient, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameModeDamageCoefficientOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameModeDamageCoefficient, bFixedFrame, bMustHandleAll);
}
void __MonitorGameModeDamageCoefficientLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameModeDamageCoefficient, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeDamageCoefficientActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameModeDamageCoefficient, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeDamageCoefficientModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameModeDamageCoefficient, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_GameModeDamageCoefficientCache
{
UFUNCTION()
bool HasGameModeDamageCoefficientCache(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameModeDamageCoefficientCache);
}
FCS_GameModeDamageCoefficientCache& AssignGameModeDamageCoefficientCache(const FECSWorldPtr &inout World, const FCS_GameModeDamageCoefficientCache &inout DefaultValue = FCS_GameModeDamageCoefficientCache())
{
    UScriptStruct local_6 = FCS_GameModeDamageCoefficientCache;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameModeDamageCoefficientCache_BP(const FECSWorldPtr &inout World, const FCS_GameModeDamageCoefficientCache &inout DefaultValue = FCS_GameModeDamageCoefficientCache())
{
    ECSFunc_FCS_GameModeDamageCoefficientCache::AssignGameModeDamageCoefficientCache(World, DefaultValue);
    return;
}
FCS_GameModeDamageCoefficientCache& ModifyGameModeDamageCoefficientCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeDamageCoefficientCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameModeDamageCoefficientCache& ModifyOrAddGameModeDamageCoefficientCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeDamageCoefficientCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameModeDamageCoefficientCache& GetGameModeDamageCoefficientCache(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeDamageCoefficientCache;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameModeDamageCoefficientCache GetGameModeDamageCoefficientCache_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GameModeDamageCoefficientCache& local_4 = ECSFunc_FCS_GameModeDamageCoefficientCache::GetGameModeDamageCoefficientCache(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GameModeDamageCoefficientCache();
}
const FCS_GameModeDamageCoefficientCache GetDefaultedGameModeDamageCoefficientCache(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameModeDamageCoefficientCache __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameModeDamageCoefficientCache);
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
FCS_GameModeDamageCoefficientCache GetDefaultedGameModeDamageCoefficientCache_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GameModeDamageCoefficientCache::GetDefaultedGameModeDamageCoefficientCache(World);
}
UFUNCTION()
bool RemoveGameModeDamageCoefficientCache(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameModeDamageCoefficientCache);
}
}
void __MonitorGameModeDamageCoefficientCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameModeDamageCoefficientCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeDamageCoefficientCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameModeDamageCoefficientCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeDamageCoefficientCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameModeDamageCoefficientCache, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GameModeDamageCoefficient &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GameModeDamageCoefficient &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GameModeDamageCoefficient &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GameModeDamageCoefficient
{
int __IndexOf_EnumType()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_GameModeDamageCoefficientCache &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_GameModeDamageCoefficientCache &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_GameModeDamageCoefficientCache &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_GameModeDamageCoefficientCache
{
int __IndexOf_CacheMap()
{
    return 0;
}
int __IndexOf_bInitialized()
{
    return 1;
}
}
