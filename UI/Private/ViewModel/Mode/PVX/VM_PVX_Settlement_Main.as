
namespace FVM_PVX_Settlement_Main
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnPlayerAdvancePhase = FEUIModelCallbackSignature();

}
struct FVM_PVX_Settlement_Main : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_CurrentPhaseIndex;
    UPROPERTY()
    EPVX_SettlementPhaseType m_CurrentPhaseType;
    UPROPERTY()
    FEUIDynamicWidgetData m_DynamicWidget;
    UPROPERTY()
    bool m_bAllPhasesCompleted;
    UPROPERTY()
    EFaction m_LocalPlayerFaction;
    UPROPERTY()
    TArray<EPVX_SettlementPhaseType> m_ActivePhaseList;
    UPROPERTY()
    TArray<FPVX_SettlementPhaseConfig> m_PhaseConfigs;
    UPROPERTY()
    FFPTime m_PhaseCountdownEndTime;
    UPROPERTY()
    int m_CountdownDisplaySeconds;
    UPROPERTY()
    FEUITimerHandle m_PhaseTimerHandle;
    UPROPERTY()
    bool m_bIsSuccess;
    UPROPERTY()
    int m_WinnerTeamId;
    UPROPERTY()
    int m_LocalPlayerTeamId;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionFinish> m_CommissionFinish;

    FVM_PVX_Settlement_Main()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_PVX_Settlement_Main(const FVM_PVX_Settlement_Main &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_PVX_Settlement_Main& opAssign(const FVM_PVX_Settlement_Main &inout Other)
    {
        this.m_CurrentPhaseIndex = int(Other.m_CurrentPhaseIndex);
        this.m_CurrentPhaseType = Other.m_CurrentPhaseType;
        this.m_DynamicWidget = Other.m_DynamicWidget;
        this.m_bAllPhasesCompleted = Other.m_bAllPhasesCompleted;
        this.m_LocalPlayerFaction = Other.m_LocalPlayerFaction;
        this.m_ActivePhaseList = Other.m_ActivePhaseList;
        this.m_PhaseConfigs = Other.m_PhaseConfigs;
        this.m_PhaseCountdownEndTime = Other.m_PhaseCountdownEndTime;
        this.m_CountdownDisplaySeconds = int(Other.m_CountdownDisplaySeconds);
        this.m_PhaseTimerHandle = Other.m_PhaseTimerHandle;
        this.m_bIsSuccess = Other.m_bIsSuccess;
        this.m_WinnerTeamId = int(Other.m_WinnerTeamId);
        this.m_LocalPlayerTeamId = int(Other.m_LocalPlayerTeamId);
        return Other.m_CommissionFinish;
    }
    void PostConstruct()
    {
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (!(local_4.IsValid()))
        {
            return;
        }
        this.SetCommissionFinish(TEUIModelRef<FVM_CommissionFinish>(::FVM_CommissionFinish::Create(this.GetContext().Manager)));
        this.LoadSettlementConfig();
        this.ResolveLocalPlayerFaction(local_4);
        this.ResolveBattleResult(local_4);
        this.BuildActivePhaseList();
        if (this.GetActivePhaseList().Num() > 0)
        {
            this.SetCurrentPhaseIndex(0);
            this.StartCurrentPhase();
        }
        return;
    }
    void BeginDestroy()
    {
        this.ClearTimer(this.GetModify_PhaseTimerHandle());
        return;
    }
    void LoadSettlementConfig()
    {
        UAS_GameModeSettingsPVX local_8 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (local_8 != nullptr)
        {
            this.SetPhaseConfigs(local_8.SettlementPhaseConfigs);
        }
        return;
    }
    void ResolveLocalPlayerFaction(const FECSWorldPtr &inout World)
    {
        int local_22 = 0;
        int local_34 = 0;
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayer());
        this.SetLocalPlayerFaction(::FGameModeDataBridge::GetPVXPlayerFaction(World, local_4));
        Has local_14;
        bool local_15 = local_14.opCall();
        if (local_15)
        {
            if (local_22.GetPlayerProgressMap().Contains(local_4))
            {
                this.SetLocalPlayerTeamId(local_22.GetPlayerProgressMap()[local_4].GetTeamId());
            }
        }
        else
        {
            Has local_28;
            bool local_15_2 = local_28.opCall();
            if (local_15_2)
            {
                if (local_34.GetPlayerInfoMap().Contains(local_4))
                {
                    this.SetLocalPlayerTeamId(local_34.GetPlayerInfoMap()[local_4].GetTeamId());
                }
            }
        }
        return;
    }
    void ResolveBattleResult(const FECSWorldPtr &inout World)
    {
        int local_3;
        this.SetWinnerTeamId(::FGameModeDataBridge::GetPVXWinnerTeamId(World));
        if (this.GetWinnerTeamId() < 0)
        {
            local_3 = 0;
        }
        else
        {
            bool local_4 = (this.GetWinnerTeamId() == this.GetLocalPlayerTeamId());
            local_3 = local_4;
        }
        this.SetbIsSuccess((local_3 != 0));
        return;
    }
    void BuildActivePhaseList()
    {
        this.GetModify_ActivePhaseList().Empty(0);
        UAS_GameModeSettingsPVX local_10 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (local_10 != nullptr)
        {
            for (auto& local_26 : local_10.SettlementFactionPhases)
            {
                if (int(local_26.Faction) == (int(this.GetLocalPlayerFaction())))
                {
                    this.SetActivePhaseList(local_26.Phases);
                    return;
                }
            }
        }
        this.GetModify_ActivePhaseList().AddUnique(EPVX_SettlementPhaseType(0));
        return;
    }
    void StartCurrentPhase()
    {
        if (!(this.GetActivePhaseList().IsValidIndex(this.GetCurrentPhaseIndex())))
        {
            return;
        }
        this.SetCurrentPhaseType(EPVX_SettlementPhaseType(this.GetActivePhaseList()[this.GetCurrentPhaseIndex()]));
        TSoftClassPtr<UEUIUserWidget> local_14 = TSoftClassPtr<UEUIUserWidget>(this.GetPhaseConfigs()[this.GetCurrentPhaseIndex()].PhaseWidgetClass);
        if (!(local_14.IsNull()))
        {
            FEUIDynamicWidgetData local_38;
            local_38.WidgetClass = local_14;
            local_38.ModelContainer = this.CreatePhaseViewModel(EPVX_SettlementPhaseType(this.GetCurrentPhaseType()));
            this.SetDynamicWidget(local_38);
        }
        float32 local_54 = this.GetCurrentPhaseDuration();
        if (local_54 > 0.0f)
        {
            this.ScheduleTick(this.GetModify_PhaseTimerHandle(), n"OnPhaseTimerTick", 0.1f, -1.0f);
            this.SetCountdownDisplaySeconds(FMath::CeilToInt(local_54));
            this.SetPhaseCountdownEndTime((ECS::GetContextTime() + FFPTime(local_54)));
        }
        return;
    }
    FEUIModelContainer CreatePhaseViewModel(const EPVX_SettlementPhaseType PhaseType)
    {
        FEUIModelContainer __return;
        int local_1 = int(PhaseType);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
            }
            else
            {
                bool local_3 = this.GetbIsSuccess();
                int local_4 = int(this.GetLocalPlayerFaction());
                __return = FEUIModelContainer();
                __return = FEUIModelContainer();
            }
        }
        return FEUIModelContainer();
    }
    float32 GetCurrentPhaseDuration() const
    {
        if (!(this.GetActivePhaseList().IsValidIndex(this.GetCurrentPhaseIndex())))
        {
            return 0.0f;
        }
        EPVX_SettlementPhaseType local_4 = this.GetActivePhaseList()[this.GetCurrentPhaseIndex()];
        for (auto& local_20 : this.GetPhaseConfigs())
        {
            if (int(local_20.PhaseType) == (int(local_4)))
            {
                return local_20.Duration;
            }
        }
        return 15.0f;
    }
    void OnPhaseTimerTick()
    {
        FFPTime local_4 = ECS::GetContextTime();
        this.SetCountdownDisplaySeconds(this.GetCountdownSeconds());
        if (local_4.opCmp(this.GetPhaseCountdownEndTime()) >= 0)
        {
            this.AdvanceToNextPhase();
        }
        return;
    }
    int GetCountdownSeconds() const
    {
        FFPTime local_8 = (FFPTime(this.GetPhaseCountdownEndTime()) - ECS::GetContextTime());
        if (local_8.opCmp(0.0) <= 0)
        {
            return 0;
        }
        return FMath::CeilToInt(local_8.ToSeconds());
    }
    void OnCurrentPhaseTypeChanged()
    {
        if (int(this.GetCurrentPhaseType()) == 0)
        {
            if (int(this.GetLocalPlayerFaction()) == 6)
            {
                TEUIModelRef<FVM_CommissionFinish> local_8 = this.GetCommissionFinish();
                0.SetTitleTextIndex();
                FText local_12 = NSLOCTEXT("PVX", "Settlement_HuntEnd", "з‹©зЊЋз»“жќџ");
                TEUIModelRef<FVM_CommissionFinish> local_8_2 = this.GetCommissionFinish();
                local_12.SetTitleNormalText();
            }
            else
            {
                if (this.GetbIsSuccess())
                {
                    TEUIModelRef<FVM_CommissionFinish> local_8_3 = this.GetCommissionFinish();
                    1.SetTitleTextIndex();
                }
                else
                {
                    TEUIModelRef<FVM_CommissionFinish> local_8_4 = this.GetCommissionFinish();
                    2.SetTitleTextIndex();
                }
            }
            return;
        }
        if (int(this.GetCurrentPhaseType()) == 1)
        {
            TEUIModelRef<FVM_CommissionFinish> local_8_5 = this.GetCommissionFinish();
            0.SetTitleTextIndex();
            FText local_12_2 = NSLOCTEXT("PVX", "Settlement_Performance", "е›ўйџиЎЁзЋ°");
            TEUIModelRef<FVM_CommissionFinish> local_8_6 = this.GetCommissionFinish();
            local_12_2.SetTitleNormalText();
        }
        return;
    }
    void OnPlayerAdvancePhase()
    {
        this.AdvanceToNextPhase();
        return;
    }
    void AdvanceToNextPhase()
    {
        this.ClearTimer(this.GetModify_PhaseTimerHandle());
        this.SetCurrentPhaseIndex((this.GetCurrentPhaseIndex() + 1));
        if (this.GetCurrentPhaseIndex() >= this.GetActivePhaseList().Num())
        {
            this.SetbAllPhasesCompleted(true);
            return;
        }
        this.StartCurrentPhase();
        return;
    }
    int GetCurrentPhaseIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CurrentPhaseIndex;
    }
    void SetCurrentPhaseIndex(const int __Value) property
    {
        if (this.m_CurrentPhaseIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentPhaseIndex = __Value;
        return;
    }
    EPVX_SettlementPhaseType GetCurrentPhaseType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentPhaseType;
    }
    void SetCurrentPhaseType(const EPVX_SettlementPhaseType __Value) property
    {
        if (int(this.m_CurrentPhaseType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentPhaseType = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetDynamicWidget() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_DynamicWidget() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDynamicWidget(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DynamicWidget = __Value;
        return;
    }
    bool GetbAllPhasesCompleted() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bAllPhasesCompleted;
    }
    void SetbAllPhasesCompleted(const bool __Value) property
    {
        if (!(this.m_bAllPhasesCompleted) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bAllPhasesCompleted = __Value;
        return;
    }
    EFaction GetLocalPlayerFaction() const property
    {
        this.TrackPropertyRead(4);
        return this.m_LocalPlayerFaction;
    }
    void SetLocalPlayerFaction(const EFaction __Value) property
    {
        if (int(this.m_LocalPlayerFaction) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_LocalPlayerFaction = __Value;
        return;
    }
    const TArray<EPVX_SettlementPhaseType> GetActivePhaseList() const property
    {
        const TArray<EPVX_SettlementPhaseType> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<EPVX_SettlementPhaseType> GetModify_ActivePhaseList() property
    {
        TArray<EPVX_SettlementPhaseType> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetActivePhaseList(const TArray<EPVX_SettlementPhaseType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ActivePhaseList = __Value;
        return;
    }
    const TArray<FPVX_SettlementPhaseConfig> GetPhaseConfigs() const property
    {
        const TArray<FPVX_SettlementPhaseConfig> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<FPVX_SettlementPhaseConfig> GetModify_PhaseConfigs() property
    {
        TArray<FPVX_SettlementPhaseConfig> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetPhaseConfigs(const TArray<FPVX_SettlementPhaseConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PhaseConfigs = __Value;
        return;
    }
    const FFPTime GetPhaseCountdownEndTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FFPTime GetModify_PhaseCountdownEndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetPhaseCountdownEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PhaseCountdownEndTime = __Value;
        return;
    }
    int GetCountdownDisplaySeconds() const property
    {
        this.TrackPropertyRead(8);
        return this.m_CountdownDisplaySeconds;
    }
    void SetCountdownDisplaySeconds(const int __Value) property
    {
        if (this.m_CountdownDisplaySeconds == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CountdownDisplaySeconds = __Value;
        return;
    }
    const FEUITimerHandle GetPhaseTimerHandle() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FEUITimerHandle GetModify_PhaseTimerHandle() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetPhaseTimerHandle(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_PhaseTimerHandle = __Value;
        return;
    }
    bool GetbIsSuccess() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bIsSuccess;
    }
    void SetbIsSuccess(const bool __Value) property
    {
        if (!(this.m_bIsSuccess) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bIsSuccess = __Value;
        return;
    }
    int GetWinnerTeamId() const property
    {
        this.TrackPropertyRead(11);
        return this.m_WinnerTeamId;
    }
    void SetWinnerTeamId(const int __Value) property
    {
        if (this.m_WinnerTeamId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_WinnerTeamId = __Value;
        return;
    }
    int GetLocalPlayerTeamId() const property
    {
        this.TrackPropertyRead(12);
        return this.m_LocalPlayerTeamId;
    }
    void SetLocalPlayerTeamId(const int __Value) property
    {
        if (this.m_LocalPlayerTeamId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_LocalPlayerTeamId = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionFinish> GetCommissionFinish() const property
    {
        this.TrackPropertyRead(13);
        return this.m_CommissionFinish;
    }
    void SetCommissionFinish(const TEUIModelRef<FVM_CommissionFinish> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionFinish> local_2;
        local_2 = this.m_CommissionFinish;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_CommissionFinish = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_Settlement_Main
{
    UPROPERTY()
    int CountdownSeconds;
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Settlement_Main> Self;


}

namespace FVM_PVX_Settlement_Main
{
FVM_PVX_Settlement_Main& Create(const UObject ContextObject)
{
    return FVM_PVX_Settlement_Main::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PVX_Settlement_Main CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_PVX_Settlement_Main __r;
    TEUIModelRef<FVM_PVX_Settlement_Main> local_6 = TEUIModelRef<FVM_PVX_Settlement_Main>(EUIInternal::MakeModelWithManager(Manager, FVM_PVX_Settlement_Main::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CountdownDisplaySeconds";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionFinish";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionFinish>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CountdownSeconds";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_Settlement_Main>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_Settlement_Main;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnCurrentPhaseTypeChanged";
    local_24.DirtyFlags.Set(FVM_PVX_Settlement_Main::__IndexOf_CurrentPhaseIndex());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_Settlement_Main;
}
void __OnCurrentPhaseTypeChanged(FVM_PVX_Settlement_Main &inout Model)
{
    Model.OnCurrentPhaseTypeChanged();
    return;
}
int __UIGetter_CountdownDisplaySeconds(const FVM_PVX_Settlement_Main &inout Model)
{
    return Model.GetCountdownDisplaySeconds();
}
TEUIModelRef<FVM_CommissionFinish> __UIGetter_CommissionFinish(const FVM_PVX_Settlement_Main &inout Model)
{
    return Model.GetCommissionFinish();
}
int __UIGetter_CountdownSeconds(const FVM_PVX_Settlement_Main &inout Model)
{
    return Model.GetCountdownSeconds();
}
TEUIModelRef<FVM_PVX_Settlement_Main> __UIGetter_Self(const FVM_PVX_Settlement_Main &inout Model)
{
    return TEUIModelRef<FVM_PVX_Settlement_Main>(Model);
}
int __IndexOf_CurrentPhaseIndex()
{
    return 0;
}
int __IndexOf_CurrentPhaseType()
{
    return 1;
}
int __IndexOf_DynamicWidget()
{
    return 2;
}
int __IndexOf_bAllPhasesCompleted()
{
    return 3;
}
int __IndexOf_LocalPlayerFaction()
{
    return 4;
}
int __IndexOf_ActivePhaseList()
{
    return 5;
}
int __IndexOf_PhaseConfigs()
{
    return 6;
}
int __IndexOf_PhaseCountdownEndTime()
{
    return 7;
}
int __IndexOf_CountdownDisplaySeconds()
{
    return 8;
}
int __IndexOf_PhaseTimerHandle()
{
    return 9;
}
int __IndexOf_bIsSuccess()
{
    return 10;
}
int __IndexOf_WinnerTeamId()
{
    return 11;
}
int __IndexOf_LocalPlayerTeamId()
{
    return 12;
}
int __IndexOf_CommissionFinish()
{
    return 13;
}
}
namespace __GeneratedProperties_FVM_PVX_Settlement_Main
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
