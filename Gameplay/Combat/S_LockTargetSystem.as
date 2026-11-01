const FConsoleVariable CVar_LockTargetDebug = FConsoleVariable();
const FConsoleVariable CVar_LockTargetDisableRetargetOnDead = FConsoleVariable();

class US_LockTargetSystem : UECSScriptSystem
{
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> LockInput = nullptr;
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> ChangeLockTargetPrev = nullptr;
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> ChangeLockTargetNext = nullptr;
    UPROPERTY()
    ULockTargetConfig LockTargetConfigRef;
    UPROPERTY()
    ULockTargetConfig LockTargetConfigRefWhenTargetDead;
    UPROPERTY()
    ULockTargetConfig RepickLockTargetConfigRef;
    UPROPERTY()
    float32 MaxDistanceForUnlock = 6000.0f;
    UPROPERTY()
    float32 MaxDistanceForRetarget = 3500.0f;
    UPROPERTY()
    float32 ChangeLockTargetMaxDistance = 3500.0f;
    UPROPERTY()
    float32 ChangeLockTargetMaxAngle = 45.0f;
    UPROPERTY()
    FName LockTargetSocketName = n"DefaultLockSocket";

    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void ServerJob_HandleLockTargetSettingInputFirstEvent(const FCE_LockTargetSettingInputFirstEvent &inout Event) const
    {
        0.SetbEnabled(Event.bEnabled);
        return;
    }
    UFUNCTION()
    void Job_HandleLockInput(const FECSEntity &inout Entity, const FC_InterpoTransform &inout Transform, const FC_TransformHistory &inout TransformHistory, const FC_Input &inout Input, const FCS_FixedTime &inout FixedTime, const FC_ESMTrigger &inout ESMTrigger) const
    {
        Get local_10;
        int local_12 = 0;
        ULockTargetConfig local_66;
        FECSEntity local_22;
        if (local_12)
        {
            local_22 = local_12.GetTargetEntity();
        }
        else
        {
            local_22 = ENTITY_NULL;
        }
        FFPTime local_24 = FFPTime();
        FFPTime local_24_2 = -1;
        bool local_26 = false;
        bool local_27 = false;
        if (!((this.LockInput == nullptr)))
        {
            FActiveTriggerResult local_48 = this.LockInput.opArrow().TestTrigger(Input.State, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
            if (local_48.bActive)
            {
                local_24_2 = local_48.TriggerTime;
                local_26 = local_12 && (int(local_12.GetType()) == 2);
            }
        }
        Get local_56;
        const FC_LockTargetTrigger& local_58 = local_56.opCall();
        if (local_58)
        {
            FFPTime local_60 = local_58.Time;
            if (local_60.opCmp(local_24_2) > 0 && ((local_58.Time.opCmp(this.GetECSRuntime().LastTime) > 0)) && ((local_58.Time.opCmp(this.GetECSRuntime().Time) <= 0)))
            {
                local_24_2 = local_58.Time;
                local_26 = false;
                local_27 = local_58.bCanRepickNull;
            }
            if (FFPTime(this.GetECSRuntime().LastTime).opCmp(local_58.Time) > 0)
            {
                Remove local_64;
                local_64.opCall();
            }
        }
        if (local_27)
        {
        }
        else
        {
        }
        if (local_24_2.opCmp(0.0) >= 0)
        {
            FCE_LockTargetChangeEvent local_76;
            if (local_26)
            {
                FECSWorldPtr local_70 = this.GetECSWorld();
                local_76.PreTargetEntity = local_22;
                local_76.ChangeTargetReason = EPreChangeTargetReason(0);
                local_76.TargetEntity = ENTITY_NULL;
                local_76.LockTargetType = ELockTargetType(0);
                int local_25 = -1;
                local_76.LockPointIndex = local_25;
            }
            else
            {
                FLockTargetOverrideInfo local_122 = ::FLockTargetUtils::GetInitOverrideInfo(Entity, FixedTime.Time);
                FLockTargetResult local_154 = ::FLockTargetUtils::PickLockTarget(ELockTargetType(2), Entity, local_66.Data, local_122);
                if (!((local_154.LockTarget == ENTITY_NULL)))
                {
                    FECSWorldPtr local_70_2 = this.GetECSWorld();
                    local_76.ChangeTargetReason = EPreChangeTargetReason(0);
                    local_76.PreTargetEntity = local_22;
                    local_76.LockTargetType = ELockTargetType(2);
                    local_76.TargetEntity = local_154.LockTarget;
                    local_76.LockPointIndex = int(local_154.LockPointIndex);
                }
                else
                {
                    if (local_27)
                    {
                        FECSWorldPtr local_70_3 = this.GetECSWorld();
                        local_76.ChangeTargetReason = EPreChangeTargetReason(0);
                        local_76.PreTargetEntity = local_22;
                        local_76.TargetEntity = ENTITY_NULL;
                        local_76.LockTargetType = ELockTargetType(0);
                        local_76.LockPointIndex = -1;
                    }
                }
            }
        }
        if (!((this.ChangeLockTargetPrev == nullptr)) && (!((this.ChangeLockTargetNext == nullptr))))
        {
            FCE_LockTargetChangeEvent local_76;
            FActiveTriggerResult local_38 = this.ChangeLockTargetPrev.opArrow().TestTrigger(Input.State, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
            FActiveTriggerResult local_48_2 = this.ChangeLockTargetNext.opArrow().TestTrigger(Input.State, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
            int local_163 = 0;
            if (local_38.bActive)
            {
                local_163 = -1;
            }
            else
            {
                if (local_48_2.bActive)
                {
                    local_163 = 1;
                }
            }
            if (local_163 != 0)
            {
                if (local_12 && (int(local_12.GetType()) == 2))
                {
                    int local_215;
                    int local_214;
                    FVector local_176 = FCharacterInputUtils::GetViewPosition(Entity, TransformHistory, this.GetECSRuntime().Time);
                    FCharacterInputUtils::GetViewInputDir(Entity, this.GetECSRuntime().Time);
                    FRotator local_182 = FRotator::MakeFromXZ((FVector(local_12.GetLogicLockTargetPosition()) - local_176), FVector::UpVector);
                    FECSEntity local_204 = FECSEntity(ENTITY_NULL);
                    FECSEntity local_208 = FECSEntity(ENTITY_NULL);
                    FECSEntity local_212 = FECSEntity(ENTITY_NULL);
                    int local_213 = -1;
                    local_214 = -1;
                    local_215 = -1;
                    float local_218 = -3.4028234663852886e38;
                    float local_220 = 3.4028234663852886e38;
                    ::FLockTargetUtils::GetInitOverrideInfo(Entity, FixedTime.Time);
                    float32 local_221 = this.ChangeLockTargetMaxDistance + 200.0f;
                    FECSRuntimeQuery local_264 = FECSRuntimeQueryHelper::RuntimeQueryInCylinder(Entity, Transform.GetPosition(), local_221, local_221, true, EECSQueryRegsitryType(3), false);
                    Include local_308;
                    local_308.opCall();
                    Include local_312;
                    local_312.opCall();
                    Exclude(local_264).opCall();
                    FECSRuntimeQueryIterator local_338 = local_264.Iterator();
                    for (; local_338.CanProceed;)
                    {
                        const FECSEntity& local_362 = local_338.Proceed();
                        if (!(::FLockTargetUtils::IsLockTargetMatchBaseCondition(local_12.GetType(), Entity, local_362, local_66.Data.MinDetectBlockDistance, true, local_176)))
                        {
                            continue;
                        }
                        TArray<FLockPointInfo> local_366;
                        ::FLockTargetUtils::GetMainLockPointsFromEntity(local_362, local_366, FTransformUtils::GetPlayerRollbackTime(Entity, FixedTime));
                        for (auto& local_382 : local_366)
                        {
                            if ((local_362 == local_10.opCall().GetTargetEntity()) && (local_10.opCall().GetLockPointIndex() == int(local_382.Index)))
                            {
                                continue;
                            }
                            FVector local_200 = local_382.Position;
                            FVector local_170 = (local_200 - local_176);
                            local_200 = local_182.Vector().CrossProduct(local_170);
                            float local_414 = FMath::RadiansToDegrees((FQuat::FindBetweenVectors(local_170, local_182.Vector())).GetAngle());
                            if (local_170.SizeSquared() > FMath::Square(this.ChangeLockTargetMaxDistance))
                            {
                                continue;
                            }
                            if (local_414 > this.ChangeLockTargetMaxAngle)
                            {
                                continue;
                            }
                            float local_412 = 0.0;
                            if (local_200.Z < local_412)
                            {
                                local_412 = local_414;
                                local_412 = -local_412;
                                local_414 = local_412;
                            }
                            if (local_220 > local_414 && (local_414 > 0.0))
                            {
                                local_220 = local_414;
                                local_212 = local_362;
                                local_215 = int(local_382.Index);
                            }
                            if (local_218 < local_414 && (local_414 < 0.0))
                            {
                                local_218 = local_414;
                                local_208 = local_362;
                                local_214 = int(local_382.Index);
                            }
                        }
                    }
                    if (local_163 > 0 && !((local_212 == ENTITY_NULL)))
                    {
                        local_204 = local_212;
                        local_213 = local_215;
                    }
                    else
                    {
                        if (local_163 < 0 && !((local_208 == ENTITY_NULL)))
                        {
                            local_204 = local_208;
                            local_213 = local_214;
                        }
                    }
                    if (!((local_204 == ENTITY_NULL)))
                    {
                        FECSWorldPtr local_70_4 = this.GetECSWorld();
                        local_76.ChangeTargetReason = EPreChangeTargetReason(0);
                        local_76.PreTargetEntity = local_22;
                        local_76.TargetEntity = local_204;
                        local_76.LockTargetType = ELockTargetType(2);
                        local_76.LockPointIndex = local_213;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateAutoClearHardLockTarget(const FECSEntity &inout Entity, const FC_InterpoTransform &inout Transform, const FC_TransformHistory &inout TransformHistory, const FC_LockTarget &inout LockTarget, const FCS_FixedTime &inout FixedTime) const
    {
        FECSEntity local_10;
        int local_34 = 0;
        if (LockTarget)
        {
            local_10 = LockTarget.GetTargetEntity();
        }
        else
        {
            local_10 = ENTITY_NULL;
        }
        if (LockTarget && (int(LockTarget.GetType()) == 2))
        {
            Remove local_54;
            if (::FLockTargetUtils::IsTraceBlockedToTargetEntity(Entity, LockTarget.GetTargetEntity(), this.LockTargetConfigRef.Data.MinDetectBlockDistance, FCharacterInputUtils::GetViewPosition(Entity, TransformHistory, this.GetECSRuntime().Time)))
            {
                FFPTime local_36 = local_34.LastAutoRecordTime;
                if ((local_36 == 0.0))
                {
                    local_34.LastAutoRecordTime = this.GetECSRuntime().Time;
                }
                else
                {
                    if (((FFPTime(this.GetECSRuntime().Time) - local_34.LastAutoRecordTime).opCmp(this.LockTargetConfigRef.Data.AutoClearHardLockWhenBlock)) >= 0)
                    {
                        FCE_LockTargetChangeEvent local_48;
                        FECSWorldPtr local_42 = this.GetECSWorld();
                        local_48.ChangeTargetReason = EPreChangeTargetReason(0);
                        local_48.PreTargetEntity = local_10;
                        local_48.TargetEntity = ENTITY_NULL;
                        local_48.LockTargetType = ELockTargetType(ELockTargetType(0));
                        local_48.LockPointIndex = -1;
                        local_54.opCall();
                    }
                }
                return;
            }
        }
        Has local_58;
        if (local_58.opCall())
        {
            Remove local_54;
            local_54.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_InvalidateCachedLockTargetPosition(FC_LockTarget &inout LockTarget) const
    {
        LockTarget.SetbCachedValidLockTargetPosition(false);
        return;
    }
    UFUNCTION()
    void Job_HanldeUpdateLockPointLocation(const FC_Input &inout Input, FC_LockTarget &inout LockTarget, const FCS_FixedTime &inout FixedTime) const
    {
        LockTarget.SetbCachedValidLockTargetPosition(true);
        LockTarget.SetLogicLockTargetPosition(FCharacterInputUtils::GetLockTargetPosition(Input.State, FixedTime.LastTime));
        LockTarget.SetLogicLockTargetRotation(FCharacterInputUtils::GetLockTargetRotation(Input.State, FixedTime.LastTime));
        LockTarget.SetPresentationLockTargetPosition(LockTarget.GetLogicLockTargetPosition());
        return;
    }
    UFUNCTION()
    void Job_HanldeUpdateMUltiLockPointLocation(const FECSEntity &inout Entity, const FC_Input &inout Input, FC_LockTarget &inout LockTarget, FC_MultiLockTargetExtraInfo &inout LockTargetExtraInfo, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_4;
        if (!(local_4.opCall()) || !(LockTargetExtraInfo.GetTargetEntity().IsValid()) || (LockTargetExtraInfo.GetLockTargetExtraInfo().GetIndex() < 0))
        {
            LockTargetExtraInfo.SetbCachedValidMultiExtraInfo(false);
            return;
        }
        LockTargetExtraInfo.SetbCachedValidMultiExtraInfo(true);
        FMultiLockTargetExtraInfo local_24;
        local_24.SetIndex(LockTargetExtraInfo.GetLockTargetExtraInfo().GetIndex());
        local_24.SetSubIndex(LockTargetExtraInfo.GetLockTargetExtraInfo().GetSubIndex());
        local_24.SetPosition(FCharacterInputUtils::GetMultiLockTargetPosition(Input.State, FixedTime.LastTime));
        local_24.SetRotation(FCharacterInputUtils::GetMultiLockTargetRotation(Input.State, FixedTime.LastTime));
        LockTargetExtraInfo.SetLockTargetExtraInfo(local_24);
        return;
    }
    UFUNCTION()
    void Job_HanldeUpdateLockPointLocationWithoutPlayer(FC_LockTarget &inout LockTarget) const
    {
        LockTarget.SetbCachedValidLockTargetPosition(true);
        GetDefaulted local_6;
        LockTarget.SetLogicLockTargetPosition(local_6.opCall().GetPosition());
        LockTarget.SetLogicLockTargetRotation(local_6.opCall().GetRotation().Rotator());
        LockTarget.SetPresentationLockTargetPosition(LockTarget.GetLogicLockTargetPosition());
        return;
    }
    UFUNCTION()
    void ClientJob_HanldeUpdateMultiLockTargetExtraInfon(const FECSEntity &inout Entity, const FC_MultiLockTargetExtraInfo &inout LockTargetExtraInfo, const FCS_InputLocal &inout InputLocal, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_4;
        int local_10 = 0;
        if (!(local_4.opCall()) || !(LockTargetExtraInfo.GetTargetEntity().IsValid()) || (LockTargetExtraInfo.GetLockTargetExtraInfo().GetIndex() < 0))
        {
            return;
        }
        FFPTime local_18 = FTransformUtils::GetPlayerRollbackTime(Entity, FixedTime);
        FRotator local_24;
        FCharacterInputUtils::PushLockTargetLocalInputVec(::FLockTargetUtils::GetLockPositionFromLockPointConfigWithSubIndex(LockTargetExtraInfo.GetTargetEntity(), local_10.GetLockPoints()[LockTargetExtraInfo.GetLockTargetExtraInfo().GetIndex()], LockTargetExtraInfo.GetLockTargetExtraInfo().GetIndex(), LockTargetExtraInfo.GetLockTargetExtraInfo().GetSubIndex(), local_18, local_24), FCharacterInputUtils::GetMultiLockTargetPositionInputName());
        FCharacterInputUtils::PushLockTargetLocalInputRot(local_24, FCharacterInputUtils::GetMultiLockTargetRotationInputName());
        return;
    }
    UFUNCTION()
    void Job_FillInvalidLockTargetPoint(const FECSEntity &inout Entity, FC_LockTarget &inout LockTarget) const
    {
        if (LockTarget.GetbCachedValidLockTargetPosition() == false)
        {
            XWarning(ELog(0), FString().Append("No Valid Cached LockTargetPosition: ").Append(Entity).Append(" -> locks ").Append(LockTarget.GetTargetEntity()));
            GetDefaulted local_12;
            LockTarget.SetLogicLockTargetPosition(local_12.opCall().GetPosition());
            LockTarget.SetPresentationLockTargetPosition(LockTarget.GetLogicLockTargetPosition());
            LockTarget.SetbCachedValidLockTargetPosition(true);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleAutoExit(const FECSEntity &inout Entity, const FC_LockTargetAutoExit &inout AutoExit, const FCS_FixedTime &inout FixedTime) const
    {
        int local_10 = 0;
        int local_20 = 0;
        if (FFPTime(FixedTime.Time).opCmp(AutoExit.GetKeepTargetTime()) >= 0)
        {
            Has local_8;
            if (local_8.opCall())
            {
                if (local_10.GetbAdditionalStrafeCounter())
                {
                    local_10.SetKeepStrafeCounter((local_10.GetKeepStrafeCounter() - 1));
                    local_10.SetbAdditionalStrafeCounter(false);
                    FESMTriggerUtils::ActivateESMTrigger(Entity, n"KeepStrafeCounterTrigger", FixedTime.Time, FFPTime(0.1), 0);
                }
            }
            if (local_20 && (int(local_20.GetType()) == int(AutoExit.GetType())))
            {
                ::FLockTargetUtils::ClearLockTarget(Entity);
            }
            if (FFPTime(FixedTime.Time).opCmp(AutoExit.GetKeepTargetTime()) >= 0)
            {
                Remove local_32;
                local_32.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleLockTargetChangeEvent(const FCE_LockTargetChangeEvent &inout Event) const
    {
        ::FLockTargetUtils::DisposeChangeLockTarget(Event, this.LockTargetConfigRef);
        return;
    }
    UFUNCTION()
    void Job_TickLockTarget(const FECSEntity &inout Entity, FC_LockTarget &inout LockTarget) const
    {
        bool local_37;
        if (Entity.MatchGameplayTag(GameplayTags::CombatState_Ban_LockTarget))
        {
            ::FLockTargetUtils::ClearLockTarget(Entity);
            return;
        }
        FVector local_8;
        FECSWorldPtr local_10 = this.GetECSWorld();
        FCS_FixedTime local_12;
        LockTarget.SetbCachedValidLockTargetPosition(FLockTargetUtils::UpdateFocusPoint(Entity, LockTarget, (int(local_12.Frame) - 1), local_12.Time, local_8));
        FECSEntity local_20 = LockTarget.GetTargetEntity();
        FECSEntity local_24 = LockTarget.GetTargetEntity();
        bool local_13 = local_20.IsActive();
        bool local_32 = false;
        if (!(local_13))
        {
            local_37 = false;
        }
        else
        {
            Has local_36;
            local_37 = local_36.opCall();
        }
        if (!(local_37))
        {
            local_37 = false;
        }
        else
        {
            Get local_30;
            Get local_42;
            local_37 = (local_30.opCall().GetPosition().Distance(local_42.opCall().GetPosition()) > (this.MaxDistanceForUnlock + this.LockTargetConfigRef.Data.GetMaxLockDistanceByEntity(local_20)));
        }
        if (local_37)
        {
            if (!(local_20.MatchGameplayTag(GameplayTags::CombatState_IgnoreLockDistance)))
            {
                local_32 = true;
            }
        }
        Has local_54;
        bool local_31 = local_54.opCall();
        local_37 = local_20.MatchGameplayTag(GameplayTags::CombatState_Special_Unlockable);
        bool local_55 = (int(::FASCommonUtils::GetEntityFactionRelation(Entity, local_20)) == 4);
        LockTarget.SetTargetEntity(local_20);
        if ((((local_31 || !(local_13)) || local_32) || local_37) || local_55)
        {
            int local_136;
            int local_129;
            FECSEntity local_62 = FECSEntity(ENTITY_NULL);
            if (local_20.IsActive() && (int(LockTarget.GetType()) == 2))
            {
                local_62 = ::FLockTargetUtils::PickLockTarget(ELockTargetType(2), Entity, this.LockTargetConfigRefWhenTargetDead.Data, ::FLockTargetUtils::GetInitOverrideInfo(Entity, local_12.Time)).LockTarget;
            }
            if (local_37)
            {
                local_62 = ENTITY_NULL;
            }
            FECSEntity local_128 = local_24;
            int local_130 = 0;
            local_129 = local_130;
            if (local_20.MatchGameplayTag(GameplayTags::CombatState_Special_Unlockable))
            {
                local_130 = 5;
                local_129 = local_130;
            }
            else
            {
                local_130 = 0;
                local_129 = local_130;
            }
            FECSEntity local_134 = FECSEntity(ENTITY_NULL);
            int local_135 = 0;
            local_136 = 0;
            if (!((local_62 == ENTITY_NULL)) && !(CVar_LockTargetDisableRetargetOnDead.GetBool()))
            {
                local_134 = local_62;
                local_136 = 2;
                Has local_140;
                bool local_49_2 = local_140.opCall();
                local_135 = local_49_2 ? 0 : -1;
            }
            else
            {
                local_134 = ENTITY_NULL;
                int local_63_3 = 0;
                local_136 = local_63_3;
                local_135 = -1;
            }
            ::FLockTargetUtils::DisposeChangeLockTarget(Entity, local_134, local_24, local_135, this.LockTargetConfigRef.Data.bShouldStrafe, EPreChangeTargetReason(local_129), ELockTargetType(local_136));
        }
        Get local_144;
        const FC_ControlledByPlayer& local_146 = local_144.opCall();
        if (local_146)
        {
            FECSEntity local_150 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(local_146.GetPlayerEntity());
            if (!((local_150 == local_20)))
            {
                if (local_150.IsValid() && local_150.IsActive())
                {
                    ::FLockTargetUtils::DisposeChangeLockTarget(Entity, local_150, local_24, -1, this.LockTargetConfigRef.Data.bShouldStrafe, EPreChangeTargetReason(0), ELockTargetType(2));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickPreLockTargetState(const FECSEntity &inout Entity, const FC_PreLockTargetState &inout PreLockTargetState) const
    {
        bool local_10 = false;
        if (int(PreLockTargetState.GetChangeTargetReason()) == 5)
        {
            FECSEntity local_8 = PreLockTargetState.GetPreTargetEntity();
            if (local_8.IsValid() && local_8.IsActive() && !(local_8.MatchGameplayTag(GameplayTags::CombatState_Special_Unlockable)))
            {
                bool local_4;
                local_10 = false;
                Get local_16;
                Get local_20;
                local_4 = (local_16.opCall().GetPosition().Distance(local_20.opCall().GetPosition()) > this.MaxDistanceForRetarget);
                Has local_30;
                bool local_9 = local_30.opCall();
                if (local_9)
                {
                    if (local_4)
                    {
                        Remove local_34;
                        local_34.opCall();
                        return;
                    }
                }
                ::FLockTargetUtils::DisposeChangeLockTarget(Entity, PreLockTargetState.GetPreTargetEntity(), ENTITY_NULL, -1, (this.LockTargetConfigRef.Data.bShouldStrafe), EPreChangeTargetReason(0), ELockTargetType(2));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateAimRotation(const FECSEntity &inout Entity, const FC_LockTarget &inout LockTarget, const FC_Transform &inout Transform, FC_CharacterPoseState &inout CharacterPose, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_2;
        if (CharacterPose.GetbIsAiming())
        {
            return;
        }
        local_2 = LockTarget.GetbCachedValidLockTargetPosition();
        if (local_2 == false)
        {
            CharacterPose.SetAimRotation(Transform.GetRotation().Rotator());
            return;
        }
        FLockPointInfo local_26;
        if (::FLockTargetUtils::GetLogicLockTargetInfo(Entity, local_26))
        {
            FVector local_32 = local_26.Position;
            local_32 += LockTarget.GetCachedLockTargetConfig().GetLockTargetTransform().GetLockTargetOffset();
            FVector local_38 = (local_32 - Transform.GetPosition());
            if (local_38.SizeSquared() == 0.0)
            {
                CharacterPose.SetAimRotation(Transform.GetRotation().Rotator());
            }
            else
            {
                CharacterPose.SetAimRotation(FRotator::MakeFromXZ(local_38, FVector::UpVector));
            }
            return;
        }
        CharacterPose.SetAimRotation(Transform.GetRotation().Rotator());
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateLockPointLocation(const FECSEntity &inout Entity, const FC_LockTarget &inout LockTarget, const FCS_InputLocal &inout InputLocal, const FCS_FixedTime &inout FixedTime) const
    {
        FECSEntity local_4 = LockTarget.GetTargetEntity();
        FRotator local_10;
        FCharacterInputUtils::PushLockTargetLocalInputVec(::FLockTargetUtils::GetLockPositionFromLockPointConfig(local_4, LockTarget.GetCachedLockTargetConfig(), local_10, FTransformUtils::GetPlayerRollbackTime(Entity, FixedTime)), FCharacterInputUtils::GetLockTargetPositionInputName());
        FCharacterInputUtils::PushLockTargetLocalInputRot(local_10, FCharacterInputUtils::GetLockTargetRotationInputName());
        return;
    }
    UFUNCTION()
    void Job_DebugLockTargetState(const FCS_FixedTime &inout FixedTime, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_16 = 0;
        int local_22 = 0;
        if (!(CVar_LockTargetDebug.GetBool()) == !(false))
        {
            return;
        }
        FLinearColor local_6 = FLinearColor(FLinearColor::Purple);
        FECSEntity local_10 = LocalPlayer.GetPlayerPawnEntity();
        if (local_16 && !((FECSEntity(local_16.GetTargetEntity()) == ENTITY_ID_NULL)))
        {
            FECSEntity local_10_2 = LocalPlayer.GetPlayerPawnEntity();
            FString local_38 = UEnum::GetEnumType(n"ELockTargetType").GetNameStringByValue(int(local_16.GetType()));
            if (local_22 && ((FFPTime(local_22.GetKeepTargetTime()).opCmp(0.0) >= 0)))
            {
                FFPTime local_44;
                (FFPTime(local_22.GetKeepTargetTime()) - local_44);
                FString local_26 = FString();
            }
            else
            {
                PrintToScreen(FString().Append("[LockTarget] ").Append(local_38), 0.0f, local_6);
            }
            FString local_26_2 = FString();
            PrintToScreen(local_26_2.Append("[LockTarget] Target = ").Append(local_16.GetTargetEntity()).Append(", LockPointIndex ").Append(local_16.GetLockPointIndex()), 0.0f, local_6);
            return;
        }
        PrintToScreen("[LockTarget] None", 0.0f, local_6);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleLockTargetSettingInputFirstEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LockTargetSettingInputFirstEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LockTargetSettingInputFirstEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleLockTargetSettingInputFirstEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLockInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        int local_200 = 0;
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
                this.Job_HandleLockInput(local_40, local_42, local_48, local_54, local_6, local_60);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_102 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_102).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_102.Iterator();
        for (; local_162.CanProceed;)
        {
            local_40 = local_162.Proceed();
            ++local_128;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HandleLockInput(local_200, local_42, local_48, local_54, local_6, local_60);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAutoClearHardLockTarget() const
    {
        int local_10 = 0;
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        int local_56 = 0;
        int local_192 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(1))))
        {
            return;
        }
        int local_12 = 0;
        int local_11 = local_12;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.Job_UpdateAutoClearHardLockTarget(local_42, local_44, local_50, local_56, local_10);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_7 = local_4.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_98.Iterator();
        for (; local_154.CanProceed;)
        {
            local_42 = local_154.Proceed();
            ++local_120;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_UpdateAutoClearHardLockTarget(local_192, local_44, local_50, local_56, local_10);
        }
        local_4.UpdateCachedEntityCount(local_120);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_7);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InvalidateCachedLockTargetPosition() const
    {
        int local_36 = 0;
        MarkModifiedIfDirty local_44;
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
                this.Job_InvalidateCachedLockTargetPosition(local_36);
                local_44.opCall(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            const FECSEntity& local_166 = local_130.Proceed();
            ++local_96;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_166.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_166);
            this.Job_InvalidateCachedLockTargetPosition(local_36);
            local_44.opCall(local_36);
        }
        local_2.UpdateCachedEntityCount(local_96);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HanldeUpdateLockPointLocation() const
    {
        int local_6 = 0;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
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
                this.Job_HanldeUpdateLockPointLocation(local_40, local_46, local_6);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_92.Iterator();
        for (; local_148.CanProceed;)
        {
            const FECSEntity& local_184 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_184.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_184);
            this.Job_HanldeUpdateLockPointLocation(local_40, local_46, local_6);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HanldeUpdateMUltiLockPointLocation() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
        int local_202 = 0;
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
                this.Job_HanldeUpdateMUltiLockPointLocation(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_48);
                local_66.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Include local_124;
        local_124.opCall();
        Exclude(local_104).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_130 = 0;
        FECSRuntimeViewIterator local_164 = local_104.Iterator();
        for (; local_164.CanProceed;)
        {
            local_40 = local_164.Proceed();
            ++local_130;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HanldeUpdateMUltiLockPointLocation(local_202, local_42, local_48, local_54, local_6);
            local_62.opCall(local_48);
            local_66.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_130);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HanldeUpdateLockPointLocationWithoutPlayer() const
    {
        int local_36 = 0;
        MarkModifiedIfDirty local_44;
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
                this.Job_HanldeUpdateLockPointLocationWithoutPlayer(local_36);
                local_44.opCall(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        Exclude(local_82).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_82.Iterator();
        for (; local_134.CanProceed;)
        {
            const FECSEntity& local_170 = local_134.Proceed();
            ++local_100;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_170.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_170);
            this.Job_HanldeUpdateLockPointLocationWithoutPlayer(local_36);
            local_44.opCall(local_36);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HanldeUpdateMultiLockTargetExtraInfon() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_HanldeUpdateMultiLockTargetExtraInfon(local_50, local_52, local_14, local_20);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_94).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_50 = local_142.Proceed();
            ++local_108;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::Get<FC_MultiLockTargetExtraInfo> local_56 = FECSEntity::Get<FC_MultiLockTargetExtraInfo>(local_50);
            this.ClientJob_HanldeUpdateMultiLockTargetExtraInfon(local_180, local_52, local_14, local_20);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_FillInvalidLockTargetPoint() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
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
                this.Job_FillInvalidLockTargetPoint(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_FillInvalidLockTargetPoint(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAutoExit() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
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
                this.Job_HandleAutoExit(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HandleAutoExit(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLockTargetChangeEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LockTargetChangeEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LockTargetChangeEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleLockTargetChangeEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickLockTarget() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
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
                this.Job_TickLockTarget(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickLockTarget(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickPreLockTargetState() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_170 = 0;
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
                this.Job_TickPreLockTargetState(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        local_84.opCall();
        Exclude(local_80).opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickPreLockTargetState(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAimRotation() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
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
                this.Job_UpdateAimRotation(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateAimRotation(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateLockPointLocation() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_UpdateLockPointLocation(local_50, local_52, local_14, local_20);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_94).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_50 = local_142.Proceed();
            ++local_108;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::Get<FC_LockTarget> local_56 = FECSEntity::Get<FC_LockTarget>(local_50);
            this.ClientJob_UpdateLockPointLocation(local_180, local_52, local_14, local_20);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DebugLockTargetState() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        this.Job_DebugLockTargetState(local_14, local_16);
        return;
    }
}

