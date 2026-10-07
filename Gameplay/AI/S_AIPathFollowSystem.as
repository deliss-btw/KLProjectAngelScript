
const FConsoleVariable CVar_AI_DebugAIPathFindResurlt = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugAIPathRuningPath = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugAIPathFindUesFakeResurlt = FConsoleVariable();
const FConsoleVariable CVar_AI_AutomaticRepairStuck = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugSimulateFollowLog = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugChainedStartEntryPath = FConsoleVariable();
const FConsoleVariable CVar_AI_DebugChainedStartTurnPath = FConsoleVariable();
const FConsoleVariable CVar_AI_LogRePathByTimer = FConsoleVariable();
const FName DebugDrawKey_AIPathFind = n"AIPathFind";

class US_AIPathFollowSystem : UECSScriptSystem
{
    float32 SimulatedMinDistance = 2000.0f;
    float32 SimulatedRequestDistance = 5000.0f;


    void SendEcologyMovePathFindingEvent(const FECSEntity &inout Entity, FC_AIPathFollowV2 &inout PathFollow, const bool bSucceed, const TArray<FPathSessionPoint> &inout PathPoints) const
    {
        if (!(PathFollow.bSendEcologyMovePathFindingEvent))
        {
            return;
        }
        FFPTime local_8 = FFPTime(-1);
        FCE_EcologyMovePathFindingResult local_12;
        local_12.Key = PathFollow.EcologyMovePathFindingEventKey;
        local_12.StartPos = PathFollow.StartLocation;
        local_12.EndPos = PathFollow.OriginalTargetLocation;
        local_12.bSucceed = bSucceed;
        local_12.PathPoints.Empty(0);
        if (bSucceed)
        {
            local_12.PathPoints.Reserve(PathPoints.Num());
            int local_13 = 0;
            for (; local_13 < PathPoints.Num(); )
            {
                local_12.PathPoints.Add(PathPoints[local_13].Position);
                ++local_13;
            }
        }
        PathFollow.bSendEcologyMovePathFindingEvent = false;
        return;
    }
    void Finding(const FECSEntity &inout Entity, FC_AIPathFollowV2 &inout PathFollow) const
    {
        Has local_4;
        Get local_26;
        TDataObjectPtr<FAIMoveProclivityConfig> local_52;
        if (!(local_4.opCall()))
        {
            PathFollow.PathFindState = EAIPathFindingState(3);
            TArray<FPathSessionPoint> local_10;
            this.SendEcologyMovePathFindingEvent(Entity, PathFollow, false, local_10);
            XError(ELog(14), FString::Format("FindingAPI entity not has FC_AINavAgent EntityID:{0}", Entity.GetIdValue()));
            return;
        }
        int64 local_20 = 0;
        if (local_26.opCall().GetMoveAbilityConfig().IsSet() && local_26.opCall().GetMoveProclivityConfig().IsSet())
        {
            if (PathFollow.OverrideProclivityConfig.IsSet())
            {
                local_52 = PathFollow.OverrideProclivityConfig;
            }
            else
            {
                local_52 = local_26.opCall().GetMoveProclivityConfig();
            }
            local_20 = FAIPathSessionUtils::RequestMoveTo(ECS::GetUEWorld(), Entity.GetId(), PathFollow.StartLocation, PathFollow.TargetLocation, local_26.opCall().GetMoveAbilityConfig(), local_52);
        }
        else
        {
            if (UGameplayConfigsManager::GetAIMoveSettings().IsValid())
            {
                UAIMoveSettings local_106;
                UAIMoveSettings local_108;
                local_20 = FAIPathSessionUtils::RequestMoveTo(ECS::GetUEWorld(), Entity.GetId(), PathFollow.StartLocation, PathFollow.TargetLocation, TDataObjectPtr<FAIMoveConfig>(local_108.DefaultMoveAbilityConfig), TDataObjectPtr<FAIMoveProclivityConfig>(local_106.DefaultMoveProclivityConfig));
            }
        }
        FAIPathSession& local_134 = FAIPathSessionUtils::GetSession(ECS::GetUEWorld(), local_20);
        if (CVar_AI_DebugAIPathFindUesFakeResurlt.GetInt() > 0)
        {
            this.AddTestSessionData(local_134, CVar_AI_DebugAIPathFindUesFakeResurlt.GetInt(), PathFollow.StartLocation, PathFollow.TargetLocation);
        }
        PathFollow.PathSessionIndex = local_20;
        if (int(local_134.State) == 3)
        {
            XWarning(ELog(14), FString::Format("PathSession Find Path Failed EntityID:{0} StartPos {1}, EndPos {2}", Entity.GetIdValue(), PathFollow.StartLocation.ToString(), PathFollow.TargetLocation.ToString()));
            PathFollow.PathFindState = EAIPathFindingState(3);
            this.SendEcologyMovePathFindingEvent(Entity, PathFollow, false, local_134.PathPoints);
            return;
        }
        if (int(local_134.State) == 1)
        {
            XVerbose(ELog(14), FString::Format("PathSession Find Path Active EntityID:{0} StartPos {1}, EndPos {2}", Entity.GetIdValue(), PathFollow.StartLocation.ToString(), PathFollow.TargetLocation.ToString()));
            if (CVar_AI_DebugAIPathFindResurlt.GetInt() == 1 || (CVar_AI_DebugAIPathFindResurlt.GetInt() == Entity.GetIdValue()))
            {
                this.DrawPathFindDebug(Entity, PathFollow, local_134);
            }
            FC_AIPathFinding_SucceedTag local_152;
            Assign local_150;
            local_150.opCall(local_152);
            PathFollow.PathFindState = EAIPathFindingState(2);
            PathFollow.TargetLocation = local_134.PathPoints.Last(0).Position;
            this.SendEcologyMovePathFindingEvent(Entity, PathFollow, true, local_134.PathPoints);
            return;
        }
        if (int(local_134.State) == 0)
        {
            XVerbose(ELog(14), FString::Format("PathSession Find Path Need async EntityID:{0} StartPos {1}, EndPos {2}", Entity.GetIdValue(), PathFollow.StartLocation.ToString(), PathFollow.TargetLocation.ToString()));
            FC_AIPathFinding_AsyncInProcessTag local_158;
            Assign local_156;
            local_156.opCall(local_158);
            PathFollow.PathFindState = EAIPathFindingState(1);
        }
        return;
    }
    FPathSessionPoint CreatePathPoint(const FVector &inout Position, const EKLMoveAbilityMask Layer, const EPathSegmentType SegmentType) const
    {
        FPathSessionPoint local_12;
        local_12.Position = Position;
        local_12.Layer = Layer;
        local_12.SegmentType = SegmentType;
        return local_12;
    }
    void DrawPathFindDebug(const FECSEntity &inout Entity, const FC_AIPathFollowV2 &inout PathFollow, const FAIPathSession &inout PathSession) const
    {
        int local_25 = 0;
        int local_1 = 1084227584;
        FECSDebugDraw::SetDebugKeyEnable(DebugDrawKey_AIPathFind, true);
        FECSDebugDraw::SetDebugKeyUnfiltered(DebugDrawKey_AIPathFind, true);
        FVector local_16 = FVector(0.0, 0.0, 5.0);
        int local_23 = 0;
        while (local_23 < local_25)
        {
            FVector local_10(PathSession.PathPoints[local_23].Position);
            FVector local_38 = (local_10 + local_16);
            FECSDebugDraw::DrawDebugSphere(DebugDrawKey_AIPathFind, local_38, 24.0f, 8, FColor::Green, FColor::Green, 5.0f, uint8(0), 0.0f);
            if (local_23 > 0)
            {
                local_25 = local_23 - 1;
                local_10 = (FVector(PathSession.PathPoints[local_25].Position) + local_16);
                FECSDebugDraw::DrawDebugLine(DebugDrawKey_AIPathFind, local_10, local_38, FColor::Green, FColor::Green, 5.0f, uint8(0), 0.0f);
            }
            ++local_23;
        }
        FECSDebugDraw::DrawDebugSphere(DebugDrawKey_AIPathFind, (PathFollow.StartLocation + local_16), 30.0f, 8, FColor::Blue, FColor::Blue, 5.0f, uint8(0), 0.0f);
        FECSDebugDraw::DrawDebugSphere(DebugDrawKey_AIPathFind, (PathFollow.TargetLocation + local_16), 30.0f, 8, FColor::Red, FColor::Red, 5.0f, uint8(0), 0.0f);
        return;
    }
    void AddTestSessionData(FAIPathSession &inout PathSession, const int TestType, const FVector &inout StartLocation, const FVector &inout EndLocation) const
    {
        FVector local_12 = (EndLocation - StartLocation);
        FVector local_12_2 = (StartLocation + (local_12 * 0.5));
        PathSession.PathPoints.Empty(0);
        if (TestType == 1)
        {
            PathSession.PathPoints.Add(this.CreatePathPoint(StartLocation, EKLMoveAbilityMask(1), EPathSegmentType(1)));
            PathSession.PathPoints.Add(this.CreatePathPoint(local_12_2, EKLMoveAbilityMask(1), EPathSegmentType(1)));
            PathSession.PathPoints.Add(this.CreatePathPoint(EndLocation, EKLMoveAbilityMask(1), EPathSegmentType(1)));
        }
        else
        {
            if (TestType == 2)
            {
                FVector local_20_2 = FVector(0.0, 0.0, 5000.0);
                PathSession.PathPoints.Add(this.CreatePathPoint(StartLocation, EKLMoveAbilityMask(1), EPathSegmentType(1)));
                PathSession.PathPoints.Add(this.CreatePathPoint((local_12_2 + local_20_2), EKLMoveAbilityMask(32), EPathSegmentType(2)));
                PathSession.PathPoints.Add(this.CreatePathPoint((EndLocation + local_20_2), EKLMoveAbilityMask(16), EPathSegmentType(2)));
            }
            else
            {
                if (TestType == 3)
                {
                    FVector local_6_2 = (StartLocation + ((EndLocation - StartLocation) * 0.4));
                    local_6_2.Z = StartLocation.Z;
                    FVector local_20_3 = (EndLocation - StartLocation);
                    FVector local_42_2 = (local_20_3 * 0.6);
                    FVector local_20_4 = (StartLocation + local_42_2);
                    local_20_4.Z = StartLocation.Z;
                    FVector local_58 = EndLocation;
                    local_58.Z = StartLocation.Z;
                    PathSession.PathPoints.Add(this.CreatePathPoint(StartLocation, EKLMoveAbilityMask(1), EPathSegmentType(1)));
                    PathSession.PathPoints.Add(this.CreatePathPoint(local_6_2, EKLMoveAbilityMask(1), EPathSegmentType(1)));
                    PathSession.PathPoints.Add(this.CreatePathPoint(local_20_4, EKLMoveAbilityMask(2), EPathSegmentType(1)));
                    PathSession.PathPoints.Add(this.CreatePathPoint(local_58, EKLMoveAbilityMask(1), EPathSegmentType(1)));
                }
            }
        }
        return;
    }
    bool HasChainedChildEntity(const FECSEntity &inout Entity) const
    {
        int local_8 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return (local_8.Num() > 0);
        }
        return false;
    }
    float32 GetChainedStartEntryLookAheadDistance(const FECSEntity &inout Entity, const FVector &inout StartDir, const FVector &inout PathDir) const
    {
        int local_34 = 0;
        UAIMoveSettings local_70;
        float32 local_1 = 0.0f;
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            int local_10;
            for (auto& local_28 : local_10.GetChildren())
            {
                local_28;
                Has local_32;
                bool local_7_2 = local_32.opCall();
                if (local_7_2)
                {
                    local_1 = FMath::Max(local_1, local_34.GetChainParam().GetLinkInfo().GetLength());
                }
            }
        }
        float32 local_2 = FECSAIUtils::GetEntityAgentRadius(Entity);
        float32 local_58 = FMath::Clamp(float32((StartDir.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector).DotProduct(PathDir.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector)))), -1.0f, 1.0f);
        float32 local_39 = FMath::Acos(local_58) / 3.1415927f;
        float32 local_41 = FMath::Clamp(local_39, 0.0f, 1.0f);
        float32 local_62 = 6.0f;
        float32 local_63 = 5.0f;
        float32 local_64 = 1.6f;
        float32 local_65 = 1.8f;
        float32 local_66 = 1600.0f;
        float32 local_67 = 6500.0f;
        if (UGameplayConfigsManager::GetAIMoveSettings().IsValid())
        {
            local_63 = local_70.ChainedStartEntryChainLengthDistanceScale;
            local_65 = local_70.ChainedStartEntryLookAheadAngleScale;
            local_66 = local_70.ChainedStartEntryLookAheadMin;
            local_67 = local_70.ChainedStartEntryLookAheadMax;
        }
        local_67 = FMath::Max(local_66, local_67);
        float32 local_59 = FMath::Max((local_2 * local_62), local_1 * local_63);
        float32 local_40_2 = FMath::Max(900.0f, local_59) * (local_64 + (local_41 * local_65));
        return FMath::Clamp(local_40_2, local_66, local_67);
    }
    bool FindChainedStartEntryJoin(const FAIPathSession &inout PathSession, const FECSEntity &inout Entity, const float32 LookAheadDistance, FVector &inout OutJoinPos, FVector &inout OutJoinDir, int &inout OutTailStartIndex) const
    {
        bool local_12;
        bool local_20;
        float32 local_1 = 0.0f;
        int local_3 = 10;
        float32 local_5 = 50.0f;
        local_3 = FMath::Max(local_3, 1);
        float32 local_6 = FMath::Clamp(0.25f, 0.0f, 1.0f);
        int local_4 = FMath::Min((PathSession.PathPoints.Num() - 1), local_3);
        int local_11 = 1;
        for (; local_11 <= local_4; ++local_11)
        {
            const FPathSessionPoint& local_14 = PathSession.PathPoints[local_11 - 1];
            const FPathSessionPoint& local_16 = PathSession.PathPoints[local_11];
            if (FAIPathSessionUtils::FindFirstCorridorPointInRange(PathSession, 0, (local_11 + 1)) >= 0)
            {
                local_12 = true;
            }
            else
            {
                local_12 = local_14.bIsNavLinkStart;
            }
            if (local_12)
            {
                local_20 = true;
            }
            else
            {
                local_20 = local_16.bIsNavLinkStart;
            }
            local_12 = local_20 || (int(local_14.NodeRefType) == 2);
            local_20 = local_12 || (int(local_16.NodeRefType) == 2);
            if (((local_20 || !(this.IsGroundSegment(EPathSegmentType(local_16.SegmentType)))) || !(this.IsGroundPoint(Entity, local_14.Position))) || !(this.IsGroundPoint(Entity, local_16.Position)))
            {
                break;
            }
            FVector local_42 = (FVector(local_16.Position) - local_14.Position);
            float local_46 = local_42.Size2D();
            float32 local_9 = float32(local_46);
            FVector local_30 = FVector(local_42.X, local_42.Y, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            if (local_9 < local_5 || local_30.IsNearlyZero(9.999999747378752e-5))
            {
                continue;
            }
            if ((local_1 + local_9) >= LookAheadDistance || (local_11 == local_4))
            {
                OutJoinPos = FMath::Lerp(local_14.Position, local_16.Position, FMath::Clamp((LookAheadDistance - local_1) / local_9, local_6, 1.0f));
                OutJoinDir = local_30;
                OutTailStartIndex = local_11;
                return true;
            }
            local_1 = local_1 + local_9;
        }
        return false;
    }
    bool BuildChainedStartHermiteSamples(const FVector &inout StartPos, const FVector &inout StartDir, const FVector &inout JoinPos, const FVector &inout JoinDir, TArray<FVector> &inout OutSamples) const
    {
        UAIMoveSettings local_52;
        float32 local_55;
        OutSamples.Empty(0);
        FVector local_28 = FVector(StartDir.X, StartDir.Y, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_8 = FVector(JoinDir.X, JoinDir.Y, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float32 local_36 = float32(((JoinPos - StartPos).Size2D()));
        float32 local_38 = 0.42f;
        float32 local_40 = 1.55f;
        float32 local_41 = 0.45f;
        float32 local_42 = 700.0f;
        float32 local_44 = 90.0f;
        float32 local_45 = 24.0f;
        int local_46 = 12;
        if (UGameplayConfigsManager::GetAIMoveSettings().IsValid())
        {
            local_38 = local_52.ChainedStartEntryLateralOffsetScale;
            local_40 = local_52.ChainedStartEntryTangentBaseScale;
            local_44 = local_52.ChainedStartEntrySampleDistance;
        }
        if (local_28.IsNearlyZero(9.999999747378752e-5) || local_8.IsNearlyZero(9.999999747378752e-5) || (local_36 < 200.0f))
        {
            return false;
        }
        float32 local_57 = FMath::Clamp(float32(local_28.DotProduct(local_8)), -1.0f, 1.0f);
        float32 local_35 = FMath::Acos(local_57) / 3.1415927f;
        float32 local_54 = FMath::Clamp(local_35, 0.0f, 1.0f);
        if (float32(local_28.CrossProduct(local_8).Z) < 0.0f)
        {
            local_55 = -1.0f;
        }
        else
        {
            local_55 = 1.0f;
        }
        FVector local_34 = ((FVector(-local_28.Y, local_28.X, 0.0)).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_55);
        float32 local_43 = FMath::Max(local_42, 6000.0f);
        local_44 = FMath::Max(local_44, 1.0f);
        int local_47 = FMath::Max(local_46, 44);
        float32 local_61 = local_36 * local_38;
        float32 local_59 = local_61 * local_54;
        float32 local_61_2 = FMath::Clamp(local_59, 0.0f, 1800.0f);
        float32 local_69 = FMath::Clamp(local_36 * (local_40 + (local_54 * local_41)), local_42, local_43);
        FVector local_68 = (local_28 * local_69);
        FVector local_76 = (local_8 * local_69);
        int local_1 = FMath::CeilToInt(local_36 / local_44);
        float32 local_70 = local_54 * local_45;
        int local_84 = FMath::Clamp(FMath::Max((FMath::Max(local_1, FMath::CeilToInt(local_70))), local_46), local_46, local_47);
        OutSamples.Add(StartPos);
        int local_87 = 1;
        for (; local_87 <= local_84; )
        {
            float32 local_60_2 = local_87;
            float32 local_59_2 = local_84;
            float32 local_70_2 = local_60_2 / local_59_2;
            local_59_2 = local_70_2 * local_70_2;
            float32 local_88 = local_59_2 * local_70_2;
            float32 local_90 = local_88 * 2.0f;
            local_60_2 = local_59_2 * 3.0f;
            float32 local_89 = local_90 - local_60_2;
            local_60_2 = local_89 + 1.0f;
            float32 local_91 = local_59_2 * 2.0f;
            float32 local_58 = local_88 - local_91;
            local_91 = local_58 + local_70_2;
            float32 local_92 = -2.0f * local_88;
            local_89 = 3.0f * local_59_2;
            local_58 = local_92 + local_89;
            local_89 = local_88 - local_59_2;
            FVector local_82 = (StartPos * local_60_2);
            FVector local_14 = (local_68 * local_91);
            FVector local_106 = (local_82 + local_14);
            local_14 = (JoinPos * local_58);
            local_82 = (local_106 + local_14);
            local_14 = (local_76 * local_89);
            local_106 = (local_82 + local_14);
            local_92 = 1.0f - local_70_2;
            float32 local_107 = 64.0f * local_88;
            float32 local_94 = local_107 * local_92;
            local_107 = local_94 * local_92;
            local_94 = local_107 * local_92;
            FVector local_100 = (local_34 * local_61_2);
            local_14 = (local_100 * local_94);
            local_106 += local_14;
            local_106.Z = StartPos.Z;
            this.AddChainedStartPathPointIfDistinct(OutSamples, local_106);
            ++local_87;
        }
        if (OutSamples.Num() < 2 || ((((FVector(OutSamples.Last(0)) - JoinPos)).Size2D() > 5.0f)))
        {
            FVector local_106_2 = JoinPos;
            local_106_2.Z = StartPos.Z;
            this.AddChainedStartPathPointIfDistinct(OutSamples, local_106_2);
        }
        return (OutSamples.Num() >= 2);
    }
    bool IsChainedStartSamplePathReachable(const FECSEntity &inout Entity, const TArray<FVector> &inout Samples) const
    {
        if (Samples.Num() < 2)
        {
            return false;
        }
        int local_4 = 1;
        for (; local_4 < Samples.Num(); ++local_4)
        {
            FVector local_10(FVector::ZeroVector);
            if (FAINavigationUtils::NavigationRayCast(Entity, Samples[local_4 - 1], Samples[local_4], local_10))
            {
                return false;
            }
        }
        return true;
    }
    float32 GetChainedStartEntryDistinctPointDistance() const
    {
        return 20.0f;
    }
    void AddChainedStartPathPointIfDistinct(TArray<FVector> &inout Points, const FVector &inout Point) const
    {
        float32 local_2 = this.GetChainedStartEntryDistinctPointDistance();
        if ((Points.Num() == 0 || ((((Point - Points.Last(0))).Size2D() >= local_2))))
        {
            Points.Add(Point);
        }
        return;
    }
    void ReplaceChainedStartEntryPrefix(FAIPathSession &inout PathSession, const TArray<FVector> &inout Samples, const int TailStartIndex, int &inout OutPrefixEndIndex) const
    {
        OutPrefixEndIndex = -1;
        TArray<FPathSessionPoint> local_6;
        FPathSessionPoint local_18 = FPathSessionPoint(PathSession.PathPoints[0]);
        local_18.Position = Samples[0];
        local_6.Add(local_18);
        int local_19 = 1;
        for (; local_19 < Samples.Num(); ++local_19)
        {
            if ((FVector(Samples[local_19]) - local_6.Last(0).Position).Size2D() < this.GetChainedStartEntryDistinctPointDistance())
            {
                continue;
            }
            local_6.Add(this.CreatePathPoint(Samples[local_19], PathSession.PathPoints[1].Layer, PathSession.PathPoints[1].SegmentType));
        }
        int local_20 = local_6.Num() - 1;
        OutPrefixEndIndex = local_20;
        int local_19_2 = TailStartIndex;
        while (local_19_2 < local_20)
        {
            FVector local_34_2 = (FVector(PathSession.PathPoints[local_19_2].Position) - local_6.Last(0).Position);
            if (local_34_2.Size2D() < this.GetChainedStartEntryDistinctPointDistance())
            {
            }
            else
            {
                local_6.Add(PathSession.PathPoints[local_19_2]);
            }
            ++local_19_2;
        }
        PathSession.PathPoints.Empty(0);
        int local_19_3 = 0;
        for (; local_19_3 < local_6.Num(); )
        {
            PathSession.PathPoints.Add(local_6[local_19_3]);
            ++local_19_3;
        }
        return;
    }
    bool ShouldDrawChainedStartEntryPath(const FECSEntity &inout Entity) const
    {
        int local_4;
        int local_2 = CVar_AI_DebugChainedStartEntryPath.GetInt();
        int local_1 = CVar_AI_DebugChainedStartTurnPath.GetInt();
        local_4 = Entity.GetIdValue();
        return (local_2 == 1 || (local_2 == local_4) || (local_1 == 1) || (local_1 == local_4));
    }
    void MarkChainedStartEntryPrefixSegment(FSimulateData &inout Segment) const
    {
        Segment.SetbUseAIControlledMotion(true);
        Segment.SetbIsChainedStartEntryPrefix(true);
        return;
    }
    void MarkChainedStartEntryPrefixSegmentIfNeeded(FSimulateData &inout Segment, const int PathPointIndex, const int PrefixEndIndex) const
    {
        if (PathPointIndex <= PrefixEndIndex)
        {
            this.MarkChainedStartEntryPrefixSegment(Segment);
        }
        return;
    }
    void DrawChainedStartEntryPath(const FECSEntity &inout Entity, const TArray<FVector> &inout Samples) const
    {
        if (!(this.ShouldDrawChainedStartEntryPath(Entity)) || (Samples.Num() < 2))
        {
            return;
        }
        FName local_6(n"AIChainedStartEntryPath");
        FECSDebugDraw::SetDebugKeyEnable(local_6, true);
        FECSDebugDraw::SetDebugKeyUnfiltered(local_6, true);
        float32 local_7 = 10.0f;
        FVector local_22 = FVector(0.0, 0.0, 120.0f);
        int local_29 = 1;
        for (; local_29 < Samples.Num(); )
        {
            FVector local_42 = (FVector(Samples[(local_29 - 1)]) + local_22);
            FVector local_36 = (FVector(Samples[local_29]) + local_22);
            FECSDebugDraw::DrawDebugLine(local_6, local_42, local_36, FColor::Cyan, FColor::Cyan, local_7, uint8(1), 8.0f);
            FECSDebugDraw::DrawDebugSphere(local_6, local_36, 24.0f, 12, FColor::Cyan, FColor::Cyan, local_7, uint8(1), 4.0f);
            ++local_29;
        }
        FVector local_48 = (FVector(Samples[0]) + local_22);
        FVector local_36_2 = (FVector(Samples.Last(0)) + local_22);
        FECSDebugDraw::DrawDebugSphere(local_6, local_48, 36.0f, 12, FColor::Green, FColor::Green, local_7, uint8(1), 5.0f);
        FECSDebugDraw::DrawDebugSphere(local_6, local_36_2, 36.0f, 12, FColor::Orange, FColor::Orange, local_7, uint8(1), 5.0f);
        FECSDebugDraw::DrawDebugDirectionalArrow(local_6, local_48, (FVector(Samples[1]) + local_22), 100.0f, FColor::Green, FColor::Green, local_7, uint8(1), 6.0f);
        FECSDebugDraw::DrawDebugDirectionalArrow(local_6, (FVector(Samples[(Samples.Num() - 2)]) + local_22), local_36_2, 100.0f, FColor::Orange, FColor::Orange, local_7, uint8(1), 6.0f);
        return;
    }
    bool TryApplyChainedStartEntryPrefix(const FECSEntity &inout Entity, FAIPathSession &inout PathSession, const FC_AIPathFollowV2 &inout PathFollow, int &inout OutPrefixEndIndex) const
    {
        OutPrefixEndIndex = -1;
        if (!(this.HasChainedChildEntity(Entity)) || (PathSession.PathPoints.Num() < 2))
        {
            return false;
        }
        bool local_4 = PathSession.PathPoints[0].bIsNavLinkStart;
        if (local_4)
        {
            local_4 = true;
        }
        else
        {
            local_4 = PathSession.PathPoints[1].bIsNavLinkStart;
        }
        local_4 = local_4 || !(this.IsGroundPoint(Entity, PathSession.PathPoints[0].Position));
        local_4 = local_4 || !(this.IsGroundSegment(EPathSegmentType(PathSession.PathPoints[1].SegmentType)));
        if (local_4)
        {
            return false;
        }
        FVector local_32 = FVector(PathFollow.StartDirection.X, PathFollow.StartDirection.Y, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        double local_26 = PathSession.PathPoints[1].Position.Y - PathSession.PathPoints[0].Position.Y;
        float local_20 = PathSession.PathPoints[1].Position.X - PathSession.PathPoints[0].Position.X;
        FVector local_18 = FVector(local_20, local_26, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float32 local_43 = 15.0f;
        if (UGameplayConfigsManager::GetAIMoveSettings().IsValid())
        {
            UAIMoveSettings local_46;
            local_43 = local_46.ChainedStartEntryStartAngleThreshold;
        }
        if (local_32.IsNearlyZero(9.999999747378752e-5) || local_18.IsNearlyZero(9.999999747378752e-5) || !(this.ShouldStandTurn(local_32, local_18, local_43)))
        {
            return false;
        }
        float32 local_44 = this.GetChainedStartEntryLookAheadDistance(Entity, local_32, local_18);
        FVector local_54(FVector::ZeroVector);
        FVector local_60(FVector::ZeroVector);
        int local_61 = -1;
        if (!(this.FindChainedStartEntryJoin(PathSession, Entity, local_44, local_54, local_60, local_61)))
        {
            return false;
        }
        TArray<FVector> local_66;
        if (!(this.BuildChainedStartHermiteSamples(PathSession.PathPoints[0].Position, local_32, local_54, local_60, local_66)))
        {
            return false;
        }
        if (!(this.IsChainedStartSamplePathReachable(Entity, local_66)))
        {
            return false;
        }
        this.ReplaceChainedStartEntryPrefix(PathSession, local_66, local_61, OutPrefixEndIndex);
        this.DrawChainedStartEntryPath(Entity, local_66);
        return true;
    }
    UFUNCTION()
    void ServerJob_PathFollow_Start(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_AIMovePurpose &inout FollowPurpose) const
    {
        this.StartPathFollow(FixedTime, Entity, FollowPurpose, true);
        return;
    }
    bool ShouldAllowChainedStartEntryPrefixForRepath(const FECSEntity &inout Entity, const FC_AIPathFollowV2 &inout PathFollow, const FAIMovePurpose &inout FollowPurpose) const
    {
        UAIMoveSettings local_38;
        Has local_6;
        if (!(this.HasChainedChildEntity(Entity)) || !(local_6.opCall()))
        {
            return false;
        }
        float32 local_31 = float32(((FVector(FollowPurpose.MovePurposeParam.TargetLocation) - PathFollow.OriginalTargetLocation).Size2D()));
        float32 local_32 = 300.0f;
        float32 local_33 = 2.0f;
        float32 local_35 = 35.0f;
        if (UGameplayConfigsManager::GetAIMoveSettings().IsValid())
        {
            local_32 = local_38.ChainedStartEntryRepathTargetMoveDistance;
            local_35 = local_38.ChainedStartEntryRepathAngleThreshold;
        }
        if (local_31 > local_32)
        {
            return true;
        }
        Get local_44;
        const FC_AIPathSimulate& local_40 = local_44.opCall();
        if (local_40)
        {
            if (local_40.GetbStuck() || (local_40.GetOffsetDistanceToCurrentSegment() > (FECSAIUtils::GetEntityAgentRadius(Entity) * local_33)))
            {
                return true;
            }
            if (local_40.GetSimulateList().IsValidIndex(local_40.GetCurrentSimulateIndex()))
            {
                Get local_58;
                const FSimulateData& local_48 = local_40.GetSimulateList()[local_40.GetCurrentSimulateIndex()];
                if (local_48.GetbIsChainedStartEntryPrefix())
                {
                    return false;
                }
                FVector local_14 = local_58.opCall().GetRotation().GetForwardVector().GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                FVector local_20 = (FVector(local_48.GetTargetPoint()) - local_58.opCall().GetPosition());
                FVector local_64 = local_20.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                if (!(local_14.IsNearlyZero(9.999999747378752e-5)) && !(local_64.IsNearlyZero(9.999999747378752e-5)) && (float32(local_20.Size2D()) > 300.0f) && this.ShouldStandTurn(local_14, local_64, local_35))
                {
                    return true;
                }
                return false;
            }
            return false;
        }
        return false;
    }
    void StartPathFollow(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_AIMovePurpose &inout FollowPurpose, const bool bAllowChainedStartEntryPrefix) const
    {
        float32 local_123;
        Remove local_4;
        local_4.opCall();
        Has local_10;
        if (!(local_10.opCall()))
        {
            int local_11 = Entity.GetIdValue();
            ELog local_16;
            FString::Format("ServerJob_PathFollow_Start entity not has FC_Transform EntityID:{0}", local_16);
            return;
        }
        if (int(FollowPurpose.BestPurpose.PurposeID) == 0)
        {
            return;
        }
        FC_AIPathFollowV2 local_22;
        local_22.MovepurposeID = int(FollowPurpose.BestPurpose.PurposeID);
        local_22.bHasReach = false;
        local_22.PathFindState = EAIPathFindingState(0);
        Get local_114;
        local_22.StartLocation = local_114.opCall().GetPosition();
        local_22.StartDirection = local_114.opCall().GetRotation().GetForwardVector();
        local_22.OriginalTargetLocation = FollowPurpose.BestPurpose.MovePurposeParam.TargetLocation;
        local_22.OriginalTargetDirection = FollowPurpose.BestPurpose.MovePurposeParam.TargetDirection;
        local_22.TargetLocation = local_22.OriginalTargetLocation;
        local_22.TargetDirection = local_22.OriginalTargetDirection;
        if (FollowPurpose.BestPurpose.MovePurposeParam.AcceptanceRadius > 0.0f)
        {
            local_123 = FollowPurpose.BestPurpose.MovePurposeParam.AcceptanceRadius;
        }
        else
        {
            local_123 = 50.0f;
        }
        local_22.AcceptanceRadius = local_123;
        local_22.MoveStance = FollowPurpose.BestPurpose.MovePurposeParam.CommandSetMoveStance;
        local_22.MoveSimulateType = FollowPurpose.BestPurpose.MovePurposeParam.ForceMoveSimulateType;
        local_22.StopType = FollowPurpose.BestPurpose.MovePurposeParam.StopType;
        local_22.ForceGroundOrAir = FollowPurpose.BestPurpose.MovePurposeParam.MoveType;
        local_22.bAllowChainedStartEntryPrefix = bAllowChainedStartEntryPrefix;
        local_22.bTargetDirectionValid = FollowPurpose.BestPurpose.MovePurposeParam.bUseTargetDirection;
        local_22.bEcologyMove = FollowPurpose.BestPurpose.MovePurposeParam.bEcologyMove;
        local_22.OverrideProclivityConfig = TDataObjectPtr<FAIMoveProclivityConfig>(FollowPurpose.BestPurpose.MovePurposeParam.OverrideMoveProclivityConfig);
        local_22.bSendEcologyMovePathFindingEvent = FollowPurpose.BestPurpose.MovePurposeParam.bSendEcologyMovePathFindingEvent;
        local_22.EcologyMovePathFindingEventKey = FollowPurpose.BestPurpose.MovePurposeParam.EcologyMovePathFindingEventKey;
        local_22.RePathFindInterval = FollowPurpose.BestPurpose.MovePurposeParam.RePathFindInterval;
        local_22.NextRePathFindTime = (FFPTime(FixedTime.Time) + FFPTime(local_22.RePathFindInterval));
        this.Finding(Entity, local_22);
        return;
    }
    UFUNCTION()
    void ServerJob_PathFollow_UpdateFindingState(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_AIPathFollowV2 &inout PathFollow) const
    {
        int local_4 = PathFollow.PathSessionIndex;
        int local_2 = local_4;
        FAIPathSession& local_8 = FAIPathSessionUtils::GetSession(ECS::GetUEWorld(), local_2);
        if (int(local_8.State) == 3)
        {
            XWarning(ELog(14), FString::Format("PathSession Find Path async Failed EntityID:{0} StartPos {1}, EndPos {2}", Entity.GetIdValue(), PathFollow.StartLocation.ToString(), PathFollow.TargetLocation.ToString()));
            PathFollow.PathFindState = EAIPathFindingState(3);
            this.SendEcologyMovePathFindingEvent(Entity, PathFollow, false, local_8.PathPoints);
            return;
        }
        if (int(local_8.State) == 1)
        {
            XVerbose(ELog(14), FString::Format("PathSession Find Path async Active EntityID:{0} StartPos {1}, EndPos {2}", Entity.GetIdValue(), PathFollow.StartLocation.ToString(), PathFollow.TargetLocation.ToString()));
            if (CVar_AI_DebugAIPathFindResurlt.GetInt() == 1 || (CVar_AI_DebugAIPathFindResurlt.GetInt() == Entity.GetIdValue()))
            {
                this.DrawPathFindDebug(Entity, PathFollow, local_8);
            }
            FC_AIPathFinding_SucceedTag local_36;
            Assign local_34;
            local_34.opCall(local_36);
            PathFollow.PathFindState = EAIPathFindingState(2);
            PathFollow.TargetLocation = local_8.PathPoints.Last(0).Position;
            this.SendEcologyMovePathFindingEvent(Entity, PathFollow, true, local_8.PathPoints);
            return;
        }
        if (int(local_8.State) == 0)
        {
            XVerbose(ELog(14), FString::Format("PathSession Find Path In async EntityID:{0} StartPos {1}, EndPos {2}", Entity.GetIdValue(), PathFollow.StartLocation.ToString(), PathFollow.TargetLocation.ToString()));
            PathFollow.PathFindState = EAIPathFindingState(1);
        }
        return;
    }
    bool LogSessionSimulateStuck(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_AIPathFollowV2 &inout PathFollow, const FC_AIPathSimulate &inout C_Simulate) const
    {
        Get local_52;
        float32 local_61;
        int local_63;
        if (PathFollow.bHasSessionStuckDetailedLog && ((FFPTime(FixedTime.Time).opCmp((PathFollow.LastSessionStuckDetailedLogTime + FFPTime(30.0f))) < 0)))
        {
            return false;
        }
        Has local_20;
        if (!(local_20.opCall()) || !(C_Simulate.GetSimulateList().IsValidIndex(C_Simulate.GetCurrentSimulateIndex())))
        {
            return false;
        }
        PathFollow.bHasSessionStuckDetailedLog = true;
        PathFollow.LastSessionStuckDetailedLogTime = FixedTime.Time;
        FAIPathSession& local_22 = FAIPathSessionUtils::GetSession(ECS::GetUEWorld(), PathFollow.PathSessionIndex);
        const FSimulateData& local_28 = C_Simulate.GetSimulateList()[C_Simulate.GetCurrentSimulateIndex()];
        FVector local_42;
        if (local_22.PathPoints.Num() > 0)
        {
            local_42 = local_22.PathPoints.Last(0).Position;
        }
        else
        {
            local_42 = FVector::ZeroVector;
        }
        FVector local_34;
        if (C_Simulate.GetbSessionStuckSnapshotValid())
        {
            local_34 = C_Simulate.GetSessionStuckSnapshotPosition();
        }
        else
        {
            local_34 = local_52.opCall().GetPosition();
        }
        if (C_Simulate.GetbSessionStuckSnapshotValid())
        {
        }
        else
        {
        }
        if (C_Simulate.GetbSessionStuckSnapshotValid())
        {
            local_61 = C_Simulate.GetSessionStuckSnapshotElapsedTime();
        }
        else
        {
            local_61 = C_Simulate.GetStuckCheckElapsedTime();
        }
        if (C_Simulate.GetbSessionStuckSnapshotValid())
        {
            local_63 = C_Simulate.GetSessionStuckSnapshotSimulateIndex();
        }
        else
        {
            local_63 = C_Simulate.GetCurrentSimulateIndex();
        }
        if (C_Simulate.GetbSessionStuckSnapshotValid())
        {
        }
        else
        {
        }
        FVector local_76(FVector::ZeroVector);
        bool local_77 = false;
        Get local_84;
        const FC_Rigidbody& local_80 = local_84.opCall();
        if (local_80)
        {
            local_77 = true;
            local_76 = local_80.GetVelocity();
        }
        bool local_85 = false;
        int local_86 = 0;
        int local_87 = -1;
        FVector local_94(FVector::ZeroVector);
        bool local_95 = false;
        Get local_102;
        const FC_AIControlledMotion& local_98 = local_102.opCall();
        if (local_98)
        {
            local_85 = true;
            local_86 = local_98.GetPathPoints().Num();
            local_87 = local_98.GetReachedPoint().GetSimulateIndex();
            local_94 = local_98.GetMoveNextTarget();
            local_95 = local_98.GetbReachTarget();
        }
        bool local_103 = false;
        int local_104 = -1;
        int local_105 = -1;
        int local_106 = 0;
        float32 local_107 = 0.0f;
        float32 local_108 = 0.0f;
        float32 local_109 = 0.0f;
        Get local_116;
        const FC_AIRVOLocalCorridor& local_112 = local_116.opCall();
        if (local_112)
        {
            local_103 = local_112.bActive;
            local_104 = int(local_112.AnchorSimulateIndex);
            local_105 = int(local_112.CurrentPointIndex);
            local_106 = local_112.Points.Num();
            local_107 = local_112.ElapsedTime;
            local_108 = local_112.AllowedOffset;
            local_109 = local_112.HardRepathOffset;
        }
        bool local_14 = Entity.MatchGameplayTag(FGameplayTag::RequestGameplayTag(n"ESM.Ban.RePathFinding", true));
        bool local_15 = Entity.MatchGameplayTag(FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.FallCycle", true));
        int local_125 = Entity.GetIdValue();
        FString local_124 = FString();
        int local_62 = int(local_22.State);
        local_124 = (FString(local_124.Append("[SessionSimListStuck] EntityID=").Append(local_125).Append("\n")) + FString().Append("Session=").Append(PathFollow.PathSessionIndex).Append(" SessionState=").Append(local_62).Append("\n"));
        FString local_124_2 = (((local_124 + FString().Append("Purpose=").Append(PathFollow.MovepurposeID).Append(" Pos=").Append(local_52.opCall().GetPosition()).Append("\n")) + FString().Append("FollowStart=").Append(PathFollow.StartLocation).Append(" FollowTarget=").Append(PathFollow.TargetLocation).Append("\n")) + FString().Append("OriginalTarget=").Append(PathFollow.OriginalTargetLocation).Append(" SessionEnd=").Append(local_42).Append("\n"));
        int local_13 = C_Simulate.GetCurrentFollowPathIndex();
        int local_62_2 = local_22.PathPoints.Num();
        FString local_130_2 = (local_124_2 + FString().Append("PathPoints=").Append(local_62_2).Append(" FollowPathIndex=").Append(local_13).Append("\n"));
        int local_62_3 = C_Simulate.GetSimulateList().Num();
        int local_35 = C_Simulate.GetCurrentSimulateIndex();
        FString local_136_2 = (local_130_2 + FString().Append("SimIndex=").Append(local_35).Append("/").Append(local_62_3).Append("\n"));
        int local_62_4 = int(local_28.GetSimulateState());
        int local_13_2 = int(local_28.GetMoveType());
        FString local_124_3 = (local_136_2 + FString().Append("MoveType=").Append(local_13_2).Append(" SimState=").Append(local_62_4).Append("\n"));
        int local_62_5 = int(local_28.GetMoveSimulateType());
        int local_35_2 = int(local_28.GetMoveStance());
        FString local_130_3 = (local_124_3 + FString().Append("MoveStance=").Append(local_35_2).Append(" MoveSimType=").Append(local_62_5).Append("\n"));
        bool local_117 = local_28.GetbIsObstacleDetour();
        FString local_136_3 = (local_130_3 + FString().Append("Detour=").Append(local_117).Append(" SegmentTarget=").Append(local_28.GetTargetPoint()).Append("\n"));
        float32 local_59 = C_Simulate.GetOffsetDistanceToCurrentSegment();
        float local_8 = C_Simulate.GetDistanceToCurrentEnd();
        FString local_124_4 = (local_136_3 + FString().Append("DistanceToEnd=").Append(local_8).Append(" SegmentOffset=").Append(local_59).Append("\n"));
        bool local_117_2 = C_Simulate.GetbSessionStuckSnapshotValid();
        FString local_130_4 = (local_124_4 + FString().Append("SnapshotValid=").Append(local_117_2).Append(" SnapshotPos=").Append(local_34).Append("\n"));
        FVector local_70;
        FString local_136_4 = (local_130_4 + FString().Append("SnapshotSimIndex=").Append(local_63).Append(" SnapshotTarget=").Append(local_70).Append("\n"));
        FVector local_58;
        FString local_124_5 = (local_136_4 + FString().Append("SnapshotElapsed=").Append(local_61).Append(" SnapshotNetOffset=").Append(local_58).Append("\n"));
        bool local_120 = C_Simulate.GetbHasLastRequestedMoveInput();
        float local_8_2 = local_58.Size2D();
        FString local_130_5 = (local_124_5 + FString().Append("SnapshotNetOffset2D=").Append(local_8_2).Append(" InputValid=").Append(local_120).Append("\n"));
        int local_62_6 = int(C_Simulate.GetLastRequestedInputSpace());
        FString local_136_5 = (local_130_5 + FString().Append("Input=").Append(C_Simulate.GetLastRequestedMoveInput()).Append(" InputSpace=").Append(local_62_6).Append("\n"));
        int local_35_3 = int(C_Simulate.GetLastRequestedMoveSimulateType());
        FString local_124_6 = (local_136_5 + FString().Append("InputMoveSimType=").Append(local_35_3).Append("\n"));
        bool local_117_3 = C_Simulate.GetbLastRequestedUseAIControlledMotion();
        FString local_130_6 = (local_124_6 + FString().Append("InputControlledMotion=").Append(local_117_3).Append("\n"));
        float local_8_3 = local_76.Size2D();
        FString local_136_6 = (local_130_6 + FString().Append("HasRigidbody=").Append(local_77).Append(" Velocity=").Append(local_76).Append(" Speed2D=").Append(local_8_3).Append("\n"));
        FString local_124_7 = (local_136_6 + FString().Append("HasControlledMotion=").Append(local_85).Append(" ControlledPathPoints=").Append(local_86).Append("\n"));
        FString local_130_7 = (local_124_7 + FString().Append("ControlledReachedSimIndex=").Append(local_87).Append("\n"));
        FString local_136_7 = (local_130_7 + FString().Append("ControlledNextTarget=").Append(local_94).Append("\n"));
        FString local_124_8 = (local_136_7 + FString().Append("ControlledReachTarget=").Append(local_95).Append("\n"));
        FString local_130_8 = (local_124_8 + FString().Append("CorridorActive=").Append(local_103).Append(" CorridorAnchor=").Append(local_104).Append("\n"));
        FString local_136_8 = (local_130_8 + FString().Append("CorridorPoint=").Append(local_105).Append("/").Append(local_106).Append(" CorridorElapsed=").Append(local_107).Append("\n"));
        FString local_124_9 = (local_136_8 + FString().Append("CorridorAllowedOffset=").Append(local_108).Append(" CorridorHardRepathOffset=").Append(local_109).Append("\n"));
        bool local_120_2 = C_Simulate.GetbMovementStateMismatch();
        FString local_130_9 = (local_124_9 + FString().Append("MovementStateMismatch=").Append(local_120_2).Append("\n"));
        bool local_117_4 = C_Simulate.GetbSimulateGenerateCompleted();
        FString local_136_9 = (local_130_9 + FString().Append("BanRepath=").Append(local_14).Append(" FallCycle=").Append(local_15).Append(" GenerateCompleted=").Append(local_117_4).Append("\n"));
        bool local_117_5 = C_Simulate.GetbUpstairsTryFailed();
        bool local_120_3 = C_Simulate.GetbHasStuckUpstairs();
        int local_35_4 = C_Simulate.GetSyncedSimulateSourceIndex();
        FString local_124_10 = (local_136_9 + FString().Append("SyncedSourceIndex=").Append(local_35_4).Append(" UpstairsTried=").Append(local_120_3).Append(" UpstairsFailed=").Append(local_117_5));
        XWarning(ELog(14), local_124_10);
        return true;
    }
    bool IsNeedReFind(const FECSEntity &inout Entity, FC_AIPathFollowV2 &inout PathFollow, const FAIMovePurpose &inout FollowPurpose, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_5;
        bool local_18;
        Get local_64;
        PathFollow.bSessionStuckDetailedLogEmitted = false;
        bool local_2 = false;
        bool local_3 = false;
        bool local_4 = false;
        local_5 = false;
        bool local_6 = false;
        Get local_10;
        const FC_AIPathSimulate& local_12 = local_10.opCall();
        if (local_12)
        {
            float32 local_53;
            bool local_13;
            local_13 = false;
            if (local_12.GetSimulateList().IsValidIndex(local_12.GetCurrentSimulateIndex()))
            {
                EAISimulateMoveType local_15;
                local_15 = local_12.GetSimulateList()[local_12.GetCurrentSimulateIndex()].GetMoveType();
                local_6 = local_12.GetSimulateList()[local_12.GetCurrentSimulateIndex()].GetbIsChainedStartEntryPrefix();
                if ((int(local_15) == 5 || (int(local_15) == 9) || (int(local_15) == 6) || (int(local_15) == 7)) && !(local_12.GetbStuck()))
                {
                }
            }
            else
            {
                XVerbose(ELog(14), FString("AI Path ReFind Not In Simulate List"));
                return false;
            }
            if (Entity.MatchGameplayTag(FGameplayTag::RequestGameplayTag(n"ESM.Ban.RePathFinding", true)) || Entity.MatchGameplayTag(FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.FallCycle", true)))
            {
                local_13 = true;
            }
            if (!(local_13))
            {
                if (FollowPurpose.MovePurposeParam.bTrackingMovingTarget)
                {
                    local_2 = ((FVector(FollowPurpose.MovePurposeParam.TargetLocation) - PathFollow.TargetLocation).Size() > 300.0);
                }
                if (PathFollow.RePathFindInterval > 0.0f && (FFPTime(FixedTime.Time).opCmp(PathFollow.NextRePathFindTime) >= 0))
                {
                }
            }
            local_53 = local_12.GetOffsetDistanceToCurrentSegment();
            Get local_60;
            const FC_AIRVOLocalCorridor& local_56 = local_60.opCall();
            if (local_56)
            {
                if (local_56.bActive && (int(local_56.AnchorSimulateIndex) == local_12.GetCurrentSimulateIndex()) && local_12.GetSimulateList().IsValidIndex(local_12.GetCurrentSimulateIndex()))
                {
                    FVector local_44_2(local_64.opCall().GetPosition());
                    if (local_12.GetCurrentSimulateIndex() > 0 && local_12.GetSimulateList().IsValidIndex((local_12.GetCurrentSimulateIndex() - 1)))
                    {
                        local_44_2 = local_12.GetSimulateList()[(local_12.GetCurrentSimulateIndex() - 1)].GetTargetPoint();
                    }
                    FVector local_70(local_12.GetSimulateList()[local_12.GetCurrentSimulateIndex()].GetTargetPoint());
                    FVector local_76 = local_64.opCall().GetPosition();
                    local_44_2.Z = 0.0;
                    local_70.Z = 0.0;
                    local_76.Z = 0.0;
                    FVector local_38 = (local_70 - local_44_2);
                    local_48 = local_38.SizeSquared();
                    float32 local_49 = float32(local_48);
                    float32 local_84 = 0.0f;
                    if (local_49 < 0.0001f)
                    {
                        local_48 = (local_76 - local_70).Size();
                        local_84 = float32(local_48);
                    }
                    else
                    {
                        float32 local_83;
                        FVector local_32 = (local_76 - local_44_2);
                        local_48 = local_32.DotProduct(local_38);
                        local_83 = float32(local_48) / local_49;
                        local_48 = FMath::Clamp(local_83, 0.0f, 1.0f);
                        local_84 = float32(((local_76 - (local_44_2 + (local_38 * local_48))).Size()));
                    }
                    if (local_84 <= local_56.HardRepathOffset)
                    {
                        local_53 = 0.0f;
                    }
                    else
                    {
                        local_53 = local_84;
                    }
                }
            }
            if (local_6 && !(local_12.GetbStuck()))
            {
                local_53 = 0.0f;
                local_5 = false;
            }
            if (local_12.GetbStuck())
            {
                PathFollow.bSessionStuckDetailedLogEmitted = this.LogSessionSimulateStuck(FixedTime, Entity, PathFollow, local_12);
                local_3 = true;
            }
            else
            {
                if (!(local_13) && ((local_53 > (FECSAIUtils::GetEntityAgentRadius(Entity) * 1.5f))))
                {
                    if (CVar_AI_AutomaticRepairStuck.GetBool())
                    {
                        local_3 = true;
                    }
                    XVerbose(ELog(14), FString::Format("AI Path Need ReFind Path: EntityID:{0} StartPos {1}, EndPos {2} Offpath Distance:{3}", Entity.GetIdValue(), PathFollow.StartLocation.ToString(), PathFollow.TargetLocation.ToString(), local_53));
                }
            }
            if (!(local_13) && local_12.GetbMovementStateMismatch())
            {
                local_4 = true;
                Modify local_112;
                local_112.opCall().SetbMovementStateMismatch(false);
                XLog(ELog(14), FString::Format("AI Path ReFind due to MovementStateMismatch: EntityID:{0} Pos:{1}", Entity.GetIdValue(), PathFollow.StartLocation.ToString()));
            }
            if (local_2 || local_3 || (local_4 || (local_5 && CVar_AI_LogRePathByTimer.GetBool())))
            {
                int local_17_2 = local_12.GetSimulateList().Num();
                int local_14_2 = local_12.GetCurrentSimulateIndex();
                int local_103 = Entity.GetIdValue();
                FString local_22 = FString();
                float32 local_92_2 = local_12.GetOffsetDistanceToCurrentSegment();
                local_18 = local_12.GetbStuck();
                local_22 = (FString(local_22.Append("AI Path ReFind: EntityID=").Append(local_103).Append(" SimIndex=").Append(local_14_2).Append("/").Append(local_17_2).Append("\n")) + FString().Append("Stuck=").Append(local_18).Append(" SimulateInJam=").Append(local_3).Append(" OffpathDistance=").Append(local_92_2).Append("\n"));
                FString local_108 = (local_22 + FString().Append("MovementMismatch=").Append(local_4).Append(" TargetChangeTooFar=").Append(local_2).Append(" RePathByTimer=").Append(local_5).Append(" Pos=").Append(local_64.opCall().GetPosition()));
                XLog(ELog(14), local_108);
            }
        }
        bool local_113 = local_2 || local_3;
        local_18 = local_113 || local_4;
        return local_18 || local_5;
    }
    UFUNCTION()
    void ServerJob_PathFollow_Update(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_AIPathFollowV2 &inout PathFollow, FC_AIMovePurpose &inout FollowPurpose) const
    {
        if (int(FollowPurpose.BestPurpose.PurposeID) == 0)
        {
            this.PathFollow_Cleanup(Entity, PathFollow);
            FECSEntity::Remove<FC_AIPathFollowV2>(Entity).opCall();
            return;
        }
        if (int(PathFollow.MovepurposeID) != int(FollowPurpose.BestPurpose.PurposeID))
        {
            this.PathFollow_Cleanup(Entity, PathFollow);
            FString local_16 = PathFollow.StartLocation.ToString();
            XVerbose(ELog(14), FString::Format("AI Path Pathfollow : Purpose Change To Start New follow: EntityID:{0} PurposeID:{1} StartPos {2}, EndPos {3} ", Entity.GetIdValue(), local_16, local_16, PathFollow.TargetLocation.ToString()));
            this.StartPathFollow(FixedTime, Entity, FollowPurpose, true);
        }
        else
        {
            int local_26;
            int local_24;
            local_24 = int(FollowPurpose.BestPurpose.MovePurposeParam.CommandSetMoveStance);
            local_26 = int(FollowPurpose.BestPurpose.MovePurposeParam.ForceMoveSimulateType);
            if ((int(PathFollow.MoveStance) != local_24 || (int(PathFollow.MoveSimulateType) != local_26)))
            {
                PathFollow.MoveStance = ECharacterMoveStance(local_24);
                PathFollow.MoveSimulateType = EAIMoveSimulateType(local_26);
                Modify local_32;
                FC_AIPathSimulate local_34 = local_32.opCall();
                if (local_34)
                {
                    int local_35 = 0;
                    for (; local_35 < local_34.GetSimulateList().Num(); )
                    {
                        local_34.GetSimulateList()[local_35].SetMoveStance();
                        local_34.GetSimulateList()[local_35].SetMoveSimulateType();
                        ++local_35;
                    }
                }
            }
            if (!(PathFollow.bHasReached) && this.IsNeedReFind(Entity, PathFollow, FollowPurpose.BestPurpose, FixedTime))
            {
                int local_40;
                bool local_37;
                local_37 = false;
                int local_42 = PathFollow.PathSessionIndex;
                local_40 = local_42;
                FVector local_54 = PathFollow.TargetLocation;
                Get local_58;
                FC_AIPathSimulate local_34_2 = local_58.opCall();
                if (local_34_2)
                {
                    local_37 = local_34_2.GetbStuck();
                }
                bool local_28 = this.ShouldAllowChainedStartEntryPrefixForRepath(Entity, PathFollow, FollowPurpose.BestPurpose);
                this.PathFollow_Cleanup(Entity, PathFollow);
                this.StartPathFollow(FixedTime, Entity, FollowPurpose, local_28);
                if (local_37 && PathFollow.bSessionStuckDetailedLogEmitted)
                {
                    local_42 = PathFollow.PathSessionIndex;
                    FAIPathSession& local_62 = FAIPathSessionUtils::GetSession(ECS::GetUEWorld(), local_42);
                    int local_73 = local_62.PathPoints.Num();
                    FVector local_72;
                    if (local_62.PathPoints.Num() > 0)
                    {
                        local_72 = local_62.PathPoints.Last(0).Position;
                    }
                    else
                    {
                        local_72 = FVector::ZeroVector;
                    }
                    XWarning(ELog(14), FString().Append("[SessionSimListStuckRepath] EntityID=").Append(Entity.GetIdValue()).Append(" OldSession=").Append(local_40).Append(" OldStart=").Append(PathFollow.StartLocation).Append(" OldTarget=").Append(local_54).Append(" NewSession=").Append(PathFollow.PathSessionIndex).Append(" NewState=").Append(int(local_62.State)).Append(" NewStart=").Append(PathFollow.StartLocation).Append(" NewTarget=").Append(PathFollow.TargetLocation).Append(" NewSessionEnd=").Append(local_72).Append().Append().Append().Append());
                }
                if (int(PathFollow.PathFindState) == 1)
                {
                    return;
                }
            }
        }
        if (PathFollow.bHasReached && (int(FollowPurpose.BestPurpose.MovePurposeParam.StopType) == 0))
        {
            Assign local_96;
            Get local_82;
            if (int(FollowPurpose.BestPurpose.ListState) != 1)
            {
                XError(ELog(14), FString::Format("Best FollowPurpose Not in execution EntityID:{0}", Entity.GetIdValue()));
            }
            FollowPurpose.BestPurpose.State = true;
            const FC_ControlledByAI& local_84 = local_82.opCall();
            if (local_84)
            {
                FECSEntity local_92 = FECSEntity(local_84.GetControllerEntity());
                local_96.opCall(FC_BehaviorTreeNormalTickOnceTag());
            }
        }
        if (int(PathFollow.PathFindState) == 3)
        {
            Assign local_96;
            Get local_82;
            if (int(FollowPurpose.BestPurpose.ListState) != 1)
            {
                XError(ELog(14), FString::Format("Best FollowPurpose Not in execution EntityID:{0}", Entity.GetIdValue()));
            }
            FollowPurpose.BestPurpose.State = (2 != 0);
            const FC_ControlledByAI& local_84_2 = local_82.opCall();
            if (local_84_2)
            {
                FECSEntity local_88 = FECSEntity(local_84_2.GetControllerEntity());
                local_96.opCall(FC_BehaviorTreeNormalTickOnceTag());
            }
        }
        if (CVar_AI_DebugAIPathRuningPath.GetInt() == 1 || (CVar_AI_DebugAIPathRuningPath.GetInt() == Entity.GetIdValue()))
        {
            if (int(FollowPurpose.BestPurpose.ListState) == 1)
            {
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_PathFollow_UpdateSimulate(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_AIPathFollowV2 &inout PathFollow) const
    {
        bool local_1;
        int local_155;
        Get local_166;
        local_1 = false;
        bool local_3 = false;
        int local_4 = false;
        bool local_5 = false;
        int local_6 = 0;
        float32 local_8 = -1.0f;
        Has local_14;
        bool local_2 = local_14.opCall();
        if (local_2)
        {
            const FC_AIPathSimulate& local_16;
            if (local_16.GetSimulateList().Num() > local_16.GetCurrentSimulateIndex())
            {
                const FSimulateData& local_24 = local_16.GetSimulateList()[local_16.GetCurrentSimulateIndex()];
                if (((int(PathFollow.StopType) == 0 && local_16.GetbSimulateGenerateCompleted()) && (local_16.GetCurrentSimulateIndex() >= (local_16.GetSimulateList().Num() - 1))))
                {
                    local_5 = this.HasReach(Entity, PathFollow.TargetLocation, PathFollow.AcceptanceRadius);
                    if (local_5)
                    {
                        local_3 = true;
                        PathFollow.bHasReach = true;
                    }
                }
                if (!(local_3) && !(local_1))
                {
                    if (local_16.GetCurrentSimulateIndex() >= (local_16.GetSimulateList().Num() - 4))
                    {
                        local_1 = true;
                        local_6 = 1;
                    }
                    else
                    {
                        float32 local_29 = 0.0f + float32(local_16.GetDistanceToCurrentEnd());
                        int local_28 = local_16.GetCurrentSimulateIndex() + 1;
                        for (; local_28 < local_16.GetSimulateList().Num(); ++local_28)
                        {
                            const FSimulateData& local_36 = local_16.GetSimulateList()[local_28];
                            if (local_28 > 0)
                            {
                                local_29 = local_29 + (float32(((FVector(local_36.GetTargetPoint()) - local_16.GetSimulateList()[(local_28 - 1)].GetTargetPoint()).Size())));
                            }
                        }
                        local_8 = local_29;
                        if (local_29 < this.SimulatedMinDistance)
                        {
                        }
                    }
                }
            }
            else
            {
                if (local_16.GetbSimulateGenerateCompleted())
                {
                    local_3 = true;
                }
                else
                {
                    local_1 = true;
                }
                if (local_3 && (int(PathFollow.StopType) != 0))
                {
                }
            }
        }
        else
        {
            const FC_AIPathSimulate& local_16;
            local_16.SetbSimulateGenerateCompleted(false);
            local_1 = true;
            local_6 = 4;
        }
        if (local_3)
        {
            const FC_AIPathSimulate& local_16;
            if (!(local_5))
            {
                PathFollow.bHasReach = this.HasReach(Entity, PathFollow.TargetLocation, PathFollow.AcceptanceRadius);
            }
            Get local_20;
            local_16 = local_20.opCall();
            if (local_16)
            {
                if (local_16.GetbSimulateGenerateCompleted() && (local_16.GetCurrentSimulateIndex() >= local_16.GetSimulateList().Num()))
                {
                    if (!(PathFollow.bHasReach) && (CVar_AI_DebugSimulateFollowLog.GetInt() != 0))
                    {
                        Get local_132;
                        FVector local_48_2 = (PathFollow.TargetLocation - local_132.opCall().GetPosition());
                        XError(ELog(43), FString::Format("Simulate END bug Follow Test faild ,Follow Diff Vector {0}", local_48_2.ToString()));
                    }
                    PathFollow.bHasReach = true;
                }
            }
            bool local_2_4 = PathFollow.bHasReach || PathFollow.bHasReached;
            PathFollow.bHasReached = local_2_4;
        }
        bool local_26 = !(local_3);
        if (local_26 && local_1)
        {
            const FC_AIPathSimulate& local_16;
            Has local_162;
            int local_157;
            int local_156;
            if (!(local_16))
            {
                return;
            }
            FAIPathSession& local_152 = FAIPathSessionUtils::GetSession(ECS::GetUEWorld(), PathFollow.PathSessionIndex);
            int local_33_2 = System::GetConsoleVariableIntValue("AI.PathSimulateDebugObstacleDetour");
            bool local_26_2 = (local_33_2 == 1) || (local_33_2 == Entity.GetIdValue());
            int local_28_2 = local_16.GetSimulateList().Num();
            local_156 = local_16.GetCurrentSimulateIndex();
            local_157 = -1;
            bool local_153 = local_162.opCall();
            if (local_153)
            {
                local_157 = local_166.opCall().GetSimulateList().Num();
            }
            if (local_26_2)
            {
                local_155 = local_16.GetbSimulateGenerateCompleted() ? 1 : 0;
                XLog(ELog(14), FString().Append("[AIObstacleDetourDiag][FollowNeed] Entity=").Append(Entity.GetIdValue()).Append(" Reason=").Append(local_6).Append(" Current=").Append(local_156).Append(" SimNum=").Append(local_28_2).Append(" SyncNum=").Append(local_157).Append(" DistToEnd=").Append(local_8).Append(" MinDist=").Append(this.SimulatedMinDistance).Append(" GenerateCompleted=").Append(local_155).Append(" CurrentFollowPathIndex=").Append(local_16.GetCurrentFollowPathIndex()));
            }
            this.SimulatePathSegments(Entity, local_152, PathFollow, local_16, this.SimulatedRequestDistance);
            if (local_26_2)
            {
                local_155 = -1;
                bool local_153_2 = local_162.opCall();
                if (local_153_2)
                {
                    local_155 = local_166.opCall().GetSimulateList().Num();
                }
                XLog(ELog(14), FString().Append("[AIObstacleDetourDiag][FollowAfter] Entity=").Append(Entity.GetIdValue()).Append(" Reason=").Append(local_6).Append(" CurrentBefore=").Append(local_156).Append(" CurrentAfter=").Append(local_16.GetCurrentSimulateIndex()).Append(" SimNumBefore=").Append(local_28_2).Append(" SimNumAfter=").Append(local_16.GetSimulateList().Num()).Append(" SyncNumBefore=").Append(local_157).Append(" SyncNumAfter=").Append(local_155).Append(" CurrentFollowPathIndex=").Append(local_16.GetCurrentFollowPathIndex()));
            }
        }
        return;
    }
    bool HasReach(const FECSEntity &inout Entity, const FVector &inout TargetLocation, const float32 AcceptanceRadius) const
    {
        Get local_10;
        FVector local_6 = local_10.opCall().GetPosition();
        if (this.IsGroundPoint(Entity, TargetLocation))
        {
            if ((local_6 - TargetLocation).Size2D() <= AcceptanceRadius)
            {
                float32 local_29 = FECSAIUtils::GetEntityAgentHeight(FECSEntity(Entity.GetId()));
                if (FMath::Abs((local_6.Z - TargetLocation.Z)) < local_29)
                {
                    return true;
                }
            }
        }
        else
        {
            if ((local_6 - TargetLocation).Size() <= AcceptanceRadius)
            {
                return true;
            }
            return false;
        }
        return false;
    }
    void PathFollow_Cleanup(const FECSEntity &inout Entity, FC_AIPathFollowV2 &inout PathFollow) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            FAIPathSimulateMoveParam local_44;
            FAIInputUtils::SimulateMoveInputInSpace(Entity, local_44.MoveInput, local_44.InputSpace, local_44.MoveSimulateType, local_44.bHorizontalOnly);
            FAIInputUtils::SimulateViewInput(Entity, local_44.ViewInput);
            Remove local_50;
            local_50.opCall();
        }
        Has local_54;
        bool local_5_2 = local_54.opCall();
        if (local_5_2)
        {
            Remove local_58;
            local_58.opCall();
        }
        int local_59 = Entity.GetIdValue();
        ELog local_64;
        FString::Format("PathFollow_Cleanup EntityID:{0} Input cleared", local_64);
        Has local_70;
        bool local_5_3 = local_70.opCall();
        if (local_5_3)
        {
            Remove local_74;
            local_74.opCall();
        }
        Has local_78;
        bool local_5_4 = local_78.opCall();
        if (local_5_4)
        {
            Remove local_82;
            local_82.opCall();
        }
        Has local_86;
        bool local_5_5 = local_86.opCall();
        if (local_5_5)
        {
            Remove local_90;
            local_90.opCall();
        }
        Has local_94;
        bool local_5_6 = local_94.opCall();
        if (local_5_6)
        {
            Remove local_98;
            local_98.opCall();
        }
        PathFollow.Initialize();
        return;
    }
    void SimulatePathSegments(const FECSEntity &inout Entity, FAIPathSession &inout ActiveSession, const FC_AIPathFollowV2 &inout PathFollow, FC_AIPathSimulate &inout C_AIPathSimulate, const float32 RequestDistance) const
    {
        int local_4;
        Get local_100;
        bool local_101;
        bool local_102;
        int local_1 = 10;
        local_4 = -1;
        if (int(ActiveSession.State) == 1)
        {
            bool local_15;
            int local_14;
            int local_13;
            TArray<FSimulateData> local_12;
            local_12.Empty(0);
            local_13 = C_AIPathSimulate.GetCurrentFollowPathIndex();
            int local_2 = C_AIPathSimulate.GetCurrentFollowPathIndex();
            local_14 = local_2;
            local_15 = false;
            bool local_7 = local_13 < 0 || ((local_13 >= ActiveSession.PathPoints.Num()));
            if (local_7)
            {
                return;
            }
            int local_6 = FAIPathSessionUtils::FindFirstCorridorPointInRange(ActiveSession, local_13, local_1);
            if (local_6 > 0)
            {
                int local_17 = local_6 - 1;
                if (FAIPathSessionUtils::ExpandAndSmoothCorridorSegment(ECS::GetUEWorld(), ActiveSession, local_17, 4) < 0)
                {
                    XWarning(ELog(14), FString::Format("SimulatePathSegments: ExpandAndSmoothCorridorSegment failed, SessionID:{0}", ActiveSession.GetSessionID()));
                    local_17 = ActiveSession.PathPoints.Num();
                    local_17 = local_17 - 1;
                    local_2 = local_13 + local_1;
                    local_2 = local_2 - 1;
                    local_4 = FMath::Min(local_2, local_17);
                }
            }
            else
            {
                local_2 = ActiveSession.PathPoints.Num() - 1;
                local_4 = FMath::Min(((local_13 + local_1) - 1), local_2);
            }
            int local_29 = -1;
            bool local_16 = local_13 == 0 && PathFollow.bAllowChainedStartEntryPrefix && !(C_AIPathSimulate.GetbChainedStartEntryPrefixTried());
            if (local_16)
            {
                C_AIPathSimulate.SetbChainedStartEntryPrefixTried(true);
                if (this.TryApplyChainedStartEntryPrefix(Entity, ActiveSession, PathFollow, local_29))
                {
                    local_15 = true;
                    C_AIPathSimulate.GetSimulateList().Empty(0);
                    C_AIPathSimulate.SetSyncedSimulateSourceIndex(0);
                    C_AIPathSimulate.SetCurrentSimulateIndex(0);
                    C_AIPathSimulate.SetChainedStartEntryPrefixEndIndex(-1);
                    Has local_34;
                    local_7 = local_34.opCall();
                    if (local_7)
                    {
                        Modify local_38;
                        local_38.opCall().GetSimulateList().Empty(0);
                    }
                    local_7 = FECSEntity::Has<FC_AIControlledMotion>(Entity).opCall();
                    if (local_7)
                    {
                        Remove local_46;
                        local_46.opCall();
                    }
                    local_4 = FMath::Max(local_4, local_29);
                }
                else
                {
                    C_AIPathSimulate.SetChainedStartEntryPrefixEndIndex(-1);
                }
            }
            float32 local_47 = 0.0f;
            FPathSessionPoint& local_50 = ActiveSession.PathPoints[local_13];
            int local_51 = local_13;
            if (local_13 == 0)
            {
                FSimulateData local_92 = FSimulateData(PathFollow, ActiveSession.PathPoints[local_51].Position, EAISimulateMoveType(EAISimulateMoveType(0)));
                local_12.Add(local_92);
                const FC_AIStandTurnConfig& local_96 = local_100.opCall();
                if (local_96)
                {
                    if (ActiveSession.PathPoints[0].bIsNavLinkStart)
                    {
                        local_16 = true;
                    }
                    else
                    {
                        if (ActiveSession.PathPoints.Num() <= 1)
                        {
                            local_7 = false;
                        }
                        else
                        {
                            local_7 = ActiveSession.PathPoints[1].bIsNavLinkStart;
                        }
                        local_16 = local_7;
                    }
                    local_102 = local_96.bEnableStartTurn && (ActiveSession.PathPoints.Num() > 1);
                    if ((local_102 && this.IsGroundPoint(Entity, ActiveSession.PathPoints[0].Position)) && !(local_16))
                    {
                        FVector local_120 = (FVector(ActiveSession.PathPoints[1].Position) - ActiveSession.PathPoints[0].Position);
                        if (this.ShouldStandTurn(PathFollow.StartDirection, local_120, local_96.StartTurnAngleThreshold))
                        {
                            FSimulateData local_158 = this.MakeStandTurnSegment(PathFollow, local_120, ActiveSession.PathPoints[0].Position);
                            local_12.Add(local_158);
                        }
                    }
                }
            }
            int local_28_2 = local_13 + 1;
            while (local_28_2 < local_2)
            {
                this.PathPostProcessing();
                FPathSessionPoint& local_54 = ActiveSession.PathPoints[local_51];
                FPathSessionPoint& local_162 = ActiveSession.PathPoints[local_28_2];
                local_2 = ActiveSession.PathPoints.Num();
                local_2 = local_2 - 1;
                local_101 = (local_28_2 == local_2);
                if (this.IsNeedAutoGroundToAir(Entity, local_54, local_162))
                {
                    FSimulateData local_92_2 = FSimulateData(PathFollow, local_162.Position, EAISimulateMoveType(EAISimulateMoveType(6)));
                    local_12.Add(local_92_2);
                    FSimulateData local_158_2 = this.SimulatePathSegments_NomalSegment(local_54, local_162, PathFollow);
                    this.MarkChainedStartEntryPrefixSegmentIfNeeded(local_158_2, local_28_2, local_29);
                    local_12.Add(local_158_2);
                    local_47 = local_47 + float32(((FVector(local_162.Position) - local_54.Position).Size()));
                    local_51 = local_28_2;
                    ++local_28_2;
                }
                else
                {
                    if (local_101 && this.IsGroundPoint(Entity, local_162.Position) && PathFollow.bTargetDirectionValid)
                    {
                        FSimulateData local_200 = this.SimulatePathSegments_NomalSegment(local_54, local_162, PathFollow);
                        this.MarkChainedStartEntryPrefixSegmentIfNeeded(local_200, local_28_2, local_29);
                        local_12.Add(local_200);
                        FVector local_120_2 = (FVector(local_54.Position) - local_162.Position);
                        local_47 = local_47 + float32(local_120_2.Size2D());
                        local_51 = local_28_2;
                        const FC_AIStandTurnConfig& local_96_2 = local_100.opCall();
                        if (local_96_2)
                        {
                            FVector local_114 = (FVector(local_162.Position) - local_54.Position);
                            if (local_96_2.bEnableEndTurn && this.ShouldStandTurn(local_114, PathFollow.TargetDirection, local_96_2.EndTurnAngleThreshold))
                            {
                                FSimulateData local_92_3 = this.MakeStandTurnSegment(PathFollow, PathFollow.TargetDirection, local_162.Position);
                                local_12.Add(local_92_3);
                            }
                        }
                        ++local_28_2;
                    }
                    else
                    {
                        local_102 = int(local_54.SegmentType) == 1 || (int(local_54.SegmentType) == 0);
                        if (!(local_102 && (int(local_162.SegmentType) == 1)))
                        {
                            local_102 = false;
                        }
                        else
                        {
                            local_102 = local_162.bIsNavLinkStart;
                        }
                        if (local_102 && (((local_28_2 + 1) < ActiveSession.PathPoints.Num())))
                        {
                            local_2 = local_28_2 + 1;
                            FVector local_208 = FVector(ActiveSession.PathPoints[local_2].Position);
                            FVector local_108 = (local_208 - local_162.Position);
                            local_208 = FVector(local_162.Position);
                            FVector local_120_3 = (local_208 - local_54.Position);
                            if (local_120_3.Size() < 500.0)
                            {
                                FPathSessionPoint& local_214 = ActiveSession.PathPoints[local_28_2 + 1];
                                FSimulateData local_158_3 = FSimulateData(PathFollow, local_214.Position, EAISimulateMoveType(EAISimulateMoveType(5)));
                                local_158_3.SetTurnTargetDirection(local_108);
                                local_208 = FVector(local_162.Position);
                                Get local_218;
                                FVector local_224 = (local_208 + FVector::UpVector.opMul_r(local_218.opCall().GetScaledHalfHeight()));
                                local_158_3.SetJumpSorptionTargetLocation(local_224);
                                local_12.Add(local_158_3);
                                local_51 = local_28_2 + 1;
                                local_28_2 = local_28_2 + 2;
                                if (CVar_AI_DebugAIPathRuningPath.GetInt() == 1 || (CVar_AI_DebugAIPathRuningPath.GetInt() == Entity.GetIdValue()))
                                {
                                    FString local_26 = local_214.Position.ToString();
                                    ELog local_230;
                                    FString::Format("SimulatePathSegments: Jump, JumpTargetPoint:{0}", local_230);
                                    DebugDraw::DrawDebugSphere(this.GetWorld(), local_54.Position, 15.0f, 8, FColor::Green, false, 5.0f, uint8(0), 0.0f);
                                    DebugDraw::DrawDebugSphere(this.GetWorld(), local_158_3.GetJumpSorptionTargetLocation(), 15.0f, 8, FColor::Blue, false, 5.0f, uint8(0), 0.0f);
                                    local_208 = FVector(local_162.Position);
                                    local_120_3 = (local_108.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 150.0);
                                    local_224 = (local_208 + local_120_3);
                                    DebugDraw::DrawDebugDirectionalArrow(this.GetWorld(), local_162.Position, local_224, 40.0f, FColor::Blue, false, 5.0f, uint8(0), 0.0f);
                                }
                            }
                            else
                            {
                                FSimulateData local_92_4 = this.SimulatePathSegments_NomalSegment(local_54, local_162, PathFollow);
                                this.MarkChainedStartEntryPrefixSegmentIfNeeded(local_92_4, local_28_2, local_29);
                                local_12.Add(local_92_4);
                                if (!(local_101))
                                {
                                    const FC_AIStandTurnConfig& local_96_3 = local_100.opCall();
                                    if (local_96_3)
                                    {
                                        if (local_96_3.bEnableJumpStartTurn)
                                        {
                                            local_208 = FVector(local_162.Position);
                                            local_120_3 = (local_208 - local_54.Position);
                                            if (this.ShouldStandTurn(local_120_3, local_108, local_96_3.JumpStartTurnAngleThreshold))
                                            {
                                                if (CVar_AI_DebugAIPathRuningPath.GetInt() == 1 || (CVar_AI_DebugAIPathRuningPath.GetInt() == Entity.GetIdValue()))
                                                {
                                                    DebugDraw::DrawDebugSphere(this.GetWorld(), local_54.Position, 15.0f, 8, FColor::Blue, false, 5.0f, uint8(0), 0.0f);
                                                    DebugDraw::DrawDebugSphere(this.GetWorld(), local_162.Position, 15.0f, 8, FColor::Black, false, 5.0f, uint8(0), 0.0f);
                                                    DebugDraw::DrawDebugSphere(this.GetWorld(), ActiveSession.PathPoints[(local_28_2 + 1)].Position, 15.0f, 8, FColor::White, false, 5.0f, uint8(0), 0.0f);
                                                    FVector local_114_2 = FVector(local_162.Position);
                                                    local_208 = (local_108.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 150.0);
                                                    FVector local_224_2 = (local_114_2 + local_208);
                                                    DebugDraw::DrawDebugDirectionalArrow(this.GetWorld(), local_162.Position, local_224_2, 80.0f, FColor::Yellow, false, 5.0f, uint8(0), 0.0f);
                                                }
                                                FSimulateData local_200_2 = this.MakeStandTurnSegment(PathFollow, local_108, local_162.Position);
                                                local_12.Add(local_200_2);
                                            }
                                        }
                                    }
                                }
                                local_51 = local_28_2;
                                ++local_28_2;
                            }
                        }
                        else
                        {
                            FSimulateData local_200_3 = this.SimulatePathSegments_NomalSegment(local_54, local_162, PathFollow);
                            this.MarkChainedStartEntryPrefixSegmentIfNeeded(local_200_3, local_28_2, local_29);
                            local_12.Add(local_200_3);
                            local_102 = int(local_162.SegmentType) == 1 || (int(local_162.SegmentType) == 5);
                            if (int(local_162.SegmentType) == 0)
                            {
                                local_102 = this.IsGroundPoint(Entity, local_162.Position);
                            }
                            if (!(local_101) && local_102)
                            {
                                const FC_AIStandTurnConfig& local_96_4 = local_100.opCall();
                                if (local_96_4)
                                {
                                    if (local_96_4.bEnableMidPathTurn && ((local_28_2 + 1) < ActiveSession.PathPoints.Num()))
                                    {
                                        FVector local_208_2 = FVector(local_162.Position);
                                        FVector local_240 = (local_208_2 - local_54.Position);
                                        local_2 = local_28_2 + 1;
                                        FVector local_224_3(ActiveSession.PathPoints[local_2].Position);
                                        local_208_2 = (local_224_3 - local_162.Position);
                                        if (this.ShouldStandTurn(local_240, local_208_2, local_96_4.MidPathTurnAngleThreshold))
                                        {
                                            FSimulateData local_158_4 = this.MakeStandTurnSegment(PathFollow, local_208_2, local_162.Position);
                                            local_12.Add(local_158_4);
                                        }
                                    }
                                }
                            }
                            FVector local_224_4(local_54.Position);
                            local_47 = local_47 + (float32(((local_224_4 - local_162.Position).Size2D())));
                            local_51 = local_28_2;
                            ++local_28_2;
                        }
                    }
                }
                if (local_51 >= local_4)
                {
                    break;
                }
            }
            local_14 = local_51;
            local_2 = ActiveSession.PathPoints.Num() - 1;
            if (local_14 == local_2)
            {
                if (int(PathFollow.StopType) == 2)
                {
                    local_102 = false;
                    if (local_12.Num() > 0 && (int(local_12.Last(0).GetMoveType()) == 3))
                    {
                        local_102 = true;
                    }
                    if ((!(local_102) && (C_AIPathSimulate.GetSimulateList().Num() > 0)) && (int(C_AIPathSimulate.GetSimulateList().Last(0).GetMoveType()) == 3))
                    {
                        local_102 = true;
                    }
                    if (!(local_102))
                    {
                        FSimulateData local_200_4 = FSimulateData(PathFollow);
                        local_200_4.SetMoveType(EAISimulateMoveType(EAISimulateMoveType(3)));
                        local_12.Add(local_200_4);
                    }
                }
                if (int(PathFollow.StopType) == 1)
                {
                    local_102 = false;
                    if (local_12.Num() > 0 && (int(local_12.Last(0).GetMoveType()) == 4))
                    {
                        local_102 = true;
                    }
                    if ((!(local_102) && (C_AIPathSimulate.GetSimulateList().Num() > 0)) && (int(C_AIPathSimulate.GetSimulateList().Last(0).GetMoveType()) == 4))
                    {
                        local_102 = true;
                    }
                    if (!(local_102))
                    {
                        FSimulateData local_92_5 = FSimulateData(PathFollow);
                        local_92_5.SetTargetPoint(PathFollow.TargetLocation);
                        local_92_5.SetMoveType(EAISimulateMoveType(EAISimulateMoveType(4)));
                        local_12.Add(local_92_5);
                    }
                }
            }
            local_2 = ActiveSession.PathPoints.Num() - 1;
            C_AIPathSimulate.SetbSimulateGenerateCompleted((local_14 >= local_2));
            C_AIPathSimulate.SetCurrentFollowPathIndex(local_14);
            if (local_12.Num() > 0)
            {
                if (local_15)
                {
                    int local_234 = C_AIPathSimulate.GetSimulateList().Num();
                    C_AIPathSimulate.SetChainedStartEntryPrefixEndIndex(-1);
                    int local_243 = 0;
                    for (; local_243 < local_12.Num(); ++local_243)
                    {
                        if (local_12[local_243].GetbIsChainedStartEntryPrefix())
                        {
                            C_AIPathSimulate.SetChainedStartEntryPrefixEndIndex(local_234 + local_243);
                        }
                    }
                }
                ModifyOrAdd local_248;
                local_248.opCall().GetSimulateList().Append(local_12);
            }
            return;
        }
        XError(ELog(14), FString::Format("GetPathSegmentsFromIndex Session not Active SessionID:{0}", ActiveSession.GetSessionID()));
        return;
    }
    FSimulateData SimulatePathSegments_NomalSegment(const FPathSessionPoint &inout CurrentPoint, const FPathSessionPoint &inout NextPoint, const FC_AIPathFollowV2 &inout PathFollow) const
    {
        int local_2 = 1;
        int local_1 = local_2;
        FSimulateData local_40 = FSimulateData(PathFollow);
        if (int(NextPoint.SegmentType) == 3)
        {
            int local_2_2 = 6;
            local_1 = local_2_2;
        }
        else
        {
            if (int(NextPoint.SegmentType) == 4)
            {
                int local_2_3 = 7;
                local_1 = local_2_3;
            }
            else
            {
                if (!(int(NextPoint.SegmentType) != 1) && CurrentPoint.bIsNavLinkStart)
                {
                    int local_2_4 = 5;
                    local_1 = local_2_4;
                    local_40.SetTurnTargetDirection((FVector(NextPoint.Position) - CurrentPoint.Position).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
                }
                else
                {
                    if (int(NextPoint.SegmentType) == 1)
                    {
                        int local_2_5 = 1;
                        local_1 = local_2_5;
                    }
                    else
                    {
                        if (int(NextPoint.SegmentType) == 2 && (int(NextPoint.Layer) == 64))
                        {
                            int local_2_6 = 2;
                            local_1 = local_2_6;
                        }
                        else
                        {
                            if (int(NextPoint.SegmentType) == 2)
                            {
                                int local_2_7 = 2;
                                local_1 = local_2_7;
                            }
                        }
                    }
                }
            }
        }
        local_40.SetTargetPoint(NextPoint.Position);
        local_40.SetMoveType(EAISimulateMoveType(local_1));
        return local_40;
    }
    void PathPostProcessing() const
    {
        return;
    }
    bool IsGroundPoint(const FECSEntity &inout Entity, const FVector &inout Pos) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    bool IsGroundSegment(const EPathSegmentType Type) const
    {
        if ((int(Type) == 1 || (int(Type) == 5)))
        {
            return true;
        }
        return false;
    }
    bool IsNeedAutoGroundToAir(const FECSEntity &inout Entity, const FPathSessionPoint &inout CurrentSessionPoint, const FPathSessionPoint &inout NextSessionPoint) const
    {
        bool local_5 = (int(CurrentSessionPoint.SegmentType) == 1) || (int(CurrentSessionPoint.SegmentType) == 5);
        if (int(CurrentSessionPoint.SegmentType) == 0)
        {
            local_5 = this.IsGroundPoint(Entity, CurrentSessionPoint.Position);
        }
        bool local_6 = (int(NextSessionPoint.SegmentType) == 2);
        return (local_5 && local_6);
    }
    bool ShouldStandTurn(const FVector &inout CurrentDir, const FVector &inout TargetDir, const float32 AngleThresholdDeg) const
    {
        FVector local_26 = FVector(CurrentDir.X, CurrentDir.Y, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_6 = FVector(TargetDir.X, TargetDir.Y, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        if (local_26.IsNearlyZero(9.999999747378752e-5) || local_6.IsNearlyZero(9.999999747378752e-5))
        {
            return false;
        }
        float32 local_37 = FMath::Cos(FMath::DegreesToRadians(AngleThresholdDeg));
        return (float32(local_26.DotProduct(local_6)) < local_37);
    }
    FSimulateData MakeStandTurnSegment(const FC_AIPathFollowV2 &inout PathFollow, const FVector &inout TurnTargetDirection, const FVector &inout InTargetPoint) const
    {
        FSimulateData local_38 = FSimulateData(PathFollow);
        local_38.SetMoveType(EAISimulateMoveType(9));
        local_38.SetTurnTargetDirection(TurnTargetDirection.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
        local_38.SetTargetPoint(InTargetPoint);
        return local_38;
    }
    UFUNCTION()
    void Run_ServerJob_PathFollow_Start() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_174 = 0;
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
                this.ServerJob_PathFollow_Start(local_6, local_40, local_42);
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
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_PathFollow_Start(local_6, local_174, local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PathFollow_UpdateFindingState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
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
                this.ServerJob_PathFollow_UpdateFindingState(local_6, local_40, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_PathFollow_UpdateFindingState(local_6, local_174, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PathFollow_Update() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_184 = 0;
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
                this.ServerJob_PathFollow_Update(local_6, local_40, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_AIPathFollowV2> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_98.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_PathFollow_Update(local_6, local_184, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_AIPathFollowV2>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PathFollow_UpdateSimulate() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_182 = 0;
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
                this.ServerJob_PathFollow_UpdateSimulate(local_6, local_40, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_88.Iterator();
        for (; local_144.CanProceed;)
        {
            local_40 = local_144.Proceed();
            ++local_110;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_PathFollow_UpdateSimulate(local_6, local_182, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

