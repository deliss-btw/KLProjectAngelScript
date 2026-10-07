
namespace FVM_DungeonEnterInteract
{
    const int ModelId = 0;

}
struct FVM_DungeonEnterInteract : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_MaxInteractPlayer;
    UPROPERTY()
    int m_CurInteractPlayer;
    UPROPERTY()
    TArray<FEUIModelContainer> m_InteractPosList;

    FVM_DungeonEnterInteract()
    {
        this.m_MaxInteractPlayer = 0;
        this.m_CurInteractPlayer = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DungeonEnterInteract' by default constructor.");
        return;
    }
    FVM_DungeonEnterInteract(const FVM_DungeonEnterInteract &inout Other)
    {
        this.m_MaxInteractPlayer = 0;
        this.m_CurInteractPlayer = 0;
        this.m_MaxInteractPlayer = int(Other.m_MaxInteractPlayer);
        this.m_CurInteractPlayer = int(Other.m_CurInteractPlayer);
        this.m_InteractPosList = Other.m_InteractPosList;
        return;
    }
    FVM_DungeonEnterInteract(const int InMaxInteractPlayer, const int InCurInteractPlayer)
    {
        this.m_MaxInteractPlayer = 0;
        this.m_CurInteractPlayer = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMaxInteractPlayer(InMaxInteractPlayer);
        this.SetCurInteractPlayer(InCurInteractPlayer);
        return;
    }
    FVM_DungeonEnterInteract& opAssign(const FVM_DungeonEnterInteract &inout Other)
    {
        this.m_MaxInteractPlayer = int(Other.m_MaxInteractPlayer);
        this.m_CurInteractPlayer = int(Other.m_CurInteractPlayer);
        return Other.m_InteractPosList;
    }
    void PostConstruct()
    {
        this.UpdateInteractPosList();
        return;
    }
    void Monitor_OnPlayerWaitReborn(const FC_LocalInteractWithTeam &inout InteractProgress)
    {
        if (InteractProgress)
        {
            this.SetCurInteractPlayer(int(InteractProgress.InteractEntityNum));
        }
        else
        {
            this.SetCurInteractPlayer(0);
        }
        this.UpdateInteractPosList();
        return;
    }
    void UpdateInteractPosList()
    {
        this.GetModify_InteractPosList().Empty(0);
        int local_2 = 0;
        for (; local_2 < this.GetMaxInteractPlayer(); )
        {
            FExecuteAvatarIconModelData local_8;
            FECSEntity local_18;
            if (this.GetCurInteractPlayer() > local_2)
            {
                local_18 = UECSFunctionLibraryExtension::GetLocalPlayerPawnEntity(__GetWorldContext());
            }
            else
            {
                local_18 = ENTITY_NULL;
            }
            local_8.Entity = local_18;
            FEUIModelContainer::MakeCached local_32;
            this.GetModify_InteractPosList().Add(local_32.opImplConv());
            ++local_2;
        }
        return;
    }
    int GetMaxInteractPlayer() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MaxInteractPlayer;
    }
    void SetMaxInteractPlayer(const int __Value) property
    {
        if (this.m_MaxInteractPlayer == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MaxInteractPlayer = __Value;
        return;
    }
    int GetCurInteractPlayer() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurInteractPlayer;
    }
    void SetCurInteractPlayer(const int __Value) property
    {
        if (this.m_CurInteractPlayer == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurInteractPlayer = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetInteractPosList() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_InteractPosList() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetInteractPosList(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_InteractPosList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_DungeonEnterInteract
{
    UPROPERTY()
    TEUIModelRef<FVM_DungeonEnterInteract> Self;

    __GeneratedProperties_FVM_DungeonEnterInteract()
    {
        return;
    }
}

namespace FVM_DungeonEnterInteract
{
FVM_DungeonEnterInteract& Create(const UObject ContextObject, const int MaxInteractPlayer, const int CurInteractPlayer)
{
    return FVM_DungeonEnterInteract::CreateByManager(EUIInternal::GetContextManager(ContextObject), MaxInteractPlayer, CurInteractPlayer);
}
FVM_DungeonEnterInteract CreateByManager(const UEUIManagerSubsystem Manager, const int MaxInteractPlayer, const int CurInteractPlayer)
{
    FVM_DungeonEnterInteract __r;
    TEUIModelRef<FVM_DungeonEnterInteract> local_6 = TEUIModelRef<FVM_DungeonEnterInteract>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DungeonEnterInteract::ModelId, 0, MaxInteractPlayer, CurInteractPlayer));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InteractPosList";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DungeonEnterInteract>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DungeonEnterInteract;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__Monitor_OnPlayerWaitReborn";
    local_26.ComponentType = FC_LocalInteractWithTeam;
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DungeonEnterInteract;
}
void __Monitor_OnPlayerWaitReborn(FVM_DungeonEnterInteract &inout Model, const FECSEntity &inout Entity, const FC_LocalInteractWithTeam &inout Component)
{
    Model.Monitor_OnPlayerWaitReborn(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FEUIModelContainer> __UIGetter_InteractPosList(const FVM_DungeonEnterInteract &inout Model)
{
    return Model.GetInteractPosList();
}
TEUIModelRef<FVM_DungeonEnterInteract> __UIGetter_Self(const FVM_DungeonEnterInteract &inout Model)
{
    return TEUIModelRef<FVM_DungeonEnterInteract>(Model);
}
int __IndexOf_MaxInteractPlayer()
{
    return 0;
}
int __IndexOf_CurInteractPlayer()
{
    return 1;
}
int __IndexOf_InteractPosList()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_DungeonEnterInteract
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
