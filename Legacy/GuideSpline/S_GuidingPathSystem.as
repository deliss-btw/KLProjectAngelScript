
const FConsoleVariable CVar_GuidingPath_DebugDraw = FConsoleVariable();
const FConsoleVariable CVar_GuidingPath_DiagLog = FConsoleVariable();
const int GuidingPathSource_None = 0;
const int GuidingPathSource_NavMeshDirect = 1;
const int GuidingPathSource_NavMeshPath = 2;
const int GuidingPathSource_RoadGraph = 3;
const int GuidingPathSource_StraightFallback = 4;

class US_GuidingPathSystem : UECSScriptSystem
{
    UPROPERTY()
    float32 PathOffsetFromCorners = 100.0f;
    UPROPERTY()
    float32 PathFindingUpdateInterval = 0.2f;
    UPROPERTY()
    float32 PathFindingUpdateMinDistance = 500.0f;
    UPROPERTY()
    float32 QueryExtentRadius = 1000.0f;
    UPROPERTY()
    float32 QueryExtentHeight = 1000.0f;
    UPROPERTY()
    float32 NavMeshOverRoadRatio = 1.25f;
    UPROPERTY()
    float32 NavMeshStraightMaxLength = 50000.0f;
    UPROPERTY()
    bool bNavmeshDetailedFirst = true;
    UPROPERTY()
    float32 GuideStraightenRatio = 1.2f;
    UPROPERTY()
    float32 GuideFallbackRoadRatio = 2.0f;
    UPROPERTY()
    float32 GuidingPathFailTipsCooldown = 1.5f;
    UPROPERTY()
    bool bClampUnwalkableSegment = true;
    UPROPERTY()
    float32 UnwalkableSegmentMaxZ = 2000.0f;
    UPROPERTY()
    float32 UnvalidatedRoadAccessMaxDistance = 2000.0f;
    UPROPERTY()
    bool bEnableDownwardTargetFallback = true;
    UPROPERTY()
    float32 DownwardTargetProbeDepth = 30000.0f;
    UPROPERTY()
    int DownwardTargetMaxLayers = 12;
    UPROPERTY()
    float32 DownwardTargetLayerStep = 50.0f;
    UPROPERTY()
    float32 DownwardTargetPenetrationSkip = 500.0f;
    UPROPERTY()
    int DownwardTargetMaxTraceAttempts = 16;
    UPROPERTY()
    float32 DownwardTargetNavEndpointGap = 300.0f;
    UPROPERTY()
    float32 DownwardTargetCacheTolerance = 100.0f;
    UPROPERTY()
    bool bEnableDrape = true;
    UPROPERTY()
    int DrapeTracesPerFrame = 8;
    UPROPERTY()
    bool bDrapeZSmooth = true;
    UPROPERTY()
    float32 DrapeStep = 200.0f;
    UPROPERTY()
    float32 DrapeOverheadBand = 220.0f;
    UPROPERTY()
    float32 DrapeUnderBand = 200.0f;
    UPROPERTY()
    float32 DrapeDeepProbeDown = 6000.0f;
    UPROPERTY()
    float32 DrapeRoadGraphMaxDeepProbeDrop = 300.0f;
    UPROPERTY()
    int DrapeMaxLayers = 4;
    UPROPERTY()
    float32 DrapeSimplifyTolerance = 60.0f;
    UPROPERTY()
    float32 DrapeSimplifyVertTolerance = 20.0f;
    UPROPERTY()
    float32 DrapeGroundClearance = 30.0f;
    UPROPERTY()
    float32 DrapeSmoothMaxZStep = 150.0f;
    UPROPERTY()
    TSubclassOf<UNavigationQueryFilter> NavFilterClass;
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> ShowGuidingPathTrigger = nullptr;
    UPROPERTY()
    float32 DistanceToTargetThreshold = 500.0f;
    UPROPERTY()
    float32 MaxSplineLength = 10000.0f;
    UPROPERTY()
    float32 GuidingPathNiaragaResetInterval = 3.0f;
    UPROPERTY()
    int GuidingPathNiaragaResetTimes = 3;
    UPROPERTY()
    TSoftClassPtr<AGuidingSplineActor> GuidingPathActorClass;
    UPROPERTY()
    TSoftClassPtr<AActor> GuidingTargetActorClass;
    UPROPERTY()
    FName GuidingTargetNSPlayerLocationParamName = FName("PlayerLocation");
    UPROPERTY()
    FName GuidingTargetNSTargetGroundLocationParamName = FName("TargetGroundPointLocation");
    UPROPERTY()
    float32 GuidingTargetEffectInitDisplayTime = 10.0f;
    UPROPERTY()
    float32 GuidingTargetEffectActiveDisplayTime = 10.0f;
    UPROPERTY()
    float32 GuidingTargetEffectMinVisibleDistance = 1000.0f;
    UPROPERTY()
    float32 ShowGuidingPathCooldown = 0.5f;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> GuidingPathTargetReachedHint;
    UPROPERTY()
    FGameplayTagContainer NotCancelGuidingPathTargetTags;


    void SendGuidingPathFindFailed(const FECSEntity &inout Player, const FVector &inout TargetLocation) const
    {
        FFPTime local_6 = FFPTime(-1);
        0.TargetLocation = TargetLocation;
        return;
    }
    UFUNCTION()
    void ServerJob_HandleGuidingPathRequest(const FCE_RequestGuidingPathEvent &inout Event) const
    {
        bool local_24;
        FC_GuidingPathUpdateInfo local_56;
        Has local_4;
        local_4.opCall();
        FVector local_12;
        if (!(Event.TargetEntity.IsValid()))
        {
            Get local_16;
            FECSEntity local_20 = local_16.opCall().GetPlayerPawnEntity();
            if (Event.bHasTargetLocation)
            {
                local_24 = ::FGuidingPathUtils::GetGuidingPathTargetLocationFromHint(local_20, Event.TargetLocation, local_12);
            }
            else
            {
                local_24 = ::FGuidingPathUtils::GetGuidingPathTargetLocation(local_20, Event.TargetLocation2D, local_12);
            }
            if (!(local_24))
            {
                ModifyOrAdd local_48;
                int local_32 = int(Event.TargetLocation2D.Y);
                int local_31 = int(Event.TargetLocation2D.X);
                XLog(ELog(51), FString().Append("[GuidingPath/йЂ‰и·Ї] жњЌеЉЎе™Ёж”¶е€°иЇ·ж±‚ з›®ж ‡и§Јжћђе¤±иґҐв†’ж ‡и®°bLastFindPathSuccess=false 2D=(").Append(local_31).Append(",").Append(local_32).Append(") жѕејЏ3D=").Append(Event.bHasTargetLocation));
                local_48.opCall().SetTargetLocation(FVector(Event.TargetLocation2D.X, Event.TargetLocation2D.Y, 0.0));
                local_48.opCall().SetbLastFindPathSuccess(false);
                this.SendGuidingPathFindFailed(Event.Sender, FVector(Event.TargetLocation2D.X, Event.TargetLocation2D.Y, 0.0));
                return;
            }
            int local_49 = int(local_12.Z);
            int local_31_2 = int(local_12.Y);
            int local_32_2 = int(local_12.X);
            XLog(ELog(51), FString().Append("[GuidingPath/йЂ‰и·Ї] жњЌеЉЎе™Ёж”¶е€°иЇ·ж±‚ и§Јжћђз›®ж ‡=(").Append(local_32_2).Append(",").Append(local_31_2).Append(",").Append(local_49).Append(") её¦е®ћдЅ“=false жѕејЏ3D=").Append(Event.bHasTargetLocation));
        }
        if (Event.TargetEntity.IsValid())
        {
            local_56.TargetEntity = Event.TargetEntity;
        }
        else
        {
            local_56.TargetEntity = FECSEntity();
            local_56.TargetLocation = local_12;
        }
        local_56.bPendingManualResult = true;
        return;
    }
    UFUNCTION()
    void ServerJob_HandleStopGuidingPath(const FCE_StopGuidingPathEvent &inout Event) const
    {
        ::FGuidingPathUtils::ServerCancelGuidingPath(Event.Sender);
        return;
    }
    UFUNCTION()
    void Monitor_OnGuidingPathTargetDestroyed(const FECSEntity &inout Entity, const FC_GuidingPathTarget &inout C_GuidingPathTarget) const
    {
        this.RemoveAllGuidingToTargetEntity(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_OnGuidingPathTargetDead(const FECSEntity &inout Entity, const FC_DeathTag &inout DeathTag) const
    {
        this.RemoveAllGuidingToTargetEntity(Entity);
        return;
    }
    void RemoveAllGuidingToTargetEntity(const FECSEntity &inout Entity) const
    {
        Get local_4;
        const FC_GuidingPathTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto& local_22 : local_6.GuidingPlayers)
            {
                if ((::FGuidingPathUtils::GetGuidingPathTargetEntityID(local_22) == Entity.GetId()))
                {
                    Get local_28;
                    const FC_GuidingPathUpdateInfo& local_30 = local_28.opCall();
                    if (local_30)
                    {
                        if ((local_30.TargetEntity == Entity))
                        {
                            Remove local_38;
                            local_38.opCall();
                        }
                    }
                    Remove local_42;
                    local_42.opCall();
                }
            }
            FC_PendingRemoveGuidingPathTargetTag local_48;
            Assign local_46;
            local_46.opCall(local_48);
        }
        return;
    }
    UFUNCTION()
    void Job_FindMinDistanceRegionPathNode(const FVector &inout SourceLocation, FVector &inout OutLocation, float32 &inout MinDistanceSq, const FECSEntity &inout Entity, const FC_Transform &inout Transform) const
    {
        float32 local_17 = float32(((FVector(Transform.GetPosition()) - SourceLocation).SizeSquared()));
        if ((MinDistanceSq < 0.0f || (local_17 < MinDistanceSq)))
        {
            OutLocation = Transform.GetPosition();
            MinDistanceSq = local_17;
        }
        return;
    }
    bool ReachedGuidingPathTarget(const FC_GuidingPathPoints &inout C_GuidingPathPoints, const FVector &inout PlayerPawnLocation) const
    {
        if (C_GuidingPathPoints.GetTargetEntity())
        {
            TDataObjectPtr<FPresentationConfig> local_26 = ::EntityLevelSpotUtils::GetDefaultPresentationConfig(C_GuidingPathPoints.GetTargetEntity());
            if (local_26)
            {
                if (this.NotCancelGuidingPathTargetTags.HasTag(local_26.opArrow().SpotType))
                {
                    return false;
                }
            }
        }
        return (((PlayerPawnLocation - C_GuidingPathPoints.GetTargetLocation()).SizeSquared()) < (this.DistanceToTargetThreshold * this.DistanceToTargetThreshold));
    }
    void AppendHerarchicalStepPath(TArray<FVector> &inout OutPathPoints, const TArray<FVector> &inout HierarchicalPathPoints, const int HierarchicalSteps) const
    {
        int local_3 = HierarchicalSteps + 1;
        for (; local_3 < HierarchicalPathPoints.Num(); )
        {
            OutPathPoints.Add(HierarchicalPathPoints[local_3]);
            ++local_3;
        }
        return;
    }
    bool FindNavmeshGuidePath(const FVector &inout Start, const FVector &inout End, const int HierSteps, TArray<FVector> &inout OutPath, TArray<FVector> &inout OutHier, float32 &inout OutLen) const
    {
        FVector local_12 = FVector(this.QueryExtentRadius, this.QueryExtentRadius, this.QueryExtentHeight);
        bool local_21 = false;
        if (this.bNavmeshDetailedFirst)
        {
            if (FAINavigationUtils::FindPathForPlayerGuide(this.GetWorld(), Start, End, this.PathOffsetFromCorners, 0, local_12, this.NavFilterClass, OutPath, OutHier, OutLen))
            {
                local_21 = true;
            }
        }
        if (!(local_21))
        {
            local_21 = FAINavigationUtils::FindPathForPlayerGuide(this.GetWorld(), Start, End, this.PathOffsetFromCorners, HierSteps, local_12, this.NavFilterClass, OutPath, OutHier, OutLen);
        }
        if (local_21)
        {
            this.AppendHerarchicalStepPath(OutPath, OutHier, HierSteps);
            OutLen = this.CalcGuidingPathPolylineLength(OutPath);
        }
        return local_21;
    }
    bool ValidateNavmeshGuidePathEndpointGaps(const FVector &inout Start, const FVector &inout End, const TArray<FVector> &inout PathPoints, const float32 MaxStartGap, const float32 MaxEndGap, float32 &inout OutStartGap, float32 &inout OutEndGap, float32 &inout OutPathLen) const
    {
        OutStartGap = 0.0f;
        OutEndGap = 0.0f;
        OutPathLen = this.CalcGuidingPathPolylineLength(PathPoints);
        if (PathPoints.Num() < 2)
        {
            return false;
        }
        OutStartGap = float32(((FVector(PathPoints[0]) - Start).Size()));
        OutEndGap = float32(((FVector(PathPoints.Last(0)) - End).Size()));
        return OutStartGap <= MaxStartGap && (OutEndGap <= MaxEndGap);
    }
    bool ValidateNavmeshGuidePath(const FVector &inout Start, const FVector &inout End, const TArray<FVector> &inout PathPoints, const float32 MaxEndpointGap, float32 &inout OutStartGap, float32 &inout OutEndGap, float32 &inout OutPathLen) const
    {
        return this.ValidateNavmeshGuidePathEndpointGaps(Start, End, PathPoints, MaxEndpointGap, MaxEndpointGap, OutStartGap, OutEndGap, OutPathLen);
    }
    bool FindRoadGraphGuidePathToTarget(const FECSEntity &inout Pawn, const FVector &inout Candidate, const int HierarchicalSteps, const float32 CandidateEndpointGap, const bool bValidUp, const FVector &inout StartRoadPoint, const TArray<FVector> &inout UpPath, TArray<FVector> &inout OutPathPoints, float32 &inout OutPathLength) const
    {
        bool local_68;
        OutPathPoints.Empty(0);
        OutPathLength = 0.0f;
        FVector local_8 = Candidate;
        bool local_13 = FAINavigationUtils::FindClosestRoadPoint(this.GetWorld(), Candidate, local_8);
        TArray<FVector> local_18;
        TArray<FVector> local_22;
        float32 local_23 = 0.0f;
        float32 local_24 = 0.0f;
        float32 local_25 = 0.0f;
        float32 local_26 = 0.0f;
        bool local_9 = local_13 && this.FindNavmeshGuidePath(local_8, Candidate, HierarchicalSteps, local_18, local_22, local_23) && this.ValidateNavmeshGuidePathEndpointGaps(local_8, Candidate, local_18, FMath::Max(3000.0f, (this.QueryExtentRadius * 2.0f)), CandidateEndpointGap, local_24, local_25, local_26);
        bool local_28 = local_9;
        TArray<FVector> local_34;
        float32 local_35 = 0.0f;
        local_9 = bValidUp && local_13 && FAINavigationUtils::RoadGraphPathFindSimple(this.GetWorld(), StartRoadPoint, local_8, local_34, 500, local_35, EKLRoadMask(1));
        if (CVar_GuidingPath_DiagLog.GetBool())
        {
            int local_50 = uint(local_25);
            int local_49 = int(local_8.Z);
            int local_48 = int(local_8.Y);
            int local_47 = int(local_8.X);
            int local_46 = int(StartRoadPoint.Z);
            int local_45 = int(StartRoadPoint.Y);
            XLog(ELog(51), FString().Append("[GuidingPath/з›®ж ‡й™Ќе±‚] ж··еђ€и·ЇйЄЊиЇЃ иµ·з‚№дёЉи·Ї=").Append(bValidUp).Append(" з»€з‚№дё‹и·Ї=").Append(local_28).Append(" и·ЇзЅ‘иїћйЂљ=").Append(local_9).Append(" иµ·з‚№и·Їз‚№=(").Append(int(StartRoadPoint.X)).Append(",").Append(local_45).Append(",").Append(local_46).Append(") з»€з‚№и·Їз‚№=(").Append(local_47).Append(",").Append(local_48).Append(",").Append(local_49).Append(") дё‹и·Їз»€з‚№gap=").Append(local_50));
        }
        if (!(bValidUp) || !(local_28) || !(local_9))
        {
            return false;
        }
        if (local_34.IsEmpty())
        {
            return false;
        }
        if (!(local_34[0].Equals(StartRoadPoint, 1.0)))
        {
            local_34.Insert(StartRoadPoint, 0);
        }
        if (!(local_34.Last(0).Equals(local_8, 1.0)))
        {
            local_34.Add(local_8);
        }
        int local_52 = 600.0f;
        if (UpPath.IsEmpty() || local_34.IsEmpty() || local_18.IsEmpty())
        {
            return false;
        }
        float local_29 = float32(((FVector(UpPath.Last(0)) - local_34[0]).Size()));
        FVector local_66_2 = (FVector(local_34.Last(0)) - local_18[0]);
        float32 local_30 = float32(local_66_2.Size());
        local_68 = local_30 <= local_52 && (local_30 <= 50.0f || FAINavigationUtils::IsDirectlyReachable(Pawn, local_34.Last(0), local_18[0]));
        if ((!((local_29 <= local_52 && (local_29 <= 50.0f || FAINavigationUtils::IsDirectlyReachable(Pawn, UpPath.Last(0), local_34[0]))))) || !(local_68))
        {
            if (CVar_GuidingPath_DiagLog.GetBool())
            {
                int local_1_2 = uint(local_30);
                int local_50_2 = uint(local_29);
                XLog(ELog(51), FString().Append("[GuidingPath/з›®ж ‡й™Ќе±‚] ж··еђ€и·Їж‹јжЋҐж‹’з»ќ дёЉи·Ї-и·ЇзЅ‘gap=").Append(local_50_2).Append(" и·ЇзЅ‘-дё‹и·Їgap=").Append(local_1_2).Append(" дёЉй™ђ=").Append(uint(local_52)));
            }
            return false;
        }
        OutPathPoints.Append(UpPath);
        OutPathPoints.Append(local_34);
        OutPathPoints.Append(local_18);
        if (OutPathPoints.Num() < 2)
        {
            return false;
        }
        if (this.bClampUnwalkableSegment && (this.UnwalkableSegmentMaxZ > 0.0f))
        {
            int local_71 = 1;
            for (; local_71 < OutPathPoints.Num(); ++local_71)
            {
                if (FMath::Abs(float32((OutPathPoints[local_71].Z - (OutPathPoints[(local_71 - 1)].Z)))) > this.UnwalkableSegmentMaxZ)
                {
                    OutPathPoints.Empty(0);
                    return false;
                }
            }
        }
        OutPathLength = this.CalcGuidingPathPolylineLength(OutPathPoints);
        return true;
    }
    bool FindHighestReachableTargetBelow(const FECSEntity &inout Pawn, const FVector &inout PawnLocation, const FVector &inout RawTargetLocation, const int HierarchicalSteps, FVector &inout OutTargetLocation, TArray<FVector> &inout OutPathPoints, float32 &inout OutPathLength, bool &inout bOutUsedRoadGraph) const
    {
        bool local_186;
        UPrimitiveComponent local_188;
        UPrimitiveComponent local_190;
        bOutUsedRoadGraph = false;
        if (!(this.bEnableDownwardTargetFallback) || !(Pawn.IsValid()) || ((this.DownwardTargetProbeDepth <= 0.0f)) || (this.DownwardTargetMaxLayers <= 0) || (this.DownwardTargetMaxTraceAttempts <= 0))
        {
            return false;
        }
        int local_7 = 1120403456;
        float32 local_9 = FMath::Max(this.DownwardTargetLayerStep, 2.0f);
        int local_8 = FMath::Max(this.DownwardTargetPenetrationSkip, local_9);
        float32 local_3 = FMath::Max(this.DownwardTargetNavEndpointGap, 50.0f);
        ECollisionChannel local_14 = FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5));
        float32 local_4 = float32(RawTargetLocation.Z);
        float32 local_10_2 = this.DownwardTargetProbeDepth;
        float32 local_11 = local_4 - local_10_2;
        float32 local_4_2 = float32(RawTargetLocation.Z) + 100.0f;
        int local_20 = 0;
        int local_21 = 0;
        int local_22 = this.DownwardTargetMaxTraceAttempts;
        TArray<UPrimitiveComponent> local_26;
        FVector local_32 = PawnLocation;
        TArray<FVector> local_36;
        bool local_37 = false;
        bool local_38 = false;
        while (local_20 < this.DownwardTargetMaxLayers && (local_21 < local_22) && (local_4_2 > local_11))
        {
            ++local_21;
            FHitResult local_104;
            FCollisionQueryParams local_142;
            for (auto local_156 : local_26)
            {
                local_142.AddIgnoredComponent(local_156);
            }
            FCollisionResponseParams local_182;
            FVector local_164 = FVector(RawTargetLocation.X, RawTargetLocation.Y, local_11);
            bool local_2 = FPhysicsUtils::LineTraceSingle(Pawn, false, EPhysicsTraceTag(31), local_104, FVector(RawTargetLocation.X, RawTargetLocation.Y, local_4_2), local_164, local_14, local_142, local_182);
            if (!(local_2))
            {
                break;
            }
            else
            {
                bool local_227;
                bool local_225;
                if (local_104.GetbStartPenetrating() || ((local_4_2 - float32(local_104.Location.Z)) < 1.0f))
                {
                    local_186 = false;
                    if (local_188 != nullptr && !(local_26.Contains(local_190)))
                    {
                        local_26.Add(local_190);
                        local_186 = true;
                    }
                    if (CVar_GuidingPath_DiagLog.GetBool())
                    {
                        int local_195 = uint(local_8);
                        bool local_1_2 = local_104.GetbStartPenetrating();
                        int local_6 = int(local_104.Location.Z);
                        int local_5 = uint(local_4_2);
                        XLog(ELog(51), FString().Append("[GuidingPath/з›®ж ‡й™Ќе±‚] з©їйЂЏеЋљзў°ж’ћдЅ“е¤„зђ† е°ќиЇ•=").Append(local_21).Append(" иµ·Z=").Append(local_5).Append(" е‘Ѕдё­Z=").Append(local_6).Append(" з©їйЂЏ=").Append(local_1_2).Append(" еїЅз•Ґз»„д»¶=").Append(local_186).Append(" е…њеє•дё‹и·і=").Append(local_195));
                    }
                    if (!(local_186))
                    {
                        local_4_2 = local_4_2 - local_8;
                    }
                    continue;
                }
                FVector local_202(local_104.Location);
                TArray<FVector> local_206;
                TArray<FVector> local_210;
                float32 local_211 = 0.0f;
                float32 local_212 = 0.0f;
                float32 local_213 = 0.0f;
                float32 local_214 = 0.0f;
                FVector local_220;
                bool local_185 = UNavigationSystemV1::ProjectPointToNavigation(__GetWorldContext(), local_202, local_220, nullptr, this.NavFilterClass, FVector(this.QueryExtentRadius, this.QueryExtentRadius, this.QueryExtentHeight));
                if (local_185)
                {
                    local_10_2 = float32(float32(local_202.Distance(local_220)));
                }
                else
                {
                    local_10_2 = -1.0f;
                }
                bool local_1_3 = local_185 && (local_10_2 <= local_3);
                bool local_224 = local_1_3 && this.FindNavmeshGuidePath(PawnLocation, local_202, HierarchicalSteps, local_206, local_210, local_211);
                local_186 = local_224 && this.ValidateNavmeshGuidePathEndpointGaps(PawnLocation, local_202, local_206, FMath::Max(3000.0f, (this.QueryExtentRadius * 2.0f)), local_3, local_212, local_213, local_214);
                if (local_186 && (local_212 > 50.0f))
                {
                    local_186 = FAINavigationUtils::IsDirectlyReachable(Pawn, PawnLocation, local_206[0]);
                }
                local_227 = false;
                local_225 = !(local_186);
                if (local_225 && local_1_3)
                {
                    if (!(local_37))
                    {
                        local_225 = FAINavigationUtils::FindClosestRoadPoint(this.GetWorld(), PawnLocation, local_32);
                        TArray<FVector> local_234;
                        float32 local_235 = 0.0f;
                        float32 local_236 = 0.0f;
                        float32 local_237 = 0.0f;
                        float32 local_238 = 0.0f;
                        bool local_226 = local_225 && this.FindNavmeshGuidePath(PawnLocation, local_32, HierarchicalSteps, local_36, local_234, local_235);
                        local_38 = local_226 && this.ValidateNavmeshGuidePath(PawnLocation, local_32, local_36, FMath::Max(3000.0f, (this.QueryExtentRadius * 2.0f)), local_236, local_237, local_238);
                        if (local_38 && (local_236 > 50.0f))
                        {
                            local_38 = FAINavigationUtils::IsDirectlyReachable(Pawn, PawnLocation, local_36[0]);
                        }
                        if ((!(local_38)) && local_225 && (this.UnvalidatedRoadAccessMaxDistance > 0.0f) && (PawnLocation.Distance(local_32) <= this.UnvalidatedRoadAccessMaxDistance))
                        {
                            local_36.Empty(0);
                            local_36.Add(PawnLocation);
                            local_36.Add(local_32);
                            local_38 = true;
                        }
                    }
                    local_227 = this.FindRoadGraphGuidePathToTarget(Pawn, local_202, HierarchicalSteps, local_3, local_38, local_32, local_36, local_206, local_214);
                    local_186 = local_227;
                }
                if (CVar_GuidingPath_DiagLog.GetBool())
                {
                    int local_242 = uint(local_213);
                    int local_241 = uint(local_212);
                    int local_240 = local_206.Num();
                    int local_239 = uint(local_10_2);
                    int local_5_2 = int(local_202.Z);
                    int local_6_2 = int(local_202.Y);
                    int local_195_2 = int(local_202.X);
                    XLog(ELog(51), FString().Append("[GuidingPath/з›®ж ‡й™Ќе±‚] еЂ™йЂ‰е±‚=").Append(local_20).Append(" з‚№=(").Append(local_195_2).Append(",").Append(local_6_2).Append(",").Append(local_5_2).Append(") NavMeshжЉ•еЅ±=").Append(local_1_3).Append(" жЉ•еЅ±gap=").Append(local_239).Append(" NavMeshи·Їеѕ„=").Append(local_224).Append(" и·ЇзЅ‘ж··еђ€и·Їеѕ„=").Append(local_227).Append(" еЏЇиѕѕ=").Append(local_186).Append(" з‚№ж•°=").Append(local_240).Append(" иµ·з‚№gap=").Append(local_241).Append(" з»€з‚№gap=").Append(local_242));
                }
                if (CVar_GuidingPath_DebugDraw.GetBool())
                {
                    FColor local_250;
                    if (local_186)
                    {
                        local_250 = FColor(uint8(0), uint8(255), uint8(0), uint8(255));
                    }
                    else
                    {
                        local_250 = FColor(uint8(255), uint8(64), uint8(0), uint8(255));
                    }
                    DebugDraw::DrawDebugSphere(this.GetWorld(), local_202, 45.0f, 12, local_250, false, 10.0f, uint8(0), 0.0f);
                }
                if (local_186)
                {
                    OutTargetLocation = local_202;
                    OutPathPoints = local_206;
                    OutPathLength = local_214;
                    bOutUsedRoadGraph = local_227;
                    return true;
                }
                ++local_20;
                float32 local_15_5 = float32(local_104.Location.Z) - local_9;
                if (local_15_5 >= local_4_2)
                {
                    local_15_5 = local_4_2 - local_9;
                }
                float32 local_4_3 = local_15_5;
            }
        }
        return false;
    }
    void SimplifyByNavVisibility(const FECSEntity &inout Pawn, TArray<FVector> &inout Pts) const
    {
        int local_2 = Pts.Num();
        if (local_2 <= 2 || !(Pawn.IsValid()))
        {
            return;
        }
        int local_5 = 8;
        TArray<FVector> local_10;
        local_10.Reserve(local_2);
        local_10.Add(Pts[0]);
        int local_11 = 0;
        while (local_11 < (local_2 - 1))
        {
            int local_14 = FMath::Min(local_2 - 1, local_11 + 8);
            int local_12 = local_11 + 1;
            int local_16 = local_14;
            for (; local_16 > (local_11 + 1); --local_16)
            {
                if (FAINavigationUtils::IsDirectlyReachable(Pawn, Pts[local_11], Pts[local_16]))
                {
                    local_12 = local_16;
                    break;
                }
            }
            local_10.Add(Pts[local_12]);
            local_11 = local_12;
        }
        if (local_10.Num() >= 2)
        {
            Pts = local_10;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateGuidPathFinding(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_PlayerController &inout PlayerControllerComp, FC_GuidingPathUpdateInfo &inout GuidingPathUpdateInfo) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Monitor_OnServerRemoveGuidPath(const FECSEntity &inout Entity, const FC_GuidingPathPoints &inout GuidingPathPoints) const
    {
        if (Entity.IsValid())
        {
            if (FECSEntity(GuidingPathPoints.GetTargetEntity()))
            {
                Modify local_10;
                FC_GuidingPathTarget& local_12 = local_10.opCall();
                if (local_12)
                {
                    if (local_12.GuidingPlayers.IsEmpty())
                    {
                        FC_PendingRemoveGuidingPathTargetTag local_20;
                        Assign local_18;
                        local_18.opCall(local_20);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_RemoveGuidingPathTarget(const FECSEntity &inout Entity) const
    {
        Get local_4;
        const FC_GuidingPathTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GuidingPlayers.IsEmpty())
            {
                Remove local_12;
                local_12.opCall();
            }
        }
        Remove local_16;
        local_16.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_SetLevelSpotConfigForGuidingPathTarget(const FECSEntity &inout Entity, const FC_GuidingPathTarget &inout C_GuidingPathTarget) const
    {
        Has local_4;
        const UGuideSettings local_8;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(C_GuidingPathTarget))
        {
            ::EntityLevelSpotUtils::RemoveSpotData(Entity, ELevelSpotDataSource(1));
            return;
        }
        GetGameplaySettings<UGuideSettings> local_10;
        local_8 = local_10;
        return;
    }
    UFUNCTION()
    void ClientJob_DrainGuidingPathRequest(const FECSEntity &inout Entity, FC_GuidingPathRequestThrottle &inout Throttle) const
    {
        const UGuideSettings local_2;
        GetGameplaySettings<UGuideSettings> local_4;
        local_2 = local_4;
        float32 local_7 = local_2.GuidingPathRequestCooldown;
        FFPTime local_12;
        bool local_14 = local_12 = ::BlueprintFunctions_Common::GetWorldTime(Entity);
        bool local_14_2 = local_7 <= 0.0f || ((Throttle.LastFireTime.opCmp(0.0) <= 0)) || ((local_12 - Throttle.LastFireTime).ToSeconds() >= local_7);
        if (Throttle.bHasNewRequest)
        {
            Throttle.bHasNewRequest = false;
            if (local_14_2)
            {
                this.FireThrottledGuidingRequest(Entity, Throttle);
                Throttle.LastFireTime = local_12;
                Throttle.bPending = false;
            }
            else
            {
                Throttle.bPending = true;
            }
            return;
        }
        if (Throttle.bPending)
        {
            if (local_14_2)
            {
                this.FireThrottledGuidingRequest(Entity, Throttle);
                Throttle.LastFireTime = local_12;
                Throttle.bPending = false;
            }
            return;
        }
        if (local_14_2)
        {
            Remove local_24;
            local_24.opCall();
        }
        return;
    }
    void FireThrottledGuidingRequest(const FECSEntity &inout Entity, FC_GuidingPathRequestThrottle &inout Throttle) const
    {
        FCE_RequestGuidingPathEvent local_46;
        Assign local_50;
        FC_GuidingPathManualUpdateTag local_52;
        int local_1 = Throttle.PendingKind;
        if (local_1 == 4)
        {
            if (!(Throttle.PendingTargetLocation.IsNearlyZero(9.999999747378752e-5)))
            {
                FCE_RequestMarkLocation local_14;
                FFPTime local_12 = FFPTime(-1);
                local_14.Location = Throttle.PendingTargetLocation;
                local_14.MarkConfig = Throttle.PendingMarkConfig;
                local_14.bGuideToMark = true;
                local_14.bNeedRecalculateHeight = false;
            }
            else
            {
                ::MarkUtil::EmitMarkAndGuidePosition(Entity, Throttle.PendingTargetLocation2D, Throttle.PendingMarkConfig);
            }
            return;
        }
        if (local_1 == 5)
        {
            FECSEntityId local_39 = FECSEntityId(Throttle.PendingTargetEntity.GetId());
            if ((!((local_39 == ENTITY_ID_NULL))))
            {
                ::MarkUtil::RequestFastMarkEntityFromMinimap(Entity, local_39);
                FFPTime local_12_2 = FFPTime(-1);
                local_46.TargetEntity = Throttle.PendingTargetEntity;
                local_46.TargetLocation2D = FVector2D::ZeroVector;
                local_46.TargetLocation = FVector::ZeroVector;
                local_46.bHasTargetLocation = false;
                local_50.opCall(local_52);
            }
            return;
        }
        FFPTime local_12_3 = FFPTime(-1);
        local_46.TargetEntity = Throttle.PendingTargetEntity;
        local_46.TargetLocation2D = Throttle.PendingTargetLocation2D;
        local_46.bHasTargetLocation = local_46.TargetLocation = Throttle.PendingTargetLocation;
        local_50.opCall(local_52);
        return;
    }
    UFUNCTION()
    void ClientJob_OnServerUpdateGuidPath(const FCE_GuidingPathServerUpdate &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FC_GuidingPathManualUpdateTag local_10;
        Assign local_8;
        local_8.opCall(local_10);
        XLog(ELog(51), FString().Append("[GuidingPath/йЂ‰и·Ї] е®ўж€·з«Їж”¶е€°жњЌеЉЎе™Ёж›ґж–°дє‹д»¶в†’зЅ®ж‰‹еЉЁtag"));
        return;
    }
    UFUNCTION()
    void ClientJob_OnGuidingPathFindFailed(const FCE_GuidingPathFindFailedEvent &inout Event, const FCS_LocalTime &inout LocalTime) const
    {
        int local_24 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (CVar_GuidingPath_DebugDraw.GetBool())
        {
            DebugDraw::DrawDebugSphere(this.GetWorld(), Event.TargetLocation, 60.0f, 16, FColor(uint8(255), uint8(0), uint8(0), uint8(255)), false, 10.0f, uint8(0), 0.0f);
        }
        if ((this.GuidingPathFailTipsCooldown > 0.0f && ((local_24.LastTipTime.opCmp(0.0) > 0)) && ((((FFPTime(LocalTime.Time) - local_24.LastTipTime).ToSeconds()) < this.GuidingPathFailTipsCooldown))))
        {
            return;
        }
        local_24.LastTipTime = LocalTime.Time;
        XLog(ELog(51), FString().Append("[GuidingPath/йЂ‰и·Ї] е®ўж€·з«Їж”¶е€°жњЌеЉЎе™ЁеЇ»и·Їе¤±иґҐдє‹д»¶ в†’ еј№TipsвЂњеЇји€Єи·Їеѕ„жџҐж‰ѕе¤±иґҐвЂќ"));
        FCommonTipsParam local_48;
        ::CommonPopup::Tips(NSLOCTEXT("GuidingPath", "GuidingPath_FindPathFailed", "еЇји€Єи·Їеѕ„жџҐж‰ѕе¤±иґҐ"), local_48);
        return;
    }
    UFUNCTION()
    void Monitor_OnUpdateGuidPath(const FECSEntity &inout Entity, const FC_GuidingPathPoints &inout GuidingPathPoints) const
    {
        FC_GuidingSplineActor local_6;
        ModifyOrAdd local_10;
        local_10.opCall();
        bool local_17 = FECSEntity::Has<FC_GuidingPathManualUpdateTag>(Entity).opCall();
        if (local_17 || !(GuidingPathPoints.GetbLastFindPathSuccess()))
        {
            int local_33 = int(GuidingPathPoints.GetTargetLocation().Z);
            int local_32 = int(GuidingPathPoints.GetTargetLocation().Y);
            int local_31 = int(GuidingPathPoints.GetTargetLocation().X);
            XLog(ELog(51), FString().Append("[GuidingPath/йЂ‰и·Ї] е®ўж€·з«ЇMonitorи§¦еЏ‘ ж€ђеЉџ=").Append(GuidingPathPoints.GetbLastFindPathSuccess()).Append(" ж‰‹еЉЁиЇ·ж±‚tag=").Append(local_17).Append(" з‚№ж•°=").Append(GuidingPathPoints.GetPoints().Num()).Append(" жќҐжєђ=").Append(this.GetGuidingPathSourceName(GuidingPathPoints.GetPathSource())).Append(" з›®ж ‡=(").Append(local_31).Append(",").Append(local_32).Append(",").Append(local_33).Append(")"));
        }
        if (CVar_GuidingPath_DebugDraw.GetBool())
        {
            FColor local_42;
            if (GuidingPathPoints.GetbLastFindPathSuccess())
            {
                local_42 = FColor(uint8(0), uint8(255), uint8(0), uint8(255));
            }
            else
            {
                local_42 = FColor(uint8(255), uint8(0), uint8(0), uint8(255));
            }
            DebugDraw::DrawDebugSphere(this.GetWorld(), GuidingPathPoints.GetTargetLocation(), 60.0f, 16, local_42, false, 10.0f, uint8(0), 0.0f);
        }
        if (!(GuidingPathPoints.GetbLastFindPathSuccess()))
        {
            bool local_18;
            Has local_52;
            local_18 = local_52.opCall();
            if (local_18)
            {
                Remove local_56;
                local_56.opCall();
            }
            if (local_6.GuidingSplineActor.IsValid())
            {
                AGuidingSplineActor local_58;
                local_58.SetActorHiddenInGame(true);
            }
        }
        if (local_17)
        {
            local_6.ActivateTimesRemain = this.GuidingPathNiaragaResetTimes;
            Remove local_62;
            local_62.opCall();
            if (GuidingPathPoints.GetbLastFindPathSuccess())
            {
                this.Run_Job_ActivateGuidingSplineNiagara(true);
                this.Run_Job_UpdateGuidingTargetEffect(true);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveGuidPath(const FECSEntity &inout Entity, const FC_GuidingPathPoints &inout GuidingPathPoints) const
    {
        int local_20 = 0;
        Has local_8;
        XLog(ELog(51), FString().Append("[GuidingPath/йЂ‰и·Ї] е®ўж€·з«ЇMonitor и·Їеѕ„з»„д»¶иў«з§»й™¤ ж‰‹еЉЁиЇ·ж±‚tag=").Append(local_8.opCall()));
        if (Entity.IsValid())
        {
            Remove local_14;
            local_14.opCall();
            if (local_20.GuidingSplineActor.IsValid())
            {
                AGuidingSplineActor local_22;
                local_22.SetActorHiddenInGame(true);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveGuidLineActor(const FECSEntity &inout Entity, const FC_GuidingSplineActor &inout C_GuidingSplineActor) const
    {
        if (C_GuidingSplineActor.GuidingSplineActor.IsValid())
        {
            AGuidingSplineActor local_4;
            local_4.SetActorHiddenInGame(true);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleShowGuidingPathTrigger(const FECSEntity &inout Entity, const FC_Input &inout Input, const FCS_LocalTime &inout LocalTime, const FC_ESMTrigger &inout ESMTrigger) const
    {
        int local_34 = 0;
        if (!((this.ShowGuidingPathTrigger == nullptr)))
        {
            FActiveTriggerResult local_22 = this.ShowGuidingPathTrigger.opArrow().TestTrigger(Input.State, LocalTime.LastTime, LocalTime.Time, ESMTrigger.Storage);
            if (local_22.bActive && (FFPTime(local_22.TriggerTime).opCmp(LocalTime.Time) <= 0) && (local_22.GetTriggerExpireTime().opCmp(LocalTime.LastTime) >= 0))
            {
                if (this.ShowGuidingPathCooldown > 0.0f)
                {
                    FFPTime local_24 = local_34.LastShowTime;
                    if (local_24.opCmp(0.0) > 0 && ((((FFPTime(LocalTime.Time) - local_34.LastShowTime).ToSeconds()) < this.ShowGuidingPathCooldown)))
                    {
                        return;
                    }
                    local_34.LastShowTime = LocalTime.Time;
                }
                Get local_44;
                const FC_ControlledByPlayer& local_46 = local_44.opCall();
                if (local_46)
                {
                    if (local_46.GetPlayerEntity().IsValid())
                    {
                        FFPTime local_38 = FFPTime(-1);
                        FFPTime local_24_2 = FFPTime(-1);
                        SendEvent local_56;
                        local_56.opCall(local_24_2);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleResetSplineNiragaraEvent(const FCE_ResetGuidingPathNiagaraEvent &inout Event) const
    {
        Modify local_4;
        FC_GuidingSplineActor& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.ActivateTimesRemain = this.GuidingPathNiaragaResetTimes;
        }
        this.Run_Job_ActivateGuidingSplineNiagara(true);
        return;
    }
    UFUNCTION()
    void ClientJob_ResetGuidingSplinePeriodically(const FECSEntity &inout Entity, const FC_PlayerController &inout PlayerControllerComp, const FC_GuidingPathPoints &inout C_GuidingPathPoints, const FC_GuidingSplineActor &inout C_GuidingSplineActor, const FCS_LocalTime &inout LocalTime) const
    {
        if ((((int(C_GuidingSplineActor.ActivateTimesRemain) > 0 || ((this.GuidingPathNiaragaResetTimes == -1))) && (this.GuidingPathNiaragaResetInterval > 0.0f)) && ((((FFPTime(LocalTime.Time) - C_GuidingSplineActor.LastActivateTime).ToSeconds()) > this.GuidingPathNiaragaResetInterval))))
        {
            this.Run_Job_ActivateGuidingSplineNiagara(false);
        }
        return;
    }
    UFUNCTION()
    void Job_ActivateGuidingSplineNiagara(const bool bForceUpdate, const FECSEntity &inout Entity, const FC_PlayerController &inout PlayerControllerComp, const FC_GuidingPathPoints &inout C_GuidingPathPoints, FC_GuidingSplineActor &inout C_GuidingSplineActor, const FCS_LocalTime &inout LocalTime) const
    {
        int local_40 = 0;
        C_GuidingSplineActor.LastActivateTime = LocalTime.Time;
        if (int(C_GuidingSplineActor.ActivateTimesRemain) > 0)
        {
            --C_GuidingSplineActor.ActivateTimesRemain;
        }
        if (!(bForceUpdate) && C_GuidingSplineActor.GuidingSplineActor.IsValid() && C_GuidingSplineActor.NiagaraComponent.IsValid())
        {
            AGuidingSplineActor local_12;
            FVector local_18 = local_12.GetActorLocation();
            GetDefaulted local_28;
            FVector local_24 = local_28.opCall().GetPosition();
            if (local_18.Equals(local_24, 0.1))
            {
                this.FinalizeGuidingSplineNiagara(C_GuidingSplineActor);
                return;
            }
        }
        if (C_GuidingPathPoints.GetPoints().Num() <= 0)
        {
            return;
        }
        if (!(PlayerControllerComp.GetPlayerPawnEntity().IsValid()))
        {
            return;
        }
        Has local_34;
        if (!(local_34.opCall()))
        {
            return;
        }
        bool local_4 = this.IsStraightTwoPointPathSource(C_GuidingPathPoints.GetPathSource());
        if ((this.bEnableDrape || local_4))
        {
            this.StartGuidingPathDrape(Entity, local_40.GetPosition(), C_GuidingPathPoints, bForceUpdate);
            return;
        }
        TArray<FVector> local_46;
        this.BuildCoarseGuidingPolyline(local_40.GetPosition(), C_GuidingPathPoints, local_46);
        this.UpdateGuidingSplineActor(Entity, local_40.GetPosition(), local_46);
        this.FinalizeGuidingSplineNiagara(C_GuidingSplineActor);
        return;
    }
    void FinalizeGuidingSplineNiagara(FC_GuidingSplineActor &inout C_GuidingSplineActor) const
    {
        AGuidingSplineActor local_4;
        UNiagaraComponent local_8;
        if (C_GuidingSplineActor.GuidingSplineActor.IsValid())
        {
            local_4.VFX_GuideSpline();
            if (C_GuidingSplineActor.SplineComponent.IsValid())
            {
                USplineComponent local_6;
                local_4.ApplyContinuousSplineUVData(local_6);
            }
        }
        if (C_GuidingSplineActor.NiagaraComponent.IsValid())
        {
            local_8.ReinitializeSystem();
            local_8.SetActive(true, true);
        }
        return;
    }
    void BuildCoarseGuidingPolyline(const FVector &inout StartLocation, const FC_GuidingPathPoints &inout GuidingPathPoints, TArray<FVector> &inout OutPolyline) const
    {
        OutPolyline.Reset(0);
        OutPolyline.Add(StartLocation);
        int local_2 = 1;
        FVector local_20 = (FVector(GuidingPathPoints.GetTargetLocation()) - StartLocation);
        local_20.Z = 0.0;
        float32 local_24 = float32(local_20.Size());
        if (local_24 > 1.0f)
        {
            FVector local_14 = (local_20 / local_24);
            int local_33 = 1145569280;
            int local_34 = 1071493677;
            while (local_2 < GuidingPathPoints.GetPoints().Num())
            {
                FVector local_8 = (FVector(GuidingPathPoints.GetPoints()[local_2]) - StartLocation);
                local_8.Z = 0.0;
                float32 local_23 = float32(local_8.Size());
                float32 local_41 = float32(local_8.DotProduct(local_14));
                float local_46 = local_8.X;
                local_46 = local_46 * -local_14.Y;
                float local_22_5 = local_8.Y;
                local_22_5 = local_22_5 * local_14.X;
                if ((!((local_23 < 800.0f))) || ((local_41 > 0.0f) && ((FMath::Abs(float32((local_46 + local_22_5)))) <= (local_41 * 1.732f))))
                {
                    break;
                }
                ++local_2;
            }
        }
        int local_53 = local_2;
        for (; local_53 < GuidingPathPoints.GetPoints().Num(); )
        {
            OutPolyline.Add(GuidingPathPoints.GetPoints()[local_53]);
            ++local_53;
        }
        FVector local_14_2 = FVector(GuidingPathPoints.GetTargetLocation());
        if (OutPolyline.Num() == 1 || ((((FVector(OutPolyline.Last(0)) - local_14_2)).SizeSquared() > 0.01)))
        {
            OutPolyline.Add(local_14_2);
        }
        return;
    }
    void DensifyPolyline(const TArray<FVector> &inout In, const float32 Step, const float32 MaxLen, TArray<FVector> &inout Out) const
    {
        Out.Reset(0);
        if (In.Num() == 0)
        {
            return;
        }
        if (In.Num() == 1 || (Step <= 1.0f))
        {
            Out = In;
            return;
        }
        TArray<float32> local_10;
        local_10.SetNum(In.Num());
        float32 local_4 = 0.0f;
        local_10[0] = 0.0f;
        int local_11 = 1;
        for (; local_11 < In.Num(); )
        {
            local_10[local_11] = (float32(local_10[local_11 - 1]) + float32((FVector(In[local_11]) - In[local_11 - 1]).Size()));
            ++local_11;
        }
        float32 local_28 = local_10.Last(0);
        if (local_28 <= 1.0f)
        {
            Out.Add(In[0]);
            Out.Add(In.Last(0));
            return;
        }
        if (MaxLen > 0.0f)
        {
            local_4 = FMath::Min(local_28, MaxLen);
        }
        else
        {
            local_4 = local_28;
        }
        int local_30 = FMath::Max(1, FMath::FloorToInt(local_4 / Step));
        Out.Reserve(local_30 + 2);
        int local_31 = 0;
        for (; local_31 <= local_30; )
        {
            float32 local_27_2 = local_31;
            local_27_2 = FMath::Min(local_27_2 * Step, local_4);
            Out.Add(this.GetPositionAlongPath(In, local_10, local_27_2));
            ++local_31;
        }
        FVector local_24_2 = this.GetPositionAlongPath(In, local_10, local_4);
        if ((FVector(Out.Last(0)) - local_24_2).SizeSquared() > 0.01)
        {
            Out.Add(local_24_2);
        }
        return;
    }
    void StartGuidingPathDrape(const FECSEntity &inout Entity, const FVector &inout StartLocation, const FC_GuidingPathPoints &inout GuidingPathPoints, const bool bForce = false) const
    {
        FC_GuidingPathDrapeState local_6;
        if ((int(local_6.Phase) == 1 && !(bForce)))
        {
            local_6.RefreshQueued = 1;
            return;
        }
        TArray<FVector> local_14;
        this.BuildCoarseGuidingPolyline(StartLocation, GuidingPathPoints, local_14);
        this.LogSteepSegments("е®ўж€·з«ЇзІ—жЉзєї", local_14, GuidingPathPoints.GetPathSource());
        this.DensifyPolyline(local_14, FMath::Max(this.DrapeStep, 10.0f), this.MaxSplineLength, local_6.RawSamples);
        local_6.DrapedPoints = local_6.RawSamples;
        local_6.SampleHit.SetNum(local_6.RawSamples.Num());
        local_6.Cursor = 0;
        local_6.StartSnapshot = StartLocation;
        local_6.PathSourceSnapshot = GuidingPathPoints.GetPathSource();
        local_6.RefreshQueued = 0;
        local_6.Phase = local_6.RawSamples.Num() > 0 ? 1 : 0;
        return;
    }
    void SmoothGuidingDrapeZ(FC_GuidingPathDrapeState &inout S) const
    {
        if (!(this.bDrapeZSmooth))
        {
            return;
        }
        int local_3 = S.DrapedPoints.Num();
        if (local_3 < 3)
        {
            return;
        }
        float32 local_4 = this.DrapeSmoothMaxZStep;
        if (local_4 > 0.0f)
        {
            TArray<FVector> local_10 = S.DrapedPoints;
            int local_11 = 1;
            for (; local_11 < (local_3 - 1); ++local_11)
            {
                bool local_16 = (local_11 + 1) < S.SampleHit.Num() && (S.SampleHit[(local_11 - 1)] == 3 || (S.SampleHit[local_11] == 3) || (S.SampleHit[(local_11 + 1)] == 3));
                if (local_16)
                {
                    continue;
                }
                float local_20 = S.DrapedPoints[(local_11 - 1)].Z;
                float32 local_5 = float32(local_20);
                local_20 = S.DrapedPoints[local_11].Z;
                float32 local_17 = float32(local_20);
                local_20 = S.DrapedPoints[(local_11 + 1)].Z;
                float32 local_21 = float32(local_20);
                float32 local_22 = local_17 - local_5;
                float32 local_23 = local_17 - local_21;
                bool local_15 = local_22 > local_4 && (local_23 > local_4);
                float32 local_24 = -local_4;
                if (local_22 >= local_24)
                {
                    local_16 = false;
                }
                else
                {
                    local_24 = local_4;
                    local_24 = -local_24;
                    local_16 = (local_23 < local_24);
                }
                if ((local_15 || local_16))
                {
                    FVector local_32 = local_10[local_11];
                    local_24 = local_5 + local_21;
                    local_24 = local_24 * 0.5f;
                    local_20 = local_24;
                    local_32.Z = local_20;
                    local_10[local_11] = local_32;
                }
            }
            S.DrapedPoints = local_10;
        }
        TArray<FVector> local_10 = S.DrapedPoints;
        int local_11_2 = 1;
        for (; local_11_2 < (local_3 - 1); ++local_11_2)
        {
            if ((local_11_2 + 1) < S.SampleHit.Num() && (S.SampleHit[(local_11_2 - 1)] == 3 || (S.SampleHit[local_11_2] == 3) || (S.SampleHit[(local_11_2 + 1)] == 3)))
            {
                continue;
            }
            FVector local_32_2 = local_10[local_11_2];
            local_32_2.Z = float32(((((S.DrapedPoints[(local_11_2 - 1)].Z) + S.DrapedPoints[local_11_2].Z) + (S.DrapedPoints[(local_11_2 + 1)].Z)) / 3.0));
            local_10[local_11_2] = local_32_2;
        }
        S.DrapedPoints = local_10;
        return;
    }
    void FinalizeGuidingDrape(const FECSEntity &inout Entity, FC_GuidingPathDrapeState &inout S, FC_GuidingSplineActor &inout C_GuidingSplineActor, const FC_PlayerController &inout PlayerControllerComp) const
    {
        int local_2 = 0;
        int local_11 = 0;
        int local_12;
        int local_16;
        int local_25;
        bool local_32;
        int local_34;
        this.SmoothGuidingDrapeZ(S);
        if (CVar_GuidingPath_DiagLog.GetBool())
        {
            Get local_10;
            Has local_6;
            int local_24;
            bool local_1 = local_6.opCall();
            if (local_1)
            {
                local_11 = local_10.opCall().GetPathSource();
                local_12 = local_11;
            }
            else
            {
                local_12 = 0;
            }
            this.LogSteepSegments("е®ўж€·з«Їиґґењ°з‚№", S.DrapedPoints, local_12);
            int local_13 = -1;
            int local_14 = 0;
            int local_15 = 1;
            while (local_15 < local_2)
            {
                float local_18 = S.DrapedPoints[local_15].Z;
                local_2 = local_15 - 1;
                local_18 = local_18 - S.DrapedPoints[local_2].Z;
                local_2 = uint(FMath::Abs(float32(local_18)));
                if (local_2 > local_14)
                {
                    local_14 = local_2;
                    local_13 = local_15;
                }
                ++local_15;
            }
            local_2 = 0;
            local_15 = 0;
            int local_23 = 0;
            local_24 = 0;
            while (local_24 < local_11)
            {
                if (S.SampleHit[local_24] == 0)
                {
                    ++local_2;
                }
                else
                {
                    if (S.SampleHit[local_24] == 2)
                    {
                        ++local_15;
                    }
                    else
                    {
                        if (S.SampleHit[local_24] == 3)
                        {
                            ++local_23;
                        }
                    }
                }
                ++local_24;
            }
            XLog(ELog(51), FString().Append("[GuidingPath/ећ‚з›ґиЇЉж–­] е®ўж€·з«Їиґґењ°з‚№ жњЄе‘Ѕдё­=").Append(local_2).Append("/").Append(S.SampleHit.Num()).Append(" ж·±жЋўж•‘е›ћ=").Append(local_15).Append("(еЋџдјљжµ®з©є,зЋ°е·Іиґґзњџе®ћењ°иЎЁ) RoadGraphдїќй«=").Append(local_23));
            if (local_13 > 0 && (local_14 > 150))
            {
                if ((local_13 - 1) < S.SampleHit.Num())
                {
                    local_25 = S.SampleHit[local_13 - 1];
                }
                else
                {
                    local_25 = -1;
                }
                if (local_13 < S.SampleHit.Num())
                {
                    local_24 = S.SampleHit[local_13];
                }
                else
                {
                    local_24 = -1;
                }
                int local_33 = local_13 - 1;
                if (local_33 < S.RawSamples.Num())
                {
                    local_33 = local_13 - 1;
                    local_16 = int(S.RawSamples[local_33].Z);
                }
                else
                {
                    local_16 = 0;
                }
                if (local_13 < S.RawSamples.Num())
                {
                    local_34 = int(S.RawSamples[local_13].Z);
                }
                else
                {
                    local_34 = 0;
                }
                XLog(ELog(51), FString().Append("[GuidingPath/ећ‚з›ґиЇЉж–­] е®ўж€·з«Їиґґењ°з‚№ жњЂй™Ў#").Append(local_13).Append(" dZ=").Append(local_14).Append(" е‘Ѕдё­A=").Append(local_25).Append(" е‘Ѕдё­B=").Append(local_24).Append(" еј¦A=").Append(local_16).Append(" еј¦B=").Append(local_34));
            }
        }
        this.UpdateGuidingSplineActor(Entity, S.StartSnapshot, S.DrapedPoints);
        this.FinalizeGuidingSplineNiagara(C_GuidingSplineActor);
        S.Phase = 3;
        if (int(S.RefreshQueued) != 0)
        {
            Get local_10;
            Has local_6;
            S.RefreshQueued = 0;
            if (!(PlayerControllerComp.GetPlayerPawnEntity().IsValid()))
            {
                local_32 = false;
            }
            else
            {
                Has local_40;
                local_32 = local_40.opCall();
            }
            if (!(local_32))
            {
                local_32 = false;
            }
            else
            {
                local_32 = local_6.opCall();
            }
            if (local_32)
            {
                Get local_50;
                this.StartGuidingPathDrape(Entity, FVector(local_50.opCall().GetPosition()), local_10.opCall(), false);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickGuidingPathDrape(const FECSEntity &inout Entity, FC_GuidingPathDrapeState &inout S, FC_GuidingSplineActor &inout C_GuidingSplineActor, const FC_PlayerController &inout PlayerControllerComp) const
    {
        int local_3 = 0;
        bool local_7;
        USplineComponent local_26;
        int local_62 = 0;
        bool local_267;
        bool local_268;
        int local_271;
        int local_272;
        if (CVar_GuidingPath_DebugDraw.GetBool())
        {
            FVector local_120;
            Has local_56;
            float32 local_21;
            bool local_10;
            int local_9;
            bool local_1;
            int local_2 = S.DrapedPoints.Num();
            if (local_2 >= 2)
            {
                int local_4 = 0;
                while (local_4 < local_2)
                {
                    int local_5 = local_4 + 1;
                    if (local_5 < S.SampleHit.Num())
                    {
                        local_10 = S.SampleHit[local_4] != 0 && (S.SampleHit[local_4] != 3) && ((S.SampleHit[(local_4 + 1)] != 0)) && ((S.SampleHit[(local_4 + 1)] != 3));
                    }
                    else
                    {
                        local_10 = true;
                    }
                    FColor local_18;
                    if (local_10)
                    {
                        local_18 = FColor(uint8(0), uint8(255), uint8(255), uint8(255));
                    }
                    else
                    {
                        local_18 = FColor(uint8(255), uint8(0), uint8(0), uint8(255));
                    }
                    local_5 = local_4 + 1;
                    DebugDraw::DrawDebugLine(this.GetWorld(), S.DrapedPoints[local_4], S.DrapedPoints[local_5], local_18, false, 0.0f, uint8(0), 4.0f);
                    ++local_4;
                }
            }
            if (C_GuidingSplineActor.SplineComponent.IsValid())
            {
                local_21 = local_26.GetSplineLength();
                if (local_21 > 1.0f)
                {
                    float32 local_27 = local_21 / 100.0f;
                    int local_5_2 = FMath::Clamp(FMath::FloorToInt(local_27), 1, 400);
                    FVector local_42 = local_26.GetLocationAtDistanceAlongSpline(0.0f, ESplineCoordinateSpace(1));
                    int local_43 = 1;
                    for (; local_43 <= local_5_2; )
                    {
                        local_27 = local_43;
                        local_27 = local_27 * 100.0f;
                        FVector local_34 = local_26.GetLocationAtDistanceAlongSpline(FMath::Min(local_27, local_21), ESplineCoordinateSpace(1));
                        DebugDraw::DrawDebugLine(this.GetWorld(), local_42, local_34, FColor(uint8(255), uint8(0), uint8(255), uint8(255)), false, 0.0f, uint8(0), 2.0f);
                        local_42 = local_34;
                        ++local_43;
                    }
                }
            }
            local_1 = local_56.opCall();
            if (local_1)
            {
                int local_43_2 = 0;
                int local_5_3 = 0;
                int local_63 = 0;
                int local_64 = 0;
                int local_65 = 0;
                while (local_65 < local_3)
                {
                    if (S.SampleHit[local_65] == 3)
                    {
                        local_5_3 = local_5_3 + 1;
                        local_64 = local_64 + 1;
                        if (local_64 > local_63)
                        {
                            local_63 = local_64;
                        }
                    }
                    else
                    {
                        if (S.SampleHit[local_65] != 0)
                        {
                            local_43_2 = local_43_2 + 1;
                            local_64 = 0;
                        }
                        else
                        {
                            local_64 = local_64 + 1;
                            if (local_64 > local_63)
                            {
                                local_63 = local_64;
                            }
                        }
                    }
                    ++local_65;
                }
                if (C_GuidingSplineActor.SplineComponent.IsValid())
                {
                    USplineComponent local_24;
                    local_9 = uint(local_24.GetSplineLength());
                }
                else
                {
                    local_9 = 0;
                }
                FString local_78;
                if (int(S.Phase) == 1)
                {
                    local_78 = "иґґењ°дё­";
                }
                else
                {
                    FString local_74;
                    if (int(S.Phase) == 3)
                    {
                        local_74 = "е®Њж€ђ";
                    }
                    else
                    {
                        local_74 = "з©єй—І";
                    }
                    local_78 = local_74;
                }
                FString local_70 = this.GetGuidingPathSourceName(local_62.GetPathSource());
                FString local_74;
                if (local_62.GetbStraightened())
                {
                    local_74 = " [и§†зєїдёІж‹‰]";
                }
                else
                {
                    local_74 = "";
                }
                int local_4_2 = S.DrapedPoints.Num();
                FString local_90 = FString().Append("[GuidingPath/е®ўж€·з«Ї] жќҐжєђ=").Append(local_70).Append(local_74).Append("\nиґґењ°е‘Ѕдё­=").Append(local_43_2).Append("/").Append(local_4_2).Append(" RoadGraphдїќй«=").Append(local_5_3).Append(" жњЂй•їж‚¬з©єж®µ=").Append(local_63).Append("\nж ·жќЎй•ї=").Append(local_9).Append(" й¶ж®µ=").Append(local_78);
                if (local_62.GetPoints().Num() > 0)
                {
                    local_120 = (FVector(local_62.GetPoints()[0]) + FVector(0.0, 0.0, 320.0));
                }
                else
                {
                    local_120 = (S.StartSnapshot + FVector(0.0, 0.0, 320.0));
                }
                FECSDebugDraw::DrawDebugString(n"GuidingPathCli", local_120, local_90, FColor(uint8(0), uint8(255), uint8(255), uint8(255)), 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f);
            }
        }
        if (int(S.Phase) != 1)
        {
            bool local_8;
            if (!(int(S.RefreshQueued) == 0 && !(CVar_GuidingPath_DebugDraw.GetBool())))
            {
                local_8 = false;
            }
            else
            {
                Has local_128;
                local_8 = local_128.opCall();
            }
            if (local_8)
            {
                Remove local_132;
                local_132.opCall();
            }
            return;
        }
        else
        {
            FVector local_120;
            Has local_56;
            float32 local_21;
            bool local_10;
            int local_9;
            bool local_8;
            bool local_1;
            int local_135 = int(FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)));
            local_21 = this.DrapeGroundClearance;
            int local_4_3 = FMath::Max(1, this.DrapeTracesPerFrame);
            if (int(S.Phase) == 1)
            {
                int local_43_3 = S.RawSamples.Num();
                if (local_43_3 <= 0)
                {
                    S.Phase = 0;
                    if (int(S.RefreshQueued) != 0)
                    {
                        S.RefreshQueued = 0;
                        if (!(PlayerControllerComp.GetPlayerPawnEntity().IsValid()))
                        {
                            local_1 = false;
                        }
                        else
                        {
                            Has local_140;
                            local_1 = local_140.opCall();
                        }
                        if (!(local_1))
                        {
                            local_8 = false;
                        }
                        else
                        {
                            local_8 = local_56.opCall();
                        }
                        if (local_8)
                        {
                            Get local_60;
                            Get local_144;
                            this.StartGuidingPathDrape(Entity, FVector(local_144.opCall().GetPosition()), local_60.opCall(), false);
                        }
                    }
                    return;
                }
                else
                {
                    local_3 = local_43_3 - S.Cursor;
                    local_9 = FMath::Min(local_4_3, local_3);
                    int local_63_2 = 0;
                    for (; local_63_2 < local_9; )
                    {
                        local_120 = FVector(S.RawSamples[int(S.Cursor)]);
                        float32 local_27_3 = float32(local_120.Z);
                        float32 local_22_2 = local_27_3 + this.DrapeOverheadBand;
                        float32 local_145 = local_27_3 - this.DrapeUnderBand;
                        float local_147 = local_27_3;
                        int local_148 = 3.4e38f;
                        local_7 = false;
                        local_10 = local_7;
                        float32 local_149 = local_22_2;
                        int local_5_4 = 0;
                        while (local_7)
                        {
                            FHitResult local_216;
                            FCollisionQueryParams local_254;
                            FCollisionResponseParams local_262;
                            float local_96 = local_145;
                            FVector local_114 = FVector(local_120.X, local_120.Y, local_96);
                            if (!(FPhysicsUtils::LineTraceSingle(Entity, false, EPhysicsTraceTag(31), local_216, FVector(local_120.X, local_120.Y, local_149), local_114, ECollisionChannel(local_135), local_254, local_262)))
                            {
                                break;
                            }
                            float local_44 = float32(local_216.Location.Z);
                            float local_264 = FMath::Abs(local_44 - local_27_3);
                            if (local_264 < local_148)
                            {
                                local_148 = int(local_264);
                                local_147 = local_44;
                                local_10 = true;
                            }
                            if (local_44 <= local_27_3)
                            {
                                break;
                            }
                            local_149 = local_44 - 2.0f;
                            ++local_5_4;
                            if (local_5_4 >= this.DrapeMaxLayers)
                            {
                                local_7 = false;
                                continue;
                            }
                            local_7 = (local_149 > local_145);
                        }
                        local_7 = int(S.Cursor) == 0 || ((int(S.Cursor) == (local_43_3 - 1)));
                        local_267 = false;
                        local_268 = false;
                        local_1 = !(local_10);
                        local_8 = local_1 && (this.DrapeDeepProbeDown > 0.0f);
                        if (local_8 && !(local_7))
                        {
                            bool local_266;
                            FHitResult local_216;
                            FCollisionQueryParams local_254;
                            float32 local_265 = local_145 - this.DrapeDeepProbeDown;
                            FCollisionResponseParams local_262;
                            float local_96_2 = local_265;
                            FVector local_34_2 = FVector(local_120.X, local_120.Y, local_96_2);
                            local_96_2 = local_120.X;
                            local_266 = FPhysicsUtils::LineTraceSingle(Entity, false, EPhysicsTraceTag(31), local_216, FVector(local_96_2, local_120.Y, local_145), local_34_2, ECollisionChannel(local_135), local_254, local_262);
                            if (local_266)
                            {
                                float local_264_2 = float32(local_216.Location.Z);
                                local_266 = (int(S.PathSourceSnapshot) == 3);
                                local_1 = local_266 && (this.DrapeRoadGraphMaxDeepProbeDrop > 0.0f);
                                local_266 = local_1 && (((local_27_3 - local_264_2) > this.DrapeRoadGraphMaxDeepProbeDrop));
                                local_268 = local_266;
                                if (!(local_266))
                                {
                                    local_147 = local_264_2;
                                    local_10 = true;
                                    local_267 = true;
                                }
                            }
                        }
                        bool local_270 = !(local_10);
                        local_8 = local_270 && local_7;
                        if (local_8 && (int(S.Cursor) > 0))
                        {
                            local_3 = S.Cursor - 1;
                            local_147 = float32(S.DrapedPoints[local_3].Z) - local_21;
                        }
                        if (local_268)
                        {
                            local_272 = 3;
                        }
                        else
                        {
                            if (local_267)
                            {
                                local_271 = 2;
                            }
                            else
                            {
                                local_271 = local_10 ? 1 : 0;
                            }
                            local_272 = local_271;
                        }
                        S.SampleHit[S.Cursor] = local_272;
                        FVector local_42_2 = FVector(S.DrapedPoints[int(S.Cursor)]);
                        local_42_2.Z = (local_147 + local_21);
                        S.DrapedPoints[S.Cursor] = local_42_2;
                        ++local_63_2;
                        ++S.Cursor;
                    }
                    if (int(S.Cursor) >= local_43_3)
                    {
                        this.FinalizeGuidingDrape(Entity, S, C_GuidingSplineActor, PlayerControllerComp);
                    }
                    return;
                }
            }
        }
    }
    UFUNCTION()
    void ClientJob_HandleResetGuidingTargetEffect(const FCE_ResetGuidingTargetEffectEvent &inout Event) const
    {
        this.Run_Job_UpdateGuidingTargetEffect(false);
        return;
    }
    UFUNCTION()
    void Job_UpdateGuidingTargetEffect(const bool bIsFirstDisplay, const FECSEntity &inout PlayerControllerEntity, FC_GuidingPathTargetActor &inout C_GuidingPathTargetActor, const FC_GuidingPathPoints &inout C_GuidingPathPoints, const FCS_LocalTime &inout LocalTime) const
    {
        AActor local_8;
        AFXActor local_26;
        C_GuidingPathTargetActor.LastActivateTime = LocalTime.Time;
        C_GuidingPathTargetActor.bIsFirstDisplay = bIsFirstDisplay;
        C_GuidingPathTargetActor.bIsHiddenByDistance = false;
        if (!(C_GuidingPathTargetActor.TargetActor.IsValid()))
        {
            local_8 = SpawnActor(TSubclassOf<AActor>(System::LoadClassAsset_Blocking(this.GuidingTargetActorClass)), C_GuidingPathPoints.GetTargetLocation(), FRotator::ZeroRotator, NAME_None, false, nullptr, nullptr);
            C_GuidingPathTargetActor.TargetActor = local_8;
            if (C_GuidingPathTargetActor.TargetActor.IsValid())
            {
                C_GuidingPathTargetActor.NiagaraComponent = Cast<UNiagaraComponent>(local_8.GetComponentByClass(UNiagaraComponent));
                local_8.SetActorEnableCollision(false);
            }
        }
        else
        {
            local_8.SetActorLocation(C_GuidingPathPoints.GetTargetLocation());
        }
        Get local_14;
        if (local_14.opCall())
        {
            Get local_20;
            const FC_Transform& local_22 = local_20.opCall();
            if (local_22)
            {
                local_26 = (Cast<AFXActor>(local_8));
                if (local_26 != nullptr)
                {
                    for (auto local_40 : local_26.NiagaraSystemList)
                    {
                        local_40.SetVariablePosition(this.GuidingTargetNSPlayerLocationParamName, local_22.GetPosition());
                        local_40.SetVariablePosition(this.GuidingTargetNSTargetGroundLocationParamName, C_GuidingPathPoints.GetTargetLocation());
                        local_40.ReinitializeSystem();
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickGuidingTargetEffect(const FECSEntity &inout Entity, FC_GuidingPathTargetActor &inout C_GuidingPathTargetActor, const FC_GuidingPathPoints &inout C_GuidingPathPoints, const FCS_LocalTime &inout LocalTime, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        float32 local_3 = 0.0f;
        AActor local_16;
        if (C_GuidingPathTargetActor.bIsFirstDisplay)
        {
        }
        else
        {
        }
        FFPTime local_8 = (FFPTime(LocalTime.Time) - C_GuidingPathTargetActor.LastActivateTime);
        bool local_2 = (local_8.opCmp(local_3) < 0);
        if (local_16 != nullptr)
        {
            FVector local_32 = local_16.GetActorLocation();
            FECSEntity local_22 = LocalPlayer.GetPlayerPawnEntity();
            GetDefaulted local_26;
            C_GuidingPathTargetActor.bIsHiddenByDistance = (C_GuidingPathTargetActor.bIsHiddenByDistance || (local_26.opCall().GetPosition().Dist2D(local_32) <= this.GuidingTargetEffectMinVisibleDistance));
            local_16.SetActorHiddenInGame(!((local_2 && !(C_GuidingPathTargetActor.bIsHiddenByDistance))));
        }
        return;
    }
    UFUNCTION()
    void Monitor_DestroyGuidingTargetEffect(const FECSEntity &inout Entity, const FC_GuidingPathPoints &inout C_GuidingPathPoints) const
    {
        Modify local_4;
        FC_GuidingPathTargetActor& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.TargetActor.IsValid())
            {
                AActor local_10;
                local_10.DestroyActor();
            }
            Remove local_14;
            local_14.opCall();
        }
        return;
    }
    bool IsStraightTwoPointPathSource(const int Src) const
    {
        return (Src == 1 || (Src == 4));
    }
    void LogSteepSegments(const FString &inout Stage, const TArray<FVector> &inout Pts, const int PathSrc) const
    {
        if (!(CVar_GuidingPath_DiagLog.GetBool()))
        {
            return;
        }
        int local_2 = 1125515264;
        int local_4 = 1065353216;
        int local_5 = 16;
        FString local_14 = this.GetGuidingPathSourceName(PathSrc);
        int local_15 = 0;
        int local_16 = 0;
        int local_17 = -1;
        int local_18 = 0;
        int local_19 = 0;
        int local_20 = 1;
        for (; local_20 < Pts.Num(); ++local_20)
        {
            float local_24 = Pts[local_20].Z;
            int local_21 = local_20 - 1;
            local_24 = local_24 - Pts[local_21].Z;
            int local_27 = FMath::Abs(float32(local_24));
            local_24 = Pts[local_20].Y;
            local_21 = local_20 - 1;
            local_24 = local_24 - Pts[local_21].Y;
            float local_26 = Pts[local_20].X;
            local_21 = local_20 - 1;
            local_26 = local_26 - Pts[local_21].X;
            float local_22 = float32((FVector(local_26, local_24, 0.0).Size()));
            if (!(local_27 > 150.0f && (local_22 < 1.0f || (local_27 > (local_22 * 1.0f)))))
            {
                continue;
            }
            ++local_15;
            local_21 = uint(local_27);
            int local_41 = uint(local_22);
            if (local_21 > local_18)
            {
                local_18 = local_21;
                local_19 = local_41;
                local_17 = local_20;
            }
            if (local_16 < 16)
            {
                int local_42 = int((Pts[(local_20 - 1)].X));
                int local_43 = int((Pts[(local_20 - 1)].Y));
                int local_44 = int((Pts[(local_20 - 1)].Z));
                int local_45 = int(Pts[local_20].X);
                int local_46 = int(Pts[local_20].Y);
                int local_47 = int(Pts[local_20].Z);
                XLog(ELog(51), FString().Append("[GuidingPath/ећ‚з›ґиЇЉж–­] ").Append(Stage).Append(" й™Ўж®µ#").Append(local_20).Append(" dZ=").Append(local_21).Append(" dXY=").Append(local_41).Append(" A=(").Append(local_42).Append(",").Append(local_43).Append(",").Append(local_44).Append(") B=(").Append(local_45).Append(",").Append(local_46).Append(",").Append(local_47).Append(") жќҐжєђ=").Append(local_14));
                ++local_16;
            }
        }
        if (local_15 > 0)
        {
            XLog(ELog(51), FString().Append("[GuidingPath/ећ‚з›ґиЇЉж–­] ").Append(Stage).Append(" ж±‡жЂ» й™Ўж®µ=").Append(local_15).Append(" жњЂй™Ў#").Append(local_17).Append(" dZ=").Append(local_18).Append(" dXY=").Append(local_19).Append(" з‚№ж•°=").Append(Pts.Num()).Append(" жќҐжєђ=").Append(local_14));
        }
        return;
    }
    FString GetGuidingPathSourceName(const int Src) const
    {
        if (Src == 1)
        {
            return "NavMeshз›ґиѕѕ";
        }
        if (Src == 2)
        {
            return "NavMeshи·Їеѕ„";
        }
        if (Src == 3)
        {
            return "и·ЇзЅ‘";
        }
        if (Src == 4)
        {
            return "е…њеє•з›ґзєї";
        }
        return "ж— ";
    }
    FColor GetGuidingPathSourceColor(const int Src) const
    {
        if (Src == 1)
        {
            return FColor(uint8(255), uint8(255), uint8(255), uint8(255));
        }
        if (Src == 2)
        {
            return FColor(uint8(0), uint8(128), uint8(255), uint8(255));
        }
        if (Src == 3)
        {
            return FColor(uint8(255), uint8(140), uint8(0), uint8(255));
        }
        if (Src == 4)
        {
            return FColor(uint8(255), uint8(255), uint8(0), uint8(255));
        }
        return FColor(uint8(128), uint8(128), uint8(128), uint8(255));
    }
    void DrawDebugPath(const TArray<FVector> &inout PathPoints, const FColor &inout ColorA = FColor::Green, const float32 OffsetZ = 0.0f) const
    {
        int local_1 = 0;
        for (; local_1 < (PathPoints.Num() - 1); )
        {
            FVector local_30 = ((FVector(PathPoints[local_1 + 1])) + FVector(0.0, 0.0, OffsetZ));
            DebugDraw::DrawDebugLine(this.GetWorld(), (FVector(PathPoints[local_1]) + FVector(0.0, 0.0, OffsetZ)), local_30, ColorA, false, 30.0f, uint8(0), 5.0f);
            ++local_1;
        }
        return;
    }
    float32 CalcGuidingPathPolylineLength(const TArray<FVector> &inout PathPoints) const
    {
        float32 local_1 = 0.0f;
        int local_3 = 1;
        for (; local_3 < PathPoints.Num(); )
        {
            local_1 = local_1 + (float32(((FVector(PathPoints[local_3]) - PathPoints[local_3 - 1]).Size())));
            ++local_3;
        }
        return local_1;
    }
    FVector GetPositionAlongPath(const TArray<FVector> &inout PathPoints, const TArray<float32> &inout CumulativeLengths, const float32 DistanceFromStart) const
    {
        float32 local_20;
        FVector local_10;
        if (PathPoints.Num() <= 1 || (CumulativeLengths.Num() < PathPoints.Num()))
        {
            if (PathPoints.Num() > 0)
            {
                local_10 = PathPoints.Last(0);
            }
            else
            {
                local_10 = FVector::ZeroVector;
            }
            return local_10;
        }
        float32 local_11 = CumulativeLengths.Last(0);
        float32 local_14 = FMath::Clamp(DistanceFromStart, 0.0f, local_11);
        if (local_14 >= local_11)
        {
            return PathPoints.Last(0);
        }
        if (local_14 <= 0.0f)
        {
            return PathPoints[0];
        }
        int local_15 = 0;
        int local_16 = 1;
        for (; local_16 < CumulativeLengths.Num(); ++local_16)
        {
            if (CumulativeLengths[local_16] >= local_14)
            {
                local_15 = local_16 - 1;
                break;
            }
        }
        float32 local_17 = CumulativeLengths[local_15];
        float32 local_18 = CumulativeLengths[local_15 + 1];
        float32 local_12 = local_18 - local_17;
        if (local_12 > 0.0001f)
        {
            local_20 = (local_14 - local_17) / (local_18 - local_17);
        }
        else
        {
            local_20 = 0.0f;
        }
        return FMath::Lerp(PathPoints[local_15], PathPoints[local_15 + 1], local_20);
    }
    void SimplifyPolylineRDP(const TArray<FVector> &inout In, const float32 Tolerance, const float32 VertTolerance, TArray<FVector> &inout Out) const
    {
        float32 local_25;
        int local_26;
        float32 local_69;
        Out.Reset(0);
        int local_1 = In.Num();
        if ((local_1 <= 2 || (Tolerance <= 0.0f)))
        {
            Out = In;
            return;
        }
        TArray<int> local_10;
        local_10.SetNum(local_1);
        int local_11 = 0;
        for (; local_11 < local_1; )
        {
            local_10[local_11] = 0;
            ++local_11;
        }
        local_10[0] = 1;
        int local_13 = 1;
        int local_2_2 = local_1 - 1;
        local_10[local_2_2] = local_13;
        TArray<int> local_18;
        TArray<int> local_22;
        local_18.Add(0);
        local_22.Add((local_1 - 1));
        if (VertTolerance > 0.0f)
        {
            local_25 = VertTolerance;
        }
        else
        {
            local_25 = Tolerance;
        }
        while (local_18.Num() > 0)
        {
            local_11 = local_18.Last(0);
            local_26 = local_22.Last(0);
            int local_13_3 = local_18.Num() - 1;
            local_18.RemoveAt(local_13_3);
            local_22.RemoveAt(local_22.Num() - 1);
            if (local_26 <= (local_11 + 1))
            {
                continue;
            }
            FVector local_32(In[local_11]);
            FVector local_50 = (FVector(In[local_26]) - local_32);
            float local_54 = local_50.X * local_50.X;
            float local_56 = local_50.Y;
            float local_58;
            local_56 = local_56 * local_50.Y;
            local_58 = local_54 + local_56;
            float32 local_4 = float32(local_58);
            float32 local_59 = -1.0f;
            int local_60 = -1;
            local_13_3 = local_11 + 1;
            for (; local_13_3 < local_26; ++local_13_3)
            {
                FVector local_38 = (FVector(In[local_13_3]) - local_32);
                local_69 = 0.0f;
                float32 local_51 = float32(local_32.Z);
                if (local_4 <= 0.0001f)
                {
                    local_56 = local_38.X * local_38.X;
                    local_54 = local_38.Y;
                    local_54 = local_54 * local_38.Y;
                    local_58 = local_56 + local_54;
                    local_54 = FMath::Sqrt(local_58);
                    local_69 = float32(local_54);
                }
                else
                {
                    local_58 = local_38.X * local_50.X;
                    local_56 = local_38.Y;
                    local_56 = local_56 * local_50.Y;
                    local_54 = local_58 + local_56;
                    float32 local_70 = FMath::Clamp(float32(local_54) / local_4, 0.0f, 1.0f);
                    float32 local_24 = float32(local_38.X) - (float32(local_50.X) * local_70);
                    float32 local_71 = float32(local_50.Y);
                    local_71 = float32(local_38.Y) - (local_71 * local_70);
                    local_69 = FMath::Sqrt(((local_24 * local_24) + (local_71 * local_71)));
                    local_51 = float32(local_32.Z) + (float32(local_50.Z) * local_70);
                }
                float32 local_74_2 = FMath::Max(local_69 / Tolerance, (FMath::Abs(float32(In[local_13_3].Z) - local_51)) / local_25);
                if (local_74_2 > local_59)
                {
                    local_59 = local_74_2;
                    local_60 = local_13_3;
                }
            }
            if ((local_60 >= 0 && (local_59 > 1.0f)))
            {
                local_10[local_60] = 1;
                local_18.Add(local_11);
                local_22.Add(local_60);
                local_18.Add(local_60);
                local_22.Add(local_26);
            }
        }
        Out.Reserve(local_1);
        int local_13_4 = 0;
        for (; local_13_4 < local_1; ++local_13_4)
        {
            int local_61 = local_10[local_13_4];
            if (local_61 != 0)
            {
                Out.Add(In[local_13_4]);
            }
        }
        return;
    }
    void UpdateGuidingSplineActor(const FECSEntity &inout Entity, const FVector &inout StartLocation, const TArray<FVector> &inout PolyPoints) const
    {
        int local_8 = 0;
        USplineComponent local_30;
        int local_99;
        float32 local_113;
        if (this.GuidingPathActorClass.IsNull())
        {
            return;
        }
        if (!(local_8.GuidingSplineActor.IsValid()))
        {
            TSubclassOf<AActor> local_10 = this.GuidingPathActorClass.Get();
            if ((local_10 == nullptr))
            {
                local_10 = (Cast<UClass>(this.GuidingPathActorClass.ToSoftObjectPath().TryLoad()));
            }
            AGuidingSplineActor local_28 = Cast<AGuidingSplineActor>(SpawnActor(local_10, StartLocation, FRotator::ZeroRotator, NAME_None, false, nullptr, nullptr));
            if (local_28 != nullptr)
            {
                local_8.GuidingSplineActor = local_28;
                local_30 = Cast<USplineComponent>(local_28.GetComponentByClass(USplineComponent));
                local_8.SplineComponent = local_30;
                local_8.NiagaraComponent = Cast<UNiagaraComponent>(local_28.GetComponentByClass(UNiagaraComponent));
            }
        }
        AGuidingSplineActor local_26;
        local_26.SetActorHiddenInGame(false);
        local_26.SetActorLocation(StartLocation);
        if (local_8.SplineComponent.IsValid())
        {
            bool local_107;
            float32 local_76;
            float32 local_75;
            float32 local_36;
            float32 local_35;
            float32 local_33;
            local_33 = 200.0f;
            local_35 = 0.0f;
            if (local_8.GuidingSplineActor.IsValid())
            {
                local_33 = local_26.SegmentTileLength;
                local_35 = local_26.HeightOffset;
            }
            local_36 = local_35;
            TArray<FVector> local_40;
            int local_41 = PolyPoints.Num();
            local_40.Reserve(local_41);
            int local_42 = 0;
            for (; local_42 < PolyPoints.Num(); )
            {
                FVector local_62 = FVector(PolyPoints[local_42]);
                local_40.Add((local_62 + FVector(0.0, 0.0, local_36)));
                ++local_42;
            }
            if (local_40.Num() < 2)
            {
                return;
            }
            FVector local_74(local_40.Last(0));
            local_75 = this.DrapeSimplifyTolerance;
            local_76 = this.DrapeSimplifyVertTolerance;
            TArray<FVector> local_80;
            this.SimplifyPolylineRDP(local_40, local_75, local_76, local_80);
            int local_41_2 = local_80.Num();
            if (local_41_2 < 2)
            {
                local_80 = local_40;
            }
            TArray<FVector> local_84;
            local_84.Reserve((local_80.Num() + 16));
            local_84.Add(local_80[0]);
            local_42 = 1;
            for (; local_42 < local_80.Num(); ++local_42)
            {
                int local_41_3 = local_42 - 1;
                FVector local_90 = local_80[local_41_3];
                FVector local_96 = local_80[local_42];
                float local_52_2 = (local_96 - local_90).Size();
                float32 local_34 = float32(local_52_2);
                if (local_34 <= 0.0001f)
                {
                    continue;
                }
                if (local_33 > 1.0f && (local_34 > local_33))
                {
                    local_41_3 = FMath::FloorToInt(local_34 / local_33);
                    int local_100 = 1;
                    for (; local_100 <= local_41_3; )
                    {
                        float32 local_97 = local_100;
                        local_97 = local_97 * local_33;
                        local_97 = local_97 / local_34;
                        if (local_97 >= 1.0f)
                        {
                            break;
                        }
                        local_52_2 = local_97;
                        local_84.Add(FMath::Lerp(local_90, local_96, local_52_2));
                        ++local_100;
                    }
                }
                local_84.Add(local_96);
            }
            TArray<FVector> local_106;
            local_106.Reserve(local_84.Num());
            local_106.Add(local_84[0]);
            float32 local_97_2 = 0.0f;
            local_107 = false;
            local_42 = 1;
            for (; local_42 < local_84.Num(); )
            {
                FVector local_50 = local_84[local_42];
                int local_102 = local_42 - 1;
                FVector local_62_2 = (local_50 - local_84[local_102]);
                float local_54 = local_62_2.Size();
                float32 local_101 = float32(local_54);
                float32 local_34_2 = local_97_2 + local_101;
                if (local_34_2 >= this.MaxSplineLength)
                {
                    local_34_2 = this.MaxSplineLength - local_97_2;
                    if (local_101 > 0.0001f)
                    {
                        local_113 = FMath::Clamp(local_34_2 / local_101, 0.0f, 1.0f);
                    }
                    else
                    {
                        local_113 = 0.0f;
                    }
                    local_54 = local_113;
                    local_106.Add(FMath::Lerp(local_84[local_42 - 1], local_84[local_42], local_54));
                    local_107 = true;
                    break;
                }
                local_97_2 = local_97_2 + local_101;
                local_106.Add(local_84[local_42]);
                ++local_42;
            }
            if (!(local_107))
            {
                float local_54_2 = (FVector(local_106.Last(0)) - local_74).SizeSquared();
                if (local_54_2 > 0.01)
                {
                    local_106.Add(local_74);
                }
            }
            if (CVar_GuidingPath_DiagLog.GetBool())
            {
                Has local_118;
                bool local_98 = local_118.opCall();
                if (local_98)
                {
                    Get local_122;
                    local_99 = local_122.opCall().GetPathSource();
                }
                else
                {
                    local_99 = 0;
                }
                this.LogSteepSegments("ж ·жќЎз‚№", local_106, local_99);
            }
            int local_102_3 = local_106.Num();
            local_30.ClearSplinePoints(false);
            local_99 = 0;
            for (; local_99 < local_102_3; )
            {
                FSplinePoint local_156;
                float32 local_109 = local_99;
                local_156.Position = local_30.GetWorldTransform().InverseTransformPosition(local_106[local_99]);
                if (local_99 == 0 && (local_102_3 > 1))
                {
                    FVector local_62_3 = (FVector(local_106[1]) - local_106[0]);
                    FVector local_90_2 = (local_62_3.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 100.0);
                    local_156.ArriveTangent = local_90_2;
                }
                else
                {
                    if (local_99 == (local_102_3 - 1) && (local_102_3 > 1))
                    {
                        FVector local_90_3 = local_106[local_99];
                        FVector local_62_4 = (local_90_3 - local_106[local_99 - 1]);
                        local_156.ArriveTangent = (local_62_4.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 100.0);
                    }
                    else
                    {
                        if (local_99 > 0 && (local_99 < (local_102_3 - 1)))
                        {
                            FVector local_62_5 = (FVector(local_106[local_99]) - local_106[local_99 - 1]);
                            float local_52_3 = local_62_5.Size();
                            local_109 = float32(local_52_3);
                            local_42 = local_99 + 1;
                            FVector local_90_4 = (FVector(local_106[local_42]) - local_106[local_99]);
                            local_52_3 = local_90_4.Size();
                            float32 local_34_3 = float32(local_52_3);
                            local_90_4 = (FVector(local_106[(local_99 + 1)]) - local_106[local_99 - 1]);
                            local_62_5 = local_90_4.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                            local_52_3 = FMath::Min(local_109, local_34_3);
                            FVector local_68 = (local_62_5 * local_52_3);
                            float local_54_3 = local_106[(local_99 - 1)].Z;
                            float32 local_110 = float32((local_106[local_99].Z - local_54_3));
                            local_52_3 = (local_106[(local_99 + 1)].Z) - local_106[local_99].Z;
                            local_113 = float32(local_52_3);
                            if ((local_110 * local_113) <= 0.0f)
                            {
                                local_52_3 = 0.0;
                                local_68.Z = 0.0;
                            }
                            else
                            {
                                float32 local_112 = local_110 * 2.0f;
                                float32 local_181 = local_112 * local_113;
                                local_112 = local_110 + local_113;
                                local_52_3 = (local_181 / local_112);
                                local_68.Z = local_52_3;
                            }
                            local_156.ArriveTangent = local_68;
                        }
                    }
                }
                local_156.LeaveTangent = local_156.ArriveTangent;
                local_30.AddPoint(local_156, false);
                ++local_99;
            }
            local_30.UpdateSpline();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleGuidingPathRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestGuidingPathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestGuidingPathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_RequestGuidingPathEvent, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleGuidingPathRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleStopGuidingPath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_StopGuidingPathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_StopGuidingPathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleStopGuidingPath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnGuidingPathTargetDestroyed() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGuidingPathTargetOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnGuidingPathTargetDestroyed(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnGuidingPathTargetDead() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnGuidingPathTargetDead(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_FindMinDistanceRegionPathNode(const FVector &inout Arg0, FVector &inout Arg1, float32 &inout Arg2) const
    {
        int local_136 = 0;
        int local_138 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_GuidingPathSystem::Job_FindMinDistanceRegionPathNode"));
        ECS::GetContextJob();
        int local_8 = 1;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_94 = local_48.Iterator();
        for (; local_94.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_133 = FECSEntityScopeCycleCounter(local_94.Proceed());
            this.Job_FindMinDistanceRegionPathNode(Arg0, Arg1, Arg2, local_136, local_138);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateGuidPathFinding() const
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
                this.ServerJob_UpdateGuidPathFinding(local_40, local_6, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_GuidingPathUpdateInfo> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_UpdateGuidPathFinding(local_180, local_6, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_GuidingPathUpdateInfo>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnServerRemoveGuidPath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGuidingPathPointsOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnServerRemoveGuidPath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_RemoveGuidingPathTarget() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
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
                this.ServerJob_RemoveGuidingPathTarget(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_RemoveGuidingPathTarget(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    void Monitor___CacheForDefer___Monitor_SetLevelSpotConfigForGuidingPathTarget(const FC_GuidingPathTarget &inout MonitorComp, const FECSEntity &inout Entity) const
    {
        if (Entity.IsValid() == false)
        {
            XError(ELog(2), "Not Supported: monitor defer tag on Entity Destroy FC_SetLevelSpotConfigForGuidingPathTargetDeferTag");
            return;
        }
        Has local_8;
        bool local_2 = local_8.opCall();
        if (local_2)
        {
            Remove local_12;
            local_12.opCall();
            return;
        }
        FC_SetLevelSpotConfigForGuidingPathTargetDeferTag local_18;
        Assign local_16;
        local_16.opCall(local_18);
        return;
    }
    UFUNCTION()
    void Run_Monitor___CacheForDefer___Monitor_SetLevelSpotConfigForGuidingPathTarget() const
    {
        int local_70 = 0;
        int local_72 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_32 = ::__GetMonitorGuidingPathTargetOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_48 = local_32.Iterator();
        for (; local_48.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_63 = FECSEntityScopeCycleCounter(local_62.Entity);
            GetComponent local_68 = FECSMonitorRuntimeViewItem::GetComponent(local_62);
            this.Monitor___CacheForDefer___Monitor_SetLevelSpotConfigForGuidingPathTarget(local_70, local_72);
        }
        FECSMonitorRuntimeView local_36 = ::__GetMonitorGuidingPathTargetOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_60 = local_36.Iterator();
        for (; local_60.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62_2 = local_60.Proceed();
            FECSEntityScopeCycleCounter local_63_2 = FECSEntityScopeCycleCounter(local_62_2.Entity);
            GetComponent local_68_2 = FECSMonitorRuntimeViewItem::GetComponent(local_62_2);
            this.Monitor___CacheForDefer___Monitor_SetLevelSpotConfigForGuidingPathTarget(local_70, local_72);
        }
        FECSMonitorRuntimeView local_76 = ::__GetMonitorGuidingPathTargetOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_48_2 = local_76.Iterator();
        for (; local_48_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62_3 = local_48_2.Proceed();
            FECSEntityScopeCycleCounter local_63_3 = FECSEntityScopeCycleCounter(local_62_3.Entity);
            GetComponent local_68_3 = FECSMonitorRuntimeViewItem::GetComponent(local_62_3);
            this.Monitor___CacheForDefer___Monitor_SetLevelSpotConfigForGuidingPathTarget(local_70, local_72);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_SetLevelSpotConfigForGuidingPathTarget() const
    {
        const FECSEntity& local_120;
        int local_128 = 0;
        int local_130 = 0;
        ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        FECSRuntimeView local_44 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_44.Iterator();
        for (; local_82.CanProceed;)
        {
            local_120 = local_82.Proceed();
            FECSEntityScopeCycleCounter local_121 = FECSEntityScopeCycleCounter(local_120);
            this.Monitor_SetLevelSpotConfigForGuidingPathTarget(local_130, local_128);
        }
        FECSMonitorRuntimeView local_136 = ::__GetMonitorGuidingPathTargetOnAssignView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_152 = local_136.Iterator();
        for (; local_152.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_166 = local_152.Proceed();
            FECSEntityScopeCycleCounter local_121_2 = FECSEntityScopeCycleCounter(local_166.Entity);
            GetComponent local_170 = FECSMonitorRuntimeViewItem::GetComponent(local_166);
            this.Monitor_SetLevelSpotConfigForGuidingPathTarget(local_120, local_128);
        }
        FECSMonitorRuntimeView local_140 = ::__GetMonitorGuidingPathTargetOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_164 = local_140.Iterator();
        for (; local_164.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_166_2 = local_164.Proceed();
            FECSEntityScopeCycleCounter local_121_3 = FECSEntityScopeCycleCounter(local_166_2.Entity);
            GetComponent local_170_2 = FECSMonitorRuntimeViewItem::GetComponent(local_166_2);
            this.Monitor_SetLevelSpotConfigForGuidingPathTarget(local_130, local_128);
        }
        FECSMonitorRuntimeView local_174 = ::__GetMonitorGuidingPathTargetOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_152_2 = local_174.Iterator();
        for (; local_152_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_166_3 = local_152_2.Proceed();
            FECSEntityScopeCycleCounter local_121_4 = FECSEntityScopeCycleCounter(local_166_3.Entity);
            GetComponent local_170_3 = FECSMonitorRuntimeViewItem::GetComponent(local_166_3);
            this.Monitor_SetLevelSpotConfigForGuidingPathTarget(local_120, local_128);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DrainGuidingPathRequest() const
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
                this.ClientJob_DrainGuidingPathRequest(local_36, local_38);
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
            this.ClientJob_DrainGuidingPathRequest(local_170, local_38);
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
    void Run_ClientJob_OnServerUpdateGuidPath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GuidingPathServerUpdate> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GuidingPathServerUpdate& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_OnServerUpdateGuidPath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnGuidingPathFindFailed() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_GuidingPathFindFailedEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_GuidingPathFindFailedEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_OnGuidingPathFindFailed(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnUpdateGuidPath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGuidingPathPointsOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnUpdateGuidPath(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorGuidingPathPointsOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnUpdateGuidPath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveGuidPath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGuidingPathPointsOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveGuidPath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveGuidLineActor() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGuidingSplineActorOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveGuidLineActor(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleShowGuidingPathTrigger() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_HandleShowGuidingPathTrigger(local_46, local_48, local_12, local_54);
            }
            local_2.UpdateCachedEntityCount(local_23);
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
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_HandleShowGuidingPathTrigger(local_186, local_48, local_12, local_54);
        }
        local_2.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleResetSplineNiragaraEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ResetGuidingPathNiagaraEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ResetGuidingPathNiagaraEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleResetSplineNiragaraEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ResetGuidingSplinePeriodically() const
    {
        int local_14 = 0;
        const FECSEntity& local_48;
        int local_50 = 0;
        int local_56 = 0;
        int local_62 = 0;
        int local_198 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if ((this.GuidingPathNiaragaResetInterval > 0.0f) == false)
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_2 = this.GetECSWorld();
        int local_20 = 0;
        int local_19 = local_20;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_24 = local_2.GetViewCacheEntities();
            int local_25 = 0;
            for (auto& local_40 : local_24)
            {
                local_40;
                FECSEntity local_44;
                if (!(local_44.IsValid()))
                {
                    continue;
                }
                ++local_25;
                FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44);
                this.ClientJob_ResetGuidingSplinePeriodically(local_48, local_50, local_56, local_62, local_14);
            }
            local_2.UpdateCachedEntityCount(local_25);
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
        Exclude(local_104).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_26 = local_2.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_104.Iterator();
        for (; local_160.CanProceed;)
        {
            local_48 = local_160.Proceed();
            ++local_126;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_48.GetId());
            }
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_48);
            this.ClientJob_ResetGuidingSplinePeriodically(local_198, local_50, local_56, local_62, local_14);
        }
        local_2.UpdateCachedEntityCount(local_126);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_26);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ActivateGuidingSplineNiagara(const bool Arg0) const
    {
        int local_16 = 0;
        int local_154 = 0;
        int local_156 = 0;
        int local_162 = 0;
        int local_168 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_GuidingPathSystem::Job_ActivateGuidingSplineNiagara"));
        ECS::GetContextJob();
        FECSWorldPtr local_8 = this.GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        FECSRuntimeView local_60 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        Include local_76;
        local_76.opCall();
        Exclude(local_60).opCall();
        FECSRuntimeViewIterator local_114 = local_60.Iterator();
        for (; local_114.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_151 = FECSEntityScopeCycleCounter(local_114.Proceed());
            this.Job_ActivateGuidingSplineNiagara(Arg0, local_154, local_156, local_162, local_168, local_16);
            MarkModifiedIfDirty local_176;
            local_176.opCall(local_168);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickGuidingPathDrape() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        MarkModifiedIfDirty local_62;
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
                this.ClientJob_TickGuidingPathDrape(local_36, local_38, local_44, local_50);
                local_58.opCall(local_38);
                local_62.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_36 = local_156.Proceed();
            ++local_122;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickGuidingPathDrape(local_194, local_38, local_44, local_50);
            local_58.opCall(local_38);
            local_62.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_122);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleResetGuidingTargetEffect() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ResetGuidingTargetEffectEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ResetGuidingTargetEffectEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleResetGuidingTargetEffect(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateGuidingTargetEffect(const bool Arg0) const
    {
        int local_16 = 0;
        int local_150 = 0;
        int local_152 = 0;
        int local_158 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_GuidingPathSystem::Job_UpdateGuidingTargetEffect"));
        ECS::GetContextJob();
        FECSWorldPtr local_8 = this.GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        FECSRuntimeView local_60 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        Exclude(local_60).opCall();
        FECSRuntimeViewIterator local_110 = local_60.Iterator();
        for (; local_110.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_147 = FECSEntityScopeCycleCounter(local_110.Proceed());
            this.Job_UpdateGuidingTargetEffect(Arg0, local_150, local_152, local_158, local_16);
            MarkModifiedIfDirty local_166;
            local_166.opCall(local_152);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickGuidingTargetEffect() const
    {
        int local_16 = 0;
        int local_22 = 0;
        const FECSEntity& local_56;
        int local_58 = 0;
        int local_64 = 0;
        MarkModifiedIfDirty local_72;
        int local_196 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        int local_28 = 0;
        int local_27 = local_28;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_5 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_32 = local_2.GetViewCacheEntities();
            int local_33 = 0;
            for (auto& local_48 : local_32)
            {
                local_48;
                FECSEntity local_52;
                if (!(local_52.IsValid()))
                {
                    continue;
                }
                ++local_33;
                FECSEntityScopeCycleCounter local_53 = FECSEntityScopeCycleCounter(local_52);
                this.ClientJob_TickGuidingTargetEffect(local_56, local_58, local_64, local_16, local_22);
                local_72.opCall(local_58);
            }
            local_2.UpdateCachedEntityCount(local_33);
            return;
        }
        FECSRuntimeView local_110 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Exclude(local_110).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_34 = local_2.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_110.Iterator();
        for (; local_158.CanProceed;)
        {
            local_56 = local_158.Proceed();
            ++local_124;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_56.GetId());
            }
            FECSEntityScopeCycleCounter local_53_2 = FECSEntityScopeCycleCounter(local_56);
            this.ClientJob_TickGuidingTargetEffect(local_196, local_58, local_64, local_16, local_22);
            local_72.opCall(local_58);
        }
        local_2.UpdateCachedEntityCount(local_124);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_34);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_DestroyGuidingTargetEffect() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGuidingPathPointsOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_DestroyGuidingTargetEffect(local_46, local_52);
        }
        return;
    }
}

