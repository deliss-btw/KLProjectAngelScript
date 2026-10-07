
enum EPerfectDodgePhantomShape
{
    Box,
    Sphere,
    Capsule,
}


struct FESMPerfectDodgeDummyHitBoxInstanceData
{
    UPROPERTY()
    FECSEntity DodgeDummyEntity;

    FESMPerfectDodgeDummyHitBoxInstanceData()
    {
        return;
    }
}

class UESMAction_PerfectDodgeDummyHitBox : UESMBPBaseSpanAction
{
    UPROPERTY()
    TSubclassOf<APerfectDodgePrefab> PerfectDodgePrefabClass;
    UPROPERTY()
    FVector LocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FRotator RotationOffset = FRotator::ZeroRotator;
    UPROPERTY()
    bool bOverrideDummyShape = false;
    UPROPERTY()
    EPerfectDodgePhantomShape ShapeType = EPerfectDodgePhantomShape(0);
    UPROPERTY()
    FVector BoxHalfExtend = FVector(50.0, 50.0, 50.0);
    UPROPERTY()
    float32 Radius = 50.0f;
    UPROPERTY()
    float32 HalfHeight = 90.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMPerfectDodgeDummyHitBoxInstanceData);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        int local_104 = 0;
        int local_112 = 0;
        int local_114 = 0;
        int local_140 = 0;
        if (!(Context.GetEntity().IsValid()))
        {
            return;
        }
        Has local_6;
        if (Context.GetECSRuntime().IsClient && !(local_6.opCall()))
        {
            return;
        }
        FVector local_32 = local_10.GetPosition();
        FVector local_26 = local_10.GetRotation().RotateVector(this.LocationOffset);
        FRotator local_74 = (FQuat(local_10.GetRotation()) * this.RotationOffset.Quaternion()).Rotator();
        bool local_1 = false;
        FECSEntity local_88 = ::FEntityPoolUtils::PopFromPoolOrSpawnEntity(local_1, EEntityPoolType(5), Context.GetEntity(), this.PerfectDodgePrefabClass.GetDefaultObject());
        if (!(local_88.IsValid()))
        {
            return;
        }
        int local_89 = local_88.GetIdValue();
        local_88.SetEntityName(FName((FString("PerfectDodgeDummyHitBox_") + local_89)));
        FQuat local_60 = local_74.Quaternion();
        local_104.SetOwnerEntity(Context.GetEntity());
        local_104.SetbIsDummy(true);
        local_104.SetHitCount(0);
        local_112.SetDummyEntity(local_88);
        local_112.SetbIsDummy(false);
        local_112.SetHitCount(0);
        if (this.bOverrideDummyShape)
        {
            local_114.SetShape(this.BuildShapeInfo());
        }
        Get local_130;
        if (local_130.opCall())
        {
        }
        local_140.SetOwnerEntity(Context.GetEntity());
        this.ModifyInstanceData(Context).DodgeDummyEntity = local_88;
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_10;
        FECSEntity local_4;
        if (local_4.IsValid())
        {
            local_10.opCall();
            Remove local_14;
            local_14.opCall();
            ::FASCommonUtils::DestroyEntity(local_4);
        }
        local_10.opCall();
        return;
    }
    FESMPerfectDodgeDummyHitBoxInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMPerfectDodgeDummyHitBoxInstanceData __r;
        return __r;
    }
    FESMPerfectDodgeDummyHitBoxInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMPerfectDodgeDummyHitBoxInstanceData __r;
        return __r;
    }
    FCollisionShapeInfo BuildShapeInfo() const
    {
        FCollisionShapeInfo local_7;
        switch (int(this.ShapeType))
        {
        case 0:
        {
            local_7.SetShapeType(EECSCollisionShapeType(3));
            local_7.SetHalfExtend(FVector3f(this.BoxHalfExtend));
            break;
        }
        case 1:
        {
            local_7.SetShapeType(EECSCollisionShapeType(1));
            local_7.SetRadius(this.Radius);
            break;
        }
        case 2:
        {
            local_7.SetShapeType(EECSCollisionShapeType(2));
            local_7.SetRadius(this.Radius);
            local_7.SetHalfHeight(this.HalfHeight);
            break;
        }
        }
        return local_7;
    }
}

