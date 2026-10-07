
enum EAttachTargetType
{
    InteractTarget,
    LockTarget,
    ESMBB,
}


struct FESMAttachTargetToSourceInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FNetPlayerMask OriginalTargetPredictMask;
    UPROPERTY()
    bool bShouldRestoreTargetPredictMask = false;


}

class UESMAction_AttachTargetToSource : UESMBPBaseSpanAction
{
    UPROPERTY()
    EAttachTargetType AttachTargetType = EAttachTargetType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity AttachTargetEntityBBVar;
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    bool bAttachOffsetBaseOnRootTransform = false;
    UPROPERTY()
    FVector AttachLocationOffset;
    UPROPERTY()
    FRotator AttachRotationOffset;
    UPROPERTY()
    FVector AttachLogicLocationOffsetIfSocketNone;
    UPROPERTY()
    bool bAlignTargetStaticSocket = false;
    UPROPERTY()
    FName TargetStaticSocket;
    UPROPERTY()
    bool bTargetEnterPredict = false;
    UPROPERTY()
    TArray<TSubclassOf<AECSPrefab>> EnterPredictClassFilter;
    UPROPERTY()
    float32 AttachBlendDuration = 0.0f;
    UPROPERTY()
    bool bUseDetachOffset = true;
    UPROPERTY()
    bool bUseRootRotationOffset = false;
    UPROPERTY()
    FVector DetachLocationOffset;
    UPROPERTY()
    FRotator DetachRotationOffset;
    UPROPERTY()
    uint8 ZeroOutRotationAxisWhenDetach = false;
    UPROPERTY()
    bool bRestoreAlignedStaticSocketOnDetach = false;
    UPROPERTY()
    TDataObjectPtr<FAttackData> DetachAttackDataConfig;
    UPROPERTY()
    float32 DetachBlendDuration = 0.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMAttachTargetToSourceInstanceData);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        ::FASCommonUtils::GetUniquePlayerEntity(local_2);
        FECSEntity local_14;
        if (int(this.AttachTargetType) == 0)
        {
            Get local_22;
            const FC_InteractionInfoForESM& local_24 = local_22.opCall();
            if (local_24)
            {
                if (local_24.GetTargetEntity().IsValid())
                {
                    local_14 = local_24.GetTargetEntity();
                }
            }
        }
        else
        {
            if (int(this.AttachTargetType) == 1)
            {
                Get local_28;
                const FC_LockTarget& local_30 = local_28.opCall();
                if (local_30)
                {
                    local_14 = local_30.GetTargetEntity();
                }
            }
            else
            {
                if (int(this.AttachTargetType) == 2)
                {
                    FNameHandle_EntityBBVarEntity local_34;
                    local_34;
                    local_14 = Context.GetEntity().GetBB_Entity(local_34);
                }
            }
        }
        if (local_14.IsValid())
        {
            bool local_79;
            bool local_18;
            local_18 = this.bTargetEnterPredict;
            if (!(local_18))
            {
                local_18 = false;
            }
            else
            {
                local_18 = ECS::GetRuntimeInfo().IsServer;
            }
            if (local_18)
            {
                TSubclassOf<AECSPrefab> local_38;
                Get local_42;
                const FC_PrefabLoaded& local_44 = local_42.opCall();
                if (local_44)
                {
                    local_38 = local_44.PrefabClass.Get();
                }
                if (local_38.IsValid() && this.EnterPredictClassFilter.Contains(local_38))
                {
                    Get local_50;
                    const FC_NetPredict& local_52 = local_50.opCall();
                    if (local_52)
                    {
                        FESMAttachTargetToSourceInstanceData& local_54 = this.ModifyInstanceData(Context);
                        GetDefaulted local_60;
                        local_54.OriginalTargetPredictMask = local_60.opCall().GetMask();
                        local_54.bShouldRestoreTargetPredictMask = true;
                        FECSNetUtils::SetNetPredict(local_14, local_52.GetMask());
                    }
                }
            }
            this.ModifyInstanceData(Context).TargetEntity = local_14;
            FVector local_72 = this.AttachLocationOffset;
            FRotator local_78 = this.AttachRotationOffset;
            local_79 = false;
            if (this.bAlignTargetStaticSocket && !((this.TargetStaticSocket == NAME_None)))
            {
                bool local_82;
                local_82 = false;
                FTransform local_132 = FTransformUtils::GetStaticSocketTransform(local_14, this.TargetStaticSocket, local_82, false, Time.WorldTime);
                if (local_82)
                {
                    FQuat local_156 = local_132.GetRotation().Inverse();
                    FVector local_172 = local_156.RotateVector(local_132.GetLocation().opNeg());
                    GetDefaulted local_166;
                    local_72 = (local_172 * FVector(local_166.opCall().Scale));
                    local_78 = local_156.Rotator();
                    local_79 = true;
                }
                else
                {
                    local_72 = FVector::ZeroVector;
                    local_78 = FRotator::ZeroRotator;
                }
            }
            FVector local_162 = FVector(FVector::ZeroVector);
            if ((this.SocketName == NAME_None))
            {
                local_162 = this.AttachLogicLocationOffsetIfSocketNone;
            }
            ::FAttachmentUtils::EntityAttachToParent(local_14, local_2, Time.WorldTime, this.SocketName, this.bAttachOffsetBaseOnRootTransform, local_72, local_78, int(this.AttachBlendDuration), 0.0f, 0, local_162, this.DetachBlendDuration, local_79 && this.bRestoreAlignedStaticSocketOnDetach);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        FESMAttachTargetToSourceInstanceData& local_4 = this.ModifyInstanceData(Context);
        FECSEntity local_8 = FECSEntity(local_4.TargetEntity);
        if (local_8.IsValid())
        {
            bool local_9;
            if (this.bUseDetachOffset)
            {
                ::FAttachmentUtils::EntityDetach(local_8, Time.WorldTime, this.DetachLocationOffset, this.DetachRotationOffset, this.bUseRootRotationOffset, uint8(this.ZeroOutRotationAxisWhenDetach), false);
            }
            else
            {
                ::FAttachmentUtils::EntityDetachWithoutOffset(local_8, Time.WorldTime, this.bUseRootRotationOffset, uint8(this.ZeroOutRotationAxisWhenDetach));
            }
            if (this.DetachAttackDataConfig)
            {
                TDataObjectPtr<FHitDecalConfig> local_36;
                ::BlueprintFunctions_Common::DamageTarget(FECSEntityAdapter(local_2), local_8, this.DetachAttackDataConfig, EDamageToTargetDirection(0), FAreaStrikeShape(), local_36);
            }
            local_9 = ECS::GetRuntimeInfo().IsServer;
            if (!(local_9))
            {
                local_9 = false;
            }
            else
            {
                local_9 = local_4.bShouldRestoreTargetPredictMask;
            }
            if (local_9)
            {
                FECSNetUtils::SetNetPredict(local_8, local_4.OriginalTargetPredictMask);
                local_4.bShouldRestoreTargetPredictMask = false;
            }
        }
        return;
    }
    FESMAttachTargetToSourceInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMAttachTargetToSourceInstanceData __r;
        return __r;
    }
    FESMAttachTargetToSourceInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMAttachTargetToSourceInstanceData __r;
        return __r;
    }
}

