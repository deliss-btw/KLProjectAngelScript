
namespace FMS_BossLowHPManager
{
    const int ModelId = 0;

}
struct FMS_BossLowHPManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<FECSEntityId> m_LowHpBoss;

    FMS_BossLowHPManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_BossLowHPManager(const FMS_BossLowHPManager &inout Other)
    {
        this.m_LowHpBoss = Other.m_LowHpBoss;
        return;
    }
    FMS_BossLowHPManager& opAssign(const FMS_BossLowHPManager &inout Other)
    {
        return Other.m_LowHpBoss;
    }
    void OnBossLowHPListChanged(const FCS_BossLowHPList &inout BossLowHPList)
    {
        int local_34 = 0;
        if (!(BossLowHPList))
        {
            auto local_8 = this.GetLowHpBoss().Iterator();
            for (; local_8.CanProceed;)
            {
                if (::PresentationSpotUtils::GetEntitySpot(this.GetManager(), local_8.Proceed()))
                {
                }
            }
            this.GetModify_LowHpBoss().Reset(0);
            return;
        }
        int local_31 = this.GetLowHpBoss().Num() - 1;
        for (; local_31 >= 0; --local_31)
        {
            const FECSEntityId& local_16 = this.GetLowHpBoss()[local_31];
            if (!(BossLowHPList.GetBossLowHPList().Contains(local_16)))
            {
                if (::PresentationSpotUtils::GetEntitySpot(this.GetManager(), local_16))
                {
                }
                this.GetModify_LowHpBoss().RemoveAtSwap(local_31);
            }
        }
        auto local_14 = BossLowHPList.GetBossLowHPList().Iterator();
        for (; local_14.CanProceed;)
        {
            if (this.GetModify_LowHpBoss().AddUnique(local_14.Proceed()))
            {
                UEUIManagerSubsystem local_18 = this.GetManager();
                ::AddDecoractor(local_34, EPresentationSpotDecoractor(3), TEUIModelRef<FM_SpotRegistry>());
            }
        }
        return;
    }
    const TArray<FECSEntityId> GetLowHpBoss() const property
    {
        const TArray<FECSEntityId> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FECSEntityId> GetModify_LowHpBoss() property
    {
        TArray<FECSEntityId> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLowHpBoss(const TArray<FECSEntityId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LowHpBoss = __Value;
        return;
    }
}

namespace FMS_BossLowHPManager
{
FMS_BossLowHPManager& Get(const UObject ContextObject)
{
    return FMS_BossLowHPManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_BossLowHPManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_BossLowHPManager __r;
    TEUIModelRef<FMS_BossLowHPManager> local_6 = TEUIModelRef<FMS_BossLowHPManager>(EUIInternal::MakeModelWithManager(Manager, FMS_BossLowHPManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnBossLowHPListChanged";
    local_14.ComponentType = FCS_BossLowHPList;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_BossLowHPManager;
}
void __OnBossLowHPListChanged(FMS_BossLowHPManager &inout Model, const FECSEntity &inout Entity, const FCS_BossLowHPList &inout Component)
{
    Get local_4;
    Model.OnBossLowHPListChanged(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_LowHpBoss()
{
    return 0;
}
}
