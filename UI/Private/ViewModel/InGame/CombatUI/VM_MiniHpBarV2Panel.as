
namespace FVMS_MiniHpBarV2Panel
{
    const int ModelId = 0;

}
struct FMsg_ChangeMiniHpBarActive : FEUIMessage
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    bool bBarActive;


}

struct FMiniHpBarEntityHideState
{
    UPROPERTY()
    float HideTime = -1.0;
    UPROPERTY()
    bool bBarActive = true;


}

struct FVMS_MiniHpBarV2Panel : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    float32 m_HitShowMiniHpBarDistance;
    UPROPERTY()
    float32 m_HideMiniHpBarDistance;
    UPROPERTY()
    float32 m_DelayHideMiniHpBarSeconds;
    UPROPERTY()
    float32 m_AnimFadeOutSeconds;
    UPROPERTY()
    float32 m_EnemyAvatarAlwaysShowHpBarDistance;
    UPROPERTY()
    TArray<FECSEntity> m_Entities;
    UPROPERTY()
    TSet<FECSEntity> m_EntitySet;
    UPROPERTY()
    FECSEntity m_LockEntity;
    UPROPERTY()
    TArray<FECSEntity> m_PendingDeleteEntities;
    UPROPERTY()
    TMap<FECSEntity, FMiniHpBarEntityHideState> m_DelayHideEntities;

    FVMS_MiniHpBarV2Panel()
    {
        this.m_HitShowMiniHpBarDistance = 5000.0f;
        this.m_HideMiniHpBarDistance = 5000.0f;
        this.m_DelayHideMiniHpBarSeconds = 2.0f;
        this.m_AnimFadeOutSeconds = 0.2f;
        this.m_EnemyAvatarAlwaysShowHpBarDistance = 700.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_MiniHpBarV2Panel(const FVMS_MiniHpBarV2Panel &inout Other)
    {
        this.m_HitShowMiniHpBarDistance = 5000.0f;
        this.m_HideMiniHpBarDistance = 5000.0f;
        this.m_DelayHideMiniHpBarSeconds = 2.0f;
        this.m_AnimFadeOutSeconds = 0.2f;
        this.m_EnemyAvatarAlwaysShowHpBarDistance = 700.0f;
        this.m_HitShowMiniHpBarDistance = Other.m_HitShowMiniHpBarDistance;
        this.m_HideMiniHpBarDistance = Other.m_HideMiniHpBarDistance;
        this.m_DelayHideMiniHpBarSeconds = Other.m_DelayHideMiniHpBarSeconds;
        this.m_AnimFadeOutSeconds = Other.m_AnimFadeOutSeconds;
        this.m_EnemyAvatarAlwaysShowHpBarDistance = Other.m_EnemyAvatarAlwaysShowHpBarDistance;
        this.m_Entities = Other.m_Entities;
        this.m_EntitySet = Other.m_EntitySet;
        this.m_LockEntity = Other.m_LockEntity;
        this.m_PendingDeleteEntities = Other.m_PendingDeleteEntities;
        this.m_DelayHideEntities = Other.m_DelayHideEntities;
        return;
    }
    FVMS_MiniHpBarV2Panel& opAssign(const FVMS_MiniHpBarV2Panel &inout Other)
    {
        this.m_HitShowMiniHpBarDistance = Other.m_HitShowMiniHpBarDistance;
        this.m_HideMiniHpBarDistance = Other.m_HideMiniHpBarDistance;
        this.m_DelayHideMiniHpBarSeconds = Other.m_DelayHideMiniHpBarSeconds;
        this.m_AnimFadeOutSeconds = Other.m_AnimFadeOutSeconds;
        this.m_EnemyAvatarAlwaysShowHpBarDistance = Other.m_EnemyAvatarAlwaysShowHpBarDistance;
        this.m_Entities = Other.m_Entities;
        this.m_EntitySet = Other.m_EntitySet;
        this.m_LockEntity = Other.m_LockEntity;
        this.m_PendingDeleteEntities = Other.m_PendingDeleteEntities;
        return Other.m_DelayHideEntities;
    }
    void LoadConfigDefault(const FVMS_MiniHpBarV2PanelConfigDefault &inout InConfig)
    {
        this.SetHideMiniHpBarDistance(InConfig.HideMiniHpBarDistance);
        this.SetDelayHideMiniHpBarSeconds(InConfig.DelayHideMiniHpBarSeconds);
        this.SetAnimFadeOutSeconds(InConfig.AnimFadeOutSeconds);
        this.SetEnemyAvatarAlwaysShowHpBarDistance(InConfig.EnemyAvatarAlwaysShowHpBarDistance);
        this.SetHitShowMiniHpBarDistance(InConfig.HitShowMiniHpBarDistance);
        return;
    }
    void Tick()
    {
        this.TickHideHpBar();
        return;
    }
    void ResetDelayHideTime(const FECSEntity &inout Entity)
    {
        FMsg_ChangeMiniHpBarActive local_16;
        bool local_5 = !((this.GetModify_DelayHideEntities().Find(Entity) == nullptr));
        if (local_5)
        {
            local_5 = !local_5;
            if (local_5)
            {
                FEUIModelRef local_14 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus);
                local_16.Entity = Entity;
                local_16.bBarActive = true;
            }
            return;
        }
        FMiniHpBarEntityHideState local_20;
        local_20.HideTime = -1.0;
        local_20.bBarActive = true;
        this.GetModify_DelayHideEntities().Add(Entity, local_20);
        FEUIModelRef local_14_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_16.Entity = Entity;
        local_16.bBarActive = true;
        return;
    }
    void AddOrSetDelayHideTime(const FECSEntity &inout Entity, const float HideTime)
    {
        if ((!((this.GetModify_DelayHideEntities().Find(Entity) == nullptr))))
        {
            return;
        }
        FMiniHpBarEntityHideState local_10;
        local_10.HideTime = HideTime;
        local_10.bBarActive = true;
        this.GetModify_DelayHideEntities().Add(Entity, local_10);
        return;
    }
    void TickHideHpBar()
    {
        float local_22;
        bool local_49 = false;
        if (!(::FASCommonUtils::GetLocalPlayerPawnEntity()))
        {
            return;
        }
        Get local_20;
        FVector local_16 = local_20.opCall().GetPosition();
        float local_26 = ECS::GetUEWorld().GetTimeSeconds();
        local_22 = local_26;
        float32 local_28 = (this.GetDelayHideMiniHpBarSeconds() + this.GetAnimFadeOutSeconds());
        for (auto& local_44 : this.GetEntities())
        {
            bool local_9 = !(local_44.IsValid());
            if (local_9)
            {
                local_9 = true;
            }
            else
            {
                Has local_48;
                local_49 = local_48.opCall();
                local_9 = local_49;
            }
            if (local_9)
            {
                this.GetModify_PendingDeleteEntities().Add(local_44);
                continue;
            }
            if ((local_44 == this.GetLockEntity()))
            {
                this.ResetDelayHideTime(local_44);
                continue;
            }
            if (this.ShouldHideEntityByDistance(local_44, local_16))
            {
                float local_52;
                local_52 = -1.0;
                if ((!((this.GetModify_DelayHideEntities().Find(local_44) == nullptr))))
                {
                    local_52 = local_26;
                    local_26 = 0.0;
                    if (local_52 > local_26)
                    {
                        if (local_22 >= local_52)
                        {
                            this.GetModify_PendingDeleteEntities().Add(local_44);
                        }
                        else
                        {
                            local_26 = this.GetAnimFadeOutSeconds();
                            local_26 = local_52 - local_26;
                            if (local_22 >= local_26)
                            {
                                if (local_49)
                                {
                                    FMsg_ChangeMiniHpBarActive local_64;
                                    local_9 = false;
                                    FEUIModelRef local_62 = FEUIModelRef(this);
                                    FEUIMessageBus::Publish(EUIMessageBus);
                                    local_64.Entity = local_44;
                                    local_49 = false;
                                    local_64.bBarActive = local_49;
                                }
                            }
                        }
                    }
                }
                local_26 = 0.0;
                if (local_52 < local_26)
                {
                    local_26 = local_28;
                    local_26 = local_22 + local_26;
                    this.AddOrSetDelayHideTime(local_44, local_26);
                }
                continue;
            }
            this.ResetDelayHideTime(local_44);
        }
        for (auto& local_44 : this.GetPendingDeleteEntities())
        {
            this.RemoveEntity(local_44);
        }
        this.GetModify_PendingDeleteEntities().Reset(0);
        return;
    }
    void OnPlayerLockTargetChange(const FC_LockTarget &inout LockTarget)
    {
        if (LockTarget)
        {
            FECSEntity local_6 = LockTarget.GetTargetEntity();
            if ((int(LockTarget.GetType())) != 2)
            {
                local_6 = ENTITY_NULL;
            }
            if ((FECSEntity(this.GetLockEntity()) == local_6))
            {
                return;
            }
            this.SetLockEntity(local_6);
        }
        else
        {
            if ((FECSEntity(this.GetLockEntity()) == ENTITY_NULL))
            {
                return;
            }
            this.SetLockEntity(ENTITY_NULL);
        }
        if (this.CheckEntityConfigValidShowMiniHpBar(this.GetLockEntity()))
        {
            this.AddEntity(this.GetLockEntity());
            this.ResetDelayHideTime(this.GetLockEntity());
        }
        return;
    }
    void OnPlayerViewportSelectTarget(const FC_ViewportSelectTarget &inout ViewportSelectTarget)
    {
        if (!(this.GetContext().GetLocalPlayerPawn()))
        {
            return;
        }
        TArray<FECSEntity> local_10 = ::FTargetSelectUtils::GetSelectTargetEntitiesForView(this.GetContext().GetLocalPlayerPawn(), NAME_None);
        for (auto& local_28 : local_10)
        {
            if (this.CheckEntityConfigValidShowMiniHpBar(local_28))
            {
                this.AddEntity(local_28);
                this.ResetDelayHideTime(local_28);
            }
        }
        return;
    }
    void OnHandleBeDamageEvent(const FCE_NotifyBeDamageForMiniHpBarEvent &inout BeDamageEvent)
    {
        this.TryShowHpBarFromDamageOrHit(BeDamageEvent.Attacker, BeDamageEvent.Sender);
        return;
    }
    void OnHandleHitEvent(const FCE_HitEvent &inout HitEvent)
    {
        this.TryShowHpBarFromDamageOrHit(HitEvent.Attacker, HitEvent.Receiver);
        return;
    }
    void TryShowHpBarFromDamageOrHit(const FECSEntity &inout Attacker, const FECSEntity &inout Victim)
    {
        if (!(this.CheckEntityConfigValidShowMiniHpBar(Victim)))
        {
            return;
        }
        if (!(::FASCommonUtils::GetLocalPlayerPawnEntity()))
        {
            return;
        }
        Get local_20;
        Get local_24;
        if (((FVector(local_20.opCall().GetPosition()) - local_24.opCall().GetPosition()).SizeSquared()) > (this.GetHitShowMiniHpBarDistance() * this.GetHitShowMiniHpBarDistance()))
        {
            return;
        }
        FECSEntity local_6 = ::FASCommonUtils::GetLocalPlayerProxy();
        FECSEntity local_46 = ::FASCommonUtils::GetUniquePlayerEntity(Attacker);
        bool local_51 = false;
        if ((local_46 == local_6))
        {
            local_51 = true;
        }
        else
        {
            if (::FTeamUtils::IsInSameTeam(local_6, local_46))
            {
                local_51 = true;
            }
            else
            {
                if (!(::FASCommonUtils::IsAvatarPrefab(Attacker)))
                {
                    local_51 = true;
                }
            }
        }
        if (local_51)
        {
            this.AddEntity(Victim);
            this.ResetDelayHideTime(Victim);
        }
        return;
    }
    void RemoveEntity(const FECSEntity &inout Entity)
    {
        return;
    }
    void AddEntity(const FECSEntity &inout Entity)
    {
        this.GetModify_Entities().AddUnique(Entity);
        this.GetModify_EntitySet().Add(Entity);
        return;
    }
    bool CheckEntityConfigValidShowMiniHpBar(const FECSEntity &inout Entity)
    {
        Has local_4;
        FC_MiniHPBarConfig local_22;
        if (local_4.opCall())
        {
            return false;
        }
        if (!(::MiniHpBarV2Helper::CheckIsEnemyMonster(Entity, this.GetContext().GetLocalPlayerPawn())))
        {
            if (!(HeadsUpDisplay_Dev::CVar_EnableHeadsUpDisplay.GetBool()))
            {
                return false;
            }
        }
        if (::FASCommonUtils::IsBossPrefab(Entity))
        {
            return false;
        }
        Has local_14;
        if (local_14.opCall() && (Entity == this.GetContext().GetLocalPlayerPawn()))
        {
            return false;
        }
        if ((!(local_22) || !(local_22.HasMiniHPBar)))
        {
            return false;
        }
        return true;
    }
    bool ShouldHideEntityByDistance(const FECSEntity &inout Entity, const FVector &inout PlayerPos)
    {
        Get local_10;
        if (((PlayerPos - local_10.opCall().GetPosition()).SizeSquared()) > (this.GetHideMiniHpBarDistance() * this.GetHideMiniHpBarDistance()))
        {
            return true;
        }
        return false;
    }
    ESlateVisibility MiniHpBarV2Visibility() const
    {
        if (!(UICommonUtil::CVar_UI_DebugEnableNewMiniHpBar.GetBool()))
        {
            return ESlateVisibility(1);
        }
        if (HeadsUpDisplay_Dev::CVar_EnableHeadsUpDisplay.GetBool())
        {
            return ESlateVisibility(1);
        }
        return ESlateVisibility(4);
    }
    const float32 GetHitShowMiniHpBarDistance() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_HitShowMiniHpBarDistance() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetHitShowMiniHpBarDistance(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_HitShowMiniHpBarDistance = __Value;
        return;
    }
    const float32 GetHideMiniHpBarDistance() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_HideMiniHpBarDistance() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHideMiniHpBarDistance(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HideMiniHpBarDistance = __Value;
        return;
    }
    const float32 GetDelayHideMiniHpBarSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_DelayHideMiniHpBarSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDelayHideMiniHpBarSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DelayHideMiniHpBarSeconds = __Value;
        return;
    }
    const float32 GetAnimFadeOutSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_AnimFadeOutSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAnimFadeOutSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AnimFadeOutSeconds = __Value;
        return;
    }
    const float32 GetEnemyAvatarAlwaysShowHpBarDistance() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_EnemyAvatarAlwaysShowHpBarDistance() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetEnemyAvatarAlwaysShowHpBarDistance(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EnemyAvatarAlwaysShowHpBarDistance = __Value;
        return;
    }
    const TArray<FECSEntity> GetEntities() const property
    {
        const TArray<FECSEntity> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FECSEntity> GetModify_Entities() property
    {
        TArray<FECSEntity> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Entities = __Value;
        return;
    }
    const TSet<FECSEntity> GetEntitySet() const property
    {
        const TSet<FECSEntity> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TSet<FECSEntity> GetModify_EntitySet() property
    {
        TSet<FECSEntity> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetEntitySet(const TSet<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_EntitySet = __Value;
        return;
    }
    const FECSEntity GetLockEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FECSEntity GetModify_LockEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetLockEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LockEntity = __Value;
        return;
    }
    const TArray<FECSEntity> GetPendingDeleteEntities() const property
    {
        const TArray<FECSEntity> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<FECSEntity> GetModify_PendingDeleteEntities() property
    {
        TArray<FECSEntity> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetPendingDeleteEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_PendingDeleteEntities = __Value;
        return;
    }
    const TMap<FECSEntity, FMiniHpBarEntityHideState> GetDelayHideEntities() const property
    {
        const TMap<FECSEntity, FMiniHpBarEntityHideState> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TMap<FECSEntity, FMiniHpBarEntityHideState> GetModify_DelayHideEntities() property
    {
        TMap<FECSEntity, FMiniHpBarEntityHideState> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetDelayHideEntities(const TMap<FECSEntity, FMiniHpBarEntityHideState> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_DelayHideEntities = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_MiniHpBarV2Panel
{
    UPROPERTY()
    ESlateVisibility MiniHpBarV2Visibility;
    UPROPERTY()
    TEUIModelRef<FVMS_MiniHpBarV2Panel> Self;


}

namespace MiniHpBarV2Helper
{
bool CheckIsEnemyMonster(const FECSEntity &inout Entity, const FECSEntity &inout PlayerPawn)
{
    if (int(GetPrefabType(Entity)) == 2)
    {
        if (int(FASCommonUtils::GetEntityFactionRelation(Entity, PlayerPawn)) == 2)
        {
            return true;
        }
    }
    return false;
}
}
namespace FVMS_MiniHpBarV2Panel
{
FVMS_MiniHpBarV2Panel& Get(const UObject ContextObject)
{
    return FVMS_MiniHpBarV2Panel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_MiniHpBarV2Panel GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_MiniHpBarV2Panel __r;
    TEUIModelRef<FVMS_MiniHpBarV2Panel> local_6 = TEUIModelRef<FVMS_MiniHpBarV2Panel>(EUIInternal::MakeModelWithManager(Manager, FVMS_MiniHpBarV2Panel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Entities";
    local_14.TypeName = "TArray<FECSEntity>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MiniHpBarV2Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_MiniHpBarV2Panel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_MiniHpBarV2Panel;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnPlayerLockTargetChange";
    local_26.ComponentType = FC_LockTarget;
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__OnPlayerViewportSelectTarget";
    local_26.ComponentType = FC_ViewportSelectTarget;
    Result.MonitorFunctions.Add(local_26);
    FEUIModelEventDefine local_34;
    local_34.FunctionName = "__OnHandleBeDamageEvent";
    local_34.EventType = FCE_NotifyBeDamageForMiniHpBarEvent;
    Result.EventFunctions.Add(local_34);
    local_34.FunctionName = "__OnHandleHitEvent";
    local_34.EventType = FCE_HitEvent;
    Result.EventFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_MiniHpBarV2Panel;
}
void __Tick(FVMS_MiniHpBarV2Panel &inout Model)
{
    Model.Tick();
    return;
}
void __OnPlayerLockTargetChange(FVMS_MiniHpBarV2Panel &inout Model, const FECSEntity &inout Entity, const FC_LockTarget &inout Component)
{
    Model.OnPlayerLockTargetChange(Component);
    return;
}
void __OnPlayerViewportSelectTarget(FVMS_MiniHpBarV2Panel &inout Model, const FECSEntity &inout Entity, const FC_ViewportSelectTarget &inout Component)
{
    Model.OnPlayerViewportSelectTarget(Component);
    return;
}
void __OnHandleBeDamageEvent(FVMS_MiniHpBarV2Panel &inout Model, const FCE_NotifyBeDamageForMiniHpBarEvent &inout Event)
{
    Model.OnHandleBeDamageEvent(Event);
    return;
}
void __OnHandleHitEvent(FVMS_MiniHpBarV2Panel &inout Model, const FCE_HitEvent &inout Event)
{
    Model.OnHandleHitEvent(Event);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FECSEntity> __UIGetter_Entities(const FVMS_MiniHpBarV2Panel &inout Model)
{
    return Model.GetEntities();
}
ESlateVisibility __UIGetter_MiniHpBarV2Visibility(const FVMS_MiniHpBarV2Panel &inout Model)
{
    return Model.MiniHpBarV2Visibility();
}
TEUIModelRef<FVMS_MiniHpBarV2Panel> __UIGetter_Self(const FVMS_MiniHpBarV2Panel &inout Model)
{
    return TEUIModelRef<FVMS_MiniHpBarV2Panel>(Model);
}
int __IndexOf_HitShowMiniHpBarDistance()
{
    return 0;
}
int __IndexOf_HideMiniHpBarDistance()
{
    return 1;
}
int __IndexOf_DelayHideMiniHpBarSeconds()
{
    return 2;
}
int __IndexOf_AnimFadeOutSeconds()
{
    return 3;
}
int __IndexOf_EnemyAvatarAlwaysShowHpBarDistance()
{
    return 4;
}
int __IndexOf_Entities()
{
    return 5;
}
int __IndexOf_EntitySet()
{
    return 6;
}
int __IndexOf_LockEntity()
{
    return 7;
}
int __IndexOf_PendingDeleteEntities()
{
    return 8;
}
int __IndexOf_DelayHideEntities()
{
    return 9;
}
}
namespace __GeneratedProperties_FVMS_MiniHpBarV2Panel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
