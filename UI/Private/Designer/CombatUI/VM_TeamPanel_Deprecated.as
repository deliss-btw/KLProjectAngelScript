
namespace FVMS_TeamPanel
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnLeaveTeam = FEUIModelCallbackSignature();

}
struct FTeamUIPlayerInfo
{
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    uint PlayerUid;
    UPROPERTY()
    int SocialTeamMemberIdx = -1;


}

struct FVMS_TeamPanel : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    float32 m_TeamLinkEnergy;
    UPROPERTY()
    float32 m_TeamLinkEnergyRatio;
    UPROPERTY()
    bool m_bCanLeaveTeam;
    UPROPERTY()
    bool m_bHasExecuteBuff;
    UPROPERTY()
    float m_BuffDuration;
    UPROPERTY()
    int m_Stack;
    UPROPERTY()
    FBuffConfigRef m_ExecuteBuffRef;
    UPROPERTY()
    TArray<FEUIModelRef> m_TeamInfoList;

    FVMS_TeamPanel()
    {
        this.m_bHasExecuteBuff = false;
        this.m_BuffDuration = 0.0;
        this.m_Stack = 0;
        this.m_TeamLinkEnergy = 0.0f;
        this.m_TeamLinkEnergyRatio = 0.0f;
        this.m_bCanLeaveTeam = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_TeamPanel(const FVMS_TeamPanel &inout Other)
    {
        this.m_bHasExecuteBuff = false;
        this.m_BuffDuration = 0.0;
        this.m_Stack = 0;
        this.m_TeamLinkEnergy = 0.0f;
        this.m_TeamLinkEnergyRatio = 0.0f;
        this.m_bCanLeaveTeam = true;
        this.m_TeamLinkEnergy = Other.m_TeamLinkEnergy;
        this.m_TeamLinkEnergyRatio = Other.m_TeamLinkEnergyRatio;
        this.m_bCanLeaveTeam = Other.m_bCanLeaveTeam;
        this.m_bHasExecuteBuff = Other.m_bHasExecuteBuff;
        this.m_BuffDuration = Other.m_BuffDuration;
        this.m_Stack = int(Other.m_Stack);
        this.m_ExecuteBuffRef = Other.m_ExecuteBuffRef;
        this.m_TeamInfoList = Other.m_TeamInfoList;
        return;
    }
    FVMS_TeamPanel& opAssign(const FVMS_TeamPanel &inout Other)
    {
        this.m_TeamLinkEnergy = Other.m_TeamLinkEnergy;
        this.m_TeamLinkEnergyRatio = Other.m_TeamLinkEnergyRatio;
        this.m_bCanLeaveTeam = Other.m_bCanLeaveTeam;
        this.m_bHasExecuteBuff = Other.m_bHasExecuteBuff;
        this.m_BuffDuration = Other.m_BuffDuration;
        this.m_Stack = int(Other.m_Stack);
        this.m_ExecuteBuffRef = Other.m_ExecuteBuffRef;
        return Other.m_TeamInfoList;
    }
    void LoadConfigDefault(const FVMS_TeamPanelConfigDefault &inout InConfig)
    {
        this.SetExecuteBuffRef(InConfig.ExecuteBuffRef);
        return;
    }
    void PostConstruct()
    {
        this.SetbCanLeaveTeam(!(::FTeamUtils::IsSingleTeamWorld()));
        return;
    }
    void Tick()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        if ((local_4 == ENTITY_NULL))
        {
            return;
        }
        FECSEntity local_18 = FECSEntity(this.GetContext().GetLocalPlayer());
        this.GetModify_TeamInfoList().Empty(0);
        if (::FTeamUtils::IsSingleTeamWorld())
        {
            Get local_24;
            const FC_PlayerInTeam& local_26 = local_24.opCall();
            if (local_26)
            {
                FECSEntity local_30 = FECSEntity(local_26.GetTeamEntity());
                Get local_34;
                const FC_TeamInfo& local_36 = local_34.opCall();
                if (local_36)
                {
                    for (auto& local_50 : local_36.GetMembers())
                    {
                        local_50;
                        this.GetModify_TeamInfoList().Add(FEUIModelRef());
                    }
                }
            }
        }
        else
        {
            TArray<FTeamUIPlayerInfo> local_60 = ::GetTeamUIPlayerInfoList();
            for (auto& local_74 : local_60)
            {
                FVM_TeamInfo& local_78 = ::FVM_TeamInfo::Create(this.GetContext().Manager, local_74.PlayerEntity, int(local_74.PlayerUid));
                local_78.SetSocialTeamMemberIdx(int(local_74.SocialTeamMemberIdx));
                this.GetModify_TeamInfoList().Add(FEUIModelRef(local_78));
            }
        }
        const FC_BuffInstance& local_80 = FBuffUtils::GetBuffInstance(local_4, this.GetExecuteBuffRef());
        if (local_80)
        {
            this.SetbHasExecuteBuff(true);
            this.SetBuffDuration(local_80.GetDuration().ToSeconds());
            this.SetStack(local_80.GetStackCount());
        }
        else
        {
            this.SetbHasExecuteBuff(false);
        }
        return;
    }
    void OnLeaveTeam()
    {
        ::FSocialTeamUtils::ClientSendLeaveTeam(this.GetContext().GetLocalPlayer());
        return;
    }
    float32 GetTeamLinkEnergy() const property
    {
        float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_TeamLinkEnergy() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeamLinkEnergy(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamLinkEnergy = __Value;
        return;
    }
    const float32 GetTeamLinkEnergyRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_TeamLinkEnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTeamLinkEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TeamLinkEnergyRatio = __Value;
        return;
    }
    bool GetbCanLeaveTeam() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bCanLeaveTeam;
    }
    void SetbCanLeaveTeam(const bool __Value) property
    {
        if (!(this.m_bCanLeaveTeam) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bCanLeaveTeam = __Value;
        return;
    }
    bool GetbHasExecuteBuff() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bHasExecuteBuff;
    }
    void SetbHasExecuteBuff(const bool __Value) property
    {
        if (!(this.m_bHasExecuteBuff) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bHasExecuteBuff = __Value;
        return;
    }
    const float GetBuffDuration() const property
    {
        const float __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float GetModify_BuffDuration() property
    {
        float __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetBuffDuration(const float &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BuffDuration = __Value;
        return;
    }
    int GetStack() const property
    {
        this.TrackPropertyRead(5);
        return this.m_Stack;
    }
    void SetStack(const int __Value) property
    {
        if (this.m_Stack == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Stack = __Value;
        return;
    }
    const FBuffConfigRef GetExecuteBuffRef() const property
    {
        const FBuffConfigRef __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FBuffConfigRef GetModify_ExecuteBuffRef() property
    {
        FBuffConfigRef __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetExecuteBuffRef(const FBuffConfigRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ExecuteBuffRef = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetTeamInfoList() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_TeamInfoList() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetTeamInfoList(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_TeamInfoList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_TeamPanel
{
    UPROPERTY()
    TEUIModelRef<FVMS_TeamPanel> Self;

    __GeneratedProperties_FVMS_TeamPanel()
    {
        return;
    }
}

TArray<FTeamUIPlayerInfo> GetTeamUIPlayerInfoList()
{
    TArray<FTeamUIPlayerInfo> local_4;
    FClientSocialTeamInfo& local_6 = FSocialTeamUtils::ClientGetSocialTeamInfo();
    TArray<uint> local_10;
    TArray<FECSEntity> local_14;
    FSocialTeamUtils::GetAllPlayerUidInWorld(local_10, local_14);
    int local_15 = 0;
    for (; local_15 < local_6.Members.Num(); )
    {
        FTeamUIPlayerInfo local_24;
        local_24.PlayerUid = local_6.Members[local_15].MemberID;
        int local_17 = local_10.IndexOfByKey(local_24.PlayerUid);
        if (local_17 >= 0)
        {
            local_24.PlayerEntity = local_14[local_17];
        }
        else
        {
            local_24.PlayerEntity = ENTITY_NULL;
        }
        local_24.SocialTeamMemberIdx = local_15;
        local_4.Add(local_24);
        ++local_15;
    }
    return local_4;
}
namespace FVMS_TeamPanel
{
FVMS_TeamPanel& Get(const UObject ContextObject)
{
    return FVMS_TeamPanel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_TeamPanel GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_TeamPanel __r;
    TEUIModelRef<FVMS_TeamPanel> local_6 = TEUIModelRef<FVMS_TeamPanel>(EUIInternal::MakeModelWithManager(Manager, FVMS_TeamPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TeamLinkEnergy";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamLinkEnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanLeaveTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamInfoList";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_TeamPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_TeamPanel;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_TeamPanel;
}
void __Tick(FVMS_TeamPanel &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_TeamLinkEnergy(const FVMS_TeamPanel &inout Model)
{
    return Model.GetTeamLinkEnergy();
}
float32 __UIGetter_TeamLinkEnergyRatio(const FVMS_TeamPanel &inout Model)
{
    return Model.GetTeamLinkEnergyRatio();
}
bool __UIGetter_bCanLeaveTeam(const FVMS_TeamPanel &inout Model)
{
    return Model.GetbCanLeaveTeam();
}
TArray<FEUIModelRef> __UIGetter_TeamInfoList(const FVMS_TeamPanel &inout Model)
{
    return Model.GetTeamInfoList();
}
TEUIModelRef<FVMS_TeamPanel> __UIGetter_Self(const FVMS_TeamPanel &inout Model)
{
    return TEUIModelRef<FVMS_TeamPanel>(Model);
}
int __IndexOf_TeamLinkEnergy()
{
    return 0;
}
int __IndexOf_TeamLinkEnergyRatio()
{
    return 1;
}
int __IndexOf_bCanLeaveTeam()
{
    return 2;
}
int __IndexOf_bHasExecuteBuff()
{
    return 3;
}
int __IndexOf_BuffDuration()
{
    return 4;
}
int __IndexOf_Stack()
{
    return 5;
}
int __IndexOf_ExecuteBuffRef()
{
    return 6;
}
int __IndexOf_TeamInfoList()
{
    return 7;
}
}
namespace __GeneratedProperties_FVMS_TeamPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
