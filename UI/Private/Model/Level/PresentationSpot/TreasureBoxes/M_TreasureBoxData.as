
namespace FMS_TreasureBoxData
{
    const int ModelId = 0;

}
struct FMsg_TreasureBoxStateChanged : FEUIMessage
{
    UPROPERTY()
    TDataObjectPtr<FLevelObjectStatConfig> TreasureBoxConfig;
    UPROPERTY()
    ETreasureBoxState NewState;


}

struct FTreasureBoxStateInfo
{
    UPROPERTY()
    ETreasureBoxState State = ETreasureBoxState(2);
    UPROPERTY()
    FEUITimerHandle RefreshTimerHandle;


}

struct FMS_TreasureBoxData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TDataObjectPtr<FLevelObjectStatConfig>, FTreasureBoxStateInfo> m_TreasureBoxStates;

    FMS_TreasureBoxData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_TreasureBoxData(const FMS_TreasureBoxData &inout Other)
    {
        this.m_TreasureBoxStates = Other.m_TreasureBoxStates;
        return;
    }
    FMS_TreasureBoxData& opAssign(const FMS_TreasureBoxData &inout Other)
    {
        return Other.m_TreasureBoxStates;
    }
    ETreasureBoxState GetTreasureBoxState(const TDataObjectPtr<FLevelObjectStatConfig> &inout TreasureBoxLevelObjectStatConfig) const
    {
        FTreasureBoxStateInfo local_6;
        if (!(TreasureBoxLevelObjectStatConfig))
        {
            return ETreasureBoxState(1);
        }
        if (this.GetTreasureBoxStates().Find(TreasureBoxLevelObjectStatConfig, local_6))
        {
            return local_6.State;
        }
        Get local_10;
        const FCS_TreasureBoxes& local_12 = local_10.opCall();
        if (local_12)
        {
            if (local_12.GetTreasureBox(TreasureBoxLevelObjectStatConfig))
            {
                Get local_24;
                const FC_TreasureBoxConfig& local_26 = local_24.opCall();
                if (local_26)
                {
                    return local_26.DefaultState;
                }
            }
        }
        return ETreasureBoxState(2);
    }
    void OnPlayerLevelObjectStatChanged(const FC_PlayerLevelObjectStat &inout PlayerLevelObjectStat)
    {
        this.RefreshTreasureBoxStates(PlayerLevelObjectStat);
        return;
    }
    void RefreshTreasureBoxStates(const FC_PlayerLevelObjectStat &inout PlayerLevelObjectStat)
    {
        int local_6 = 0;
        bool local_7;
        ETreasureBoxState local_99;
        int local_219 = 0;
        int local_220 = 0;
        int local_224;
        ETreasureBoxState local_259;
        local_7 = !(local_6);
        if (local_7)
        {
            return;
        }
        TSet<TDataObjectPtr<FLevelObjectStatConfig>> local_28;
        for (auto& local_46 : local_6.GetTreasureBoxes())
        {
            local_46;
            TDataObjectPtr<FLevelObjectStatConfig> local_94;
            TDataObjectPtr<FLevelObjectStatConfig> local_70 = local_94;
            local_7 = !(this.GetTreasureBoxStates().Contains(local_70));
            if (local_7)
            {
                FTreasureBoxStateInfo local_98;
                local_99 = this.GetTreasureBoxState(local_70);
                local_98.State = ETreasureBoxState(local_99);
                this.GetModify_TreasureBoxStates().Add(local_70, local_98);
                local_28.Add(local_70);
            }
        }
        TSet<TDataObjectPtr<FLevelObjectStatConfig>> local_120;
        TMap<TDataObjectPtr<FLevelObjectStatConfig>, int64> local_140;
        if (PlayerLevelObjectStat)
        {
            for (auto& local_154 : PlayerLevelObjectStat.GetLevelObjectStatInfoList())
            {
                for (auto& local_168 : local_154.GetTreasureBoxList())
                {
                    int local_193 = local_168.GetTreasureBoxId();
                    GetDataObjectByGSDataId<FLevelObjectStatConfig> local_192;
                    TDataObjectPtr<FLevelObjectStatConfig> local_70_2 = local_192.opImplConv();
                    local_7 = !(local_70_2.IsSet());
                    if (local_7)
                    {
                        local_7 = true;
                    }
                    else
                    {
                        local_220 = local_219;
                        local_7 = (local_220 != 0);
                    }
                    if (local_7)
                    {
                        continue;
                    }
                    if (local_168.GetTreasureBoxState() == 1)
                    {
                        local_120.Add(local_70_2);
                        continue;
                    }
                    local_224 = local_220;
                    if (local_224 < 0)
                    {
                        local_120.Add(local_70_2);
                        continue;
                    }
                    int64 local_230 = FDateTime::UtcNow().ToUnixTimestamp();
                    int local_223 = local_230;
                    if (local_223 < (local_168.GetTreasureBoxTime() + local_224))
                    {
                        local_120.Add(local_70_2);
                        if (local_224 > 0)
                        {
                            local_230 = local_168.GetTreasureBoxTime();
                            int64 local_234 = local_224;
                            local_230 = local_230 + local_234;
                            local_234 = local_223;
                            local_230 = local_230 - local_234;
                            if (local_230 > 0)
                            {
                                local_140.Add(local_70_2, local_230);
                            }
                        }
                    }
                }
            }
        }
        TArray<TDataObjectPtr<FLevelObjectStatConfig>> local_238;
        this.GetTreasureBoxStates().GetKeys(local_238);
        for (auto& local_252 : local_238)
        {
            if (local_120.Contains(local_252))
            {
                local_99 = ETreasureBoxState(1);
            }
            else
            {
                local_99 = ETreasureBoxState(2);
            }
            TRawPtr<FTreasureBoxStateInfo> local_256 = this.GetModify_TreasureBoxStates().Find(local_252);
            local_259 = local_256.opArrow().State;
            int64 local_230_2 = 0;
            if (int(local_99) != 1)
            {
                local_7 = false;
            }
            else
            {
                local_7 = local_140.Find(local_252, local_230_2);
            }
            local_7 = local_7 && (local_230_2 > 0);
            if (local_7)
            {
                float32 local_260 = local_230_2;
                this.ScheduleCall(local_256.opArrow().RefreshTimerHandle, n"OnTreasureBoxRefreshTimerExpired", local_260);
            }
            else
            {
                this.ClearTimer(local_256.opArrow().RefreshTimerHandle);
            }
            local_256.opArrow().State = ETreasureBoxState(local_99);
            if (int(local_259) != int(local_99) || local_28.Contains(local_252))
            {
                FMsg_TreasureBoxStateChanged local_268;
                FEUIModelRef local_266 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus);
                local_268.TreasureBoxConfig = local_252;
                local_268.NewState = ETreasureBoxState(local_99);
            }
        }
        return;
    }
    void OnTreasureBoxRefreshTimerExpired()
    {
        int local_20 = 0;
        int local_153 = 0;
        int local_154 = 0;
        int local_157;
        FTreasureBoxStateInfo local_162;
        FMsg_TreasureBoxStateChanged local_172;
        if (!(::FASCommonUtils::GetUniquePlayerEntity(this.GetContext().GetLocalPlayer()).IsValid()))
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        int local_27 = FDateTime::UtcNow().ToUnixTimestamp();
        for (auto& local_42 : local_20.GetLevelObjectStatInfoList())
        {
            for (auto& local_56 : local_42.GetTreasureBoxList())
            {
                int local_21 = local_56.GetTreasureBoxId();
                GetDataObjectByGSDataId<FLevelObjectStatConfig> local_104;
                TDataObjectPtr<FLevelObjectStatConfig> local_80 = local_104.opImplConv();
                bool local_13 = !(local_80.IsSet());
                if (local_13)
                {
                    local_13 = true;
                }
                else
                {
                    local_154 = local_153;
                    local_13 = (local_154 != 0);
                }
                if (local_13)
                {
                    continue;
                }
                local_157 = local_154;
                if (local_56.GetTreasureBoxState() == 1)
                {
                    continue;
                }
                if (local_157 <= 0)
                {
                    continue;
                }
                if (local_27 < (local_56.GetTreasureBoxTime() + local_157))
                {
                    continue;
                }
                if (!(this.GetTreasureBoxStates().Find(local_80, local_162)) || (int(local_162.State) != 1))
                {
                    continue;
                }
                this.ClearTimer(local_162.RefreshTimerHandle);
                local_162.State = ETreasureBoxState(2);
                FEUIModelRef local_170 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus);
                local_172.TreasureBoxConfig = local_80;
                local_172.NewState = ETreasureBoxState(2);
            }
        }
        return;
    }
    void InvalidateEntityCache()
    {
        FTreasureBoxStateInfo local_24;
        TArray<TDataObjectPtr<FLevelObjectStatConfig>> local_4;
        this.GetTreasureBoxStates().GetKeys(local_4);
        for (auto& local_20 : local_4)
        {
            this.GetTreasureBoxStates().Find(local_20, local_24);
            this.ClearTimer(local_24.RefreshTimerHandle);
        }
        this.GetModify_TreasureBoxStates().Empty(0);
        return;
    }
    void BeginDestroy()
    {
        FTreasureBoxStateInfo local_24;
        TArray<TDataObjectPtr<FLevelObjectStatConfig>> local_4;
        this.GetTreasureBoxStates().GetKeys(local_4);
        for (auto& local_20 : local_4)
        {
            this.GetTreasureBoxStates().Find(local_20, local_24);
            this.ClearTimer(local_24.RefreshTimerHandle);
        }
        return;
    }
    const TMap<TDataObjectPtr<FLevelObjectStatConfig>, FTreasureBoxStateInfo> GetTreasureBoxStates() const property
    {
        const TMap<TDataObjectPtr<FLevelObjectStatConfig>, FTreasureBoxStateInfo> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TDataObjectPtr<FLevelObjectStatConfig>, FTreasureBoxStateInfo> GetModify_TreasureBoxStates() property
    {
        TMap<TDataObjectPtr<FLevelObjectStatConfig>, FTreasureBoxStateInfo> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTreasureBoxStates(const TMap<TDataObjectPtr<FLevelObjectStatConfig>, FTreasureBoxStateInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TreasureBoxStates = __Value;
        return;
    }
}

namespace FMS_TreasureBoxData
{
FMS_TreasureBoxData& Get(const UObject ContextObject)
{
    return FMS_TreasureBoxData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_TreasureBoxData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_TreasureBoxData __r;
    TEUIModelRef<FMS_TreasureBoxData> local_6 = TEUIModelRef<FMS_TreasureBoxData>(EUIInternal::MakeModelWithManager(Manager, FMS_TreasureBoxData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnPlayerLevelObjectStatChanged";
    local_14.ComponentType = FC_PlayerLevelObjectStat;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_TreasureBoxData;
}
void __OnPlayerLevelObjectStatChanged(FMS_TreasureBoxData &inout Model, const FECSEntity &inout Entity, const FC_PlayerLevelObjectStat &inout Component)
{
    Model.OnPlayerLevelObjectStatChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_TreasureBoxStates()
{
    return 0;
}
}
