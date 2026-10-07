

class US_ActorDelayDestroyScriptSystem : UECSScriptSystem
{
    US_ActorDelayDestroyScriptSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_ClientProcessActorDelayDestroyOverrideMaterialParamRequests(const FC_ViewEntityDelayDestroy &inout DelayDestroy, const FECSEntity &inout GameActorViewEntity) const
    {
        AGameActor local_6 = (Cast<AGameActor>(GameActorViewEntity.GetActor()));
        if (local_6 != nullptr)
        {
            if (local_6.bEnableCommonFadeOut)
            {
                return;
            }
            if (local_6.GetDestroyDelayTime() == 0.0f)
            {
                return;
            }
            ::FMaterialUtils::SetMeshDitherMaterialOverrideParam(local_6, GameActorViewEntity);
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientProcessActorShowOverrideMaterialParamRequests(const FC_ViewEntityBecomeVisibleByLogicActiveTag &inout Tag, const FECSEntity &inout GameActorViewEntity) const
    {
        AGameActor local_6 = (Cast<AGameActor>(GameActorViewEntity.GetActor()));
        if (local_6 != nullptr)
        {
            if (local_6.bEnableCommonFadeIn)
            {
                return;
            }
            ::FMaterialUtils::SetMeshShowMaterialOverrideParam(local_6, GameActorViewEntity);
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientProcessActorDelayDestroyHideComponents(const FC_ViewEntityDelayDestroy &inout DelayDestroy, const FECSEntity &inout GameActorViewEntity) const
    {
        AGameActor local_6 = (Cast<AGameActor>(GameActorViewEntity.GetActor()));
        if (!((local_6 != nullptr)))
        {
            return;
        }
        if (local_6.bEnableCommonFadeOut)
        {
            return;
        }
        for (auto& local_22 : local_6.NameToSceneComponentEntries)
        {
            if (local_22.VisualComponentToggleInitStateSettings.bActive && (local_22.VisualComponentToggleInitStateSettings.GetDelayHiddenTime() == 0.0f))
            {
                TArray<USceneComponent> local_34 = local_6.GetCachedSceneComponentByLogicName(local_22.LogicName);
                for (auto local_48 : local_34)
                {
                    if (local_48 != nullptr)
                    {
                        local_48.SetVisibility(false, false);
                    }
                }
            }
        }
        for (auto& local_62 : local_6.NameToSceneComponentGroups)
        {
            if (local_62.VisualComponentToggleInitStateSettings.bActive && (local_62.VisualComponentToggleInitStateSettings.GetDelayHiddenTime() == 0.0f))
            {
                TArray<USceneComponent> local_30 = local_6.GetCachedSceneComponentByLogicName(local_62.LogicName);
                for (auto local_48 : local_30)
                {
                    if (local_48 != nullptr)
                    {
                        local_48.SetVisibility(false, false);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientProcessActorDelayDestroyOverrideMaterialParamRequests() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorViewEntityDelayDestroyOnAssignView(EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientProcessActorDelayDestroyOverrideMaterialParamRequests(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientProcessActorShowOverrideMaterialParamRequests() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorViewEntityBecomeVisibleByLogicActiveTagOnAssignView(EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientProcessActorShowOverrideMaterialParamRequests(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientProcessActorDelayDestroyHideComponents() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorViewEntityDelayDestroyOnAssignView(EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientProcessActorDelayDestroyHideComponents(local_50, local_52);
        }
        return;
    }
}

