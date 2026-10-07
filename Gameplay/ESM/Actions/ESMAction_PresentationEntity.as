
enum ESpawnPresentationEntityPosType
{
    Socket,
    ColliderBottom,
    ColliderCenter,
    ColliderTop,
}

enum ESpawnPresentationEntityRotType
{
    SocketRotation,
    EntityRotation,
    WorldSpace,
}


struct FSpawnPresentationEntityActionInstanceData
{
    UPROPERTY()
    FECSEntityId PresentationEntity;

    FSpawnPresentationEntityActionInstanceData()
    {
        return;
    }
}

class UESMAction_SpawnPresentationEntity : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    TSoftClassPtr<APresentationOnlyPrefab> EntityPrefab;
    UPROPERTY()
    bool bControlEntityLifeTimeByAction = false;
    UPROPERTY()
    ESpawnPresentationEntityPosType SpawnPositionType;
    UPROPERTY()
    FName SocketName = NAME_None;
    UPROPERTY()
    FVector PositionOffset;
    UPROPERTY()
    ESpawnPresentationEntityRotType SpawnRotationType;
    UPROPERTY()
    FRotator3f RotationOffset;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FSpawnPresentationEntityActionInstanceData);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("Spawn: ").Append(this.EntityPrefab.GetAssetName());
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bControlEntityLifeTimeByAction) == !(false));
        return local_1;
    }
    UFUNCTION()
    bool GetDisableInstanceData_Implementation() const
    {
        bool local_1 = (!(this.bControlEntityLifeTimeByAction) == !(false));
        return local_1;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_22 = 0;
        int local_46 = 0;
        int local_72 = 0;
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        FFPTime local_4 = FFPTime();
        FFPTime local_4_2 = -1;
        if (this.bControlEntityLifeTimeByAction)
        {
            if (FFPTime(Time.ActionDuration).opCmp(0.0) <= 0)
            {
            }
            else
            {
                float32 local_11 = Time.PlaySpeed;
            }
            local_4_2 = FFPTime((Time.ActionDuration.ToSeconds() / Time.PlaySpeed));
        }
        local_22.GetRotation().Rotator();
        TSubclassOf<AECSPrefab> local_34 = this.EntityPrefab.Get();
        local_46.SetSpawnTime(Time.WorldTime);
        if (local_4_2.opCmp(0.0) > 0)
        {
            local_46.SetLifeDuration(local_4_2);
        }
        local_72.SetParentEntity(Context.GetEntity());
        local_72.SetSpawnPositionType(this.SpawnPositionType);
        local_72.SetPositionOffset(this.PositionOffset);
        local_72.SetSocketName(this.SocketName);
        local_72.SetSpawnRotationType(this.SpawnRotationType);
        local_72.SetRotationOffset(this.RotationOffset);
        if (this.bControlEntityLifeTimeByAction)
        {
            FSpawnPresentationEntityActionInstanceData& local_76 = this.ModifyInstanceData(Context);
            FECSEntity local_40;
            local_76.PresentationEntity = local_40.GetId();
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        if (this.bControlEntityLifeTimeByAction)
        {
            const FSpawnPresentationEntityActionInstanceData& local_4;
            if (FECSEntity(local_4.PresentationEntity))
            {
                Modify local_18;
                FC_LifeTime& local_14 = local_18.opCall();
                if (local_14)
                {
                    FFPTime local_34 = (FFPTime(Time.WorldTime) + FFPTime(((Time.ActionDuration.ToSeconds() / Time.PlaySpeed) * (1.0 - (Time.ActionTime.ToSeconds() / Time.ActionDuration.ToSeconds())))));
                    FFPTime local_32_2 = (local_34 - local_14.GetSpawnTime());
                    local_14.SetLifeDuration(local_32_2);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(Context.GetECSRuntime().IsServer))
        {
            return;
        }
        if (this.bControlEntityLifeTimeByAction == false)
        {
            return;
        }
        FECSEntity local_10;
        if (local_10.IsValid())
        {
            Modify local_14;
            FC_LifeTime& local_16 = local_14.opCall();
            if (local_16)
            {
                FFPTime local_32 = (FFPTime(Time.WorldTime) + FFPTime(((Time.ActionDuration.ToSeconds() / Time.PlaySpeed) * (1.0 - (Time.ActionTime.ToSeconds() / Time.ActionDuration.ToSeconds())))));
                FFPTime local_30_2 = (local_32 - local_16.GetSpawnTime());
                local_16.SetLifeDuration(local_30_2);
            }
        }
        return;
    }
    UFUNCTION()
    void Preview_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        return;
    }
    UFUNCTION()
    void PreviewClear_Implementation(const FESMPreviewContext &inout Context)
    {
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
    FSpawnPresentationEntityActionInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FSpawnPresentationEntityActionInstanceData __r;
        return __r;
    }
    FSpawnPresentationEntityActionInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FSpawnPresentationEntityActionInstanceData __r;
        return __r;
    }
}

