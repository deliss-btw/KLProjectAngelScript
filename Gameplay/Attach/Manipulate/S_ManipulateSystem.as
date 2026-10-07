
const FConsoleVariable CVar_DebugManipulateByCurve = FConsoleVariable();
const FConsoleVariable CVar_DebugViewSocketAlign = FConsoleVariable();
const FConsoleVariable CVar_DefaultManipulateSocketUpdatePeriod = FConsoleVariable();
const FConsoleVariable CVar_DebugManipulateByCurveTraceTime = FConsoleVariable();

class US_ManipulateSystem : UECSScriptSystem
{
    US_ManipulateSystem()
    {
        return;
    }
    float32 GetCapsuleHalfHeight(const FECSEntity &inout E) const
    {
        int local_6 = 0;
        return local_6 && (int(local_6.GetShapeType()) == 2) ? local_6.GetScaledHalfHeight() : 0.0f;
    }
    void ComposeSlaveTransform(const FVector &inout MasterPos, const FQuat &inout MasterRot, const float32 MasterHalfHeight, const float32 SlaveHalfHeight, const FVector &inout OffsetLoc, const FRotator &inout OffsetRot, FVector &out OutLoc, FQuat &out OutRot) const
    {
        FVector local_6;
        OutLoc = local_6;
        OutRot = FQuat();
        OutRot = (MasterRot * OffsetRot.Quaternion());
        FVector local_44 = (MasterPos - (MasterRot.GetUpVector() * MasterHalfHeight));
        FVector local_38 = (local_44 + MasterRot.RotateVector(OffsetLoc));
        OutLoc = (local_38 + (OutRot.GetUpVector() * SlaveHalfHeight));
        return;
    }
    UFUNCTION()
    void Job_UpdateManipulatedInfo(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ManipulatedInfo &inout ManipulatedInfo) const
    {
        int local_46 = 0;
        int local_66 = 0;
        float32 local_102;
        Has local_6;
        Get local_12;
        bool local_7 = !(local_6.opCall()) || (local_12.opCall().GetLasUpdateCounter() != ManipulatedInfo.GetUpdateCounter());
        FECSEntity local_20 = FECSEntity(ManipulatedInfo.GetMasterEntity());
        bool local_15 = local_20.IsValid();
        if (!(local_15))
        {
            local_15 = false;
        }
        else
        {
            Has local_26;
            local_15 = local_26.opCall();
        }
        Has local_32;
        if ((!(local_32.opCall()) && !(ManipulatedInfo.GetbOnlyStateTransition()) && !(ManipulatedInfo.GetbAttachMasterToSlave()) && (FFPTime(ManipulatedInfo.GetExitTime()).opCmp(0.0) < 0) && !((ManipulatedInfo.GetBeginTransitStateName() == NAME_None)) && (ManipulatedInfo.GetBeginTransitStateSyncNormalizedTime() >= 0.0f) && local_20.IsValid()) && local_15)
        {
            if (!(local_46) || !((local_46.MasterEntity == ManipulatedInfo.GetMasterEntity())))
            {
                ModifyOrAdd local_54;
                local_54.opCall().MasterEntity = ManipulatedInfo.GetMasterEntity();
            }
        }
        else
        {
            if (local_46)
            {
                Remove local_58;
                local_58.opCall();
            }
        }
        if (local_7)
        {
            Entity.ESMSlavedStop();
        }
        if (ManipulatedInfo.GetBeginTransitStateSyncNormalizedTime() > 0.0f)
        {
            bool local_1_2 = !((ManipulatedInfo.GetBeginTransitStateName() == NAME_None));
            FC_ESMPlayerSlaved& local_60 = Entity.ESMSlavedStart();
            local_60.SetSlavedStateName(ManipulatedInfo.GetBeginTransitStateName());
            local_60.SetTargetStateNormalizedTime(ManipulatedInfo.GetBeginTransitStateSyncNormalizedTime());
            local_60.SetSlavedMasterEntity(ManipulatedInfo.GetMasterEntity());
            if (ManipulatedInfo.GetbSyncWithMasterStateNormalizedTime())
            {
                local_60.SetbUseMasterStateNormalizedTime(true);
                local_60.SetMasterStateNormalizedTimeScale(ManipulatedInfo.GetMasterStateNormalizedTimeScale());
            }
        }
        else
        {
            if (local_32.opCall() && !((ManipulatedInfo.GetBeginTransitStateName() == NAME_None)) && ManipulatedInfo.GetMasterEntity().IsValid())
            {
                FC_ESMPlayerSlaved& local_60_2 = Entity.ESMSlavedStart();
                local_60_2.SetSlavedStateName(ManipulatedInfo.GetBeginTransitStateName());
                local_60_2.SetTargetStateNormalizedTime(-1.0f);
                local_60_2.SetSlavedMasterEntity(ManipulatedInfo.GetMasterEntity());
            }
        }
        if (!(local_7))
        {
            return;
        }
        local_66.SetLasUpdateCounter(ManipulatedInfo.GetUpdateCounter());
        FECSEntity local_70 = FECSEntity(ManipulatedInfo.GetMasterEntity());
        if (!(local_70.IsValid()))
        {
            return;
        }
        if (!(ManipulatedInfo.GetbOnlyStateTransition()))
        {
            bool local_1_3 = local_32.opCall();
            if (local_1_3)
            {
                Modify local_86;
                Assign local_74;
                local_74.opCall(FC_AttachIgnoreMovementTag());
                Modify local_80;
                FC_Rigidbody& local_82 = local_80.opCall();
                if (local_82)
                {
                    local_82.SetVelocity(FVector::ZeroVector);
                }
                FC_CharacterMovement& local_88 = local_86.opCall();
                if (local_88)
                {
                    local_88.GetModify_AttachIgnoreCollisionEntities().AddUnique(local_70);
                }
                Has local_92;
                bool local_1_4 = local_92.opCall();
                if (local_1_4)
                {
                    FC_CharacterMovement& local_88_2 = local_86.opCall();
                    if (local_88_2)
                    {
                        local_88_2.GetModify_AttachIgnoreCollisionEntities().AddUnique(Entity);
                    }
                }
            }
            else
            {
                FECSEntity local_96;
                FECSEntity local_100;
                if (ManipulatedInfo.GetbAttachMasterToSlave())
                {
                    local_96 = Entity;
                    local_100 = local_70;
                }
                else
                {
                    local_96 = local_70;
                    local_100 = Entity;
                }
                if (local_100.IsValid() && local_96.IsValid())
                {
                    if (ManipulatedInfo.GetAttachSocketUpdatePeriod() >= 0)
                    {
                        local_102 = ManipulatedInfo.GetAttachSocketUpdatePeriod();
                    }
                    else
                    {
                        local_102 = CVar_DefaultManipulateSocketUpdatePeriod.GetInt();
                    }
                    ::FAttachmentUtils::EntityAttachToParent(local_100, local_96, FixedTime.Time, ManipulatedInfo.GetSocketName(), false, ManipulatedInfo.GetLocationOffset(), ManipulatedInfo.GetRotationOffset(), ManipulatedInfo.GetAttachBlendInDuration(), ManipulatedInfo.GetAttachBlendKeepDuration(), local_102, FVector::ZeroVector, 0.0f, false);
                }
            }
        }
        if (!((ManipulatedInfo.GetBeginTransitStateName() == NAME_None)))
        {
            FESMExternalTransitHandle local_112 = Entity.ESMExternalTransitMainSM(ManipulatedInfo.GetBeginTransitStateName(), NAME_None);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveManipulatedInfo(const FECSEntity &inout Entity, const FC_ManipulatedInfo &inout ManipulatedInfo) const
    {
        Has local_6;
        if (Entity.IsValid() && !(local_6.opCall()))
        {
            Has local_12;
            bool local_7 = local_12.opCall();
            if (local_7)
            {
                Remove local_16;
                local_16.opCall();
            }
            Has local_20;
            bool local_7_2 = local_20.opCall();
            if (local_7_2)
            {
                Remove local_24;
                local_24.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void Job_CleanupOrphanedManipulateActionLifecycle(const FECSEntity &inout Entity, const FC_ManipulateActionLifecycle &inout ActionLifecycle) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_CleanupOrphanedManipulateOffsetTrack(const FECSEntity &inout Entity, const FC_ManipulateOffsetTrack &inout OffsetTrack) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleManipulateActionLifecycleLost(const FCS_FixedTime &inout FixedTime, FC_ManipulatedInfo &inout ManipulatedInfo, FC_ManipulateActionLifecycle &inout ActionLifecycle) const
    {
        FFPTime local_2 = FFPTime(ManipulatedInfo.GetExitTime());
        if (local_2.opCmp(0.0) >= 0 || !((FECSEntity(ManipulatedInfo.GetMasterEntity()) == ActionLifecycle.MasterEntity)) || (ManipulatedInfo.GetUpdateCounter() != int(ActionLifecycle.UpdateCounter)))
        {
            return;
        }
        if (ActionLifecycle.LastTickTime.opCmp(FixedTime.LastTime) > 0 && ((ActionLifecycle.LastTickTime.opCmp(FixedTime.Time) <= 0)))
        {
            ActionLifecycle.MissedTickCount = 0;
            return;
        }
        if (int(ActionLifecycle.MissedTickCount) == 0)
        {
            ActionLifecycle.MissedTickCount = 1;
            return;
        }
        ManipulatedInfo.SetExitTime(FixedTime.Time);
        XWarning(ELog(42), FString().Append("[Manipulate] Span Action иїћз»­дё¤её§жњЄе€·ж–°пјЊиЎҐеЏ‘йЂЂе‡єиЇ·ж±‚пјЊMasterEntity=").Append(ActionLifecycle.MasterEntity.GetIdValue()).Append(", UpdateCounter=").Append(ActionLifecycle.UpdateCounter));
        return;
    }
    UFUNCTION()
    void ServerJob_HandleManipulateMasterInvalid(const FCS_FixedTime &inout FixedTime, FC_ManipulatedInfo &inout ManipulatedInfo) const
    {
        bool local_6;
        if (FECSEntity(ManipulatedInfo.GetMasterEntity()).IsValid())
        {
            Has local_10;
            bool local_5 = local_10.opCall();
            Has local_16;
            if (local_16.opCall())
            {
                local_6 = true;
            }
            else
            {
                Has local_20;
                local_6 = local_20.opCall();
            }
            Has local_26;
            bool local_21 = local_26.opCall();
            Has local_32;
            bool local_11 = local_32.opCall();
            if (!(((local_5 || local_6) || local_21) || local_11))
            {
                return;
            }
            FFPTime local_36 = FFPTime(ManipulatedInfo.GetExitTime());
            if (local_36.opCmp(0.0) < 0 || ((FFPTime(ManipulatedInfo.GetExitTime()).opCmp(FixedTime.Time) > 0)))
            {
                ManipulatedInfo.SetExitTime(FixedTime.Time);
            }
            return;
        }
        FFPTime local_36_2 = FFPTime(ManipulatedInfo.GetExitTime());
        if (local_36_2.opCmp(0.0) < 0 || ((FFPTime(ManipulatedInfo.GetExitTime()).opCmp(FixedTime.Time) > 0)))
        {
            ManipulatedInfo.SetExitTime(FixedTime.Time);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleManipulateExit(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ManipulatedInfo &inout ManipulatedInfo) const
    {
        if (!((FFPTime(ManipulatedInfo.GetExitTime()) == -1.0)) && ((FFPTime(ManipulatedInfo.GetExitTime()).opCmp(FixedTime.Time) <= 0)))
        {
            FECSEntity local_12 = FECSEntity(ManipulatedInfo.GetMasterEntity());
            Has local_18;
            bool local_7 = local_18.opCall();
            if (!(ManipulatedInfo.GetbOnlyStateTransition()))
            {
                if (local_7)
                {
                    ::FManipulateUtils::CleanupManipulatedByCurve(Entity, local_12);
                }
                else
                {
                    if (ManipulatedInfo.GetbAttachMasterToSlave())
                    {
                        ::FAttachmentUtils::EntityDetachWithoutOffset(local_12, FixedTime.Time, false, uint8(0));
                    }
                    else
                    {
                        ::FAttachmentUtils::EntityDetachWithoutOffset(Entity, FixedTime.Time, false, uint8(0));
                    }
                }
            }
            if ((!((ManipulatedInfo.GetEndTransitStateName() == NAME_None))))
            {
                FESMExternalTransitHandle local_30 = Entity.ESMExternalTransitMainSM(ManipulatedInfo.GetEndTransitStateName(), NAME_None);
            }
            if (ManipulatedInfo.GetbTargetIgnoreOtherAttack())
            {
                Get local_34;
                const FC_OnlyAcceptSpecificEntityAttack& local_36 = local_34.opCall();
                if (local_36)
                {
                    if ((FECSEntity(local_36.GetAcceptedEntity()) == local_12))
                    {
                        Remove local_44;
                        local_44.opCall();
                    }
                }
            }
            Has local_48;
            bool local_13 = local_48.opCall();
            if (local_13)
            {
                Remove local_52;
                local_52.opCall();
            }
            Remove local_56;
            local_56.opCall();
            Remove local_60;
            local_60.opCall();
            Has local_64;
            local_13 = local_64.opCall();
            if (local_13)
            {
                Remove local_68;
                local_68.opCall();
            }
            Entity.ESMSlavedStop();
            if (local_7)
            {
                XLog(ELog(42), FString().Append("[ManipulateByCurve][Cleanup] Master=").Append(local_12.GetIdValue()).Append(" Target=").Append(Entity.GetIdValue()).Append(" UpdateCounter=").Append(ManipulatedInfo.GetUpdateCounter()).Append(" EndState=").Append(ManipulatedInfo.GetEndTransitStateName()).Append(" WorldTime=").Append(FixedTime.Time));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateManipulateTransformByCurve(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ManipulatedByCurve &inout CurveComp, const FC_Transform &inout Transform) const
    {
        int local_10 = 0;
        int local_38 = 0;
        int local_48 = 0;
        if (!(CurveComp.GetMasterEntity().IsValid()))
        {
            return;
        }
        if (int(CurveComp.GetPhase()) != 1)
        {
            return;
        }
        if (!(local_10))
        {
            return;
        }
        float32 local_12 = this.GetCapsuleHalfHeight(Entity);
        float32 local_11 = this.GetCapsuleHalfHeight(CurveComp.GetMasterEntity());
        FVector local_20;
        FQuat local_28;
        this.ComposeSlaveTransform(local_10.GetPosition(), local_10.GetRotation(), local_11, local_12, CurveComp.GetRelativeLocationOffset(), CurveComp.GetRelativeRotationOffset(), local_20, local_28);
        Entity.MoveTo(local_20, local_28, FFPTime(-1));
        FECSWorldPtr local_32 = this.GetECSWorld();
        if (FFPTime(local_38.Time).opCmp(0.0) >= 0)
        {
            FFPTime local_42 = FFPTime(local_38.Time);
            if (!((local_48.SampleMasterEntity == CurveComp.GetMasterEntity())))
            {
                local_48.Samples.Reset(0);
                local_48.SampleMasterEntity = CurveComp.GetMasterEntity();
            }
            if (local_48.Samples.Num() > 0 && (FFPTime(local_48.Samples[(local_48.Samples.Num() - 1)].Time).opCmp(local_42) >= 0))
            {
                local_48.Samples.RemoveAt((local_48.Samples.Num() - 1));
            }
            FManipulateOffsetSample local_74;
            local_74.Time = local_42;
            local_74.Loc = CurveComp.GetRelativeLocationOffset();
            local_74.Rot = CurveComp.GetRelativeRotationOffset();
            local_74.WorldLoc = local_20;
            local_48.Samples.Add(local_74);
            while (local_48.Samples.Num() > 32)
            {
                local_48.Samples.RemoveAt(0);
            }
        }
        return;
    }
    void DebugDrawViewSample(const FECSEntity &inout Entity, const FVector &inout FinalPos) const
    {
        return;
    }
    void SampleManipulateOffset(const FECSEntity &inout Entity, const FECSEntity &inout Master, const FC_ManipulatedByCurve &inout CurveComp, FVector &out OutOffLoc, FRotator &out OutOffRot) const
    {
        FVector local_6;
        int local_22 = 0;
        int local_38 = 0;
        float32 local_51;
        OutOffLoc = local_6;
        OutOffRot = FRotator();
        OutOffLoc = CurveComp.GetRelativeLocationOffset();
        OutOffRot = CurveComp.GetRelativeRotationOffset();
        FFPTime local_16 = FECSInterpoUtils::GetInterpoTime(Master);
        bool local_23 = !(local_22) || (local_16.opCmp(0.0) < 0);
        if (local_23)
        {
            local_23 = true;
        }
        else
        {
            local_23 = FECSEntity::Has<FC_LocalTag>(Master).opCall();
        }
        if (local_23)
        {
            return;
        }
        if (!(local_38) || !((local_38.SampleMasterEntity == Master)))
        {
            return;
        }
        int local_27 = local_38.Samples.Num();
        if (local_27 <= 0)
        {
            return;
        }
        bool local_28 = local_27 == 1 || (local_16.opCmp(local_38.Samples[0].Time) <= 0);
        if (local_28)
        {
            OutOffLoc = local_38.Samples[0].Loc;
            OutOffRot = local_38.Samples[0].Rot;
            return;
        }
        if ((local_16.opCmp(local_38.Samples[(local_27 - 1)].Time)) >= 0)
        {
            OutOffLoc = local_38.Samples[(local_27 - 1)].Loc;
            OutOffRot = local_38.Samples[(local_27 - 1)].Rot;
            return;
        }
        int local_44 = 0;
        for (; local_44 < (local_27 - 1); ++local_44)
        {
            if (local_16.opCmp(local_38.Samples[local_44].Time) < 0)
            {
                local_28 = false;
            }
            else
            {
                local_28 = ((local_16.opCmp(local_38.Samples[(local_44 + 1)].Time)) <= 0);
            }
            if (local_28)
            {
                float local_26 = local_38.Samples[(local_44 + 1)].Time.ToSeconds();
                local_26 = local_26 - local_38.Samples[local_44].Time.ToSeconds();
                float32 local_49 = float32(local_26);
                if (local_49 > 0.0f)
                {
                    float local_48 = local_16.ToSeconds();
                    local_26 = local_38.Samples[local_44].Time.ToSeconds();
                    local_48 = local_48 - local_26;
                    local_51 = float32(local_48) / local_49;
                }
                else
                {
                    local_51 = 0.0f;
                }
                OutOffLoc = FMath::Lerp(local_38.Samples[local_44].Loc, local_38.Samples[(local_44 + 1)].Loc, local_51);
                local_26 = local_51;
                OutOffRot = FQuat::Slerp(local_38.Samples[local_44].Rot.Quaternion(), (local_38.Samples[(local_44 + 1)].Rot.Quaternion()), local_26).Rotator();
                return;
            }
        }
        return;
    }
    bool ComputeSteadyTarget(const FECSEntity &inout Entity, const FC_ManipulatedByCurve &inout CurveComp, FVector &out OutLoc, FQuat &out OutRot, FVector &out OutRefPos, bool &out OutRefValid) const
    {
        FVector local_6;
        int local_56 = 0;
        int local_70 = 0;
        int local_88 = 0;
        float32 local_101;
        OutLoc = local_6;
        OutRot = FQuat();
        OutRefPos = local_6;
        OutRefValid = false;
        OutRefValid = false;
        OutRefPos = FVector::ZeroVector;
        FECSEntity local_30 = FECSEntity(CurveComp.GetMasterEntity());
        if (!(local_30.IsValid()))
        {
            return false;
        }
        FVector local_36;
        FQuat local_44;
        FFPTime local_48 = FECSInterpoUtils::GetInterpoTime(local_30);
        bool local_49 = false;
        Has local_64;
        if (local_56 && (local_48.opCmp(0.0) >= 0) && !(local_64.opCall()))
        {
            local_36 = local_56.GetPosition();
            local_44 = local_56.GetRotation();
            local_49 = true;
        }
        else
        {
            if (!(local_70))
            {
                return false;
            }
            local_36 = local_70.GetPosition();
            local_44 = local_70.GetRotation();
        }
        FVector local_76(CurveComp.GetRelativeLocationOffset());
        FRotator local_82 = FRotator(CurveComp.GetRelativeRotationOffset());
        if (local_49)
        {
            bool local_25_2 = local_88 && (local_88.SampleMasterEntity == local_30);
            if (local_25_2)
            {
                int local_59 = local_88.Samples.Num();
                if (local_59 == 1)
                {
                    local_76 = local_88.Samples[0].Loc;
                    local_82 = local_88.Samples[0].Rot;
                    OutRefPos = local_88.Samples[0].WorldLoc;
                    local_25_2 = true;
                    OutRefValid = local_25_2;
                }
                else
                {
                    if (local_59 >= 2)
                    {
                        if (local_48.opCmp(local_88.Samples[0].Time) <= 0)
                        {
                            local_76 = local_88.Samples[0].Loc;
                            local_82 = local_88.Samples[0].Rot;
                            OutRefPos = local_88.Samples[0].WorldLoc;
                            local_25_2 = true;
                            OutRefValid = local_25_2;
                        }
                        else
                        {
                            if ((local_48.opCmp(local_88.Samples[(local_59 - 1)].Time)) >= 0)
                            {
                                local_76 = local_88.Samples[(local_59 - 1)].Loc;
                                local_82 = local_88.Samples[(local_59 - 1)].Rot;
                                OutRefPos = local_88.Samples[(local_59 - 1)].WorldLoc;
                                local_25_2 = true;
                                OutRefValid = local_25_2;
                            }
                            else
                            {
                                int local_94 = 0;
                                for (; local_94 < (local_59 - 1); ++local_94)
                                {
                                    if (local_48.opCmp(local_88.Samples[local_94].Time) < 0)
                                    {
                                        local_25_2 = false;
                                    }
                                    else
                                    {
                                        local_25_2 = ((local_48.opCmp(local_88.Samples[(local_94 + 1)].Time)) <= 0);
                                    }
                                    if (local_25_2)
                                    {
                                        float local_58 = local_88.Samples[(local_94 + 1)].Time.ToSeconds();
                                        local_58 = local_58 - local_88.Samples[local_94].Time.ToSeconds();
                                        float32 local_99 = float32(local_58);
                                        if (local_99 > 0.0f)
                                        {
                                            float local_98 = local_48.ToSeconds();
                                            local_58 = local_88.Samples[local_94].Time.ToSeconds();
                                            local_98 = local_98 - local_58;
                                            float32 local_96 = float32(local_98);
                                            local_101 = local_96 / local_99;
                                        }
                                        else
                                        {
                                            local_101 = 0.0f;
                                        }
                                        float local_98_2 = local_101;
                                        local_76 = FMath::Lerp(local_88.Samples[local_94].Loc, local_88.Samples[(local_94 + 1)].Loc, local_98_2);
                                        local_58 = local_101;
                                        local_82 = FQuat::Slerp(local_88.Samples[local_94].Rot.Quaternion(), (local_88.Samples[(local_94 + 1)].Rot.Quaternion()), local_58).Rotator();
                                        local_98_2 = local_101;
                                        OutRefPos = FMath::Lerp(local_88.Samples[local_94].WorldLoc, local_88.Samples[(local_94 + 1)].WorldLoc, local_98_2);
                                        OutRefValid = true;
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        float32 local_96_2 = this.GetCapsuleHalfHeight(local_30);
        this.ComposeSlaveTransform(local_36, local_44, local_96_2, this.GetCapsuleHalfHeight(Entity), local_76, local_82, OutLoc, OutRot);
        return true;
    }
    UFUNCTION()
    void ClientJob_AlignSlaveInterpoTimeToMaster(const FECSEntity &inout Entity, const FC_ManipulatedByCurve &inout CurveComp) const
    {
        int local_6 = 0;
        int local_28 = 0;
        int local_38 = 0;
        bool local_14 = local_6 && (local_6.MasterEntity == CurveComp.GetMasterEntity());
        if ((int(CurveComp.GetPhase())) != 1 && !(local_14))
        {
            return;
        }
        FECSEntity local_22 = FECSEntity(CurveComp.GetMasterEntity());
        if (!(local_22.IsValid()))
        {
            return;
        }
        if (!(local_28) || (FFPTime(local_28.Time).opCmp(0.0) < 0))
        {
            return;
        }
        local_38.Time = local_28.Time;
        local_38.LastTime = local_28.LastTime;
        if (!(local_14))
        {
            ModifyOrAdd local_42;
            local_42.opCall().MasterEntity = local_22;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_AlignAttachedSlaveInterpoTimeToMaster(const FECSEntity &inout Entity, const FC_ManipulateAttachedInterpoClock &inout AttachedInterpoClock, const FC_SyncTransformAttachmentPresentation &inout Attachment, FC_InterpoTime &inout SlaveIT) const
    {
        Has local_4;
        int local_22 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        FECSEntity local_10 = AttachedInterpoClock.MasterEntity;
        if (!(local_10.IsValid()) || !((FECSEntity(Attachment.GetAttachToEntity()) == local_10)))
        {
            return;
        }
        if (!(local_22) || (FFPTime(local_22.Time).opCmp(0.0) < 0))
        {
            return;
        }
        SlaveIT.Time = local_22.Time;
        SlaveIT.LastTime = local_22.LastTime;
        return;
    }
    UFUNCTION()
    void ClientJob_ApplyManipulateCurveRootAlign(const FECSEntity &inout Entity, FC_ViewEntityManager &inout ViewEntityManager, const FC_ManipulatedByCurve &inout CurveComp) const
    {
        USkeletalMeshComponent local_32;
        USkeletalMeshComponent local_34;
        if ((int(CurveComp.GetPhase())) != 1)
        {
            return;
        }
        FECSEntity local_8 = FECSEntity(CurveComp.GetMasterEntity());
        if (!(local_8.IsValid()))
        {
            return;
        }
        AActor local_12 = Entity.GetMutableActor();
        if (local_12 == nullptr)
        {
            return;
        }
        FVector local_18;
        FQuat local_28;
        bool local_29 = false;
        FVector local_140;
        FQuat local_84;
        if (this.GetSkeletalMeshFromEntity(Entity, local_32) && this.GetSkeletalMeshFromEntity(local_8, local_34) && local_32.DoesSocketExist(n"Root") && local_34.DoesSocketExist(n"Root"))
        {
            FVector local_42;
            FRotator local_48;
            if (!(local_8.ESMSampleManipulateCurve(CurveComp.GetRelativeLocationCurveBBVar(), CurveComp.GetRelativeRotationCurveBBVar(), local_42, local_48)))
            {
                this.SampleManipulateOffset(Entity, local_8, CurveComp, local_42, local_48);
            }
            local_84 = local_48.Quaternion();
            FTransform local_132;
            if (this.ComputeAlignTransformInSystem(local_32, local_34, n"Root", n"Root", EViewSocketAlignMode(1), FTransform(), local_132))
            {
                local_18 = local_132.GetLocation();
                local_28 = local_132.GetRotation();
                local_29 = true;
            }
        }
        if (!(local_29))
        {
            FVector local_42;
            bool local_141;
            if (!(this.ComputeSteadyTarget(Entity, CurveComp, local_18, local_28, local_42, local_141)))
            {
                return;
            }
        }
        Get local_146;
        const FC_ManipulateCurveViewBlend& local_148 = local_146.opCall();
        if (local_148)
        {
            if (local_148.bBlendingOut)
            {
                Remove local_152;
                local_152.opCall();
            }
        }
        Has local_156;
        if (!(local_156.opCall()))
        {
            bool local_4;
            local_148.SmoothSpeed = CurveComp.GetSmoothSpeed();
            local_140 = local_12.GetActorLocation();
            local_84 = local_12.GetActorQuat();
            local_148.OffsetLocation = (local_140 - local_18);
            local_148.OffsetRotation = (local_84 * local_28.Inverse());
            local_4 = (CurveComp.GetSmoothSpeed() <= 0.0f);
            local_148.bEnterDone = local_4;
            local_148.bBlendingOut = false;
            Assign local_186;
            local_186.opCall(FC_TransformSyncDisabled());
        }
        if (!(local_148))
        {
            return;
        }
        local_148.SmoothSpeed = CurveComp.GetSmoothSpeed();
        if (local_148.bEnterDone)
        {
            local_140 = local_18;
            local_84 = local_28;
        }
        else
        {
            bool local_4;
            float local_198 = ECS::GetContextDeltaTime().ToSeconds();
            float32 local_193 = 1.0f - FMath::Exp((-CurveComp.GetSmoothSpeed() * float32(local_198)));
            local_148.OffsetLocation = FMath::Lerp(local_148.OffsetLocation, FVector::ZeroVector, local_193);
            local_148.OffsetRotation = FQuat::Slerp(local_148.OffsetRotation, FQuat::Identity, local_193);
            float local_198_4 = local_148.OffsetLocation.SizeSquared();
            if (local_198_4 < (0.01))
            {
                local_148.bEnterDone = true;
                local_140 = local_18;
                local_84 = local_28;
            }
            else
            {
                local_140 = (local_18 + local_148.OffsetLocation);
                FQuat local_172 = local_148.OffsetRotation;
                local_84 = (local_172 * local_28);
            }
        }
        local_12.SetActorLocationAndRotation(local_140, local_84.Rotator(), false);
        this.DebugDrawViewSample(Entity, local_140);
        return;
    }
    UFUNCTION()
    void ClientJob_ManipulateCurveBlendOut(const FECSEntity &inout Entity, FC_ViewEntityManager &inout ViewEntityManager, FC_ManipulateCurveViewBlend &inout ViewBlend) const
    {
        const AActor local_56;
        int local_98 = 0;
        if (!(ViewBlend.bBlendingOut))
        {
            this.CleanupCurveViewBlend(Entity);
            return;
        }
        if (!(ViewEntityManager.GetGameActorEntity().IsValid()))
        {
            this.CleanupCurveViewBlend(Entity);
            return;
        }
        FVector local_16;
        FQuat local_24;
        Get local_28;
        const FC_InterpoTransform& local_30 = local_28.opCall();
        if (local_30)
        {
            local_16 = local_30.GetPosition();
            local_24 = local_30.GetRotation();
        }
        else
        {
            Get local_34;
            const FC_Transform& local_36 = local_34.opCall();
            if (local_36)
            {
                local_16 = local_36.GetPosition();
                local_24 = local_36.GetRotation();
            }
            else
            {
                this.CleanupCurveViewBlend(Entity);
                return;
            }
        }
        if (!(ViewBlend.bBlendOutInit))
        {
            FVector local_42 = local_16;
            FQuat local_52 = local_24;
            local_56 = Entity.GetActor();
            if (local_56 != nullptr)
            {
                local_42 = local_56.GetActorLocation();
                local_52 = local_56.GetActorQuat();
            }
            ViewBlend.OffsetLocation = (local_42 - local_16);
            ViewBlend.OffsetRotation = (local_52 * local_24.Inverse());
            ViewBlend.bBlendOutInit = true;
        }
        float local_86 = ECS::GetContextDeltaTime().ToSeconds();
        float32 local_81 = 1.0f - FMath::Exp((-ViewBlend.SmoothSpeed * float32(local_86)));
        ViewBlend.OffsetLocation = FMath::Lerp(ViewBlend.OffsetLocation, FVector::ZeroVector, local_81);
        ViewBlend.OffsetRotation = FQuat::Slerp(ViewBlend.OffsetRotation, FQuat::Identity, local_81);
        float local_86_4 = ViewBlend.OffsetLocation.SizeSquared();
        if (local_86_4 < 0.01)
        {
            this.CleanupCurveViewBlend(Entity);
            return;
        }
        local_98.Transform.SetLocation((local_16 + ViewBlend.OffsetLocation));
        local_98.Transform.SetRotation((ViewBlend.OffsetRotation * local_24));
        return;
    }
    void CleanupCurveViewBlend(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        Has local_10;
        Has local_14;
        if (local_10.opCall() && !(local_14.opCall()))
        {
            Remove local_20;
            local_20.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnViewRemoveManipulateCurve(const FECSEntity &inout Entity, const FC_ManipulatedByCurve &inout CurveComp) const
    {
        FC_ManipulateCurveViewBlend local_16;
        if (!(Entity.IsValid()))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Remove local_10;
            local_10.opCall();
        }
        if (!(local_16))
        {
            Has local_24;
            Has local_20;
            if (local_20.opCall() && !(local_24.opCall()))
            {
                Remove local_30;
                local_30.opCall();
            }
            return;
        }
        if (local_16.SmoothSpeed <= 0.0f)
        {
            this.CleanupCurveViewBlend(Entity);
            return;
        }
        local_16.bBlendingOut = true;
        local_16.bBlendOutInit = false;
        return;
    }
    UFUNCTION()
    void Monitor_OnLogicRemoveManipulateCurve(const FECSEntity &inout Entity, const FC_ManipulatedByCurve &inout CurveComp) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Remove local_10;
            local_10.opCall();
        }
        Modify local_14;
        FC_Transform& local_16 = local_14.opCall();
        if (local_16)
        {
            Get local_20;
            if (local_20.opCall())
            {
                FQuat local_60 = FRotator(0.0, local_16.GetRotation().Rotator().Yaw, 0.0).Quaternion();
                Entity.MoveTo(local_16.GetPosition(), local_60, FFPTime(-1));
            }
        }
        return;
    }
    bool GetSkeletalMeshFromEntity(const FECSEntity &inout Entity, USkeletalMeshComponent &inout OutMesh) const
    {
        const AActor local_4;
        local_4 = Entity.GetActor();
        if (local_4 == nullptr)
        {
            return false;
        }
        OutMesh = Cast<USkeletalMeshComponent>(local_4.GetDefaultAttachComponent());
        if (OutMesh == nullptr)
        {
            OutMesh = Cast<USkeletalMeshComponent>(local_4.GetComponentByClass(USkeletalMeshComponent));
        }
        return (OutMesh != nullptr);
    }
    bool ComputeAlignTransformInSystem(const USkeletalMeshComponent SelfMesh, const USkeletalMeshComponent TargetMesh, const FName &inout SrcSocket, const FName &inout TgtSocket, const EViewSocketAlignMode Mode, const FTransform &inout CurveOffset, FTransform &inout OutNewActorTransform) const
    {
        if (int(Mode) == 1)
        {
            if (!(TargetMesh.DoesSocketExist(TgtSocket)))
            {
                return false;
            }
            else
            {
                FTransform local_28 = (CurveOffset * TargetMesh.GetSocketTransform(TgtSocket, ERelativeTransformSpace(0)));
                if (!(SelfMesh.DoesSocketExist(SrcSocket)))
                {
                    return false;
                }
                else
                {
                    OutNewActorTransform = (((SelfMesh.GetSocketTransform(SrcSocket, ERelativeTransformSpace(2)) * SelfMesh.GetRelativeTransform()).Inverse()) * local_28);
                    return true;
                }
            }
        }
        else
        {
            if (!(SelfMesh.DoesSocketExist(SrcSocket)))
            {
                return false;
            }
            else
            {
                FTransform local_56 = (CurveOffset * SelfMesh.GetSocketTransform(SrcSocket, ERelativeTransformSpace(0)));
                if (!(TargetMesh.DoesSocketExist(TgtSocket)))
                {
                    return false;
                }
                else
                {
                    OutNewActorTransform = (((TargetMesh.GetSocketTransform(TgtSocket, ERelativeTransformSpace(2)) * TargetMesh.GetRelativeTransform()).Inverse()) * local_56);
                    return true;
                }
            }
        }
    }
    UFUNCTION()
    void ClientJob_ApplyViewSocketAlign(const FECSEntity &inout Entity, FC_ViewSocketAlign &inout AlignComp) const
    {
        USkeletalMeshComponent local_8;
        USkeletalMeshComponent local_10;
        AActor local_4 = Entity.GetMutableActor();
        if (local_4 == nullptr)
        {
            return;
        }
        if (!(AlignComp.SelfEntity.IsValid()) || !(AlignComp.TargetEntity.IsValid()))
        {
            return;
        }
        if (!(this.GetSkeletalMeshFromEntity(AlignComp.SelfEntity, local_8)) || !(this.GetSkeletalMeshFromEntity(AlignComp.TargetEntity, local_10)))
        {
            return;
        }
        FTransform local_36;
        if (!(this.ComputeAlignTransformInSystem(local_8, local_10, AlignComp.SourceSocketName, AlignComp.TargetSocketName, AlignComp.AlignMode, AlignComp.CurveOffset, local_36)))
        {
            return;
        }
        FVector local_50 = local_36.GetLocation();
        FQuat local_68 = local_36.GetRotation();
        if (!(AlignComp.bSmoothInitialized))
        {
            AlignComp.SmoothedLocation = local_50;
            AlignComp.SmoothedRotation = local_68;
            AlignComp.bSmoothInitialized = true;
        }
        else
        {
            if (AlignComp.SmoothSpeed > 0.0f)
            {
                float local_76 = ECS::GetContextDeltaTime().ToSeconds();
                float32 local_71 = 1.0f - FMath::Exp((-AlignComp.SmoothSpeed * float32(local_76)));
                local_76 = local_71;
                AlignComp.SmoothedLocation = FMath::Lerp(AlignComp.SmoothedLocation, local_50, local_76);
                local_76 = local_71;
                AlignComp.SmoothedRotation = FQuat::Slerp(AlignComp.SmoothedRotation, local_68, local_76);
            }
            else
            {
                AlignComp.SmoothedLocation = local_50;
                AlignComp.SmoothedRotation = local_68;
            }
        }
        FVector local_84 = AlignComp.SmoothedLocation;
        FQuat local_92 = AlignComp.SmoothedRotation;
        if (!(AlignComp.bBlendInitialized))
        {
            FQuat local_60 = local_4.GetActorQuat();
            AlignComp.StartLocationOffset = (local_4.GetActorLocation() - local_84);
            AlignComp.StartRotationOffset = (local_60 * local_92.Inverse());
            AlignComp.StartWorldTime = ECS::GetContextTime();
            AlignComp.bBlendInitialized = true;
        }
        if (AlignComp.BlendInDuration > 0.0f)
        {
            float local_76_2 = (ECS::GetContextTime() - AlignComp.StartWorldTime).ToSeconds();
            float32 local_77 = float32(local_76_2);
            if (local_77 < AlignComp.BlendInDuration)
            {
                float32 local_78 = FMath::Clamp(local_77 / AlignComp.BlendInDuration, 0.0f, 1.0f);
                local_76_2 = local_78;
                FVector local_98 = FMath::Lerp(AlignComp.StartLocationOffset, FVector::ZeroVector, local_76_2);
                local_76_2 = local_78;
                local_4.SetActorLocationAndRotation((local_84 + local_98), (FQuat::Slerp(AlignComp.StartRotationOffset, FQuat::Identity, local_76_2) * local_92).Rotator(), false);
                return;
            }
        }
        local_4.SetActorLocationAndRotation(local_84, local_92.Rotator(), false);
        return;
    }
    UFUNCTION()
    void Monitor_OnViewRemoveViewSocketAlign(const FECSEntity &inout Entity, const FC_ViewSocketAlign &inout AlignComp) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Has local_6;
        Has local_10;
        if (local_6.opCall() && !(local_10.opCall()))
        {
            Remove local_16;
            local_16.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateManipulatedInfo() const
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
                this.Job_UpdateManipulatedInfo(local_40, local_6, local_42);
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
            this.Job_UpdateManipulatedInfo(local_170, local_6, local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveManipulatedInfo() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorManipulatedInfoOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveManipulatedInfo(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanupOrphanedManipulateActionLifecycle() const
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
                this.Job_CleanupOrphanedManipulateActionLifecycle(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
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
            this.Job_CleanupOrphanedManipulateActionLifecycle(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanupOrphanedManipulateOffsetTrack() const
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
                this.Job_CleanupOrphanedManipulateOffsetTrack(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
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
            this.Job_CleanupOrphanedManipulateOffsetTrack(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleManipulateActionLifecycleLost() const
    {
        int local_6 = 0;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        MarkModifiedIfDirty local_58;
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
                this.ServerJob_HandleManipulateActionLifecycleLost(local_6, local_40, local_46);
                local_54.opCall(local_40);
                local_58.opCall(local_46);
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
            const FECSEntity& local_184 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_184.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_184);
            this.ServerJob_HandleManipulateActionLifecycleLost(local_6, local_40, local_46);
            local_54.opCall(local_40);
            local_58.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleManipulateMasterInvalid() const
    {
        int local_6 = 0;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
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
                this.ServerJob_HandleManipulateMasterInvalid(local_6, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            const FECSEntity& local_170 = local_134.Proceed();
            ++local_100;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_170.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_170);
            this.ServerJob_HandleManipulateMasterInvalid(local_6, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_HandleManipulateExit(const FC_ManipulatedInfo &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetExitTime());
        FName local_8 = FName("S_ManipulateSystem::Job_HandleManipulateExit");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_HandleManipulateExit(const FC_ManipulatedInfo &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetExitTime());
        FName local_8 = FName("S_ManipulateSystem::Job_HandleManipulateExit");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_HandleManipulateExit(const FC_ManipulatedInfo &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetExitTime());
        FName local_8 = FName("S_ManipulateSystem::Job_HandleManipulateExit");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_HandleManipulateExit() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorManipulatedInfoOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_HandleManipulateExit(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorManipulatedInfoOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_HandleManipulateExit(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_HandleManipulateExit() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorManipulatedInfoOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_HandleManipulateExit(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorManipulatedInfoOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_HandleManipulateExit(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_HandleManipulateExit() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorManipulatedInfoOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_HandleManipulateExit(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorManipulatedInfoOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_HandleManipulateExit(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleManipulateExit() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetExitTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetExitTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_HandleManipulateExit(local_68, local_6, local_70);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateManipulateTransformByCurve() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
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
                this.Job_UpdateManipulateTransformByCurve(local_40, local_6, local_42, local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateManipulateTransformByCurve(local_180, local_6, local_42, local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_AlignSlaveInterpoTimeToMaster() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
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
                this.ClientJob_AlignSlaveInterpoTimeToMaster(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_AlignSlaveInterpoTimeToMaster(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_AlignAttachedSlaveInterpoTimeToMaster() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_194 = 0;
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
                this.ClientJob_AlignAttachedSlaveInterpoTimeToMaster(local_36, local_38, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_96.Iterator();
        for (; local_156.CanProceed;)
        {
            local_36 = local_156.Proceed();
            ++local_122;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_AlignAttachedSlaveInterpoTimeToMaster(local_194, local_38, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_2.UpdateCachedEntityCount(local_122);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ApplyManipulateCurveRootAlign() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
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
                this.ClientJob_ApplyManipulateCurveRootAlign(local_36, local_38, local_44);
                local_52.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_ApplyManipulateCurveRootAlign(local_180, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ManipulateCurveBlendOut() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        MarkModifiedIfDirty local_56;
        int local_184 = 0;
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
                this.ClientJob_ManipulateCurveBlendOut(local_36, local_38, local_44);
                local_52.opCall(local_38);
                local_56.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        local_102.opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_36 = local_146.Proceed();
            ++local_112;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_ManipulateCurveBlendOut(local_184, local_38, local_44);
            local_52.opCall(local_38);
            local_56.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_112);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnViewRemoveManipulateCurve() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorManipulatedByCurveOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnViewRemoveManipulateCurve(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnLogicRemoveManipulateCurve() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorManipulatedByCurveOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnLogicRemoveManipulateCurve(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ApplyViewSocketAlign() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_166 = 0;
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
                this.ClientJob_ApplyViewSocketAlign(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_ApplyViewSocketAlign(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnViewRemoveViewSocketAlign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorViewSocketAlignOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnViewRemoveViewSocketAlign(local_46, local_52);
        }
        return;
    }
}

