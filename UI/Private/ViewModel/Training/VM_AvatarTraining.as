
namespace FVM_AvatarTraining
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelectIndexChanged = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnTrainingRewardDialogClosed = FEUIModelCallbackSignature();

}
struct FVM_AvatarTraining : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    TArray<FEUIModelContainer> m_TrainingList;
    UPROPERTY()
    int m_SelectedIndex;
    UPROPERTY()
    bool bRewardDialogOpen;
    UPROPERTY()
    uint PendingTrainingId;

    FVM_AvatarTraining()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarTraining(const FVM_AvatarTraining &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarTraining(const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarTraining opAssign(const FVM_AvatarTraining &inout Other)
    {
        FVM_AvatarTraining __r;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_TrainingList = Other.m_TrainingList;
        this.m_SelectedIndex = int(Other.m_SelectedIndex);
        return __r;
    }
    void PostConstruct()
    {
        this.GenerateTrainingList();
        return;
    }
    void OnSelectIndexChanged(const int Index)
    {
        XLog(ELog(16), FString().Append("FVM_AvatarTraining OnSelectIndexChanged=").Append(Index));
        if (this.GetSelectedIndex() != Index)
        {
            this.SetSelectedIndex(Index);
        }
        return;
    }
    void OnTrainingStateChanged(const FMsg_TrainingStateChanged &inout Msg)
    {
        this.GenerateTrainingList();
        return;
    }
    void OnTrainingItemClicked(const FMsg_TrainingItemClicked &inout Msg)
    {
        int local_1 = int(Msg.TrainingId);
        if (local_1 == 0 || !(this.GetAvatarConfig().IsSet()))
        {
            return;
        }
        TDataObjectPtr<FTrainingInfoConfig> local_28;
        for (auto& local_42 : GetTrainingInfoConfigs())
        {
            if (local_42.IsSet() && (local_1 == int(Msg.TrainingId)))
            {
                local_28 = local_42;
                break;
            }
        }
        if (!(local_28.IsSet()))
        {
            return;
        }
        this.OpenTrainingReward(local_28);
        return;
    }
    void OpenTrainingReward(const TDataObjectPtr<FTrainingInfoConfig> &inout TrainingInfo)
    {
        int local_2 = 0;
        int local_1 = local_2;
        ::FMS_TrainingModel::Get(this.GetManager()).ConsumeTrainingRedDot(local_1);
        if (!(GetFinishReward().IsSet()))
        {
            this.TryEnterTrainingLevel(local_1);
            return;
        }
        if (this.bRewardDialogOpen)
        {
            return;
        }
        UTrainingSettings local_58 = ::TrainingSetting::Get();
        if ((!((local_58 != nullptr))))
        {
            return;
        }
        bool local_53 = ::FMS_TrainingModel::Get(this.GetManager()).IsTrainingFinished(local_1);
        TDataObjectPtr<FKLTextData> local_68;
        ::FCommonRewardListBuilder::BuildFromRewardConfig(local_68);
        FText local_84;
        if (local_53)
        {
            local_84 = ::ChatSystemUtil::ResolveKLTextData(local_58.TrainingRewardClaimedDescTextData);
        }
        else
        {
            local_84 = ::ChatSystemUtil::ResolveKLTextData(local_58.TrainingRewardPreviewDescTextData);
        }
        this.bRewardDialogOpen = true;
        this.PendingTrainingId = local_1;
        FDialogModelCallback local_110;
        local_110.Bind(this, FVM_AvatarTraining::OnTrainingRewardDialogClosed);
        TDataObjectPtr<FKLTextData> local_72;
        ::ChatSystemUtil::ResolveKLTextData(local_72);
        ::ChatSystemUtil::ResolveKLTextData(local_58.TrainingDialogConfirmTextTextData);
        FText local_80 = local_84;
        ::ChatSystemUtil::ResolveKLTextData(local_58.TrainingDialogTitleTextData);
        return;
    }
    bool OnTrainingRewardDialogClosed(const FCommonDialogAnswer &inout Answer)
    {
        this.bRewardDialogOpen = false;
        if (int(Answer.AnswerType) == 1)
        {
            this.TryEnterTrainingLevel(this.PendingTrainingId);
        }
        this.PendingTrainingId = 0;
        return true;
    }
    void TryEnterTrainingLevel(const uint TrainingId)
    {
        if (TrainingId == 0)
        {
            return;
        }
        ::FMS_TrainingModel::Get(this.GetManager()).GS_EnterTrainingLevelReq(TrainingId);
        return;
    }
    void GenerateTrainingList()
    {
        int local_24 = 0;
        this.GetModify_TrainingList().Reset(0);
        if (!(this.GetAvatarConfig().IsSet()))
        {
            this.SetSelectedIndex(INDEX_NONE);
            return;
        }
        FMS_TrainingModel& local_6 = ::FMS_TrainingModel::Get(this.GetManager());
        for (auto& local_20 : GetTrainingInfoConfigs())
        {
            if (!(local_20.IsSet()))
            {
                continue;
            }
            if (!(local_6.IsTrainingUnlock(local_20)))
            {
                continue;
            }
            FVM_TrainingItem& local_22 = ::FVM_TrainingItem::Create(this.GetManager(), local_20);
            int64 local_30 = local_24;
            FVM_RedDot& local_32 = ::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_AvatarTraining_UnlockTraining, local_30));
            FEUIModelContainer local_46;
            local_46.AddModel(FEUIModelRef(local_22), false);
            local_46.AddModel(FEUIModelRef(local_32), false);
            this.GetModify_TrainingList().Add(local_46);
        }
        if (this.GetTrainingList().Num() == 0)
        {
            this.SetSelectedIndex(INDEX_NONE);
            return;
        }
        if (this.GetSelectedIndex() < 0 || (this.GetSelectedIndex() >= this.GetTrainingList().Num()))
        {
            this.SetSelectedIndex(0);
        }
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarConfig = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetTrainingList() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_TrainingList() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTrainingList(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TrainingList = __Value;
        return;
    }
    int GetSelectedIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SelectedIndex;
    }
    void SetSelectedIndex(const int __Value) property
    {
        if (this.m_SelectedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarTraining
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarTraining> Self;

    __GeneratedProperties_FVM_AvatarTraining()
    {
        return;
    }
}

namespace FVM_AvatarTraining
{
FVM_AvatarTraining& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return FVM_AvatarTraining::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig);
}
FVM_AvatarTraining CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    FVM_AvatarTraining __r;
    TEUIModelRef<FVM_AvatarTraining> local_6 = TEUIModelRef<FVM_AvatarTraining>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarTraining::ModelId, 0, AvatarConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TrainingList";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarTraining>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarTraining;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnTrainingStateChanged";
    local_26.MessageTypeName = "Msg_TrainingStateChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnTrainingItemClicked";
    local_26.MessageTypeName = "Msg_TrainingItemClicked";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarTraining;
}
void __OnTrainingStateChanged(FVM_AvatarTraining &inout Model, const FMsg_TrainingStateChanged &inout Message)
{
    Model.OnTrainingStateChanged(Message);
    return;
}
void __OnTrainingItemClicked(FVM_AvatarTraining &inout Model, const FMsg_TrainingItemClicked &inout Message)
{
    Model.OnTrainingItemClicked(Message);
    return;
}
TArray<FEUIModelContainer> __UIGetter_TrainingList(const FVM_AvatarTraining &inout Model)
{
    return Model.GetTrainingList();
}
TEUIModelRef<FVM_AvatarTraining> __UIGetter_Self(const FVM_AvatarTraining &inout Model)
{
    return TEUIModelRef<FVM_AvatarTraining>(Model);
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
int __IndexOf_TrainingList()
{
    return 1;
}
int __IndexOf_SelectedIndex()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_AvatarTraining
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
