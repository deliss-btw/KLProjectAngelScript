
namespace FVM_PVX_Settlement_PhasePerformance
{
    const int ModelId = 0;

}
struct FPVX_SettlementPlayerInfoSorter
{
    FPVX_SettlementPlayerInfoSorter()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> &inout A, const TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> &inout B)
    {
        return (GetPlayerData().GetPlayerInTeamIndex() < GetPlayerData().GetPlayerInTeamIndex());
    }
}

struct FVM_PVX_Settlement_PhasePerformance : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>> m_TeamPlayerInfoList;

    FVM_PVX_Settlement_PhasePerformance()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_PVX_Settlement_PhasePerformance(const FVM_PVX_Settlement_PhasePerformance &inout Other)
    {
        this.m_TeamPlayerInfoList = Other.m_TeamPlayerInfoList;
        return;
    }
    FVM_PVX_Settlement_PhasePerformance& opAssign(const FVM_PVX_Settlement_PhasePerformance &inout Other)
    {
        return Other.m_TeamPlayerInfoList;
    }
    void PostConstruct()
    {
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (local_4.IsValid())
        {
            int local_6 = -1;
            TMap<FECSEntity, FPVX_PlayerData> local_48 = ::FGameModeDataBridge::GetPVXPlayerInfoMap(local_4);
            if (local_48.Contains(this.GetContext().GetLocalPlayer()))
            {
                local_6 = local_48[this.GetContext().GetLocalPlayer()].GetTeamId();
            }
            for (auto& local_70 : local_48)
            {
                if (GetTeamId() == local_6)
                {
                    TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> local_72 = TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>(::FVM_PVX_Settlement_PlayerInfo::Create(this.GetContext().Manager, local_70.GetKey()));
                    this.GetModify_TeamPlayerInfoList().Add(local_72);
                }
            }
        }
        return;
    }
    const TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>> GetTeamPlayerInfoList() const property
    {
        const TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>> GetModify_TeamPlayerInfoList() property
    {
        TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeamPlayerInfoList(const TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamPlayerInfoList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_Settlement_PhasePerformance
{
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Settlement_PhasePerformance> Self;

    __GeneratedProperties_FVM_PVX_Settlement_PhasePerformance()
    {
        return;
    }
}

namespace FVM_PVX_Settlement_PhasePerformance
{
FVM_PVX_Settlement_PhasePerformance& Create(const UObject ContextObject)
{
    return FVM_PVX_Settlement_PhasePerformance::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PVX_Settlement_PhasePerformance CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_PVX_Settlement_PhasePerformance __r;
    TEUIModelRef<FVM_PVX_Settlement_PhasePerformance> local_6 = TEUIModelRef<FVM_PVX_Settlement_PhasePerformance>(EUIInternal::MakeModelWithManager(Manager, FVM_PVX_Settlement_PhasePerformance::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TeamPlayerInfoList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_Settlement_PhasePerformance>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_Settlement_PhasePerformance;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_Settlement_PhasePerformance;
}
TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>> __UIGetter_TeamPlayerInfoList(const FVM_PVX_Settlement_PhasePerformance &inout Model)
{
    return Model.GetTeamPlayerInfoList();
}
TEUIModelRef<FVM_PVX_Settlement_PhasePerformance> __UIGetter_Self(const FVM_PVX_Settlement_PhasePerformance &inout Model)
{
    return TEUIModelRef<FVM_PVX_Settlement_PhasePerformance>(Model);
}
int __IndexOf_TeamPlayerInfoList()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_PVX_Settlement_PhasePerformance
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
