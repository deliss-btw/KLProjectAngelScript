

class UESMAction_MeleeStrike : UESMMeleeStrikeAction
{
    UPROPERTY()
    bool bPlayEnvSurfaceFX = true;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FAttackData& local_52;
        TDataObjectPtr<FAttackData> local_24 = TDataObjectPtr<FAttackData>(this.AttackData);
        if (!(this.AttackData.IsValid()))
        {
            return;
        }
        if (local_52.GetFreezeAttenuationCurve() != nullptr)
        {
            ModifyOrAdd local_58;
            FC_StrikeFreezeAttenuation& local_60 = local_58.opCall();
            if (local_60)
            {
                ++local_60.GetModify_StrikeInvokeCounter().FindOrAdd(this.GetStrikeKey(Context));
            }
        }
        if (this.bPlayEnvSurfaceFX)
        {
            ModifyOrAdd local_68;
            FC_EnvSurfaceImpactFXRecord& local_70 = local_68.opCall();
            if (local_70)
            {
                local_70.AttackIdentifierSet.Add(Context.GetNotifyDataPath());
            }
            return;
        }
        Modify local_74;
        if (local_74.opCall())
        {
            FName local_62 = Context.GetNotifyDataPath();
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FAttackData& local_52;
        TDataObjectPtr<FAttackData> local_24 = TDataObjectPtr<FAttackData>(this.AttackData);
        if (!(this.AttackData.IsValid()))
        {
            return;
        }
        if (local_52.GetFreezeAttenuationCurve() != nullptr)
        {
            Modify local_58;
            FC_StrikeFreezeAttenuation& local_60 = local_58.opCall();
            if (local_60)
            {
                int local_66 = local_60.GetModify_StrikeInvokeCounter().FindOrAdd(this.GetStrikeKey(Context));
                if (int(local_66) > 1)
                {
                    --local_66;
                }
                else
                {
                }
            }
        }
        FFPTime local_76 = FFPTime(-1);
        SendEvent local_74;
        FCE_EnvSurfaceImpactFXRecordToRemove& local_78 = local_74.opCall(local_76);
        if (local_78)
        {
            local_78.AttackIdentifierSet.Add(Context.GetNotifyDataPath());
        }
        return;
    }
    FName GetStrikeKey(const FESMContext &inout Context) const
    {
        FName local_5;
        if ((!((FName(this.CustomStrikeKey) == NAME_None))))
        {
            local_5 = this.CustomStrikeKey;
        }
        else
        {
            local_5 = Context.GetNotifyDataPath();
        }
        return local_5;
    }
}

class UESMAction_LaserStrike : UESMLaserStrikeAction
{
    default HitFXNormalName = FName("CollisionNormal");
    default HitFXRotationName = FName("LaserDir");

    UESMAction_LaserStrike()
    {
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_16;
        if ((!((FName(this.CustomStrikeKey) == NAME_None))))
        {
            local_16 = FString().Append(" [").Append(this.CustomStrikeKey).Append("] ");
        }
        else
        {
            local_16 = "";
        }
        return FString().Append("<").Append(this.CollisionAttachToSocket.Name).Append("> жїЂе…‰").Append(local_16).Append(": ").Append(this.AttackData.GetDataName());
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
}

class UESMAction_SignalLaserStrike : UESMBPBaseInstantAction
{
    UPROPERTY()
    FName SignalName;
    UPROPERTY()
    FName CustomStrikeKey;

    UESMAction_SignalLaserStrike()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        local_4.opCall().AddSignal(Time.WorldTime, this.SignalName, this.CustomStrikeKey);
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_16;
        if ((!((this.CustomStrikeKey == NAME_None))))
        {
            local_16 = FString().Append(" [").Append(this.CustomStrikeKey).Append("] ");
        }
        else
        {
            local_16 = "";
        }
        return FString().Append("жїЂе…‰ Signal").Append(local_16).Append(": ").Append(this.SignalName);
    }
}

