

class US_CharacterOutline : UECSScriptSystem
{
    US_CharacterOutline()
    {
        return;
    }
    UFUNCTION()
    void Monitor_ActorActive(const FECSEntity &inout Entity, const FC_Actor &inout Actor) const
    {
        Get local_4;
        const FC_ViewEntityActorData& local_6 = local_4.opCall();
        if (local_6)
        {
            AActor local_10;
            ::CharacterOutline::UpdatePawnOutline(local_6.LogicEntity, local_10);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnActorVisible(const FECSEntity &inout Entity, const FC_ActorVisibleTag &inout ActorVisibleTag) const
    {
        int local_6 = 0;
        int local_12 = 0;
        if (!(!(local_6)) && local_12)
        {
            AActor local_16;
            ::CharacterOutline::UpdatePawnOutline(local_12.LogicEntity, local_16);
        }
        return;
    }
    UFUNCTION()
    void Monitor_ControlledByAIUpdate(const FECSEntity &inout Entity, const FC_ControlledByAI &inout ControlledByAI) const
    {
        AActor local_4 = Entity.GetMutableActor();
        if (local_4 != nullptr)
        {
            ::CharacterOutline::UpdatePawnOutline(Entity, local_4);
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateTeamOutline(const FECSEntity &inout Entity, const FC_PlayerInTeam &inout PlayerInTeam) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        FECSEntity local_6 = ::CharacterOutline::GetControlledPawn(Entity);
        if (local_6)
        {
            ::CharacterOutline::EnablePawnOutline(local_6, ::CharacterOutline::ShouldShowOutline(local_6));
        }
        else
        {
            Has local_14;
            bool local_1 = local_14.opCall();
            if (local_1)
            {
                ::CharacterOutline::EnablePawnOutline(Entity, ::CharacterOutline::ShouldShowOutline(Entity));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ActorActive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorActorOnActiveView(EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ActorActive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnActorVisible() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorActorVisibleTagOnAssignView(EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnActorVisible(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ControlledByAIUpdate() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorControlledByAIOnModifyView(EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ControlledByAIUpdate(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateTeamOutline() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerInTeamOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateTeamOutline(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPlayerInTeamOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateTeamOutline(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorPlayerInTeamOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_UpdateTeamOutline(local_46, local_52);
        }
        return;
    }
}

namespace CharacterOutline
{
bool ShouldShowTeamOutline(const FCS_LocalPlayer &inout LocalPlayer)
{
    if (!(LocalPlayer))
    {
        return false;
    }
    FASCommonUtils::GetUniqueAvatarPawnEntity(LocalPlayer.GetPlayerPawnEntity());
    GetDefaulted local_18;
    return (local_18.opCall().GetPrefabAvatarName() == n"PlayerWizard");
}
FECSEntity GetControllerEntity(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_ControlledByPlayer& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetPlayerEntity();
    }
    Get local_12;
    const FC_ControlledByAI& local_14 = local_12.opCall();
    if (local_14)
    {
        return FECSEntity(local_14.GetControllerEntity());
    }
    return ENTITY_NULL;
}
FECSEntity GetCharacterPawn(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_MountIsDrivenBy& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetDriverEntity();
    }
    return Entity;
}
FECSEntity GetControlledPawn(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_PlayerController& local_6 = local_4.opCall();
    if (local_6)
    {
        return CharacterOutline::GetCharacterPawn(local_6.GetPlayerPawnEntity());
    }
    Get local_16;
    const FC_AIController& local_18 = local_16.opCall();
    if (local_18)
    {
        return CharacterOutline::GetCharacterPawn(FECSEntity(local_18.GetPawnEntity()));
    }
    return ENTITY_NULL;
}
bool ShouldShowOutline(const FECSEntity &inout Entity)
{
    Has local_4;
    int local_14 = 0;
    if (local_4.opCall())
    {
        return false;
    }
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    bool local_5 = CharacterOutline::ShouldShowTeamOutline(local_14);
    if (local_5)
    {
        FECSEntity local_20 = FTeamUtils::GetPlayerOrAvatarTeamEntity(Entity);
        if (local_20)
        {
            GetDefaulted local_28;
            return (FECSEntity(local_28.opCall().GetTeamEntity()) == local_20);
        }
    }
    return (Entity == FASCommonUtils::GetUniqueAvatarPawnEntity(local_14.GetPlayerPawnEntity()));
}
void EnableOutline(const FECSEntity &inout Entity, const AActor Actor, const bool bEnable)
{
    if (bEnable)
    {
        FC_OutlineState local_6;
        if (local_6.bEnableOutline)
        {
            return;
        }
        local_6.bEnableOutline = true;
    }
    else
    {
        FC_OutlineState local_6;
        if (local_6)
        {
            if (!(local_6.bEnableOutline) == !(false))
            {
                return;
            }
            local_6.bEnableOutline = false;
        }
        else
        {
            return;
        }
    }
    if (Actor == nullptr)
    {
        return;
    }
    TArray<UPrimitiveComponent> local_18 = Actor.GetComponentsByClass(UPrimitiveComponent);
    for (auto local_36 : local_18)
    {
        local_36.SetRenderCustomDepth(bEnable);
        int local_37 = bEnable ? 1 : 0;
        local_36.SetCustomDepthStencilValue(local_37);
    }
    return;
}
void EnablePawnOutline(const FECSEntity &inout PawnEntity, const bool bEnable)
{
    AActor local_4 = PawnEntity.GetMutableActor();
    if (local_4 != nullptr)
    {
        CharacterOutline::EnableOutline(PawnEntity, local_4, bEnable);
    }
    Get local_10;
    const FC_PawnRiddingMount& local_12 = local_10.opCall();
    if (local_12)
    {
        AActor local_4_2 = local_12.GetMountEntity().GetMutableActor();
        if (local_4_2 != nullptr)
        {
            CharacterOutline::EnableOutline(local_12.GetMountEntity(), local_4_2, bEnable);
        }
    }
    Get local_16;
    const FC_CharacterWeapon& local_18 = local_16.opCall();
    if (local_18)
    {
        AActor local_4_3 = local_18.GetCurrentWeaponEntity().GetMutableActor();
        if (local_4_3 != nullptr)
        {
            CharacterOutline::EnableOutline(local_18.GetCurrentWeaponEntity(), local_4_3, bEnable);
        }
    }
    return;
}
void UpdatePawnOutline(const FECSEntity &inout PawnEntity)
{
    CharacterOutline::EnablePawnOutline(PawnEntity, CharacterOutline::ShouldShowOutline(PawnEntity));
    return;
}
void UpdatePawnOutline(const FECSEntity &inout Entity, const AActor Actor)
{
    int local_34 = 0;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        Get local_10;
        const FC_Owner& local_12 = local_10.opCall();
        if (local_12)
        {
            CharacterOutline::EnableOutline(Entity, Actor, CharacterOutline::ShouldShowOutline(local_12.GetOwnerEntity()));
        }
        return;
    }
    Get local_20;
    const FC_MountIsDrivenBy& local_22 = local_20.opCall();
    if (local_22)
    {
        CharacterOutline::EnableOutline(Entity, Actor, CharacterOutline::ShouldShowOutline(local_22.GetDriverEntity()));
        return;
    }
    FECSEntity local_16 = CharacterOutline::GetControllerEntity(Entity);
    if (local_16)
    {
        CharacterOutline::EnableOutline(Entity, Actor, CharacterOutline::ShouldShowOutline(Entity));
        FECSWorldPtr local_28 = ECS::GetECSWorld();
        if (local_34 && (FECSEntity(local_34.PlayerEntity) == local_16))
        {
            Get local_44;
            const FC_TeamInfo& local_46 = local_44.opCall();
            if (local_46)
            {
                for (auto& local_60 : local_46.GetMembers())
                {
                    if ((FECSEntity(local_60.GetEntity()) == local_16))
                    {
                        continue;
                    }
                    FECSEntity local_26 = CharacterOutline::GetControlledPawn(local_60.GetEntity());
                    if (local_26)
                    {
                        CharacterOutline::EnablePawnOutline(local_26, CharacterOutline::ShouldShowOutline(local_26));
                    }
                }
            }
        }
    }
    return;
}
}
