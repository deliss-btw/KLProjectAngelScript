

struct FESMCharacterFollowViewInstanceData
{
    UPROPERTY()
    float YawVelocity = 0.0;


}

struct FESMCharacterFollowViewViewInstanceData
{
    UPROPERTY()
    float OffsetYaw = 0.0;
    UPROPERTY()
    float YawVelocity = 0.0;


}

class UESMAction_CharacterFollowView : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 UndampedFrequency = 3.1415927f;
    UPROPERTY()
    float32 DampingRatio = 1.0f;
    UPROPERTY()
    FVector2D DeviationRange = FVector2D(-60.0, 60.0);


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCharacterFollowViewInstanceData);
    }
    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCharacterFollowViewViewInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(3);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        FESMCharacterFollowViewInstanceData& local_10 = this.ModifyInstanceData(Context);
        FRotator local_22 = local_6.GetRotation().Rotator();
        float local_24 = FCharacterInputUtils::GetViewInputDir(Context.GetEntity(), Time.WorldTime).Yaw;
        float local_30 = FMath::FindDeltaAngleDegrees(local_24, local_22.Yaw);
        float local_32 = local_10.YawVelocity;
        float local_28 = Time.ActionDeltaTime.ToSeconds();
        FMath::SpringDamper(local_30, local_32, 0.0, 0.0, float32(local_28), this.UndampedFrequency, this.DampingRatio);
        local_10.YawVelocity = local_32;
        float local_26 = this.DeviationRange.Y;
        local_26 = local_24 + FMath::Clamp(local_30, this.DeviationRange.X, local_26);
        local_22.Yaw = FRotator::NormalizeAxis(local_26);
        Context.GetEntity().MoveRotation(local_22.Quaternion(), FFPTime(-1));
        Modify local_56;
        FC_CharacterMovementControl& local_58 = local_56.opCall();
        if (local_58)
        {
            local_58.SetDesiredRotation(local_22);
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        const AActor local_14;
        FECSEntity local_4 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (!((local_4 == Context.GetEntity())))
        {
            return;
        }
        local_14 = FECSViewDataUtils::GetActor(Context.GetEntity());
        if ((!((local_14 != nullptr))))
        {
            return;
        }
        FECSActorProxy local_18 = FECSViewDataUtils::ModifyActor(Context.GetEntity());
        if (!(local_18))
        {
            return;
        }
        FESMCharacterFollowViewViewInstanceData& local_24 = this.ModifyViewInstanceData(Context);
        FCS_TPCameraParam& local_26 = FCameraUtils::GetCameraParam(local_4);
        float local_28 = local_24.OffsetYaw;
        float local_32 = local_24.YawVelocity;
        float local_30 = Context.GetECSRuntime().DeltaTime.ToSeconds();
        float32 local_36 = float32(local_30);
        float32 local_33 = -local_26.DirVelocity.Yaw;
        FMath::SpringDamper(local_28, local_32, 0.0, local_33, local_36, this.UndampedFrequency, this.DampingRatio);
        local_24.OffsetYaw = FMath::Clamp(local_28, this.DeviationRange.X, this.DeviationRange.Y);
        local_24.YawVelocity = local_32;
        FRotator local_52 = local_14.GetActorRotation();
        local_52.Yaw = (local_26.FinalDir.Yaw + local_24.OffsetYaw);
        local_18.ModifyTransform().SetRotation(local_52);
        return;
    }
    FESMCharacterFollowViewInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterFollowViewInstanceData __r;
        return __r;
    }
    FESMCharacterFollowViewInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterFollowViewInstanceData __r;
        return __r;
    }
    const FESMCharacterFollowViewViewInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMCharacterFollowViewViewInstanceData __r;
        return __r;
    }
    FESMCharacterFollowViewViewInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMCharacterFollowViewViewInstanceData __r;
        return __r;
    }
}

