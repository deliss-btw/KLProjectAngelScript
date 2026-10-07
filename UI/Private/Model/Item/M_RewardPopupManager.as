
namespace FMS_RewardPopupManager
{
    const int ModelId = 0;

}
struct FMS_RewardPopupManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<FRewardItemEntry> m_PendingDelayedRewards;
    UPROPERTY()
    FEUITimerHandle m_RewardPopupDelayTimer;

    FMS_RewardPopupManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_RewardPopupManager(const FMS_RewardPopupManager &inout Other)
    {
        this.m_PendingDelayedRewards = Other.m_PendingDelayedRewards;
        this.m_RewardPopupDelayTimer = Other.m_RewardPopupDelayTimer;
        return;
    }
    FMS_RewardPopupManager& opAssign(const FMS_RewardPopupManager &inout Other)
    {
        this.m_PendingDelayedRewards = Other.m_PendingDelayedRewards;
        return Other.m_RewardPopupDelayTimer;
    }
    void GS_OnRewardNotify(const FPbRewardNotify &inout Notify)
    {
        int local_49 = Notify.GetRewardId();
        GetDataObjectByGSDataId<FRewardConfig> local_48;
        TDataObjectPtr<FRewardConfig> local_24 = local_48.opImplConv();
        if (!(local_24))
        {
            XError(ELog(16), FString().Append("RewardConfig not found in client data table: ").Append(Notify.GetRewardId()));
            return;
        }
        if (int(local_24.opArrow().ClaimType) == 1)
        {
            TArray<FPbItem> local_112;
            Notify.GetRewardItemList(local_112);
            FCommonRewardListBuilder local_116;
            local_116.FromPbItems(local_112);
            FText local_132 = FText();
            FText local_136 = FText();
            TArray<FRewardItemEntry> local_120 = local_116.Build();
            FText local_124 = NSLOCTEXT("DefaultTitle", "иЋ·еѕ—");
            FDialogCallback local_168;
            ::CommonPopup::RewardDialog_Confirm(local_124, local_120, local_168, local_136, local_132, FText());
        }
        return;
    }
    void OnRewardPopupNotify(const FCE_RewardPopupNotify &inout Event)
    {
        int local_28 = 0;
        if (Event.Items.IsEmpty())
        {
            return;
        }
        FCommonRewardListBuilder local_6;
        for (auto& local_20 : Event.Items)
        {
            if (local_20.GetConfig())
            {
                local_6.AddItem(local_28, local_20.GetNumber(), FName(), FText(), false);
            }
        }
        TArray<FRewardItemEntry> local_36 = local_6.Build();
        if (local_36.IsEmpty())
        {
            return;
        }
        if (Event.DelaySeconds > 0.0f)
        {
            for (auto& local_52 : local_36)
            {
                this.GetModify_PendingDelayedRewards().Add(local_52);
            }
            if (!(this.IsTimerActive(this.GetRewardPopupDelayTimer())))
            {
                this.ScheduleCall(this.GetModify_RewardPopupDelayTimer(), n"ShowDelayedRewardPopup", Event.DelaySeconds);
            }
        }
        else
        {
            FDialogCallback local_96;
            ::CommonPopup::RewardDialog_Confirm(NSLOCTEXT("DefaultTitle", "иЋ·еѕ—"), local_36, local_96, FText(), FText(), FText());
        }
        return;
    }
    void ShowDelayedRewardPopup()
    {
        if (this.GetPendingDelayedRewards().IsEmpty())
        {
            return;
        }
        TArray<FRewardItemEntry> local_6 = this.GetPendingDelayedRewards();
        this.GetModify_PendingDelayedRewards().Reset(0);
        FText local_20 = FText();
        FText local_24 = FText();
        FText local_12 = NSLOCTEXT("DefaultTitle", "иЋ·еѕ—");
        FDialogCallback local_56;
        ::CommonPopup::RewardDialog_Confirm(local_12, local_6, local_56, local_24, local_20, FText());
        return;
    }
    const TArray<FRewardItemEntry> GetPendingDelayedRewards() const property
    {
        const TArray<FRewardItemEntry> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FRewardItemEntry> GetModify_PendingDelayedRewards() property
    {
        TArray<FRewardItemEntry> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPendingDelayedRewards(const TArray<FRewardItemEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PendingDelayedRewards = __Value;
        return;
    }
    const FEUITimerHandle GetRewardPopupDelayTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUITimerHandle GetModify_RewardPopupDelayTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRewardPopupDelayTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RewardPopupDelayTimer = __Value;
        return;
    }
}

namespace FMS_RewardPopupManager
{
FMS_RewardPopupManager& Get(const UObject ContextObject)
{
    return FMS_RewardPopupManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_RewardPopupManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_RewardPopupManager __r;
    TEUIModelRef<FMS_RewardPopupManager> local_6 = TEUIModelRef<FMS_RewardPopupManager>(EUIInternal::MakeModelWithManager(Manager, FMS_RewardPopupManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnRewardNotify";
    Result.ProtoRspDefines.Add(local_10);
    FEUIModelEventDefine local_18;
    local_18.FunctionName = "__OnRewardPopupNotify";
    local_18.EventType = FCE_RewardPopupNotify;
    Result.EventFunctions.Add(local_18);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_RewardPopupManager;
}
void __GS_OnRewardNotify(FMS_RewardPopupManager &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnRewardNotify(FPbRewardNotify::FromWrapper(ProtoWrapper));
    return;
}
void __OnRewardPopupNotify(FMS_RewardPopupManager &inout Model, const FCE_RewardPopupNotify &inout Event)
{
    Model.OnRewardPopupNotify(Event);
    return;
}
int __IndexOf_PendingDelayedRewards()
{
    return 0;
}
int __IndexOf_RewardPopupDelayTimer()
{
    return 1;
}
}
