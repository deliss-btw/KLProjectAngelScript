
enum ERemoveLockTargetType
{
    None,
    Soft,
    Hard,
    SoftOrHard,
}


class UESMAction_DisableLockTarget : UESMBPBaseInstantAction
{
    UPROPERTY()
    ERemoveLockTargetType RemoveLockTargetType = ERemoveLockTargetType(1);


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        const FC_LockTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_9 = int(this.RemoveLockTargetType) & int(local_6.GetType());
            if (local_9 == 0)
            {
                return;
            }
            ::FLockTargetUtils::DisposeChangeLockTarget(Context.GetEntity(), ENTITY_NULL, local_6.GetTargetEntity(), -1, true, EPreChangeTargetReason(2), ELockTargetType(ELockTargetType(0)));
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("Disable ").Append(this.RemoveLockTargetType).Append(" Lock Target");
    }
}

struct FESMSoftLockTargetInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    int LockPointIndex;


}

class UESMAction_SoftLockTarget : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bFallbackViewDir = true;
    UPROPERTY()
    ULockTargetConfig Config;
    UPROPERTY()
    bool bOverrideMaxDistance = false;
    UPROPERTY()
    FESMBBVar_Float OverrideMaxDistance = 0.0f;
    UPROPERTY()
    bool bOnSpanEntry = false;
    UPROPERTY()
    bool bClearOnExit = false;
    UPROPERTY()
    bool bKeepBeforeExit = false;
    UPROPERTY()
    bool bRepickTargetWhenExit = false;
    UPROPERTY()
    bool bWriteMultiLockTargetExtraInfo = true;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMSoftLockTargetInstanceData);
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return (!(this.bClearOnExit) && !(this.bKeepBeforeExit) && !(this.bOnSpanEntry));
    }
    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return 1;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_1 = 0.0f;
        int local_10 = 0;
        ::FLockTargetUtils::EnterSoftLock(Context.GetEntity(), Time.WorldTime, this.bOverrideMaxDistance, local_1, this.bKeepBeforeExit, this.bWriteMultiLockTargetExtraInfo, this.Config);
        if (!(local_10))
        {
            return;
        }
        FESMSoftLockTargetInstanceData& local_12 = this.ModifyInstanceData(Context);
        local_12.TargetEntity = local_10.GetTargetEntity();
        local_12.LockPointIndex = local_10.GetLockPointIndex();
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_3 = 0.0f;
        FESMSoftLockTargetInstanceData& local_2 = this.ModifyInstanceData(Context);
        ::FLockTargetUtils::ExitSoftLock(Context.GetEntity(), Time.WorldTime, this.bOverrideMaxDistance, local_3, this.bClearOnExit, this.bKeepBeforeExit, this.bRepickTargetWhenExit, this.Config, local_2.TargetEntity, int(local_2.LockPointIndex));
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.Config == nullptr)
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), FString().Append("Need Valid LockTargetConfig"));
        }
        return;
    }
    FESMSoftLockTargetInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMSoftLockTargetInstanceData __r;
        return __r;
    }
    FESMSoftLockTargetInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMSoftLockTargetInstanceData __r;
        return __r;
    }
}

class UESMAction_AIForceLockTargetInstance : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bEnable;

    UESMAction_AIForceLockTargetInstance()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        if (this.bEnable)
        {
            local_2.SetRefCount((local_2.GetRefCount() + 1));
            return;
        }
        local_2.SetRefCount((local_2.GetRefCount() - 1));
        int local_8_2 = local_2.GetRefCount();
        return;
    }
}

class UESMAction_AIForceLockTargetSpan : UESMBPBaseSpanAction
{
    UESMAction_AIForceLockTargetSpan()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        local_2.SetRefCount((local_2.GetRefCount() + 1));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        local_2.SetRefCount((local_2.GetRefCount() - 1));
        int local_8 = local_2.GetRefCount();
        return;
    }
}

struct FESMChangeMultiLockSubPointsValidInstanceData
{
    UPROPERTY()
    bool bPreValid = false;


}

class UESMAction_ChangeMultiLockSubPointsValid : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bValid = true;
    UPROPERTY()
    int MainIndex;
    UPROPERTY()
    FName SubSokcetName;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMChangeMultiLockSubPointsValidInstanceData);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.ModifyInstanceData(Context).bPreValid = ::BlueprintFunctions_Common::GetMultiLockSubPointsValid(Context.GetEntity(), this.bValid, this.MainIndex, this.SubSokcetName);
        ::BlueprintFunctions_Common::ChangeMultiLockSubPointsValid(Context.GetEntity(), this.bValid, this.MainIndex, this.SubSokcetName);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::BlueprintFunctions_Common::ChangeMultiLockSubPointsValid(Context.GetEntity(), false, this.MainIndex, this.SubSokcetName);
        return;
    }
    FESMChangeMultiLockSubPointsValidInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMChangeMultiLockSubPointsValidInstanceData __r;
        return __r;
    }
    FESMChangeMultiLockSubPointsValidInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMChangeMultiLockSubPointsValidInstanceData __r;
        return __r;
    }
}

