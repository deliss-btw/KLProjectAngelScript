
namespace FVM_PVX_Settlement_PhaseResult
{
    const int ModelId = 0;

}
struct FVM_PVX_Settlement_PhaseResult : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EFaction m_LocalPlayerFaction;
    UPROPERTY()
    bool m_bIsSuccess;
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> m_LocalPlayerInfo;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ComposableItem>> m_RewardItems;

    FVM_PVX_Settlement_PhaseResult()
    {
        this.m_LocalPlayerFaction = EFaction(1);
        this.m_bIsSuccess = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVX_Settlement_PhaseResult' by default constructor.");
        return;
    }
    FVM_PVX_Settlement_PhaseResult(const FVM_PVX_Settlement_PhaseResult &inout Other)
    {
        this.m_LocalPlayerFaction = EFaction(1);
        this.m_bIsSuccess = false;
        this.m_LocalPlayerFaction = Other.m_LocalPlayerFaction;
        this.m_bIsSuccess = Other.m_bIsSuccess;
        this.m_LocalPlayerInfo = Other.m_LocalPlayerInfo;
        this.m_RewardItems = Other.m_RewardItems;
        return;
    }
    FVM_PVX_Settlement_PhaseResult(const EFaction InLocalPlayerFaction, const bool InbIsSuccess)
    {
        this.m_LocalPlayerFaction = EFaction(1);
        this.m_bIsSuccess = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetLocalPlayerFaction(EFaction(InLocalPlayerFaction));
        this.SetbIsSuccess(InbIsSuccess);
        return;
    }
    FVM_PVX_Settlement_PhaseResult& opAssign(const FVM_PVX_Settlement_PhaseResult &inout Other)
    {
        this.m_LocalPlayerFaction = Other.m_LocalPlayerFaction;
        this.m_bIsSuccess = Other.m_bIsSuccess;
        this.m_LocalPlayerInfo = Other.m_LocalPlayerInfo;
        return Other.m_RewardItems;
    }
    void PostConstruct()
    {
        int local_52 = 0;
        FName local_114;
        int local_549 = 0;
        int local_573;
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (local_4.IsValid())
        {
            TMap<FECSEntity, FPVX_PlayerData> local_46 = ::FGameModeDataBridge::GetPVXPlayerInfoMap(local_4);
            if (local_46.Contains(this.GetContext().GetLocalPlayer()))
            {
                FECSEntity local_50 = this.GetContext().GetLocalPlayer();
                this.SetLocalPlayerInfo(TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>(::FVM_PVX_Settlement_PlayerInfo::Create(this.GetContext().Manager, this.GetContext().GetLocalPlayer(), local_52)));
                TMap<TDataObjectPtr<FItemConfig>, int> local_74;
                for (auto& local_88 : local_52.GetPendingSettlementEvents())
                {
                    FPVXGameModeFlowSettings local_532 = ::PVXGameModeUtils::GetFlowSettings();
                    if (local_532.PvxRewardArray.Find(local_114, local_88))
                    {
                        if (local_114.Reward)
                        {
                            TArrayConstIterator<FRewardEntry> local_538;
                            for (; local_538.CanProceed;)
                            {
                                const FRewardEntry& local_546 = local_538.Proceed();
                                int local_548 = local_74.FindOrAdd(local_546.Item);
                                local_549 = int(local_546.Count);
                                local_548 = (int(local_548) + local_549);
                            }
                        }
                    }
                }
                for (auto& local_568 : local_74)
                {
                    TEUIModelRef<FM_ItemData> local_570 = TEUIModelRef<FM_ItemData>(::FM_ItemData::Create(this.GetContext().Manager));
                    local_573 = local_549;
                    local_568.GetKey().SetConfig();
                    local_573.SetNum();
                    FVM_ComposableItem& local_576 = ::FVM_ComposableItem::Create(this.GetContext().Manager, local_570, EItemDisplayScenario(3));
                    ::ComposableItemUtility::SetItemCountText(local_576, FText::AsNumber(local_573, FNumberFormattingOptions::DefaultNoGrouping()));
                    this.GetModify_RewardItems().Add(TEUIModelRef<FVM_ComposableItem>(local_576));
                }
            }
        }
        return;
    }
    EFaction GetLocalPlayerFaction() const property
    {
        this.TrackPropertyRead(0);
        return this.m_LocalPlayerFaction;
    }
    void SetLocalPlayerFaction(const EFaction __Value) property
    {
        if (int(this.m_LocalPlayerFaction) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LocalPlayerFaction = __Value;
        return;
    }
    bool GetbIsSuccess() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsSuccess;
    }
    void SetbIsSuccess(const bool __Value) property
    {
        if (!(this.m_bIsSuccess) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsSuccess = __Value;
        return;
    }
    TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> GetLocalPlayerInfo() const property
    {
        this.TrackPropertyRead(2);
        return this.m_LocalPlayerInfo;
    }
    void SetLocalPlayerInfo(const TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> local_2;
        local_2 = this.m_LocalPlayerInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LocalPlayerInfo = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_ComposableItem>> GetRewardItems() const property
    {
        TArray<TEUIModelRef<FVM_ComposableItem>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ComposableItem>> GetModify_RewardItems() property
    {
        TArray<TEUIModelRef<FVM_ComposableItem>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRewardItems(const TArray<TEUIModelRef<FVM_ComposableItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RewardItems = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_Settlement_PhaseResult
{
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Settlement_PhaseResult> Self;

    __GeneratedProperties_FVM_PVX_Settlement_PhaseResult()
    {
        return;
    }
}

namespace FVM_PVX_Settlement_PhaseResult
{
FVM_PVX_Settlement_PhaseResult& Create(const UObject ContextObject, const EFaction LocalPlayerFaction, const bool bIsSuccess)
{
    return FVM_PVX_Settlement_PhaseResult::CreateByManager(EUIInternal::GetContextManager(ContextObject), bIsSuccess);
}
FVM_PVX_Settlement_PhaseResult CreateByManager(const UEUIManagerSubsystem Manager, const EFaction LocalPlayerFaction, const bool bIsSuccess)
{
    FVM_PVX_Settlement_PhaseResult __r;
    TEUIModelRef<FVM_PVX_Settlement_PhaseResult> local_6 = TEUIModelRef<FVM_PVX_Settlement_PhaseResult>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVX_Settlement_PhaseResult::ModelId, 0, LocalPlayerFaction, bIsSuccess));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "LocalPlayerInfo";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ComposableItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_Settlement_PhaseResult>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_Settlement_PhaseResult;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_Settlement_PhaseResult;
}
TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> __UIGetter_LocalPlayerInfo(const FVM_PVX_Settlement_PhaseResult &inout Model)
{
    return Model.GetLocalPlayerInfo();
}
TArray<TEUIModelRef<FVM_ComposableItem>> __UIGetter_RewardItems(const FVM_PVX_Settlement_PhaseResult &inout Model)
{
    return Model.GetRewardItems();
}
TEUIModelRef<FVM_PVX_Settlement_PhaseResult> __UIGetter_Self(const FVM_PVX_Settlement_PhaseResult &inout Model)
{
    return TEUIModelRef<FVM_PVX_Settlement_PhaseResult>(Model);
}
int __IndexOf_LocalPlayerFaction()
{
    return 0;
}
int __IndexOf_bIsSuccess()
{
    return 1;
}
int __IndexOf_LocalPlayerInfo()
{
    return 2;
}
int __IndexOf_RewardItems()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_PVX_Settlement_PhaseResult
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
