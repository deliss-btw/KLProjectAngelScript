
namespace FMS_TeleporterData
{
    const int ModelId = 0;

}
struct FMsg_TeleporterStateChanged : FEUIMessage
{
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> TeleporterConfig;
    UPROPERTY()
    ETeleporterState TeleporterState;


}

struct FMsg_TeleporterActivated : FEUIMessage
{
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> TeleporterConfig;

    FMsg_TeleporterActivated()
    {
        return;
    }
}

struct FMsg_AnyTeleporterStateChanged : FEUIMessage
{
    FMsg_AnyTeleporterStateChanged()
    {
        return;
    }
}

struct FMS_TeleporterData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TDataObjectPtr<FTeleporterConfig>, ETeleporterState> m_TeleporterStates;

    FMS_TeleporterData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_TeleporterData(const FMS_TeleporterData &inout Other)
    {
        this.m_TeleporterStates = Other.m_TeleporterStates;
        return;
    }
    FMS_TeleporterData& opAssign(const FMS_TeleporterData &inout Other)
    {
        return Other.m_TeleporterStates;
    }
    ETeleporterState GetTeleporterState(const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig) const
    {
        ETeleporterState local_3;
        if (!(TeleporterConfig))
        {
            return ETeleporterState(0);
        }
        if (this.GetTeleporterStates().Find(TeleporterConfig, local_3))
        {
            return local_3;
        }
        return TeleporterConfig.opArrow().DefaultState;
    }
    TDataObjectPtr<FTeleporterConfig> FindNearestActiveTeleporter(const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig, const FVector2D &inout TargetPosition2D) const
    {
        TDataObjectPtr<FTeleporterConfig> local_24;
        if (!(LevelInfoConfig))
        {
            return local_24;
        }
        float32 local_51 = -1.0f;
        TArray<TDataObjectPtr<FTeleporterConfig>> local_56 = ::TeleporterUtils::GetAllTeleportersInLevel(LevelInfoConfig);
        for (auto& local_74 : local_56)
        {
            if (!(local_74))
            {
                continue;
            }
            if ((int(this.GetTeleporterState(local_74))) != 2)
            {
                continue;
            }
            float32 local_52 = float32(local_74.opArrow().WorldLocation.DistSquared(TargetPosition2D));
            if ((local_51 < 0.0f || (local_52 < local_51)))
            {
                local_51 = local_52;
                local_24 = local_74;
            }
        }
        return local_24;
    }
    void OnPlayerLevelObjectStatChanged(const FC_PlayerLevelObjectStat &inout PlayerLevelObjectStat)
    {
        TSet<TDataObjectPtr<FTeleporterConfig>> local_20;
        ETeleporterState local_167 = ETeleporterState(0);
        ETeleporterState local_207;
        FMsg_TeleporterStateChanged local_236;
        TSet<TDataObjectPtr<FTeleporterConfig>> local_40;
        if (PlayerLevelObjectStat)
        {
            auto local_48 = PlayerLevelObjectStat.GetTeleporterDataIds().Iterator();
            for (; local_48.CanProceed;)
            {
                int local_56 = local_48.Proceed();
                GetDataObjectByGSDataId<FTeleporterConfig> local_80;
                local_20.Add(local_80.opImplConv());
            }
            auto local_54 = PlayerLevelObjectStat.GetUnlockedTeleporterDataIds().Iterator();
            for (; local_54.CanProceed;)
            {
                int local_56_2 = local_54.Proceed();
                GetDataObjectByGSDataId<FTeleporterConfig> local_104;
                local_40.Add(local_104.opImplConv());
            }
        }
        TMap<TDataObjectPtr<FTeleporterConfig>, ETeleporterState> local_148;
        for (auto& local_166 : local_20)
        {
            local_167 = ETeleporterState(2);
            local_148.Add(local_166, local_167);
        }
        for (auto& local_166 : local_40)
        {
            if (!(local_20.Contains(local_166)))
            {
                local_167 = ETeleporterState(1);
                local_148.Add(local_166, local_167);
            }
        }
        if (this.GetTeleporterStates().OrderIndependentCompareEqual(local_148))
        {
            return;
        }
        TSet<TDataObjectPtr<FTeleporterConfig>> local_188;
        for (auto& local_206 : local_148)
        {
            if (!(this.GetTeleporterStates().Find(local_206.GetKey(), local_207)) || (int(local_207) != int(local_167)))
            {
                local_188.Add(local_206.GetKey());
            }
        }
        for (auto& local_228 : this.GetTeleporterStates())
        {
            if (!(local_148.Contains(local_228.GetKey())))
            {
                local_188.Add(local_228.GetKey());
            }
        }
        this.GetModify_TeleporterStates().Empty(0);
        for (auto& local_206_2 : local_148)
        {
            this.GetModify_TeleporterStates().Add(local_206_2.GetKey());
        }
        for (auto& local_166 : local_188)
        {
            FEUIModelRef local_234 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_236.TeleporterConfig = local_166;
            local_167 = this.GetTeleporterState(local_166);
            local_236.TeleporterState = ETeleporterState(local_167);
        }
        FEUIModelRef local_234_2 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_234_2);
        return;
    }
    void OnTeleporterActivated(const FCE_NofityTeleporterActivated &inout Event)
    {
        int local_114 = 0;
        GetDataObjectByGSDataId<FTeleporterConfig> local_48;
        TDataObjectPtr<FTeleporterConfig> local_24 = local_48.opImplConv();
        if (!(local_24))
        {
            XError(ELog(22), FString().Append("OnTeleporterActivated: Invalid teleporter data id: ").Append(Event.TeleporterDataId));
            return;
        }
        FEUIModelRef local_112 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_114.TeleporterConfig = local_24;
        return;
    }
    const TMap<TDataObjectPtr<FTeleporterConfig>, ETeleporterState> GetTeleporterStates() const property
    {
        const TMap<TDataObjectPtr<FTeleporterConfig>, ETeleporterState> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TDataObjectPtr<FTeleporterConfig>, ETeleporterState> GetModify_TeleporterStates() property
    {
        TMap<TDataObjectPtr<FTeleporterConfig>, ETeleporterState> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeleporterStates(const TMap<TDataObjectPtr<FTeleporterConfig>, ETeleporterState> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeleporterStates = __Value;
        return;
    }
}

namespace FMS_TeleporterData
{
FMS_TeleporterData& Get(const UObject ContextObject)
{
    return FMS_TeleporterData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_TeleporterData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_TeleporterData __r;
    TEUIModelRef<FMS_TeleporterData> local_6 = TEUIModelRef<FMS_TeleporterData>(EUIInternal::MakeModelWithManager(Manager, FMS_TeleporterData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnPlayerLevelObjectStatChanged";
    local_14.ComponentType = FC_PlayerLevelObjectStat;
    Result.MonitorFunctions.Add(local_14);
    FEUIModelEventDefine local_24;
    local_24.FunctionName = "__OnTeleporterActivated";
    local_24.EventType = FCE_NofityTeleporterActivated;
    Result.EventFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_TeleporterData;
}
void __OnPlayerLevelObjectStatChanged(FMS_TeleporterData &inout Model, const FECSEntity &inout Entity, const FC_PlayerLevelObjectStat &inout Component)
{
    Model.OnPlayerLevelObjectStatChanged(Component);
    return;
}
void __OnTeleporterActivated(FMS_TeleporterData &inout Model, const FCE_NofityTeleporterActivated &inout Event)
{
    Model.OnTeleporterActivated(Event);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_TeleporterStates()
{
    return 0;
}
}
