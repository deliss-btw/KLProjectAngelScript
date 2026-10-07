
namespace FMS_Craft
{
    const int ModelId = 0;

}
struct FCraftResultItem
{
    UPROPERTY()
    int Num;
    UPROPERTY()
    uint ItemId;
    UPROPERTY()
    uint64 ItemGuid;

    FCraftResultItem(const FPbAddItemResult &inout PbResult)
    {
        this.Num = PbResult.GetAddCount();
        this.ItemId = PbResult.GetItemId();
        this.ItemGuid = PbResult.GetGuid();
        return;
    }
}

struct FMsg_CraftResult : FEUIMessage
{
    UPROPERTY()
    TArray<FCraftResultItem> Items;

    FMsg_CraftResult()
    {
        return;
    }
}

struct FMS_Craft : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TSet<uint> m_UnlockedCraftConfigs;
    UPROPERTY()
    uint m_LastSelectedCraftId;

    FMS_Craft()
    {
        this.m_LastSelectedCraftId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Craft(const FMS_Craft &inout Other)
    {
        this.m_LastSelectedCraftId = 0;
        this.m_UnlockedCraftConfigs = Other.m_UnlockedCraftConfigs;
        this.m_LastSelectedCraftId = int(Other.m_LastSelectedCraftId);
        return;
    }
    FMS_Craft opAssign(const FMS_Craft &inout Other)
    {
        FMS_Craft __r;
        this.m_UnlockedCraftConfigs = Other.m_UnlockedCraftConfigs;
        this.m_LastSelectedCraftId = int(Other.m_LastSelectedCraftId);
        return __r;
    }
    void GS_RequestCraft(const uint CraftId, const int CraftNum = 1) const
    {
        if (CraftNum > 0)
        {
            FPbDoCraftReq local_6;
            local_6.SetCraftId(CraftId);
            local_6.SetNum(CraftNum);
            this.SendProto(local_6.ToWrapper());
        }
        return;
    }
    void GS_OnDoCraftRsp(const FPbDoCraftRsp &inout CraftRsp)
    {
        int local_6 = 0;
        if (CraftRsp.GetRetcode() == 0)
        {
            FEUIModelRef local_12 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            int local_13 = 0;
            for (; local_13 < CraftRsp.GetResultList_Num(); )
            {
                local_6.Items.Add(FCraftResultItem(CraftRsp.GetResultList_Index(local_13)));
                ++local_13;
            }
        }
        return;
    }
    void GS_OnPlayerCraftDataNotify(const FPbPlayerCraftDataNotify &inout Notify)
    {
        this.GetModify_UnlockedCraftConfigs().Reset();
        int local_1 = 0;
        for (; local_1 < Notify.GetUnlockCraftList_Num(); )
        {
            this.AddUnlockedCraftConfig(Notify.GetUnlockCraftList_Index(local_1));
            ++local_1;
        }
        return;
    }
    void GS_OnCraftUnlock(const FPbCraftUnlockNotify &inout Notify)
    {
        const UUtilitySettings local_2;
        GetGameplaySettings<UUtilitySettings> local_4;
        local_2 = local_4;
        TArray<uint64> local_10;
        int local_11 = 0;
        for (; local_11 < Notify.GetUnlockCraftList_Num(); ++local_11)
        {
            int local_13 = Notify.GetUnlockCraftList_Index(local_11);
            if (!(this.GetUnlockedCraftConfigs().Contains(local_13)))
            {
                this.AddUnlockedCraftConfig(local_13);
                int64 local_18 = local_13;
                local_10.Add(local_18);
                if (local_2.CraftUnlockHint)
                {
                    GetDataObjectByGSDataId<FCraftConfig> local_68;
                    TDataObjectPtr<FCraftConfig> local_44 = local_68.opImplConv();
                    if (local_44)
                    {
                        TArray<FTextArgument> local_120;
                        Make local_126;
                        local_120.Add(local_126.opImplConv());
                        ::MessageHintUtils::ShowMessageHint(this.GetContext().GetLocalPlayer(), local_2.CraftUnlockHint, local_120);
                    }
                }
            }
        }
        this.GenerateRedDot(local_10);
        return;
    }
    void AddUnlockedCraftConfig(const uint ConfigId)
    {
        this.GetModify_UnlockedCraftConfigs().Add(ConfigId);
        return;
    }
    void GenerateRedDot(TArray<uint64> &inout RedDotList)
    {
        if (RedDotList.Num() == 0)
        {
            return;
        }
        int local_5 = RedDotList.Num() - 1;
        for (; local_5 >= 0; --local_5)
        {
            int local_32 = RedDotList[local_5];
            GetDataObjectByGSDataId<FCraftConfig> local_58;
            TDataObjectPtr<FCraftConfig> local_30 = local_58.opImplConv();
            if (!(local_30) || (int(local_30.opArrow().CraftType) != 2))
            {
                RedDotList.RemoveAt(local_5);
            }
        }
        ::FMS_RedDotSystem::Get(this.GetManager()).GenerateRedDot(ERedPointEvent(15), RedDotList);
        return;
    }
    const TSet<uint> GetUnlockedCraftConfigs() const property
    {
        const TSet<uint> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TSet<uint> GetModify_UnlockedCraftConfigs() property
    {
        TSet<uint> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetUnlockedCraftConfigs(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_UnlockedCraftConfigs = __Value;
        return;
    }
    uint GetLastSelectedCraftId() const property
    {
        this.TrackPropertyRead(1);
        return this.m_LastSelectedCraftId;
    }
    void SetLastSelectedCraftId(const uint __Value) property
    {
        if (this.m_LastSelectedCraftId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LastSelectedCraftId = __Value;
        return;
    }
}

namespace FMS_Craft
{
FMS_Craft& Get(const UObject ContextObject)
{
    return FMS_Craft::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Craft GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Craft __r;
    TEUIModelRef<FMS_Craft> local_6 = TEUIModelRef<FMS_Craft>(EUIInternal::MakeModelWithManager(Manager, FMS_Craft::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnDoCraftRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnPlayerCraftDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnCraftUnlock";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Craft;
}
void __GS_OnDoCraftRsp(FMS_Craft &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDoCraftRsp(FPbDoCraftRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnPlayerCraftDataNotify(FMS_Craft &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerCraftDataNotify(FPbPlayerCraftDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnCraftUnlock(FMS_Craft &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnCraftUnlock(FPbCraftUnlockNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_UnlockedCraftConfigs()
{
    return 0;
}
int __IndexOf_LastSelectedCraftId()
{
    return 1;
}
}
