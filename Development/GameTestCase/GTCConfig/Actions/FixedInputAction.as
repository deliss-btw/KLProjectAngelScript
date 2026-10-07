

// NOTE: class defaults are not authored in this module: FGTCFixedInputAction (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FGTCFixedInputAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    TArray<FSimulatedInput> InputGroup;

    FGTCFixedInputAction()
    {
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        int local_6 = 0;
        int local_12 = 0;
        bool local_15 = local_12 && local_12.GetTargetEntity().IsValid();
        for (auto& local_30 : this.InputGroup)
        {
            if (local_15)
            {
                if ((local_30.Name == FCharacterInputUtils::GetLockTargetPositionInputName()) || (local_30.Name == FCharacterInputUtils::GetLockTargetRotationInputName()) || (local_30.Name == FCharacterInputUtils::GetMultiLockTargetPositionInputName()) || (local_30.Name == FCharacterInputUtils::GetMultiLockTargetRotationInputName()) || (local_30.Name == FCharacterInputUtils::GetViewDirInputName()) || (local_30.Name == FCharacterInputUtils::GetCorrectedViewDirInputName()))
                {
                    continue;
                }
            }
            FFPTime local_34;
            if (FCharacterInputUtils::IsContinuousInput(local_30.Name) || (local_30.Name == FCharacterInputUtils::GetSprintInputName()) || (local_30.Name == n"CharacterJump"))
            {
                local_34 = (FFPTime(Context.FixedTime.Time) + FFPTime(local_30.TimeOffset));
            }
            else
            {
                FFPTime local_48 = FFPTime(Context.FixedTime.Time);
                FFPTime local_50 = FFPTime(Context.LocalTime.Time);
                FFPTime local_52 = (local_50.opCmp((local_48 - Context.FixedTime.DeltaTime)) > 0 && (local_50.opCmp(local_48) <= 0)) ? local_50 : local_48;
                local_34 = (local_52 + FFPTime(local_30.TimeOffset));
            }
            local_6.GetOrAddPacket(int(Context.FixedTime.Frame)).ReplaceOrAdd(local_30.GetCopyData(local_34));
        }
        return;
    }
    void OnFinish_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        return;
    }
}

