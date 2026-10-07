
namespace FMS_TrainingModel
{
    const int ModelId = 0;

}
struct FMsg_TrainingStateChanged : FEUIMessage
{
    FMsg_TrainingStateChanged()
    {
        return;
    }
}

struct FMsg_TrainingItemClicked : FEUIMessage
{
    UPROPERTY()
    uint TrainingId = 0;


}

struct FMS_TrainingModel : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint, uint> m_TrainingStateMap;
    UPROPERTY()
    TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> m_TrainingAvatarConfigMap;

    FMS_TrainingModel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_TrainingModel(const FMS_TrainingModel &inout Other)
    {
        this.m_TrainingStateMap = Other.m_TrainingStateMap;
        this.m_TrainingAvatarConfigMap = Other.m_TrainingAvatarConfigMap;
        return;
    }
    FMS_TrainingModel& opAssign(const FMS_TrainingModel &inout Other)
    {
        this.m_TrainingStateMap = Other.m_TrainingStateMap;
        return Other.m_TrainingAvatarConfigMap;
    }
    void PostConstruct()
    {
        this.BuildTrainingAvatarConfigCache();
        return;
    }
    void BuildTrainingAvatarConfigCache()
    {
        int local_87;
        this.GetModify_TrainingAvatarConfigMap().Empty(0);
        for (auto& local_22 : ::FAvatarPrefabConfig::GetAll())
        {
            int local_23 = int(local_22.DataId);
            TDataObjectPtr<FAvatarPrefabConfig> local_48 = ::FAvatarPrefabConfig::GetByDataId(local_23);
            if (!(local_48.IsSet()))
            {
                continue;
            }
            for (auto& local_86 : local_22.GetTrainingInfoConfigs())
            {
                if (!(local_86.IsSet()))
                {
                    continue;
                }
                local_87 = local_23;
                if (this.GetModify_TrainingAvatarConfigMap().Contains(local_87))
                {
                    XWarning(ELog(16), FString().Append("[M_Training] Duplicate TrainingInfo DataId=").Append(local_87).Append(" in Avatar DataId=").Append(local_22.DataId));
                    continue;
                }
                this.GetModify_TrainingAvatarConfigMap().Add(local_87, local_48);
            }
        }
        return;
    }
    void GS_EnterTrainingLevelReq(const uint TrainingId)
    {
        FPbEnterTrainingLevelReq local_4;
        local_4.SetDataId(TrainingId);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_OnEnterTrainingLevelRsp(const FPbEnterTrainingLevelRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(22), FString().Append("[GS_OnEnterTrainingLevelRsp] Retcode: ").Append(Rsp.GetRetcode()));
        }
        return;
    }
    void GS_OnTrainingDataNotify(const FPbTrainingDataNotify &inout Notify)
    {
        this.GetModify_TrainingStateMap().Empty(0);
        int local_3 = Notify.GetTrainingList_Num();
        int local_4 = 0;
        for (; local_4 < local_3; )
        {
            FPbTrainingStateInfo local_16 = Notify.GetTrainingList_Index(local_4);
            this.GetModify_TrainingStateMap().Add(local_16.GetDataId(), local_16.GetState());
            this.TryGenerateUnlockTrainingRedDot(local_16.GetDataId(), local_16.GetState());
            ++local_4;
        }
        FEUIModelRef local_34 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_34);
        return;
    }
    void GS_OnTrainingUpdateNotify(const FPbTrainingUpdateNotify &inout Notify)
    {
        int local_25;
        int local_2 = Notify.GetTrainingList_Num();
        int local_3 = 0;
        for (; local_3 < local_2; ++local_3)
        {
            FPbTrainingStateInfo local_14 = Notify.GetTrainingList_Index(local_3);
            local_25 = local_14.GetDataId();
            int local_26 = this.GetTrainingState(local_25);
            if (this.GetModify_TrainingStateMap().Contains(local_25))
            {
                this.GetModify_TrainingStateMap()[local_25] = local_14.GetState();
            }
            else
            {
                this.GetModify_TrainingStateMap().Add(local_25, local_14.GetState());
            }
            if (local_26 != 1 && (local_14.GetState() == 1))
            {
                this.TryGenerateUnlockTrainingRedDot(local_25, local_14.GetState());
            }
        }
        FEUIModelRef local_36 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_36);
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> FindAvatarConfigByTrainingId(const uint TrainingDataId)
    {
        if (this.GetTrainingAvatarConfigMap().Contains(TrainingDataId))
        {
            return this.GetTrainingAvatarConfigMap()[TrainingDataId];
        }
        return TDataObjectPtr<FAvatarPrefabConfig>();
    }
    void TryGenerateUnlockTrainingRedDot(const uint DataId, const uint State)
    {
        int local_1 = 0;
        if (State != 1)
        {
            return;
        }
        if (!(::FTrainingInfoConfig::GetByDataId(DataId).IsSet()))
        {
            return;
        }
        if (!(this.FindAvatarConfigByTrainingId(DataId).IsSet()))
        {
            return;
        }
        int64 local_78 = local_1;
        FMS_RedDotSystem& local_82 = ::FMS_RedDotSystem::Get(this.GetManager());
        int64 local_76 = DataId;
        local_82.GenerateSpecificRedDot(GameplayTags::RedDotSystem_AvatarTraining_UnlockTraining, local_76, 1, false);
        if (local_82.TryFindOrAddRedDotNode(FRedDotNodeData(GameplayTags::RedDotSystem_AvatarTraining, local_78)).IsValid())
        {
            local_82.GenerateSpecificRedDot(GameplayTags::RedDotSystem_AvatarTraining, local_78, 1, false);
            int64 local_76_2 = DataId;
            FRedDotNodeData(GameplayTags::RedDotSystem_AvatarTraining_UnlockTraining, local_76_2).AddChildNodeData();
        }
        else
        {
            XLog(ELog(16), FString().Append("[M_Training] TryGenerateUnlockTrainingRedDot ParentNode is INVALID AvatarId=").Append(local_78));
        }
        return;
    }
    uint GetTrainingState(const uint DataId)
    {
        if (this.GetTrainingStateMap().Contains(DataId))
        {
            return this.GetTrainingStateMap()[DataId];
        }
        return 0;
    }
    bool IsTrainingFinished(const uint DataId)
    {
        return (this.GetTrainingState(DataId) == 2);
    }
    bool IsTrainingUnlock(const TDataObjectPtr<FTrainingInfoConfig> &inout TrainingInfo)
    {
        int local_2 = 0;
        if (!(TrainingInfo.IsSet()))
        {
            return false;
        }
        return (this.GetTrainingState(local_2) >= 1);
    }
    int GetUnlockedTrainingCount(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
    {
        if (!(AvatarConfig.IsSet()))
        {
            return 0;
        }
        int local_3 = 0;
        for (auto& local_18 : GetTrainingInfoConfigs())
        {
            if (this.IsTrainingUnlock(local_18))
            {
                ++local_3;
            }
        }
        return local_3;
    }
    bool HasUnlockedTraining(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
    {
        return (this.GetUnlockedTrainingCount(AvatarConfig) > 0);
    }
    void ConsumeTrainingRedDot(const uint TrainingDataId)
    {
        int local_53 = 0;
        if (!(this.FindAvatarConfigByTrainingId(TrainingDataId).IsSet()))
        {
            return;
        }
        int64 local_56 = local_53;
        FMS_RedDotSystem& local_60 = ::FMS_RedDotSystem::Get(this.GetManager());
        int64 local_52 = TrainingDataId;
        local_60.ConsumeRedDot(FRedDotNodeData(GameplayTags::RedDotSystem_AvatarTraining_UnlockTraining, local_52));
        if (!(local_60.TryGetRedDotNodeModel(FRedDotNodeData(GameplayTags::RedDotSystem_AvatarTraining, local_56)).IsValid()))
        {
            return;
        }
        int64 local_52_2 = TrainingDataId;
        FRedDotNodeData(GameplayTags::RedDotSystem_AvatarTraining_UnlockTraining, local_52_2).RemoveChildNodeData();
        if (!(HasChildActivation()))
        {
            GetCount().DecreaseCount();
            local_60.ConsumeRedDot(FRedDotNodeData(GameplayTags::RedDotSystem_AvatarTraining, local_56));
        }
        else
        {
            1.DecreaseCount();
        }
        return;
    }
    const TMap<uint, uint> GetTrainingStateMap() const property
    {
        const TMap<uint, uint> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint, uint> GetModify_TrainingStateMap() property
    {
        TMap<uint, uint> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTrainingStateMap(const TMap<uint, uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TrainingStateMap = __Value;
        return;
    }
    const TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> GetTrainingAvatarConfigMap() const property
    {
        const TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> GetModify_TrainingAvatarConfigMap() property
    {
        TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTrainingAvatarConfigMap(const TMap<uint, TDataObjectPtr<FAvatarPrefabConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TrainingAvatarConfigMap = __Value;
        return;
    }
}

namespace FMS_TrainingModel
{
FMS_TrainingModel& Get(const UObject ContextObject)
{
    return FMS_TrainingModel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_TrainingModel GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_TrainingModel __r;
    TEUIModelRef<FMS_TrainingModel> local_6 = TEUIModelRef<FMS_TrainingModel>(EUIInternal::MakeModelWithManager(Manager, FMS_TrainingModel::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnEnterTrainingLevelRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnTrainingDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnTrainingUpdateNotify";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_TrainingModel;
}
void __GS_OnEnterTrainingLevelRsp(FMS_TrainingModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnEnterTrainingLevelRsp(FPbEnterTrainingLevelRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTrainingDataNotify(FMS_TrainingModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTrainingDataNotify(FPbTrainingDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTrainingUpdateNotify(FMS_TrainingModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTrainingUpdateNotify(FPbTrainingUpdateNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_TrainingStateMap()
{
    return 0;
}
int __IndexOf_TrainingAvatarConfigMap()
{
    return 1;
}
}
