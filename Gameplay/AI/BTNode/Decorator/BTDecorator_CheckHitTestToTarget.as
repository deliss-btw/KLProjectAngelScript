
const FConsoleVariable CVar_AI_CheckHitTestToTarget_DebugEntity = FConsoleVariable();

class UBTDecorator_CheckHitTestToTarget : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetEntity = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
    UPROPERTY()
    TDataObjectPtr<FAIHitTestConfig> TestBox;
    UPROPERTY()
    float32 DebugDrawDuration = 2.0f;
    UPROPERTY()
    float32 DebugDrawThickness = 2.0f;

    default SetNodeName("HitTestеЏЇе‘Ѕдё­з›®ж ‡");


    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        return this.EvaluateCondition(Context);
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        FString local_4 = "None";
        if ((!((this.TestBox == nullptr))))
        {
            FString local_58 = FString();
        }
        return ((FString(FString().Append("\n\n  Target: ").Append(this.TargetEntity)) + FString().Append("\n  TestBox: ").Append(this.TestBox)) + FString().Append("\n  BoxSize: ").Append(local_4));
    }
    bool EvaluateCondition(const FAIBehaviorTreeContext &inout Context) const
    {
        int local_16 = 0;
        int local_24 = 0;
        int local_26 = 0;
        FECSEntity local_12 = FECSEntity(this.TargetEntity.GetValue(Context.opImplConv()));
        if (!(local_12.IsValid()))
        {
            return false;
        }
        bool local_13 = this.ShouldDebugDraw(local_16);
        if (!(local_24) || !(local_26))
        {
            return false;
        }
        FVector local_40 = this.GetHalfBoxSize();
        if (local_40.X <= 0.0 || (local_40.Y <= 0.0) || (local_40.Z <= 0.0))
        {
            return false;
        }
        FVector local_50 = local_24.GetPosition();
        local_50.Z -= (FCollisionUtils::GetCollisionHeight(local_16) * 0.5f);
        FVector local_58 = local_26.GetPosition();
        local_58.Z -= (FCollisionUtils::GetCollisionHeight(local_12) * 0.5f);
        FVector local_64;
        if (!(FAINavigationUtils::NavigationRayCast(local_16, local_50, local_58, local_64)))
        {
            if (local_13)
            {
                this.DrawDebugNavigationRay(local_50, local_58, FColor::Green);
            }
            return true;
        }
        float32 local_51_2 = FCollisionUtils::GetCollisionRadius(local_16);
        float local_44_3 = local_64.DistSquaredXY(local_58);
        float32 local_52_2 = local_51_2 * local_51_2;
        if (local_44_3 <= local_52_2 && (FMath::Abs((local_64.Z - local_58.Z)) <= local_40.Z))
        {
            if (local_13)
            {
                this.DrawDebugNavigationRay(local_50, local_64, FColor::Green);
            }
            return true;
        }
        FVector local_82 = (local_58 - local_64).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
        if (local_82.IsNearlyZero(9.999999747378752e-5))
        {
            return false;
        }
        FVector local_76_2 = ((local_64 + (local_82 * local_51_2)) + (local_82 * local_40.X));
        FVector local_88_2 = FVector::UpVector.CrossProduct(local_82);
        FQuat local_116 = local_82.ToOrientationQuat();
        FOrientedBox3f local_136 = this.BuildHitTestOrientedBox(local_76_2, local_82, local_88_2, local_40);
        FBox local_150;
        bool local_151 = false;
        bool local_152 = false;
        Get local_156;
        const FC_HitBoxConfig& local_158 = local_156.opCall();
        if (local_158)
        {
            FBox3f local_243 = this.GetTargetLocalHitBoxAABB(local_12, local_158).TransformBy(FTransform3f(this.BuildWorldTransformWithScale(local_12, local_26)));
            local_150 = FBox(local_243);
            local_151 = true;
            local_152 = local_136.Intersects(local_243, 0.0f);
        }
        else
        {
            local_152 = local_136.Contains(FVector3f(local_58));
        }
        if (local_13)
        {
            this.DrawDebugHitTest(local_50, local_64, local_76_2, local_40, local_116, local_58, local_150, local_151, local_152);
        }
        return local_152;
    }
    FVector GetHalfBoxSize() const
    {
        if ((this.TestBox == nullptr))
        {
            return FVector::ZeroVector;
        }
        FVector local_62;
        return FVector(FMath::Abs(local_62.X) * 0.5, (FMath::Abs(local_62.Y) * 0.5), (FMath::Abs(local_62.Z) * 0.5));
    }
    FOrientedBox3f BuildHitTestOrientedBox(const FVector &inout BoxCenter, const FVector &inout TestDirection, const FVector &inout TestRight, const FVector &inout HalfBoxSize) const
    {
        return FOrientedBox3f(FVector3f(BoxCenter), FVector3f(TestDirection), FVector3f(TestRight), FVector3f(FVector::UpVector), FVector3f(HalfBoxSize));
    }
    FTransform BuildWorldTransformWithScale(const FECSEntity &inout Entity, const FC_Transform &inout Transform) const
    {
        Get local_4;
        const FC_Scale& local_6 = local_4.opCall();
        if (local_6)
        {
            return Transform.ToFTransformWitScale(local_6.Scale);
        }
        return Transform.ToFTransform();
    }
    FBox3f GetTargetLocalHitBoxAABB(const FECSEntity &inout TargetECSEntity, const FC_HitBoxConfig &inout HitBox) const
    {
        Get local_4;
        const FC_AnimStateHistory& local_6 = local_4.opCall();
        if (local_6)
        {
            FC_AnimState local_248;
            FBox3f local_255;
            if (local_6.GetInterpoValue(ECS::GetContextTime(), local_248) && this.TryGetAnimHitBoxAABB(local_248, HitBox, local_255))
            {
                return local_255;
            }
        }
        Get local_264;
        const FC_AnimState& local_266 = local_264.opCall();
        if (local_266)
        {
            FBox3f local_255;
            if (this.TryGetAnimHitBoxAABB(local_266, HitBox, local_255))
            {
                return local_255;
            }
        }
        return HitBox.HitBoxBoundingBox;
    }
    bool TryGetAnimHitBoxAABB(const FC_AnimState &inout AnimState, const FC_HitBoxConfig &inout HitBox, FBox3f &inout OutBox) const
    {
        const FESMAnimState& local_8;
        bool local_1 = false;
        int local_3 = 0;
        for (; local_3 < AnimState.GetLayerNum(); ++local_3)
        {
            FName local_16 = (!((local_8.GetOverrideAnimKey() == NAME_None))) ? local_8.GetOverrideAnimKey() : local_8.GetTransitionToAnimKey();
            if ((local_16 == NAME_None) || !(HitBox.AnimBoxExtents.Contains(local_16)))
            {
                continue;
            }
            if (local_1)
            {
                OutBox += HitBox.AnimBoxExtents[local_16];
                continue;
            }
            OutBox = HitBox.AnimBoxExtents[local_16];
            local_1 = true;
        }
        return local_1;
    }
    bool ShouldDebugDraw(const FECSEntity &inout PawnEntity) const
    {
        int local_4;
        bool local_6;
        int local_2 = CVar_AI_CheckHitTestToTarget_DebugEntity.GetInt();
        if (local_2 == -1)
        {
            local_6 = true;
        }
        else
        {
            if (local_2 == 0)
            {
                local_4 = 0;
            }
            else
            {
                local_6 = (local_2 == PawnEntity.GetIdValue());
                local_4 = local_6;
            }
            local_6 = (local_4 != 0);
        }
        return local_6;
    }
    void DrawDebugNavigationRay(const FVector &inout OriginLocation, const FVector &inout EndLocation, const FColor &inout Color) const
    {
        FECSDebugDraw::DrawDebugLine(n"CheckHitTestToTarget", OriginLocation, EndLocation, Color, Color, this.DebugDrawDuration, uint8(0), int(this.DebugDrawThickness));
        FECSDebugDraw::DrawDebugPoint(n"CheckHitTestToTarget", EndLocation, 12.0f, Color, Color, this.DebugDrawDuration, uint8(0));
        return;
    }
    void DrawDebugHitTest(const FVector &inout OriginLocation, const FVector &inout HitPosition, const FVector &inout TestBoxCenter, const FVector &inout TestBoxExtent, const FQuat &inout TestBoxRotation, const FVector &inout TargetLocation, const FBox &inout TargetDebugAABB, const bool bHasTargetDebugAABB, const bool bCanHit) const
    {
        FColor local_1 = FColor(FColor::Red);
        if (bCanHit)
        {
            local_1 = FColor::Green;
        }
        FECSDebugDraw::DrawDebugLine(n"CheckHitTestToTarget", OriginLocation, HitPosition, FColor::Yellow, FColor::Yellow, this.DebugDrawDuration, uint8(0), this.DebugDrawThickness);
        FECSDebugDraw::DrawDebugPoint(n"CheckHitTestToTarget", HitPosition, 12.0f, FColor::Yellow, FColor::Yellow, this.DebugDrawDuration, uint8(0));
        FECSDebugDraw::DrawDebugBox(n"CheckHitTestToTarget", TestBoxCenter, TestBoxExtent, TestBoxRotation, local_1, local_1, this.DebugDrawDuration, uint8(0), this.DebugDrawThickness);
        if (bHasTargetDebugAABB)
        {
            FECSDebugDraw::DrawDebugBox(n"CheckHitTestToTarget", TargetDebugAABB.GetCenter(), TargetDebugAABB.GetExtent(), FQuat::Identity, FColor::Cyan, FColor::Cyan, this.DebugDrawDuration, uint8(0), this.DebugDrawThickness);
        }
        else
        {
            FECSDebugDraw::DrawDebugPoint(n"CheckHitTestToTarget", TargetLocation, 12.0f, FColor::Cyan, FColor::Cyan, this.DebugDrawDuration, uint8(0));
        }
        return;
    }
}

