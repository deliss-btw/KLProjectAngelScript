class UESMAction_ThrowPredictPath : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bSendThrowPathAtEnd = false;
    UPROPERTY()
    EThrowTargetType ThrowTargetType = EThrowTargetType(0);
    UPROPERTY()
    FName ProjectileKey;
    UPROPERTY()
    FName ThrowStateName;
    UPROPERTY()
    EAttachTargetType AttachTargetType;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity AttachTargetEntityBBVar;
    UPROPERTY()
    TDataObjectPtr<FThrowPredictPathConfig> ThrowPredictPathConfig;
    UPROPERTY()
    FTransform ThrowSocketRelativeTransform;
    UPROPERTY()
    TMap<FName, FTransform> ThrowSocketRelativeTransformByCharacter;
    UPROPERTY()
    FThrowAttachInfo AttachInfo;
    UPROPERTY()
    FFireProjectileData FireData;
    UPROPERTY()
    FThrowPredictPathParams BakedThrowPredictPathParams;

    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_8;
        if (int(this.ThrowTargetType) == 0)
        {
            FString local_12 = this.FireData.GetProjectilePrefab().ToString();
            int local_3 = local_12.Find("/", ESearchCase(0), ESearchDir(1), -1);
            FString local_24;
            if (local_3 >= 0)
            {
                local_24 = local_12.Right(local_3 + 1);
            }
            else
            {
                local_24 = local_12;
            }
            if (this.FireData.GetPositionAttachRefName().Name.IsNone())
            {
                local_8 = "";
            }
            else
            {
                local_8 = FString().Append("<").Append(this.FireData.GetPositionAttachRefName().Name).Append("> ");
            }
            return FString().Append(local_8).Append("投掷物轨迹预测: ").Append(this.FireData.GetProjectilePrefab().GetAssetName());
        }
        FString local_28;
        if (int(this.ThrowTargetType) == 1)
        {
            bool local_4 = this.AttachInfo.GetSocketName().IsNone();
            if (local_4)
            {
                local_28 = "";
            }
            else
            {
                local_28 = FString().Append("<").Append(this.AttachInfo.GetSocketName()).Append("> ");
            }
            return FString().Append(local_28).Append("投掷物轨迹预测: ").Append(this.ThrowStateName);
        }
        return local_28.Append("投掷物轨迹预测");
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FThrowPredictPathParams local_16;
        int local_60 = 0;
        int local_150 = 0;
        int local_206 = 0;
        this.GetThrowPredictPathParams(Context, local_16);
        FThrowTargetInfo local_54;
        if (int(this.ThrowTargetType) == 0)
        {
            local_54 = FThrowTargetInfo(this.ProjectileKey, Context.GetEntity().GetId());
        }
        else
        {
            local_54 = FThrowTargetInfo(::FThrowUtils::GetThrowTargetEntity(Context.GetEntity(), this.AttachTargetType, this.AttachTargetEntityBBVar).GetId(), Context.GetEntity().GetId());
        }
        local_60.SetTargetInfo(local_54);
        local_60.SetPredictPathConfig(this.ThrowPredictPathConfig);
        local_60.SetFireData(this.FireData);
        local_60.SetAttachInfo(this.AttachInfo);
        local_60.SetPredictParams(local_16);
        FThrowPredictPathData local_136;
        if (this.ThrowPredictPathConfig)
        {
            local_136.PitchMappingCurve = this.ThrowPredictPathConfig.Get().ThrowPitchMappingCurve;
        }
        FName local_138;
        FName local_140;
        Has local_144;
        bool local_17 = local_144.opCall();
        if (local_17)
        {
            local_138 = local_150.CharacterKey;
            local_140 = local_150.BaseCharacterKey;
        }
        FTransform local_176 = this.ThrowSocketRelativeTransform;
        FTransform local_200;
        if (this.ThrowSocketRelativeTransformByCharacter.Find(local_138, local_200))
        {
            local_176 = local_200;
        }
        else
        {
            if (this.ThrowSocketRelativeTransformByCharacter.Find(local_140, local_200))
            {
                local_176 = local_200;
            }
        }
        local_136.SocketRelativeTransform = local_176;
        local_136.PredictPathParams = local_16;
        local_206.ThrowPathDataMap.Add(local_54, local_136);
        if (ECS::GetRuntimeInfo().IsServer && (int(this.ThrowTargetType) == 1) && this.bSendThrowPathAtEnd)
        {
            if (FECSEntity(local_54.GetPropEntityId()).IsValid())
            {
                ModifyOrAdd local_216;
                local_216.opCall().SetKeyInfo(local_54);
            }
        }
        bool local_217 = false;
        bool local_207 = int(this.ThrowTargetType) == 1 && this.bSendThrowPathAtEnd;
        if (local_207)
        {
            Has local_222;
            bool local_208;
            local_207 = ECS::GetRuntimeInfo().IsClient;
            if (!(local_207))
            {
                local_208 = false;
            }
            else
            {
                local_208 = local_222.opCall();
            }
            if (local_208)
            {
                Has local_226;
                if (FECSEntity(local_54.GetPropEntityId()).IsValid() && !(local_226.opCall()))
                {
                    FC_ThrowDetachVisualBlendTag local_232;
                    Assign local_230;
                    local_230.opCall(local_232);
                }
            }
            local_217 = ::FThrowUtils::TrySendThrowPredictPath(Context.GetEntity(), local_54);
        }
        if (!(local_217))
        {
            Has local_222;
            bool local_208;
            local_208 = ECS::GetRuntimeInfo().IsClient;
            if (!(local_208))
            {
                local_207 = false;
            }
            else
            {
                local_207 = local_222.opCall();
            }
            if (local_207)
            {
                this.ClearUploadedPredictPaths(Context, Time);
                FECSWorldPtr local_234 = ECS::GetECSWorld();
                ModifyOrAdd local_238;
                FCS_ThrowPredictPathTrace& local_240 = local_238.opCall();
                if (local_240)
                {
                    local_240.PathTraceResults.Remove(local_54);
                    local_240.PreparedPredictPaths.Remove(local_54);
                }
            }
            this.UpdateThrowPredictPath(Context, Time);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((int(this.ThrowTargetType) == 1 && this.bSendThrowPathAtEnd))
        {
            if (::FThrowUtils::TrySendThrowPredictPath(Context.GetEntity(), FThrowTargetInfo(::FThrowUtils::GetThrowTargetEntity(Context.GetEntity(), this.AttachTargetType, this.AttachTargetEntityBBVar).GetId(), Context.GetEntity().GetId())))
            {
                return;
            }
        }
        this.UpdateThrowPredictPath(Context, Time);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bSendThrowPathAtEnd)
        {
            ::FThrowUtils::TrySendThrowPredictPath(Context.GetEntity(), FThrowTargetInfo(::FThrowUtils::GetThrowTargetEntity(Context.GetEntity(), this.AttachTargetType, this.AttachTargetEntityBBVar).GetId(), Context.GetEntity().GetId()));
        }
        Remove local_26;
        local_26.opCall();
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
    bool GetThrowPredictPathParams(const FESMContext &inout Context, FThrowPredictPathParams &inout OutParams) const
    {
        if (int(this.ThrowTargetType) == 0)
        {
            OutParams = this.BakedThrowPredictPathParams;
        }
        else
        {
            if (int(this.ThrowTargetType) == 1)
            {
                FECSEntity local_14 = ::FThrowUtils::GetThrowTargetEntity(Context.GetEntity(), this.AttachTargetType, this.AttachTargetEntityBBVar);
                if (!(local_14.IsValid()))
                {
                    return false;
                }
                this.GetPropThrowPredictPathParams(local_14, OutParams);
            }
        }
        return true;
    }
    void ClearUploadedPredictPaths(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_6;
        if (!(ECS::GetRuntimeInfo().IsClient) || !(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        Modify local_14;
        FCS_ThrowPredictPathTrace& local_16 = local_14.opCall();
        if (local_16)
        {
            TArray<FThrowTargetInfo> local_20;
            for (auto local_38 : local_16.UploadedProjectileKeys)
            {
                if ((FECSEntityId(local_38.GetOwnerId()) == Context.GetEntity().GetId()))
                {
                    local_20.Add(local_38);
                }
            }
            for (auto local_38 : local_20)
            {
                local_16.UploadedProjectileKeys.Remove(local_38);
            }
            local_20.Empty(0);
            local_16.PreparedPredictPaths.GetKeys(local_20);
            for (auto local_38 : local_20)
            {
                if ((FECSEntityId(local_38.GetOwnerId()) == Context.GetEntity().GetId()))
                {
                    local_16.PreparedPredictPaths.Remove(local_38);
                }
            }
            local_20.Empty(0);
            local_16.PreparedLaunchVelocities.GetKeys(local_20);
            for (auto local_38 : local_20)
            {
                if ((FECSEntityId(local_38.GetOwnerId()) == Context.GetEntity().GetId()))
                {
                    local_16.PreparedLaunchVelocities.Remove(local_38);
                }
            }
        }
        return;
    }
    void UpdateThrowPredictPath(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_1;
        int local_58 = 0;
        Has local_6;
        if (!(ECS::GetRuntimeInfo().IsClient) || !(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        ModifyOrAdd local_14;
        FCS_ThrowPredictPathTrace& local_16 = local_14.opCall();
        if (local_16)
        {
            bool local_150;
            FThrowTargetInfo local_52;
            if (int(this.ThrowTargetType) == 0)
            {
                local_52 = FThrowTargetInfo(this.ProjectileKey, Context.GetEntity().GetId());
            }
            else
            {
                local_52 = FThrowTargetInfo(::FThrowUtils::GetThrowTargetEntity(Context.GetEntity(), this.AttachTargetType, this.AttachTargetEntityBBVar).GetId(), Context.GetEntity().GetId());
            }
            if (local_16.UploadedProjectileKeys.Contains(local_52))
            {
                return;
            }
            if (!(local_58))
            {
                return;
            }
            FThrowPredictPathData local_136;
            if (!(local_58.ThrowPathDataMap.Find(local_52, local_136)))
            {
                return;
            }
            if (int(local_52.GetTargetType()) == 1)
            {
                local_16.PreparedLaunchVelocities.Add(local_52, FVector3f(::FThrowUtils::GetPropThrowVelocity(FECSEntity(local_52.GetPropEntityId()), Time.WorldTime, local_52)));
                return;
            }
            local_1 = false;
            local_150 = local_1;
            FTransform local_200 = ::FProjectileUtils::GetProjectileSpawnTransform(Context.GetEntity(), Time.WorldTime, this.FireData, false, local_150);
            if (local_150)
            {
                return;
            }
            FVector3f local_212 = (FVector3f(local_200.GetRotation().GetForwardVector()) * local_136.PredictPathParams.GetInitSpeed());
            FKLPredictProjectilePathResult local_242;
            if (int(local_52.GetTargetType()) != 0)
            {
                local_1 = false;
            }
            else
            {
                local_1 = local_16.PathTraceResults.Find(local_52, local_242);
            }
            local_1 = local_1 && (local_242.PathData.Num() > 0);
            if (local_1)
            {
                return;
            }
            FKLPredictProjectilePathParams local_276;
            local_276.SetProjectileShape(local_136.PredictPathParams.GetShapeInfo());
            local_276.SetProjectileScale(local_136.PredictPathParams.GetCollisionScale());
            local_276.SetGravityScale(local_136.PredictPathParams.GetGravityScale());
            local_276.SetMaxSimTime(local_136.PredictPathParams.GetMaxSimTime());
            local_276.SetSimFrequency(local_136.PredictPathParams.GetSimFrequency());
            local_276.SetbTraceWithCollision(local_136.PredictPathParams.GetbTraceWithCollision());
            local_276.SetStartLocation(local_200.GetLocation());
            local_276.SetStartRotation(local_200.GetRotation());
            local_276.SetLaunchVelocity(local_212);
            FKLPredictProjectilePathResult& local_278 = local_16.PreparedPredictPaths.FindOrAdd(local_52);
            TArray<FECSEntity> local_282;
            local_282.Add(Context.GetEntity());
            Get local_286;
            const FC_InteractionInfoForESM& local_288 = local_286.opCall();
            if (local_288)
            {
                local_282.Add(local_288.GetTargetEntity());
            }
            FProjectileUtils::PredictProjectilePath(Context.GetEntity(), local_276, local_282, local_278, local_16.PathTraceCache, true);
        }
        return;
    }
    FECSEntity GetThrowTargetEntity(const FECSEntity &inout PawnEntity) const
    {
        FECSEntity local_4;
        if (int(this.AttachTargetType) == 0)
        {
            Get local_12;
            const FC_InteractionInfoForESM& local_14 = local_12.opCall();
            if (local_14)
            {
                if (local_14.GetTargetEntity().IsValid())
                {
                    local_4 = local_14.GetTargetEntity();
                }
            }
        }
        else
        {
            if (int(this.AttachTargetType) == 1)
            {
                Get local_18;
                const FC_LockTarget& local_20 = local_18.opCall();
                if (local_20)
                {
                    local_4 = local_20.GetTargetEntity();
                }
            }
            else
            {
                if (int(this.AttachTargetType) == 2)
                {
                    FNameHandle_EntityBBVarEntity local_24;
                    local_24;
                    local_4 = PawnEntity.GetBB_Entity(local_24);
                }
            }
        }
        return local_4;
    }
    void GetProjectileThrowPredictPathParams(const FFireProjectileConfig &inout InFireConfig, FThrowPredictPathParams &inout OutParams)
    {
        InFireConfig.ProjectilePrefab.LoadEditor();
        AProjectilePrefab local_4 = InFireConfig.ProjectilePrefab.Get().GetDefaultObject();
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        AECSPrefab::GetComponentConfigValue local_14;
        const FC_Collision& local_16 = local_14.opCall();
        if (local_16)
        {
            OutParams.SetShapeInfo(local_16.GetShape());
            OutParams.SetCollisionScale(local_16.GetScale());
        }
        AECSPrefab::GetComponentConfigValue local_22;
        const FC_ThrowMovementConfig& local_24 = local_22.opCall();
        if (local_24)
        {
            OutParams.SetInitSpeed(local_24.Data.GetInitSpeed());
            OutParams.SetGravityScale(local_24.Data.GetGravityScale());
        }
        return;
    }
    void GetPropThrowPredictPathParams(const FECSEntity &inout PropEntity, FThrowPredictPathParams &inout OutParams) const
    {
        float32 local_12;
        if (!(PropEntity.IsValid()))
        {
            return;
        }
        Get local_6;
        const FC_Collision& local_8 = local_6.opCall();
        if (local_8)
        {
            if ((int(local_8.GetShapeType())) != 0)
            {
                OutParams.SetShapeInfo(local_8.GetShape());
                OutParams.SetCollisionScale(local_8.GetScale());
            }
            else
            {
                Get local_16;
                const FC_PushColliderConfig& local_18 = local_16.opCall();
                if (local_18)
                {
                    if (!(local_18.PushColliders.IsEmpty()))
                    {
                        OutParams.SetShapeInfo(local_18.PushColliders[0].Shape);
                        OutParams.SetCollisionScale(1.0f);
                    }
                }
            }
        }
        Get local_22;
        const FC_ThrowMovementConfig& local_24 = local_22.opCall();
        if (local_24)
        {
            OutParams.SetInitSpeed(local_24.Data.GetInitSpeed());
            OutParams.SetGravityScale(local_24.Data.GetGravityScale());
        }
        if (this.ThrowPredictPathConfig)
        {
            local_12 = this.ThrowPredictPathConfig.Get().MaxPredictTime;
        }
        else
        {
            local_12 = 3.0f;
        }
        OutParams.SetMaxSimTime(local_12);
        OutParams.SetSimFrequency(10.0f);
        OutParams.SetbTraceWithCollision(true);
        return;
    }
}

