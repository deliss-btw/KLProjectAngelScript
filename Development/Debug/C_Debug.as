
enum ECheatContentType
{
    Undamageble,
    StateEndure,
    MaxCombatEnergy,
    SkillNoCD,
    FinalDamageRatio,
    PostureAttackRatio,
    BodyPartDamageRatio,
    AbnormalStateRatio,
    NotCostItem,
    StaminaNoCost,
}

const FConsoleCommand CVar_Debug_Player_Undamageble = FConsoleCommand();
const FConsoleCommand CVar_Debug_Player_StateEndure = FConsoleCommand();
const FConsoleCommand CVar_Debug_Player_FinalDamageRatio = FConsoleCommand();
const FConsoleCommand CVar_Debug_Player_PostureAttackRatio = FConsoleCommand();
const FConsoleCommand CVar_Debug_Player_BodyPartDamageRatio = FConsoleCommand();
namespace __INTENRAL_FC_CheatComponent_NS
{
    const TECSComponentDerivedPtr<FC_CheatComponent> DerivedPtr = TECSComponentDerivedPtr<FC_CheatComponent>();
    const FC_CheatComponent DefaultValue = FC_CheatComponent();
}
namespace __INTENRAL_FCS_CheatManager_NS
{
    const TECSComponentDerivedPtr<FCS_CheatManager> DerivedPtr = TECSComponentDerivedPtr<FCS_CheatManager>();
    const FCS_CheatManager DefaultValue = FCS_CheatManager();

}
struct FC_CheatComponent : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bUndamageble;
    UPROPERTY()
    bool m_bStateEndure;
    UPROPERTY()
    bool m_bMaxCombatEnergy;
    UPROPERTY()
    bool m_bSkillNoCD;
    UPROPERTY()
    bool m_bStaminaNoCost;
    UPROPERTY()
    bool m_bHasNoCDBuff;
    UPROPERTY()
    float32 m_FinalDamageRatio;
    UPROPERTY()
    float32 m_PostureAttackRatio;
    UPROPERTY()
    float32 m_BodyPartDamageRatio;
    UPROPERTY()
    float32 m_AbnormalStateRatio;
    UPROPERTY()
    bool m_bNotCostItem;

    FC_CheatComponent()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CheatComponent(const FC_CheatComponent &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CheatComponent opAssign(const FC_CheatComponent &inout Other)
    {
        FC_CheatComponent __r;
        this.SetbUndamageble(Other.GetbUndamageble());
        this.SetbStateEndure(Other.GetbStateEndure());
        this.SetbMaxCombatEnergy(Other.GetbMaxCombatEnergy());
        this.SetbSkillNoCD(Other.GetbSkillNoCD());
        this.SetbStaminaNoCost(Other.GetbStaminaNoCost());
        this.SetbHasNoCDBuff(Other.GetbHasNoCDBuff());
        this.SetFinalDamageRatio(Other.GetFinalDamageRatio());
        this.SetPostureAttackRatio(Other.GetPostureAttackRatio());
        this.SetBodyPartDamageRatio(Other.GetBodyPartDamageRatio());
        this.SetAbnormalStateRatio(Other.GetAbnormalStateRatio());
        this.SetbNotCostItem(Other.GetbNotCostItem());
        return __r;
    }
    bool GetbUndamageble() const property
    {
        return this.m_bUndamageble;
    }
    void SetbUndamageble(const bool __Value) property
    {
        if (!(this.m_bUndamageble) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bUndamageble = __Value;
        return;
    }
    bool GetbStateEndure() const property
    {
        return this.m_bStateEndure;
    }
    void SetbStateEndure(const bool __Value) property
    {
        if (!(this.m_bStateEndure) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bStateEndure = __Value;
        return;
    }
    bool GetbMaxCombatEnergy() const property
    {
        return this.m_bMaxCombatEnergy;
    }
    void SetbMaxCombatEnergy(const bool __Value) property
    {
        if (!(this.m_bMaxCombatEnergy) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bMaxCombatEnergy = __Value;
        return;
    }
    bool GetbSkillNoCD() const property
    {
        return this.m_bSkillNoCD;
    }
    void SetbSkillNoCD(const bool __Value) property
    {
        if (!(this.m_bSkillNoCD) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bSkillNoCD = __Value;
        return;
    }
    bool GetbStaminaNoCost() const property
    {
        return this.m_bStaminaNoCost;
    }
    void SetbStaminaNoCost(const bool __Value) property
    {
        if (!(this.m_bStaminaNoCost) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bStaminaNoCost = __Value;
        return;
    }
    bool GetbHasNoCDBuff() const property
    {
        return this.m_bHasNoCDBuff;
    }
    void SetbHasNoCDBuff(const bool __Value) property
    {
        if (!(this.m_bHasNoCDBuff) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bHasNoCDBuff = __Value;
        return;
    }
    float32 GetFinalDamageRatio() const property
    {
        return this.m_FinalDamageRatio;
    }
    void SetFinalDamageRatio(const float32 __Value) property
    {
        if (this.m_FinalDamageRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_FinalDamageRatio = __Value;
        return;
    }
    float32 GetPostureAttackRatio() const property
    {
        return this.m_PostureAttackRatio;
    }
    void SetPostureAttackRatio(const float32 __Value) property
    {
        if (this.m_PostureAttackRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_PostureAttackRatio = __Value;
        return;
    }
    float32 GetBodyPartDamageRatio() const property
    {
        return this.m_BodyPartDamageRatio;
    }
    void SetBodyPartDamageRatio(const float32 __Value) property
    {
        if (this.m_BodyPartDamageRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_BodyPartDamageRatio = __Value;
        return;
    }
    float32 GetAbnormalStateRatio() const property
    {
        return this.m_AbnormalStateRatio;
    }
    void SetAbnormalStateRatio(const float32 __Value) property
    {
        if (this.m_AbnormalStateRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_AbnormalStateRatio = __Value;
        return;
    }
    bool GetbNotCostItem() const property
    {
        return this.m_bNotCostItem;
    }
    void SetbNotCostItem(const bool __Value) property
    {
        if (!(this.m_bNotCostItem) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bNotCostItem = __Value;
        return;
    }
}

struct FCS_CheatManager : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bUndamageble;

    FCS_CheatManager()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_CheatManager(const FCS_CheatManager &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_CheatManager opAssign(const FCS_CheatManager &inout Other)
    {
        FCS_CheatManager __r;
        this.SetbUndamageble(Other.GetbUndamageble());
        return __r;
    }
    bool GetbUndamageble() const property
    {
        return this.m_bUndamageble;
    }
    void SetbUndamageble(const bool __Value) property
    {
        if (!(this.m_bUndamageble) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bUndamageble = __Value;
        return;
    }
}

namespace FCheatUtils
{
void SyncCheatPlayerContent(const ECheatContentType CheatType, const FECSEntity &inout Entity, const float32 Value)
{
    bool local_2;
    bool local_9;
    bool local_17;
    bool local_19;
    int local_22 = 0;
    bool local_35;
    bool local_36;
    bool local_1 = false;
    bool local_3 = false;
    Has local_8;
    if (Entity.IsValid() && !(local_8.opCall()))
    {
        local_1 = true;
        Has local_14;
        local_3 = local_14.opCall();
    }
    if (!(local_1))
    {
        return;
    }
    switch (int(CheatType))
    {
    case 0:
    {
        local_9 = Value != 0.0f && true;
        local_19 = true;
        if (ECS::GetRuntimeInfo().IsClient && local_3)
        {
            local_2 = !(local_9);
            if (!(local_22.GetbUndamageble()) == local_2)
            {
                local_19 = false;
            }
        }
        local_17 = ECS::GetRuntimeInfo().IsServer;
        if (local_17 && local_3)
        {
            local_2 = !(local_9);
            if (!(local_22.GetbUndamageble()) == local_2)
            {
                local_19 = false;
            }
        }
        if (local_19)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLEnableServerPlayerUnDamageble ").Append(Entity.GetIdValue()).Append(" ").Append(local_9 ? 1 : 0));
        }
        return;
    }
    case 1:
    {
        local_17 = Value != 0.0f && true;
        local_9 = true;
        if (ECS::GetRuntimeInfo().IsClient && local_3)
        {
            local_19 = !(local_17);
            if (!(local_22.GetbStateEndure()) == local_19)
            {
                local_9 = false;
            }
        }
        local_2 = ECS::GetRuntimeInfo().IsServer;
        if (local_2 && local_3)
        {
            local_19 = !(local_17);
            if (!(local_22.GetbStateEndure()) == local_19)
            {
                local_9 = false;
            }
        }
        if (local_9)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLEnableServerPlayerStateEndure ").Append(Entity.GetIdValue()).Append(" ").Append(local_17 ? 1 : 0));
        }
        return;
    }
    case 2:
    {
        local_19 = (Value != 0.0f);
        local_17 = true;
        local_2 = ECS::GetRuntimeInfo().IsClient;
        if (local_2 && local_3)
        {
            local_2 = !(local_19);
            if (!(local_22.GetbMaxCombatEnergy()) == local_2)
            {
                local_17 = false;
            }
        }
        local_9 = ECS::GetRuntimeInfo().IsServer;
        if (local_9 && local_3)
        {
            local_2 = !(local_19);
            if (!(local_22.GetbMaxCombatEnergy()) == local_2)
            {
            }
        }
        if (!(local_19) && !(local_3))
        {
            local_17 = false;
        }
        if (local_17)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLEnableServerPlayerMaxCombatEnergy ").Append(Entity.GetIdValue()).Append(" ").Append(local_19 ? 1 : 0));
        }
        return;
    }
    case 3:
    {
        local_9 = (Value != 0.0f);
        local_19 = true;
        if (ECS::GetRuntimeInfo().IsClient && local_3)
        {
            if (local_22.GetbHasNoCDBuff())
            {
                local_35 = true;
            }
            else
            {
                local_17 = !(local_22.GetbSkillNoCD());
                local_17 = (local_17 == !(local_9));
                local_35 = local_17;
            }
            if (local_35)
            {
                local_19 = false;
            }
        }
        if (ECS::GetRuntimeInfo().IsServer && local_3)
        {
            if (local_22.GetbHasNoCDBuff() || ((!(local_22.GetbSkillNoCD()) == !(local_9))))
            {
            }
        }
        local_2 = !(local_9);
        if (local_2 && !(local_3))
        {
            local_19 = false;
        }
        if (local_19)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLEnableServerPlayerSkillNoCD ").Append(Entity.GetIdValue()).Append(" ").Append(local_9 ? 1 : 0));
        }
        return;
    }
    case 9:
    {
        local_36 = (Value != 0.0f);
        local_9 = true;
        if (ECS::GetRuntimeInfo().IsClient && local_3)
        {
            local_2 = !(local_36);
            if (!(local_22.GetbStaminaNoCost()) == local_2)
            {
                local_9 = false;
            }
        }
        local_17 = ECS::GetRuntimeInfo().IsServer;
        if (local_17 && local_3)
        {
            local_19 = !(local_36);
            if (!(local_22.GetbStaminaNoCost()) == local_19)
            {
            }
        }
        if (!(local_36) && !(local_3))
        {
            local_9 = false;
        }
        if (local_9)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLEnableServerPlayerStaminaNoCost ").Append(Entity.GetIdValue()).Append(" ").Append(local_36 ? 1 : 0));
        }
        return;
    }
    case 4:
    {
        local_9 = true;
        if (ECS::GetRuntimeInfo().IsClient && local_3)
        {
            if (local_22.GetFinalDamageRatio() == Value)
            {
                local_9 = false;
            }
        }
        if (ECS::GetRuntimeInfo().IsServer && local_3)
        {
            if (local_22.GetFinalDamageRatio() == Value)
            {
                local_9 = false;
            }
        }
        if (local_9)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLSetServerPlayerFinalDamageRatio ").Append(Entity.GetIdValue()).Append(" ").Append(Value), nullptr);
        }
        return;
    }
    case 5:
    {
        local_36 = true;
        if (ECS::GetRuntimeInfo().IsClient && local_3)
        {
            if (local_22.GetPostureAttackRatio() == Value)
            {
                local_36 = false;
            }
        }
        if (ECS::GetRuntimeInfo().IsServer && local_3)
        {
            if (local_22.GetPostureAttackRatio() == Value)
            {
                local_36 = false;
            }
        }
        if (local_36)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLSetServerPlayerPostureAttackRatio ").Append(Entity.GetIdValue()).Append(" ").Append(Value), nullptr);
        }
        return;
    }
    case 6:
    {
        local_9 = true;
        local_19 = ECS::GetRuntimeInfo().IsClient;
        if (local_19 && local_3)
        {
            if (local_22.GetBodyPartDamageRatio() == Value)
            {
                local_9 = false;
            }
        }
        local_2 = ECS::GetRuntimeInfo().IsServer;
        if (local_2 && local_3)
        {
            if (local_22.GetBodyPartDamageRatio() == Value)
            {
                local_9 = false;
            }
        }
        if (local_9)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLSetServerPlayerBodyPartDamageRatio ").Append(Entity.GetIdValue()).Append(" ").Append(Value), nullptr);
        }
        return;
    }
    case 7:
    {
        local_36 = true;
        local_19 = ECS::GetRuntimeInfo().IsClient;
        if (local_19 && local_3)
        {
            if (local_22.GetAbnormalStateRatio() == Value)
            {
                local_36 = false;
            }
        }
        if (ECS::GetRuntimeInfo().IsServer && local_3)
        {
            if (local_22.GetAbnormalStateRatio() == Value)
            {
                local_36 = false;
            }
        }
        if (local_36)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLSetServerPlayerAbnormalStateRatio ").Append(Entity.GetIdValue()).Append(" ").Append(Value), nullptr);
        }
        return;
    }
    case 8:
    {
        local_2 = (Value != 0.0f);
        local_36 = true;
        local_19 = ECS::GetRuntimeInfo().IsClient;
        if (local_19 && local_3)
        {
            local_19 = !(local_2);
            if (!(local_22.GetbNotCostItem()) == local_19)
            {
                local_36 = false;
            }
        }
        if (ECS::GetRuntimeInfo().IsServer && local_3)
        {
            if (!(local_22.GetbNotCostItem()) == !(local_2))
            {
                local_36 = false;
            }
        }
        if (local_36)
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLSetServerPlayerNotCostItem ").Append(Entity.GetIdValue()).Append(" ").Append(local_2 ? 1 : 0));
        }
        return;
    }
    }
    return;
}
}
void CMD_Player_Undamageble(const TArray<FString> &inout Arguments)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void CMD_Player_StateEndure(const TArray<FString> &inout Arguments)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void CMD_Player_FinalDamageRatio(const TArray<FString> &inout Arguments)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void CMD_Player_PostureAttackRatio(const TArray<FString> &inout Arguments)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void CMD_Player_BodyPartDamageRatio(const TArray<FString> &inout Arguments)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
namespace ECSFunc_FC_CheatComponent
{
UFUNCTION()
bool HasCheatComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CheatComponent);
}
FC_CheatComponent& AssignCheatComponent(const FECSEntity &inout Entity, const FC_CheatComponent &inout DefaultValue = FC_CheatComponent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CheatComponent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCheatComponent_BP(const FECSEntity &inout Entity, const FC_CheatComponent &inout DefaultValue = FC_CheatComponent())
{
    ECSFunc_FC_CheatComponent::AssignCheatComponent(Entity, DefaultValue);
    return;
}
FC_CheatComponent& ModifyCheatComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CheatComponent));
    return local_12.GetComp();
}
FC_CheatComponent& ModifyOrAddCheatComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CheatComponent));
    return local_12.GetComp();
}
const FC_CheatComponent& GetCheatComponent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CheatComponent));
    return local_12.GetComp();
}
UFUNCTION()
FC_CheatComponent GetCheatComponent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CheatComponent& local_4 = ECSFunc_FC_CheatComponent::GetCheatComponent(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CheatComponent();
}
const FC_CheatComponent GetDefaultedCheatComponent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CheatComponent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CheatComponent);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_CheatComponent GetDefaultedCheatComponent_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CheatComponent::GetDefaultedCheatComponent(Entity);
}
UFUNCTION()
bool RemoveCheatComponent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CheatComponent);
}
}
FECSMonitorRuntimeView __GetMonitorCheatComponentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CheatComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCheatComponentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CheatComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCheatComponentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CheatComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCheatComponentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CheatComponent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCheatComponentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CheatComponent, bFixedFrame, bMustHandleAll);
}
void __MonitorCheatComponentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CheatComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCheatComponentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CheatComponent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCheatComponentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CheatComponent, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CheatManager
{
UFUNCTION()
bool HasCheatManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CheatManager);
}
FCS_CheatManager& AssignCheatManager(const FECSWorldPtr &inout World, const FCS_CheatManager &inout DefaultValue = FCS_CheatManager())
{
    UScriptStruct local_6 = FCS_CheatManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCheatManager_BP(const FECSWorldPtr &inout World, const FCS_CheatManager &inout DefaultValue = FCS_CheatManager())
{
    ECSFunc_FCS_CheatManager::AssignCheatManager(World, DefaultValue);
    return;
}
FCS_CheatManager& ModifyCheatManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CheatManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CheatManager& ModifyOrAddCheatManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CheatManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CheatManager& GetCheatManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CheatManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CheatManager GetCheatManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CheatManager& local_4 = ECSFunc_FCS_CheatManager::GetCheatManager(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CheatManager();
}
const FCS_CheatManager GetDefaultedCheatManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CheatManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CheatManager);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CheatManager GetDefaultedCheatManager_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CheatManager::GetDefaultedCheatManager(World);
}
UFUNCTION()
bool RemoveCheatManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CheatManager);
}
}
void __MonitorCheatManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CheatManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCheatManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CheatManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCheatManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CheatManager, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_CheatComponent &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_CheatComponent &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CheatComponent &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CheatComponent
{
int __IndexOf_bUndamageble()
{
    return 0;
}
int __IndexOf_bStateEndure()
{
    return 1;
}
int __IndexOf_bMaxCombatEnergy()
{
    return 2;
}
int __IndexOf_bSkillNoCD()
{
    return 3;
}
int __IndexOf_bStaminaNoCost()
{
    return 4;
}
int __IndexOf_bHasNoCDBuff()
{
    return 5;
}
int __IndexOf_FinalDamageRatio()
{
    return 6;
}
int __IndexOf_PostureAttackRatio()
{
    return 7;
}
int __IndexOf_BodyPartDamageRatio()
{
    return 8;
}
int __IndexOf_AbnormalStateRatio()
{
    return 9;
}
int __IndexOf_bNotCostItem()
{
    return 10;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_CheatManager &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_CheatManager &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_CheatManager &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_CheatManager
{
int __IndexOf_bUndamageble()
{
    return 0;
}
}
