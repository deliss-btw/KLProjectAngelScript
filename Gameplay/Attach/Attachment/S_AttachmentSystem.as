
const FConsoleVariable CVar_DisableAttachPresentation = FConsoleVariable();
const FConsoleVariable CVar_Attachment_AvoidPenetrationFromParentPos = FConsoleVariable();
const float32 DetachTeleportHoldCatchUpToleranceCm = 1f;
const float32 DetachTeleportHoldTimeoutSeconds = 0.5f;
const float32 DetachSweepSkinCm = 1f;

class US_AttachmentSystem : UECSScriptSystem
{
    US_AttachmentSystem()
    {
        return;
    }
    void InternalDetachFromEntity(const FECSEntity &inout ChildEntity) const
    {
        int local_6 = 0;
        bool local_7;
        Has local_14;
        int local_22 = 0;
        if (local_6)
        {
            const FECSEntity& local_10 = local_6.GetAttachToEntity();
            if (!((!((local_10 == ENTITY_NULL)))))
            {
                local_7 = false;
            }
            else
            {
                local_7 = local_14.opCall();
            }
            if (local_7)
            {
                if (local_22)
                {
                    if (local_22.GetChildren().Num() == 0)
                    {
                        Remove local_28;
                        local_28.opCall();
                    }
                }
            }
            local_7 = local_14.opCall();
            if (local_7)
            {
                Remove local_32;
                local_32.opCall();
                Remove local_36;
                local_36.opCall();
                Remove local_40;
                local_40.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleAttachmentOperation(const FCE_EntityAttachmentOperation &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        if (Event.bIsAttach)
        {
            this.HandleAttachToEntity(Event.Sender, Event.AttachEvent, FixedTime);
            return;
        }
        this.HandleDetachFromEntity(Event.Sender, Event.DetachEvent, FixedTime);
        return;
    }
    void HandleDetachFromEntity(const FECSEntity &inout ChildEntity, const FEventDetachFromEntity &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void HandleAttachToEntity(const FECSEntity &inout ChildEntity, const FEventAttachToEntity &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_4;
        bool local_6;
        int local_16 = 0;
        int local_22 = 0;
        int local_58 = 0;
        int local_150 = 0;
        Modify local_154;
        int local_174 = 0;
        if (ECS::GetRuntimeInfo().IsClient && !(local_4.opCall()))
        {
            return;
        }
        FECSEntity local_10 = FECSEntity(Event.GetParent());
        this.InternalDetachFromEntity(ChildEntity);
        local_16.SetParent(local_10);
        if (!(Event.GetAttachmentInfo().GetbAttachOffsetBaseOnRootTransform()) && !((Event.GetAttachmentInfo().GetSocketName() == NAME_None)) && (Event.GetAttachSocketUpdatePeriod() > 0))
        {
            local_22.SetAttachmentMode(ETransformAttachmentLogicMode(ETransformAttachmentLogicMode(0)));
        }
        else
        {
            local_22.SetAttachmentMode(ETransformAttachmentLogicMode(ETransformAttachmentLogicMode(1)));
        }
        local_22.SetAttachToEntity(local_10);
        local_22.SetLocationOffset(Event.GetAttachmentInfo().GetLocationOffset());
        local_22.SetRotationOffset(Event.GetAttachmentInfo().GetRotationOffset().Quaternion());
        local_22.SetSocketName(Event.GetAttachmentInfo().GetSocketName());
        local_22.SetAttachSocketUpdatePeriod(Event.GetAttachSocketUpdatePeriod());
        local_22.SetbRestoreAlignedStaticSocketOnDetach(Event.GetAttachmentInfo().GetbRestoreAlignedStaticSocketOnDetach());
        FVector local_42;
        if (Event.GetAttachmentInfo().GetbRestoreAlignedStaticSocketOnDetach())
        {
            local_42 = Event.GetAttachmentInfo().GetLocationOffset();
        }
        else
        {
            local_42 = FVector::ZeroVector;
        }
        local_22.SetAlignedStaticSocketInverseLocationOffset(local_42);
        FQuat local_52;
        if (Event.GetAttachmentInfo().GetbRestoreAlignedStaticSocketOnDetach())
        {
            local_52 = Event.GetAttachmentInfo().GetRotationOffset().Quaternion();
        }
        else
        {
            local_52 = FQuat::Identity;
        }
        local_22.SetAlignedStaticSocketInverseRotationOffset(local_52);
        if (local_10.IsValid())
        {
            if (!(Event.GetAttachmentInfo().GetbAttachOffsetBaseOnRootTransform()) && !((local_22.GetSocketName() == NAME_None)))
            {
                if (int(local_22.GetAttachmentMode()) == 1)
                {
                    bool local_59;
                    local_59 = false;
                    FTransform local_112 = FTransformUtils::GetSocketTransformInGameMesh(local_10, local_22.GetSocketName(), FixedTime.Time, local_59, FDownsampleConfig());
                    if (local_59)
                    {
                        local_22.SetLocationOffset((local_112.TransformPosition(Event.GetAttachmentInfo().GetLocationOffset()) - local_58.GetPosition()));
                        local_22.SetLocationOffset(local_58.GetRotation().UnrotateVector(local_22.GetLocationOffset()));
                        local_52 = local_112.GetRotation();
                        local_22.SetRotationOffset(((local_52.Rotator() - local_58.GetRotation().Rotator()) + Event.GetAttachmentInfo().GetRotationOffset()).Quaternion());
                    }
                }
            }
            else
            {
                Get local_140;
                const FC_DefaultAttachComponentMeshSpaceTransform& local_142 = local_140.opCall();
                if (local_142)
                {
                    local_22.SetLocationOffset(local_142.Transform.TransformPosition(Event.GetAttachmentInfo().GetLocationOffset()));
                    local_52 = local_142.Transform.TransformRotation(Event.GetAttachmentInfo().GetRotationOffset()).Quaternion();
                    local_22.SetRotationOffset(local_52);
                }
                else
                {
                    if (!(Event.GetLogicLocationOffsetExtra().IsNearlyZero(9.999999747378752e-5)))
                    {
                        local_22.SetLocationOffset((local_22.GetLocationOffset() + Event.GetLogicLocationOffsetExtra()));
                    }
                }
            }
        }
        if (!((local_10 == ENTITY_NULL)))
        {
            bool local_5 = local_4.opCall();
            if (local_5)
            {
                local_150.GetModify_Children().Add(ChildEntity);
                FC_CharacterMovement& local_156 = local_154.opCall();
                if (local_156)
                {
                    local_156.GetModify_AttachIgnoreCollisionEntities().AddUnique(ChildEntity);
                }
            }
            local_6 = local_4.opCall();
            if (local_6)
            {
                FC_CharacterMovement& local_156_2 = local_154.opCall();
                if (local_156_2)
                {
                    local_156_2.GetModify_AttachIgnoreCollisionEntities().AddUnique(local_10);
                }
                Assign local_160;
                local_160.opCall(FC_AttachIgnoreMovementTag());
                Modify local_166;
                FC_Rigidbody& local_168 = local_166.opCall();
                if (local_168)
                {
                    local_168.SetVelocity(FVector::ZeroVector);
                }
            }
        }
        local_174.SetAttachToEntity(local_10);
        local_174.SetLocationOffset(Event.GetAttachmentInfo().GetLocationOffset());
        local_52 = Event.GetAttachmentInfo().GetRotationOffset().Quaternion();
        local_174.SetRotationOffset(local_52);
        local_174.SetSocketName(Event.GetAttachmentInfo().GetSocketName());
        if (Event.GetAttachBlendInDuration() > 0.0f)
        {
            local_174.SetbNeedBlendInView(true);
            local_174.SetBlendKeepDuration(Event.GetAttachBlendKeepDuration());
            local_174.SetBlendInDuration(Event.GetAttachBlendInDuration());
        }
        if (Event.GetDetachBlendOutDuration() > 0.0f)
        {
            local_174.SetBlendOutDuration(Event.GetDetachBlendOutDuration());
        }
        local_174.SetAttachTime(FixedTime.Time);
        return;
    }
    UFUNCTION()
    void Job_UpdateAttachmentLogic(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_TransformAttachmentLogic &inout TransformAttachment, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_1;
        bool local_46;
        if (TransformAttachment.GetAttachToEntity().IsValid())
        {
            GetDefaulted local_6;
            FFPTime local_16 = (FFPTime(FixedTime.Time) + (local_6.opCall().GetOffsetTime((int(FixedTime.Frame) - 1))));
            FFPTime local_14 = (local_16 - local_6.opCall().GetOffsetTime((int(FixedTime.Frame) - 1)));
            FTransform local_44;
            if (int(TransformAttachment.GetAttachmentMode()) == 0)
            {
                local_1 = false;
                local_46 = local_1;
                FDownsampleConfig local_50 = FDownsampleConfig(TransformAttachment.GetAttachSocketUpdatePeriod(), Entity.GetIdValue() % TransformAttachment.GetAttachSocketUpdatePeriod(), FFPTime(FECSWorld::FixedFrameInterval));
                local_44 = FTransformUtils::GetSocketTransformInGameMesh(TransformAttachment.GetAttachToEntity(), TransformAttachment.GetSocketName(), local_14, local_46, local_50);
            }
            else
            {
                if (int(TransformAttachment.GetAttachmentMode()) == 2)
                {
                    local_1 = false;
                    local_46 = local_1;
                    local_44 = FTransformUtils::GetBoneTransformInGameMesh(TransformAttachment.GetAttachToEntity(), TransformAttachment.GetBoneIndex(), local_14, local_46);
                }
                else
                {
                    local_44 = FTransformUtils::SampleTransform(TransformAttachment.GetAttachToEntity(), local_14, true);
                }
            }
            FQuat local_96 = local_44.TransformRotation(TransformAttachment.GetRotationOffset());
            FVector local_102;
            if (TransformAttachment.GetbWorldSpaceLocationOffset())
            {
                local_102 = (local_44.GetLocation() + TransformAttachment.GetLocationOffset());
            }
            else
            {
                local_102 = local_44.TransformPosition(TransformAttachment.GetLocationOffset());
            }
            if (!((local_102 == Transform.GetPosition())) || !((local_96 == Transform.GetRotation())))
            {
                Has local_120;
                bool local_115 = local_120.opCall();
                if (local_115)
                {
                    Assign local_124;
                    local_124.opCall(FC_PendingCheckOverlappingTag());
                }
                Entity.MoveTo(local_102, local_96, FFPTime(-1));
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnAttachmentLogicRemove(const FECSEntity &inout Entity, const FC_TransformAttachmentLogic &inout TransformAttachment) const
    {
        bool local_5;
        if (!(FECSEntity(TransformAttachment.GetAttachToEntity()).IsValid()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            Modify local_16;
            FC_AttachmentChildren& local_18 = local_16.opCall();
            if (local_18)
            {
                if (local_18.GetChildren().Num() == 0)
                {
                    Remove local_24;
                    local_24.opCall();
                }
            }
        }
        if (Entity.IsValid())
        {
            Remove local_28;
            local_28.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DetachChildrenOnParentEndPlay(const FECSEntity &inout ParentEntity, const FC_AttachmentChildren &inout AttachmentChildren, const FCS_FixedTime &inout FixedTime) const
    {
        TArray<FECSEntity> local_4 = AttachmentChildren.GetChildren();
        FEventDetachFromEntity local_20;
        local_20.SetbUseDetachLocationOffset(false);
        local_20.SetbUseDetachRotationOffset(false);
        for (auto& local_36 : local_4)
        {
            if (!(local_36.IsValid()))
            {
                continue;
            }
            this.HandleDetachFromEntity(local_36, local_20, FixedTime);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnModifyAttachChildren(const FECSEntity &inout Entity, const FC_AttachmentChildren &inout AttachmentPresentation) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        FC_AttachChildrenChangedTag local_8;
        Assign local_6;
        local_6.opCall(local_8);
        return;
    }
    UFUNCTION()
    void Monitor_CancelDetachBlendOnPresentationAttach(const FECSEntity &inout Entity, const FC_SyncTransformAttachmentPresentation &inout AttachmentPresentation) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Remove local_6;
        local_6.opCall();
        Remove local_10;
        local_10.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_SyncPresentationDetach(const FECSEntity &inout Entity, const FC_SyncTransformAttachmentPresentation &inout AttachmentPresentation) const
    {
        int local_42 = 0;
        int local_48 = 0;
        int local_60 = 0;
        if (!(Entity.IsValid()))
        {
            return;
        }
        FECSViewDataUtils::ActorDetachFromParent(Entity);
        Remove local_6;
        local_6.opCall();
        Remove local_10;
        local_10.opCall();
        Has local_14;
        if (local_14.opCall() || !(AttachmentPresentation.GetAttachToEntity().IsValid()))
        {
            return;
        }
        if (AttachmentPresentation.GetBlendOutDuration() > 0.0f)
        {
            Assign local_26;
            Has local_22;
            FC_ViewDetachBlend local_34;
            if (!(local_22.opCall()))
            {
                local_26.opCall(FC_TransformSyncDisabled());
            }
            local_34.StartWorldTime = ECS::GetContextTime();
            local_34.BlendDuration = AttachmentPresentation.GetBlendOutDuration();
            local_34.bInitialized = false;
            return;
        }
        Has local_52;
        if (!(local_52.opCall()) && !(local_48.GetPosition().Equals(local_42.GetPosition(), 1.0)))
        {
            Assign local_26;
            Has local_22;
            if (!(local_22.opCall()))
            {
                local_26.opCall(FC_TransformSyncDisabled());
            }
            local_60.TargetLocation = local_42.GetPosition();
            local_60.TargetRotation = local_42.GetRotation();
            local_60.StartWorldTime = ECS::GetContextTime();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateDetachBlend(const FECSEntity &inout Entity, FC_ViewEntityManager &inout ViewEntityManager, FC_ViewDetachBlend &inout DetachBlend) const
    {
        AActor local_62;
        int local_114 = 0;
        if (!(Entity.IsValid()))
        {
            return;
        }
        FECSEntity local_10 = ViewEntityManager.GetGameActorEntity();
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
                this.FinishDetachBlend(Entity);
                return;
            }
        }
        if (!(DetachBlend.bInitialized))
        {
            FVector local_42 = local_16;
            FQuat local_52 = local_24;
            if (local_10.IsValid())
            {
                Get local_56;
                if (local_56.opCall())
                {
                    if (local_62 != nullptr)
                    {
                        local_42 = local_62.GetActorLocation();
                        local_52 = local_62.GetActorRotation().Quaternion();
                    }
                }
            }
            DetachBlend.InitialLocationOffset = (local_42 - local_16);
            DetachBlend.InitialRotationOffset = (local_52 * local_24.Inverse());
            DetachBlend.bInitialized = true;
        }
        bool local_93 = false;
        if (DetachBlend.BlendDuration > 0.0f && local_10.IsValid())
        {
            float local_104 = (ECS::GetContextTime() - DetachBlend.StartWorldTime).ToSeconds();
            float32 local_95 = float32(local_104);
            if (local_95 < DetachBlend.BlendDuration)
            {
                float32 local_97 = FMath::Clamp(local_95 / DetachBlend.BlendDuration, 0.0f, 1.0f);
                FVector local_68 = FMath::Lerp(DetachBlend.InitialLocationOffset, FVector::ZeroVector, local_97);
                FQuat local_92 = FQuat::Slerp(DetachBlend.InitialRotationOffset, FQuat::Identity, local_97);
                local_114.Transform.SetLocation((local_16 + local_68));
                local_114.Transform.SetRotation((local_92 * local_24));
                local_93 = true;
            }
        }
        if (!(local_93))
        {
            this.FinishDetachBlend(Entity);
        }
        return;
    }
    void FinishDetachBlend(const FECSEntity &inout Entity) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Remove local_10;
            local_10.opCall();
        }
        Remove local_14;
        local_14.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateDetachTeleportHold(const FECSEntity &inout Entity, FC_ViewEntityManager &inout ViewEntityManager, FC_ViewDetachTeleportHold &inout Hold) const
    {
        int local_16 = 0;
        int local_48 = 0;
        if (!(Entity.IsValid()))
        {
            return;
        }
        if (local_16.GetPosition().Equals(Hold.TargetLocation, 1.0) || (float32(((ECS::GetContextTime() - Hold.StartWorldTime).ToSeconds())) > 0.5f) || !(ViewEntityManager.GetGameActorEntity().IsValid()))
        {
            bool local_21;
            Remove local_34;
            local_34.opCall();
            Has local_38;
            local_21 = local_38.opCall();
            if (local_21)
            {
                Remove local_42;
                local_42.opCall();
            }
            return;
        }
        local_48.Transform.SetLocation(Hold.TargetLocation);
        local_48.Transform.SetRotation(Hold.TargetRotation);
        return;
    }
    UFUNCTION()
    void ClientJob_DoSyncPresentationAttach(const FECSEntity &inout Entity, FC_ViewEntityManager &inout ViewEntityManager, const FC_SyncTransformAttachmentPresentation &inout TransformAttachment) const
    {
        Assign local_34;
        FC_ViewTransformAttachmentPresentation& local_58;
        AActor local_130;
        int local_226 = 0;
        if (CVar_DisableAttachPresentation.GetBool())
        {
            return;
        }
        FFPTime local_6 = FECSInterpoUtils::GetInterpoTime(Entity);
        if (TransformAttachment.GetAttachToEntity().IsValid())
        {
            FECSEntity local_14 = ViewEntityManager.GetGameActorEntity();
            FECSEntity local_18;
            Get local_22;
            const FC_ViewEntityAttachment& local_24 = local_22.opCall();
            if (local_24)
            {
                local_18 = local_24.AttachTargetLogicEntity;
            }
            bool local_1 = !((local_18 == TransformAttachment.GetAttachToEntity()));
            if (local_1)
            {
                local_1 = true;
            }
            else
            {
                Has local_28;
                local_1 = local_28.opCall();
            }
            if (local_1)
            {
                bool local_29;
                FFPTime local_4 = FFPTime(TransformAttachment.GetAttachTime());
                if (local_4.opCmp(local_6) > 0)
                {
                    local_34.opCall(FC_TransformSyncDisabled());
                    return;
                }
                FVector local_42(FVector::ZeroVector);
                FQuat local_52 = FQuat(FQuat::Identity);
                if (TransformAttachment.GetbNeedBlendInView())
                {
                    bool local_1_2 = false;
                    FFPTime local_4_2 = FECSInterpoUtils::GetInterpoTime(TransformAttachment.GetAttachToEntity());
                    FTransform local_120 = FTransformUtils::GetSocketTransformInGameMesh(TransformAttachment.GetAttachToEntity(), TransformAttachment.GetSocketName(), local_4_2, local_1_2, FDownsampleConfig());
                    Get local_124;
                    if (local_124.opCall())
                    {
                        if (local_130 != nullptr)
                        {
                            FVector local_142 = local_130.GetActorLocation();
                            FQuat local_168 = local_130.GetActorRotation().Quaternion();
                            local_58.InitialLocationOffset = ((local_120.GetRotation().UnrotateVector((local_142 - local_120.GetLocation()))) - TransformAttachment.GetLocationOffset());
                            local_42 = local_58.InitialLocationOffset;
                            local_58.InitialRotationOffset = ((local_120.GetRotation().Inverse() * local_168) * TransformAttachment.GetRotationOffset().Inverse());
                            local_52 = local_58.InitialRotationOffset;
                            local_58.StartWorldTime = local_6;
                            if (TransformAttachment.GetBlendInDuration() > 0.0f)
                            {
                                local_58.BlendDuration = TransformAttachment.GetBlendInDuration();
                                local_58.StartWorldTime += FFPTime(TransformAttachment.GetBlendKeepDuration());
                            }
                        }
                    }
                }
                Remove local_204;
                local_204.opCall();
                FQuat local_196 = (local_52 * TransformAttachment.GetRotationOffset());
                Entity.ActorAttachTo(TransformAttachment.GetAttachToEntity(), NAME_None, TransformAttachment.GetSocketName(), (FVector(TransformAttachment.GetLocationOffset()) + local_42), local_196);
                Has local_208;
                local_29 = local_208.opCall();
                if (local_29)
                {
                    ModifyOrAdd local_212;
                    local_212.opCall();
                }
            }
            Has local_216;
            if (!(local_216.opCall()))
            {
                local_34.opCall(FC_TransformSyncDisabled());
            }
            Modify local_220;
            local_58 = local_220.opCall();
            if (local_58)
            {
                bool local_59;
                local_59 = false;
                if (local_58.BlendDuration > 0.0f)
                {
                    float local_200 = (ECS::GetContextTime() - local_58.StartWorldTime).ToSeconds();
                    float32 local_197 = float32(local_200);
                    if (local_197 < local_58.BlendDuration)
                    {
                        float32 local_198 = FMath::Clamp(local_197 / local_58.BlendDuration, 0.0f, 1.0f);
                        local_226.Transform.SetLocation((FVector(TransformAttachment.GetLocationOffset()) + FMath::Lerp(local_58.InitialLocationOffset, FVector::ZeroVector, local_198)));
                        local_226.Transform.SetRotation((FQuat::Slerp(local_58.InitialRotationOffset, FQuat::Identity, local_198) * TransformAttachment.GetRotationOffset()));
                        local_59 = true;
                    }
                }
                if (!(local_59))
                {
                    local_226.Transform.SetLocation(TransformAttachment.GetLocationOffset());
                    local_226.Transform.SetRotation(TransformAttachment.GetRotationOffset());
                    Remove local_238;
                    local_238.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAttachmentOperation() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityAttachmentOperation> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_EntityAttachmentOperation& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_HandleAttachmentOperation(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAttachmentLogic() const
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
                this.Job_UpdateAttachmentLogic(local_40, local_42, local_48, local_6);
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
            this.Job_UpdateAttachmentLogic(local_180, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnAttachmentLogicRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTransformAttachmentLogicOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnAttachmentLogicRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DetachChildrenOnParentEndPlay() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
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
                this.ServerJob_DetachChildrenOnParentEndPlay(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_DetachChildrenOnParentEndPlay(local_166, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnModifyAttachChildren() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAttachmentChildrenOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnModifyAttachChildren(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorAttachmentChildrenOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnModifyAttachChildren(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_CancelDetachBlendOnPresentationAttach() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncTransformAttachmentPresentationOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CancelDetachBlendOnPresentationAttach(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_SyncPresentationDetach() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncTransformAttachmentPresentationOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_SyncPresentationDetach(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateDetachBlend() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        MarkModifiedIfDirty local_56;
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
                this.ClientJob_UpdateDetachBlend(local_36, local_38, local_44);
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
        Exclude(local_94).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateDetachBlend(local_180, local_38, local_44);
            local_52.opCall(local_38);
            local_56.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateDetachTeleportHold() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        MarkModifiedIfDirty local_56;
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
                this.ClientJob_UpdateDetachTeleportHold(local_36, local_38, local_44);
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
        Exclude(local_94).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateDetachTeleportHold(local_180, local_38, local_44);
            local_52.opCall(local_38);
            local_56.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DoSyncPresentationAttach() const
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
                this.ClientJob_DoSyncPresentationAttach(local_36, local_38, local_44);
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
            this.ClientJob_DoSyncPresentationAttach(local_180, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

