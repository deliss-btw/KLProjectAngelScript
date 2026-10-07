
namespace FVM_WorldMapInfo
{
    const int ModelId = 0;

}
struct FVM_WorldMapInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FMapConfig> m_MapConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TeammateInfo>> m_TeammatesInWorld;
    UPROPERTY()
    bool m_bIsModeEntrance;

    FVM_WorldMapInfo()
    {
        this.m_bIsModeEntrance = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_WorldMapInfo(const FVM_WorldMapInfo &inout Other)
    {
        this.m_bIsModeEntrance = false;
        this.m_MapConfig = Other.m_MapConfig;
        this.m_TeammatesInWorld = Other.m_TeammatesInWorld;
        this.m_bIsModeEntrance = Other.m_bIsModeEntrance;
        return;
    }
    FVM_WorldMapInfo opAssign(const FVM_WorldMapInfo &inout Other)
    {
        FVM_WorldMapInfo __r;
        this.m_MapConfig = Other.m_MapConfig;
        this.m_TeammatesInWorld = Other.m_TeammatesInWorld;
        this.m_bIsModeEntrance = Other.m_bIsModeEntrance;
        return __r;
    }
    void LoadConfig(const FConfigVM_WorldMapInfo &inout InConfig)
    {
        this.SetbIsModeEntrance(InConfig.bIsModeEntrance);
        this.SetMapConfig(InConfig.MapConfig);
        return;
    }
    void PostLoad()
    {
        this.UpdateTeammatesInWorld();
        return;
    }
    void OnSocialTeamInfoChanged(const FMsg_SocialTeamChanged &inout Msg)
    {
        this.UpdateTeammatesInWorld();
        return;
    }
    void UpdateTeammatesInWorld()
    {
        this.GetModify_TeammatesInWorld().Empty(0);
        if (!(this.GetMapConfig()))
        {
            return;
        }
        TEUIModelRef<FM_SocialTeam> local_4 = ::FMS_PlayerSocialTeamData::Get(this.GetContext().Manager).GetLocalPlayerTeam();
        if (!(local_4.IsValid()))
        {
            return;
        }
        for (auto& local_20 : local_4.opArrow().GetMembers())
        {
            bool local_2 = !(local_20.opArrow().GetPlayer().opArrow().IsLocalPlayer());
            if (!(local_2))
            {
                local_2 = false;
            }
            else
            {
                FDataObjectPtr local_70;
                TDataObjectPtr<FMapConfig> local_46 = local_20.opArrow().GetPlayer().opArrow().GetCurrentWorld();
                local_70;
                local_2 = (local_46 == local_70);
            }
            if (local_2)
            {
                this.GetModify_TeammatesInWorld().Add(TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(this.GetContext().Manager, local_20)));
            }
        }
        return;
    }
    ESlateVisibility GetSelfVisisbility() const
    {
        int local_7;
        if (this.GetbIsModeEntrance())
        {
            if (::FMS_SystemControl::Get(this.GetManager()).IsSystemUnlock(ESystemModule(5), false))
            {
                local_7 = 4;
            }
            else
            {
                local_7 = 1;
            }
            return ESlateVisibility(local_7);
        }
        return ESlateVisibility(4);
    }
    const TDataObjectPtr<FMapConfig> GetMapConfig() const property
    {
        const TDataObjectPtr<FMapConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FMapConfig> GetModify_MapConfig() property
    {
        TDataObjectPtr<FMapConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMapConfig(const TDataObjectPtr<FMapConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MapConfig = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TeammateInfo>> GetTeammatesInWorld() const property
    {
        const TArray<TEUIModelRef<FVM_TeammateInfo>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TeammateInfo>> GetModify_TeammatesInWorld() property
    {
        TArray<TEUIModelRef<FVM_TeammateInfo>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTeammatesInWorld(const TArray<TEUIModelRef<FVM_TeammateInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TeammatesInWorld = __Value;
        return;
    }
    bool GetbIsModeEntrance() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsModeEntrance;
    }
    void SetbIsModeEntrance(const bool __Value) property
    {
        if (!(this.m_bIsModeEntrance) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsModeEntrance = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_WorldMapInfo
{
    UPROPERTY()
    ESlateVisibility SelfVisisbility;
    UPROPERTY()
    TEUIModelRef<FVM_WorldMapInfo> Self;


}

namespace FVM_WorldMapInfo
{
FVM_WorldMapInfo& Create(const UObject ContextObject)
{
    return FVM_WorldMapInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_WorldMapInfo CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_WorldMapInfo __r;
    TEUIModelRef<FVM_WorldMapInfo> local_6 = TEUIModelRef<FVM_WorldMapInfo>(EUIInternal::MakeModelWithManager(Manager, FVM_WorldMapInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MapConfig";
    local_14.TypeName = "TDataObjectPtr<FMapConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeammatesInWorld";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TeammateInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelfVisisbility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WorldMapInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WorldMapInfo;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnSocialTeamInfoChanged";
    local_26.MessageTypeName = "Msg_SocialTeamChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WorldMapInfo;
}
void __OnSocialTeamInfoChanged(FVM_WorldMapInfo &inout Model, const FMsg_SocialTeamChanged &inout Message)
{
    Model.OnSocialTeamInfoChanged(Message);
    return;
}
TDataObjectPtr<FMapConfig> __UIGetter_MapConfig(const FVM_WorldMapInfo &inout Model)
{
    return Model.GetMapConfig();
}
TArray<TEUIModelRef<FVM_TeammateInfo>> __UIGetter_TeammatesInWorld(const FVM_WorldMapInfo &inout Model)
{
    return Model.GetTeammatesInWorld();
}
ESlateVisibility __UIGetter_SelfVisisbility(const FVM_WorldMapInfo &inout Model)
{
    return Model.GetSelfVisisbility();
}
TEUIModelRef<FVM_WorldMapInfo> __UIGetter_Self(const FVM_WorldMapInfo &inout Model)
{
    return TEUIModelRef<FVM_WorldMapInfo>(Model);
}
int __IndexOf_MapConfig()
{
    return 0;
}
int __IndexOf_TeammatesInWorld()
{
    return 1;
}
int __IndexOf_bIsModeEntrance()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_WorldMapInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
