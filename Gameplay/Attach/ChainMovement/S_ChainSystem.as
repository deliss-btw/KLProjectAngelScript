
const FConsoleVariable CVar_Chain_EnableNetPredict = FConsoleVariable();
const FConsoleVariable CVar_Chain_ForceModifyTransform = FConsoleVariable();
const FConsoleVariable CVar_Chain_ForceSyncNetTime = FConsoleVariable();
const FConsoleVariable CVar_Chain_DebugDraw = FConsoleVariable();
const FConsoleVariable CVar_Chain_EnableSmoothing = FConsoleVariable();

class US_ChainSystem : UECSScriptSystem
{
    US_ChainSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleChainToEntity(const FCE_ChainToEntity &inout Event) const
    {
        int local_2 = 0;
        FECSEntity local_4 = Event.Parent;
        if (local_2.IsValid() && local_4.IsValid())
        {
            this.InternalChainToEntity(local_2, local_4, Event.ChainParam);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleUnchainFromParent(const FCE_UnchainFromParent &inout Event) const
    {
        this.InternalUnchainFromParent(Event.Sender);
        return;
    }
    UFUNCTION()
    void Job_HandleUnchainAllChildren(const FCE_UnchainAllChildren &inout Event) const
    {
        this.InternalUnchainAllChildren(Event.Sender);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateChainNetPredictByParent(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        if (!(CVar_Chain_EnableNetPredict.GetBool()))
        {
            return;
        }
        Get local_6;
        const FC_ChainChildrenInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_12 = this.GetNetPlayerMaskFromChainParent(Entity);
            Get local_16;
            const FC_PlayerController& local_18 = local_16.opCall();
            if (local_18)
            {
                local_12 = local_12 | (1 << local_18.GetPlayerIndex());
            }
            for (auto& local_34 : local_8.GetChildren())
            {
                this.SetNetPredictForChildEntityRecursively(local_34, local_12);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateChainedNetPredictByChild(const FECSEntity &inout Entity, const FC_ChainParentInfo &inout ChainParentInfo) const
    {
        if (ECS::GetRuntimeInfo().IsServer && CVar_Chain_EnableNetPredict.GetBool())
        {
            this.InternalUpdateChainedNetPredict(Entity);
        }
        return;
    }
    UFUNCTION()
    void Monitor_UnchainPrentOnInactive(const FECSEntity &inout Entity, const FC_ChainParentInfo &inout ChainParentInfo) const
    {
        if (ChainParentInfo)
        {
            SendEvent local_6;
            local_6.opCall(FFPTime(-1));
        }
        return;
    }
    UFUNCTION()
    void Monitor_UnchainChildrenOnInactive(const FECSEntity &inout Entity, const FC_ChainChildrenInfo &inout ChainChildrenInfo) const
    {
        if (ChainChildrenInfo)
        {
            SendEvent local_6;
            local_6.opCall(FFPTime(-1));
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateChainedTransform(const FECSEntity &inout ParentEntity, const FC_ChainChildrenInfo &inout ChainChildrenInfo, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_6;
        this.InternalUpdateChainedTransformRecursively(ParentEntity, ChainChildrenInfo, FixedTime, local_6.opCall());
        return;
    }
    UFUNCTION()
    void Job_UpdateSyncNetTime(const FECSEntity &inout ParentEntity, const FC_ChainChildrenInfo &inout ChainChildrenInfo, const FCS_FixedTime &inout FixedTime) const
    {
        this.SetSyncNetTime(ParentEntity, FixedTime);
        this.SetSyncNetTimeRecursively(ChainChildrenInfo, FixedTime);
        return;
    }
    void SetSyncNetTimeRecursively(const FC_ChainChildrenInfo &inout ChainChildrenInfo, const FCS_FixedTime &inout FixedTime) const
    {
        for (auto& local_16 : ChainChildrenInfo.GetChildren())
        {
            this.SetSyncNetTime(local_16, FixedTime);
            Get local_20;
            const FC_ChainChildrenInfo& local_22 = local_20.opCall();
            if (local_22)
            {
                this.SetSyncNetTimeRecursively(local_22, FixedTime);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdatePartialPrediction(const FECSEntity &inout ChildEntity) const
    {
        FECSNetUtils::MarkPartialPredict(ChildEntity, FC_Transform);
        return;
    }
    FName GetChildExtraShapeIdentifier(const FECSEntity &inout ChildEntity) const
    {
        ChildEntity.GetId();
        FECSEntityId local_5;
        return FName(FString().Append("Chain_Ent").Append(local_5));
    }
    void TryPushChildExtraShape(const FECSEntity &inout ChildEntity, const FECSEntity &inout ParentEntity) const
    {
        int local_42 = 0;
        Get local_4;
        const FC_SimpleCollisionConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            if (!(local_6.bApplyExtraCollisionAsChainChild))
            {
                return;
            }
            FExtraCollisionShape local_36;
            local_36.SetbUseCustomShape(true);
            local_36.SetShape(local_6.Shape);
            local_36.SetPosOffset(local_6.PosOffset);
            local_36.SetRotOffset(local_6.RotOffset);
            local_36.SetResolveSourceEntity(ChildEntity);
            local_42.PushExtraShape(this.GetChildExtraShapeIdentifier(ChildEntity), local_36);
        }
        return;
    }
    void TryPopChildExtraShape(const FECSEntity &inout ChildEntity, const FECSEntity &inout ParentEntity) const
    {
        Get local_4;
        const FC_SimpleCollisionConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            if (!(local_6.bApplyExtraCollisionAsChainChild))
            {
                return;
            }
            Modify local_12;
            FC_CollisionOverrideStack& local_14 = local_12.opCall();
            if (local_14)
            {
                bool local_7 = local_14.PopExtraShape(this.GetChildExtraShapeIdentifier(ChildEntity));
                if (local_14.IsEmpty())
                {
                    Remove local_22;
                    local_22.opCall();
                }
            }
        }
        return;
    }
    void InternalUnchainFromParent(const FECSEntity &inout ChildEntity) const
    {
        int local_6 = 0;
        int local_20 = 0;
        if (!(local_6))
        {
            return;
        }
        const FECSEntity& local_10 = local_6.GetParent();
        Has local_14;
        bool local_7 = local_14.opCall();
        if (local_7)
        {
            this.TryPopChildExtraShape(ChildEntity, local_10);
            if (local_20)
            {
                if (local_20.GetChildren().Num() == 0)
                {
                    Remove local_26;
                    local_26.opCall();
                }
            }
        }
        bool local_7_2 = local_14.opCall();
        if (local_7_2)
        {
            Remove local_30;
            local_30.opCall();
            Remove local_34;
            local_34.opCall();
        }
        return;
    }
    void InternalUnchainAllChildren(const FECSEntity &inout ParentEntity) const
    {
        Has local_26;
        Get local_4;
        const FC_ChainChildrenInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto& local_22 : local_6.GetChildren())
            {
                bool local_7 = local_26.opCall();
                if (local_7)
                {
                    this.TryPopChildExtraShape(local_22, ParentEntity);
                }
                local_7 = local_26.opCall();
                if (local_7)
                {
                    Remove local_30;
                    local_30.opCall();
                    Remove local_34;
                    local_34.opCall();
                }
            }
        }
        bool local_7_2 = local_26.opCall();
        if (local_7_2)
        {
            Remove local_38;
            local_38.opCall();
        }
        return;
    }
    void InternalChainToEntity(const FECSEntity &inout ChildEntity, const FECSEntity &inout ParentEntity, const FChainParam &inout ChainParam) const
    {
        int local_74 = 0;
        int local_80 = 0;
        this.InternalUnchainFromParent(ChildEntity);
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            local_74.SetParent(ParentEntity);
            local_74.SetChainParam(ChainParam);
        }
        bool local_5_2 = local_4.opCall();
        if (local_5_2)
        {
            local_80.GetModify_Children().Add(ChildEntity);
            this.TryPushChildExtraShape(ChildEntity, ParentEntity);
        }
        return;
    }
    void InternalUpdateChainedTransformRecursively(const FECSEntity &inout ParentEntity, const FC_ChainChildrenInfo &inout ChainChildrenInfo, const FCS_FixedTime &inout FixedTime, const bool bControlledByPlayer) const
    {
        Has local_20;
        for (auto& local_16 : ChainChildrenInfo.GetChildren())
        {
            if (!(local_20.opCall()) && !(CVar_Chain_ForceModifyTransform.GetBool()))
            {
                continue;
            }
            Get local_26;
            const FC_ChainParentInfo& local_28 = local_26.opCall();
            if (local_28)
            {
                if ((FECSEntity(local_28.GetParent()) == ParentEntity))
                {
                    this.InternalUpdateChainedTransform(local_16, ParentEntity, local_28.GetChainParam(), FixedTime, bControlledByPlayer);
                }
            }
            Get local_36;
            const FC_ChainChildrenInfo& local_38 = local_36.opCall();
            if (local_38)
            {
                this.InternalUpdateChainedTransformRecursively(local_16, local_38, FixedTime, bControlledByPlayer);
            }
        }
        return;
    }
    void SetSyncNetTime(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        float32 local_8 = 0.0f;
        bool local_1 = !(CVar_Chain_ForceSyncNetTime.GetBool());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_1 = ECS::GetRuntimeInfo().IsServer;
        }
        Has local_6;
        local_1 = local_1 || !(local_6.opCall());
        if (local_1)
        {
            return;
        }
        int local_7 = 1056964608;
        int local_9 = 1050253722;
        int local_10 = 1056964608;
        ModifyOrAdd local_14;
        FC_InterpoBlend& local_16 = local_14.opCall();
        if (local_16)
        {
            FFPTime local_18 = FFPTime(FixedTime.Time);
            float32 local_19 = 1.0f - local_8;
            float32 local_21 = 0.5f;
            local_19 = local_19 / local_21;
            float32 local_22 = FMath::Max(0.1f, local_19);
            FFPTime local_28 = (local_18 + FFPTime(local_22));
            if (local_19 < 1.0f)
            {
                FInterpoBlendData local_38;
                local_38.SetLastBlendScale(local_8);
                local_38.SetBlendScale(1.0f);
                local_38.SetLastWorldTime(local_18);
                local_38.SetWorldTime((local_18 + FFPTime(local_22)));
                local_16.SetInterpoBlendData(local_38, FFPTime(-1));
            }
            FFPTime local_24 = ((FFPTime(FixedTime.Time) + FFPTime(local_22)) + FFPTime(0.5));
            local_19 = FMath::Max(0.1f, local_21 / 0.3f);
            FFPTime local_28_2 = (local_24 + FFPTime(local_19));
            if (0.0f > 0.0f)
            {
                FInterpoBlendData local_38;
                local_38.SetLastBlendScale(local_21);
                local_38.SetBlendScale(0.0f);
                local_38.SetLastWorldTime(local_24);
                local_38.SetWorldTime((local_24 + FFPTime(local_19)));
                local_16.SetInterpoBlendData(local_38, FFPTime(-1));
            }
        }
        return;
    }
    FECSEntity ResolveRollbackPawnEntity(const FECSEntity &inout ChildEntity, const FECSEntity &inout ParentEntity) const
    {
        int local_18 = 0;
        bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
        if (local_1)
        {
            Has local_6;
            if (local_6.opCall() && !(local_6.opCall()))
            {
                return ::FASCommonUtils::GetLocalPlayerPawnEntity();
            }
            return ENTITY_NULL;
        }
        if (!(local_18))
        {
            return ENTITY_NULL;
        }
        local_18.GetMask();
        FNetPlayerMask local_20;
        if (local_20.IsEmpty())
        {
            local_1 = true;
        }
        else
        {
            GetDefaulted local_26;
            local_26.opCall().GetMask();
            FBitSet64 local_22;
            local_1 = local_20.IsIntersect(local_22);
        }
        if (local_1)
        {
            return ENTITY_NULL;
        }
        for (auto& local_44 : FGameUtils::GetAllPlayerControllerEntities(true))
        {
            local_44;
            Get local_48;
            const FC_PlayerController& local_50 = local_48.opCall();
            if (local_50)
            {
                if (local_20.GetBit(local_50.GetPlayerIndex()))
                {
                    return local_50.GetPlayerPawnEntity();
                }
            }
        }
        return ENTITY_NULL;
    }
    void InternalUpdateChainedTransform(const FECSEntity &inout ChildEntity, const FECSEntity &inout ParentEntity, const FChainParam &inout ChainParam, const FCS_FixedTime &inout FixedTime, const bool bControlledByPlayer) const
    {
        bool local_11;
        int local_232 = 0;
        FECSEntity local_8 = this.ResolveRollbackPawnEntity(ChildEntity, ParentEntity);
        FFPTime local_18;
        if (!((local_8 == ENTITY_NULL)))
        {
            local_18 = (FTransformUtils::GetPlayerRollbackTime(local_8, FixedTime) - FECSWorld::FixedFrameInterval);
        }
        else
        {
            local_18 = FixedTime.Time;
        }
        FTransform local_68 = FTransformUtils::SampleTransform(ParentEntity, local_18, true);
        GetDefaulted local_96;
        FTransform local_44 = local_96.opCall().ToFTransform();
        FTransform local_120;
        FTransform local_144;
        FTransform local_92 = this.GetJointTransform(ParentEntity, local_68, local_120, ChainParam.GetParentJointInfo(), local_18);
        FTransform local_168 = this.GetJointTransform(ChildEntity, local_44, local_144, ChainParam.GetChildJointInfo(), FixedTime.Time);
        local_11 = ChainParam.GetLinkInfo().GetbEnableSmoothing() && CVar_Chain_EnableSmoothing.GetBool();
        Get local_198;
        const FC_Rigidbody& local_200 = local_198.opCall();
        if (local_200)
        {
            if (local_200.GetVelocity().DotProduct(local_68.GetRotation().GetForwardVector()) < 0.0)
            {
            }
        }
        if (bControlledByPlayer)
        {
            local_11 = false;
        }
        bool local_194 = !(local_11);
        if (!(local_194))
        {
            local_194 = false;
        }
        else
        {
            Has local_222;
            local_194 = local_222.opCall();
        }
        if (local_194)
        {
            Remove local_226;
            local_226.opCall();
        }
        if (local_11)
        {
            if (!(local_232.GetbParentJointLocationInited()))
            {
                local_232.SetbParentJointLocationInited(true);
                local_232.SetSmoothedParentJointLocation(FVector3f(local_92.GetLocation()));
            }
            else
            {
                FVector local_260 = FMath::Lerp((FVector(local_232.GetSmoothedParentJointLocation()) + (((local_92.GetLocation() - FVector(local_232.GetSmoothedParentJointLocation())).ProjectOnTo(local_68.GetRotation().GetForwardVector())) + ((FVector(local_232.GetPrevVelocity()).ProjectOnTo(local_68.GetRotation().GetRightVector()) * FixedTime.DeltaTime.ToSeconds()) * 0.5))), local_92.GetLocation(), this.CalcDampCoefficient(FixedTime, 0.15f));
                local_232.SetSmoothedParentJointLocation(FVector3f(local_260));
                local_92.SetLocation(local_260);
            }
        }
        FVector3f local_235 = FVector3f((local_168.GetLocation() - local_92.GetLocation()));
        FVector3f local_279;
        if (ChainParam.GetLinkInfo().GetbRigid())
        {
            FVector local_248_2 = local_92.GetRotation().GetForwardVector();
            EJointRotationFreedom local_283 = ChainParam.GetParentJointInfo().GetRotationFreedom();
            FVector3f local_282;
            switch (int(local_283))
            {
            case 0:
            {
                local_282 = local_235.GetSafeNormal(1e-8f, FVector3f::ZeroVector);
                if (ChainParam.GetParentJointInfo().GetDeflectionAngleLimit() >= 0.0f)
                {
                    local_282 = FVector3f(FMathUtils::MoveTowards(FQuat::MakeFromX(local_248_2.opNeg()), FQuat::MakeFromX(FVector(local_282)), 1.0f, ChainParam.GetParentJointInfo().GetDeflectionAngleLimit()).GetForwardVector());
                }
                break;
            }
            case 1:
            {
                FVector3f local_276 = FVector3f(local_92.GetRotation().GetRotationAxis());
                local_282 = FVector3f(local_235).VectorPlaneProject(local_276).GetSafeNormal(1e-8f, FVector3f::ZeroVector);
                if (ChainParam.GetParentJointInfo().GetDeflectionAngleLimit() >= 0.0f)
                {
                    local_282 = FVector3f(FMathUtils::MoveTowards(FQuat::MakeFromX(local_248_2.opNeg()), FQuat::MakeFromX(FVector(local_282)), 1.0f, ChainParam.GetParentJointInfo().GetDeflectionAngleLimit()).GetForwardVector());
                }
                break;
            }
            case 2:
            {
                local_282 = FVector3f(local_248_2).opNeg();
                break;
            }
            }
            local_279 = (local_282 * ChainParam.GetLinkInfo().GetLength());
        }
        else
        {
            local_279 = local_235.GetClampedToMaxSize(ChainParam.GetLinkInfo().GetLength());
        }
        FVector local_242_2 = FVector(local_279);
        FVector local_272 = (local_92.GetLocation() + local_242_2);
        if (local_11)
        {
            int64 local_312 = 4607182418800017408;
            int64 local_314 = 4596373779694328218;
            int64 local_316 = 4624633867356078080;
            FVector local_254 = (local_272 - local_168.GetLocation());
            local_242_2 = (local_254 - FVector(local_232.GetPrevDiff()));
            FVector local_266_2 = FVector(local_232.GetPrevVelocity());
            FVector local_248_3 = (local_254 * 0.2);
            float local_216 = float32(FixedTime.DeltaTime.ToSeconds());
            FVector local_214_2 = (local_248_3 * local_216);
            FVector local_260_2 = (local_242_2 * 15.0);
            FVector local_248_4 = (local_214_2 + local_260_2);
            FVector local_260_3 = (local_248_4 / 1.0);
            FVector local_214_3 = (local_266_2 + local_260_3);
            local_232.SetPrevVelocity(FVector3f(local_214_3));
            local_232.SetPrevDiff(FVector3f(local_254));
            FVector local_260_4 = local_168.GetLocation();
            FVector local_248_5 = (local_260_4 + (local_214_3 * FixedTime.DeltaTime.ToSeconds()));
            if ((local_248_5 - local_92.GetLocation()).DotProduct(FVector(local_279)) >= 0.0)
            {
                local_272 = local_248_5;
                FVector local_322_2 = (local_272 - local_92.GetLocation());
                local_279 = FVector3f(local_322_2);
            }
        }
        FQuat local_336;
        FVector local_266_3 = local_44.TransformPosition(FVector(ChainParam.GetChildCenterInfo().GetLocationOffset()));
        bool local_337 = false;
        switch (int(ChainParam.GetChildJointInfo().GetRotationFreedom()))
        {
            FVector3f local_282;
        case 0:
        {
            FVector3f local_310 = FVector3f((local_168.GetLocation() - local_266_3));
            local_282 = (local_279 - local_235);
            FVector local_248_6 = (local_272 - local_266_3);
            FVector3f local_276_2 = (FVector3f(local_248_6) - local_282.ProjectOnTo(local_310));
            local_336 = FQuat::FindBetweenVectors(FVector(local_310), FVector(local_276_2));
            if (ChainParam.GetChildJointInfo().GetDeflectionAngleLimit() >= 0.0f)
            {
                FQuat local_208 = (local_336 * local_168.GetRotation());
                FQuat local_352 = FMathUtils::MoveTowards(FQuat::MakeFromX(FVector(local_279.opNeg())), local_208, 1.0f, ChainParam.GetChildJointInfo().GetDeflectionAngleLimit());
                if (!(local_352.Equals(local_208, 0.001)))
                {
                    local_336 = (local_352 * local_168.GetRotation().Inverse());
                    local_337 = true;
                }
            }
            break;
        }
        case 1:
        {
            FVector local_328_2 = local_168.GetRotation().GetRotationAxis();
            local_242_2 = (local_168.GetLocation() - local_266_3);
            FVector local_214_4 = (local_272 - local_266_3);
            FVector local_366 = (local_214_4 - (FVector((local_279 - local_235))).ProjectOnTo(local_242_2));
            local_242_2 = local_242_2.VectorPlaneProject(local_328_2);
            local_366 = local_366.VectorPlaneProject(local_328_2);
            local_336 = FQuat::FindBetweenVectors(local_242_2, local_366);
            if (ChainParam.GetChildJointInfo().GetDeflectionAngleLimit() >= 0.0f)
            {
                FVector local_322_3 = local_168.GetRotation().GetForwardVector().VectorPlaneProject(local_328_2);
                FVector local_248_7 = (local_336 * local_322_3);
                FVector local_372 = FMathUtils::MoveTowards(FQuat::MakeFromX(FVector(local_279.opNeg()).VectorPlaneProject(local_328_2)), FQuat::MakeFromX(local_248_7), 1.0f, ChainParam.GetChildJointInfo().GetDeflectionAngleLimit()).GetForwardVector();
                if (!(local_372.Equals(local_248_7, 0.01)))
                {
                    local_336 = FQuat::FindBetweenVectors(local_322_3, local_372);
                    local_337 = true;
                }
            }
            break;
        }
        case 2:
        {
            local_336 = (FQuat::MakeFromXZ(FVector(local_279.opNeg()), FVector::UpVector) * local_168.GetRotation().Inverse());
            break;
        }
        }
        FQuat local_296 = FQuat::MakeFromXZ((local_336 * local_44.GetRotation()).GetForwardVector().GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector), FVector::UpVector);
        Has local_394;
        bool local_193 = local_394.opCall();
        if (!(local_193))
        {
            local_193 = false;
        }
        else
        {
            Has local_398;
            local_193 = local_398.opCall();
        }
        FQuat local_360;
        if (local_193)
        {
            FRotator local_404 = local_44.GetRotation().Rotator();
            local_360 = FRotator(local_404.Pitch, local_296.Rotator().Yaw, local_404.Roll).Quaternion();
            if (ChainParam.GetChildJointInfo().GetDeflectionAngleLimit() >= 0.0f)
            {
                local_360 = FMathUtils::MoveTowards(FQuat::MakeFromX(FVector(local_279.opNeg())), local_360, 1.0f, ChainParam.GetChildJointInfo().GetDeflectionAngleLimit());
            }
        }
        else
        {
            local_360 = local_296;
        }
        if (local_11 && local_337)
        {
            local_360 = FQuat::Slerp(local_44.GetRotation(), local_360, float32((this.CalcDampCoefficient(FixedTime, 0.1f))));
        }
        FVector local_214_5 = FVector(ChainParam.GetChildJointInfo().GetLocationOffset());
        switch (int(ChainParam.GetChildJointInfo().GetRotationSpace()))
        {
        case 1:
        {
            local_242_2 = (local_272 - local_214_5);
            break;
        }
        case 0:
        {
            local_242_2 = (local_272 - local_360.RotateVector(local_214_5));
            break;
        }
        case 2:
        {
            local_242_2 = (local_272 - ((local_336 * local_144.GetRotation()).RotateVector(local_214_5)));
            break;
        }
        }
        if (CVar_Chain_DebugDraw.GetBool())
        {
            FECSDebugDraw::DrawDebugLine(NAME_None, local_272, local_92.GetLocation(), FColor::Yellow, FColor::Yellow, -1.0f, uint8(1), 2.0f);
            FECSDebugDraw::DrawDebugLine(NAME_None, local_242_2, local_272, FColor::Red, FColor::Red, -1.0f, uint8(1), 2.0f);
            FECSDebugDraw::DrawDebugSphere(NAME_None, local_272, 10.0f, 8, FColor::Red, FColor::Red, -1.0f, uint8(1), 0.0f);
            FECSDebugDraw::DrawDebugLine(NAME_None, local_68.GetLocation(), local_92.GetLocation(), FColor::Green, FColor::Green, -1.0f, uint8(1), 2.0f);
            FECSDebugDraw::DrawDebugSphere(NAME_None, local_92.GetLocation(), 10.0f, 8, FColor::Green, FColor::Green, -1.0f, uint8(1), 0.0f);
            FECSDebugDraw::DrawDebugSphere(NAME_None, local_266_3, 10.0f, 8, FColor::Orange, FColor::Orange, -1.0f, uint8(1), 0.0f);
        }
        if (local_242_2.Equals(local_44.GetLocation(), 0.001) && local_360.Equals(local_44.GetRotation(), 0.001))
        {
            return;
        }
        if (CVar_Chain_ForceModifyTransform.GetBool())
        {
            Has local_222;
            bool local_193_2 = local_222.opCall();
            if (local_193_2)
            {
                ChildEntity.MoveTo(local_242_2, local_360, FFPTime(-1));
            }
            else
            {
                if (FECSNetUtils::CheckLocalModifiable(ChildEntity, FC_Transform))
                {
                    ChildEntity.MoveTo(local_242_2, local_360, FFPTime(-1));
                }
            }
            return;
        }
        ChildEntity.MoveTo(local_242_2, local_360, FFPTime(-1));
        return;
    }
    void InternalUpdateChainedNetPredict(const FECSEntity &inout ChildEntity) const
    {
        this.SetNetPredictForChildEntityRecursively(ChildEntity, this.GetNetPlayerMaskFromChainParent(ChildEntity));
        return;
    }
    void SetNetPredictForChildEntityRecursively(const FECSEntity &inout ChildEntity, const uint64 BaseMask) const
    {
        int local_2 = BaseMask;
        FECSNetUtils::SetNetPredict(ChildEntity, FNetPlayerMask(local_2));
        Get local_8;
        const FC_ChainChildrenInfo& local_10 = local_8.opCall();
        if (local_10)
        {
            local_2 = local_2 | this.GetNetPlayerMask(ChildEntity);
            for (auto& local_28 : local_10.GetChildren())
            {
                this.SetNetPredictForChildEntityRecursively(local_28, local_2);
            }
        }
        return;
    }
    uint64 GetNetPlayerMaskFromChainParent(const FECSEntity &inout ChildEntity) const
    {
        int64 local_2 = 0;
        GetDefaulted local_12;
        FECSEntity local_8 = FECSEntity(local_12.opCall().GetParent());
        while (local_8.IsValid())
        {
            local_2 = local_2 | this.GetNetPlayerMask(local_8);
            local_8 = local_12.opCall().GetParent();
        }
        return local_2;
    }
    uint64 GetNetPlayerMask(const FECSEntity &inout Entity) const
    {
        Get local_4;
        if (local_4.opCall())
        {
            Get local_12;
            const FC_PlayerController& local_14 = local_12.opCall();
            if (local_14)
            {
                int64 local_18 = 1 << local_14.GetPlayerIndex();
                return local_18;
            }
        }
        int64 local_18_2 = 0;
        return local_18_2;
    }
    FTransform GetJointTransform(const FECSEntity &inout Entity, const FTransform &inout EntityTransform, FTransform &inout RawTargetTransform, const FChainJointInfo &inout JointInfo, const FFPTime &inout SampleTime) const
    {
        FTransform local_24 = EntityTransform;
        if (int(JointInfo.GetTransformType()) == 1)
        {
            bool local_29;
            local_29 = false;
            FTransform local_88 = FTransformUtils::GetSocketTransformInGameMesh(Entity, JointInfo.GetSocketName(), SampleTime, local_29, FDownsampleConfig());
            if (local_29)
            {
                local_24 = local_88;
            }
        }
        else
        {
            bool local_29;
            if (int(JointInfo.GetTransformType()) == 2)
            {
                local_29 = false;
                FTransform local_56 = FTransformUtils::GetBoneTransformInGameMesh(Entity, JointInfo.GetBoneIndex(), SampleTime, local_29);
                if (local_29)
                {
                    local_24 = local_56;
                }
            }
        }
        RawTargetTransform = local_24;
        switch (int(JointInfo.GetLocationSpace()))
        {
        case 1:
        {
            local_24.SetLocation((local_24.GetLocation() + FVector(JointInfo.GetLocationOffset())));
            break;
        }
        case 0:
        {
            local_24.SetLocation((local_24.GetLocation() + EntityTransform.TransformVector(FVector(JointInfo.GetLocationOffset()))));
            break;
        }
        case 2:
        {
            local_24.SetLocation((local_24.GetLocation() + local_24.TransformVector(FVector(JointInfo.GetLocationOffset()))));
            break;
        }
        }
        switch (int(JointInfo.GetRotationSpace()))
        {
        case 1:
        {
            local_24.SetRotation(JointInfo.GetRotationOffset());
            break;
        }
        case 0:
        {
            local_24.SetRotation(EntityTransform.TransformRotation(JointInfo.GetRotationOffset()));
            break;
        }
        case 2:
        {
            local_24.SetRotation(local_24.TransformRotation(JointInfo.GetRotationOffset()));
            break;
        }
        }
        return local_24;
    }
    float CalcDampCoefficient(const FCS_FixedTime &inout FixedTime, const float32 HalfTime) const
    {
        if (HalfTime <= 0.001f)
        {
            return 1.0;
        }
        float local_4 = FixedTime.DeltaTime.ToSeconds();
        float local_8 = 0.69314718056 * local_4;
        float local_4_2 = local_8 / HalfTime;
        float local_14 = 1.0;
        float local_12 = 1.0;
        float local_6 = 1.0 + local_4_2;
        float local_8_2 = 0.48 * local_4_2;
        return local_14 - (local_12 / ((local_6 + (local_8_2 * local_4_2)) + (((0.235 * local_4_2) * local_4_2) * local_4_2)));
    }
    UFUNCTION()
    void Run_Job_HandleChainToEntity() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ChainToEntity> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ChainToEntity& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleChainToEntity(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleUnchainFromParent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_UnchainFromParent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_UnchainFromParent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleUnchainFromParent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleUnchainAllChildren() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_UnchainAllChildren> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_UnchainAllChildren& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleUnchainAllChildren(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateChainNetPredictByParent() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorControlledByPlayerOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateChainNetPredictByParent(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorControlledByPlayerOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateChainNetPredictByParent(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateChainedNetPredictByChild() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorChainParentInfoOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateChainedNetPredictByChild(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorChainParentInfoOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateChainedNetPredictByChild(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UnchainPrentOnInactive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorChainParentInfoOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UnchainPrentOnInactive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UnchainChildrenOnInactive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorChainChildrenInfoOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UnchainChildrenOnInactive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateChainedTransform() const
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
                this.Job_UpdateChainedTransform(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
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
            this.Job_UpdateChainedTransform(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSyncNetTime() const
    {
        int local_8 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(CVar_Chain_ForceSyncNetTime.GetBool()) == !(false))
        {
            return;
        }
        int local_10 = 0;
        int local_9 = local_10;
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
                this.Job_UpdateSyncNetTime(local_40, local_42, local_8);
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
        Exclude(local_84).opCall();
        bool local_5 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateSyncNetTime(local_174, local_42, local_8);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePartialPrediction() const
    {
        const FECSEntity& local_36;
        int local_160 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(CVar_Chain_ForceModifyTransform.GetBool()) == !(false))
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
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
                this.Job_UpdatePartialPrediction(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        Exclude(local_74).opCall();
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_74.Iterator();
        for (; local_122.CanProceed;)
        {
            local_36 = local_122.Proceed();
            ++local_88;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdatePartialPrediction(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

