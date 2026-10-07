
enum EPropFacingType_Override
{
    CameraForward,
    PlayerForward,
    CustomLocal,
}


// NOTE: class defaults are not authored in this module: UESMAction_AddPropMovementFacingDirectionOverride (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_AddPropMovementFacingDirectionOverride : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bRemoveAfterAccessed = true;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity PropEntityBBVar;
    UPROPERTY()
    EPropFacingType_Override FacingType_Override = EPropFacingType_Override(0);
    UPROPERTY()
    FVector LocalFacingOffset;
    UPROPERTY()
    FVector LocalCustomFacingForward = FVector::ForwardVector;


    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_38 = 0;
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        FNameHandle_EntityBBVarEntity local_10;
        local_10;
        if (!(Context.GetEntity().GetBB_Entity(local_10)))
        {
            return;
        }
        FVector local_20(FCharacterInputUtils::GetViewInputDir(Context.GetEntity(), Time.ActionLastTime).GetForwardVector());
        if (local_38)
        {
            if (int(this.FacingType_Override) == 2)
            {
                FQuat local_68 = (FQuat::MakeFromEuler(this.LocalCustomFacingForward) * FQuat::MakeFromEuler(this.LocalFacingOffset));
                local_20 = local_68.GetForwardVector();
            }
            else
            {
                if (int(this.FacingType_Override) == 1)
                {
                    Get local_80;
                    local_20 = (FQuat(local_80.opCall().GetRotation()) * FQuat::MakeFromEuler(this.LocalFacingOffset)).GetForwardVector();
                }
            }
        }
        local_38.SetFacingDirectionVector(local_20);
        local_38.SetbRemoveAfterAccessed(this.bRemoveAfterAccessed);
        return;
    }
}

