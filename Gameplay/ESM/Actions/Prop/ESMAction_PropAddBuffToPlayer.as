
enum ETriggerPlayerEntityMode
{
    EntityBB,
    FromCustomInteractEventToESMTriggerFilterContext,
}


// NOTE: class defaults are not authored in this module: UESMAction_PropAddBuffToPlayer (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_PropAddBuffToPlayer : UESMBPBaseInstantAction
{
    UPROPERTY()
    ETriggerPlayerEntityMode TriggerPlayerEntityMode = ETriggerPlayerEntityMode(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TriggerPlayerEntityBB;
    UPROPERTY()
    bool bIncludeDefault = true;
    UPROPERTY()
    FPrefabConfigNameSelector BuffTagNames;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::PropAddBuffToPlayerUtils::TriggerEntityAddBuffListByBuffTag(this.GetTriggerPlayerEntity(Context.GetEntity()), Context.GetEntity(), this.bIncludeDefault, this.BuffTagNames.SelectedNames);
        return;
    }
    FECSEntity GetTriggerPlayerEntity(const FECSEntity &inout Entity) const
    {
        int local_18 = 0;
        if (!(Entity))
        {
            return ENTITY_NULL;
        }
        if (int(this.TriggerPlayerEntityMode) == 0)
        {
            Has local_8;
            bool local_1 = local_8.opCall();
            if (local_1)
            {
                return Entity.GetBB_Entity(this.TriggerPlayerEntityBB);
            }
        }
        if (int(this.TriggerPlayerEntityMode) == 1)
        {
            if (local_18)
            {
                return local_18.GetCustomInteract_InteractSource();
            }
        }
        return ENTITY_NULL;
    }
}

