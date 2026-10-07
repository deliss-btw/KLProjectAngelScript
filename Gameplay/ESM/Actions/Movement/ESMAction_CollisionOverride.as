

class UESMAction_CollisionOverride : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FCollisionShapeInfo OverrideShapeInfo;
    UPROPERTY()
    bool bAdditive = false;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.PushOrUpdateModify(Context.GetEntity(), this.GetDataPathName(), this.OverrideShapeInfo, this.bAdditive);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
            local_6.PopModify(Context.GetEntity(), this.GetDataPathName());
            if (local_6.IsEmpty())
            {
                Remove local_14;
                local_14.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Gizmos_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        FColor local_1 = FColor(FColor::Green);
        bool local_9 = !((((FFPTime(Time.ActionDuration).opCmp(-1.0) < 0) || ((FFPTime(Time.ActionTime).opCmp(Time.ActionDuration) <= 0))) && ((FFPTime(Time.ActionTime).opCmp(0.0) >= 0))));
        int local_11 = local_9 ? 40 : 128;
        GetDefaulted local_40;
        FTransform local_64 = local_40.opCall().ToFTransform();
        if (this.bAdditive == false)
        {
            switch (int(this.OverrideShapeInfo.GetShapeType()))
            {
            case 2:
            {
                DebugDraw::DrawDebugCapsule(Context.GetWorld(), local_64.GetLocation(), this.OverrideShapeInfo.GetHalfHeight(), this.OverrideShapeInfo.GetRadius(), local_64.GetRotation(), FColor::Green, true, -1.0f, uint8(0), 0.0f);
                break;
            }
            case 3:
            {
                DebugDraw::DrawDebugBox(Context.GetWorld(), local_64.GetLocation(), FVector(this.OverrideShapeInfo.GetHalfExtend()), local_64.GetRotation(), FColor::Green, true, -1.0f, uint8(0), 0.0f);
                break;
            }
            case 1:
            {
                DebugDraw::DrawDebugSphere(Context.GetWorld(), local_64.GetLocation(), this.OverrideShapeInfo.GetRadius(), 32, FColor::Green, true, -1.0f, uint8(0), 0.0f);
                break;
            }
            }
        }
        return;
    }
}

class UESMAction_CollisionExtra : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    TArray<FExtraCollisionShape> Shapes;

    UESMAction_CollisionExtra()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_7 = 0;
        for (; local_7 < this.Shapes.Num(); ++local_7)
        {
            if (!(this.Shapes[local_7].IsValid()))
            {
                continue;
            }
            FName local_14 = this.GetIdentifier(local_7);
            local_6.PushExtraShape(local_14, this.Shapes[local_7]);
            if ((!((FName(this.Shapes[local_7].GetCollisionHitBBVar().Name) == NAME_None))))
            {
                Context.GetEntity().SetBB_Bool(this.Shapes[local_7].GetCollisionHitBBVar(), false);
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
            int local_8 = 0;
            for (; local_8 < this.Shapes.Num(); ++local_8)
            {
                if (!(this.Shapes[local_8].IsValid()))
                {
                    continue;
                }
                bool local_7 = local_6.PopExtraShape(this.GetIdentifier(local_8));
            }
            if (local_6.IsEmpty())
            {
                Remove local_20;
                local_20.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Gizmos_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        FColor local_1 = FColor(FColor::Green);
        bool local_9 = !((((FFPTime(Time.ActionDuration).opCmp(-1.0) < 0) || ((FFPTime(Time.ActionTime).opCmp(Time.ActionDuration) <= 0))) && ((FFPTime(Time.ActionTime).opCmp(0.0) >= 0))));
        int local_11 = local_9 ? 40 : 128;
        GetDefaulted local_40;
        FTransform local_64 = local_40.opCall().ToFTransform();
        int local_65 = 0;
        for (; local_65 < this.Shapes.Num(); ++local_65)
        {
            FExtraCollisionShape& local_68 = this.Shapes[local_65];
            FCollisionShapeInfo local_79;
            if (local_68.GetbUseCustomShape())
            {
                local_79 = local_68.GetShape();
            }
            else
            {
                GetDefaulted local_72;
                local_79 = local_72.opCall().GetShape();
            }
            FVector local_104 = local_64.TransformPosition(FVector(local_68.GetPosOffset()));
            FQuat local_136 = local_64.TransformRotation(FRotator(local_68.GetRotOffset()).Quaternion());
            switch (int(local_79.GetShapeType()))
            {
            case 2:
            {
                DebugDraw::DrawDebugCapsule(Context.GetWorld(), local_104, local_79.GetHalfHeight(), local_79.GetRadius(), local_136, FColor::Green, true, -1.0f, uint8(0), 0.0f);
                break;
            }
            case 3:
            {
                DebugDraw::DrawDebugBox(Context.GetWorld(), local_104, FVector(local_79.GetHalfExtend()), local_136, FColor::Green, true, -1.0f, uint8(0), 0.0f);
                break;
            }
            case 1:
            {
                DebugDraw::DrawDebugSphere(Context.GetWorld(), local_104, local_79.GetRadius(), 32, FColor::Green, true, -1.0f, uint8(0), 0.0f);
                break;
            }
            }
        }
        return;
    }
    FName GetIdentifier(const int Index) const
    {
        FName local_2 = this.GetDataPathName();
        return FName();
    }
}

