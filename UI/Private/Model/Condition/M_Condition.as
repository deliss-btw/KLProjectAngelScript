
namespace FMS_Condition
{
    const int ModelId = 0;

}
struct FMsg_ConditionProgressUpdated : FEUIMessage
{
    UPROPERTY()
    TArray<uint> ChangedConditionIds;

    FMsg_ConditionProgressUpdated()
    {
        return;
    }
}

struct FMsg_SystemUnlockFromGS : FEUIMessage
{
    UPROPERTY()
    ESystemModule SystemModule;


}

struct FMS_Condition : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint, uint> m_ConditionProgressMap;

    FMS_Condition()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Condition(const FMS_Condition &inout Other)
    {
        this.m_ConditionProgressMap = Other.m_ConditionProgressMap;
        return;
    }
    FMS_Condition& opAssign(const FMS_Condition &inout Other)
    {
        return Other.m_ConditionProgressMap;
    }
    void OnGsConditionProgressNotify(const FPbGsConditionProgressNotify &inout Notify)
    {
        int local_29;
        int local_31;
        TArray<uint> local_4;
        int local_42 = 0;
        int local_6 = Notify.GetGsCondValues_Num();
        int local_7 = 0;
        for (; local_7 < local_6; ++local_7)
        {
            FPbUint32Pair local_18 = Notify.GetGsCondValues_Index(local_7);
            local_29 = local_18.GetFirst();
            local_31 = local_18.GetSecond();
            local_4.Add(local_29);
            if (this.GetConditionProgressMap().Contains(local_29))
            {
                this.GetModify_ConditionProgressMap()[local_29] = local_31;
                continue;
            }
            this.GetModify_ConditionProgressMap().Add(local_29, local_31);
        }
        if (local_4.Num() > 0)
        {
            FEUIModelRef local_40 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus);
            local_42.ChangedConditionIds.Append(local_4);
        }
        return;
    }
    uint GetConditionProgress(const uint ConditionId)
    {
        if (this.GetConditionProgressMap().Contains(ConditionId))
        {
            return this.GetConditionProgressMap()[ConditionId];
        }
        XWarning(ELog(58), FString().Append("GetConditionProgress ConditionId: ").Append(ConditionId).Append(" not found, progress value return 0!"));
        return 0;
    }
    bool IsConditionFinish(const FConditionConfig &inout ConditionConfig)
    {
        bool local_8 = false;
        int local_1 = int(ConditionConfig.DataId);
        int local_2 = this.GetConditionProgress(local_1);
        int local_4 = ConditionConfig.CmpValue;
        switch (int(ConditionConfig.CmpType))
        {
        case 1:
        {
            return (local_2 > 0);
        }
        case 2:
        {
            return (local_2 <= 0);
        }
        case 3:
        {
            return (local_2 > local_4);
        }
        case 4:
        {
            return (local_2 >= local_4);
        }
        case 5:
        {
            return (local_2 < local_4);
        }
        case 6:
        {
            return (local_2 <= local_4);
        }
        case 7:
        {
            return (local_2 == local_4);
        }
        case 8:
        {
            return (local_2 != local_4);
        }
        default:
        {
            XLog(ELog(58), FString().Append("IsConditionFinish Invalid cmp type: ").Append(ConditionConfig.CmpType).Append(" ConditionId: ").Append(local_1).Append(" ProgressValue: ").Append(local_2).Append(" TargetValue: ").Append(local_4));
            local_8 = false;
        }
        }
        return local_8;
    }
    bool IsServerConditionMet(const TDataObjectPtr<FServerConditionConfigBase> &inout CondConfig)
    {
        if (!(CondConfig))
        {
            return false;
        }
        CastTo local_30;
        if (local_30.opCall())
        {
            return this.IsConditionFinish();
        }
        CastTo local_82;
        if (local_82.opCall())
        {
            if (GetCondVec().Num() == 0)
            {
                return false;
            }
            if (0 == 2)
            {
                for (auto& local_124 : GetCondVec())
                {
                    local_124;
                    if (!(this.IsConditionFinish()))
                    {
                        return false;
                    }
                }
                return true;
            }
            for (auto& local_124 : GetCondVec())
            {
                local_124;
                if (this.IsConditionFinish())
                {
                    return true;
                }
            }
            return false;
        }
        return false;
    }
    bool AreAllServerConditionsMet(const TArray<TDataObjectPtr<FServerConditionConfigBase>> &inout Conds)
    {
        for (auto& local_16 : Conds)
        {
            if (!(this.IsServerConditionMet(local_16)))
            {
                return false;
            }
        }
        return true;
    }
    void CollectLeafConditionDataIds(const TDataObjectPtr<FServerConditionConfigBase> &inout Cond, TSet<uint> &inout OutIds)
    {
        if (!(Cond))
        {
            return;
        }
        CastTo local_30;
        if (local_30.opCall())
        {
            return;
        }
        CastTo local_82;
        if (local_82.opCall())
        {
            for (auto& local_120 : GetCondVec())
            {
                local_120;
            }
        }
        return;
    }
    const TMap<uint, uint> GetConditionProgressMap() const property
    {
        const TMap<uint, uint> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint, uint> GetModify_ConditionProgressMap() property
    {
        TMap<uint, uint> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetConditionProgressMap(const TMap<uint, uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ConditionProgressMap = __Value;
        return;
    }
}

namespace FMS_Condition
{
FMS_Condition& Get(const UObject ContextObject)
{
    return FMS_Condition::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Condition GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Condition __r;
    TEUIModelRef<FMS_Condition> local_6 = TEUIModelRef<FMS_Condition>(EUIInternal::MakeModelWithManager(Manager, FMS_Condition::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__OnGsConditionProgressNotify";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Condition;
}
void __OnGsConditionProgressNotify(FMS_Condition &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.OnGsConditionProgressNotify(FPbGsConditionProgressNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_ConditionProgressMap()
{
    return 0;
}
}
