
namespace FMS_LevelInfo
{
    const int ModelId = 0;

}
struct FMS_LevelInfo : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> m_LevelInfoConfig;

    FMS_LevelInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_LevelInfo(const FMS_LevelInfo &inout Other)
    {
        this.m_LevelInfoConfig = Other.m_LevelInfoConfig;
        return;
    }
    FMS_LevelInfo& opAssign(const FMS_LevelInfo &inout Other)
    {
        return Other.m_LevelInfoConfig;
    }
    void PostConstruct()
    {
        this.RefreshLevelInfoConfig();
        return;
    }
    void OnCurrentLevelInfoConfigChanged(const FMsg_CurrentLevelInfoConfigChanged &inout Msg)
    {
        this.RefreshLevelInfoConfig();
        return;
    }
    void RefreshLevelInfoConfig()
    {
        this.SetLevelInfoConfig(::FLevelUtils::GetCurrentLevelInfoConfig(nullptr));
        return;
    }
    const TDataObjectPtr<FLevelInfoConfig> GetLevelInfoConfig() const property
    {
        const TDataObjectPtr<FLevelInfoConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FLevelInfoConfig> GetModify_LevelInfoConfig() property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLevelInfoConfig(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LevelInfoConfig = __Value;
        return;
    }
}

namespace FMS_LevelInfo
{
FMS_LevelInfo& Get(const UObject ContextObject)
{
    return FMS_LevelInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_LevelInfo GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_LevelInfo __r;
    TEUIModelRef<FMS_LevelInfo> local_6 = TEUIModelRef<FMS_LevelInfo>(EUIInternal::MakeModelWithManager(Manager, FMS_LevelInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnCurrentLevelInfoConfigChanged";
    local_14.MessageTypeName = "Msg_CurrentLevelInfoConfigChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_LevelInfo;
}
void __OnCurrentLevelInfoConfigChanged(FMS_LevelInfo &inout Model, const FMsg_CurrentLevelInfoConfigChanged &inout Message)
{
    Model.OnCurrentLevelInfoConfigChanged(Message);
    return;
}
int __IndexOf_LevelInfoConfig()
{
    return 0;
}
}
