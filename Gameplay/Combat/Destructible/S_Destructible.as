
namespace DestructibleUtils
{
    const FConsoleVariable CVar_Debug_BrokenDestructible_DrawDetectShape = FConsoleVariable();

}
class US_Destructible : UECSScriptSystem
{
    US_Destructible()
    {
        return;
    }
    UFUNCTION()
    void Job_DestructibleHandleHitEvent(const FCE_DestructibleHitEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        Get local_4;
        const FC_DestructibleConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            ::DestructibleUtils::BrokenDestructiale(Event.Sender, Event.Receiver, local_6, Event.DestructibleDamageLevel, Event.ImpactType, Event.ImpactStrength, Event.ForceDirection);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_MoveDestructibleHitTest(const FECSEntity &inout Entity, const FC_DestructibleDamageDefaultConfig &inout DefaultConfig, const FC_Transform &inout Transform, const FC_Rigidbody &inout Rigidbody, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argint]
    }
    UFUNCTION()
    void ClientJob_DebugMoveDestructibleHitTest(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_DestructibleDamageDefaultConfig &inout DefaultConfig) const
    {
        if (!(DestructibleUtils::CVar_Debug_BrokenDestructible_DrawDetectShape.GetBool()))
        {
            return;
        }
        float32 local_2 = 1.0f;
        Get local_8;
        const FC_Scale& local_10 = local_8.opCall();
        if (local_10)
        {
            local_2 = local_10.GetUniformScale();
        }
        ::DestructibleUtils::DrawMoveDestructibleDetectShape(Transform.ToFTransform(), DefaultConfig, local_2);
        return;
    }
    UFUNCTION()
    void Monitor_OnSyncDestructibleFX(const FECSEntity &inout Entity, const FC_DestructibleFX &inout DestructibleFX) const
    {
        int local_6 = 0;
        int local_7 = 0;
        for (; local_7 < local_6.ViewEntityDatas.Num(); ++local_7)
        {
            const FECSViewEntityData& local_12 = local_6.ViewEntityDatas[local_7];
            if (int(local_12.EntityType) == 3)
            {
                if (FECSEntity(local_12.EntityId).IsValid())
                {
                    Assign local_22;
                    local_22.opCall(DestructibleFX);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DestructibleHandleHitEvent() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DestructibleHitEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_DestructibleHitEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_DestructibleHandleHitEvent(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_MoveDestructibleHitTest() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_MoveDestructibleHitTest(local_40, local_42, local_48, local_54, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_40 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_MoveDestructibleHitTest(local_186, local_42, local_48, local_54, local_6);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugMoveDestructibleHitTest() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_172 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_DebugMoveDestructibleHitTest(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_36 = local_134.Proceed();
            ++local_100;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_DebugMoveDestructibleHitTest(local_172, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnSyncDestructibleFX() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorDestructibleFXOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnSyncDestructibleFX(local_46, local_52);
        }
        return;
    }
}

namespace DestructibleUtils
{
void BrokenDestructiale(const FECSEntity &inout FxOwnerEntity, const FECSEntity &inout Entity, const FC_DestructibleConfig &inout Config, const EDestructibleClassLevel DestructibleDamageLevel, const EImpactType ImpactType, const EImpactStrength ImpactStrength, const FVector &inout ForceDirection)
{
    int local_142 = 0;
    int local_174 = 0;
    int local_216 = 0;
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    if (int(Config.DestructibleClass) > int(DestructibleDamageLevel))
    {
        return;
    }
    bool local_1 = FECSEntity::Has<FC_DestructibleBreakedTag>(Entity).opCall();
    if (local_1)
    {
        return;
    }
    FFXConfig local_124;
    local_124.SetbDetach(true);
    local_124.SetAsset(System::GetSoftClassPath(Config.DestructibleFX));
    local_124.SetbUseWorldOriginAsBaseTransformSource(true);
    local_124.SetLocationOffsetSpace(EFXOffsetSpace(2));
    local_124.SetRotationOffsetSpace(EFXOffsetSpace(2));
    local_124.SetLocationOffset(local_142.GetPosition());
    local_124.SetRotationOffset(local_142.GetRotation().Rotator());
    Get local_152;
    const FC_Scale& local_154 = local_152.opCall();
    if (local_154)
    {
        local_124.SetScale(local_154.Scale);
    }
    if (ECSFX::PlayFXDurationalEx(FxOwnerEntity, local_124, ECS::GetContextTime(), 1.0f, true, ENTITY_NULL, EAttachFXStopMethod(4), true))
    {
        local_174.SetImpactType(EImpactType(ImpactType));
        local_174.SetImpactStrength(EImpactStrength(ImpactStrength));
        local_174.SetForceDirection(ForceDirection);
    }
    if (int(Config.BreakType) == 0)
    {
        Entity.DestroyDeferred();
    }
    else
    {
        if (int(Config.BreakType) == 1)
        {
            FFPTime local_180 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
            for (auto& local_194 : Config.BreakToggleVisualCompts)
            {
                FVisualComponentToggleUtils::SetVisualComponentHidden(Entity, local_194.ComponentName, !(local_194.bVisibility), Entity.GetEntityName());
            }
            for (auto& local_210 : Config.BreakToggleColliders)
            {
                bool local_156_2 = !(local_210.bColliderEnabled);
                FCollisionUtils::DisablePushCollider(Entity, local_210.ColliderName, local_180, local_156_2);
            }
            local_216.GetOptions().DisableByReason(ECollisionDisableReason(4));
        }
    }
    FC_DestructibleBreakedTag local_224;
    Assign local_222;
    local_222.opCall(local_224);
    return;
}
EDestructibleClassLevel GetEffectiveMovementDamageLevel(const FECSEntity &inout Entity, const FC_DestructibleDamageDefaultConfig &inout DefaultConfig)
{
    Get local_4;
    const FC_OverrideMovementDestructibleDamageLevel& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetMovementDestructibleDamageLevel();
    }
    return DefaultConfig.MovementDestructibleDamageLevel;
}
void DrawMoveDestructibleDetectShape(const FTransform &inout Transform, const FC_DestructibleDamageDefaultConfig &inout DefaultConfig, const float32 Scale)
{
    if (int(DefaultConfig.MovementDestructibleDamageLevel) == 0)
    {
        return;
    }
    else
    {
        if (int(DefaultConfig.DefaultMoveDestructibleDetect.MoveDestructibleDetectShape.GetShapeType()) == 0)
        {
            return;
        }
        else
        {
            FMoveDestructibleDetect local_8 = DefaultConfig.DefaultMoveDestructibleDetect;
            FCollisionShape local_16 = local_8.MoveDestructibleDetectShape.GetAsShape(Scale);
            FQuat local_48 = (Transform.GetRotation() * local_8.MoveDestructibleDetectShapeRotation.Quaternion());
            FVector local_72 = (Transform.GetLocation() + Transform.GetRotation().RotateVector(local_8.MoveDestructibleDetectShapeOffsetToCenter));
            switch (int(local_16.ShapeType))
            {
            case 1:
            {
                System::DrawDebugBox(__GetWorldContext(), local_72, local_16.GetBox(), FLinearColor::Blue, local_48.Rotator(), -1.0f, 3.0f, EDrawDebugSceneDepthPriorityGroup(0));
                return;
            }
            case 2:
            {
                System::DrawDebugSphere(__GetWorldContext(), local_72, local_16.GetSphereRadius(), 10, FLinearColor::Blue, -1.0f, 3.0f, EDrawDebugSceneDepthPriorityGroup(0));
                return;
            }
            case 3:
            {
                System::DrawDebugCapsule(__GetWorldContext(), local_72, local_16.GetCapsuleHalfHeight(), local_16.GetCapsuleRadius(), local_48.Rotator(), FLinearColor::Blue, -1.0f, 3.0f, EDrawDebugSceneDepthPriorityGroup(0));
                return;
            }
            }
        }
    }
}
}
