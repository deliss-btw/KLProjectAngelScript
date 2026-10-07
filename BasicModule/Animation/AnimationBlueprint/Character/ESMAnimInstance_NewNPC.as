

class UESMAnimInstance_NewNPC : UKLAnimInstance
{
    UPROPERTY()
    FESMAnimState StanceLayer;
    UPROPERTY()
    FESMAnimState MainLayer;
    UPROPERTY()
    FESMAnimState ArmLayer;
    UPROPERTY()
    FESMAnimState HeadLayer;
    UPROPERTY()
    EWeaponType CharacterWeaponType;
    UPROPERTY()
    bool NeedTransitWeaponType;
    UPROPERTY()
    FECSEntity CurrentEntity;
    UPROPERTY()
    FC_LayeredBlendMask LayeredBlendMask;
    UPROPERTY()
    float32 ExternalTransitDuration;
    UPROPERTY()
    FC_RelativeDesiredRotation RelativeDesiredRotation;
    UPROPERTY()
    FC_AnimIdleHeadControl IdleHeadControl;
    UPROPERTY()
    FC_AniParamNPCBodyPartControl AniParamNPCBodyPartControl;
    UPROPERTY()
    bool bIsEditor;

    UESMAnimInstance_NewNPC()
    {
        this.ExternalTransitDuration = 0.2f;
        this.bIsEditor = false;
        this.StanceLayer.SetLayer(n"StanceLayer");
        this.MainLayer.SetLayer(n"MainLayer");
        this.ArmLayer.SetLayer(n"ArmLayer");
        this.HeadLayer.SetLayer(n"HeadLayer");
        return;
    }
    UFUNCTION()
    void BlueprintInitializeAnimation_Implementation()
    {
        this.bIsEditor = this.GetWorld().IsEditorWorld();
        return;
    }
    UFUNCTION()
    bool IsLocalPlayer_Implementation() const
    {
        if (this.Entity.IsValid())
        {
            FECSEntity local_6 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
            return (FECSEntity(this.Entity) == local_6);
        }
        return false;
    }
    UFUNCTION()
    void WhenUpdateMainAnimInstance_Implementation(const float32 DeltaTimeX)
    {
        int local_22 = 0;
        int local_28 = 0;
        if (this.Entity.IsValid())
        {
            if (DeltaTimeX != 0.0f)
            {
                this.CurrentEntity = this.Entity;
            }
            FFPTime local_6 = this.GetContextSampleTime();
            bool local_1 = !(this.GetbLogicUpdate());
            if (local_1)
            {
                Get local_10;
                const FC_InterpoTime& local_12 = local_10.opCall();
                if (local_12)
                {
                    local_6 = local_12.Time;
                }
            }
            if (local_6.opCmp(0.0) >= 0)
            {
                this.AddressMountRopeConfig();
                if (!(local_22))
                {
                    local_1 = false;
                }
                else
                {
                    local_1 = local_28;
                }
                if (local_1)
                {
                    FC_Transform local_52;
                    FC_CharacterAnimData local_72;
                    if (local_28.GetInterpoValue(local_6, local_72) && local_22.GetInterpoValue(local_6, local_52))
                    {
                        this.UpdateCharacterAnimData(local_6, local_72, local_52.ToFTransform());
                    }
                    Get local_100;
                    const FC_CharacterWeapon& local_102 = local_100.opCall();
                    if (local_102)
                    {
                        EWeaponType local_103;
                        local_103 = this.CharacterWeaponType;
                        EWeaponType local_104 = local_102.GetCurrentWeaponType();
                        this.CharacterWeaponType = EWeaponType(local_104);
                        this.NeedTransitWeaponType = int(local_103) != int(local_102.GetCurrentWeaponType()) && (int(local_103) != 0);
                    }
                    this.HandleFootPhase(local_72, local_6);
                }
            }
            if (DeltaTimeX > 0.0f)
            {
                this.UpdataCharacterEntityBBData(local_6);
            }
            this.UpdateAnimationVariant(EWeaponType(this.CharacterWeaponType), this.NeedTransitWeaponType);
            this.UpdateStrafeAnimData();
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_26 = 0;
        int local_36 = 0;
        int local_50 = 0;
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.LayeredBlendMask)))
        {
            FC_LayeredBlendMask local_20;
            this.LayeredBlendMask = local_20;
        }
        if (!(local_26) || !(local_26.GetInterpoValue(SampleTime, this.RelativeDesiredRotation)))
        {
            FC_RelativeDesiredRotation local_30;
            this.RelativeDesiredRotation = local_30;
        }
        if (!(local_36) || !(local_36.GetInterpoValue(SampleTime, this.IdleHeadControl)))
        {
            FC_AnimIdleHeadControl local_44;
            this.IdleHeadControl = local_44;
        }
        if (!(local_50) || !(local_50.GetInterpoValue(SampleTime, this.AniParamNPCBodyPartControl)))
        {
            FC_AniParamNPCBodyPartControl local_54;
            this.AniParamNPCBodyPartControl = local_54;
        }
        return;
    }
    float32 NormalizeCalculateElapsedTime(const FFPTime &inout ElapsedTime, const float32 MaxElapsedTime) const
    {
        if (ElapsedTime.opCmp(MaxElapsedTime) > 0 || (ElapsedTime.opCmp(0.0) < 0) || (MaxElapsedTime <= 0.0f))
        {
            return -1.0f;
        }
        return (float32(ElapsedTime.ToSeconds()) / MaxElapsedTime);
    }
    void UpdateCharacterAnimData(const FFPTime &inout LocalTime, const FC_CharacterAnimData &inout CharacterAnimData, const FTransform &inout InCharacterTransform)
    {
        return;
    }
    void UpdataCharacterEntityBBData(const FFPTime &inout LocalTime)
    {
        return;
    }
    void UpdateAnimationVariant(const EWeaponType WeaponType, const bool NeedTransit)
    {
        if (NeedTransit)
        {
            this.RequestInertial(this.ExternalTransitDuration);
        }
        Get local_6;
        const FC_AnimState& local_8 = local_6.opCall();
        if (local_8)
        {
            this.SetAnimVariantType(local_8.GetVariantType());
            return;
        }
        this.SetAnimVariantType(int(::AvatarAnimVariant::GetVariantType(this.CharacterWeaponType)));
        return;
    }
    float32 UpdateAdditiveBlendWeight(const float32 BlendValue)
    {
        int local_3 = BlendValue > 0.0f ? 1 : 0;
        return local_3;
    }
    bool InRange(const float32 Value, const float32 Min, const float32 Max)
    {
        bool local_2;
        bool local_5;
        int local_6;
        bool local_1 = true;
        local_2 = true;
        bool local_3 = local_2;
        if (local_1)
        {
            local_5 = (Value >= Min);
        }
        else
        {
            local_5 = (Value > Min);
        }
        if (!(local_5))
        {
            local_2 = false;
        }
        else
        {
            if (local_3)
            {
                local_2 = (Value <= Max);
                local_6 = local_2;
            }
            else
            {
                bool local_4 = (Value < Max);
                local_6 = local_4;
            }
            local_2 = (local_6 != 0);
        }
        return local_2;
    }
    bool IsAngleInRange(const float32 Angle, const float32 MinAngle, const float32 MaxAngle, const float32 Buffer, const bool IncreaseBuffer)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    void UpdateStrafeAnimData()
    {
        return;
    }
    void HandleFootPhase(const FC_CharacterAnimData &inout InterpolatedAnimData, const FFPTime &inout WorldTime)
    {
        return;
    }
    void AddressMountRopeConfig()
    {
        return;
    }
    UFUNCTION()
    float32 GetStateDuration(const FName &inout StateName) const
    {
        int local_2 = 0;
        if (local_2)
        {
            return float32((local_2.GetStateDurationSeconds(StateName, this.UpdatedTime).ToSeconds()));
        }
        return 0.0f;
    }
    void HandleHitShake(const FC_AnimBeHitShake &inout AnimBeHitShake)
    {
        return;
    }
}

